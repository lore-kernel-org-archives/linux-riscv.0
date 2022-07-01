Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBCDC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C41MyVmRTTLjhuR6t8toW4Ry7AUWtMGlxY9G77ROz4Q=; b=qCVsjxdjSX5VCa
	GCDvH8xRuAQTFp4hd0/YzEvRj/DKaFU8eXER67YDsaG8mKV/EVDLGul0KwuzNUIODbt/GHD3CVpOB
	YPtDJ0bqMB2ss3RR50N5mtpk1s9ZrFTozeX7AnPy2EaMelPwOxNV1LgctJhip3hjU4eyD3535a7RW
	YbGt0Oxq1J++he8VaL+Fq/CRQGZv7If1tTs9Rt1nj4+hx8Ac3WHOOf7c6xeISSSTiz6txkxm6R95M
	yfYtiP9ZJ+/fpUoXNpIxVTZF9OsjySLCVvSSFp9UJsuYGc+Hv3P+X3loN0XDs/DbjnxzOB4Q6tyLc
	dK6L4tABi5ZjM293XjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Imo-005l6p-Pj; Fri, 01 Jul 2022 15:42:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7ImH-005ktQ-T6; Fri, 01 Jul 2022 15:41:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E6A7B830A0;
	Fri,  1 Jul 2022 15:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B666CC341C7;
	Fri,  1 Jul 2022 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656690111;
	bh=ODroCSaMiCiiMuCAo/Z3iSOvHvZXIuLHPYKFNrg/KRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HiQ687KcF2DpmTocqn+IqFonoM2D1Iv9qoOOYzswDiwDl8kIZ2Z0qlI0/rhSTau4E
	 3NSpFKO6D400f0ml/7ooOyUGCByYYT+YhJkydmYqWcdsZVCgaZyENhgu/3ia78y1dA
	 iupUxZqsKuD5IxxerfCRctAPN6rlzunZ45REOCH40ehUKHtZqwoY1wU3Tw8tGwoxrq
	 bse6g9NBDfLrf9wgVop19aWpzHH1s7wARLooYxLJqzSbnEopXMrGf6Y1Csttwn6GRo
	 aBmHHJm/+DC3rpDQrb7dTqMrxC6c2FPPpw/RfoOuZiNhDzB5pqFluAfLcQUR1oorY6
	 gTJldSwi7SSFA==
From: Will Deacon <will@kernel.org>
To: linux-trace-devel@vger.kernel.org,
	Francis Laniel <flaniel@linux.microsoft.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Collingbourne <pcc@google.com>,
	Mark Brown <broonie@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel Kiss <daniel.kiss@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 0/1] Remove forget_syscall() from start_thread_common()
Date: Fri,  1 Jul 2022 16:41:28 +0100
Message-Id: <165667517849.792239.13818767623596011011.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220608162447.666494-1-flaniel@linux.microsoft.com>
References: <20220608162447.666494-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_084154_118308_0956DA78 
X-CRM114-Status: GOOD (  11.75  )
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

On Wed, 8 Jun 2022 17:24:45 +0100, Francis Laniel wrote:
> First, I hope you are fine and the same for your relatives.
> 
> With this contribution, I enabled using syscalls:sys_exit_execve and
> syscalls:sys_exit_execveat as tracepoints on arm64.
> Indeed, before this contribution, the above tracepoint would not print their
> information as syscall number was set to -1 by calling forget_syscall().
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Do not forget syscall when starting a new thread.
      https://git.kernel.org/arm64/c/de6921856f99

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
