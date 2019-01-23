Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD8FC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:41:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8968D21855
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DVi5NiAY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="T6rvqGMn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8968D21855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-ID:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C2P/D95h4/MXjUcJzeo6ABmVONNlHXNTCdSEs6Xx2cg=; b=DVi5NiAYKSzawN
	6GsPqzJ2sSfZ/oKjxDL0Z/kJe2Nchjpz6Mz2ipLgTM9EYXAZoRbBIf8unWyS/LQ9LY5Zj+9BC1aac
	KZkHTJJeMPDiuv282zTfV4+4WciclFTXlr8OSfMN09ztYpHirFtvwmLAr/+8Jbv9N6mzEcKNkW3oI
	iHqBaLhEzgNCO0FDAadv/ERtJKr7DcGwlEq4QvkpPEoJJfPNwbjc3/Uq3xS0F+JDYnvCERjFo420b
	nuk0cY5eGtLu4g2l1Gxwo4jPuECvdTc7qg560MqoRlv1vabubN8dX1AjhI28wKNBpxB7QVPFOvfzr
	lgdd82UwTRUQoKxdGTuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmRDX-0008I0-3Y; Wed, 23 Jan 2019 22:41:55 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmOd1-0006JH-Nc
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 19:56:05 +0000
Received: by mail-pg1-x543.google.com with SMTP id y4so1527253pgc.12
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 11:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:message-id:cc:from:to;
 bh=LJ25pbB87++OkAXSaku95tGIzIAJeOMtF0CaNNZmGGQ=;
 b=T6rvqGMnlGBV5rFuIGB47rTzaWPxdTdImm/2fq/e/eEuJ/wQGZwyqZcsRrFJWaPhKT
 GeYJAypLaj74UWlD/Nsg62qcf+Jg9seCOEXRYyqeArvWHyzHsSIHJeGMsCUUSllbtcFQ
 d6D36boxvl0Rg3IOTM7vJGsskxZwDiF1xKkh+Ja8/4RGSWFaFkSZHRq3QiYUnEQJLBe6
 Ck5aBnC+i718fM5S0lDiaWsXwBfbwYXf17EKfNc8IlX80jL7c95xap4Ec8aMDvffYN0I
 NOcTSwRL56J7mBeATAHtCBDN5plHbl32DpUIAlbvQ/YAPmHZ3FuZdeYYcuN+jUvwJFkK
 bSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:message-id:cc:from:to;
 bh=LJ25pbB87++OkAXSaku95tGIzIAJeOMtF0CaNNZmGGQ=;
 b=c5U9AlyINz28R8Rm9/JsD86mQZLoDlm3tqUyk0jpEvyxg+8w7UHRIqT+CjwoQ0yE6i
 ohy/GGu9m1ZjH4pNawP540OoyMo+51N73kMiCNxuEz+i+e7LRHPJAXUB/8CKUgnTeiT3
 scpDK5EOI0qt7xMEC7mSjUuBiyyR1sd23u3RxWGHcPXjobjfEhbcvNKUsRYX5sX/h1c2
 Ge21Gjo5MXxJuZDZXLSJpT2iZUkqHAY2rGUwE9R7ZmiP+FfsjFlbWydoD7lSaH5GTVI8
 OXr4UTHmwkK+6+VQbg4tvHi2bxAeXgU4FffGIlAqJq3yQuy07iK5U47abuJXdL7VWvkG
 QwnA==
X-Gm-Message-State: AJcUukejTOmF8B9f/njLhM73rrivoieBtaVrobeIkmcOL8pQf2v8Q2EI
 YjubeUXTMQas37VAyr94zosOeg==
X-Google-Smtp-Source: ALg8bN71dKnL3Omroe5ymhsvwIjBN+lGADbEPWZ0qzBttg+gL8l1tnlWJuFwKi2IK+zYkm+C2ThKmw==
X-Received: by 2002:a62:1e45:: with SMTP id e66mr3352108pfe.152.1548273362220; 
 Wed, 23 Jan 2019 11:56:02 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c13sm39983597pfe.93.2019.01.23.11.56.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 11:56:01 -0800 (PST)
Date: Wed, 23 Jan 2019 11:56:01 -0800 (PST)
X-Google-Original-Date: Wed, 23 Jan 2019 11:49:25 PST (-0800)
Subject: Re: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
Message-ID: <mhng-96f28491-e123-459a-b09c-88732de06bbf@palmer-si-x1c4>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_115603_844125_8381FDED 
X-CRM114-Status: GOOD (  10.97  )
X-Mailman-Approved-At: Wed, 23 Jan 2019 14:41:50 -0800
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
Cc: robh@kernel.org, dalias@libc.org, ysato@users.sourceforge.jp,
 dan.j.williams@intel.com, linux-kernel@vger.kernel.org, sbates@raithlin.com,
 Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 09:30:44 PST (-0800), logang@deltatee.com wrote:
>
>
> On 2019-01-15 6:58 a.m., Christoph Hellwig wrote:
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Probably no need to keep this in a series with the RISC-V code, this can
>> be queued up by the sh folks independently.
>
> Oh, yeah, sorry, I obviously didn't pay enough attention to this when I
> resent it. I sent the similar Arm changes to the appropriate list and,
> yes, the sh ones should go to that maintainer.
>
> @Palmer: if you can just look at taking the second patch, I'll resubmit
> the first one to the appropriate list.

Works for me.  I'll queue the second patch into my staging branch, targeted for
the next merge window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
