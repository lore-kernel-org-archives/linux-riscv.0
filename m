Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96BBCD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVaU08z5HudZrLyUQEqyjYr76s3spH7p5rltj4jCtWw=; b=UK4XCKpB0RfU5+
	0hUrBqFoPArWNy/CZxWV9MwWL4W/nSdlLJZq9RlOXt/incI9y1lPoZZkemUj7F96rm418bQOVuXaJ
	q0MTxUzLjgO7EUA/eoiV+n8a+zWhkMlkjiM0bsciUhtjhfIwB9x3o+upsdQt3oaye+mHxkflGl6md
	Gy38DBWeB56CfC4J1L5WKO3q/lFPHY+1se19cgbNc+SSkprnf0/qhskuar0IK3pzk+lFmvvNWaUF6
	/tZX1nWKv9AyxgQIMUTT0ctW/vcQ1bacYMAU1eANBggO3C2FyQwa6pXvNPyjlgS3g0uU8rpM4Xe4p
	hmDiGcyBo0R8Cah8lhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVNz-0000000D0rE-1M8D;
	Sun, 07 Apr 2024 16:28:51 +0000
Received: from out203-205-251-72.mail.qq.com ([203.205.251.72])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVNu-0000000D0pl-48kw
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 16:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712507322; bh=sxK2uMITViuWCRH/HETWDTh3a/M4c3Sxsj5q2qzVrG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hnwqhEATw8fnz07DknXAyDTRPZ8Pp2mzcn2dFmsTqLmalxSpmBCY9MbJ7IsEWP3vR
	 jgts84IeDWsLLYzqxheODmmVPk/BbIslcuFsHTEUjAvsEFtv2cx9eJCHmGpwt1Fulw
	 DEHn2PfrPMnNZ3AZ4yBBk4lhXH5d5EwYloMoRagg=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 726A94B5; Mon, 08 Apr 2024 00:28:38 +0800
X-QQ-mid: xmsmtpt1712507318tnhd39v60
Message-ID: <tencent_D0AEA0AC3695230C6E548C6DC843632F5F06@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTF2H89VCD5B5MquUUEi5HN2UvR+mZmWRrk2sUssVu8QvS6kZ7RJ
	 zFrw3scCVIf/ghuubj8+9YuqgIU/r08+2DFdTA+0J8jpQuwbv67FTaPbJePkfGkB8P0nqzg+nz1d
	 tivUeoDBVl8RmRRKaxfGXSVX7b49gij49y2cqVGRxfog6/i/d2qm8Te6mjFjAzx2X6qpknBCV5Z2
	 HCRSfRsPuMIIBEQxaSEbpFJlvjQO+YvGFvGjzCFRAHDby4DzNAx55FKxPGLzUYf8CbhY0IEN8aO+
	 UfX7JtFrEGQSfTqVVCCPokppeYGuzXvCIyYIZuTr4rrfWwTXd9j0vTg+qeYV1Jxgq/tNrhdnsv7o
	 Ip6mjXqdcRr31mo7C7SaWC9ow8mi5CDCX9Jbph3sIQKWhCUj5yiJ6zqqL/sIifhePNkCZztvbbcU
	 cRsTGi9IAMr0K/GRD8FCDPzuWKNGbu2H6IBhfXvyZ+uohd1H42F+PthZnzq/Sgk67WAB/SeGu83N
	 +XBjC2VjnShFIy2qN6YvnOwpnP87zjJZTqfpYKfZezF+upY2Urhyy5pf9k7I+JrlsMl9eZbNHQQA
	 u+gF5HlYWB1holPx5Oyxc8nFN+t5cQYppKOcezbjJKOHAjWEqDJV22lMBiizc5JyWAIeIgak5pJc
	 zklC8x1QW0oZF+KaFrjtkyyt3VWQpoPHoMnrzhAozWHSb7yUMC1qGlpAFkiznqRqn7BWDt1AuwoC
	 wLLZ8zLBCa/zVWmxxYwTvMXTkJK7GmAWYDGjd+z35XNljAONGvs45YZ5/4xdhaluGnZrIiEwJyGW
	 4QmaMLPNb9Vytd6b88fbpNSfGOIQPgYXJQiodFYRXu46xz/fpZwx10FkCn6zLboqxHTNaEfN1Bbx
	 pKYuCxvy+FInj6VtekOIFeR2QmHT0kUstrAFwVpzDoSlkI961OAc4A53l/T9qwlYzivIW/+Jcbp0
	 IPkodqxInigjj2wjySU324ivj1pNOXPU59e1XNMIBwg3X2pT+leCJJUaplhZn6eingyEQxVUOXOC
	 245G3A2viNTnaPdOvNVlyV5Lmja80=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v8 1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Mon,  8 Apr 2024 00:28:30 +0800
X-OQ-MSGID: <20240407162835.3199788-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092847_442201_2EAFDB8D 
X-CRM114-Status: UNSURE (   7.01  )
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
