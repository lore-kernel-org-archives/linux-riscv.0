Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3769C10F05
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1277218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mscgdkt8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QdPA4wqj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1277218A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4uZm1FgKLGZB7Io+IpKeNqmONWxcS87Q4ofJDmnBpQ=; b=mscgdkt8GtOcqA
	ta0At+vU7+wxcW/Ath7B2dVcr9HmNt3QLwtFOfhMn4+KridEBRVVBTp/jBCLBpLF59Oc9J67OijOV
	ZgSknnJie/mxkCfGDD1+7faMhrcgVx0gjBMcdj4+IPDuJGUQ40Vn4sPp85+SOX4crmrldHKYApTPS
	f3au3ppjrPnMsVTtYK7/7VSRpvOPzxKSl7r2eNYM0RArjuhHenGjZ9E1j6x3ZnE+gvNR9ct7BpaJG
	HPj5zoGxiWlPmBwxDTvVN5edE9WrUdJDA3lfbUm1dj13B21gFu+stpi31YvnYstWjRqA8oMTUMzBW
	59bwkcgze8qGQmj1jEnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6kwY-0001UE-TL; Wed, 20 Mar 2019 23:48:22 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6kwU-0001OM-Ee
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 23:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553125698; x=1584661698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8+GS09e2kuxAm41XWJLYt8y5cTm3Ai/BqW043K5L6o4=;
 b=QdPA4wqjIsZ4lSlNCJPUbQcf9slMMSGJTsKjixHSp1OZu8H8P/ih+cZ5
 8YRUNnWo+EXNKvTtjiG/GVuUW/AaFUtO2Z9n840GSXlS6XA+ajdoJALTv
 vtPhUnXIkSdvdsomCr2Soyp8KmNFGuP2zcfidP/EDuUkbVVvOFmf4fFNO
 cP+oa+HPbiiZOGkNR1LzvXaAH0Ji/BLriHuMfJM/BVfqQor4S+p4AlhLV
 AUOFuE+AV6W08NYkxUZj+6vOn0j6otdEXsLE2+iQyHk+kfbwgMGP1r05U
 5NjKSO8Lb3DB70v365K1i01fNNfx2BSfvivZs18WWFpkMAE59pEnroiE5 w==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209432741"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 07:48:15 +0800
IronPort-SDR: Az4HOiUA2zPAZ1gYcMageIa+a/NTM921h6SbJH9FNyTeoXJvwamwKv8CgLfkpOqNZ8xYZYlYU2
 oywldgA2GxB4grlq2x+/8tcKTQ9pO2PLMbhhqJpVNlWRD2iKMax+ZI4tY6AxAZhVE4G7yO5uSe
 5yNS1zwwtDxGcg8lV8XH8J9fW5OSDk7pUiMV3t7OnMMaEAIqx3/m0gNc3UpBCajRqUcOtCdj1i
 YNIJK18HfExzsBjLGRiNvVdnOhmxffWDzrXTaknuQDX6fjm+ptI+vqOhA/Klbg/C5NFt9iWWM2
 Fr4Ka6vOxJGHkdg7/HcAh8Cr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 20 Mar 2019 16:27:52 -0700
IronPort-SDR: Lzd9zrpBxuvOxN6UBKKq8X/tVYNVlG7Ll9jP+kayjJZ+zTZmiDXWlHXB7ErYVYouYINWVkqXWn
 E1ME3G9uZnXmVc+ibzLqXuJye1s8omY9roT4jxZ+VWbm1/TmtWTd5vlnMI3B9bXrSJhpgrNbtS
 Mf47+JOWvDzu1PRfMLkDf1PuYMv/29duqltRdzxXpH1M4oZ3ioD0Rv5JppuJTzBUuekZ8FvF5C
 YEUBQ/MgqO8vJsO0M/fp41GlMZXwwTEqQ0fs1tTGx2b1EFU6EqiDyQSCt6tZFkc5j2KbtbPmuG
 I08=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Mar 2019 16:48:15 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v3 2/5] dt-binding: cpu-topology: Move cpu-map to a
 common binding.
Date: Wed, 20 Mar 2019 16:48:03 -0700
Message-Id: <20190320234806.19748-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320234806.19748-1-atish.patra@wdc.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_164818_727076_2D17CF5E 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

cpu-map binding can be used to described cpu topology for both
RISC-V & ARM. It makes more sense to move the binding to document
to a common place.

The relevant discussion can be found here.
https://lkml.org/lkml/2018/11/6/19

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../topology.txt => cpu/cpu-topology.txt}     | 82 +++++++++++++++----
 1 file changed, 66 insertions(+), 16 deletions(-)
 rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (86%)

diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
similarity index 86%
rename from Documentation/devicetree/bindings/arm/topology.txt
rename to Documentation/devicetree/bindings/cpu/cpu-topology.txt
index 3b8febb4..069addcc 100644
--- a/Documentation/devicetree/bindings/arm/topology.txt
+++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
@@ -1,12 +1,12 @@
 ===========================================
-ARM topology binding description
+CPU topology binding description
 ===========================================
 
 ===========================================
 1 - Introduction
 ===========================================
 
-In an ARM system, the hierarchy of CPUs is defined through three entities that
+In a SMP system, the hierarchy of CPUs is defined through three entities that
 are used to describe the layout of physical CPUs in the system:
 
 - socket
@@ -14,9 +14,6 @@ are used to describe the layout of physical CPUs in the system:
 - core
 - thread
 
-The cpu nodes (bindings defined in [1]) represent the devices that
-correspond to physical CPUs and are to be mapped to the hierarchy levels.
-
 The bottom hierarchy level sits at core or thread level depending on whether
 symmetric multi-threading (SMT) is supported or not.
 
@@ -25,33 +22,31 @@ threads existing in the system and map to the hierarchy level "thread" above.
 In systems where SMT is not supported "cpu" nodes represent all cores present
 in the system and map to the hierarchy level "core" above.
 
-ARM topology bindings allow one to associate cpu nodes with hierarchical groups
+CPU topology bindings allow one to associate cpu nodes with hierarchical groups
 corresponding to the system hierarchy; syntactically they are defined as device
 tree nodes.
 
-The remainder of this document provides the topology bindings for ARM, based
-on the Devicetree Specification, available from:
+Currently, only ARM/RISC-V intend to use this cpu topology binding but it may be
+used for any other architecture as well.
 
-https://www.devicetree.org/specifications/
+The cpu nodes, as per bindings defined in [4], represent the devices that
+correspond to physical CPUs and are to be mapped to the hierarchy levels.
 
-If not stated otherwise, whenever a reference to a cpu node phandle is made its
-value must point to a cpu node compliant with the cpu node bindings as
-documented in [1].
 A topology description containing phandles to cpu nodes that are not compliant
-with bindings standardized in [1] is therefore considered invalid.
+with bindings standardized in [4] is therefore considered invalid.
 
 ===========================================
 2 - cpu-map node
 ===========================================
 
-The ARM CPU topology is defined within the cpu-map node, which is a direct
+The ARM/RISC-V CPU topology is defined within the cpu-map node, which is a direct
 child of the cpus node and provides a container where the actual topology
 nodes are listed.
 
 - cpu-map node
 
-	Usage: Optional - On ARM SMP systems provide CPUs topology to the OS.
-			  ARM uniprocessor systems do not require a topology
+	Usage: Optional - On SMP systems provide CPUs topology to the OS.
+			  Uniprocessor systems do not require a topology
 			  description and therefore should not define a
 			  cpu-map node.
 
@@ -494,8 +489,63 @@ cpus {
 	};
 };
 
+Example 3: HiFive Unleashed (RISC-V 64 bit, 4 core system)
+
+{
+	#address-cells = <2>;
+	#size-cells = <2>;
+	compatible = "sifive,fu540g", "sifive,fu500";
+	model = "sifive,hifive-unleashed-a00";
+
+	...
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU1>;
+				};
+				core1 {
+					cpu = <&CPU2>;
+				};
+				core2 {
+					cpu0 = <&CPU2>;
+				};
+				core3 {
+					cpu0 = <&CPU3>;
+				};
+			};
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "sifive,rocket0", "riscv";
+			reg = <0x1>;
+		}
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "sifive,rocket0", "riscv";
+			reg = <0x2>;
+		}
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "sifive,rocket0", "riscv";
+			reg = <0x3>;
+		}
+		CPU4: cpu@4 {
+			device_type = "cpu";
+			compatible = "sifive,rocket0", "riscv";
+			reg = <0x4>;
+		}
+	}
+};
 ===============================================================================
 [1] ARM Linux kernel documentation
     Documentation/devicetree/bindings/arm/cpus.yaml
 [2] Devicetree NUMA binding description
     Documentation/devicetree/bindings/numa.txt
+[3] RISC-V Linux kernel documentation
+    Documentation/devicetree/bindings/riscv/cpus.txt
+[4] https://www.devicetree.org/specifications/
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
