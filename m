Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C148C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0BD020863
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7eJaSAI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WDaBvumW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0BD020863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FlINQ+7DhbVs37qpR/gB8MGEGvj0Ekt+V6aJqlr0eAA=; b=N7eJaSAI7OM6l8JEQ2BvGRAaO
	FQkd8PBFQgQRvwIFRLr5LLHuICeL6WHZk2dFzr45uYzCoSI/pMOLlCfO3GpScPdQLbeE4NzoZZn3A
	N5h1bhlitnyWHCdNu2YtArsDGBFJ+llzZnznOPndRiJiQmPwDpc51nX7J0XTXzCucgDxjBh29Hcxb
	gsTkvrxmel2cmlMYbErjr+QU2Gg6MjIf2ELoh8QHc619ax+fdzcY7g2YVTGkxVmWi9tYSyiHn0hCp
	9giFgG4IzZwUscYmSDeogdZQM4dPT9UIFwxQRYpvHnYWCC7tTXzQTlCIvxrpZF+ll4+p/hPbA7eKa
	Tmr8hdBhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsAE7-0000oa-Dr; Fri, 08 Feb 2019 17:46:11 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAE4-0000oB-0S
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 17:46:09 +0000
Received: by mail-pf1-x444.google.com with SMTP id i12so1993251pfo.7
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/mwqkvyJN3cM7KLVEqVSW6FCo2e4yFrLSSpdYK/R9+E=;
 b=WDaBvumWEbPwNUdXxT4rEeN1Mxj+OaxLWD1N8MDbW+GfGt6UUuBbHFnCRJDH0kad7z
 dVAPYyfPMVdMLyqu0lSTmnjat2rtW5iilBGHXnjsdOpVwPSnUJcyUHg20WF+688yz5zD
 rvzZyxVql82aeRw5qXm/HMrCseFhNg2Gpd4YjUqcW3mmVbanm70Zfe7pa73pwCoK5KYX
 KsPuyzxU/VMb3KMlID84U5ak0LgUq1Xrs3uBws39Elb1yxM7zMDN7bfYyblNO+e8vbpq
 mla4GDEe/cj1wQ+J44IXdzKjeu7k13QxSJJCcgC4v+6IekGX1IDm9lszLtg6LpOhGnl0
 5PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/mwqkvyJN3cM7KLVEqVSW6FCo2e4yFrLSSpdYK/R9+E=;
 b=eZAd7j0jfk73NP1PIlvEQcPLplxKDLLO+v5sdqsJh1E1MCPLVXFac9ClPk8abU6sOX
 rfn9yLjY+KA5VDlVsY1rSqAle82psz18VPmPXDLYxel81SmBdvYbRgerB94hODzdbJN3
 wUrJpZoKZyuvfs5k3uUuC9ye8rul6ni9pHIgU9ZPDjwoKO+uYGwRyznhv3NX4EBzMRUM
 2Xi2vX0ULXlXYrG79bg39yiFm75H4CZPrpwo0+tStXHzVVOewxULqGnIzDY9fKfPJplJ
 HDTzsRlhXxW6caCFQW/4gmK2Y6asRcU5HjOzdlhzOJfpuQ2tyimrxCjrAERbWqACqJVx
 rWLg==
X-Gm-Message-State: AHQUAuatQt2lf6LX65pG4Q+dWz/QykQ0403JUDgtJ0yxlnoCItInqhx0
 oNoF9+apHBFj7ecCeeT4E87qfw==
X-Google-Smtp-Source: AHgI3IZ36Ngfge+kIeI1M6R/ESYsGIv1Y0KldpHlya42WDcjlOgSotEkmOEMSpme9xfaGoJ2DtOmtw==
X-Received: by 2002:a62:2e46:: with SMTP id u67mr22952024pfu.3.1549647967300; 
 Fri, 08 Feb 2019 09:46:07 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n6sm2838964pgv.86.2019.02.08.09.46.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Feb 2019 09:46:06 -0800 (PST)
Date: Fri, 08 Feb 2019 09:46:06 -0800 (PST)
X-Google-Original-Date: Fri, 08 Feb 2019 09:45:52 PST (-0800)
Subject: Re: [PATCH] riscv: Add pte bit to distinguish swap from invalid
In-Reply-To: <CAEn-LTqAZVzhcfvW7aB=JoUvdmf1pZ=fsuD1qsDdFSqqY2Fu6g@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-06b75f17-dc99-4c51-b59e-68d3dfb302cf@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_094608_061372_9C4A383D 
X-CRM114-Status: GOOD (  13.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, sorear2@gmail.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, schwab@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 08 Feb 2019 09:36:19 PST (-0800), david.abdurachmanov@gmail.com wrote:
> Palmer, could you review/consider this patch for next rcX or next merge window?

I'll include this in next week's PR.

>
> david
>
> On Mon, Dec 17, 2018 at 7:37 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Sun, Dec 16, 2018 at 01:03:36PM -0500, Stefan O'Rear wrote:
>> > Previously, invalid PTEs and swap PTEs had the same binary
>> > representation, causing errors when attempting to unmap PROT_NONE
>> > mappings, including implicit unmap on exit.
>> >
>> > Typical error:
>> >
>> > swap_info_get: Bad swap file entry 40000000007a9879
>> > BUG: Bad page map in process a.out  pte:3d4c3cc0 pmd:3e521401
>> >
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
>>
>> Looks fine:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
