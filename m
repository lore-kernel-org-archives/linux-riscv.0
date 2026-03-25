Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603BFEA839
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ir5Roq72S8eU7WwzLDvGNr0+Js98siaTXF9o8JZZdY4=; b=AcsfLERrURfNt8
	GkX/29vvUUCudyaG0mHdHrwvvPpTqAe/Cy/waWjIegrkXnWSXxx31KktVMnQ/Dc5qig/mdf50rNEl
	Xhuut8dcDG2Mdj8qN8kOyW0yMjN/N/vpZKCvL32LUTQWHDqtzkVfNRoeDmlTrBt7LoW5PseO4t4kP
	vSjOWiVTyF/K/hUZpzo1oqjifMaD5Y8ARIQ6WqheTy28hghLfl34O3D/bgDdQ6DKaY/M2xUXjteBw
	yIERB3gotsQBgXjRJ2Ri/nXGfJtLJfa/k1Nht9zkKEro6pMiOVnReFF17lxddbP5RPgqLeseFwfeN
	PAYY/W7clq+ZQi7u1vug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KsA-000000034lt-3lGq;
	Wed, 25 Mar 2026 09:49:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ks9-000000034lV-2Ljn
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 09:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FF7C60123;
	Wed, 25 Mar 2026 09:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AEFC4AF09;
	Wed, 25 Mar 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774432196;
	bh=1ZsXwm+Op5iFipFI8/QQfKgdrFhLhFWt7blrSXCfKs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LI04H5B4OLjbNI316d113ouXDXc4p2JSeJdUpHnJARvHVgKvVfpzNRzmOUn8yyLNx
	 5LxheBkEl6oOY3bWjhNsstoqbQF745C1PMVfzPLZZwYSDrG5Kw239QZugEVZZZex91
	 kiOfB3l0PZC9pcUl15fAmPTddF0sC3b8gBlmyQGZwh2NQmx8JcJn8eRS+bbQJtlsIr
	 I2FpW25YpLW7KoMYmw4KoPBQfWxRYnbjwbJO5fxb8PSYmTgBSfHJFlg2cL1m4paMPu
	 1KV+RpilqnB5B17iItL9sD5wZZR29myq1eeeRygpdR/461cnPauNW+JiCKBCEBZoXM
	 XdRVwveyxufTA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Mar 2026 09:49:24 +0000
Subject: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
MIME-Version: 1.0
Message-Id: <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
In-Reply-To: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=dlan@kernel.org;
 h=from:subject:message-id; bh=1ZsXwm+Op5iFipFI8/QQfKgdrFhLhFWt7blrSXCfKs4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpw6+3rCUaqYSbMo4VAbPQ2ITNvl+9aS3yUMo0C
 cW5wHMbDheJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCacOvtxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3iZhAAjOZ38CoS0qv87NSSvhiXhL0hrSdfaJnUOhoQaCE0wb5aashLbu0Qz
 0+lGlqMs6+h0JftTW897UReeE9WzVZZJtvq3SqUTDTTyzWEcwDagwI52yKkEsxx38PfUK/1G9Jt
 LS1CXsX81AohVOyr4VU+qqvlhxK853akkpQL/fepK5jg6fuGpHqKf75n5vxaO/RiHRehF8hN7yJ
 maHI0pjWNcuxWGXs8gXjSCeuDf4lHz9r80pcV0X2VEAvcO1hKvnTYkM9oLWYngHTE3rFKPQSQz+
 fHLzL4qOuPoeisYXEh6Ok7dTzwM0j5EyM1llFt23ipu1uYI+GV/k14geBTUM6v/HL+unwxgX6Dg
 M4WxgkWcuZ09VDSXwgHx15OdDgv0hgerU5ftvWyaE5FY+Z+vYCXnYJZVI0h95Phzr6/4E99JCZW
 0sTauJFzrxjqy/JtKD1aIHMPtvDck2okCPy98Gsrnyx59FKYwR6GVn1UNG1uRQx4bG4cu2CBI+0
 M1xYei0Wl6MhVOoFzKzVVD8aWAoJhF6X9Czy1/HaHxgsMjKh1RXkldmOkJkBSAX+mYh3nEW0dui
 OEkFD3EkLk4MAkc2YLqdvvcqlvtodXt+THo7dcq5/wjWsJJgq2JdrVc4p/Xc0WvaWDuPaxq/lCe
 IMW0AeR6ENZ12CivWBT0BM2g3p96ik=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Add a compatible string for the I2C controller found in SpacemiT K3 SoC
which use same I2C IP as K1, so make it fallback to K1 compatible.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index 5896fb120501..8c04c675b25e 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-i2c
+    oneOf:
+      - items:
+          - const: spacemit,k3-i2c
+          - const: spacemit,k1-i2c
+      - const: spacemit,k1-i2c
 
   reg:
     maxItems: 1

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
