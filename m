Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59D3C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ui3STai0JirunzruIBbHed3/uYm+xkLEFV2uOPTNOTw=; b=ypM3TM0qXqLIYm
	sgIsGDKK+k3s0yBTCMjDgewQiBTM/fpJLkMizmeg9GgKrQ/f545H91iVvq+UgWyN1hKpWuTHjkU/L
	x8CK6prpcoO6zSVno39p+B4hYwVp1kUnJM/DukcJEbdTwzkQAFW12Gcl/MGdhQdzvje6lkFV7gBBf
	ET+IyPUkdq7Vt+qURRDGwTXBWim2NbATkFJrc5E/dl5NksYyMZWANMQvcjA7DJBRkQIeeVYS3fG3a
	9LC7v9xrt52jxYjDWhDvw2gbFjHqclPbrX1u+M1ZsQQombJ5A5s7H79prrjTzG5wlrKoOC2AHvezL
	4RqT+32GCiR+Ti4cTb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtxT-005pV4-0k;
	Mon, 08 Jan 2024 18:02:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtxP-005pTX-2W
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 18:02:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d3e416f303so4557265ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 10:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704736956; x=1705341756; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KLhyf5sIXfLhdOh02ua5GenSjAf22p09pniZl0gR2xc=;
        b=MFs0W9NsIHxJsPb009YNEyRI+f8wixb22ZzVJEVw4a9y+mH+ThNMJiLGxWfCzqFrMV
         itoZUHl0/daN3zpAQZiucgJaoBYz3Ef8cwZPAPIOc+cuQx8h60j5oysM1YqDVeOuxdZV
         JAxMEmgAXN7Tcc/Tp0b1wTO7dh6z5o/CcEo6m3I4ZULusv0q4AiskmXQ/Xtv/8lblBa/
         Sncoc4CWkNB5WR0/mDM+8RU0edCntYy+PgI+tyVPUwbYsUQbte5iWOzwgeQEZZIqpvll
         jD1+R+dOPhwq3a7gG0+zbl/YkgdfJ98u7hGXWrneUePvNrZTl4lhHR5NbZF371zcf8wN
         XIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704736956; x=1705341756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLhyf5sIXfLhdOh02ua5GenSjAf22p09pniZl0gR2xc=;
        b=tnDIux+JXv696ssoPJ7CYnsw3vbfSj/sx/zjCfAudA5anbhsYjjb1tzKW0Q/AFGFvE
         AHycz5U2BPY4DkLA4rUME+sVEWyXicRdgdYbXDF5JBqHofZ5x1/qweej7xDw9GKKs1gM
         z+NgHxu09ejwt7llv/x5WU/CL6z1YuIdY0W2bMiFp6BL45slkBlpgScc3+no++r4Tnhx
         l/3jXu2zE5k4My7pcY5tXn/O27Sx7tjkwQiXm/w1yo69Cg3k89lWCS+uFO8xFws1/f/T
         Dl0TRUlDQNFcFyejSHRniz0nT5lDd5XpT5jk7vhMI0vAut60F2YDYAE+KkGTS99on02A
         zvJA==
X-Gm-Message-State: AOJu0Yy6S8uC8Czk0aZQXplPYODbqs+vNgnxxfwqBRDy5n8/2odJ4ZIo
	JGe+S+hktNUHqjvoLpjjXqn23/Mdx1uRYg==
X-Google-Smtp-Source: AGHT+IF0KV6ppakYNjF2hnQktuahh7myDZAFD1mLkbcDl8/nMLb6ibIHPCTgpmQPcDHUkw/Qt6ReXg==
X-Received: by 2002:a17:903:1205:b0:1d5:4c70:262f with SMTP id l5-20020a170903120500b001d54c70262fmr692193plh.95.1704736955622;
        Mon, 08 Jan 2024 10:02:35 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:304d:b1a:4fb3:783f])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902768200b001cff9cd5129sm174005pll.298.2024.01.08.10.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:02:35 -0800 (PST)
Date: Mon, 8 Jan 2024 10:02:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Message-ID: <ZZw4uCCahPRbHdfR@ghost>
References: <20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com>
 <20240107-fencei-v4-2-d4cf2fb905d3@rivosinc.com>
 <34f6da8c-1e63-43a5-b9d4-d6865a5d2252@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34f6da8c-1e63-43a5-b9d4-d6865a5d2252@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_100240_019672_A82CA373 
X-CRM114-Status: GOOD (  32.75  )
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

On Sun, Jan 07, 2024 at 11:06:34PM -0800, Randy Dunlap wrote:
> Hi--
> 
> On 1/7/24 22:21, Charlie Jenkins wrote:
> > Provide documentation that explains how to properly do CMODX in riscv.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/arch/riscv/cmodx.rst | 88 ++++++++++++++++++++++++++++++++++++++
> >  Documentation/arch/riscv/index.rst |  1 +
> >  2 files changed, 89 insertions(+)
> > 
> > diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
> > new file mode 100644
> > index 000000000000..71598850e131
> > --- /dev/null
> > +++ b/Documentation/arch/riscv/cmodx.rst
> > @@ -0,0 +1,88 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +==============================================================================
> > +Concurrent Modification and Execution of Instructions (CMODX) for RISC-V Linux
> > +==============================================================================
> > +
> > +CMODX is a programming technique where a program executes instructions that were
> > +modified by the program itself. Instruction storage and the instruction cache
> > +(icache) is not guaranteed to be synchronized on RISC-V hardware. Therefore, the
> 
>             are not
> 
> > +program must enforce its own synchronization with the unprivileged fence.i
> > +instruction.
> > +
> > +However, the default Linux ABI prohibits the use of fence.i in userspace
> > +applications. At any point the scheduler may migrate a task onto a new hart. If
> > +migration occurs after the userspace synchronized the icache and instruction
> > +storage with fence.i, the icache will no longer be clean. This is due to the
> > +behavior of fence.i only affecting the hart that it is called on. Thus, the hart
> > +that the task has been migrated to, may not have synchronized instruction
> 
>                                    to may not
> 
> > +storage and icache.
> > +
> > +There are two ways to solve this problem: use the riscv_flush_icache() syscall,
> > +or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
> > +userspace. The syscall performs a one-off icache flushing operation. The prctl
> > +changes the Linux ABI to allow userspace to emit icache flushing operations.
> > +
> > +1.  prctl() Interface
> > +---------------------
> 
> Why is "1." needed here? or is it?

Not needed, thank you.

- Charlie

> 
> > +
> > +Call prctl() with ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` as the first argument. The
> > +remaining arguments will be delegated to the riscv_set_icache_flush_ctx
> > +function detailed below.
> > +
> > +.. kernel-doc:: arch/riscv/mm/cacheflush.c
> > +	:identifiers: riscv_set_icache_flush_ctx
> > +
> > +Example usage:
> > +
> > +The following files are meant to be compiled and linked with each other. The
> > +modify_instruction() function replaces an add with 0 with an add with one,
> > +causing the instruction sequence in get_value() to change from returning a zero
> > +to returning a one.
> > +
> > +cmodx.c::
> > +
> > +	#include <stdio.h>
> > +	#include <sys/prctl.h>
> > +
> > +	extern int get_value();
> > +	extern void modify_instruction();
> > +
> > +	int main()
> > +	{
> > +		int value = get_value();
> > +		printf("Value before cmodx: %d\n", value);
> > +
> > +		// Call prctl before first fence.i is called inside modify_instruction
> > +		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, 0);
> > +		modify_instruction();
> > +
> > +		value = get_value();
> > +		printf("Value after cmodx: %d\n", value);
> > +		return 0;
> > +	}
> > +
> > +cmodx.S::
> > +
> > +	.option norvc
> > +
> > +	.text
> > +	.global modify_instruction
> > +	modify_instruction:
> > +	lw a0, new_insn
> > +	lui a5,%hi(old_insn)
> > +	sw  a0,%lo(old_insn)(a5)
> > +	fence.i
> > +	ret
> > +
> > +	.section modifiable, "awx"
> > +	.global get_value
> > +	get_value:
> > +	li a0, 0
> > +	old_insn:
> > +	addi a0, a0, 0
> > +	ret
> > +
> > +	.data
> > +	new_insn:
> > +	addi a0, a0, 1
> > diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
> > index 4dab0cb4b900..eecf347ce849 100644
> > --- a/Documentation/arch/riscv/index.rst
> > +++ b/Documentation/arch/riscv/index.rst
> > @@ -13,6 +13,7 @@ RISC-V architecture
> >      patch-acceptance
> >      uabi
> >      vector
> > +    cmodx
> >  
> >      features
> >  
> > 
> 
> Thanks.
> -- 
> #Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
