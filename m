Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABDDC83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3fBorAWSlor/KcGL/sjHQH5dC6IBat8bgj5RxIwjmo=; b=GzR9Lh1BYu15MB
	gbSxijJBEY+MdrUslza2G2eM7Wz3FsD13fAoCWuJmnfGmP5CKLyqv3lbDvW+uhSQPTtv20ihtan09
	NKsSMjVulIGat0Fjx8c7Dt4Lr9geldzcrprsm9duCn4s2bzex6LcZsh8PCJQAboARXuUaAw2FtaaA
	6GW0yM1S8ATTte/tLk+ScsRK+evT2DGjHIkHyp+i90U70JxuPKf4cA4ap1ps7hnVxZ6+iJ5Cx3+dw
	5V236ScFAShjdZNu6nF/bQ750VwddwbFDN8JVNYPTAxOeqxKKn5ouvElOPIodia5Rrao0diyhOJ8Y
	tJqJul8vHxVRMeDcJmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqW-00000008LeV-48ii;
	Wed, 02 Jul 2025 12:45:52 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwc2-00000008KUI-0lX9
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751459451; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=8sg3F1xvFGQ55WLtut50r+Q56w4tVb4Lz11K8/MRd6o=;
	b=C6EymCEOp4JWrcFCop95vBdOPNEWIao4gqihjhWouyO1mTx+LIjIW4F0YEIK3t7pYFsXMe+SOLjjPLBlQksVzj/JLqzVDinlui/rQaLqLF5f0WYMyKjJsZ/IwcpuVel+Ki+V5ej/RzyFulRpgdg398VFsaWr2kDIjhzowe47boA=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WgftUI4_1751459444 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Jul 2025 20:30:48 +0800
From: cp0613@linux.alibaba.com
To: yury.norov@gmail.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	cp0613@linux.alibaba.com,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb extension
Date: Wed,  2 Jul 2025 20:30:43 +0800
Message-ID: <20250702123043.1460-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aGQprv3HTplw9r-q@yury>
References: <aGQprv3HTplw9r-q@yury>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_053054_679863_9C34C12E 
X-CRM114-Status: GOOD (  13.63  )
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

On Tue, 1 Jul 2025 14:32:14 -0400, yury.norov@gmail.com wrote:

> > static inline u8 variable_rol8(u8 word, unsigned int shift)
> 
> Now that it has assembler inlines, would it help to add the __pure
> qualifier?

Even if the same parameters are passed in, after comparing the disassembly
with and without the __pure qualifier, it is found that it does not help.

> Please do the following:
> 
> 1. Drop the generic_ror8() and keep only ror/l8()
> 2. Add ror/l16, 34 and 64 tests.
> 3. Adjust the 'loop' so that each subtest will take 1-10 ms on your hw.
> 4. Name the function like test_rorl(), and put it next to the test_fns()
>    in lib/test_bitops.c. Refer the 0a2c6664e56f0 for implementation.
> 5. Prepend the series with the benchmark patch, just as with const-eval
>    one, and report before/after for your series. 
> 
> > > Please find attached a test for compile-time ror/rol evaluation.
> > > Please consider prepending your series with it.
> > 
> > Okay, I'll bring it to the next series.
> 
> Still waiting for bloat-o-meter results.

Ok, in the next series I will provide a patch for the benchmark, and then
prepend the const-eval and benchmark patches, and also provide the results
of the bloat-o-meter.

Thank you very much,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
