Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E295C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwDIxWeVXEhNiOhyi+H42LcmobFI0rnHdfsGrjFJnwk=; b=F66vQ6Lve5I5nu
	VG9vtHJt5OBqpKNUd0hZsdRTwy6z3t0k3SpqTAmQM+2DEDXYRoneVj43RDTtfo8D0gKgfz0Mj/E/0
	YVFte/FdWTJmvLrG/v1nuYgUGEsMYC1pWmMeZakEKHbWZfeZImRhakgqwWPexKfKDHhv5TDc4N1ay
	lUFMYQKdDxHQiLU7cYNvDzejoF9MxVnDprT0ulng8I71wgha77m1gKI1Ur5bgsIAPA747TAN7tqAB
	wv5H4OgcmmMJm8sQnIWYj5gq25AFDNAd1GwX22g8xS3LOy+SyVd8joXwX804crGzitq0DWpapFUKy
	kZutApbwWibIBY8N9sFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phR3v-00H5ft-1G;
	Wed, 29 Mar 2023 08:21:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phR3s-00H5eF-0y
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 08:21:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m2so14752334wrh.6
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680078096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WewY0DznJP4LApS0GHZeFjLTcqljUJT3mfDrQD/hrs=;
        b=1j+yjVFzgDuEqDrH3wcL6j4lDQph105p+FxdB5PlVelAMl/atkJx91n8nnhjNlyp6k
         7Gchfj9ofuRnBYEFoSDWibQG3PxSjm9l61j4kHzr8i3kVMlF87wXOxuwfN4mSZ02XkFg
         91aUrbYiXIew8Kpm4w38L75Zj1fphTKi5aofFqGKGt6hZ/PSfbmth0UQp1zROHzqoZZr
         otCGq5bPYPDSFRTxrfstKQBTB9JshQK4VEgcOku7pf5LIZr0GintP9TO+jF0EmetGLOb
         5r1B68Pgd0pIIQx7+0Uxgx3l181h/felieYAM64eli3GDO0cx7G2+sLlKMlm1nSo2XE9
         Yd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WewY0DznJP4LApS0GHZeFjLTcqljUJT3mfDrQD/hrs=;
        b=PyWbp2iTluBunGpHghJNe8mEjeyqLFxm3VHHgFdtvU9miVNZBVKO/86/rz8YaGtNeV
         Vq77JRZR9U5qmTsO6Ljdox/BY8H+ZewBnQRqaN0Xkp6Uqdg7N3lViAcUwC4KmuWjnl35
         G0AZHx0/g0hQX3zk+HZqLFohXvndr39TXaOb+3dKVyYSr7kP0riVp2E368QL/aPN+W6G
         WXmofHCVmHcwdVCrGIrjb+u+FV0v0+x09QqK+5m0Hr0saicIUGwRN7vojkAy//1la26P
         BdYUDOi7NFAco3Jc+5b0KfbW8pyX9KMYM4k49U/lRxAlhGLfSJGUeG8dxDK8MMJTOB+4
         r0Gg==
X-Gm-Message-State: AAQBX9e5KE/ldQoH9Wo/nSBUp2ZqQMX0E/wCoNQDNFHMV2Zu0M6xb68w
	fAtG/KT/jhsSW/LDSgzFtao5Rogme3qElE8d1cY=
X-Google-Smtp-Source: AKy350Z+kqeHRHKVqi6mrMxS4VxHHOKVytdbwzxF+3lbgNW435IPFEJEmKiv6Ii7I0mVXVrMHAdayQ==
X-Received: by 2002:a5d:674e:0:b0:2d2:74d6:6f79 with SMTP id l14-20020a5d674e000000b002d274d66f79mr15795845wrw.59.1680078096581;
        Wed, 29 Mar 2023 01:21:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000050a00b002d78a96cf5fsm22499173wrf.70.2023.03.29.01.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:21:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes v2 2/3] riscv: Do not set initial_boot_params to the linear address of the dtb
Date: Wed, 29 Mar 2023 10:19:31 +0200
Message-Id: <20230329081932.79831-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329081932.79831-1-alexghiti@rivosinc.com>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_012140_339573_E58BE361 
X-CRM114-Status: GOOD (  10.58  )
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

early_init_dt_verify() is already called in parse_dtb() and since the dtb
address does not change anymore (it is now in the fixmap region), no need
to reset initial_boot_params by calling early_init_dt_verify() again.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 542eed85ad2c..a059b73f4ddb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
-	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
-		unflatten_device_tree();
-	else
-		pr_err("No DTB found in kernel mappings\n");
+	unflatten_device_tree();
 #endif
 	misc_mem_init();
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
