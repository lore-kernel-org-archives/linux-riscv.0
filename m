Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0F5C4708F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB714610FA
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB714610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RcbG10h+9PZeYWp1a53BcP0uP6uGCt2crHs4UXi5kSg=; b=kRErKd7m336+rc247X5gqHlWoF
	bCBxYdwp440KmAfvU6C81SBPdoaJHkWY8tZ5kDdvHdBhLMQGbWxKcc1mXf/JuySEJiC22twtZxCx6
	SCmIZqbP/jBy6/8vtZDrz1uUN5wrrydvdcG4K63Dscqxmyc88JQWPAorK/OC9tYiEAW2JoFC+AAqJ
	9VHaCPIhm9UJTn5ABBCfnlFT263Llm8KcKXAMqKWM6AQU4dWdeFLLs8sP6fcsgBsdjb910TRsJzLl
	khr+hSVbXFCTvnmhJL1qbDqzyz1g98EiC8CmI/P8sJu3eEoU8X7eKWn+uGs+ogIQSD6HVwUIW3fxN
	2sIFmMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln9LY-008gFw-Br; Sun, 30 May 2021 00:30:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln9LU-008gF3-Mv
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 00:30:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id l18so695464plc.12
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 17:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Xq8rjDdajOrEnJH/gYsPZPip8sU4KPaYjYp9VZxKFxg=;
 b=Li711QZ4jfbmgsYIYc13IzJADdEzcf/jVUy5AIHJgsr00pEXHYXwBh5HE5xuHgQ9Iw
 OuF0OawaFzTp+DkAbEwoSZxEuLtKvFH6VYDWrvzvdp6Uc1L5x+x994srisje+kTR4Qmf
 ZExtumx+PUJg+rAkp6HwcVDgEyHlZzF9QKIolJ8rfLLazk3Yj8xfWPetx+6O+kTUkfvN
 UVxnkBQG52r++fcHdKP9Lma7hwtC41ipDo9Ll72XXjn+dIaEvQbv66QXaMqKeMvrMa3i
 eA976sfPV9IRtUaNQoRkp3jIev3kFelLcnuJk9khpW+A5oiHDsQFY1mJ9OZuX8A1spfz
 OFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Xq8rjDdajOrEnJH/gYsPZPip8sU4KPaYjYp9VZxKFxg=;
 b=XTUF8WU1Q8ehSioE0mH12fLlxDtasNfNQuUpQbc8ye4SaKKZVHBylInTnQCAVw//og
 8J+lNjG9BXlk5LjVNdSnwDtFKh74zBOuE7mZG8kR8T3gs393kqduDN/GpdZ+kmZ3sZb+
 f84SK4cXmBEtXYydsgHCiwmDrF0SS0ON0d124DyRORTppzMSbIgWpN6Z1DNa10d0Wvtk
 uy8DI9X7GQxVMHsLcU4rm/ZkKwYtb0z5Eq1rCpmFqWczDeVPsvKKuJajZPmg+g+3dDLP
 rFRLGuiRUPr//nJv28+13LflnUMG14Lhw20MtFFQjUaYta7gFcAuiV1CZh9eiZuUFM08
 LDVA==
X-Gm-Message-State: AOAM5310Oss5V+n9/t5p0IVuIohbLNnP7oqMQ2yUbvcDuB5UKbIRl+Lu
 FDIow3yE7UGBCkwafBxw86A4ug==
X-Google-Smtp-Source: ABdhPJxKeHz3bdKzW+qaaA5CNw7eizOlyQUSlrZom5qN9xyOtG7sUWzn4T85FVINWEK0dsYvqxAOZQ==
X-Received: by 2002:a17:90a:6589:: with SMTP id
 k9mr3348112pjj.14.1622334619298; 
 Sat, 29 May 2021 17:30:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a9sm7182418pfo.69.2021.05.29.17.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 17:30:18 -0700 (PDT)
Date: Sat, 29 May 2021 17:30:18 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 17:29:11 PDT (-0700)
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
In-Reply-To: <CAJF2gTTBAKTBY5AF9jd8tfT-33Y+McyFis_xk_aMvZZpLsvVxw@mail.gmail.com>
CC: anup@brainfault.org, drew@beagleboard.org, Christoph Hellwig <hch@lst.de>, 
 Anup Patel <Anup.Patel@wdc.com>, wefu@redhat.com, lazyparser@gmail.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-sunxi@lists.linux.dev, 
 guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-a5f8374f-350b-4c13-86e8-c6aa5e697454@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_173024_792391_15C3FF21 
X-CRM114-Status: GOOD (  43.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 21 May 2021 17:36:08 PDT (-0700), guoren@kernel.org wrote:
> On Wed, May 19, 2021 at 3:15 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
>> >
>> > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
>> > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
>> > > > Since the existing RISC-V ISA cannot solve this problem, it is better
>> > > > to provide some configuration for the SOC vendor to customize.
>> > >
>> > > We've been talking about this problem for close to five years.  So no,
>> > > if you don't manage to get the feature into the ISA it can't be
>> > > supported.
>> >
>> > Isn't it a good goal for Linux to support the capabilities present in
>> > the SoC that a currently being fab'd?
>> >
>> > I believe the CMO group only started last year [1] so the RV64GC SoCs
>> > that are going into mass production this year would not have had the
>> > opporuntiy of utilizing any RISC-V ISA extension for handling cache
>> > management.
>>
>> The current Linux RISC-V policy is to only accept patches for frozen or
>> ratified ISA specs.
>> (Refer, Documentation/riscv/patch-acceptance.rst)
>>
>> This means even if emulate CMO instructions in OpenSBI, the Linux
>> patches won't be taken by Palmer because CMO specification is
>> still in draft stage.
> Before CMO specification release, could we use a sbi_ecall to solve
> the current problem? This is not against the specification, when CMO
> is ready we could let users choose to use the new CMO in Linux.
>
> From a tech view, CMO trap emulation is the same as sbi_ecall.
>
>>
>> Also, we all know how much time it takes for RISCV international
>> to freeze some spec. Judging by that we are looking at another
>> 3-4 years at minimum.

Sorry for being slow here, this thread got buried.

I've been trying to work with a handful of folks at the RISC-V 
foundation to try and get a subset of the various in-development 
specifications (some simple CMOs, something about non-caching in the 
page tables, and some way to prevent speculative accesse from generating 
coherence traffic that will break non-coherent systems).  I'm not sure 
we can get this together quickly, but I'd prefer to at least try before 
we jump to taking vendor-specificed behavior here.  It's obviously an 
up-hill battle to try and get specifications through the process and I'm 
certainly not going to promise it will work, but I'm hoping that the 
impending need to avoid forking the ISA will be sufficient to get people 
behind producing some specifications in a timely fashion.

I wasn't aware than this chip had non-coherent devices until I saw this 
thread, so we'd been mostly focused on the Beagle V chip.  That was in a 
sense an easier problem because the SiFive IP in it was never designed 
to have non-coherent devices so we'd have to make anything work via a 
series of slow workarounds, which would make emulating the eventually 
standardized behavior reasonable in terms of performance (ie, everything 
would be super slow so who really cares).

I don't think relying on some sort of SBI call for the CMOs whould be 
such a performance hit that it would prevent these systems from being 
viable, but assuming you have reasonable performance on your non-cached 
accesses then that's probably not going to be viable to trap and 
emulate.  At that point it really just becomes silly to pretend that 
we're still making things work by emulating the eventually ratified 
behavior, as anyone who actually tries to use this thing to do IO would 
need out of tree patches.  I'm not sure exactly what the plan is for the 
page table bits in the specification right now, but if you can give me a 
pointer to some documentation then I'm happy to try and push for 
something compatible.

If we can't make the process work at the foundation then I'd be strongly 
in favor of just biting the bullet and starting to take vendor-specific 
code that's been implemented in hardware and is necessarry to make 
things work acceptably.  That's obviously a sub-optimal solution as 
it'll lead to a bunch of ISA fragmentation, but at least we'll be able 
to keep the software stack together.

Can you tell us when these will be in the hands of users?  That's pretty 
important here, as I don't want to be blocking real users from having 
their hardware work.  IIRC there were some plans to distribute early 
boards, but it looks like the foundation got involved and I guess I lost 
the thread at that point.

Sorry this is all such a headache, but hopefully we can get things 
sorted out.

>>
>> Regards,
>> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
