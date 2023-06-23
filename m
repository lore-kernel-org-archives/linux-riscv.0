Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201AAEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 13:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VboEQduc2sqt1QatQH0AMmiZBUwUp0tJpRhXV+YTmTc=; b=4n9K1T3R9fcRuR
	awF/XcEl8SjU1YVRFndbTA0j9CWgG2Z7DmfUq+2NpDaAmc6NUbCpscfrjypN/6ZOr9rr9qyeIj4kq
	HsYHQ9hgsh+37SAuJvHOBQHkERNkrkFbAxcaQ1C/APFC7zF4WuTLlPHZ5va/AynVrG3/e0i2hbww8
	tvJjWOqms4lJT6ZvuMTCiTvkIFb/2wlwg67nyBXs7ZsJfBfqh+Nx06b+kTwXhn2iNjiNsbGUQVwQD
	2khSIuLLFX9i6KbS0QYMS8n43co0Bs/Y8eGPpmaqpBXjz1albr2B4EWsXthxJmTsDpCv6vU9cE8IF
	5+BDgkAGNdjhX0AcKHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCh5q-003ffh-1t;
	Fri, 23 Jun 2023 13:44:54 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCh5m-003fem-2l
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 13:44:52 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1ED08536;
	Fri, 23 Jun 2023 13:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1ED08536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1687527884; bh=0VYk5thHtjT5xHEhK0kF75qNfppi8BiOgDVpWrdH7Kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WuljwBrLb3q7v9KVJXxZR3j9zD5T0xsQlCD1seXm4QydwyuxlAuACqMaGjsYwAIa7
	 8f/aUpwZ8DkY5Alhd8cJpFol3jtHmEsQT8bNuN9VAu13oqQXWyjRaWw5HRzq5L47Wt
	 GaflwEdwsc+MjeNfJrTmfTbpd4qhezTNyf2Ri3QuNVK5QVyvd5XlrJHutS9Ec3E6JB
	 CHOakbuHy6REm+gWaxhiCGzzMl5z8n4O/CEFP/qqcKqqP4HYAJzBEfVohRqFsSYdem
	 Oeooau0Fy2Csa+YX2CpbNWHmBplbrmsmeA+1Do5Sqr2bmj50hzrkC5LC20TTO7fpGd
	 D0ACXh5IXjgYQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Song Shuai
 <songshuaishuai@tinylab.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt
 <palmer@rivosinc.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
In-Reply-To: <20230623095547.51881-2-alexghiti@rivosinc.com>
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
 <20230623095547.51881-2-alexghiti@rivosinc.com>
Date: Fri, 23 Jun 2023 07:44:43 -0600
Message-ID: <87o7l6mgxg.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_064450_903415_4FEFFAA8 
X-CRM114-Status: GOOD (  11.38  )
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

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> This document describes the constraints and requirements of the early
> boot process in a RISC-V kernel.

Some quick comments...

> +The RISC-V kernel expects:
> +
> +  * `$a0` to contain the hartid of the current core.
> +  * `$a1` to contain the address of the devicetree in memory.

Single `backtick` quotes are probably not doing what you want.  If
you're looking for it to render in a monospace font, use ``double``
quotes instead.  But I'd also encourage you to keep that to a minimum to
avoid overly cluttering the plain-text document.

[...]

> +Virtual mapping installation
> +----------------------------
> +
> +The installation of the virtual mapping is done in 2 steps in the RISC-V kernel:
> +
> +1. :c:func:`setup_vm` installs a temporary kernel mapping in

Please don't use :c:func:.  If you just write setup_vm(), all the right
magic will happen.

> +   :c:var:`early_pg_dir` which allows discovery of the system memory. Only the

We also really just don't use :c:var: at all.  Kerneldoc doesn't
currently know about global variables...perhaps it should but that's not
the way of things now.

Thanks,

jon


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
