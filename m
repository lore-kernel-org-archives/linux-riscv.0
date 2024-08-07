Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FCDC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 06:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7V2WOI4VoyzkSkE4JNy0inVE5YFAxN2OoBUZ3sWcPh0=; b=On4XQuoqzw1yjY
	Wnx0jvpQA69xg5zRBXWk4EFHWTJKo8ldc/So/OJD8Fa4sXE/9lG4a4BT/EjjyHDH4DzNOhGM0PTjE
	UHB405TphWi82ztE4jEc50BeOIpIBdiwnTtSfC9rgv6WdAc4EsOQybV6uYM1uksv4PnMvrM6NVdyl
	AHGojI8jcT7/iRQjRLe9Kj520L2oTweN+Q6MMVHfUs0M1yuaqf20HPsV72o7S5SvlVaVX/hghOMr5
	vdzaps0drHAN+zQbLAD0HJSHVWppKaZFh3sUXLeqeCaaSZZv0gcraplCKWEQttl2wdCl28p2xWfoe
	PxtKj+BISxZ7XLV1NRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaaQ-000000047Xl-3Jnh;
	Wed, 07 Aug 2024 06:55:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaQx-0000000434M-3I0T;
	Wed, 07 Aug 2024 06:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CF54610A7;
	Wed,  7 Aug 2024 06:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71308C32782;
	Wed,  7 Aug 2024 06:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723013166;
	bh=xtyp1aK60EfICyd3Io+QgKdHfXGFeq+Z56Dgry0dtM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TpOTM67AOTzvj7jGvqTTRV42/hYfB216T8cxTT6eXWBJxxh7VMeO/KAdg2yE6YN8B
	 5T0zSRxo1Vq5VQfE4rYBoZyHw6RpHAebolAkGFMob0FiaAmFMHmzesF4Fyw4Ze2hga
	 Ig8VwKMmaE3QO39fEe5Mn5sfzQD5jFeMrtdd1dBT1E3Yj78/et7lzPPyG2Y7Yygd3Z
	 oQyABhMKKqvXz2CYuQaywqjGjY9QtjuO+wVSwUFyPL2qhpPc74SfEERLyfkSbQ5qzz
	 fIRkz32UsqwDqrZ27zJ5m7GVr3WmdkA5djl1Ok0FaGxYFslB7iQcuMiVbEg4cEUPVe
	 o5lI5qZyQrQ3A==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 23/26] of, numa: return -EINVAL when no numa-node-id is found
Date: Wed,  7 Aug 2024 09:41:07 +0300
Message-ID: <20240807064110.1003856-24-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807064110.1003856-1-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_234607_989316_ACABF0B5 
X-CRM114-Status: GOOD (  15.40  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Currently of_numa_parse_memory_nodes() returns 0 if no "memory" node in
device tree contains "numa-node-id" property. This makes of_numa_init()
to return "success" despite no NUMA nodes were actually parsed and set
up.

arch_numa workarounds this by returning an error if numa_nodes_parsed is
empty.

numa_memblks however would WARN() in such case and since it will be used
by arch_numa shortly, such warning is not desirable.

Make sure of_numa_init() returns -EINVAL when no NUMA node information
was found in the device tree.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 drivers/of/of_numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 838747e319a2..2ec20886d176 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -45,7 +45,7 @@ static int __init of_numa_parse_memory_nodes(void)
 	struct device_node *np = NULL;
 	struct resource rsrc;
 	u32 nid;
-	int i, r;
+	int i, r = -EINVAL;
 
 	for_each_node_by_type(np, "memory") {
 		r = of_property_read_u32(np, "numa-node-id", &nid);
@@ -72,7 +72,7 @@ static int __init of_numa_parse_memory_nodes(void)
 		}
 	}
 
-	return 0;
+	return r;
 }
 
 static int __init of_numa_parse_distance_map_v1(struct device_node *map)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
