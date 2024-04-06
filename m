Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53392C67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPv5m3XyljSPrl/rYZvfvLGkOiWcHq6oqXSyM1Zr7gQ=; b=GLJvaNvy312KtJ
	cbGQYF50+3MinLyipXLeS5q1HA5Ow6lSiHErGK0VkTOAq+CLSBiMogZ1pCGv13VuJt5Aibv0k5W2o
	0v3OvVC1po0BaCIsKqBulC3N2P9s//rMz2VKQiftJdJ0g1sfoRNxsPwWGyrnjBo2PUN4/SHEjwC8A
	1cV81M/BZHbGoZEy5HH4XMDe02Fp0nf57OhS0sKHqgFthQVSF2llAayd874p/euJTzHPeU8UImRyQ
	3eeemFD/fCi0KyxcrPQxnk14SF604HIzfDLaXNBz4L29mg9XbMzpUb7hN4KJoNLwTCptKOCD6G3SC
	+FAvfFDpcteNcTwCGd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA3G-0000000AlJg-2pd8;
	Sat, 06 Apr 2024 17:42:02 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA3C-0000000AlFT-28fB
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 17:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712425294; bh=jaM56XVEDkeOpfko2CLF+2oPCWKBzRPYG5Ofw5dlTQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=keAgr7lJKF2G10a6C8NtzWdPekl2hAGZ1TZ5lbZd4KPe3J0XSUvLDGbQGKAYVJes0
	 HHEgMwYZyC/fdoGfvr9tf+Qz0YuLu5BPn4Ew2s8skwV/2Hm+6k8oHi6CcHKqC1+tgS
	 PVAcG20HvCZtFRRaS8ItqCkg6D0XU3FTCJ/uBLUM=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id A56026E1; Sun, 07 Apr 2024 01:41:22 +0800
X-QQ-mid: xmsmtpt1712425291t10d8njzm
Message-ID: <tencent_08AD70D16306421E1B27F8400595B4311D09@qq.com>
X-QQ-XMAILINFO: MRw/zKT/0BpPuEAjjYc0zNkwXSefQdsO/pK7morQsdvep4U6aLOUTHdQBe6/iS
	 kv8PoHzgIO2BLqZBIaUs80HJoxts5lfFoIPkfeGq3Q510EJdgedTMCCg0iRq+dfuUDwpApG/fm60
	 VsxFnvoD8cRLXs3ORD7/RjVFxGFtoKlStSQCLOhvnuuoXllSn1GrG6wDsbmVmNTLj9jDIwDWEms1
	 1mRjopi6AoUaLg1GURwEmdEJ9OeHGgLA1OAKO9tqdOM/Z66rHJhvY6uHnq0RKpNwPSCKeMMHYM/D
	 KSqcVVnwpFgxrACcStTJDstPNyFTFM7C27oiZWy/PfOuvCQwIF4vVJ0WlIZkB7/z+VJJq926YQG+
	 fwr9EJBZp+F8ZMoG01NrSjwaLSgwcraJ9DF/EekppzMucOu68qs5AKz10HkuV9U2/8XRdlBcRB8o
	 7vxD+tBps7r7yd1HJmaFTNZYTsXeeeOcmIgU4MVds+qzw1nGkyS1Q0ycp0oG7HNtMuNg6UGMc2ng
	 fykYDpW11XsTCpOEKh0u3xfEKlvrK2vynF4eO8Mu1sRAVyBetoDmk9IKV+2DFByZtDpSE9wHru+V
	 LLThdJ9F4hPCOd5LfrZRAlIWbFD91zqK9V9Dkc2rEOqEM6dHhnu6jw6L2mx8+aWhKI8zlH5frGOv
	 Y+4Lo3r5ePtJsMZucmvhdKaaPLlO7+rTkXko2CPf5gXU/ndu08qti5/A50zSS/4ebY+rWDnenT5i
	 hZwRuou/Ecq5E3s+YoB2EsQTkax8AFtJqUjAbjFLx7VCXR9t7iUI6YQvoO530ovQCe13FIJc2WA1
	 qRYgeTdH0P+8htYZVRzloifC27z6FaEnsXIZMQRf5aBXZQknf4roLYttZjKgy4hW2XeEAEGjMTyT
	 o1KyZvNURaAhOo0W7shDJ2eJNhn4rR4faX/zNDwmzlwERMQs1Ll//CqDlqPmIFZliBUoolGdFVyq
	 eY1pZePZLPHxBlBKaVWv7RHprfMlNl9B6Rkj9cxMe4Hbndk99xv09TjHT9SD2OObL4XSdYizpT+G
	 xSdi8XqyzeHqL7tYfLTpESuH5uWsTSp+QlmEUOSQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 4/6] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Sun,  7 Apr 2024 01:41:14 +0800
X-OQ-MSGID: <20240406174116.2945552-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
References: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_104159_293188_B05CAD4C 
X-CRM114-Status: UNSURE (   6.50  )
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

Add compatible string for Canaan K230 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..122f9b7b3f52 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
