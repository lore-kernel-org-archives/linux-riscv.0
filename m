Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482FCC10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186BF2146F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WGDdWVgY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="p5OFWqj2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186BF2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmTWWlArpdrqC91Vk3KA1fhf7JnnUmBu4bm5IUE39qQ=; b=WGDdWVgYB4d4oQ
	AY/sQpolRRUtqF5jGNLJwWgCrDbBZYsuc8HPJwbEpZh/GOP2bkQqE9rRXKJsTZqInK2RC9nxY4fAo
	wqs2CCk6m6KhyNza7IXLR/MiCTxNxeZNzt/CgOjsG0puAVRz0aTljShJEcF/jHXQVRee2o9gtnvvD
	AbjfZXxBJVcpJaKgYeMCKM7cEBjKTPOJm7y3UYzJ81WszxUF3ISnN71ymZD953ZlKKxndlVHfzJ+7
	d9pwy6ub7UZDD7DeF9bbZtf9HqISwpnK7OWlOWfWehiCzcM3IsFFg7iGoz+us6IRT7kXc4e4oF8Zc
	Mfs7/4BP896a3douccBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h99Gb-0003Dt-5U; Wed, 27 Mar 2019 14:10:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h99GX-0003DW-UU
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 14:10:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id a184so191858wma.2
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WjAPIoM35iEoblHbjRgWliMF0RRAsRtMAenOonc8eiQ=;
 b=p5OFWqj22LSYm0Sw0eE1RwJ9BJM8I1K3UwB0SPs/oHVP9BzKsb9c6C7B8s9VtySQYz
 03IuoqqHsN/3q9GtXvpxoEtZ+OT9L9oSGOZ2Q6IvV9dpq6kgWR1dTSy2Jd881YZ9AeYv
 LEDPvK8LD02xgZIs/pJuo0X/jUCt2/zCdKfPTqcDAKSNH0jBI3aLDqc3eFh2taDpwQqg
 kZAAaboHn2lGIheg32OcZxISjIaviIcmKujzZ5jqOwQNt9lVtSWPaWwCnhr+iqyIRUz3
 hWcgwsG74Kx504ps2nvWQ7tpsHHzL7+0eXXOaxd4fm9ESTVI8YsFMQI9kCbR7L8Zj/N5
 b4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WjAPIoM35iEoblHbjRgWliMF0RRAsRtMAenOonc8eiQ=;
 b=MsHAR/3uG0UkEtgsivIu2ke4CLqcLq54wSo5g7TVE9GDWBIpukSskwClsqxqGItCRa
 w9tR1l5MZ333kALbqGhlZH2+FHS5AbxyYpOWuRaqNiek77TYbF6KCsOgaFuzybvtQbUq
 Cu5Ynz0H8sX+gd1Xe7d7nuGZUVGU/OQ9QI1mlOLsR9IoIlECAb9nq3h26R7kNiL/aTh+
 FEey7RpPpvr13TNTmV8N5E4QZIC2YUBTE4RjV/w+ozl0h55AZj5mpjL8McCde2Z6BQmb
 Eil6iCiPvQJFhGRcntiVxDPjvIENd+0R4lfBJ64L9Z/CjG4L1RwdSDyx1NUX4JsGFyc2
 0qUg==
X-Gm-Message-State: APjAAAXikvi4Ye73UIgvQ5YIpvXtKIiXCCyMr31XsEeaB3HbKB7gkuv6
 Jowe6b1qfbFu1v5RxXpveiWRsHvJbJRAp66A/afaDQ==
X-Google-Smtp-Source: APXvYqxru1ptwwJRUXtFsi7Ft9XaelKUJmVaUTdDKdeqN98Ll0cYbs2VvM9Ku5PZwXL7YNnapUzo2XdjGg9TXuBK4z4=
X-Received: by 2002:a1c:e185:: with SMTP id y127mr13388880wmg.76.1553695850667; 
 Wed, 27 Mar 2019 07:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190327100201.32220-1-anup.patel@wdc.com>
 <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
 <CAAhSdy1+rc9ge02uqNvse5Z6XmDxsRH0G=5GnMsh+6m1LMLFYg@mail.gmail.com>
 <49628dc9-c56d-6b60-9520-e4eb0e3b3424@garyguo.net>
In-Reply-To: <49628dc9-c56d-6b60-9520-e4eb0e3b3424@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Mar 2019 19:40:39 +0530
Message-ID: <CAAhSdy1gUYZWZsaN7JESgKHv_GyMKq56_Fmg0dPspUaiBbSCtg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Implement ASID allocator
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_071053_985304_19005D6F 
X-CRM114-Status: GOOD (  26.60  )
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

On Wed, Mar 27, 2019 at 7:08 PM Gary Guo <gary@garyguo.net> wrote:
>
> On 27/03/2019 11:42, Anup Patel wrote:
> > On Wed, Mar 27, 2019 at 4:57 PM Gary Guo <gary@garyguo.net> wrote:
> >>
> >> Hi Anup,
> >>
> >> This won't work in an actual hardware with ASID support. There're more
> >
> > Can you elaborate why >
> >
> > This implementation is based on Linux ARM64 ASID allocator which is
> > tested for large number of CPUs on real HW.
> >
> >> interactions with TLB flushes that need to be considered. You won't see
> >
> > Yap, already considered. Please point me to unhandled case.
> >
> When memory mapping is changed, you need to flush it from all cores that
> previously have that process executed, etc. Our patches both take
> inspiration from ARM's code, but the major difference between my code is
> handling of cache invalidations, see my code's cache_mask, etc. This is
> actually the most error-prone part, and I spent more time trying to find
> an optimal solution for this than porting the ASID allocator. The major
> difference is that ARM has a much more expressive sets of TLB flush
> instructions compared to RISC-V.

We should not require explicit cache maintenance anywhere in RISC-V
because caches are transparent to SW in RISC-V. The HW can use
"sfence.vma" hints for cache maintenance.

Further, (just like ARM world) the page table walks are cache coherent in
RISC-V so we should not require any cache flushes along with TLB flushes.

Now if you seeing inconsistent cache contents then it might due to some
bug in your HW. I am just guessing here.

Regarding changing memory mapping, I am sure generic Linux kernel will
issue appropriate flush_tlb_xyz() calls.

>  >
> >> this on both QEMU and SiFive board, as QEMU does not have ASID, so it
> >> pretends that ASID is supported by just flushing its TLB everytime you
> >
> > Nope, it does not. It detects whether ASID is supported or not. If supported
> > it will also figure-out number of ASID bits supported by HW.
> >
> Except that you can detect that QEMU supports ASID, but actually it does
> not. However QEMU is still correct because it always flush TLB when you
> set SATP/SPTBR. You won't be able to find out bugs in your code by just
> testing on QEMU.

I am not advocating that testing on QEMU is sufficient. Its just functionally
correct and works on HW without ASID support.

>
> > SiFive board does not have ASID bits so this implementation successfully
> > detects that number of ASID bits are 0 and fallbacks to original way of
> > local TLB flushes. >
> >> change sptbr. I suspect the performance gain you see is just due to
> >> saved TLB flush as TLB flush is super expensive in QEMU (all translation
> >> block jumps need to be cleared).
> >
> > Yes, performance gain is due to saved TLB flushes.
> >
> > On HW which supports ASID bits, we will see more performance
> > improvements. >
> A hardware TLB flush is cheaper than QEMU' TLB flush. As no hardware
> supports ASID at the moment the performance gain is minimal.
> >>
> >> I have my version here https://github.com/nbdd0121/linux/tree/asid. I
> >> haven't done code cleanups yet, but this version has correctness of its
> >> ASID code tested on our TLB simulator tool (which unfortunately I can't
> >> share right now as it involves with unpublished works).
> >
> > Except few minor differences. You version of ASID allocator is same as
> > mine. In fact there are lot of similar code framgements in your version
> > compared to Linux ARM64 as well. I am sure this patch will work for you.
> > >>
> >> In fact my submit my previous patch series exactly as the basis of this
> >> patch.
> >
> > This patch is based your patch series so I suggest you take this patch
> > and try it on your simulator.
> >
> I've tested, and it does not boot.

Thanks for the info. Now help me make this patch better.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
