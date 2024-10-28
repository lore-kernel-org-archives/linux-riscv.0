Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6EAD3E2BC
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhBrSbJoNTFhR2DYaVL+ju7aS4xZeklUsShEFlGOzy8=; b=hoYNKPOdCYAS3i
	ADFpNFISTb1w4Aw2gddwZUid7PvPqZO+Z3jeuDixRAhv8X5SeDfKKE3fBcjgVNafeb+zDJMyPKUsu
	1Mhz1pJNsztn8AtFSYy7vPmZr0BAf5tXM6HAUDpHzcLEE7amqBn5a+WHtRnz2nHSJ7tbsx6rUk6bv
	7CHa3RKuOoedeIJg0ujJ9SeLf5SxjQPhkdX+XGXk7TZdp70E0zIfy6e+RIIKnxBjIFWitlkUqF+BR
	DOLw6lf7BpX96bGD+nYI1CeX85DFJZowO4K6CJpaoQ/EIjBELPK3MFzHr6EglLGN9VqheRdysxqTk
	PJZAvPZJAoApuOW4+pRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VeT-0000000C2Mw-2ytA;
	Mon, 28 Oct 2024 19:43:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VV5-0000000C19Y-2Qms
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 19:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A34EA42BA9
	for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 19:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CB0C4CEE9
	for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 19:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730144042;
	bh=vTsHVOS5Z9CU1AwBvLTKf6ZeRz3xBTENRHUHETx7cJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RZ3eH5rtK3PUbMGXsSX0Zxcy+FEu3qigPCYy83PEgGfwZZSOypye5VWSiWKUJk/Kg
	 cXK2zf9D0MgBqdb+jkqvdiaaqr8xBLcDtPA6Cg8ur8AALgmHbbZSmYc/8QSKU7Og7Z
	 4o1ZpCG6HcBy2hk4H9BjFdGi5u/gdYKTTrZJ6D3RDPXA5yPw6NagWMuyC7IjrepDDj
	 pWZF0aRpaxAL/YZPvadQJd+ETzks3DfnhjhXFUhimvrMQT6fwdKK62/JRA3RtEQlry
	 prgGzA8Y0oGXrJEXBWNCUB9f0p3debVEgOTbiyLxo6FXv1HAI+v2bnDUmnPuXerEuR
	 trTq5w7S/dOYQ==
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46094b68e30so35155181cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 12:34:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGlpymVVHCrDj/q06xJHLXdhXsPuM8ob74ROWLJ/qCGfBkj9bzhwYV9gT+BDCVffvxCQNM0C9yI/0zog==@lists.infradead.org
X-Gm-Message-State: AOJu0YydO6LPDqwXDBHqGVGt4cv9Hj+OgccNXfLr5Uc+MBCcWYCT9pFc
	WHFX0yO4+aMxghfqS+maNTuwNDPzHJSVn7DWvytSPc2lVl0xvubMiRX/IxmLRVKZ5ZyWZEmRzZa
	TVK+gnwCEXdbCqkF/q1V0fUKPgrg=
X-Google-Smtp-Source: AGHT+IFU6B9p3xdVINAW6AIIji5ouYdEh1Y6M2wOheTBhLFw1wNUMqZ4bodSbRZGl281Uh+EwN7UF/yNPgZmGCWe8Ss=
X-Received: by 2002:ac8:7e8b:0:b0:461:2b8b:52db with SMTP id
 d75a77b69052e-4613c19d37amr154363271cf.37.1730144041136; Mon, 28 Oct 2024
 12:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <87ldya4nv0.ffs@tglx> <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com>
 <87a5ep4k0n.ffs@tglx> <2b1a96b1-dbc5-40ed-b1b6-2c82d3df9eb2@gmail.com>
 <877c9t43jw.ffs@tglx> <81afb4bf-084b-e061-8ce4-90b76da16256@w6rz.net> <109afaab-05c0-4228-8ea0-1dc1aabe904f@gmail.com>
In-Reply-To: <109afaab-05c0-4228-8ea0-1dc1aabe904f@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Mon, 28 Oct 2024 20:33:50 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNj4d8_Ow1GyA3uX+2f79V8173e9RWfcX6_KjTPfinZCiw@mail.gmail.com>
Message-ID: <CAJ+HfNj4d8_Ow1GyA3uX+2f79V8173e9RWfcX6_KjTPfinZCiw@mail.gmail.com>
Subject: Re: [PATCH] riscv/entry: get correct syscall number from syscall_get_nr()
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Ron Economos <re@w6rz.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>, 
	Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_123403_762917_C5DE8935 
X-CRM114-Status: GOOD (  16.27  )
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

On Mon, 28 Oct 2024 at 17:26, Celeste Liu <coelacanthushex@gmail.com> wrote:
>
>
> On 2024-10-28 08:17, Ron Economos wrote:
> > On 10/27/24 2:52 PM, Thomas Gleixner wrote:
> >> On Mon, Oct 28 2024 at 01:01, Celeste Liu wrote:
> >>> On 2024-10-27 23:56, Thomas Gleixner wrote:
> >>>> Equivalently you need to be able to modify orig_a0 for changing arg0,
> >>>> no?
> >>> Ok.
> >>>
> >>> Greg, could you accept a backport a new API parameter for
> >>> PTRACE_GETREGSET/PTRACE_SETREGSET to 4.19 LTS branch?
> >> Fix the problem properly and put a proper Fixes tag on it and worry
> >> about the backport later.
> >>
> >> Thanks,
> >>
> >>          tglx
> >>
> > I wouldn't worry about backporting to the 4.19 kernel. It's essentially prehistoric for RISC-V. There's no device tree support for any hardware. Also, 4.19 will be going EOL very soon (December 2024).
>
> Ok, I will work on preparing a new patch to add a new set in
> PTRACE_GETREGSET/PTRACE_SETREGSET.

Thanks for working/finding working on this! Looking forward to the patch!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
