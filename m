Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947DEC4708D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 16:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bg2bpBuaWc5IHnxsTfkrshFj3WBhYPEWXKBUw6zI8HU=; b=qo6cZb69ugwnU6
	ZCrKYmXPQl9nkH5XdR15FDkEuaFRm9vbefocQyuwSyxFjnNBz7XubSwYtYZCD+O/fyKg4bRbjMb+q
	JNJpcFDc9epV6+5pSJUn7oPvEK/Yzb9MbydWKf2lVmZCSg3S50uV4q8xMzYKLp+GE/yNktzg8YxrX
	AqOza+0BnxkF5/aEfdcrppnurRwWjkqGyFfgCO58nfv0c5lK5BaYjy3/l/kolB7jKowDLN9z5MD2w
	+4Nav4PfhTeySXDeg6yAmNaCzXKJ1f3Y9Hmz4wYTxJVtsRTE8MoDZkyY1j+6KpojEN3hTL8mK2Kjq
	dRufIHhLPww3Y+TxnGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6vv-00AUg0-53; Wed, 04 Jan 2023 16:48:07 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6iY-00AOSI-Q1
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 16:34:20 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4a0d6cb12c5so154620527b3.7
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 08:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LqdqQlesspNDXGGnijlTI3oVDhi9FDWDU+bglzO3AE8=;
        b=eoMKaO5cljcPF4UPuHN+cPVIEBEnCFD6LXiE26/nR8baZdQ1u2th/lBRpZ34uC1XK0
         bb/azslGjCwJgQIX0WX0uKLX9tzbt9OfEa8alFy6QXZrHrBPrTujiQFVpax//bEwyV8a
         Gej9nh6UIgkDOvwkFoye/eAmkY/SPMBL5tD3tIoMw1pyp/6KqcoPpvYiaIiRVinqPmAw
         GaSkETXzcNdJMaxhkvs7Ef5wcC5mG7iGbzpWKOeme0pWcyaRxjxhVdElxNucVZCmRtsa
         R/XrcvctHHv0iAdQpEhTuaXikU8oXrKySQf+6ASW8W12xorLBvU14RMziIuHyZbg2XUs
         /kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqdqQlesspNDXGGnijlTI3oVDhi9FDWDU+bglzO3AE8=;
        b=lcruE0n4RbobvLin9UH9R15C5rnSckEybk6YmDx+MJ/fKVtGcaCTnNyDXGHTWuMTLs
         WPPyG71pUkh1us+O9o4+jw6O7yas2wHuhRCZqmvstydU1PFaGQsGnMWhl8sChpvTtF8j
         r3QbzFOHWN6scVbbuTsl+ojbHtC0vLM/ZJTZvSlMetozksFnNtGPSh8v6L43PrdMqXJt
         Ya5ugxMGnRDzBO6YzGrKGoSl8Nn6i7A8PsxAfQsjPdFeJF4i46jXeU+HcoRlZWDUSwpH
         kXn9pG+EAHUugBdWk6e+yh0WWZxf7QHzUApXUeybr9ToDoVMF/iWIkcDv8QTzMWHMG5b
         5CAw==
X-Gm-Message-State: AFqh2krtOAglro+D3ocMNkZrN4/8afVe3oUdkV4EpNK8IzE3TUXIepT3
	gwS8YHQvpxhYinimLcT9REFjcWK1VtE4ovdt/fzCzw==
X-Google-Smtp-Source: AMrXdXu5Hut/VnWhTG0E3fIf/ZB19TwzTMVbJSeVN4gYVuVK9YYO9pF+KMFU8O4jlcDTjiB+jjCOgsQcmG3E+r56cxI=
X-Received: by 2002:a81:7343:0:b0:484:a94f:210 with SMTP id
 o64-20020a817343000000b00484a94f0210mr3516351ywc.129.1672850055789; Wed, 04
 Jan 2023 08:34:15 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com> <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
In-Reply-To: <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 5 Jan 2023 00:34:04 +0800
Message-ID: <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Kito Cheng <kito.cheng@sifive.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Szabolcs Nagy <szabolcs.nagy@arm.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>, 
	Andrew de los Reyes <adlr@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_083419_098076_CACE4E1E 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Vineet,

On Wed, Jan 4, 2023 at 3:17 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
> The prctl support in there is really rudimentary and incomplete. There's
> more work needed to use the dynamic state of enablement - for say signal
> frame etc.
Yes, I agree that signal and ptrace need special handling if we'd turn
off Vector with prctl. For example, we may not need to save/restore
vector context on context switches and signal handlings. And we may
have to prevent ptrace from setting/getting vector context in such
case. I can implement this into the series if this is what you're
looking for. Or you could share the code somewhere so that I could
merge it.

> The new Kconfig CONFIG_RISCV_VSTATE_INIT_ALL seems like a
> hack bolted on top.
IIUC, most opinions suggested that we should keep the default Vector
state to ON in thread:
https://lore.kernel.org/all/20220921214439.1491510-17-stillson@rivosinc.com/T/#u
So IMHO adding a build option to those who prefer not to
unconditionally enable V should be sufficient.

> I would also suggesting dropping the 2 patches for in-kernel enablement
> for your submission as it might require some more thinking/design and
> builds naturally on top of the baseline patches.
Yes, I agree. Those patches were heavily copied from arm neon, which
will not benefit from hardware feature on riscv-V. I will refine those
patches and submit independently, on top of the baseline patch.

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
