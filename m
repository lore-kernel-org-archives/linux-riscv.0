Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74B2C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kljU/PfPdoF67DpK65Y/Nru6LnkUCjN7e/UEXyns5ng=; b=Z/f7DoMZUPJJaX
	V9sBEdvHcHNUFEe8ff08dL+f0mvNVKnT7SSLGMaNHMRpweeBE3kGyGbn1/He2D/tXQlfqhaMYh08y
	NwZYS/nlp4ISznPT85tOsOAry8882Ox7ZXRxCTMqzQPU56jR+ZtlUI5eUTunPlLsdLl3rKPCwCTFf
	ZRFnwYivw/ea+gnW/M8Vhye4ovUWYQUMO0/NzdkIp64tRszF48lLKjCIVzbOU6GZoCvb0gXY5qJ4r
	eHXdWYEC/M90y5FMrhh5MnxhnQ+s0/+UW0NB0EWpO404KtS5yKEOWhVr7O23qf2N1qc6RpZgKSEC2
	Hvu4GWwqJPMFhDmgQW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZyB-00A47W-2e;
	Thu, 03 Aug 2023 15:10:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZy6-00A41j-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48D1061DFD;
	Thu,  3 Aug 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39847C43391;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691075423;
	bh=rwDIFv77BAjDPgTGsAuvfs6MDAuQX+PvCep8Kuvqk10=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V19xny6v+lTe4Y2krcepgAQFdQhA3wsyYARuV4dC2w8dD9Ni8UjadQje8c/4ouIAd
	 DFKVDlDKVVJxtg8Zwj/1dIjqvyCXa/nrgQQPFyXjJb+uaq8BINYOZ/b3sqTtO2OClQ
	 ApttD0LzIGx7h9uYVJQf4nvSwyFJfk1bqkSrEb+4XZ06H3EQ4GI7gyQ2bcIwlOm7a+
	 D3t0Iupgr3ZdrG/LXBbqzv8Ihu3f9AXxxmneJw1RKHZY+CaAVdZzqEJ0Z5RGJuzQik
	 3Bd+Wq2AbbUtKGXK8EVGoubfNiHuOI2o2iYw84JBPLxeRR5V75A4hs/wIuZeuY1OMg
	 rByjSGNTz/lrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F57EC595C1;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] selftests/riscv: fix potential build failure during the
 "emit_tests" step
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169107542311.19238.11249347839219210996.git-patchwork-notify@kernel.org>
Date: Thu, 03 Aug 2023 15:10:23 +0000
References: <20230712193514.740033-1-jhubbard@nvidia.com>
In-Reply-To: <20230712193514.740033-1-jhubbard@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 aou@eecs.berkeley.edu, alexghiti@rivosinc.com, anders.roxell@linaro.org,
 ajones@ventanamicro.com, andy.chiu@sifive.com, evan@rivosinc.com,
 hughd@google.com, usama.anjum@collabora.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, panqinglin2020@iscas.ac.cn, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081026_833097_2FB2A5C9 
X-CRM114-Status: GOOD (  10.79  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 12 Jul 2023 12:35:14 -0700 you wrote:
> The riscv selftests (which were modeled after the arm64 selftests) are
> improperly declaring the "emit_tests" target to depend upon the "all"
> target. This approach, when combined with commit 9fc96c7c19df
> ("selftests: error out if kernel header files are not yet built"), has
> caused build failures [1] on arm64, and is likely to cause similar
> failures for riscv.
> 
> [...]

Here is the summary with links:
  - selftests/riscv: fix potential build failure during the "emit_tests" step
    https://git.kernel.org/riscv/c/8c82d2bf5944

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
