Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1B0C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBie4XLKs36O1yJRyT9puzlBwIGCzpkhF21D96fJEzY=; b=KRqQ3fdtDKyoZm
	KGugqcB2LLIgcdKQrbKb9gLChypqG6jeoCaWdengqzlVHSWOQzu+bURyFsrPZSvSnbuYGBvC2ercP
	1QR6oPtMpDFfD0mwbCKRxHVYRMYSsDMHDJzSRALAJvbsXDjtFGstImkRjDar5yvgrCKzjl5gC2CjG
	gT7BgU3PaZEgxey5QrnTM8D2w5qz59T5SgMhKgxeZUCS/yCdDzjUFUIBpNC2vkEzbBwV9cYwpcWJb
	ugn6lTh1thh1WRlZA78T6IqwVEzof0y6Ut9H1NJF93+7CZ+3bp4hx/a+azkIOz2NI0dqBBBf13g2c
	XNDQvbeU1uIg7R9c+a+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riayN-00000009Usy-1Eq8;
	Fri, 08 Mar 2024 14:13:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riayK-00000009Ur6-0aV2
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 14:13:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-512ed314881so2029130e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 06:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709907194; x=1710511994; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TNAmhFzSeaD6wR6KJ/UAf/8iGn+xyB1175NpyMI2DQU=;
        b=C6sCoN7j1tbAo90fSui5bOThtuyp/qj0QvgxxkEfSDz2tZ+NUdgFct3Pmy96RTDSDZ
         MTXwvp++8+6ED62vNyQ5cKYxTImUJ75Fnu488SrjEuTy1WbfMq7zLL/sFseEoehaFQKM
         c0DFW5z2SDjpqyG5v6GdzU+xiBlbnkVSB14XHtxpbhaszoqZAmjM37mWPMI3owu1h8MG
         WQAexY6wNOZiMOjERYO4mdC2Ws4ZQ+FEkQ/J1yu6nFPgh9KOcBT8QvY7J1vaxKo+53yV
         NbcKnvB9oO9/gJP5cxbvitKoqaKx0Ys8h9OcnPgMki+fQgoaDBf6IOZS/lhcJ8q9FLau
         UP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709907194; x=1710511994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNAmhFzSeaD6wR6KJ/UAf/8iGn+xyB1175NpyMI2DQU=;
        b=TJQm8X8g/LeTbnIswE6tS0TV1AXNDRfbcmCAObwrIkTS5MpFI0tOKmelPyaa+Fp/Xn
         PXEBCkZS69dAKbC/hWRYtg3P+Bz7Dv21DBmoRu0+HhlSauEiudMUCt3UgQrFY9FLBsgK
         IgbgOU6JpL8AVdC3tzTJzgRxSpY4cp7KRQWgWTGDmx0tFzyBwotok/NAX7PqOfwPto6K
         MygODrvqb9tZG/nwVSYaMrdMM2knm36R2ex1GcLTZyjYWShVy8nw72al1c2kFMO+UJ5e
         N6xby+km9mbQEpg0Nq04VQhJcnFHdPil8V1pqePSHY8y+tXd1+F1m00FGSNJ+dAiX+Pc
         xgeA==
X-Forwarded-Encrypted: i=1; AJvYcCWvceLoKHmYQ2E2bGOejpGvsEs/nXW6idsuSygz7o32R1FxHD5hGy8pxZrdjl8l5+uo4kfoRjb/foG0V1Iaq0T+Q+2UQulWuk7q746XUNP3
X-Gm-Message-State: AOJu0YzN4WKQqLhJ+Zmzjle1vpeh6ILSOnO8t1M578qHlcLeF1o9glc5
	lPkCdIv3v5pUXj7bJoBNoMOWzoQv5O86D8UMbQLs93/5KlG9s9ArRVLQAsj1nTwjWlzK5VtXL1v
	kPRwCWIbXmTsaoVC1LhJBPwaz+usn7Ukxa1fhvq99IV0=
X-Google-Smtp-Source: AGHT+IEnpibiq1oTffEeY4LuZ+IiCvylw5bnXg1+82BI68jyD2wQItjBXAeOd2L90D++pDldD8hIGtGaEgQPFmXHTDw=
X-Received: by 2002:a05:6512:3584:b0:513:8102:1a1e with SMTP id
 m4-20020a056512358400b0051381021a1emr2786397lfr.50.1709907193455; Fri, 08 Mar
 2024 06:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20240306165904.108141-1-puranjay12@gmail.com> <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <CANk7y0gbQdYw0V+CEv-z8wFGXnki8KSn4c8+i0iZ1UFNCg7wJQ@mail.gmail.com> <CABgGipUJU_joVOjPi4WZ4JJM72zaSrCA1QUAaP8hob3+LXkS0g@mail.gmail.com>
In-Reply-To: <CABgGipUJU_joVOjPi4WZ4JJM72zaSrCA1QUAaP8hob3+LXkS0g@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 8 Mar 2024 15:13:02 +0100
Message-ID: <CANk7y0hdntnN8x8keDvbQPfr1LLJwRSH5BX0dyC1tvL94sqn7A@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: Andy Chiu <andy.chiu@sifive.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Deepak Gupta <debug@rivosinc.com>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Song Shuai <suagrfillet@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_061316_206026_8DE0DB97 
X-CRM114-Status: GOOD (  22.97  )
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

Hi Andy,


> >
> > I don't think implementing direct calls over call ops is fruitful for
> > RISC-V because once
> > the auipc/jalr can be patched atomically, the direct call trampoline
> > is always reachable.
>
> Yes, the auipc/jalr instruction pair can be patched atomically just as
> long as their size is naturally aligned on. However, we cannot prevent
> 2 instructions from being fetched atomically :P
>
> > Solving the atomic text patching problem would be fun!! I am eager to
> > see how it will be
> > solved.
>
> I have a patch series to solve the atomic code patching issue, which I
> am about to respin [1]. The idea is to solve it with yet another layer
> of indirection. We add a 8-B aligned space at each function entry. The
> space is a pointer to the ftrace entry. During boot, each function
> entry code is updated to perform a load and then take the jump from
> the 8-B space. When ftrace is disabled, we patch the first 4B-aligned
> instruction to a jump so as to skip the ftrace entry.
>
> We are still discussing with Alex to see if we have a better way to do
> it. If not then I'd update the patchset and re-send it. There's a
> pending improvement in the series to reduce complexity. The 8-B
> aligned space can be added before the function entry (just like your
> patch).

I briefly looked at the series and it looks promising. It looks similar to
how BPF programs jump to trampolines on ARM64. If the choice has to
be made about keeping the 8-B aligned space below or above the
function entry and both choices are viable then I would prefer keeping
the 8-B space below the function entry.

I am saying this because when nops are added above the function entry
clang's kcfi[1] doesn't work properly.

Thanks,
Puranjay

[1] https://clang.llvm.org/docs/ControlFlowIntegrity.html#fsanitize-kcfi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
