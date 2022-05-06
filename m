Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53AEC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpk0CaILwSpdAYnLIGEVJ5dBtFFJBDcLk4sBux9IJoQ=; b=asFoDrU2/J2eR9
	Qq5kFc011Ymz/raQ4eW/Yx9B3VMXlvP3orZvaCElkyWWO8Wi2g6LNBjTGE/+IZE03I1abZohgMOdx
	MwBnB9qa8meJQ4A0oF41HSWET9APX86/jKstGuF3UYAlRS6RxOycd0qyCLjI9GfrcuwBCAXqoTrzM
	xEG6EfoJOb61zVS0tXO8YngTWsv8VKluo/TCLUwX36JfHA/R4ZtTh0ob1oT426F3yE0jMZQt6k3ym
	YYvuSEs703mZLrQSv9mExEJillMYM3RkNn2I5cFLhVq23mN/quwTAZPeJfuN29Q9WoHyKnBU6TgPy
	KMb2RkvAwf/VS5tIrAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn5kp-005AAm-Ap; Fri, 06 May 2022 21:44:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn5km-005AAO-Ls
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 21:44:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id j6so16703514ejc.13
 for <linux-riscv@lists.infradead.org>; Fri, 06 May 2022 14:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3A1rf/Rj0PDegZIBfqZUEZZbtuVQj5afQJ+DdGLJXY=;
 b=qIRoPoyIi9YUs2nECEBig8BQu3212ApJ192x/PT3kMGoYGdOdLgi4i/CpRitLS2c5Q
 tR8aBD/U8y02V1Do3uwlRPKXizYTv0uL7qWSMEvP5UO3yhPCR6vYjRHr+gi32YQE415O
 cTgbnS3ikd6RrO+hPDJc3+zcDE0Vtk/E+l5qf2hKFV+xpAAKmpcyHbmMplqWRjSIt3mb
 aldH2gdqvT0FDDBx4XJYO6M3Szu3ig6UabTifk/hdSr8FRF5PeRgnUdgpF3B3i0jjhEt
 jsxFTcGvFJtcYxIic4jEtB7hX3mtnva63X2s7cOyBCrMHiCOwDw4A99hJx/2KR7aemGd
 OlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3A1rf/Rj0PDegZIBfqZUEZZbtuVQj5afQJ+DdGLJXY=;
 b=h2/bOcDfBNh5E5HohTyfuhTDnJhWag2pSmeF8lVgkPZ4rqs44XKEw2kPXH3hmKbSRY
 JYcFiA3RGUJ8/cvKMbG6ZyufZlqFZbUUIuivK3O0cGM3Y70In4StsAvQcQ94Rhuh7Rum
 LzFvz3qnCUXVxty77lJp8pSWN35TDncFsP4rCVO5NJJm7njxFFXZGbKBbKA4hGoyDADG
 /Zft3EP3vH51ziDkk2afctEPvjbw8Mm8xTqvdFW3i8beRvNl4YmUsXHGVC54w7/CPUvy
 UkTPnQh1jBqM4DtvvxIiPtRW9nsQABwXqw05MpQlGZp7rIKu8R2eTyW6PhQTx1lWgzwh
 4TfA==
X-Gm-Message-State: AOAM530UiQcBki6q3tdMhqSOVeZYYxOS3YNjN8xqck8X3Xnxmlg45cJ+
 jsBok5Q1YtANlJ2w2wxXezCQLXBFTxpZlrt5AygI7ebC
X-Google-Smtp-Source: ABdhPJxKnXTPN1rE0ELs3y3hDsepy+hk9ObUJpCYg5aHeKL8ddu3x4IdwKD6k5cRrp+Yu12tRGxgzdfBai7wdCKbXO4=
X-Received: by 2002:a17:907:6d9d:b0:6da:7d4c:287f with SMTP id
 sb29-20020a1709076d9d00b006da7d4c287fmr4633735ejc.741.1651873485631; Fri, 06
 May 2022 14:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220429014240.3434866-1-pulehui@huawei.com>
 <20220429014240.3434866-3-pulehui@huawei.com>
In-Reply-To: <20220429014240.3434866-3-pulehui@huawei.com>
From: Luke Nelson <luke.r.nels@gmail.com>
Date: Fri, 6 May 2022 14:44:34 -0700
Message-ID: <CAB-e3NRn9VgdWfakom6Cbx-3btakEzvpNVmiQw7k-h_-EtOMng@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] riscv,
 bpf: Support riscv jit to provide bpf_line_info
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Networking <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_144448_777241_B9D356CD 
X-CRM114-Status: GOOD (  22.62  )
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

Thanks for the patch! I have a couple of notes written down below.

> +               ctx->prologue_offset = ctx->ninsns;
> ...
> +               prologue_len = ctx->epilogue_offset - ctx->prologue_offset;
> +               for (i = 0; i < prog->len; i++)
> +                       ctx->offset[i] = ninsns_rvoff(prologue_len + ctx->offset[i]);

The logic looks correct to me; my only nit is that the name
prologue_offset might be a bit confusing. The prologue is always at
the beginning of the final JITed program, it just happens to be that
the prologue is emitted "out of order" on the initial/internal passes
that compute offsets.

What prologue_offset really measures in your code is the length of the
body of the JITed program. What do you think about renaming
prologue_offset to something like body_len? Then the line to compute
prologue_len becomes:

        prologue_len = ctx->epilogue_offset - ctx->body_len;

This version makes more sense to me why it's correct. Curious what you think.


> +               bpf_prog_fill_jited_linfo(prog, ctx->offset);

Here's a quote from the comment that documents
bpf_prog_fill_jited_linfo in kernel/bpf/core.c:

/* The jit engine is responsible to provide an array
 * for insn_off to the jited_off mapping (insn_to_jit_off).
...
 * jited_off is the byte off to the last byte of the jited insn.

This comment says that ctx->offset (passed to this function as
insn_to_jit_off) should map each instruction to the offset of the last
byte of the JITed instructions, but as I understand it your patch sets
ctx->offset[i] to be the offset _one past_ the last byte of the JITed
instructions (i.e., the first byte of the next instruction). I'm not
sure if this is a bug in your code, in this comment, or in my
understanding :)

As a concrete example, suppose the BPF instruction at index 0 compiles
to 2 (non-compressed) RISC-V instructions, or 8 bytes. Then
ctx->offset[0] will be 2 after the initial JIT passes, and your code
would update ctx->offset[0] to be 4*prologue_len + 8. This offset
corresponds to the first byte of insns[1], not the last byte of
insn[0], which would be 4*prologue_len + 7.

My guess would be that the comment is out of date and your code is
doing the correct thing, since it seems in line with what other JITs
are doing. If that's the case, maybe we can consider updating that
comment at some point. I'm curious if the tests you ran would break if
you changed your code to match what the comment says (i.e.,
subtracting 1 byte from each element in ctx->offset before passing to
bpf_prog_fill_jited_linfo).


> ./test_progs -a btf
> #19 btf:OK
> Summary: 1/215 PASSED, 0 SKIPPED, 0 FAILED

Last, did you have a chance to run any of the other tests with your
change (e.g., test_verifier, test_bpf.ko, other tests in test_progs)?
I don't expect this change to break any tests, but may as well run
them if it's easy enough just to be sure.


Thanks!
- Luke

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
