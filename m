Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB49C25B08
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSSx7MqWfitwOutLNHK0H8FnmUxEw2TIkAWVz5yP39o=; b=h28iUMBqDi6u4b
	PLlemNq5LpFSAaRW3XdjoPGDMgr2V9yXWx1NifolldhIHRVQeQnOwcmisMg/ZnNXYlTbYi34zf4Po
	Bs6sL1XPXeEv8/qrCp0s4p6SDMwB1hHKP73zQEJqmUwgmURN2EPnIaorV9WgnbtO/cwv/3SWdK/6z
	GzOLHt820HAM0IgD7MGKYqFlUSt6Z4exwCu3/ZfXXmc1XraYJT52914bKMVNwmqF67mX4BkYaL3P/
	Q+yqrbr5vvV+D7D1kyRUzQr+G/voZ31ouICCtWfHTZOMMVT+GpmjkXRIQYnPZnWPn4IuFDqlqFoj2
	yJNpeU3K/F9jxRJ8HBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9zI-00G4kp-Ul; Mon, 08 Aug 2022 21:08:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9zA-00G4eT-Vv
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 21:08:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso790895wmb.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
        b=JddNGHWDeeejm2RIJHx/iBhnK4ZsV/U8akRmYUJecC0+M88okiM7FdxKpDerVLuNZc
         1JG+i4WUzOgZrGF+yyP6S57mck6D9oX/fbsVbYaWJHNAkElO6FRIp4kQpmBbZb30XIfs
         hTwJeoc3LWLOAw35qTX/r5jXgXmDphAHNcPwDQXL+DF31qcn4eQOsrAVr7PVgB+bX0fV
         tR/ZuFBfr4iYtniDLQZA5ci6fscCF4+d1TOPdDrq57vlQ84qFeWpe/mJrPvFpsZf9guO
         zksAIlJB4tZu1PolizuifoqLskduaHL7MWM6UFMUw4tvoIXxcJMCGvwmdwJlPPhN7fNn
         8nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
        b=KVe+zIZoftKzIWCxpkfpqgtjY5AnEvBKL9EGhuN/KsYxp1fyHJA6BPkA22xITJZv80
         DR6zsn6u04c0nQlylwFqcFx0wGjJ/d+rj+Rkm7lLQ3uLv4q31daqj/R3PQYxGgjGlkVX
         Sxv2h3UmeWvDskUz2fqgJ4/IjQ6JydvbDWZY68RWA/wsWWr16C+tOY7gbdAXUI1Bo0zm
         J1NFfBQ0LGMvQXM6LHXOCS9w/0DDXDVxBYI4NX2QcWSYsfDt9l997cqoPDzdKK/iDqOV
         onIg5B+MGex/O+yBv+wAWeQ/pncYQRP6kHh6oAhhO4GNWWzXLSBwrC9sJ0SGBINVaa3z
         h+mg==
X-Gm-Message-State: ACgBeo2qZVspDxqguAr/qqKfe9Zd0lCzJPavh1y7oUQZqGkJOONC/a+c
	Stav8E2p0X18y6JpU8b9hMByhg==
X-Google-Smtp-Source: AA6agR46x1AlO/jiQSG57WcvYDDMG3jH+AztYwAsHFqxHQo4Ry3vl3BYbmunOzGYbCe7dbvp/9A6JQ==
X-Received: by 2002:a05:600c:21d4:b0:3a3:150a:7ed2 with SMTP id x20-20020a05600c21d400b003a3150a7ed2mr13800655wmj.166.1659992904355;
        Mon, 08 Aug 2022 14:08:24 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 14:08:23 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 4/4] hw/core: fix platform bus node name
Date: Mon,  8 Aug 2022 22:06:44 +0100
Message-Id: <20220808210643.2192602-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_140829_063224_26A61E76 
X-CRM114-Status: GOOD (  11.13  )
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
