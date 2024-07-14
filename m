Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4048CC3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 12:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jn/yY5RW3SRnascbAkvjWV9ypwBflybQLVomEb2swLo=; b=Gs45MYruPEmCAT
	2gc0AnmOxZGlq7RhDfWB8tolTRZgL5fRRl/dUjdW+1FFwS4jqVbFMw5wjmWmEjN71Xump2Yp/LrO9
	FOURAtubhAb+/OT0t7ipQW0mzZXJteW86FNKsBl11kI8/eIT3PmcVxaFYdqJqgHf7RtXwnKZcFqUX
	DzyW/eLzpl754lhHToyMTO86wIWCkeNsss24rHXiB/VHuqBPCjk+Co+iioLk4SgEqEKOAI3fuHHUZ
	8QaEf1dF2HZ89U6bapqy9AVaN21FSHuxUyvIIul2j2Orcv05fDFgT2+DgKhWM1MY2AWtTsljqBiOH
	KHJgC+MLPzgyg5/w1UFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSy7M-00000004Opt-01Bn;
	Sun, 14 Jul 2024 12:14:16 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSy71-00000004Ol6-2WrW;
	Sun, 14 Jul 2024 12:13:57 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 42C4038A399D;
	Sun, 14 Jul 2024 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1720959232; bh=gAoILYv37xkB5P91uGQmdeyt0K2wQQvTn3nam4BAk54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YWKv6Mtr6HpRcKQbX922yleEE6km7IxjhqiYboH8P/kASFz1cXbjvIMTkQbazsWs1
	 oPM54b8eTIzxvy5NDhiEk33O0ZMKR6KniSSb/knNc4EXongbqa93x1swoaRumYLzrr
	 t6UUVjWqgkf+A1niskGt6Ms3Vt0ATuZzPM0EItDCttRPj9WGxrbWlpcs07XUBt49Zb
	 pmze7bJfXINVZmUg56dJB3/bFxtCkp2BS+2hsIvy3T2afItMejuoxLrQ0JhCHahCpq
	 FdxC/AivuJWLee+JlWphV3lVk0hIsjWtFSYennQtttJd1iUdvc9Mce/hGBf9OQAjTX
	 xmjOYl6R3knzZeLiUln3zX262S/F2kwVfg4xt034dvoCxsy0F4w2NRMgTxDH1+XdyF
	 izejiMc1lIxk67tFFsCWL0pe1vMmS2nLmsqFV+PScnCHHc9+ztVj7l4QZYhP60IHQS
	 1yBHuO1rer+MbOAiaxVQlvvcfH3bpapCMoAJfiNjPBJwUb2WmHPZRkwPLqJJW0vY7a
	 BS2clvoeza5tH7T8P2RpY4LwzNgWhut4/EhNkB+HD7jSNJvCuQwv/IFYjKDmUgTrG/
	 LSotwgfKXXMZtTqXh/ygoTpS6lZEEmfLepet0VkHLd8Jtvx37yYfy8Qhb3mkaCFh1Q
	 vQpBC9nvU7w4xCXZFGpbeuXc=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FBxerkmRPHKp; Sun, 14 Jul 2024 12:13:10 +0000 (UTC)
Received: from xtex (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 14 Jul 2024 12:13:10 +0000 (UTC)
From: xtex <xtex@envs.net>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not exist
Date: Sun, 14 Jul 2024 20:12:58 +0800
Message-ID: <2146419.9o76ZdvQCi@xtex>
In-Reply-To: <20240714085751.176357-3-xtex@envs.net>
References: <20240714085751.176357-1-xtex@envs.net>
 <20240714085751.176357-3-xtex@envs.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_051355_811183_7265E5ED 
X-CRM114-Status: UNSURE (   5.47  )
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

Reviewed-by: Nicolas Schier <nicolas@jasle.eu>
Link: https://lore.kernel.org/linux-riscv/Zcfp8fn7o74K08g0@fjasle.eu/




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
