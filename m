Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A27C67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVaU08z5HudZrLyUQEqyjYr76s3spH7p5rltj4jCtWw=; b=tiYDiQAr3uxKTb
	tyl976hmmncYdDLQM2zTrlnv89mz2gmjShhCvnbPcYzQwBzXaDAvf//JSRcAf3QC/fgP9c2YahuT5
	2PMU2H28u47Wx3f2N4+KjUDuVnjZVvQ0iInHlA8+aKg++4gYRx1EAAe8hyFlkMSpWS+cdcZssLKXf
	wGR6hs1k6RuPP4kfglSXHETYEJNgCdvllURzuemfcJanTBwjvdLnStPXa22w7Qd7+Kq4AO4W2RFhS
	RrSw5oXrttVHOa7h9+1Ykt37UiQZOpkpwCkY91iJKyq6oO3pbc9nxqTzNAHcGorolPC7G9RaMH/Xe
	XBYRMw7OQVJmJ3hIoE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA2p-0000000Al95-2szX;
	Sat, 06 Apr 2024 17:41:35 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA2m-0000000Al7m-1jya
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 17:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712425287; bh=sxK2uMITViuWCRH/HETWDTh3a/M4c3Sxsj5q2qzVrG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oKCvA3CzhHM/qMTTH1G/HXKvgf7lCXTxJKwgcoAupJrGP//hhNiw+7BeKJ69HIuyL
	 uJkzn+lqmswbRmrjap/OTs1w3IyHZdJSktr8pkXaQDlXNIGCE5+XY15aJbcAWjD06Q
	 TI7ic2EQAbUyRczcLlYwu/KuId0ld5KKX1h/yKYQ=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id A56026E1; Sun, 07 Apr 2024 01:41:22 +0800
X-QQ-mid: xmsmtpt1712425282t6w8mmbmw
Message-ID: <tencent_C30ACE680F3B72E2A6C594843037D6F3B10A@qq.com>
X-QQ-XMAILINFO: MmCmH9jyqHC2lND1K0VVvHxBwX7D9semj1UcUuiGU6laEyG7OxPlSC8N+zJyQj
	 hRpVTm2c8/QDdVIX/tMVtcazHAoM6EYLmXfbus5z+ssi11RnzjlB8xj6dFvda1ao+OdOm7bngNbs
	 epWsj8PkHa+OMsMSUi04ksw4t4qgAo7ZS1DPAQTmGpQfWLlxbAd2VwY+Jc4729MFdKUbNhG1ZirK
	 u+ES+0QobLkaGUhvvp5osPBaIWDBLI+mYsLiw5W0jCIhN7WAjly/HaF5qyY7N8AmODVZfOz4XFye
	 zrTWhsb1miXK5Z73eIKg3cH1jY3RhiKXFwShuQEpMG4EVCc/eiXeelnfLSQx0J6TYnF9CV7dvn08
	 yoowiZGDWIcbSh8DyD6fAKeCw6Kjgoov2ecb7fr0KeGeZsFEAI2J6O3cL+jwNFAtaVsU+0f/qRzT
	 2KPrEXEBNRM/SIRMaHGFFL7pI87QpL4j2G2IbNrM7OOAJCCFgPVb8BdTXhweGYMCkflH2EVR3Rrj
	 b+wvw05+7HRBzsBOkvldgz2MFTMLiiSIhJfIupRvoVgCnYIgszVMyOCvMgsILuEuMF2ILK3F2Tl/
	 diUgBJFunbPf1s/RmuxSmTrVebTkJ5//PS2oIh7X3gukM5yC3Hm+1O0FaWzXNeNg/jQ4P241OaSr
	 z7ZnA3VccWOSbbZo2EZrTvWtDCAU5i8gFo8TYLINs6/ZI+RC/MlwYQs+LuNrQBZI9EsHXLPqecLl
	 4ca5Zo0KpZb2hJliCCUmDDsFVFxg0OVtsvVzkZYDqDAZCO07lDt8VBqbfrBZhHvfJVoCIHn4dihq
	 6+rthkHB0nVesldg7C3xSSkszxaTHgpLbHqAMdg+ydUiBjWr3yR1L88Ofh0mhqJW7tfJhJsdETsB
	 sDkX2PDCAgymMUtM3N7uTuGyQ8LZhv1sKunY1u2MRnpazSui4qPLfZhPU/PsPsXL20fO8ztmoTK5
	 HzcZdw6UboxpVwQo+Y49KxIz6/F8TjHQIVEgJWK46G8Wcm3eMS+S14WAdK/AxkhGFT38Bz1J/9oj
	 9e0bKol9OZJXtSThhu+2ct1z3+JtU=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Sun,  7 Apr 2024 01:41:11 +0800
X-OQ-MSGID: <20240406174116.2945552-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
References: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_104132_790924_E0F3E7FE 
X-CRM114-Status: UNSURE (   6.68  )
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

The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
in Canaan Kendryte K230 SoC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..d067f2a468ee 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - thead,c906
+              - thead,c908
               - thead,c910
               - thead,c920
           - const: riscv
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
