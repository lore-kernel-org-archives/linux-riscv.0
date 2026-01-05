Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7F9CD0424
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gbpMdwqQK4P2ikaibhHBKSxRLTv6lxcc0wxUsu+IPo=; b=d/Ua0eiZLrRtM2
	Yu+P4KcBzWPfGmeZYPEMtmgck9lJh1xXsR6uNN/WDg3Xjp2lXfwO9UI8ezelQbB16Qr6P4NeyEozY
	knOyS7emItfirolHRcp46kb3wZZAkJSb1OJ1z6x43m0XKh0uabY9PxWYMBuMgsjLEuKBUMM21rZu1
	9AFOGqzy1rPBf0mGFZzXJLdeSbreCKRGOzZke7Ofox3wpOnLC7RRr1m3DsuokkOF4EN9xdwupRKKq
	+URhbfpfxUfY5SIhc6z9fOE/Jc9I7Pi1DzAaVwiWHgDGbyh7l2CBLMaYPmFojL1oelrjTg9sjO6Os
	VOfMUFy6c7lXhD5030Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXi-0000000CDC5-2j6y;
	Mon, 05 Jan 2026 22:59:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXc-0000000CD63-38MB;
	Mon, 05 Jan 2026 22:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A068403B1;
	Mon,  5 Jan 2026 22:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F616C116D0;
	Mon,  5 Jan 2026 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653952;
	bh=MEkyDErUS6Fel9lwzIrHo9OgWUdBuOYVWyJEsTcqV2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B/e27yM1Uo+eqLH3XgQ5mzZZQgzs5xG8DfsjcQbKX9v+IzN0VMu//p3EiYm7SugTk
	 N4YOnEVUMNX5Z71ZhVhv2OVglKZQjcFb6VQcApg5LpRbnMEXqvSebw9GvmM5LTuy87
	 zG5E251p0BvG/B+EGgGf/5/LA4M5Odom8s088SyCguToJfGF2dJQyHEbwg8HI3eySY
	 JFS1t/Vo1q2JvaTV34z/4ybnN99ilSUSDfHoCznH2bI879hEy+1CL/5jn6nrC4vthr
	 cHZp0bxJz9FdtRNBPuTKlWWly1QVhNwUpm4N8h60Q+D3SU16esUqjFCndwqMhNYXqK
	 DJa+kOKEE0BBA==
From: Will Deacon <will@kernel.org>
To: Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] drivers: perf: use bitmap_empty() where appropriate
Date: Mon,  5 Jan 2026 22:58:30 +0000
Message-ID: <176764558097.1441586.5364156428350110916.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216012004.341288-1-yury.norov@gmail.com>
References: <20251216012004.341288-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145912_810488_DCE401FD 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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

On Mon, 15 Dec 2025 20:20:03 -0500, Yury Norov (NVIDIA) wrote:
> bitmap_empty() is more verbose and efficient, as it stops traversing
> bitmaps as soon as the 1st set bit found.
> 
> Switch perf code to using bitmap_empty() where appropriate, and
> correspondingly use boolean types.
> 
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] drivers: perf: use bitmap_empty() where appropriate
      https://git.kernel.org/will/c/0c7c64146f70

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
