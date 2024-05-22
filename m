Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5C2C25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRnvH8nSmT2MjPNWoUA0zok3h60e6aVrQBrfYdIZfNI=; b=tdCVMrrAoYTaxY
	mlpaGy6Any0alzSxiMvtKmWboKeGvN0W1Vo00IdWECyLyI3SA1f8SMTq3v5souYniUVQw5XMOtobH
	/Yj6P4BjDcONNAzQChoRWcQ0nA/n18l662T33gJ65l9UFhfZXuLtXuizUWrdOjb3Vk+r7nQqKijYY
	aBJmVeZCE/ATMFw2soTJMg4pJSFl3SVR6iosBUDNRkEJIDC3bDV/tVMQukwcG1gETu6ESttVAO64Y
	lc0iCMypC0ZJC8wwvnY+ZPSE74Z+xMxWaJ8QXyd0q7CZrFqvhlvKGEgZx35NPwwBw1GI3Nl3KgaMr
	K1wr80TtTdUujkF10rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vS4-00000004Rio-3hPm;
	Wed, 22 May 2024 23:32:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRa-00000004RRk-2FKc
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D8A462BC7;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B07E5C4AF0F;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=tosxLgQ5SdcOjgbZkL48MhTf4v8vVX+91AKf+bXS8Yg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lmSKxxId/1JDIS/pIUh39SLARWDNTIraiJv2B8C2tP3dj5k4zGWEWWCRkFPznjxrq
	 D2Oljqkfc2CzhIk4vdu3VYIx13ENJk4soXXsvw0NtddUwDhXYme/eh4U3BOrlHRNYr
	 oSuoKD9vxM5n4S3tHC1HroNYzJr57Q3qrSk8G2nrnp8JK5maIfwL36vdJHaPqLxtEF
	 /cofq7X+/ZZlATsXKU5713282G7aGVSEcLYbOWy/9n9yDhE5VlYMSiY1YljfzyuUYw
	 A9wX0p0BtUAUtxvxbNIKEHG1TAZbUtmFuyb3//u7B8HeieeoGo0LZHJkOsiBAJJaQC
	 Qs7fCErwH6vew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A403CC43619;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: simplify generic vdso installation code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642074366.9409.2372059946348882116.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240429150754.3178262-1-masahiroy@kernel.org>
In-Reply-To: <20240429150754.3178262-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, nathan@kernel.org,
 nicolas@fjasle.eu, palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163226_782554_B0F711E2 
X-CRM114-Status: UNSURE (   7.16  )
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

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue, 30 Apr 2024 00:07:54 +0900 you wrote:
> With commit 4b0bf9a01270 ("riscv: compat_vdso: install compat_vdso.so.dbg
> to /lib/modules/*/vdso/") applied, all debug VDSO files are installed in
> $(MODLIB)/vdso/.
> 
> Simplify the installation rule.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> [...]

Here is the summary with links:
  - kbuild: simplify generic vdso installation code
    https://git.kernel.org/riscv/c/1c369b6c9492

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
