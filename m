Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C958C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 01:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE2B206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 01:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FmG0yDsZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XWnrb52N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BfA5y79u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE2B206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4uZm1FgKLGZB7Io+IpKeNqmONWxcS87Q4ofJDmnBpQ=; b=FmG0yDsZ0uopBD
	kLACYZ9Lxl3WQgyBwg72tgEv8pn5a1tr2Cod+fDuMmx48iTtU5irt2e6W/b1UQ+/MRJhiuPAQFOwJ
	VCOKAhgFg47TrJzqttCOXDuWG8OPCSf2fTz81B8cZYYXIg1l+S3I26SaZKXIh2WVhbpsCKUw7RVx8
	KQupbPiuziy0ChQKy3Y/PWIWgws+7PMOc+XWarcUkNlMLrQHjzY+XQMoumriFBvQW72yGd8EK3fpg
	ebhauOZ05MRpE6uas8+EAHBRLy18r1b7FZDtlLtO7u3AVbLUg3XwaPZRMsuDIfJV1DOgRDxHk6yvq
	vW/gMbipKYIHq5Bm/Wkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Q7J-000737-T6; Wed, 20 Mar 2019 01:34:05 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Q7I-00070R-7S
 for linux-riscv@bombadil.infradead.org; Wed, 20 Mar 2019 01:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=omUpBt9BlySOUI3fQQQxj37C+hMzC+iXtUoDkcaiI5g=; b=XWnrb52NNSDV25q6ygWbuh4gFH
 DywnmXAtgMRqiUc73Hag5Sa8T+qigNSR3q6SVtRrpmzeA1T9aPXkJMjHWbb7BOYRZ57TymnWz+Nef
 8WCjZAaGsapLFRZAba8Jza6HLXZWLY2f9GIHWIsX6cP7mCplQ72+1aQ+UizQvrCYwiqzdCtJGQIcQ
 waCJaqIjWQ4tGKkCMpB9ME/9V+E49xS71gEdOBdFFhosmnLR77/id30QditOuoBEg8NCZxdl0u8xb
 HaoQx19507agyd/1EUy++5h75uAyTj704a0U2Fu2j7DtCBQmfEHFpjHcICyf3CW4tOn5KUoiYpbWi
 mcC8NqMQ==;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6PxY-000342-SV
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 01:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553045041; x=1584581041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8+GS09e2kuxAm41XWJLYt8y5cTm3Ai/BqW043K5L6o4=;
 b=BfA5y79uSfGSxZY4qgt2+4z/XPxN41JwAPr9O4pQg5EXZwf+RjvsS9VN
 lKzP5mfV3tt4wH3CVoWNeNGrpMTtC9gu1kcjGejlsyTg8R7308Bh1RrTY
 mWp1mkItinrDtVQrz8VvHLkm1WTAEHNCP3kGd6vjUzGPVjoFBYu11mHHd
 FlJMWvecYHn1fH/3rvxormizRYEegOiSgtythGoQOYHIzk7reOjImSXGN
 XOlTEd+5kCYponv1E+78AsB4uZXIF2KvxHv2h0RXUvVvZ2w2FBlvPoSig
 9XHckCBNbxMfeR08dLDmkxxknQ3tPHghAR76ZnPd+UMMPT+UZY40X1JPn A==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105533375"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 09:22:58 +0800
IronPort-SDR: 06NhEYuUOnoKdtgC2UMzLpSwpYkwBgRf19sXIiyEXSZkc8q1oBKT+SVasMOhGiUUsE6MpvvPE2
 UVl7ZWJRp90c32kird5E9NKTa56sGFxY+WYg713YjTIf2eKYpvfUrAxyTR9eVoBEAHGNo9qDGO
 ECasZbENfpNnXbNkcfkLpodNI3awIXhJd1PSH3dFV4f/Bq1iP/ERuLhbi+7rFEoEou9HbK/Gxm
 ikr7RrxkxGsY/igRXMGfqKBSCtaDS8jGju7Xw3MzO49QMvVr3wW6FVS6n+A7D/phcRh9+cBYcr
 /LdhRhXSJJBCEnzFOsl2kP6H
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 19 Mar 2019 18:00:35 -0700
IronPort-SDR: 74e+9wDs7inGi9149LY/w680g5jI4wF9t01OZPlDKox8ntToAjyg0lLwP+CgtlDwo/xd7ozIvB
 VDVf78wUsXnqAi5UgIGpIOo8OgA8A3g0qKsOr6sEEvwsUzQS1ud/cjXMQCS6UtUu7Jar5iwls0
 AzNAIFh5Ao8RBdQizSxZXV9zEH7NXSADMKS3scQpdVD0gysWU+RKIVlH+41hsavh030ucrSvGB
 OF9zsOLcOrwKMPj1eX3StIpbQN5bM9EsTpfXhL6FqiUSoVh2uVcFscWXvM7mAbh2neuWJjYLa/
 tXE=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 18:22:58 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v2 1/4] dt-binding: cpu-topology: Move cpu-map to a
 common binding.
Date: Tue, 19 Mar 2019 18:22:48 -0700
Message-Id: <20190320012251.2728-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320012251.2728-1-atish.patra@wdc.com>
References: <20190320012251.2728-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_012401_366157_D8DDD777 
X-CRM114-Status: GOOD (  17.81  )
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
 linux-riscv@lists.infradead.org, Morten Rasmussen <morten.rasmussen@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Ingo Molnar <mingo@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
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
