Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0B3D0D178
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 22:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2aGYpf7MdMGVAWXLblfnVb95dq/Q+KYv5DdjIj2dx0=; b=DDDMPwyZ9NCpe4
	PTQYXfRIKdWPvBxR35YtWnVi4xa0FEBsagZEitMaTsq7Vk4zD9cz2zWWXE/227p8Kx92fleq+yI+B
	w46A/ct1LOOJGVO+BOYYkplpK/ZQntYaUvzV0O+vmrmVKi9YHdoR3wHRLir9wmM2Z6X5xlz5DVDjm
	CRKMD34kXPxDCgzXjEN9IE8FKKQpBK7AAUzmhQk+3WN5wFH6yIGPl/ySxfQguqEw1IKwkmqzB+pgU
	VvNDAjNGX9sMlVo2jjj/sOBFktAQQpcbk7aA8xJSrAe0qjd6i9QiDMeh14pEW+0qzivIEF2y5TDtD
	dFOgs9wIv3OtTRpmLXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdc9I-0000000FiAz-1V8T;
	Wed, 07 Jan 2026 22:37:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdc9F-0000000FiAU-32tf
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 22:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F078B40129;
	Wed,  7 Jan 2026 22:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69005C4CEF1;
	Wed,  7 Jan 2026 22:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767825420;
	bh=ZUNm8c6aAEtDnspk3VLQ42ha1pnLFLiQPIXXJlqPy4I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VDY1fwm6u8MQKsaFyH1vTxG8WGAUw7O+0HOqcpbfkWMkTIbV7QmGsJCDTVGi4QTI0
	 pJfgOrUmYtkVd2CY77jDWsj/i87LVfgMDe3ZoRQI6nF6zQRD775qMfW746QS4cW0Sc
	 Wx2+KsFNeI1L++4Y0l3/tjlFUi2E/ffTZEA+O3YcfsEwl2ohr1b4kHOT4Gh8/vuiiO
	 fYn1CJ+B4fWlPp6H7gbhE29TW5CJ6wY1dmZYQKpld+VYC0MrJJ3DR3oyroNtbuMYHF
	 1Cp0ezWfclLyCfJoI9Nmy9B+Y4TJ+1koI12Ew1RBaNWvOyGbjzvtWdDusqxoyJmDaH
	 y7YoBF8uhAKPg==
Date: Wed, 7 Jan 2026 15:36:57 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Martin Kaiser <martin@kaiser.cx>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: trace: fix snapshot deadlock with sbi ecall
In-Reply-To: <20251223135043.1336524-1-martin@kaiser.cx>
Message-ID: <e06402bf-a612-4d9c-c5f6-5361826f5fdf@kernel.org>
References: <20251223135043.1336524-1-martin@kaiser.cx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_143701_782963_60E74E5A 
X-CRM114-Status: GOOD (  13.58  )
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

On Tue, 23 Dec 2025, Martin Kaiser wrote:

> If sbi_ecall.c's functions are traceable,
> 
> echo "__sbi_ecall:snapshot" > /sys/kernel/tracing/set_ftrace_filter
> 
> may get the kernel into a deadlock.
> 
> (Functions in sbi_ecall.c are excluded from tracing if
> CONFIG_RISCV_ALTERNATIVE_EARLY is set.)
> 
> __sbi_ecall triggers a snapshot of the ringbuffer. The snapshot code
> raises an IPI interrupt, which results in another call to __sbi_ecall
> and another snapshot...
> 
> All it takes to get into this endless loop is one initial __sbi_ecall.
> On RISC-V systems without SSTC extension, the clock events in
> timer-riscv.c issue periodic sbi ecalls, making the problem easy to
> trigger.
> 
> Always exclude the sbi_ecall.c functions from tracing to fix the
> potential deadlock.
> 
> sbi ecalls can easiliy be logged via trace events, excluding ecall
> functions from function tracing is not a big limitation.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Thanks, queued for v6.19-rc.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
