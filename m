Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD74C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 20:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PA6CvT1kOEA8pS2Kw13OfIsJmfJ4eSzB8VwmyqrHPnA=; b=FcIu1Hi2RM3jm7
	QiSqTmT/kyi4jtQiu12CpP4pmAhuAFhb03/JO+qq21PvAXCboc0ZRkgab6klbK/lsPJZxRGexnYOF
	bKZyS98qpJJWjYuy6mKEaMUe+nQ01Q001jSLCAQvMLUOiSEE+pDRbIPRxp/cJ5EmtYoZVuraoJV1G
	tJ2YTBrrD9tpnSYGGa0nscASpETOPacOlCLs9YM2lNv7JvAtNplrogSDrGOP/Reg36xOwFGtD+ebK
	PMmKGpWWUFj3iwvvNm1dJDyXETqDeONLodyYuwe0he0U5BsHjU1P8QV5HrjmUoq+LM7o7tKAg893X
	bYWtsWPXnNzKYSW99jow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yHK-0000000BlBi-3qHQ;
	Thu, 10 Apr 2025 20:13:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yHI-0000000BlAl-39Kh
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 20:13:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEF034A176;
	Thu, 10 Apr 2025 20:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC21C4CEDD;
	Thu, 10 Apr 2025 20:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744316014;
	bh=GQ4zHuoKiT6zvG2cAO/4sT+VU9Lu8wKigAx85jxf5uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bO8pX7T06FpODXvjM1UuaGSk9y8gHMS96GfkQ6TOVVpQSrtwy/50jz10LS550bDiv
	 agdwbADdS8SciIuWA5YLInOxwJvQAqvOOG+Eka2H1TVsyeiUX3+p2IY+13nzQw2lyi
	 ldP7d/7dqTKTNwNXYdal3hxMGVxCYliBZbwwWqqUyXujLzJbbmCP5EMysnvPJe1buQ
	 bAP5zHfMESVlWCySZXnh0XVnboWKTXBngE4irU7QwqwsYpif9urA1+k3+0w4fTtscq
	 Jom/8I4gpXN2NdN591I/J1JB3Bdypodwd04L8A+8eFFeSipovdpsdO0zQ1i/udLZ2n
	 BszFoSTj8gmDQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: Remove obsolete numa.txt
Date: Thu, 10 Apr 2025 15:13:23 -0500
Message-ID: <20250410201325.962203-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250410201325.962203-1-robh@kernel.org>
References: <20250410201325.962203-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_131336_844558_29B85A14 
X-CRM114-Status: GOOD (  15.68  )
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

The NUMA binding is now covered by the dtschema
numa-distance-map-v1.yaml and CPU and memory node schemas with all
the relevant descriptions moved to them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/numa.txt | 319 ---------------------
 1 file changed, 319 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/numa.txt

diff --git a/Documentation/devicetree/bindings/numa.txt b/Documentation/devicetree/bindings/numa.txt
deleted file mode 100644
index 42f282c2f3cc..000000000000
--- a/Documentation/devicetree/bindings/numa.txt
+++ /dev/null
@@ -1,319 +0,0 @@
-==============================================================================
-NUMA binding description.
-==============================================================================
-
-==============================================================================
-1 - Introduction
-==============================================================================
-
-Systems employing a Non Uniform Memory Access (NUMA) architecture contain
-collections of hardware resources including processors, memory, and I/O buses,
-that comprise what is commonly known as a NUMA node.
-Processor accesses to memory within the local NUMA node is generally faster
-than processor accesses to memory outside of the local NUMA node.
-DT defines interfaces that allow the platform to convey NUMA node
-topology information to OS.
-
-==============================================================================
-2 - numa-node-id
-==============================================================================
-
-For the purpose of identification, each NUMA node is associated with a unique
-token known as a node id. For the purpose of this binding
-a node id is a 32-bit integer.
-
-A device node is associated with a NUMA node by the presence of a
-numa-node-id property which contains the node id of the device.
-
-Example:
-	/* numa node 0 */
-	numa-node-id = <0>;
-
-	/* numa node 1 */
-	numa-node-id = <1>;
-
-==============================================================================
-3 - distance-map
-==============================================================================
-
-The optional device tree node distance-map describes the relative
-distance (memory latency) between all numa nodes.
-
-- compatible : Should at least contain "numa-distance-map-v1".
-
-- distance-matrix
-  This property defines a matrix to describe the relative distances
-  between all numa nodes.
-  It is represented as a list of node pairs and their relative distance.
-
-  Note:
-	1. Each entry represents distance from first node to second node.
-	The distances are equal in either direction.
-	2. The distance from a node to self (local distance) is represented
-	with value 10 and all internode distance should be represented with
-	a value greater than 10.
-	3. distance-matrix should have entries in lexicographical ascending
-	order of nodes.
-	4. There must be only one device node distance-map which must
-	reside in the root node.
-	5. If the distance-map node is not present, a default
-	distance-matrix is used.
-
-Example:
-	4 nodes connected in mesh/ring topology as below,
-
-		0_______20______1
-		|               |
-		|               |
-		20             20
-		|               |
-		|               |
-		|_______________|
-		3       20      2
-
-	if relative distance for each hop is 20,
-	then internode distance would be,
-	      0 -> 1 = 20
-	      1 -> 2 = 20
-	      2 -> 3 = 20
-	      3 -> 0 = 20
-	      0 -> 2 = 40
-	      1 -> 3 = 40
-
-     and dt presentation for this distance matrix is,
-
-		distance-map {
-			 compatible = "numa-distance-map-v1";
-			 distance-matrix = <0 0  10>,
-					   <0 1  20>,
-					   <0 2  40>,
-					   <0 3  20>,
-					   <1 0  20>,
-					   <1 1  10>,
-					   <1 2  20>,
-					   <1 3  40>,
-					   <2 0  40>,
-					   <2 1  20>,
-					   <2 2  10>,
-					   <2 3  20>,
-					   <3 0  20>,
-					   <3 1  40>,
-					   <3 2  20>,
-					   <3 3  10>;
-		};
-
-==============================================================================
-4 - Empty memory nodes
-==============================================================================
-
-Empty memory nodes, which no memory resides in, are allowed. There are no
-device nodes for these empty memory nodes. However, the NUMA node IDs and
-distance maps are still valid and memory may be added into them through
-hotplug afterwards.
-
-Example:
-
-	memory@0 {
-		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
-		numa-node-id = <0>;
-	};
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x0 0x80000000 0x0 0x80000000>;
-		numa-node-id = <1>;
-	};
-
-	/* Empty memory node 2 and 3 */
-	distance-map {
-		compatible = "numa-distance-map-v1";
-		distance-matrix = <0 0  10>,
-				  <0 1  20>,
-				  <0 2  40>,
-				  <0 3  20>,
-				  <1 0  20>,
-				  <1 1  10>,
-				  <1 2  20>,
-				  <1 3  40>,
-				  <2 0  40>,
-				  <2 1  20>,
-				  <2 2  10>,
-				  <2 3  20>,
-				  <3 0  20>,
-				  <3 1  40>,
-				  <3 2  20>,
-				  <3 3  10>;
-	};
-
-==============================================================================
-5 - Example dts
-==============================================================================
-
-Dual socket system consists of 2 boards connected through ccn bus and
-each board having one socket/soc of 8 cpus, memory and pci bus.
-
-	memory@c00000 {
-		device_type = "memory";
-		reg = <0x0 0xc00000 0x0 0x80000000>;
-		/* node 0 */
-		numa-node-id = <0>;
-	};
-
-	memory@10000000000 {
-		device_type = "memory";
-		reg = <0x100 0x0 0x0 0x80000000>;
-		/* node 1 */
-		numa-node-id = <1>;
-	};
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x0>;
-			enable-method = "psci";
-			/* node 0 */
-			numa-node-id = <0>;
-		};
-		cpu@1 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-			numa-node-id = <0>;
-		};
-		cpu@2 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-			numa-node-id = <0>;
-		};
-		cpu@3 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-			numa-node-id = <0>;
-		};
-		cpu@4 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x4>;
-			enable-method = "psci";
-			numa-node-id = <0>;
-		};
-		cpu@5 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x5>;
-			enable-method = "psci";
-			numa-node-id = <0>;
-		};
-		cpu@6 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x6>;
-			enable-method = "psci";
-			numa-node-id = <0>;
-		};
-		cpu@7 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x7>;
-			enable-method = "psci";
-			numa-node-id = <0>;
-		};
-		cpu@8 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x8>;
-			enable-method = "psci";
-			/* node 1 */
-			numa-node-id = <1>;
-		};
-		cpu@9 {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0x9>;
-			enable-method = "psci";
-			numa-node-id = <1>;
-		};
-		cpu@a {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0xa>;
-			enable-method = "psci";
-			numa-node-id = <1>;
-		};
-		cpu@b {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0xb>;
-			enable-method = "psci";
-			numa-node-id = <1>;
-		};
-		cpu@c {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0xc>;
-			enable-method = "psci";
-			numa-node-id = <1>;
-		};
-		cpu@d {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0xd>;
-			enable-method = "psci";
-			numa-node-id = <1>;
-		};
-		cpu@e {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0xe>;
-			enable-method = "psci";
-			numa-node-id = <1>;
-		};
-		cpu@f {
-			device_type = "cpu";
-			compatible =  "arm,armv8";
-			reg = <0x0 0xf>;
-			enable-method = "psci";
-			numa-node-id = <1>;
-		};
-	};
-
-	pcie0: pcie0@848000000000 {
-		compatible = "arm,armv8";
-		device_type = "pci";
-		bus-range = <0 255>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0x8480 0x00000000 0 0x10000000>;  /* Configuration space */
-		ranges = <0x03000000 0x8010 0x00000000 0x8010 0x00000000 0x70 0x00000000>;
-		/* node 0 */
-		numa-node-id = <0>;
-        };
-
-	pcie1: pcie1@948000000000 {
-		compatible = "arm,armv8";
-		device_type = "pci";
-		bus-range = <0 255>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0x9480 0x00000000 0 0x10000000>;  /* Configuration space */
-		ranges = <0x03000000 0x9010 0x00000000 0x9010 0x00000000 0x70 0x00000000>;
-		/* node 1 */
-		numa-node-id = <1>;
-        };
-
-	distance-map {
-		compatible = "numa-distance-map-v1";
-		distance-matrix = <0 0 10>,
-				  <0 1 20>,
-				  <1 1 10>;
-	};
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
