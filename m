Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47E7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oO3wWf0Fx2/EQvJdLaiY9ZjP7XcItezWdVT5z7lrYs8=; b=WTJZWxv7NEFmFB
	peWXn7isQn0rXzdE5NnhSBhrCuJ6MA9bdrDOFtkPIlaLsJON5Gaeu91QWLzFsYr/z7cezu5CSuyX2
	l3QvkZrGkH2WnTFOnM6cq6jBxuD4tAeiSnWR7EfK/GRhzDoT1mR+aNyz2niSJPi/5iRsbvihDUrJS
	OGnIcYaabegwvHbEdW748BNwwCvLPk8kYnyCiSI28FY0hW6KH9lEXyH0re9qLD+nqIZfXiM6W+w9/
	VcQr0Yr562+br2pHA2w9V5BdP8+tu1wgAIssJOOo0RPCyLZV0q/i6A/XeMcoTMiF4+n9AX5rl4IZM
	sZGAcAIUIKSBEigzqNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8QOC-00FWUk-00; Thu, 22 Dec 2022 18:33:56 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8QNx-00FWQ9-Hy
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 18:33:43 +0000
Received: by mail-yb1-xb30.google.com with SMTP id j206so2976000ybj.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 10:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zgQ7/HyilgHg8E9BFXKxaOdfSKQizyd/42UYLpvYwXY=;
        b=akTL9yqyIFNp2iIdYC5PHjy1YAfRW8nyNonh70NkM4bBKC//4ZKCq79oMjnCyxbV81
         /f/Nv5leA8JsALRPdLmEMfJSXWnmNpcTV13z6/uuL2FA9sV4xdAHaZm+DzpU70B0Ixr0
         9Sw8vzCkbUkP67qYDZWggLZaFfxFHWb29qIQvLEFgFikoebkwD361mEm4w7Lmxd+Y5t7
         MoOYEFFupGShcUBqgcinQh24tGXDBO83w/1okjXT3TaHogM28l5ybGPaqo308v8xtahZ
         He2nNbOvJ59l5V8j1EMraisF9SNuvMBeUoJPyTRtgOPVStoJzDtyL7HPIfTPHi8EywXS
         6YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgQ7/HyilgHg8E9BFXKxaOdfSKQizyd/42UYLpvYwXY=;
        b=CFnUmTaApILjasjlT7KjrfIHxnnummurGZnypYzj/3XBab0pwlAR28ux+mKgI12PYI
         MXRMSmXPOHewv4M26Nbj9whOiGUT+NFo/TvhVSKV1VaP4x+QPwi2GGdQe9+9uLnsD7Ia
         Fk1fbOE4XE3mvrvTMnijkfyP0/ZXx90eW+xwImQC9bx5UzEZcLvjrDotvcm6uvQnJ+kG
         WVUbY8insiKkwO9Lg7B903buTzqlpqwFZfRmtWTl9eZwSV73NezHIky+UlDaUagftc6u
         mHJ+VG8i24xQmwhEjfMDcUtZCvXbAiD+0CXLmuUxEOp5yFhNqINPHQ89innmOzm9n2Y3
         PxmA==
X-Gm-Message-State: AFqh2kqFQRxC6B0WPjFmh/aroDKMDAiwdnD+jSKGc7b/FV73bed+c4zb
	FjyJ19OHiLwfV12+E3A7vTNTepGVD36C2YsNut/TUw==
X-Google-Smtp-Source: AMrXdXsm02GTbuCyR6H9SG5ET6+z6HWVhYCUwJqYxCLfh0jMinpWaZPXbEzYeEB0Bn1IXhJn8zqveBqV0oWjihdfq5E=
X-Received: by 2002:a25:9744:0:b0:71f:d74e:f3f with SMTP id
 h4-20020a259744000000b0071fd74e0f3fmr798816ybo.75.1671734017626; Thu, 22 Dec
 2022 10:33:37 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
In-Reply-To: <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 23 Dec 2022 02:33:26 +0800
Message-ID: <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Vineet Gupta <vineetg@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Kito Cheng <kito.cheng@sifive.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Szabolcs Nagy <szabolcs.nagy@arm.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>, 
	Andrew de los Reyes <adlr@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_103341_652370_596C0A3B 
X-CRM114-Status: GOOD (  16.20  )
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

On Thu, Dec 22, 2022 at 1:32 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> E.g.
>
>      reserved[0] -> magic
>      reserved[1] -> displacement to "extension area"
>      reserved[2] -> size of "extension area"
>
> Thus the area can be located anywhere within 4GB and expand to 4GB.
> Not that I'd hope any signal frame would require 4GB.  :-)
>

By encoding the extension magic into fp reserved space, and attaching
actual Vector states underneath, it is possible to make no size
changes to the sigcontext itself. In fact the comment section of
__riscv_q_ext_state specifies those bytes were purposely reserved for
sigcontext expansion. If this is the case then maybe we should just
use those reserved spaces anyway.

struct __riscv_q_ext_state {
        __u64 f[64] __attribute__((aligned(16)));
        __u32 fcsr;
        /*
         * Reserved for expansion of sigcontext structure.  Currently zeroed
         * upon signal, and must be zero upon sigreturn.
         */
        __u32 reserved[3];
};

Here is a way that keeps the size and layout of sigcontext, while it
also manages to let the kernel write Vector state into an user's
signal stack. This approach also lets the user space leverage existing
reserved space to get context from new extensions. We introduce a new
struct, __riscv_extra_ext_header, unioning with __riscv_fp_state in
sigcontext. __riscv_extra_ext_header is the same size as
__riscv_fp_state. The only purpose of the struct is to point to the
magic header of a following extension, e.g. Vector, located at the
reserved space. If there is no more extension to come, then all of
those bytes should be zeros.

 struct sigcontext {
        struct user_regs_struct sc_regs;
-       union __riscv_fp_state sc_fpregs;
+       union {
+               union __riscv_fp_state sc_fpregs;
+               struct __riscv_extra_ext_header sc_extdesc;
+       };
 };

I wrote a PoC patch for this and it has been pushed into the following git tree:
https://github.com/sifive/riscv-linux/tree/dev/andyc/for-next-v13
I tested it on a rv32 QEMU virt machine and the user space can get/set
Vector registers normally. I haven't tested it on rv64 yet but it
should be no difference. The patch is not the final version and maybe
I missed some basic ideas. But if everyone agrees with this approach
then I would like to start formalizing and submit the series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
