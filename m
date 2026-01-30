Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B0BE6BF31
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkEuU9TbrU2bUCr56vVlQc+NHXO2mEasJm/ghyRBLAQ=; b=DanTiMuQsE9KQQ
	lJ/76nUDQqJOpKJQ4fjpLw1fs2ucrbr/ZCd2rZcwoSTLeVPz6onRmjcUux3uHBr44ssDFGHYnpEQX
	HrWoSwZ0bLNYAVzwpz6yHpR2c+i5/PD/rRycgXc19HqiBuGKvT/d4c6j4RnKJMxEsKlaFCXwZCafD
	eJoRHVZcNqjqifTmoDZzFy9DESnUA232VHzlFzLkGkwJoEfRfdfjYfhyxXyYGMD3WKK+NxoCXP3kR
	+wbRc9wpT2iVAVC7rRUz654TViDwhupiX2S6OGZs+7UEgQ3clrB1JnuU+H5uZp8TvxkPuYWM/DDgM
	H8wXyH4DK60PUtF+9xvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsPJ-00000001m3c-0Hea;
	Fri, 30 Jan 2026 17:35:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsPI-00000001m35-0T1e
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 218B76001A;
	Fri, 30 Jan 2026 17:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC211C4CEF7;
	Fri, 30 Jan 2026 17:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769794542;
	bh=SaKj55VrR/smiJVBKISLVoRbusDRomzjDLiskxpkDm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfXH9/Uv3HtBEGAGHWNXsF6NHtgm5u8iE0FN9iqCUrIi+p4l/ihsqU1flCKGsbw0Y
	 2DwhAS+FIXF1WmEbkSSOf8KjEtuZnm1m+IRNNChnSOV4BWVRoicxMaWJrkBzQiuXd8
	 EFyg77AcJxsdd4ROjmqBjTF0nzXXDVVAAEYVH8DZyKesGTCDTETkrqvApCpPtAbgkB
	 53vFkyWBftzoI4gkCeRQJcvsJ4L9coMC/WB2E12pF0v07yhyt+gd+xtALdmzc+jfRz
	 6Lx1M/ERkb9W6F5NMgvMiYBncHWKodAdM5odbzExM8KuJYGBGT0yhJus/AXsD0xBrq
	 kcsnYBHoIpybQ==
Date: Fri, 30 Jan 2026 09:35:42 -0800
From: Kees Cook <kees@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, herbert@gondor.apana.org.au,
	samuel.holland@sifive.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
	linusw@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 4/8] lib/string_kunit: add performance benchmark for
 strlen()
Message-ID: <202601300935.1473FDF851@keescook>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <20260130025018.172925-5-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130025018.172925-5-jiangfeng@kylinos.cn>
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

On Fri, Jan 30, 2026 at 10:50:14AM +0800, Feng Jiang wrote:
> Introduce a benchmarking framework to the string_kunit test suite to
> measure the execution efficiency of string functions.
> 
> The implementation is inspired by crc_benchmark(), measuring throughput
> (MB/s) and latency (ns/call) across a range of string lengths. It
> includes a warm-up phase, disables preemption during measurement, and
> uses a fixed seed for reproducible results.
> 
> This framework allows for comparing different implementations (e.g.,
> generic C vs. architecture-optimized assembly) within the KUnit
> environment.
> 
> Initially, provide a benchmark for strlen().
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
