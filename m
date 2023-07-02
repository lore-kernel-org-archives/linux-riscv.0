Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54252EB64DA
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2691DZ/AsdxRCF3c9r+U8kqpHPALLPC9A2W2bpOdt0=; b=dWyZukp7EjTxE2
	fwIqtqUPw5bLyXMnvfGLslarp7QEAodvcP7HfPqHE1O8UClaTXZ4rKwyN8HA//eBqKa3NBV2mCZzM
	K0bZgX9ztAxppR1u2uSNCHBgFp+XT/FU8S+GlKBTIzxf4rrFtdtWeeSMwkj2SHgkntfo5l6NAsOwD
	hHC8IAJpA5xhXZy2c8B5qYr880NTLIosMAsrPa4tLhZjqek8pqeiTrkeZKkWDX7o6hvYOsYi6vNh5
	gDP3E0zM/Bp4vlDR9hIjY/8/yc7liiHg+nJHstnuEKNyGhr0ah7Cf4n7ef00PHy3Ki/omOvRQ/TWj
	BN9J0hj7zvncJzRbxfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtqW-007Wd8-1v;
	Sun, 02 Jul 2023 09:58:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtqN-007Wbz-2D
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 09:58:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so1706582b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688291890; x=1690883890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkAY8od4kopgBrvcbw1hFpjzgJzWLikggNI5ytXC3Uk=;
        b=loY2CFs4lCMCrbHrZ0yHjXW0d09bE4yUX16zdqny9IfQYSrLVevitIgjVjuraQ1Gi1
         WAmfNin9IKUl2GQp00jw/CWIWhYqGbAHp8jvoeWHdW2tcmtEKvfGCCrVB8hx6Q4Sjqqf
         HIaVcB+YtGA+M3GO+XfmBpZplhMaqD7hiiyflwP4RFdvBAZ38PNOqc3mzDurTK86p+je
         M1nxappZcfZ3mae9G8be5IBvNUlyRsR6sVYEV+W25NJWKZ4q+aoamrJnQ3X1ZRNQGXL6
         Qmj/bbGQGyhVgTzIthLGGC/bHbI5sBzTGrTmwXacCHk2kbdGKz+PNnTZBecgIiHh5zI9
         UFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688291890; x=1690883890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkAY8od4kopgBrvcbw1hFpjzgJzWLikggNI5ytXC3Uk=;
        b=fpB4rv38gbUFAylVHCuq9LK2EZ1PsYPDOxxRLMQlWhOp+gri7bjAsNfMLgNz0in7Gy
         BKrukzrRmD7Tk/poENuQcmhG63aJUGFwj9OeKCCTN5Rg3EGyBNDMUum9H3cDxBC8IOR6
         /h24hxoEpEFEKTEssxSyVYwdF+3svdgZL/XWZYWLvyeVs/jnaLDa1ehJatEKZ1kB5wyT
         ddo3W7SX9XSm5i9idQeHR6IOFsVfVWn9yBjOqIm4RQ69WZTYCbTXM4EfZ9jUT1Goq8lF
         D0NpQLL+F18icEN1DekF5mAT4sZzXJ42vwi/G9uQDUEsLWRVOxXW1+zd6Gm/m2Qd0hsZ
         orPA==
X-Gm-Message-State: ABy/qLYbBOEKQYRHMb32FYsuejnqDgr8j4WPYP3a18EYGVWP2eW1XpS0
	rq3WUVWFza0/aRmHZ+oyt7LvJw==
X-Google-Smtp-Source: APBJJlEXSgBPi382cT8u7InSOCN1bAAjdhLBtHtZTpazMFigPk1oiVbNh/c+TMlLCxgtWsKVe0Y3jA==
X-Received: by 2002:a05:6a00:2d87:b0:682:4de1:adcc with SMTP id fb7-20020a056a002d8700b006824de1adccmr7473435pfb.12.1688291890230;
        Sun, 02 Jul 2023 02:58:10 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id u26-20020a62ed1a000000b006827d86ca0csm1605095pfh.55.2023.07.02.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 02:58:09 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ardb@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	rminnich@gmail.com,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	jdelvare@suse.com,
	yc.hung@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	pierre-louis.bossart@linux.intel.com,
	tinghan.shen@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	geshijian@bytedance.com,
	weidong.wd@bytedance.com,
	cuiyunhui@bytedance.com
Subject: [PATCH v2 3/3] riscv: obtain SMBIOS entry from FFI.
Date: Sun,  2 Jul 2023 17:57:34 +0800
Message-Id: <20230702095735.860-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20230702095735.860-1-cuiyunhui@bytedance.com>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_025812_433552_15FD1A96 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

When we bringup with coreboot on riscv, we need to obtain
the entry address of SMBIOS through the FFI scheme.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/ffi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/ffi.c b/arch/riscv/kernel/ffi.c
index c5ac2b5d9148..c44f943a1cb5 100644
--- a/arch/riscv/kernel/ffi.c
+++ b/arch/riscv/kernel/ffi.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/ffi.h>
 
 u64 acpi_rsdp;
 
@@ -34,4 +35,7 @@ void __init ffi_acpi_root_pointer(void)
 void __init ffi_init(void)
 {
 	ffi_acpi_root_pointer();
+#if CONFIG_FDT_FW_INTERFACE
+	ffi_smbios_root_pointer();
+#endif
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
