Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4743C25B08
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPMwigOJmUuYe0BJdpheE/gmmnooUBfHuZbFkSJxLXI=; b=mLfJOHgS0RSdSL
	uqnOvxdgTVJgelc67H4Yrsxi+2cpWFvPHvJPR6scKn3p2nF4tL5KVF60Pp0e/rAIXH7yI9szWrlhj
	vFshBrcCprnwRjMrSJOdr2iyIEv2MrRGLy/ckopkQVbZYxoxNpLiTuciS64wnB7ahAIxpOL85QcBS
	dg34AZXChck6iGiVeTB+UygWPb9WjMLj67zi0vx3kh9ANn9yl7O5h/WClwLN4HgxGItHibafTAWO+
	sT5fLEOn5nFz9Y39AHYe/BF/vgMCpcFBr9NeuUbxhbrz80RKI/2Qv8YZNzZRj6aeDkColgkrNG/4/
	9yKtTiq9X9J2IzwKSZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzl7-00GXWb-3M; Fri, 05 Aug 2022 16:01:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzeX-00GTbX-OJ
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 15:54:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id j15so3726327wrr.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Eq72lhYwpcj2Y9+DftRcCgBYVb7rhM8mwuz/pv5YLJM=;
        b=df02Xw2L5M+frsgdBTHZhAB+RpXKmP47teE/tjHduOX5y9wo3GaKeXdV4xT2ToFUU7
         4PQzHwai241o9INpIDbGQxiJDcEBqL442po0XSgX//1aT712qM2uholsa9UDqeBBYqEV
         c1ZgWhWK79TYtP306g3O7vwcd2y+p8VzSx0FZ0IBIsZadWp9YnBP3dqT4eLVyyHX6zcm
         wgK8P2DB9htiONcb0h8+MaYNmFhF1S5OJm+QPHw+ICYA1QhATFphfMpdoarSaZKxBf6g
         bV73Dav0P1c9jReYFwbSsPZLZjw9kh1OAFUQuilGc2dAhtfMCng0C5YZWTo4qt5ic7p2
         p7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Eq72lhYwpcj2Y9+DftRcCgBYVb7rhM8mwuz/pv5YLJM=;
        b=sxa67jfc7eILACP+EV18z28mBN7MvFqljxLmrgsHJ8UX1WOz4/1sAd876xyFVakGS3
         NoA+aKJWMDuInx0jjGYx7WZK0fmJOqDqHLRSlpLnEaTB8eX1W9qjOCl/dYe/UwCBzhOO
         jqGzxK7IXUKaGqIlcppEx184IB/9/wTvgdAd8NFC0uQ2NT+9rN6wEhsKmUhA4FZZqMqU
         +klKV7ZpXbmnG4r8LQ6AEstXlTjdGP53wtOZDmYLK0NUJpp+LeuqBh9vg+KVeC8olybO
         z4wDObOJeJAP2Ed/pnzMLQXgxTMlZmXvfzULMLhfUa8Zgzyn9UmKuhOhTjTC67+KQ1AW
         CdRg==
X-Gm-Message-State: ACgBeo0AgOTrfijHCNEI/6xxCd+fQGW+t7TobC7BqToptQ+tQzjwj+4x
	TR38xeVbV0iwz8GUF0kyHva8v6IeSZsJKtv2
X-Google-Smtp-Source: AA6agR7miAqKtaiHBM5V5kg4ARTL8teYh/JTGjpAcnh9MVfvzICJUWVCq3N9ZPJld7V9cI9+X61IQg==
X-Received: by 2002:a05:6000:1102:b0:220:5c10:5cbe with SMTP id z2-20020a056000110200b002205c105cbemr4922998wrw.359.1659714860091;
        Fri, 05 Aug 2022 08:54:20 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 08:54:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/5] hw/riscv: virt: Fix the plic's address cells
Date: Fri,  5 Aug 2022 16:54:03 +0100
Message-Id: <20220805155405.1504081-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_085421_822677_9D0705C3 
X-CRM114-Status: GOOD (  10.30  )
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

When optional AIA PLIC support was added the to the virt machine, the
address cells property was removed leading the issues with dt-validate
on a dump from the virt machine:
/stuff/qemu/qemu.dtb: plic@c000000: '#address-cells' is a required property
        From schema: /stuff/linux/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
Add back the property to suppress the warning.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: e6faee6585 ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6c61a406c4..8b2978076e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -465,6 +465,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     qemu_fdt_add_subnode(mc->fdt, plic_name);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#address-cells", FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
                                   (char **)&plic_compat,
                                   ARRAY_SIZE(plic_compat));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 984e55c77f..be4ab8fe7f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -111,6 +111,7 @@ enum {
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
+#define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
 #define FDT_IMSIC_INT_CELLS   0
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
