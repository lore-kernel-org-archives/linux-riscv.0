Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F56C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 05:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3o2Rb1k6FWWJpyjBbXpm7imXpQd05AaCO2Ed38pYcU=; b=XN74hBWuoEWdB5
	+fRqU68qlsSVNiUKNfcjt8qJ4gXLacHTbW4HH5278ubLrgRqQrg6p26FXVSJdT+jwNdC9+9S54fPE
	UxeCL2wne84WFL5HllyZgTaKn0hE6BvfjeE1aQE5PtS276hHP5er1Qj6GCLyB12xcLZAnc2r0nPaR
	uNvrJtKXX1yOs3C2MzNd+9GyF2XNLWDDGWCZWGO1SnGXAGTYTMCoPXiL1heSwlP3IfV2ymWqAPofi
	Lw0eIgrcPk7ODfpXHRimGtpOmVOjooe6AvLHDLSQ1+gV84ST4ZUYeCfWFu8BR3stJc8v4tWJQOQei
	UD1dtBsKCcl1rbeXQ4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTJP-009dMM-Ex; Wed, 11 Jan 2023 05:06:07 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTJK-009dLC-HA
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 05:06:07 +0000
Received: by mail-vs1-xe33.google.com with SMTP id a64so14578544vsc.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 21:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6UT4FoLzAv+H9zbrENJDHPjacQhg44J2Qr9vwLm9dAM=;
        b=MgXd9Z1ZGIddXtjpt94ur+/ZmgYWjvP2pCwNsRLaE0LMoFi+5/003c/cNWYCg/PWBe
         PYpT9yGeKrMOwjrh+sG8TJ0aM6K9qAkCegMilsCsB2G8KgeajixmyPP4WRPegBg5yJvB
         5FLDoD1sZ42uw4gxQFEqSUYH5pZS4bjscwbiEBD3xsy1xIC3jY82OFSAHr6AumDVBoaK
         VTJHXekuwRaZMGXKvOTM4PzJzLxm11R7/frwM1GyXvblMcWkHiCFHTrPWUFux2BAqF19
         QIk5hvOO4kmkMqsl6o0RzNkmM9OkNG9Ul9EL2HifLWiappi9J9nu83Cwjz2OfvZvyRUr
         INrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UT4FoLzAv+H9zbrENJDHPjacQhg44J2Qr9vwLm9dAM=;
        b=0InTRKBjR23QFWZUdgyuUJ1nx35SdSEAhXd647O2jhYDCtO8F3+mfzumUndu6dODXa
         rn2mlTzolc75yj3S1H4tDBlw2wZMSZj2a10xA9tiMU6k2oa2xmU/7xBTfpy5Y92RNHfy
         K/WMK8de3F59cS8LpHnL02yVPjdHJmRG2d8lkxUzrokFDQcKoI0T9sEYRC3Ii43x+fsC
         Wqnp7NM+AcjLtoqP7g5hr60qtrSZ3AA5MtAvhuYbIfmzSE2kcc6vM4T+HGCD+/9pMCkv
         sJ4zQKiYRe6b4fYmMwKFMGLjMEudL6kk5W2dLVMrfwZkHogqGADBOS0DMw45Vx2z5eb+
         Klag==
X-Gm-Message-State: AFqh2ko++GJPsten8b53uKZmL9P/N2YYXtUNCqJxZ5LLGZy+/d99hRBJ
	k3rxtbwo/RcGQA6KauwZSMCBrcCTF0Qayd3Tc34+Sg==
X-Google-Smtp-Source: AMrXdXvyfszATrsXFdgNudU1uoZiX6coqs+bmnK72SLDbHN9VOXMihDBptQEgM1LQaBnnCnrIvnp5EcAGgDzJDzJRCg=
X-Received: by 2002:a05:6102:50a1:b0:3cc:4e4d:efbb with SMTP id
 bl33-20020a05610250a100b003cc4e4defbbmr5468522vsb.59.1673413559955; Tue, 10
 Jan 2023 21:05:59 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com> <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com> <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com> <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com> <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com> <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com> <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
In-Reply-To: <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Jan 2023 10:35:48 +0530
Message-ID: <CAK9=C2Xai0AJau5_M8PYSEdSouM7swqihgDVSwHiDHTXEK5fRg@mail.gmail.com>
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Vineet Gupta <vineetg@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Andy Chiu <andy.chiu@sifive.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_210602_587462_DEFF2794 
X-CRM114-Status: GOOD (  18.11  )
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

On Wed, Jan 11, 2023 at 6:53 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/10/23 10:07, Vineet Gupta wrote:
> > Yes bulk of glibc might not have vector code, but those V ifunc routines do and IMO this
> > information needs to be recorded somewhere in the elf. Case in point being the current
> > issue with how to enable V unit. Community wants a per-process enable, using an explicit
> > prctl from userspace (since RV doesn't have fault-on-first use hardware mechanism unlike
> > some of the other arches). But how does the glibc loader know to invoke prctl. We can't
> > just rely on user env GLIBC_TUNABLE etc since that might not be accurate. It needs
> > somethign concrete which IMO can come from elf attributes. If not, do you have suggestions
> > on how to solve this issue ?
>
> Why not just fault on first use to enable?  That's vastly less complicated than trying to
> plumb anything through elf resulting in a prctl.
>
> You might say "but the fault could fail to allocate memory", but honestly, the prctl isn't
> able to fail either -- if it doesn't work, the process must exit.  And, surely, there's
> some minimal vector configuration for which the allocation must succeed.

IMO, this is a very good suggestion.

For the benefit of everyone, both sstatus.FS and sstatus.VS have the
following states:
1. Off (0): All off and any access to float / vector will result in exception
2. Initial (1): None dirty or clean, some on
3. Clean (2): None dirty, some clean
4. Dirty (3): Some dirty

For float, we are setting sstatus.FS = 1 (Initial) in start_thread() by
default for all tasks and we are doing lazy save-restore in fstate_save()
and fstate_restore().

For vector, we can take a different approach where start_thread()
will by default set sstatus.VS = 0 (Off) for all tasks. Now whenever
any task access vector state, Linux RISC-V will get an exception
and at that point in time we can allocate memory for the vector
state and also set sstatus.VS = 1 (Initial) for that task. The save
restore of the vector state can still be lazy for the tasks using it.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
