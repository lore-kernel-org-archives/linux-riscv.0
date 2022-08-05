Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D42C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMew6/XRSK7rRVM51ydUbWh+RBXk5tPC89DDHcMmckw=; b=Uq41STZyCjWqfY
	DHt6hEkpBjI7fDbA7lvENmAWtqy2EKcq5wjz9K1s0XcGB9a97NQvPvzTRoGyoF4qlNlPr6AoT/i6g
	nBPJvnozXXRS1tD3RcVqBgifGz//H7TwTmq/VKys+27vFABQyHBywNnbk+iXS7KQHARf7jM+FaTn2
	86pAbCzjHkF7cUzLzJf8XdESp3IDdNMI1p8YuB70/4HJkKJloUxd0YwcwkjQa9IA0DDJw9sFKLq2F
	v6af4T0HK6C2uF+I0nzxSQuGL0QzvCUIP6vUPbw7trBx8L0lG/yRhS+rbLRxz7K4DjXWaYAgr376V
	0DXlSEMP6JKZfS9YFhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzli-00GXrJ-4C; Fri, 05 Aug 2022 16:01:46 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzeZ-00GTcn-9q
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 15:54:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id j15so3726398wrr.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rfrHuYofA2jTHYlyVlxL0WVJKLrnjdxClG3/+p9uXxc=;
        b=UMt/6ONZE4d7i8r+HjDr+1yRMzmeymuO+74l1T3asAl+Tl1RGNT+DTxE7u2wx5lcQB
         8kdbMDr6ilHFhkffCtYlmJZTQlaFyhFDxN8nF2W97cny4OYrqhMLGrAiMsdRULSy/7pS
         Ry++das2y4F8gvuTPoYUUZva0cfQexZ8IxJznRnFl2x+stO1m7DnEC8Xln+9sUJfM+tG
         LlObm12rMHaIGOqD3qyZqHqpEcOQ0KMMuKNmdUq7aRo97GZW87rtelf1TT5j8L4fgAz4
         VuK8DOuGSusEzjtf6L0KVKTOXviQjmY1hFGmZHklZfi6jFCW/Pa0TqQRkvenxZ3C2PhJ
         u8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rfrHuYofA2jTHYlyVlxL0WVJKLrnjdxClG3/+p9uXxc=;
        b=gDSa6nvcU6s03uqxrgxCj0zHkhR0uVal1mcYKbDoFPTPcsgC+vcIMMJco8Ed8vBndx
         TvRTdAaKq4TvMaxIklQheQTiqyG073uGwr0E9HVJD/UWKVeavpI6E15j5Q3g4hsq28tH
         31cKZFQ+BlnPghIOFRG05iSpCCFarHL7yiO0Lx66cUrRbocqc6pCzEAr6g3jHzoolRBt
         VNGFTBlHifAkVupt9o3prR+Mi4VVO5+Mc8156o7bGdMyVV6i0277KVHkyqLQG8BXixdy
         qYzlU3bL7UjyI20wilZh4m+YU8s7iEQbFpOwGvPUDvv0lr1whAOw+qIYzdmI1iACLqYQ
         hvXg==
X-Gm-Message-State: ACgBeo3y2hzxnBwVWcbKqOokki9JXOeMGbbWVrMs117EbQyIJ4S1qlsx
	hMb2+lmjz/bQ5Qmsz7jN3Mvayg==
X-Google-Smtp-Source: AA6agR7rwBoF/VmMijr0QsVwMVUZd/R8yy5zn2l6NKz7JXNM0HX+pRHkPvA4FpOzuoDDk3ygtfN69g==
X-Received: by 2002:a05:6000:1564:b0:221:7cbd:df6b with SMTP id 4-20020a056000156400b002217cbddf6bmr943177wrz.511.1659714861666;
        Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 5/5] hw/core: fix platform bus node name
Date: Fri,  5 Aug 2022 16:54:05 +0100
Message-Id: <20220805155405.1504081-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_085423_370966_2275E794 
X-CRM114-Status: GOOD (  11.04  )
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

From: Conor Dooley <conor.dooley@microchip.com>

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/core/sysbus-fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 19d22cbe73..edb0c49b19 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
 
     assert(fdt);
 
-    node = g_strdup_printf("/platform@%"PRIx64, addr);
+    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
 
     /* Create a /platform node that we can put all devices into */
     qemu_fdt_add_subnode(fdt, node);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
