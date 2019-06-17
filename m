Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6294BC31E5B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 19:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A47208C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 19:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhT0+Cuz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="P53e6C57"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A47208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUrxa8Axfj+l+x1MucEXUDkXv/V0GM9Wqo2PdPkQHF0=; b=uhT0+CuzSwatC6
	84h4RPkFqHPYNH9700FHecRXyCA9WsCA4BA6wsqxrdLZqpEpZaveD5HW8GQsrlpkQFSEtlUTYRFEI
	E1TRuGP//qRqXCWh4f1WSrJDkNNCW4KRW53jR3UuGblxgSvs7ye5GbS/1j2NOCAcPZZTtCQ452aR0
	UDKl0Z98tUyOODs2KziGuxVbBoYUcItlit1+XEv9L7ks+vHsAL3BjGIzpG/f3cLb3OcZKltSay8up
	GQ8XLcjL11hFGfqmT9nYZ2n/ZE5yJQVOMkG110k8rzc147zKmCYJvHgN4QtCi6fLiy9JjyuNLQlbg
	NvLnV6mf3y9DpfEtNjlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcwro-0003Cx-TY; Mon, 17 Jun 2019 19:00:32 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcwrJ-0001gz-PG; Mon, 17 Jun 2019 19:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1560798002; x=1592334002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GED2GA9QcE13vUl5xR4mTzXTMt8Lm/cPPiiomsp+YVU=;
 b=P53e6C57M9r249xd8VkL8cd5WOBcm8J+gNestsr3u24us8oip2SFDZHa
 29hs9xZ+7qLftTJX+gC4XH1U99ozabafdEEOTVqAafzVO0cJxQUElJTsw
 Md3PVYtiUjDs23s2cKOSgzYEmX7Ypv5qBLbXqPk22fqlaoEzXuCFphLnj
 bs/KXtFY0XYPFN5e8LlJmUr7Rlg3SITA5BgHOThczhS6AZozx4PMxcpqp
 3lAyb72B8t+JXMKFQHOSlUQ+KZTL+mgFkbNW8+ahoadmZqMmSlCXBSMjN
 uyWb/Hl3x7we5sRDTdoKLdb3FbrBhIG/zoBdWid/b9XvjKn75MdmnSJyD g==;
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="115695380"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2019 03:00:00 +0800
IronPort-SDR: wPLjssnkTvlNebGc807FY+GmLmbKMqJ6R5ho2bqbsQEPXqtsvJA+WDBBrTljcZJnOH7lNYCeue
 i05v+8yhjiinkgMFEzj0MyWCJvE7viYg6CGT3ZSUxyttzzZh8dNl79kvF/LUXCKqqyhyc1nLKS
 exC/RuRp42rFQWHgwym587kszvS/LJ9tZkDC+e7MrsEPCg3CySWkW8SqgYZ5JjdwdFveC1Ivl1
 u/P5yDjLa8rT/f64f+f/Oi95XPGIH0vn6mOyLuTH8g1GvC/fNVOnbhafhIy3rJXaNmcpqZAIsF
 mbqQeng2W696LIzDPBu3y0Cx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 17 Jun 2019 11:59:29 -0700
IronPort-SDR: IwDlxCoeIEV9birPttBGRyAxGoo4PO9XDI2b6rv6So20SSp7gpuKqDYkVfcj/YgAbcIDEX5xrT
 zYriFHD9jzhIykf8rB1NYxOkxuLmX63honLpoHi1q20Jm3flrEUNsIYZSBUgfLLHB64iyw6FyK
 0waelF1QmvcpSgo00XeILtQHPXonfea34Z56vH/bd/QfZV64qpzowK9j4qXnHfDfiNg845p9sN
 fwrwNn3yuuI6f/dOANfN3s8Ud38GRQkHl1TlzmvYgjYWhQjjCutzZiUQghSMX/hNiQC2NfVp3N
 wk4=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jun 2019 11:59:57 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/7] Documentation: DT: arm: add support for sockets
 defining package boundaries
Date: Mon, 17 Jun 2019 11:59:14 -0700
Message-Id: <20190617185920.29581-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617185920.29581-1-atish.patra@wdc.com>
References: <20190617185920.29581-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_120001_944208_20684EA9 
X-CRM114-Status: GOOD (  16.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Morten Rasmussen <morten.rasmussen@arm.com>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@kernel.org>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Otto Sabart <ottosabart@seberm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sudeep Holla <sudeep.holla@arm.com>

The current ARM DT topology description provides the operating system
with a topological view of the system that is based on leaf nodes
representing either cores or threads (in an SMT system) and a
hierarchical set of cluster nodes that creates a hierarchical topology
view of how those cores and threads are grouped.

However this hierarchical representation of clusters does not allow to
describe what topology level actually represents the physical package or
the socket boundary, which is a key piece of information to be used by
an operating system to optimize resource allocation and scheduling.

Lets add a new "socket" node type in the cpu-map node to describe the
same.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/topology.txt      | 52 ++++++++++++++-----
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/arm/topology.txt
index b0d80c0fb265..3b8febb46dad 100644
--- a/Documentation/devicetree/bindings/arm/topology.txt
+++ b/Documentation/devicetree/bindings/arm/topology.txt
@@ -9,6 +9,7 @@ ARM topology binding description
 In an ARM system, the hierarchy of CPUs is defined through three entities that
 are used to describe the layout of physical CPUs in the system:
 
+- socket
 - cluster
 - core
 - thread
@@ -63,21 +64,23 @@ nodes are listed.
 
 	The cpu-map node's child nodes can be:
 
-	- one or more cluster nodes
+	- one or more cluster nodes or
+	- one or more socket nodes in a multi-socket system
 
 	Any other configuration is considered invalid.
 
-The cpu-map node can only contain three types of child nodes:
+The cpu-map node can only contain 4 types of child nodes:
 
+- socket node
 - cluster node
 - core node
 - thread node
 
 whose bindings are described in paragraph 3.
 
-The nodes describing the CPU topology (cluster/core/thread) can only
-be defined within the cpu-map node and every core/thread in the system
-must be defined within the topology.  Any other configuration is
+The nodes describing the CPU topology (socket/cluster/core/thread) can
+only be defined within the cpu-map node and every core/thread in the
+system must be defined within the topology.  Any other configuration is
 invalid and therefore must be ignored.
 
 ===========================================
@@ -85,26 +88,44 @@ invalid and therefore must be ignored.
 ===========================================
 
 cpu-map child nodes must follow a naming convention where the node name
-must be "clusterN", "coreN", "threadN" depending on the node type (ie
-cluster/core/thread) (where N = {0, 1, ...} is the node number; nodes which
-are siblings within a single common parent node must be given a unique and
+must be "socketN", "clusterN", "coreN", "threadN" depending on the node type
+(ie socket/cluster/core/thread) (where N = {0, 1, ...} is the node number; nodes
+which are siblings within a single common parent node must be given a unique and
 sequential N value, starting from 0).
 cpu-map child nodes which do not share a common parent node can have the same
 name (ie same number N as other cpu-map child nodes at different device tree
 levels) since name uniqueness will be guaranteed by the device tree hierarchy.
 
 ===========================================
-3 - cluster/core/thread node bindings
+3 - socket/cluster/core/thread node bindings
 ===========================================
 
-Bindings for cluster/cpu/thread nodes are defined as follows:
+Bindings for socket/cluster/cpu/thread nodes are defined as follows:
+
+- socket node
+
+	 Description: must be declared within a cpu-map node, one node
+		      per physical socket in the system. A system can
+		      contain single or multiple physical socket.
+		      The association of sockets and NUMA nodes is beyond
+		      the scope of this bindings, please refer [2] for
+		      NUMA bindings.
+
+	This node is optional for a single socket system.
+
+	The socket node name must be "socketN" as described in 2.1 above.
+	A socket node can not be a leaf node.
+
+	A socket node's child nodes must be one or more cluster nodes.
+
+	Any other configuration is considered invalid.
 
 - cluster node
 
 	 Description: must be declared within a cpu-map node, one node
 		      per cluster. A system can contain several layers of
-		      clustering and cluster nodes can be contained in parent
-		      cluster nodes.
+		      clustering within a single physical socket and cluster
+		      nodes can be contained in parent cluster nodes.
 
 	The cluster node name must be "clusterN" as described in 2.1 above.
 	A cluster node can not be a leaf node.
@@ -164,13 +185,15 @@ Bindings for cluster/cpu/thread nodes are defined as follows:
 4 - Example dts
 ===========================================
 
-Example 1 (ARM 64-bit, 16-cpu system, two clusters of clusters):
+Example 1 (ARM 64-bit, 16-cpu system, two clusters of clusters in a single
+physical socket):
 
 cpus {
 	#size-cells = <0>;
 	#address-cells = <2>;
 
 	cpu-map {
+		socket0 {
 			cluster0 {
 				cluster0 {
 					core0 {
@@ -253,6 +276,7 @@ cpus {
 				};
 			};
 		};
+	};
 
 	CPU0: cpu@0 {
 		device_type = "cpu";
@@ -473,3 +497,5 @@ cpus {
 ===============================================================================
 [1] ARM Linux kernel documentation
     Documentation/devicetree/bindings/arm/cpus.yaml
+[2] Devicetree NUMA binding description
+    Documentation/devicetree/bindings/numa.txt
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
