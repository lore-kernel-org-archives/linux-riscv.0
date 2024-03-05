Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA47C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfXAcabfZlKVKjrPxhvy258YNXoddtXPGIU83RRam4M=; b=azCU1U7VKw4qSU
	w7JOjBaLJxMV1O1Jl/mwR73MJRw/n7f0vCyh5vzUqMCnp3KDwOD1f3smRSd/rKaqmlIyGlpb6zCk4
	YBfPOTah6JTBX8S3MvQcuH/z3vkbw1KDXGLD0093BVzpdv/zI3t2FEb+rLinacyxMlzdLy2LYohNS
	5Idd88kd57zSRbPdtorCGS3y60xtItulVvYtJzOsjGIvUbiidoYAykqjTZJach2cj3fQkZHl90yDq
	PBprpnnKZSFCd3QUFY1hetO+fbK3INWg2VGzS/JXbdahHO23hKO79EP16fV6017uHJ0WZpGXxs4FN
	7qEJYtpqrbaJkQKzZSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0a-0000000F7ZI-40pD;
	Tue, 05 Mar 2024 20:03:28 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0U-0000000F7TP-1iC8
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 20:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709668994; bh=kvuS7K0wl30nwl4M5zznAdLvDfFhfeZr9JFWkFZyoG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IizAeKiJZElcZvRpGUkgHE+zJ7hYWr5C4HA2xC1OY0DtfFv5G5e/M6BQI/3zUU43a
	 RPC28T7QU9iP5Yd8HnYur9Yei2nD3lDRemeHJWsmyUJ8moQcNDjAr5DXP48KIxwos6
	 5oCIHtI7WITFZR/YEfOm/t5ZHFkvD8tyqzMw2qeI=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id C898283; Wed, 06 Mar 2024 04:03:08 +0800
X-QQ-mid: xmsmtpt1709668991t51dbf17e
Message-ID: <tencent_71D182BEDAFB8E18B8A731AD21528D647C08@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85Nocr6fbMh4xTQw3mSzIOZrRGAfu421uLuIFWnEw2MuWI/sjuKaT+
	 eVaLjbMXc0z6hy7cZlDvhhVhMmj7KynZ1YO3uFRRFdGTNQW35W9NoCBf5wx08YqeqFGm+dgt/pgY
	 r7dq+N6ClD9OXPdqNxYDDKYk5anIuyjokGIIt0F0SEkamumhT+lXvvDDjfFFpU3nGlskEivrniZz
	 eOWtxJ8d7sJYOGnzbdTHa/qehRnLh3UutnFPRUMMutzhsw8PkWEWioFI7LEeYLU7Lmr6CBMHblVk
	 Ga03nyjpoVSn2PJc+xFrLSw4wh1KSwXNL+e6Ou9sdVV+inMS1vUby0W9hMIRO6nyZNOKLv9vhbNy
	 HD4IkXgp8P7/bPwCutZ4APOSsGktn9yPMgTs4zWgIBWpRofaWGyIazs3LYVgpjJsatwKNxYh0jGk
	 mJi0tXoJRXmnvS5wsXeu+l1c7inKY4yXHJ38D699t1n9/bu/rk7I67ssYAtfAurRAwJslyuQxyjC
	 /DNyCK0Y3cqmxIt+/5p7102oeIY2I6NpDNcOtoJJoqxjAGspZ0RgcQnseH/rfe9n5Svh/Wg7HSQ5
	 g1z/yzD6ZV2z6pAB4WrAn6il0StW34dfREtdOaTfNilCGy0AwVAULmgydvFtj2/kw1Jtcke9VEYF
	 EsNGytVlV5rVFY4/WYnMWEDJEQB57DpZo56/S+Z7gjVqU7fMIv8v5kvz8eJr+YAy51f4Gw4A9cyv
	 I5vWCGX1aIhOFmr7x0AbQeMZFPfNTv4FFJqkVt7hMOqOswTi5rbpom41c2T5/vQd2nnmK8fTgWdR
	 LfY9nuH+Lao0K4pMpBTJYNn5p4W0dmvMOmKZjI76r3On828EuXrfeonX4LWO7A5JzL35P+7MerJt
	 lfP8wwMkxm0pUtIwl2UanU28lzCIewXzavi2jEAyZkecktmenCTE0g/gkwupbglfoSH1ISmRUZKc
	 QZnhhOhxmRmoAk7YujxEDUCc5fCPTjbObM+yDRE7wYMVQJlMkRUA1NQ73VtcSMakbNiQrCKXvKyq
	 4U7dbtIee4BnaieJvLEFIQA8mC75CynB9lpKBBSvggCS/npp+BQt31T6BoZrFo3ME42iyjZw==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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
	Yangyu Chen <cyy@cyyself.name>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/7] dt-bindings: add Canaan K230 boards compatible strings
Date: Wed,  6 Mar 2024 04:02:57 +0800
X-OQ-MSGID: <20240305200302.1093082-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_120322_872470_CC3AD672 
X-CRM114-Status: UNSURE (   9.28  )
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

Since K230 was released, K210 is no longer the only SoC in the Kendryte
series, so remove the K210 string from the description. Also, add two
boards based on k230 to compatible strings to allow them to be used in the
dt.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..f9854ff43ac6 100644
--- a/Documentation/devicetree/bindings/riscv/canaan.yaml
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Damien Le Moal <dlemoal@kernel.org>
 
 description:
-  Canaan Kendryte K210 SoC-based boards
+  Canaan Kendryte SoC-based boards
 
 properties:
   $nodename:
@@ -42,6 +42,12 @@ properties:
       - items:
           - const: canaan,kendryte-k210
 
+      - items:
+          - enum:
+              - canaan,canmv-k230
+              - canaan,k230-usip-lp3-evb
+          - const: canaan,kendryte-k230
+
 additionalProperties: true
 
 ...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
