Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D08ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nfdVB31cP1Y9/C1jVHMKUxPSTsO5G6+kZD+yFWAUcxc=; b=jRXDudfEEAj/73
	wBjZ2cazMcTDEwIOUahHyouG15olelOecldn9iUfQUuUdqibijFYqi0KJozieG5HPNkrYYCzVcO5I
	OzIi/rXamnMYy5vPjc0JvqGsw40zD5INcPZzKTY52Tn5UHz0yFPVa8DBoCkg7pw/3XuvL0BRX3WyL
	4kSuImjmBEgG2vXMuEq03VrDPZcSTvntaEUAIRqJ39qfgeUMeAZ4a17QcK66tPp6hZNTmtMQTf9m5
	zvBIa5fbBF3sT2RLfBdr/P1Yl+TcpBw86k0RhCmRklwaHj4L5kOsXo06cZxZmEPEjofeOnZQQMs4/
	YtvPMOPucdAek1s3XAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2sR-00C2Ky-7x; Wed, 21 Sep 2022 16:47:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2sM-00C2Hu-To
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:47:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l8so4881690wmi.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=IaicDJv7f5Dt9tD+h7CLRz4v0jAjgSVUGTvRxbodkhg=;
        b=3sU0tPRItlL5eswzbcZrS4epiOJWfRU+1EV1iop2VTBj6puiryrMUEyPJFqxe0BnA+
         aVN+YAx5VmmRkK0ihSj8MfVf2mBL90mxb7iJMsgQYnNIddO2fYS/5ksgSXZ0m/jllPhA
         XGIG6JJLAbnzlUXXB29J0C0yC+uLpLcygnr5NM7uPj/0XnAZVD42sQ4C6bwDK83qhfcD
         MKahRQP7U4qXuxN1OiJA7BzLcYZXfvJJX9isG6W7r48g1sHqHZpVOfgiH873L18YgbKw
         fsO3AtOY+YqEAZi4TegCZVejeFph7xDeKxwGpgIeGR+r7+b6yidK3HiOVsDlJkUzXnk/
         LOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=IaicDJv7f5Dt9tD+h7CLRz4v0jAjgSVUGTvRxbodkhg=;
        b=poIiwAEy+EFlreXHc5sMca9Ay81o3SydQ5NIRgcrzjOfQotGqCRBZhQenB2XQWB1LR
         TyfR30MDTFvlJL2ohMje80kuWxrlL7Ib/JAPU1XD4Yk2vLhkualFJFSa7xE6vvjE2SuU
         uYLNlX4uEKcfqAHU2h/iLoM1UtrX4ADDUMosdAdeesmLZIdbeUt/HxsNwb9nFmElpJsd
         U7QGQHAD7chx4fdhIdpolgX1gGA0nTKZVur1Q/nbH1rSwZKJ+pQhch8gS4HA4vzBNVw3
         ExuVoWoYQ51AuS8rzErbg3eI1ilcFqCWvZ2azB/AP0KPw5JFExuRUNdCQU1+mYE0y2vI
         t72w==
X-Gm-Message-State: ACrzQf2+FlMPgJiZEVmMwPWUkf3OaOxWZ93HyP3Pdskt8Mu4OUFCGd94
	o5dESZAIF8VdJt3QjvKBjnLpX+gJGfzSj9tyW8hLrbHcI8Burg==
X-Google-Smtp-Source: AMsMyM5nEL3KU8p8Dn2FopGVo+1ah3Jp+xENkt72+BNWlaGcks0EoborsXg8xdnM+ntSybWhhrpbfpKhFvD9l5+Ypew=
X-Received: by 2002:a05:600c:1c84:b0:3b3:ef37:afd3 with SMTP id
 k4-20020a05600c1c8400b003b3ef37afd3mr6312674wms.155.1663778822974; Wed, 21
 Sep 2022 09:47:02 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:46:27 -0700
Message-ID: <CAM2SziXUfXFHtn4GmeR8qeB60TMHMeSH2iEEpki3AWpcRCV=+g@mail.gmail.com>
Subject: [PATCH 02/17] riscv: Extending cpufeature.c to detect V-extension
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094706_990940_DB93AF25 
X-CRM114-Status: UNSURE (   8.91  )
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

Current cpufeature.c doesn't support detecting V-extension, because
"rv64" also contain a 'v' letter and we need to skip it.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwcap.h
b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F     (1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D     (1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C     (1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V     (1 << ('V' - 'A'))

 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 553d755483ed..8d4448c2d4f4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,6 +83,7 @@ void __init riscv_fill_hwcap(void)
        isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
        isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
        isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+       isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;

        elf_hwcap = 0;

--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
