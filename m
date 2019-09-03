Return-Path: <SRS0=vaJP=W6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E0DC3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 18:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50FA2168B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 18:49:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbYQJUKA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50FA2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Ltd4f+L7nOtZIZxUX1eM5qwDq8eaOiffLNKupTFcXt8=; b=GbYQJUKAtWVId0l6mU/hZYpFG
	UnKFW7BFLs6iEVMrmTXpMe2HeTvWdIapr2PfhUStyjewrvTscGaVarqManWxbJ4tpfJiEpqYGRO0W
	fGVCwcH0eifvRsEpeMBVYJhDQHZHh/tCRqoKvG4Hq6CBvWts4u2CoS4thUf0OVpqKbIAFttbL2zze
	4vZYCoQxu/19Jrlk8dC9pKt4snaXOXSPYCO5Fv6/N1s5pX70ZTKPz+ITl2RDC2ElEuwuEjNGRHv9e
	AVgHw6z268Tl+Lav59N5Tqjvd+UUPWIzApUf0LWIcDAuk874CHKX98vBcTP5a+iCfakwyvG9yl8eb
	WaF448L5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5DrM-0003tj-1h; Tue, 03 Sep 2019 18:48:56 +0000
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5DrK-0003tP-01
 for linux-riscv@lists.infradead.org; Tue, 03 Sep 2019 18:48:55 +0000
Received: by mail-pl1-f194.google.com with SMTP id 4so8259730pld.10
 for <linux-riscv@lists.infradead.org>; Tue, 03 Sep 2019 11:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pVDfotd4+mwULNcYBfwZPb3QNstzNQ7Yt+TJQtciNHA=;
 b=bbhEjUaB4J5d1efL0HHEkhuCrbShDidkf97yfZanfp6seiHwEd8WmaqfJWTX1EqMl3
 Aus0RbGbOzEmYiVQ1JUZi5Hk4jYyWKBT3h1q5tMHWzP4T8BE4NeKQVbp1xa85c8N6GJB
 Zj7VECeE2yOYC++fx7bs04EYz8tOn+atm5SUV03Eg0raA2B8YjhXOJwEW8RiYl+evdEL
 TmkpfXya3XsCnL8vxegeR5FA27uMEOBYCohISLUACNFDOpN0/B1rgH7Ll59MDoq3kitm
 iIhCEGGKwOk51oRheUHDSlfcTGmLU45ex8c344jAQxd8hHsHCw/l+n2HNHC0bPRGkvxP
 CEew==
X-Gm-Message-State: APjAAAXCYK+uGn7Z94RtfKCvsWl+uKc/6P4E8FONPYzfOwi2Jgx8QLyk
 c5pIRHyssmNIx8A+OuKl1Vtnsg==
X-Google-Smtp-Source: APXvYqwtoRP54sGdEy4OpTdOgUHkbVNMvMEjJcBT5t9TYgg5UIoQdGr9aaZjO0QECWhIJF3SEFni1A==
X-Received: by 2002:a17:902:b604:: with SMTP id
 b4mr4432102pls.94.1567536533041; 
 Tue, 03 Sep 2019 11:48:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r187sm11696625pfc.105.2019.09.03.11.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 11:48:52 -0700 (PDT)
Date: Tue, 03 Sep 2019 11:48:52 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Sep 2019 11:48:19 PDT (-0700)
Subject: Re: [PATCH 08/15] riscv: provide native clint access for M-mode
In-Reply-To: <20190828061146.GA21670@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-e03fb9a6-73ee-437e-aee1-e30427f5d644@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_114854_035079_F6AA5155 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 27 Aug 2019 23:11:46 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Aug 27, 2019 at 04:37:16PM -0700, Palmer Dabbelt wrote:
>> clint0 would be version 0 of the clint, with is the core-local interrupt
>> controller in rocket chip.  It should be "sifive,clint-1.0.0", not
>> "riscv,clint0", as it's a SiFive widget.  Unfortunately there are a lot of
>> legacy device trees floating around, but I'm only considering what's been
>> upstream to be actually part of the spec.
>>
>> In this case the code should match on a "sifive,clint-1.0.0", and the
>> device trees should be fixed up to match.  We match on "riscv,plic0" for
>> legacy systems, and I guess it makes sense to do something similar here.
>
> IFF we decided to change it I'd rather separate DT noes for the ipi
> bank vs timecmp register vs timeval to support variable layouts.  The
> downside is that we can't just boot on unmodified upstream qemu, which
> has used the "riscv,clint0" for years.

Like I alluded to above, matching on "riscv,clint0" seems reasonable to me as 
it's a defacto standard -- we'll just have to make sure that if we ever end up 
with a RISC-V CLINT that the DT entry is something else.

As far as splitting the memory maps goes, I don't have a strong opinion but it 
seems like that'll introduce more complexity than it's worth.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
