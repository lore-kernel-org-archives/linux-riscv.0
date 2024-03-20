Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0DEC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eByH5KXTLhYmRDUOsn/aBMuA8Ig0YQOxtnV32tc8H9Q=; b=LBrVQdDrUWUW2W
	XY1UMS9QLSfyP3eowdunGrVldmgSJuOGuT+24jNeGVsmP0G5Bu5gEQG5dNi4sccX5RiOdSugWfLFQ
	nspLKt1ZP0AglmyUFkGqjGwdCfW0BqC/l+6j3reYDu6YV8Gz5zbTDLT6gNvFj44mJQ0IUye9CnrhC
	NXlXggFwJ4sKtwqBJJWLIU4UJ0b4nHT0/6gbf0ESoe38/knr2KjDpNV/dy3IwxXk07mZqqSWClb2C
	16YfyxnzIqpv5tJOt7IRkawaeGxScLRKO9Q3MXZlXGdshzhxlzdh8u2qUmh5bP6BxHjKg7Z8dyIV1
	ES7F78/57PyVFeRySrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tl-00000000w0q-2ULn;
	Wed, 20 Mar 2024 20:50:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tW-00000000vpo-1uXO
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8ECA2CE1259;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D6D2C43330;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=afP5A0NF+uMzPWLZu45rPVAkiCKsGunwRFG9Ivhk/Ns=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jtvSscKh9OFUqlssM6reOh4z6/tswKTw8PFxCLOFU7zM51ahkQ8u8ByNBsDrIQ7ap
	 oesavW1gUfGtQE2s1xQCajLB6EhPBIEYNQHE7JnHnSahhJ6m4HIxkBf00SwKm39x7i
	 TdOr8qbtePyOEFtc7LDGnAN4Di/ZonialVlbNmSHMsbXqzf1xWMkMSnmS5Pp0Yii6i
	 EdVzdp0fr5ApB6dfYpg6zp9wfvXvRpLkeLtyGTWm1Zr3DmAUa9ITOVTKM5ENiOndfW
	 a4RDn/k9goaaf6FV5eWDn2rmjCEa5ETDPHBHsi7FFlTFlAbsdt7il9l5AuY4mLJGmp
	 L6zr6fw/2tM2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41253D98303;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH riscv/for-next] crypto: riscv - add vector crypto accelerated
 AES-CBC-CTS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783926.6804.7089388626356276369.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240213055442.35954-1-ebiggers@kernel.org>
In-Reply-To: <20240213055442.35954-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-crypto@vger.kernel.org, jerry.shih@sifive.com,
 christoph.muellner@vrull.eu, heiko@sntech.de, phoebe.chen@sifive.com,
 andy.chiu@sifive.com, ardb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135042_717374_4E1FCC17 
X-CRM114-Status: UNSURE (   8.49  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 12 Feb 2024 21:54:42 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add an implementation of cts(cbc(aes)) accelerated using the Zvkned
> RISC-V vector crypto extension.  This is mainly useful for fscrypt,
> where cts(cbc(aes)) is the "default" filenames encryption algorithm.  In
> that use case, typically most messages are short and are block-aligned.
> The CBC-CTS variant implemented is CS3; this is the variant Linux uses.
> 
> [...]

Here is the summary with links:
  - [riscv/for-next] crypto: riscv - add vector crypto accelerated AES-CBC-CTS
    https://git.kernel.org/riscv/c/c70dfa4a2723

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
