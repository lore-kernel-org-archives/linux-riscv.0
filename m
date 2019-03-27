Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0E9C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 11:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E05206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 11:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rW9TcwJ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="leBDzQpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3E05206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oOD1I8LbIkYoACQTPGtG1m9QsPhcUPZCFksLTDBJWk=; b=rW9TcwJ+A6D1ZG
	e/M8OCQsUa9NsHka2S/NpV/UrQoLFkW3ni7r9lXJMg866O1GIpn2Y4iBHlIO6Hjx+jH2oU5nATL92
	VaZ1u62HQ8omx9NZVICrjwMg47liV8dUNg6aBsiwThhpaIMB2lIYsDJQ50EAbSZUj2TK+2uuRBOMV
	2SQ7EREEJLndezw15hYG/TrB3wIqtHD0JmjbHR5frOwRBEEyq1kv+QUYM/d+lInHfnBYRtGMifM0+
	7EtNxmNFqffMJ+rld6Nf01BIsAWR8FRYEn98NK7I9VUwQVIZC5xgRCFYu1Wb67SXP3CPC9y48MdnM
	1/VgW4xT8YEM6DL7zxNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h96wx-0005IF-1B; Wed, 27 Mar 2019 11:42:31 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h96wt-0005HL-Pq
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 11:42:29 +0000
Received: by mail-wm1-x343.google.com with SMTP id y197so16420265wmd.0
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YNNdbSS+C3KJAabfM9Oo1cBSnZKSRht7rzVdKUeZ6F0=;
 b=leBDzQpK8dYKG+NM4xP5w+oTyJYG5WWEhS5kvnN0UcM+D2SuFxRxv46g5EZ9QtRIfk
 GgEHV3D98wAbU87hp1GW8xVKm0QvMQ1rtGLfZ3lXPC2JTvGhoT7fVyPWLwHbKrPaLk3g
 uq+v84/6VbwUv/jTwx64qtPTGdAyvhCpIhRE3p+pfODBkxD1IWz3nmP7S4oaY5DseX0h
 iQaViAAUzSro5l9MQwuDBnrs9RqcmdhJW59Vneo82bq8QltnbAYEqBoEKs2tLMx3ElDs
 CZaTkCg6Egobrk3UkSbPLD3bqjfdcqiEv82RZAwacQLNBWeodPOpVr2bQ/AkkOaiyysY
 bceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YNNdbSS+C3KJAabfM9Oo1cBSnZKSRht7rzVdKUeZ6F0=;
 b=YKBDKYr2bHVE3SuXkC4Nia3SwBEyMZ0gPaIu1706CTIJ/JKDOeFADMm4biGrfqlf9g
 oITDFMBWbgqmSQlpk/51BASO0MGmZjaAYxfa/kI5WbrVIwlEIk9+MozjdCqrBty5MKY4
 91+9FE8PVEYrNJhxFVhOoqo8v7yAJRTDraaR7s01gzEf/Hqv/NdLUlxNqrqSlqrOP2w2
 B2aVx0aSAGjW8N0O3euax3xPccZpJBa3wMCcPUN12qpTi1yURRiimqFkvZLDu7r63pOP
 2YT+wLo9ViEayTkRR2StqyR8kRKiZsewOOU79kAwWdAPt8MEZKcoZ7rhbjw//52EB3dh
 C7KQ==
X-Gm-Message-State: APjAAAURSoE1T22Q6WfGzOrIJCJrrOE7L7XStK7L2CfVXuoKUZHZNkjh
 MQNpErn5LVHyNzi0LV7pvEydNd6LN6RRMsBOyULkFGb7eiw=
X-Google-Smtp-Source: APXvYqxwNOCUbbIVKFyWW/n2pea8HQ53zOVo5USOjGCNbbaJPHEwdBuNU3w9Eh2giuxdKIkODLu82TRP2KHZoVzAghg=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr9709637wmg.132.1553686944711; 
 Wed, 27 Mar 2019 04:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190327100201.32220-1-anup.patel@wdc.com>
 <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
In-Reply-To: <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Mar 2019 17:12:13 +0530
Message-ID: <CAAhSdy1+rc9ge02uqNvse5Z6XmDxsRH0G=5GnMsh+6m1LMLFYg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Implement ASID allocator
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_044227_973858_1FDD4146 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 4:57 PM Gary Guo <gary@garyguo.net> wrote:
>
> Hi Anup,
>
> This won't work in an actual hardware with ASID support. There're more

Can you elaborate why?

This implementation is based on Linux ARM64 ASID allocator which is
tested for large number of CPUs on real HW.

> interactions with TLB flushes that need to be considered. You won't see

Yap, already considered. Please point me to unhandled case.

> this on both QEMU and SiFive board, as QEMU does not have ASID, so it
> pretends that ASID is supported by just flushing its TLB everytime you

Nope, it does not. It detects whether ASID is supported or not. If supported
it will also figure-out number of ASID bits supported by HW.

SiFive board does not have ASID bits so this implementation successfully
detects that number of ASID bits are 0 and fallbacks to original way of
local TLB flushes.

> change sptbr. I suspect the performance gain you see is just due to
> saved TLB flush as TLB flush is super expensive in QEMU (all translation
> block jumps need to be cleared).

Yes, performance gain is due to saved TLB flushes.

On HW which supports ASID bits, we will see more performance
improvements.

>
> I have my version here https://github.com/nbdd0121/linux/tree/asid. I
> haven't done code cleanups yet, but this version has correctness of its
> ASID code tested on our TLB simulator tool (which unfortunately I can't
> share right now as it involves with unpublished works).

Except few minor differences. You version of ASID allocator is same as
mine. In fact there are lot of similar code framgements in your version
compared to Linux ARM64 as well. I am sure this patch will work for you.

>
> In fact my submit my previous patch series exactly as the basis of this
> patch.

This patch is based your patch series so I suggest you take this patch
and try it on your simulator.

Suggestions and improvements to this patch are welcomed.

I would be happy if you can assist me to try on your HW.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
