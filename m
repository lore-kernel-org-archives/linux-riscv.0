Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E106CA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33RzV87H3suSdZD/D2l1/CJfPnaRUfourFBAny/yO1o=; b=ewG6SXxLzwV9I2
	7PPACuaXfRZjjdkSrFGw069QhDIrin4xQnvvVImkoLVEkk943A7Le133Sd3YwwY93hGfVUWKWtE6L
	7uXiCIWcxLYqI94jQH4oC3xj67g/jOsev76gl2n3je1Z4bezZ/wiPaRj9dS2AZKbMF13+lCDkW1OS
	0It/y5mN8Nt3HQ1zqKFZtilf0gVVCTkdTUyrYHfEmEga+6jxvjWVV9j11Ta767RxXXB3uCwBdkX6m
	VEQx+S3AmHFShXqvMRaTzxqcHzLW63pce/bcTJq3iGj1GRPbwz5z4UxMaoItEx0D+gyO+Zi3XXneM
	nHHUYO2BPEmXJr2ILNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1zB-00000000RO1-27jo;
	Tue, 06 Oct 2026 10:01:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1zA-00000000RNn-0wYa
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 10:01:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9A3A402FF;
	Tue,  6 Oct 2026 10:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE4D1F000FF;
	Tue,  6 Oct 2026 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280883;
	bh=2huH6r9hm8xALagr4MmDphaNd66aij25JYGwX2G0xno=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=EjXlPFOEd74s7SqNN+oSaGeOmefuOe332qOu/nDqZZlUKfAUA3QVLbGIgXFrObCqG
	 RknNNTYRhSUrhIuAg/GB4j+A9JMf2oO37IEwQyIyUmKWw8SpIt1FvidPoz/sAGJ4OR
	 wUZ5VTmjgPmI5vh3UEuFYOSp2zzu8Iu0rb4UBfsnCHkv1x4UYqQBBPU+3rCD5VSKO3
	 12AF0vtP/lEdSW/STgRCowN9dUCGhHwsc/kgXjM5YzW2jkcWkVEa3mfVjf9qKfJ+gV
	 QAUI1/0lBd9e4ey+cV9nb6lFXvJeTTC5MmTyR6fwtTcp+BXUE9JmCILEJkWV8Mximr
	 9sITJuaVE3e5w==
Date: Tue, 6 Oct 2026 04:01:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, andybnac@gmail.com, 
    dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    linux-kernel@vger.kernel.org, olof@lixom.net
Subject: Re: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
Message-ID: <25b31a4c-5034-6740-eef1-1c2a60748398@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
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

On Fri, 18 Sep 2026, Andy Chiu wrote:

> This series provide several optimizations targeting system call latency
> regarding vector context management. Before the series, the kernel
> handled user's vector context in an conservative way, where registers
> were null out and VS is tracked as DIRTY. This introduce excess context
> saving and restoring when there is a context swicth.  Also, the kernel
> turned off Vector at the exception entry, making all in-kernel vector
> usecase take the serialization cost, which includes context switch and
> user copies. The cost is not easy to hide as vector code are usually sit
> right after enabling V.
> 
> Since vector register are set to a known state at syscall exit, the
> series set VS to INIT at syscall entry and null out the vector register
> at the exit, skipping unnecessary saves and restores. The series also
> introduce riscv_novstateopt, when unset, enables vector in the kernel
> mode, and do not perform register nulling on the syscall fast path,
> where there is no context switch or kernel-mode vector during the
> syscall.
> 
> With the whole series, nginx request throughput vs base on a four-core
> Ascalon-S, by served page size (* = statistically distinct):
> 
>        86B     1KB     2KB     4KB     8KB     16KB    32KB
>   v5   +0.79%* +1.36%* +2.33%* +2.02%* +0.14%  +0.93%  +2.42%*
>   v6   +0.33%* -0.23%  +2.88%* +2.19%* +1.02%  +1.14%  +1.40%*
> 
> This series depends on [1], which is now queued in the KVM RISC-V tree
> [2]. For those who prefer git, the series is also available at [3].

Thanks.  Given the KVM fixes dependency, it's probably best to wait to 
merge most of these until v7.5.  But I think it's OK to pick up 1, 2, and 
3?  Will queue those for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
