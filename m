Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAC4C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 23:04:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3543620657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 23:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fj5hO2Sx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="j2JdHqFz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3543620657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JnmAPQWcz1fZGsjw6QQau31PAB3s1lMWlm97f2pT9yI=; b=Fj5hO2SxgHbB5PV0UJ07aix7aN
	4l1SD9qMH/sSikIkU+CzfVGccsm0S+TZFnYLsdt7EXiHi0hKYRlAdzTlBRtxqbfsgpY3jxMfS6Buy
	5C/0i4bfKF0XTVMS65GH0UwTzcAV7xGT9NgYxWhNi2XtRoZOZ8WsLh24wXcxCYZu25MTilRoBMlu+
	ejcvehO9H8l7OJebYk7LWZz1tClIZgzqNYbdINJm1tbTKdHDXWbus5u4W8ShKK+ZTFVX/3rxu5mPZ
	0/K3kHKwlGHYI2j+U97+oc4Dufeo5x3RMMkaeE/KzLdk59dF9sBSFlfYCrtsWr3l5nsx6jmcvGrrK
	36z/sddA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIM1A-0001cR-9g; Thu, 01 Nov 2018 23:04:48 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIM16-0001YS-5S
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 23:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541113485; x=1572649485;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=MSnFvpkFPZAzwuA5gKM2nIzAkb0BSzK0YZJ2uyOYJ8U=;
 b=j2JdHqFz9NwDHXRC9uxjInMdZxGPhT7chSBR8a8cZwgjA1s+9vZGz5sD
 fjX10fVhFmaiBFyiRCGLyXoVVhGhozlON7+1ZaygmIyf9d627vFFxlfHl
 7rVUngjuNMCQfXF4ss+gsF5JAAZhelaG7nrGAIxU2UF1Mtlk7lJLy5gDX
 2l+G3Fkqvqv9vcgbTvKL1Dcq32fwGE1hQD4yjhU+XjP5yGc831zSgZqEq
 AkSpLmxBi2H4ShyHCuBmhQ3NhVz8uE9bSoxgqjGtetwAwtTArhf8PR/3G
 jhFboqatIFR4LBBnRrT5WtYiIa7hLfsDpgxtadmPgcUlnlsNdFT+U/+Ej Q==;
X-IronPort-AV: E=Sophos;i="5.54,454,1534780800"; d="scan'208";a="93332262"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Nov 2018 07:04:29 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 01 Nov 2018 15:48:13 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Nov 2018 16:04:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Date: Thu,  1 Nov 2018 16:04:27 -0700
Message-Id: <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_160444_264975_CDA283A2 
X-CRM114-Status: GOOD (  15.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, zong@andestech.com, anup@brainfault.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 robh+dt@kernel.org, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101230427.MveVbjJj7aON3jBS1DSqOAB7RicotjoWuPI2Lgb_iSs@z>

Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
But it doesn't need a separate thread node for defining SMT systems.
Multiple cpu phandle properties can be parsed to identify the sibling
hardware threads. Moreover, we do not have cluster concept in RISC-V.
So package is a better word choice than cluster for RISC-V.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt

diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
new file mode 100644
index 00000000..96039ed3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/topology.txt
@@ -0,0 +1,154 @@
+===========================================
+RISC-V cpu topology binding description
+===========================================
+
+===========================================
+1 - Introduction
+===========================================
+
+In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
+are used to describe the layout of physical CPUs in the system:
+
+- packages
+- core
+
+The cpu nodes (bindings defined in [1]) represent the devices that
+correspond to physical CPUs and are to be mapped to the hierarchy levels.
+Simultaneous multi-threading (SMT) systems can also represent their topology
+by defining multiple cpu phandles inside core node. The details are explained
+in paragraph 3.
+
+The remainder of this document provides the topology bindings for ARM, based
+on the Devicetree Specification, available from:
+
+https://www.devicetree.org/specifications/
+
+If not stated otherwise, whenever a reference to a cpu node phandle is made its
+value must point to a cpu node compliant with the cpu node bindings as
+documented in [1].
+A topology description containing phandles to cpu nodes that are not compliant
+with bindings standardized in [1] is therefore considered invalid.
+
+This cpu topology binding description is mostly based on the topology defined
+in ARM [2].
+===========================================
+2 - cpu-topology node
+===========================================
+
+The RISC-V CPU topology is defined within the "cpu-topology" node, which is a direct
+child of the "cpus" node and provides a container where the actual topology
+nodes are listed.
+
+- cpu-topology node
+
+	Usage: Optional - RISC-V SMP systems need to provide CPUs topology to
+			  the OS. RISC-V uniprocessor systems do not require a
+			  topology description and therefore should not define a
+			  cpu-topology node.
+
+	Description: The cpu-topology node is just a container node where its
+		     subnodes describe the CPU topology.
+
+	Node name must be "cpu-topology".
+
+	The cpu-topology node's parent node must be the cpus node.
+
+	The cpu-topology node's child nodes can be:
+
+	- one or more package nodes
+
+	Any other configuration is considered invalid.
+
+The cpu-topology node can only contain two types of child nodes:
+
+- package node
+- core node
+
+whose bindings are described in paragraph 3.
+
+=================================================
+2.1 - cpu-topology child nodes naming convention
+=================================================
+
+cpu-topology child nodes must follow a naming convention where the node name
+must be "packageN", "coreN" depending on the node type (i.e. package/core).
+For SMT systems, coreN node can contain several cpuN to indicate individual
+SMT harts (where N = {0, 1, ...} is the node number; nodes which are siblings
+within a single common parent node must be given a unique and sequential N
+value, starting from 0). cpu-topology child nodes which do not share a common
+parent node can have the same name (i.e. same number N as other cpu-topology
+child nodes at different device tree levels) since name uniqueness will be
+guaranteed by the device tree hierarchy.
+
+===========================================
+3 - package/core node bindings
+===========================================
+
+Bindings for package/core nodes are defined as follows:
+
+- package node
+
+	 Description: must be declared within a cpu-topology node, one node
+		      per package. A system can contain several layers of
+		      package nodes. It can also be contained in parent
+		      package nodes.
+
+	The package node name must be "packageN" as described in 2.1 above.
+	A package node can not be a leaf node.
+
+	A package node's child nodes must be:
+
+	- one or more package nodes; or
+	- one or more core nodes
+
+	Any other configuration is considered invalid.
+
+- core node
+
+	Description: must be declared in a package node, one node per core in
+		     the package.
+
+	The core node name must be "coreN" as described in 2.1 above.
+
+	A core node must always be a leaf node.
+
+	Properties for core nodes :
+
+	- cpuN
+		Usage: required
+		Value type: <phandle>
+		Definition: a phandle to the cpu node that corresponds to the
+			    core node.
+	For SMT systems, a core node will contain multiple cpuN phandles.
+
+	Any other configuration is considered invalid.
+
+===========================================
+4 - Example dts
+===========================================
+
+Example : HiFive Unleashed (RISC-V 64 bit, 4 core system)
+
+L100: cpu-topology {
+	 package0 {
+		 core0 {
+			 cpu0 = <&L12>;
+		 };
+		 core1 {
+			 cpu0 = <&L15>;
+		 };
+		 core2 {
+			 cpu0 = <&L18>;
+		 };
+		 core3 {
+			 cpu0 = <&L21>;
+		 };
+	 };
+ };
+===============================================================================
+[1] RISC-V cpus documentation
+    Documentation/devicetree/binding/riscv/cpus.txt
+[2] ARM topology documentation
+    Documentation/devicetree/binding/arm/topology.txt
+
+===============================================================================
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
