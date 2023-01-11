Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E60C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYK7QWbmoR9UZzWeGGYl5ZWbrFSBzdDRVYIoeJE65zs=; b=FAvFXi41QXul2w
	1bExBS++GqECmsQBVNU10wTptNSPLpcxEji5vlshS7qcHppgAWfxVkOGqXMa6InuErLWilLY81grF
	VEsgljrCH+c3aB0SA+Lurp4CvHXNzTIF92zGknZc/X96yB/eHtakGXvGVrc28RmbcQfgGw5e9n9l3
	Npc767zTlvvRxQKuQhUDUE7/9n6rjKFDAX45mQf2QTaJz0eK0H/PTvdDss7384bN9oB/MVuuVWmWq
	ohQl+LCTNuj76u6ijMLipn5RByCpnEaddOHUvtts1T+2UNpUy8UcvtTIz9CvZiV70rXID9iMeCwPj
	O8/J7pVK3edWdNA+qYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFUA1-009o2U-05; Wed, 11 Jan 2023 06:00:29 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFU9y-009o1P-FJ
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 06:00:27 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-4c131bede4bso182751757b3.5
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 22:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lR+5G6p9e9PJouD9oukN3LD1DIcHhlkX07GUBEIUVyQ=;
        b=bISvrXusYKlC6iyn2Q01lxv+ZoO+4aDPxMpF33yw63s74KxFDFtdkKDHIBqezT0NZR
         W1qUhVil5JMBrdCxpulCaynYsTxU+8bBZ37NFBEfWCUEnf+Fk2NbqROM7Fq8e+zFvCbQ
         conmk1E6S4J7cv5ZowUIbbhyHpJO31s+Mjj1bKCJSK8fHQseFbMeyapvvue+EKaNy+f1
         WFUSq+n7lnJ+av3o59x7BILvTex8cpOky4rV7KEdYp2GKysZ5SAgUAAgvL+27nNLJUJg
         oQYJZD7b0S59aoDLKENr+XA5eI8IwgVDPLnaVXaNKMXfQGId3wSPj86ZsojAR6p8yZmt
         ZWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lR+5G6p9e9PJouD9oukN3LD1DIcHhlkX07GUBEIUVyQ=;
        b=GLoHz0Z8PaBEyDmZ6Y0Mzkb4wb04uLBLvufQ9+dEMtCIMOHlxVvnyZad5lavUepKIV
         CPz9dVzwHtptgCnOhO1D+fq1SwE0wAT6F3Q6W0Cva6XYBiNDuLrR2NfN4SHjOd0JIoTu
         Onp8ypXCBPzT1ksrNSVM/zO0vC1g87V4oQrnwr30UDpBSndHPLCeSBscU7rn3BN61dpW
         wdcwGSoaC0nnsZKlOhcMKELu+JK9jpoMyQlCvUWDlp8vlgyniS5MI3D1Rgm5h966C/VX
         T4Hxf3Ek/DcvOoRBmeabEeMR2ElBKIJoJByLR3AppPRaqaQ8CE1f8Q+O9ApXLtbBejaK
         ejNA==
X-Gm-Message-State: AFqh2kohaY29cCCYfjmXe08Q1IIi6qDqsp2EV7jEeG8DjoyAWbLO3mQs
	liYW5XSFeQfwLq8oEcKUBMyS2QOfTU0lY8bJICY4+g==
X-Google-Smtp-Source: AMrXdXukgk6HQZVqIy+bBiSvkILhNpVEIuGr1yFzG4iu5yk1QVSsYLlCZ7BzjOQi4fdnJAKji+X/yv0xLKoOzHDEGl0=
X-Received: by 2002:a81:6843:0:b0:47b:bada:70a0 with SMTP id
 d64-20020a816843000000b0047bbada70a0mr793891ywc.504.1673416822196; Tue, 10
 Jan 2023 22:00:22 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com> <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com> <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com> <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com> <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com> <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com> <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
 <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com> <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
 <6d13e63f-69b3-6e48-b811-bbfcf3ffb3af@ventanamicro.com>
In-Reply-To: <6d13e63f-69b3-6e48-b811-bbfcf3ffb3af@ventanamicro.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 11 Jan 2023 14:00:11 +0800
Message-ID: <CABgGipUAhZNt3gaxEx7mPm20Xw7WNVVppRZ4fxZX-XswA5VG2g@mail.gmail.com>
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
To: Jeff Law <jlaw@ventanamicro.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vineetg@rivosinc.com>, 
	Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_220026_567413_915C29E7 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Jan 11, 2023 at 1:07 PM Jeff Law <jlaw@ventanamicro.com> wrote:
>
>
>
> On 1/10/23 21:57, Richard Henderson wrote:
> > On 1/10/23 20:28, Jeff Law wrote:
> >>
> >>
> >> On 1/10/23 18:22, Richard Henderson wrote:
> >>> On 1/10/23 10:07, Vineet Gupta wrote:
> >>>> Yes bulk of glibc might not have vector code, but those V ifunc
> >>>> routines do and IMO this information needs to be recorded somewhere
> >>>> in the elf. Case in point being the current issue with how to enable
> >>>> V unit. Community wants a per-process enable, using an explicit
> >>>> prctl from userspace (since RV doesn't have fault-on-first use
> >>>> hardware mechanism unlike some of the other arches). But how does
> >>>> the glibc loader know to invoke prctl. We can't just rely on user
> >>>> env GLIBC_TUNABLE etc since that might not be accurate. It needs
> >>>> somethign concrete which IMO can come from elf attributes. If not,
> >>>> do you have suggestions on how to solve this issue ?
> >>>
> >>> Why not just fault on first use to enable?  That's vastly less
> >>> complicated than trying to plumb anything through elf resulting in a
> >>> prctl.
> >> Well, the answer is in Vineet's paragraph -- the hardware apparently
> >> doesn't have fault-on-first-use which is mighty unfortunate.
> >
> > Nonsense -- sstatus.vs stores {off, initial, clean, dirty} state, just
> > like fpu.
> > Now treat the vector unit just like fpu lazy migration.
> Then let's do something sensible.    Manually enabling via prctl seems
> silly if we have fault on first use.
Yes, faulting on first use is a viable way of approaching. However, my
concern is that doing this on a system with libraries having common
V-optimized routines such as memcpy, memset would essentially trap
every process to m-mode starting up. This might take more cost than a
prctl syscall. And if every process on the system wants to be
benefited from V-optimized ifuncs, then having an additional prctl to
call at start time seems tedious as well.

Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
