Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2A7C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 11:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EB8610FC
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 11:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35EB8610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9fllsxRLYxT4T7bpfQuzFgKI85zmzAWrM00gARpa8Q=; b=OSfn9MiDA6fCa2
	YMdd3hqWFJuKs5Cvz9Ayv7nJWLOmu96X/gptn6EPo88Oml9Ves049P/LVqR/iVSv8AK68D8Kku0QF
	dLq2goBBs6XpexUELR+yJlGhrcFJZ/MLH+4rYplFkNsWfPL2dJq/LpBt1Fhq0adloiy5qLJutlwsq
	Q2FII65epEzaCG7hrsmmKSfN78+0Gqg1QCtpkoRgsst63b5Z3ZhTYQWV/82VrrODwyfPZTYrq3iK6
	okry4rX4fyZNH1hX1oxxQ/tCtJWiPcWcEsAGUW8iVPPFl1re3YKrOLfLnfMc5/pPjIMXx9ctnRAyq
	xkp3cwx7gdX6/zyezA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY4rO-00E1ZB-RE; Wed, 06 Oct 2021 11:13:18 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY4of-00Dzt8-C5
 for linux-riscv@lists.infradead.org; Wed, 06 Oct 2021 11:10:31 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5A82E3FFE7
 for <linux-riscv@lists.infradead.org>; Wed,  6 Oct 2021 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633518626;
 bh=bS/xuDbJXJ9v8t2XCi3P2+tAt+BzdyUib/fXpbvCaRM=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=ZE+Cb8lyZH+TZiQaRytTCDcK6h0Ua+idvxnFF1V0m5Qdplb+qB17nARiH6si+ChrU
 GigRPORDcoe2GkB89FEFfJzalSxBn4rZYVsfswkzkRmWwrimC738C3z2zYhkamCiAG
 gycTQVxrZWIulgQgZHQH5Df8OT0hdzKVXCG1mj6s8l9cmWUvcXoqmje7XDqKBC9SQ0
 UhK2cM3SAL2LsvhGFe656uj3XHRutqVrcWyVfEG96MBDX5P5RhaklZdBnRtZRTHDCd
 p+J5AB8NpITeiGtviQuUrA0cEHyExCmkTcbciuz1fETlKZLWF2b/TaHwFdnjJWWvtF
 FNjPW8OuPZJdg==
Received: by mail-ed1-f70.google.com with SMTP id
 w6-20020a50d786000000b003dabc563406so2258494edi.17
 for <linux-riscv@lists.infradead.org>; Wed, 06 Oct 2021 04:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bS/xuDbJXJ9v8t2XCi3P2+tAt+BzdyUib/fXpbvCaRM=;
 b=AAwtvWVTTgTJjHq2f6dKwaYGmXvmRMCJi3zDJO7SucqP69efGuDMNUuJMiWp+RfM6L
 rAZ+XQi4DPdY5MjQyUu3vvP/l5/OiemcwXvQg940GgfpFVA++3AHx7e5gBmd4dzTlQgj
 0XPhn8LGtg+5mxq1Pi3NlZlWwDq9yOBKPAro/ZfEDTc9kObUdYKZlBngF+Fma2Rt3+i0
 ARdfhaTQQmqYzA+fMuDd8g5KrW2npM7JuJdON23dvX8vn46ehR3ezRvYSH6/vRAb4f+B
 +9ecKKUrKMcvoTn1Z1k1LUR3Y+EgQCjJUCa2X3vyaSjg6gMJQpj/iVI1xR35NMwiTYQG
 ACWw==
X-Gm-Message-State: AOAM531y0ucJNvQM+YjbrXiE293gJXKfkvj0sw3oYypsYwvYtqQBZ5s2
 EGLDJVvi+n1Ga+DWT4myHxW7I8TDCcINiOuNUBf9+I1Kc5/85xSRAVTWJ1AhaHMsSOG1sRKq4cs
 TPjywXVZWhjqZ2k3QAmre1Cn0sylSzSCEaPHAvYhTnpcKkJhvwFqBNpzNSp5bTQ==
X-Received: by 2002:a17:907:7755:: with SMTP id
 kx21mr31584840ejc.463.1633518625521; 
 Wed, 06 Oct 2021 04:10:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwijEia3ygQvwVNcSjhpzLeZ5wD/V/UIziNbabK4yrQvZHCa4G0ujp0z5Ene8/LPIWpkj2WVVst4RuzlQQY0q0=
X-Received: by 2002:a17:907:7755:: with SMTP id
 kx21mr31584810ejc.463.1633518625317; 
 Wed, 06 Oct 2021 04:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <00c521b5b872b06c9350145c7d39fe7c@mailhost.ics.forth.gr>
 <CA+zEjCs0n8KA_oaFKJbaP6kNohDA=qJHvUKhePUK+hDFJSbHig@mail.gmail.com>
In-Reply-To: <CA+zEjCs0n8KA_oaFKJbaP6kNohDA=qJHvUKhePUK+hDFJSbHig@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 6 Oct 2021 13:10:14 +0200
Message-ID: <CA+zEjCscL1dWASm7u20p1B7-JeJaGTXiWG=K1XiWtZj=VFX+WQ@mail.gmail.com>
Subject: Re: RISC-V: patched kexec-tools on github for review/testing
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: ebiederm@xmission.com, kexec@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alexandre ghiti <alex@ghiti.fr>, rppt@kernel.org, 
 geert+renesas@glider.be, Stephano Cetola <scetola@linuxfoundation.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_041029_657178_C965159F 
X-CRM114-Status: GOOD (  21.93  )
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

Hi Nick,

On Tue, Oct 5, 2021 at 4:07 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> On Tue, Oct 5, 2021 at 2:15 PM Nick Kossifidis <mick@ics.forth.gr> wrote:
> >
> > Hello all,
> >
> > I've uploaded my kexec-tools patches for riscv on github for
> > testing/review before sending them upstream.
> > https://github.com/riscv-collab/kexec-tools/tree/riscv
> >
> > Both kexec and kdump were tested on latest rv64 qemu, using for-next
> > branch with this patch applied:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20211002122026.1451269-1-mick@ics.forth.gr/
> >
>
> I'll test that asap and review your patch too.
>
> Thanks for your time Nick!
>
> Alex
>

So I followed the instructions here:
https://documentation.suse.com/fr-fr/sles/12-SP3/html/SLES-all/cha-tuning-kexec.html#cha-tuning-kexec-basic-usage,
below the output on an Unmatched board using a vmlinux stored on a sd
card:

ubuntu@ubuntu:~$ sudo sbin/kexec -l vmlinux --append="$(cat
/proc/cmdline)" --initrd=/boot/initrd.img
Warning: No cmdline provided, using append string as cmdline
Warning: No dtb provided, using /sys/firmware/fdt
[ 1813.472671] INFO: task kworker/1:0:988 blocked for more than 120 seconds.
[ 1813.478751]       Not tainted 5.15.0-rc1+ #15
[ 1813.483110] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Could not find a free area of memory of 0x3000 bytes...
locate_hole failed

I used the Ubuntu kernel, so this is pretty large:
-rwxrwxr-x 1 ubuntu ubuntu 277M Oct  5 15:47 vmlinux
-rw-r--r-- 1 root root 98M Sep 21 03:25 /boot/initrd.img

Then if I don't load the initrd (I sometimes have the same warning as
above) I can at least kexec the new kernel but it fails to boot:

ubuntu@ubuntu:~$ sudo ./sbin/kexec -e
Warning: No cmdline or append string provided
Warning: No dtb provided, using /sys/firmware/fdt
[...]
[    0.000000] SBI v0.2 HSM extension detected
[    0.000000] CPU with hartid=0 is not available
[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at arch/riscv/kernel/smpboot.c:107!
[    0.000000] Kernel BUG [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-rc1+ #15
[    0.000000] Hardware name: SiFive HiFive Unmatched A00 (DT)
[    0.000000] epc : setup_smp+0xcc/0x142
[    0.000000]  ra : setup_smp+0xc4/0x142
[    0.000000] epc : ffffffff80a04080 ra : ffffffff80a04078 sp :
ffffffff81803ec0
[    0.000000]  gp : ffffffff81a23220 tp : ffffffff81810500 t0 :
ffffffff81a3551f
[    0.000000]  t1 : ffffffffffffffff t2 : 0000000000000000 s0 :
ffffffff81803f00
[    0.000000]  s1 : 0000000000000000 a0 : 0000000000000000 a1 :
0000000000000000
[    0.000000]  a2 : 0000000000000000 a3 : 0000000000000001 a4 :
0000000000000000
[    0.000000]  a5 : ffffffff80c64500 a6 : 0000000000000004 a7 :
000000000000ff00
[    0.000000]  s2 : 0000000000000005 s3 : 0000000000000000 s4 :
ffffffff8118f9a8
[    0.000000]  s5 : 0000000000000007 s6 : ffffffff80c0b790 s7 :
0000000080000200
[    0.000000]  s8 : 0000000000000fff s9 : 0000000081000200 s10:
0000000000000018
[    0.000000]  s11: 000000000000000b t3 : 0000000000ff0000 t4 :
ffffffffffffffff
[    0.000000]  t5 : ffffffff80c0b7a0 t6 : ffffffff81803bd8
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000
cause: 0000000000000003
[    0.000000] [<ffffffff80a04080>] setup_smp+0xcc/0x142
[    0.000000] [<ffffffff80a03d88>] setup_arch+0x56a/0x590
[    0.000000] [<ffffffff80a00aa2>] start_kernel+0xaa/0xa5c
[    0.000000] random: get_random_bytes called from
oops_exit+0x44/0x70 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill
the idle task! ]---

This reliably fails here.

> > Regards,
> > Nick
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
