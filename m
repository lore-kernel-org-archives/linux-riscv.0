Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD788C54E4A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTncHaswVWksWGbM36dYeCJ6UtO3IiQxb4wfDey3yEw=; b=LIwdHDXNfLWSjI
	ou6Eq21bpWz0VRw4N68+/4tHH7G2cdUUBDbCT379AzmsXJRCqEbVHddgK+yf1nifq6YOgCglN1F6H
	HPkTGnz2P5Szq/7XSFiYpOEeF88OMz7x3VwbkOK5BduOKhYwAh/80EcWJlK7gKGzdnibVC0aWra1V
	AqXtYcsZIi21tQmzq40AHjz4uJlsVO9ijkG05qNUSBcGoczswrVsEnbvI2DYDbAtsKaN7z+rZ7j2i
	gYs1EdX9mwDISBPVGcZ1Yeiwq6uCHPkwg6T7M4MUvIa3YYA6J9u5092fWQNaj9+u2nFQtrqhRLjKj
	ECCvoiExkIIpKN1iN4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3y-00000009XQb-0uw9;
	Mon, 04 Mar 2024 15:17:10 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3l-00000009XGA-2xSg
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709565414; bh=n2s+gXwdW2+QjJ47xTyefHF5QVT8S/PZfQcur2EDRe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j3ol+2JoIQBph5BuNY5V5Szf5bJnT0hygqPtwgwqTzSEeBfsGwmZ1QhmsJ4TsZufN
	 msiWhVhaRGvpcCpWM1neuK71sMNtT2Of7m8krmvXUoNlSUWzZW59DxGcU2iIIXP+UL
	 lsBdf62uWj7MM8lV/tI+RlHzkgY2Jfos3Bg0KY84=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 42726AAD; Mon, 04 Mar 2024 23:16:39 +0800
X-QQ-mid: xmsmtpt1709565411tqrwawkx7
Message-ID: <tencent_FE1B7BF85E04C1B5C51D7F707D6204436809@qq.com>
X-QQ-XMAILINFO: MM4ufCTznNl4MMW3F7b3Ci74hjocqi2o1Nihg6PtsJDuuka/8lkKOKSSViFeiX
	 7CE7lvTCYTehIzUI1qKDREa+4CRiyqbM2hu6vcdDoKNG90fQwD5fD9IuSE/HcElo8x+dJMO4p6V+
	 ohW4++CDtyjeFrXNGks2vv/C6JdjmhkR0sDNUig5864OlcvHd17ISrzCJ7YS0MvH4auu11ikjzlH
	 0uJLoRTmf9bC54ZVUoE5Ns0I/pYzGsZtJIvOBT4nln/f9dbt5BmwjFaKVuDbh3+Uy2yPj3dhLOcy
	 d19Gl8pKrZVpmWdPz9ps7HIpLVpPBE5HjLlwOinGpCiD85jTH6e5DZM8hW1SN01V7Se6K2LLpq/e
	 1ObOzq/2MpLp2wm/myhzJEIO9shIOYGN154JQSTNtSPyPUrJWfiBkYhuNNeVABm0QwMY0C5WBA/Q
	 UEGMR9xtdQAJfqSUQNDfn6Yvq4sdS3iwRwZeRKPWQYdJGmjyghNBCKs5OUdb2Gyy+HqrCR7VpOko
	 bmtA9mCdceG2yejcwupzL0Cc3LPaZrDaWjSNBJqBj0x29vyR1K2B1jr8CnPsMj2nT/hVuh7gqnqj
	 eHpSYOB3CzE79/YhM5ICGyFZLdgEQbMqHwwcgnRF7ARUnrz7Q3IevKd5pfNGSM6o2kw2q6UUb00K
	 ln58Uj3kh3Kmly5Mkx1wa30mOXJ4LizjWM/jwjhslVDuLGmAET8J+sFraet7IxX36m316aObQLlJ
	 McIpbrzcz78Us7qfdYWF4btBbks9+6dCXn/9VFc8DnudTgvJ5nvezx1+jZet+4d6z/523WB3ZDha
	 1OP21XZZ8JHKmlkEZ+TnhEi8dYAAzE1oePD2QgcbBUg0KOiEYv4wiTSIUSehUBLwZbGZ3xRqLZik
	 2OPViMecRiBaUnbRLXNQ7FyF4UyYZxFQwuNYiVk1iDTmKkFMdzfyPwy+8LJVd/8Ekj4w5w1A7/bt
	 T2BXRsyrlZj7hqfFGyxntSo4gHtXp7jTy/uxx1RDeYP0AASf5cSVIHwEeduuiC4UDqaV7Gw/Iu0O
	 Hthi81egjBt3C3TfyWGWpoEeSHnrsMhTERTV6pf76lUJ8oSOQV9xQa45OZKzI=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 7/7] riscv: config: enable SOC_CANAAN in defconfig
Date: Mon,  4 Mar 2024 23:16:26 +0800
X-OQ-MSGID: <20240304151626.759150-7-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_071659_176415_F501FCF4 
X-CRM114-Status: UNSURE (   8.31  )
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

Since K230 has been supported, allow SOC_CANAAN to be selected to build dt
and drivers for it in defconfig.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 89a009a580fe..20b557ec28df 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
+CONFIG_SOC_CANAAN=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
