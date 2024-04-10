Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F0ECD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPmi7NEyYXxlgGFNRxQjRgaHZfYPcO4zznyBreZ/zas=; b=zBs1LKGqZFLWxk
	8bjCWQZCHd3clnE463n/yRxnASBgt/JuRIL4iBfc0nlsIkPahtiZENF+mQo9gp7R2PuP/zwGuxXUz
	CMLQlGI/gtImHhqH+MVPH7c+q2JgFBXKqonAG8RHWY3HmN58iUj70bslxkxByCs7iVjN++rFrkVME
	VLfEdvgb6Cr/vLdWfVa7+NQcgB72vqjCxc5i3oi99TRBQbVKNEuZfy9SZonoy7heglgKgl+ZcjoFu
	OKtv5VW9tgrD5eBM5mw4yuwq5PXZbJkWyxXlYH6G2SegtWGcbFZe1o9lDAcg+quSSa9i9A0/KOb2D
	sSecB3v61aVhY4eQh1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVRS-00000006TFH-2UHl;
	Wed, 10 Apr 2024 10:44:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVRO-00000006TCL-1R8V
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 10:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A17FACE272E;
	Wed, 10 Apr 2024 10:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2755C433C7;
	Wed, 10 Apr 2024 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712745866;
	bh=fYk3nBBGlFBQJPElvPTH64JaR+If9kx9CukBMxWQFGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q7YDymAQJVozwyQzPzc9SZxfU/W9u3a7s8WiiV6mZiu3zXuqOoE/3ara3RdQ5peMM
	 C2EGfoCI7fuXbW3RiacPSSDVFwQYjnYoPOUfgVVx71PfNpo3nx+lsZPdtDMvx3XuMs
	 b9VlyBJvUVioJKv4eG0FEJW7cYrXtsGA2GCCAWcXgSaN9CCNvB2XAVoj8YxtICxol4
	 OKwJYvk2Pr0mZbYFr4w2s5uBs3y7fefvN1hJ3chssnzXmAQHhDNhmJl+8j/qghkiCU
	 2HybU8SSrz3xoQfzo3F9d0HTmJw0D7v7Q84IpPXGNgquiWF2PDTgjrxcYjJ426N7gr
	 nn1wROlWURCIA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: drop SOC_MICROCHIP_POLARFIRE for ARCH_MICROCHIP
Date: Wed, 10 Apr 2024 11:44:16 +0100
Message-ID: <20240410-ungreased-boxlike-0320ceca8b75@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305-fled-undrilled-41dc0c46bb29@spud>
References: <20240305-fled-undrilled-41dc0c46bb29@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=626; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yZUChBQdk1aSe2qT7yxOp2VJrbn9RBukfIadlOPY69Y=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGliuQ05u3wXfjF8OfvbrbTDOX7S50t1szbenLDdW9Srq 27xu4kWHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIhjkMf/jvXZm0Q8M+piX8 7YFY2asPvC4dPHfEdL3qwofz7ohnBf1l+CuT8kxHZSE7c9I7yz28vC2JJUt0Dy00+nPD6Z7xrfs X2DgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_034430_607965_440BECAB 
X-CRM114-Status: UNSURE (   7.59  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 05 Mar 2024 19:20:28 +0000, Conor Dooley wrote:
> SOC_MICROCHIP_POLARFIRE doesn't have any remaining in-kernel users, so
> time has come to remove it. Foolish auld me left the "POLARFIRE" in the
> new, hidden, config option when I renamed it and changed all of the
> users however. As HPSC has been announced, and is not a PolarFire,
> drop mention of that specific FPGA family from the new user-visible
> config option.
> 
> [...]

Applied to riscv-soc-for-next, thanks!

[1/1] RISC-V: drop SOC_MICROCHIP_POLARFIRE for ARCH_MICROCHIP
      https://git.kernel.org/conor/c/37c09ed41925

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
