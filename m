Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1A4CD1284
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7ZcxgJMDEcF1ZtQwhuXye85QbL0opjF40NY4HDWyWA=; b=BSdp0PpsH61fjz
	HOeBaGuMu227XUbzi233bi/XpxI5PjFHsXo5C+BTWMBlc5rxqqt40yuGFoiH6c77TEBUw1+PZHGTh
	buluYh1IEjICni+neyf1MLoeLhxw3yARNQ0CHhsffZbcDj/42YdHEpcemYPUNX+FyhqF1NNCYWRJo
	I7+iY7P/WOY1jvVRyTzmQoxEe3m89Ub00F6MzKsxcGulOv618zMf5hbfp2hktCkD5ifF+sJ6+fmJX
	Fy/ZZXThD5f55G+ZNwwD02bZF+2lZwLXAEzN+jB2Cowq3b61bqCU7sXYgeurM5/5gZjj3MyiNIFSq
	Y2FWZBLLjxOIozHNUsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMF-0000000BONX-3LV9;
	Sun, 07 Apr 2024 01:30:07 +0000
Received: from out203-205-251-60.mail.qq.com ([203.205.251.60])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMC-0000000BOLJ-1PeM
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712453400; bh=rcU9GmGkfYObnRvy+6sIXXI4nFg1KITAK23jcYZUxzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cczAhbesSdLhfdmtjEsvjJSBEosBfKVVF3k6rT5FTncar7kNIC8QoU2wSy/W/qO26
	 HbfLZs7BopEx4jn6Rhi0B04kgT+GShlAwVUHXIz+Dbgj+egCPxMDCbZeHyYyDt9sfj
	 EO70nr+20iCGvotnN4JNfocNxPQhWIKr8K43jbME=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 7741FE3D; Sun, 07 Apr 2024 09:29:52 +0800
X-QQ-mid: xmsmtpt1712453397tvn39vr8c
Message-ID: <tencent_A655C73B5CA018F590A0C60ABE034113ED07@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeie4AIX3n0T6n1gmCVIQK/LewveaTQKQp3z+c3jhqvprV+9XRHqVy
	 sv9RGYfQPWhm8EdMBExygLre3yNlJbBcYeOiz2gTaA5/5OYPM5qI8udQdKRcEbgBl17JKqzXsPlB
	 7BeZvWEp9abKkACq0jo1XdqG6uM1YJr9qmcxRD0upWBrsqvhTO6YcWTxPq3i9y4CVh2ikPQLLYH3
	 pmdUO0Sc5wdzVHI7F7wy7g7CKGaFbwlcvy30IqFn39ZLDwKDjBzpZxTq5YseDq9HPAXUHNytK+DE
	 NQfQCrVLu4Txbv6BZD0YJU83iG8KGH8zAfNz4tAyce+Nfn0D+T7HmzPSGDtNYwoM6tG73ZEdQELP
	 0Qdl6JCfbl0TGpJ4hPvCBSWqhUsa1icD5dxOZSYOE5PswDUSnx4YgAV9E3NjofXDv5c4ZC7oDQLG
	 n2VflqKiZIbfErJUaC9oQ7rk8pVtv1jfJEfoVFJFhZacEHjmCUyN2hCdcM7J/oSqtkpnaDbH6i9/
	 67bjmPGa9DwmuPuKXhpQUamTGjf6AQcmYyQm9c1boUD+Yp8r+z14hgsorJl9wI7ifBPW5I26f4Uv
	 Oyne0RGMHRM9mQyLMP+I8X1b+W9Pv6ooiskh/rjpGsFIw3LGNzQi+xYjKs5SEWiFbzGa/oWG9ERm
	 Mgg+HF1uxBbkNjrwpl6ia7jTjD5apBuEIV0Z0t3l20l+YfqqF58plACd3CcnZftyjVbVRb8XjncI
	 FUmmN14fK2+DxWbO/XsgvqeQNcXziOJy6sPu5EGZHIEM9XMsyNzRs3yapa0LNZkGcNyyeM+xmUKt
	 hmqDVLcP4GuNJhJci5buKs81m7h5rbLuk0MjDceFsTXTSEuJt1wkgVtLHKbx8SAP45Ty06EubRrD
	 1g2JiDiHyXAys510xEUYzC7r7cWu6DhiUgKkMoLfT6EWLaF/RKcbHpuAY7lU1maROIeL/m9G71ur
	 6093O2gYs801BYUmGu+KEYavUpf1e9EhdtWbGxLUfffjUIxA11cr2JW6+6F1PIsV+29FCaNRsCcw
	 VjicLySF2wXpBRDSHMG5cz0ruzwu6S+wh4MYYXRqjBgPi741+thXiETooWt/gv+CgkFNJcqfhh0K
	 2QsZEfZNUvq6R1lgQ=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
Subject: [PATCH v8 3/6] dt-bindings: timer: Add Canaan K230 CLINT
Date: Sun,  7 Apr 2024 09:29:41 +0800
X-OQ-MSGID: <20240407012944.2996666-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
References: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_183004_710393_5E3C3551 
X-CRM114-Status: UNSURE (   6.69  )
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

Add compatible string for Canaan K230 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecb..06c67f20ad3c 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
               - thead,th1520-clint
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
