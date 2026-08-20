Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DA6C5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+yawTqNeJSKK/L0899kKSrh2459sPbMtiQTYNXYGqM=; b=I3yGMCmXP93jvi
	4qArx7LLWax8NIRws+ouM027fkJv8XvTi8q5YD9el/t+WqR/mZmpTGS5GrTh/n53OUVyJRMuzNR31
	ZoQQXSbj0jJYRVHkyI71yLWbtlMkANgWPuVtQUyZEXUxBavbp64AXrqzUSnHgmceXCnLrxbMnDe+6
	wRAUqZUDRJBsMZdDzMKA94cYh7sLLAdbQWlN1IQ+5dSRtFvaybS6k6o71i5RJSD/Ry6j49CHpPNcg
	vNXSAdcVGxLRHEuqaoc856KLBJHaXWYAi2hSWVtUSqg0G+2cToz0R9obZwot/FiD6YJ4aOBzKjo+1
	bj7E7ii6egLOGCg7dC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyBn-0000000B9zk-3e17;
	Thu, 20 Aug 2026 08:31:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyBk-0000000B9yv-2KRi
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 08:31:53 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787214710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u5/EGqV2v+l03AcIOTEACre/7Mg9HbWMfa+eqHZllbw=;
	b=3d5x83jMOxZNFEAVx4xf2SuFPy4UsvGRi+V7ufvvXwgzOMRlxVYr3FSZwhAnlemNLy4LJh
	EhZsOVCcu/GfX+cZsDD4XvoPH04NJaEnnXE8vari1umm/z5E79grj2JTnAsiJNCtqn0am+
	JDXpGG/Vt55whAFlH7oCxPyvXS+PLxaAYzpndpYFVimOJ//G5Dnd1dxnwZD5vl4WRnH9Gs
	bWrDICH7u3iV9/YgUUGD0CM/J4gwvCS0Y3IZjjD1x4Olgxmv7kD/J2jpOk3VHRpmLbkgJe
	T7ZspxwwkYpb1tUJsR/OzAeiNuJFdEdOcVJm/SapHvN1ddj6qyn6EWIobQpnQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787214710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u5/EGqV2v+l03AcIOTEACre/7Mg9HbWMfa+eqHZllbw=;
	b=Z32JNXkXhXOB28Qk15h4uTBtfaYtpQvsA5V6LoesM+oEtap9Cjn9g+9baC/olG4L9DWDQ2
	SX1wDWgm8o+NSGAA==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: word-at-a-time: improve find_zero() for
 !RISCV_ISA_ZBB
In-Reply-To: <20260113122457.27507-2-jszhang@kernel.org>
References: <20260113122457.27507-1-jszhang@kernel.org>
 <20260113122457.27507-2-jszhang@kernel.org>
Date: Thu, 20 Aug 2026 10:31:49 +0200
Message-ID: <87mruh5h1m.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_013152_732157_CB5A5230 
X-CRM114-Status: UNSURE (   4.69  )
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

Jisheng Zhang <jszhang@kernel.org> writes:
> +#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB))
> +#include <asm-generic/word-at-a-time.h>
> +#else

Instead of this #if, would it be better to do

static inline unsigned long find_zero(unsigned long mask)
{
        if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
		return !mask ? 0 : ((__fls(mask) + 1) >> 3);

	return count_masked_bytes(mask);
}

and let compiler's dead code elimination does its job?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
