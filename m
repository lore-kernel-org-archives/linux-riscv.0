Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD80CD1292
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfXAcabfZlKVKjrPxhvy258YNXoddtXPGIU83RRam4M=; b=ZpykU29WTvTVHQ
	kOvAMWnxv4BOakxAqouCVEUhcovbgtoSDFuuo4T2jFX3scU5vB3nwXUtm70ZQwi/Ix6wTIKeCcSkj
	1MJ1FMONIEI/c4X0FBnaUqGH155TlruRRPwzL8ZpX8sY1/AsjS1lbytZfkoA3DpJPf9IWDggMC6ZF
	485FH9zhY2BtQJ9tkW7nz0rO0+3ot33RENTe6nDoJKHxqzE1lzctlJVJcoVcwdmjtqH1e9fTfmDMI
	HnEZZsICLztQUWPAJLfImDa/nTA8ZIvwl/ekdJ7uBAx1F3c9Te5gZnRhM48He2vp3tUCpqafGTRz6
	hwPG0oscNNnyvlQfLdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVO7-0000000D0uK-41IR;
	Sun, 07 Apr 2024 16:28:59 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVO5-0000000D0s9-13Mf
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 16:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712507334; bh=kvuS7K0wl30nwl4M5zznAdLvDfFhfeZr9JFWkFZyoG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mI6SjJEaUKQ5N//GJzIAn1/YNE7CQNcl7DYPK7ZicfPYxCJauOlI+fJhbjXH6Uts9
	 7lhT1vXf7lewFdSrs+mD4dgwl8/SphpO11ci5zBOQ/ucu1yFCzpIn4WL8h3dbpzOq9
	 Vixf8D0ti8NVHkZAlj21njmZ2ldr3cCApW+n75dI=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 726A94B5; Mon, 08 Apr 2024 00:28:38 +0800
X-QQ-mid: xmsmtpt1712507322t25li118q
Message-ID: <tencent_4D85743622F39109466913393EE2F6C5980A@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYSFCBfYc13/eYee6/t1+VQFnXBRNc5Skm+aaWl+3lKK0ti+e0dhX
	 XBsaTfhi8W7XH3op554FblqV+VA0e8v06yPBRLBPj+IIjwOsry+ZuAsOXWHOH7RsPHHkx3Uaob5Y
	 6Sz4ahIdg0CcgR0DMqko9hpivs7T39UXiLAT1Cqa8bIJKWEeHOOAQyL447jpTqGHz7UfK/mwhJ5V
	 O3C520PDa16uv+iJfIHViWe0TiL26dHr4uizsEC7jL0x3es0KeQVLUfLl6s5jWvNK+Xu4F37DcAI
	 AapG+IVhuf7EvQB8ld1HAZGr/OKuTJNSVUi/5aokfhvkbQTSrIFGbtT2j+VYfmR4kk+AbYrB30oP
	 V0kOl9VTmk4yByRmMYGQA3dreUZAbeONzIfy6KdLOfAXyQE7UpCvmQ1uDdRy9rRAywpVWhSRUdeZ
	 5zFjjQVJS6JoSzqSTzfzDP+8Cs5VyYd3nB6osaSPrSg9v9tUp6oaW4eUGIE5FK/Ra95Fd68JltyL
	 G4zx69w7AGwW2rcxNn4XrBXGPPQdS0XGhr1rEFNWKfv6WtWyuBHy4FF21BZZ5v2icMsgRnjW32Pn
	 V3ywvcOFhHTpSjqEq68GNZT83oL6oppnNXH9M69mJMtIjTqPsbJUG58zutR0GnDYgyuO4O75LUdu
	 QHQDG3mig0vQhZxIGavM9yWXY84uSa34RffvnPy8yDizn4+00X1SYiUwlSJ2NkBoUeu6q4FWHnoW
	 aHrpDE9FkwuCE5hUwHCab+PP5iHSbj3k7RfstGgHnICcvIR0M8ecmRfIVm0F3x1QU7gF0fhgHBcC
	 ztVVWDSXTbADbGRRQEzZqbJ5XHhu2tu0NK+n+0nuaLW3PTKMuQuCb0jrGowchVGiwEhbN4oYWXmL
	 ZjN8LpXrcxTiMFk1IkRzx4JVbM9TaGWPFL9HXOr/qcHFu+92Apjhg7ALoxuFHLst7YEIeUTaQ3X5
	 bHUqHCagzFwg+QlveRBbxLLLarwo8V4VQFqtef5879yNREDuPvSH+uDSQ8L78qM4XPojpKCRLUhA
	 ctCQYhGwjQyohmGO5aFcUqdkTh134=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v8 2/6] dt-bindings: add Canaan K230 boards compatible strings
Date: Mon,  8 Apr 2024 00:28:31 +0800
X-OQ-MSGID: <20240407162835.3199788-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092857_695346_0D5C31E0 
X-CRM114-Status: UNSURE (   9.38  )
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
