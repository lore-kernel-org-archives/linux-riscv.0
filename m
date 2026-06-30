Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E16C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qxdEpm44DamnFbj+IrtRNos2WSg78a+zP6urXrUrAY=; b=lkOOHoxfewyNEL
	+UlAs2t+jRQN2HqMfhds/5KTI24fx+89Vlo6Zhe4GCR5iG/Khd9uw+6i+bDWTT3q5T38iqorXu1c/
	Vu0Kr1npuIAT2Z7/nLDMXL2a7SLnY+b0H7EX0WJS4OYrLV/Ie7B9G8uvHYwdka03jJYpu5Stk1af8
	ORFngouFQKwgDv9nf+lDYO2nZaqK8D/+VkFZLvP1ouYFcxFKIzt8pZsc3nkev/NYeJT87XzGmBU8Z
	OCZ9OReEMZj5bcZvPrxg1MMjfbDwf0Dk7ZU5bJbbs8d2QbxjYWNpdXtKK0XCuElY3cCNIEAg0DrVi
	iOtty+9Yw7kzdEQmNVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXxk-0000000H3ic-2DsA;
	Tue, 30 Jun 2026 12:53:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXxj-0000000H3ht-1VUt
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 12:53:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CA26601DC;
	Tue, 30 Jun 2026 12:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E131F000E9;
	Tue, 30 Jun 2026 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823993;
	bh=XbpRzGPd/1ntY5OxN5hkLLlD5mSljwyCXcdDCBAm+aU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OLnyglxSldNUZol091T0wxb+26ISICSulG0mz2ZMIqjpXRXkmWJDyV8hyZOySlUbg
	 QWn5hIAYaw2Ir4oZM+YqkKAkfVdo7eZDQf3Y2a5uvirqOJrOms8r7g3dUqKqQjltkU
	 yeQ/NgD+nJxMlbBkobqEguaiRNsc2DRt/dV6GdzASCKSWkCetFMXRwUi2L9K5FNKd3
	 KGDK/79aOT85x0TLFxsM7KVEQww7HdGOYgYGt+dhqttyNVnGBB06vRY7z7FXOM0kaA
	 QEdtFBZ4kbexZKdHjS4MvT+3pdjOwzXtQ/MeJqUBREI6q+q/g5/N0mfUUaHEymURDN
	 jRu9sdfbpIQbg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 30 Jun 2026 12:52:46 +0000
Subject: [PATCH 2/3] dt-bindings: soc: spacemit: k3: Add clock ID for UFS
 refclk
MIME-Version: 1.0
Message-Id: <20260630-06-clk-ufs-support-v1-2-cf7521d1d0fe@kernel.org>
References: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
In-Reply-To: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707; i=dlan@kernel.org;
 h=from:subject:message-id; bh=0N8wB9AygfV86ZorVys70rYyjqXDnG7WcMIqzIZbULA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ7wpQtUsn2WvndZxzP2ao2TZfEZVp/46Op6Kh
 hEGKXQUNdmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakO8KRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+33Cg/+IxquelHZIKSNOkIiy0rET64Y+bOST5nLQUR4t6mbvn6ax8FtKurkt
 j3As9zheRpcSSqAxHBiuo1MXJL1FSxMxOAYpcHmWLrkjRcIl7ZGNrlhNpv8hdwXfd8W1UOtNA6P
 IYLN+ohVE51ccQa7YyHRYAdMz+cDp6SEWHIprJMEenFPY8ihoNck4UWjK5oX+A/9hC9ptVplfsh
 OMMdYGVd1bznXTfO4TQ4TMe5I3Wn/r6221pcQHRVRrrVWO2bMlvRlT0Mo5/EEqCpdPWiKLR/U3c
 RIyLy6+hz3qvrWrgEW019kwMrLDTJi0Nxc8+80V41Sqyla7MTLjFVta8Akfxz58SWXdPgIskyS/
 2xVnyDIUh9AsbAPQULp+7SZBJzIaoh5Ew1ho3C0FvPTbAhbBRz+0V6181dHTJZXA7yTRveGIQoo
 q8/twiMXnqHDabXSbHt5yRnIN0Kyzz8epWgH+ZI1VxWc9x9BhuPjR67RzYiDA0+CScmoIEhvnaN
 KeB/FTNd/UavOstPhq+mWg+VGq+d1dq6h7aP+Yi9Q1HLWuom6os2FrbbwIDE3w4Ks3POFfKmLFf
 Uv8Rvqh9puOj6x2HZqvtxxDhAvPcdiEUihQcEguLZE/tP+hnLP3cUolS/qBhO13+KjM+CSDobsL
 1y9M0ZDp/29d2/+M3tCNBA503zye9M=
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

Add clock ID for the UFS refclk clock in SpacemiT K3 SoC.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/dt-bindings/clock/spacemit,k3-clocks.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-bindings/clock/spacemit,k3-clocks.h
index dfae52547cda..69978ab0b29f 100644
--- a/include/dt-bindings/clock/spacemit,k3-clocks.h
+++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
@@ -385,6 +385,7 @@
 #define CLK_APMU_PCIE_PORTC_DBI  91
 #define CLK_APMU_PCIE_PORTD_DBI  92
 #define CLK_APMU_PCIE_PORTE_DBI  93
+#define CLK_APMU_UFS_REFCLK      94
 
 /* DCIU clocks */
 #define CLK_DCIU_HDMA            0

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
