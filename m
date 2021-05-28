Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84313C4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 11:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360276113D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 11:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360276113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08L5muCXdPBk7Osmj51yockV0qLGv4iCG6wmom+1ueM=; b=PRHR4Rl+N3XPQW
	UMjdg2G2RfpOh9hyu8qjIk/wwwNamETWZ/3LIiBP+YgXP3W4Sl2t2SG/oFNm7KWQCKyB8fQj2k3Ha
	mTsfMbrHTtW+0pVMWVMYAxtr0BG23ly0usEaxTqdfPJwLB9hcqsozFh7Hi7FDOzv7RhkykInhHZ+g
	BdYmcXDj8Ipp6SYj+mxnD/Gs+tCZh++BB5VJpQ05JOtpDgNiZfMw1FxA1VZ2zWOVgfarmUnOEVin1
	NMj7KpKBUA2bnOZ4aDy0lwvD1aDom9RzLXRr/O0AmPes8i1aU7qOrM+rBDMfi+tzmU+/cYYAZSdGx
	YhxU9PbuUcbcC+2rAKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmasB-00Eydu-MI; Fri, 28 May 2021 11:41:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmaWu-00ElCn-Tc
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 11:19:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id h3so1907479wmq.3
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 04:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8H7j70pvIp9Dkh0LuFFC2veDISFLsHSeHoR49KfKrVs=;
 b=e91t1G5Hs9M0Rn5TuVkEehaP1o8fAJR2WuehuZJYSaYh1RVZ1uqibeAIaYpg0yWtmZ
 KXLyLqEyd9f5FnFEwP91xnK97VCmmFi726jNHG+d5JbidYATO0eRRaEMwZ2ePFOVDBXD
 XIlcaRoMDzt6gbOFfmtpjB8gZ16WwPa45XCr2cnzG22S86imf1GQCsOcGjXB6F/Gr1R0
 fUDm7bZb/e5tj/Lwqf7i0LN2qEjrWQDYf2Ix1tiGubs+VyVTJ8ppxcdTZxWkz+zUKv//
 2Ujy6db9c3Ra5KSCGDLx8zyuzJRcZj54o+j41wEBeAdnmCRLPtrX8Op7sTn/h3ujFvOc
 +/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8H7j70pvIp9Dkh0LuFFC2veDISFLsHSeHoR49KfKrVs=;
 b=pzEsHEhZGPZUt+mfJJ6Y2yDVpWTZ7njR67oLixsyn6Nxvvmm0akVeRLNPHBAGeNCml
 o9909cFr7sxi+ABDBXUsic0a4XCs+F/eyBeRSVrgTN1+ZZbXd6bowJScBajkE3UZfCsz
 C+6+I0dWw0FrhDcUFo0MbZt8l64N4+7G/k6tm+ALDoW2RiBcmXT4c0tYtjf2pPwGAEK2
 pW31ri2DPB2vrSGfh+7QD+zm+ja0K39bZZXn7DxNc+EntxTjApOmpLAm06YZYaSf4ohK
 ouo3ue2ueSxX4rJW+oVnJXgAtysBSdH4AGtjC09TIwVTGRVVsEVGoPwY07xSJ1Ew1TJj
 udSQ==
X-Gm-Message-State: AOAM531KHX3xp8H17Zf4y+1a0Gd+/p4u66vX/4C8q6LPDSvvFp3+Ttyf
 3w1BmrhM48hgOS+8zWl1yIs+7ywQAygu5nF1qnPYPQ==
X-Google-Smtp-Source: ABdhPJzSycJLy4PQOTGTTRuUajLT6JmQNkNaQLVXAwxkivFHXrJgRFwo2Ja5idXqAn+ZOcgw0olaoHxrnw1Gi1lQ17M=
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr13122763wmh.185.1622200790969; 
 Fri, 28 May 2021 04:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
 <YLCvdmwPrm/S/GKg@kroah.com>
 <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
 <YLC211VUeTrUdo3v@kroah.com> <efa8b40b-4c64-4323-7070-223329a52872@redhat.com>
 <YLDNEbm+M/geZkHG@kroah.com>
In-Reply-To: <YLDNEbm+M/geZkHG@kroah.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 May 2021 16:49:39 +0530
Message-ID: <CAAhSdy08jBxHb_BG+YSoB3GokSq=sn9YOjcK4nx5aXT4ZkWaHg@mail.gmail.com>
Subject: Re: arch/riscv/staging
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_041953_058073_69D8C45B 
X-CRM114-Status: GOOD (  19.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Greg,

On Fri, May 28, 2021 at 4:29 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 28, 2021 at 11:37:02AM +0200, Paolo Bonzini wrote:
> > On 28/05/21 11:24, Greg Kroah-Hartman wrote:
> > > Ok, as it sounds like this isn't going anywhere until the spec group
> > > gets their work done, you all should just wait as there's no real need
> > > for any kernel code here either, given that there can't be any hardware
> > > made until the spec is finished anyway.
> >
> > There's need for kernel code so that userspace tooling can be built upon it.
> > Not having the header files in Linus's tree makes it harder to merge RISC-V
> > KVM support in userspace.  KVM shields userspace from any future changes to
> > the hypervisor specification; the userspace API *is* based exclusively on
> > ratified specifications and there's no risk of breaking the ABI.
>
> The "risk" is the kernel/hardware api, that seems to not be solid yet
> given the spec is not released so I understand why the riscv maintainers
> do not want to accept it.
>
> Work to make that solid/released and then no one will be complaining
> here,

There is no "risk" in the kernel/hardware api exposed by the KVM RISC-V
because the KVM RISC-V UAPI header is based on the latest ratified
RISC-V privilege v1.11 specification.
Refer:
https://github.com/avpatel/linux/blob/riscv_kvm_v17/arch/riscv/include/uapi/asm/kvm.h
https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf

The unratified hypervisor extension part of RISC-V privilege spec is
only used by the arch/riscv/kvm sources.
Refer:
https://github.com/avpatel/linux/tree/riscv_kvm_v17/arch/riscv/kvm

In other words, the KVM RISC-V UAPI header is solid and based
on released/ratified RISC-V specification but the KVM RISC-V
implementation internal to the kernel uses unratified hypervisor
extension.

If the hypervisor extension changes (which is very very unlikely) then
still the KVM RISC-V UAPI header will remain the same because it is
based on released specification.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
