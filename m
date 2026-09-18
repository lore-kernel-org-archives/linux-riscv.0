Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A25CC982D2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 02:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AchddCrXnxMrQedWXeAVahVjhm+qdmGpBy1IPmbWLAo=; b=Voo6c1LqdxEgne
	UmxgJPJT5dHIP6bw4U1f+qMx+jERdRYoQzD1lzRMEGLdMX6mcl3IlaE4wZsEbVP37lFkZi4bUqckW
	ZxUGnJJhhrE/1q4hk4RdU1fUQPo2zuadFrrdCj5jKs/rXdZ6NIRp3ggabzItOkIWjVoPzSz7Syy4I
	r4knLQ1q3vte+uGI+R2+wxkMh9GEsp7wQKC41Ma4KLfqU5XJ9V1F2Rja/cSJOU/+IUriq2KRboQ3v
	Y4ts3H7V7qd8raqaUmQ2kUdd4qFwQ9WugqWwX27C0yWbxepSLfNjQ1yLb/QJWbhUpNyA1eX4juZdL
	rikvACL5J1uVvpsU3Qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OWq-0000000DKwX-4AZU;
	Fri, 18 Sep 2026 02:40:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OWp-0000000DKvV-1gzZ
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 02:40:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84EA6600AA;
	Fri, 18 Sep 2026 02:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E32D1F00899;
	Fri, 18 Sep 2026 02:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789699242;
	bh=5IeGjUN7fXw7p9Xz+5Tbudirtuv11NiQpLTAxyNiadk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KQdS4Tk1uWgHQaFv98UNLA8tQ4F7LMlO26PIbaun98U7pnsFLktqyO4rBxIJGDyi7
	 VLJ+4vELWdYbwvUuRn95XFscFcCddNGz7Q9TH6y8TvhBIDAO4v04w+fdEAABZh+5Xg
	 ol5uIEislJNS39VC3A5qrg0dU7zayRb1copPl0FvZrn4yYy9DSIO8/826UikCpcfSH
	 wwuaoa8X9x0SUGyRTu20Rhz4YuLo2BMVV0zHMxXZYZXLjQGeLwZSxXQseUys67CtkE
	 S0JUrGA7gjyyOYVf9Xmm6t4GuJ/QmLwrGjwrjgZ/YV/tpKPmqHWP7+MQ4yW7pica5c
	 6VG2IiVNUzFAQ==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 18 Sep 2026 02:40:15 +0000
Subject: [PATCH 3/3] dts: riscv: spacemit: Add power domain nodes
MIME-Version: 1.0
Message-Id: <20260918-04-k3-pm-support-v1-3-0acd2b36b96f@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
In-Reply-To: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=dlan@kernel.org;
 h=from:subject:message-id; bh=vX1oH9OH1GKzwXjdYNaZSPlTagRimiE4pEJyduCBULA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqrKSYUhRJxzcpB1oSOW2nwIHpBOLxwgymvV4sZ
 Zmsmiq81tqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaqykmBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1xiA/9Fezfv05YmStKUfOLohH7paXlxs9vU1Fs21qaZNxdYpg8xj7+ZH9g1
 HSn0f6zqSa8EkEOZtHAc19ifc0lLKOhMut2cinhP8QkQMr1qH2NS42Y/RifE+x9TJEsEPbvvUi9
 3+0ty1MibOUBI9oTdPSi2XROGHD7ydw2VCPZfBsy/BRHp1p71XEDJn9irkGVUbLUyjy+1DpJp/c
 j8472nDjbNDraMwh3HGUEAjSY3gLnV4KbsQyjGoeEdbVv8zLoky0OUljxqMFwllM14Yefac9q48
 8+Ar6xPGnZjYqFj8TzkzeOjrga06kkeB4JukvLInvhaB6OmOJdEu1MOr6pys9uoSQVuJz2HS2rt
 4+hyu9VvifpnwZbQh3vb9IgDmDkGolyZM6P4Y4jCObu/jy4/bWeJeQD0htZxOKK45W+D2D4Hp6J
 1ZaMYo6oQIZynXMlvXqba4nbhLS4yI3njX7ir0NbGnrYTUtkM4hTmzwSzmgqOa/fC+FaS/N6QTn
 rJzCeJUmZiXRD32e7YvdKoTJpnYMIPFV/ttKewnZI8KYU+i0tE3EBuiXdnnmTAMNtBYsywEojIE
 JuxQ3DhZ7dUKxwH5es1ubSTtnj+Pakis3BCgBPb29EQ7+ruhy8SC/MobRyw3UdWP6RhyPiafKzG
 tYR+Af4YQcKAkO/54KJ3BOmMWGeFHQ=
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

Populate the power domain device tree nodes for K1/K3 SoC.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 6 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..871c913e6fb4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1352,4 +1352,10 @@ emmc: mmc@d4281000 {
 			};
 		};
 	};
+
+	pwrc: power-controller {
+		compatible = "spacemit,k1-power-controller";
+		spacemit,apmu = <&syscon_apmu>;
+		#power-domain-cells = <1>;
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..1bf25a657762 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1306,4 +1306,10 @@ maplic: interrupt-controller@f1800000 {
 			status = "reserved";
 		};
 	};
+
+	pwrc: power-controller {
+		compatible = "spacemit,k3-power-controller";
+		spacemit,apmu = <&syscon_apmu>;
+		#power-domain-cells = <1>;
+	};
 };

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
