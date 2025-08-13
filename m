Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179C2CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KmsjDPa4Y2UdTbBXOFLDS87+LpobKrcMKL5MbCWcGGU=; b=He9RBFHura60S1
	H0JeDlZuot40h52UPp7NJ2auM6h7vYvVzdgZEVWoGrT0s77KX16gl5G3edp1MPofYA9AFENEmI2Nl
	TqV7B0NVC1aF2e+x8JDGLRjyWDUMaWttMKr4BO8VNyxCa9h48D7AX4F5wc9caqmlIHCGGDoVXvoI4
	+kPV5BfQr1HB5n6y/4OIc96sVlqLRLS015nLRZlhErdfL0NRnGPWc1se0qQmpxPO8mVZeTZSKBrnE
	FLQtM80JpIWMmmpRpu/6ZqFCOkeA1ZbmTTJ9AlRJuLPCPx5VQUoh+fuuPSNDIVgyid1HkMV5DFkaZ
	1VrC7AoQcj88b9xD9/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umF1P-0000000EYRR-0nie;
	Wed, 13 Aug 2025 17:12:19 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEQK-0000000EQ4m-2pPB
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 16:34:02 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e931cc78a05so59710276.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755102839; x=1755707639; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gOz1+0DNUxv1FqWb8ffV+5DpUijmBF4RC47iMywpm+4=;
        b=ZtsEteJ7uTAB5mxzZJQaUOyMQHwg6GYaMaBlABMWf3sykMtekH66GHfT+72u9kzT7u
         iSF8ZbE/xKPeaZrwCFxl2FlkaEU+JSJZGBKUPD5OjBI1oOsmeZsL8Xdq2vSPIQ65dszS
         wVE/o2WAeKiddlKDBFEbEW6d97M0jnVL5jFRkBiYx2vSVcmOhowPQxJCaRhd5SUq3FW2
         vWM8WjPFpHOuArppx7gAfikt5Eao3Dwb2sWGguZ4k4f3zingJU8zZM1dNCNpxEjcjEkZ
         jpkymj1naMxvjUi9q0NwDsVpd5oUnkudlrfZlytN6S5ZxWjaFKFyP3Nh7zHVt2cSzfXp
         nYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755102839; x=1755707639;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOz1+0DNUxv1FqWb8ffV+5DpUijmBF4RC47iMywpm+4=;
        b=PdF/VOu1zI8BRo/suOah9vfNRPruuOJStz2OSh5WsJSv6/VPp0L01JrUkkN+uOtj7z
         dzjE4Ls9zHx3qt+SZ9yFBSutmcIF75XaXkHJuAfTBEWAVxQGoVpoWJPMFCeGkp+l7P5/
         mHi7134wvS+YWp9JKjmcDb/ocss5mOGR4h6fy5eHUMKG7CDxPWWPEQbNxNd+nHQZcq+t
         P4+1+F/hYOzIKWHlps8qHbtJaqVWqyP3Q8CX5c6dkDNS5BwWi89M/xuPjPkWN+sxXN2C
         VECjK2v3ttwj+1/+ZtBYT896CcyX7T7ecmqakefYyHPls2ObHZxiToOE3z/HoRNCeoIv
         IP0g==
X-Gm-Message-State: AOJu0YxXPWY6odF2937kQX+20PwAyx3b1T+cHpVWrk6EthvHnzcHf51N
	cJ7MwZfwPCfAYPdlyN3vEwnbOjftmzfg6pBUC9E9+QICv28HGRWx0izovFxR3APrg5Z8EGY571p
	xZGi4Q9S0GF6Eu5n3waqFxiY3a6JoBLMOEoCtL8yoTg==
X-Gm-Gg: ASbGncsOx0Yiuu23b3cWXsc7Vg1+PBiTJqKyCWI9WYlzXT8ZRFeIyl96R/4q0OKvakW
	7yjhXNQMi17wv+cApjllZ+OfBI3xJNE3/2o8HSOOlX5vf00bpevtFCck6Exa3j/UBZw2RaADfvN
	9eaAf7W4I76fjPAHFc0PXbjp+mPkVKWv+lw2QHJQhgbDnFRVK+dc2USCZkrkxxQ0TZBHrdqwJg4
	3m2z0+rGE3A82/rl9I6yYgcLQybWJLIq/dTkUY=
X-Google-Smtp-Source: AGHT+IGFTOsNgcMsp1G/6uvcWM7NuJfxpZ0nRE4S4j9tsmS2NkdWYGcubu9SBde5xtQhNFt6zcBvjCxOCH/aWlNdonM=
X-Received: by 2002:a05:690c:4809:b0:71c:1de5:5da5 with SMTP id
 00721157ae682-71d4e5b68camr41073717b3.38.1755102839374; Wed, 13 Aug 2025
 09:33:59 -0700 (PDT)
MIME-Version: 1.0
From: Paris Oplopoios <parisoplop@gmail.com>
Date: Wed, 13 Aug 2025 19:33:48 +0300
X-Gm-Features: Ac12FXxvHSGQlTSbwWUJTmfX5RBpFQV0w4Dc8Ep1MRR9VxYNT25e2ttoU-MtZ8A
Message-ID: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
Subject: [PATCH] riscv: hwprobe: allow querying available RISCV_HWPROBE_KEY_IMA_EXT_0
 bits
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_093400_721777_F67BBFFD 
X-CRM114-Status: GOOD (  13.98  )
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

When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
bit in the resulting bitmask means extension is not available or the kernel is
not recent enough to support the bit. Currently, there's no way to
differentiate between the two.

This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL, which
returns a bitmask of all queryable supported by the kernel
in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a fallback
extension detection method when the bit they want to query is not available
in the kernel they are running on.

Example usage:

    struct riscv_hwprobe req = { RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL, 0 };
    int ret = syscall(__NR_riscv_hwprobe, &req, 1, 0, NULL, 0);
    if (ret == 0) {
        uint64_t bitmask = req.value;
        if (bitmask & RISCV_HWPROBE_EXT_ZABHA) {
            // Check for existence of Zabha extension using riscv_hwprobe
        } else {
            // Fallback to checking if an instruction in the Zabha
            // extension results in an illegal instruction exception
        }
    }

Signed-off-by: Paris Oplopoios <parisoplop@gmail.com>

---

diff --git a/Documentation/arch/riscv/hwprobe.rst
b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5d..6d77def0a46e 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -360,4 +360,7 @@ The following keys are defined:

     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix
Multiply Accumulate
-    Instruction Extensions Specification.
\ No newline at end of file
+    Instruction Extensions Specification.
+
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing
the extensions
+  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
\ No newline at end of file
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 7fe0a379474a..501d49b7a02a 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,8 @@

 #include <uapi/asm/hwprobe.h>

-#define RISCV_HWPROBE_MAX_KEY 13
+#define RISCV_HWPROBE_MAX_KEY 14
+#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE    ((1ULL << 59) - 1)

 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h
b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad970499..a3b92df4dc05 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define        RISCV_HWPROBE_EXT_ZAAMO        (1ULL << 56)
 #define        RISCV_HWPROBE_EXT_ZALRSC    (1ULL << 57)
 #define        RISCV_HWPROBE_EXT_ZABHA        (1ULL << 58)
+/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
 #define RISCV_HWPROBE_KEY_CPUPERF_0    5
 #define        RISCV_HWPROBE_MISALIGNED_UNKNOWN    (0 << 0)
 #define        RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)
@@ -106,6 +107,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0    11
 #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE    12
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0    13
+#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */

 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2be..40e7fa5f85f3 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
         hwprobe_isa_vendor_ext_thead_0(pair, cpus);
         break;

+    case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
+        pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
+        break;
+
     /*
      * For forward compatibility, unknown keys don't fail the whole
      * call, but get their element key set to -1 and value set to 0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
