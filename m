Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F025EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C9E61360
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4C9E61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A49bt4ru4/6r7I2OJv06jHXXtPsUeVaQe8P4HsKd3r8=; b=L6pMU6p03IPZpF
	jU8/yqX95KB0uDkVMi2AiFihyopKwDnVakAQ09RRigYPETKgpd2pDPokgHZrwLrDvCWeRY1k4Rxat
	n86FG4A3P12VDqFKxhw40GW63CcFf7vplm1eKTpgFqhEauHBXmUhZMQiE21quvugYRVAFj4npTgMH
	8ld7wo7vSJQKJao+wfWObREjhx6fCOwpg8kVXE3VqvR48O5KTBUfjwf9Q5sc7ETYshHR4+mMcqdx1
	+7KmkMDupgmZ9AV7FTQTQrGTYip385dtlx4+mqLaYp/Qrpm7Ksswo+sFF9GU1ChECnq6VltfvXomi
	vrq0T8B8E0fslgas8+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMPh-006GT6-2l; Mon, 04 Oct 2021 11:45:45 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXMOe-006GAf-Em; Mon, 04 Oct 2021 11:44:43 +0000
Received: by mail-ua1-x929.google.com with SMTP id i8so12061364uae.7;
 Mon, 04 Oct 2021 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/OF3AqBYjhrSam9nstifrJUdgClm9EnRgDOOfS1lM6o=;
 b=Iq+qTy3J84qNeUzcCpJ6X8eZlJ+AjvcpWjEz+3mTfZ+Pw2HhOBQUuQL9Dqp89DAsX2
 Pa14ppkMUgTYNLf5oeQnhkjc/roLYGwS3uyWXqgyaY3zwCbTA/Pzgpmrx7xqjpGTNJvl
 WVhmose4S1OuiYhH5D7NIz5Q4ArC/J66XmRE5EQT10Hd+apBbRLo9QiI8OuK1irb6vvi
 RpD5NGyolUrn4uqu9OlH5bA3hUsFo4sP8j44GeDaebFVz9CpjDPcoLH1wSJ6TGsFozdh
 4TDdp1jLXtc1U+Tr+ogsn+Gl/NplPefR+w7vGCL2y/8w+LDjPI/PJpf4d0moFGWEexyM
 8sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/OF3AqBYjhrSam9nstifrJUdgClm9EnRgDOOfS1lM6o=;
 b=U11AgVQwg/AIsi+2zYVdVo2EjRSXVOHaaVpp7mTMZM8e/F8enAKnKecbMofqTvdKwg
 ZZDz0SGq5W7BJ087B4gKhod3DhMQHR2yjtJwhQhnCxHJESUcPxdbenMh4hRgXccn5HJk
 1/YQv1DFJUeE0fYWbMoW3BLKgjnsCE0AvVriqrxjSICe+cO+vzqqdSj6LwW3WjY5A2f7
 WlXsozUVRuBGLBAG2oaj1GBOoW2UBo4Me4u0ZvZJQwVSi4eCUhWHyaG4MRRvUCvH7tBs
 QLoXaTtjLwbreR6PckDKgmjG+kX3pKAWH4MgEMUQHU0AL33W1wUZPsm5wtcSfSKapXUA
 DDYg==
X-Gm-Message-State: AOAM532wYEM3EyxDFd+UDmSaQBenBnE73V5jHr9+HpgF/tnCryk3KdMS
 k10anwOTCfbb7gmzKk/daR02bXzRWNjrZ4hDz7c=
X-Google-Smtp-Source: ABdhPJx3da2SN8QhZw3uy/SrK6SjN8UKIqcnh6yKJSrraZt/fWjcqLmL1+PVdcmJ8uY7LzD1XrbZfVvoiEaB+Vs8I4Y=
X-Received: by 2002:ab0:5448:: with SMTP id o8mr5703850uaa.59.1633347878905;
 Mon, 04 Oct 2021 04:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210927114016.1089328-1-anup.patel@wdc.com>
 <CAAhSdy1yZ11L=A3g06GXM8tFtonBX0Cj5NDyGHQ1v44vJ8MqSA@mail.gmail.com>
 <CAFiDJ5_--KsNd3aH1gT_cgU32C+wzunzXeSKtn8HTNj_La7n5A@mail.gmail.com>
 <CAAhSdy1un6ab62LN-0ihV=oku8EH3fZ5YzbX1zzUFAEbatVAuQ@mail.gmail.com>
 <CAFiDJ5-Pew6311w7pS-_ADWQnP=H7gFEUUuU8MqhsMHEDrofdA@mail.gmail.com>
 <CAAhSdy3a6MqR5bmgA3Znwsn7RXWYhpokWzSP308JV7MQJ0NmWg@mail.gmail.com>
In-Reply-To: <CAAhSdy3a6MqR5bmgA3Znwsn7RXWYhpokWzSP308JV7MQJ0NmWg@mail.gmail.com>
From: Ley Foon Tan <lftan.linux@gmail.com>
Date: Mon, 4 Oct 2021 19:44:27 +0800
Message-ID: <CAFiDJ5-Ji6cXcT8s7YvDce0Q2=VMokNHaCGJSdAtwo+d_GcDOg@mail.gmail.com>
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Graf <graf@amazon.com>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_044440_599093_F55AB472 
X-CRM114-Status: GOOD (  24.19  )
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

On Mon, Oct 4, 2021 at 12:47 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Oct 4, 2021 at 7:58 AM Ley Foon Tan <lftan.linux@gmail.com> wrote:
> >
> > On Fri, Oct 1, 2021 at 6:41 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Fri, Oct 1, 2021 at 2:33 PM Ley Foon Tan <lftan.linux@gmail.com> wrote:
> > > >
> > > > On Mon, Sep 27, 2021 at 8:01 PM Anup Patel <anup@brainfault.org> wrote:
> > > > >
> > > > > Hi Palmer, Hi Paolo,
> > > > >
> > > > > On Mon, Sep 27, 2021 at 5:10 PM Anup Patel <anup.patel@wdc.com> wrote:
> > > > > >
> > > > > > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > > > > > Linux on RV64/RV32 Guest with multiple VCPUs.
> > > > > >
> > > > > > Key aspects of KVM RISC-V added by this series are:
> > > > > > 1. No RISC-V specific KVM IOCTL
> > > > > > 2. Loadable KVM RISC-V module supported
> > > > > > 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > > > > > 4. Both RV64 and RV32 host supported
> > > > > > 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > > > > > 6. KVM ONE_REG interface for VCPU register access from user-space
> > > > > > 7. PLIC emulation is done in user-space
> > > > > > 8. Timer and IPI emuation is done in-kernel
> > > > > > 9. Both Sv39x4 and Sv48x4 supported for RV64 host
> > > > > > 10. MMU notifiers supported
> > > > > > 11. Generic dirtylog supported
> > > > > > 12. FP lazy save/restore supported
> > > > > > 13. SBI v0.1 emulation for KVM Guest available
> > > > > > 14. Forward unhandled SBI calls to KVM userspace
> > > > > > 15. Hugepage support for Guest/VM
> > > > > > 16. IOEVENTFD support for Vhost
> > > > > >
> > > > > > Here's a brief TODO list which we will work upon after this series:
> > > > > > 1. KVM unit test support
> > > > > > 2. KVM selftest support
> > > > > > 3. SBI v0.3 emulation in-kernel
> > > > > > 4. In-kernel PMU virtualization
> > > > > > 5. In-kernel AIA irqchip support
> > > > > > 6. Nested virtualizaiton
> > > > > > 7. ..... and more .....
> > > > > >
> > > > > > This series can be found in riscv_kvm_v20 branch at:
> > > > > > https//github.com/avpatel/linux.git
> > > > > >
> > > > > > Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v9 branch
> > > > > > at: https//github.com/avpatel/kvmtool.git
> > > > > >
> > > > > > The QEMU RISC-V hypervisor emulation is done by Alistair and is available
> > > > > > in master branch at: https://git.qemu.org/git/qemu.git
> > > > > >
> > > > > > To play around with KVM RISC-V, refer KVM RISC-V wiki at:
> > > > > > https://github.com/kvm-riscv/howto/wiki
> > > > > > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
> > > > > > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
> > > > > >
>
> <snip>
>
> > Hi Anup
> >
> > It is able to boot up to kvm guest OS after change to use
> > https://github.com/avpatel/qemu.git, riscv_aia_v2 branch.
> > Is there dependency to AIA hardware feature for KVM?
>
> No, there is no dependency on AIA hardware and KVM RISC-V
> v20 series.
>
> I quickly tried the latest QEMU master with KVM RISC-V v20 and
> it worked perfectly fine for me.
> (QEMU master commit 30bd1db58b09c12b68c35f041f919014b885482d)
My last pull on master was last Thursday, last commit is
0021c4765a6b83e5b09409b75d50c6caaa6971b9.
After git pull again today (commit
30bd1db58b09c12b68c35f041f919014b885482d), it can boot KVM on Qemu
now.

>
> Although, I did see that VS-mode interrupts were broken in the latest
> Spike due to some recent merge. I have sent fix PR to Spike for this.
> (Refer, https://github.com/riscv-software-src/riscv-isa-sim/pull/822)
>
> With Spike fix PR (above), the KVM RISC-V v20 series works fine
> on Spike as well.
KVM bootup successfully on Spike with this fix.

Thanks.

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
