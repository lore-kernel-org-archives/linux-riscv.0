Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D5FC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 11:56:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AFA223DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 11:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47AFA223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wc3TzM51aqROLVNtugC9X6lS6rufCibRwjyijeyDMg8=; b=GulTithFiRdKd63i34zstpddy
	f2Wc3SB9aJMEbYx5RuREu6aJxVH6NGzRHompQTJE18Ab+oH0S2LQZl+xEW4kvYvhoCIpTk6O/9sfG
	JNMhi0BvE9zsghA8JlVURuAHGu9oTm+OCj5uUOtzb8jqV6waTtMrV+J5gBHUATSX2fw2QFO05v/UP
	XeSL4vx3uFS/ZDZlZKjCSJyECRhmnwLGCjRFM3DfBhztnWFUBI5JErbrZ8+whS8PBOknris6edBD+
	EBgIbad74aSjyZjN1RgtS4S0YtWeAEN5kZON8E4snd+a9kPshpY2tbUS4DxBl4uU/rm9HBEQrE0Q7
	D6hE8IDug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1T96-0000Bh-KN; Mon, 18 Jan 2021 11:56:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1T93-0000BI-9T
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 11:56:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2C4C22B40
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610970988;
 bh=JVM80W+fymfbwoI6tay/eFJQL7831mFGf1yuQbfxWvk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kjq5SwyDEHjqwxTRYIP0zNNBr6syJFWWXMyopp2FxWLcZsDI/k5S/dijLPMYnYjB2
 LWOwi+jCgKwxOPgviUcCv9pHCr44pqfAGtP4MCJpuknGLXp/ibGmd2iGlBpNAoEntV
 qz3lxpHxr14i6WJAV6Zm9rq5yZk8pBwR53sWX+Qdku7HeXeToJbdTmkPzH4goFRI6/
 2N+FQQvmGZ+oLiMdfy1HyQu9BxxvvcHj80gzDp1CC98IwiHqW58zghtfCtdezzYQ8F
 v3JWwJ9FPxQtsX9ixQzOsoe4ZgKon5LtgYnWEyd1d9HP3n31/DY1npCsc/E92U1Tyo
 YX2mmoSBXLOCA==
Received: by mail-oo1-f49.google.com with SMTP id x23so4037676oop.1
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 03:56:27 -0800 (PST)
X-Gm-Message-State: AOAM531C5UwHaRbfP3TgdhdL2fk/3y/q7lxAPbCJ7KaWk1HHbib+id6W
 p5CFWwmtmwkapBJZq+FmjPNEIvNlbFuRdAVBmX0=
X-Google-Smtp-Source: ABdhPJxfqdWijgVOnCrL8Z9jbQVL0B2EVdcpBuXAKF0kmQXD1fh/UGblt3pM346jJYlkpzQmCQuX1niqKYgCTqhpvLs=
X-Received: by 2002:a4a:2cc9:: with SMTP id o192mr16937018ooo.66.1610970987256; 
 Mon, 18 Jan 2021 03:56:27 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
In-Reply-To: <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 12:56:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
Message-ID: <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_065629_403825_D2C1D861 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 12:35 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> |#if __WORDSIZE == 32
> |/* Workarounds for generic code needing to handle 64-bit time_t.
> |...
> |/* Fix sysdeps/nptl/lowlevellock-futex.h.  */
> |#define __NR_futex              __NR_futex_time64
>
> a possible solution to fix the build of perf tool on RISCV 32 bit could
> be the following patch to file tools/arch/riscv/include/uapi/asm/unistd.h:
> |+
> |+#ifndef __NR_futex
> |+#define __NR_futex __NR_futex_time64
> |+#endif
>
> What do you think about it? Could it be a correct solution?

No, that would be much worse: __NR_futex must only ever point
to the system call that takes the old timespec argument. If you define
something like this, it breaks applications that try to do the right thing.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
