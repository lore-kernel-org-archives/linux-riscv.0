Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88776C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DCW2MLbpexa6lNbpIgR4Ef7Egm8CDP3EWuv0I4PsEY=; b=gtPdg3zKJvyEQ+
	HqQdF46OI05l5fNzNE7Rj4+BmT+agfUcTvo2pZdE6HiZ9ElQljh5YRsP4S4LcMfN/+z2jJ9+NsFjo
	IBEoeR9XHupLjkmLyt7TpmAfZ++HmZubyHtZydIsLEvUOVKs9azmJfAv5nOWAbLQsnpac177ju2DK
	+lM8DeUxz9ut1CAqUrKQI3ne6wcgbZSt50kkQhOD8e8l+1NzyqUghEoJHXLdv1/aJ3f/GwGDmsPvF
	ALbO3peoInU/JaHn22DjoX8mKRnkONLydST7qOT17J6Xul/xUEb/ObISEXl0HAGwozmEB2qeLW+db
	U+w/vhnyrs1ZGdS0V2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhjX-007p2t-34; Wed, 25 Jan 2023 15:30:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeX-007VEv-Td
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:21:31 +0000
Received: by mail-pj1-x1030.google.com with SMTP id h5-20020a17090a9c0500b0022bb85eb35dso2137379pjp.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B1Vewq27MsVDR6LunkBJ1YYTsHlWhswm4JoWp73ftL8=;
        b=GPbXzRcSrgSqa0YF13mndutz70nGngxPrYDySfXm5gMEpNnvF18gNQZBJbiT0gohr9
         qYFEv8kXo9FKZAp9BcOVlAZmbWDVKiQxZmFWe2MxYGKfVGon/DUnpQpXVna4FHB2kqdw
         Vx0FCEWf7SaBWZ/gZXebGal5JpWcMCLyVgFNW1iEW4MYkV/oHktDgEWBcNQioTdrw8d4
         PMNiLph4ie0ulAUddetmY/ZsWbpjYs1/FgYtXC4tda0f10PR/s5d9Yz0N5kL7ZWszm8a
         NCt/sm3Yr8apfIOUnfw0aR+SjAIZsrk6I0SIoBAmozyt1qYFOmdTXqQ99q8pjxUuLrhz
         6sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1Vewq27MsVDR6LunkBJ1YYTsHlWhswm4JoWp73ftL8=;
        b=uFUKxQZjeooF4bmivKPuHV1HtcPDuN3r2zuOOnTPBmYc/VYOevqK7N1a3dr+88eXL9
         h3NDS+BoGIQo+1XRH0gVZLCusR4rieE6VOK9FPmIpHf4tdeQ/zkclGv1avHRLGxH0q+w
         owCJG81wWoXxyMp83GS89FScTqgbp1TZ5/W06iSkFrnd2LNhnt2qgy+1eReYmyp44Xl8
         dadQF6a7Ed0QVWc/aOSNX1E5QCPPUkyIaqOupmWedJshRSz5aAaD25f6fTjLXs6naxvL
         +OTgQDvblak59XGPPamjo+T2O5u5LuV2moY4wWqite1kD4KipiB8KuY2Mbt7J7Rz7neV
         dnnQ==
X-Gm-Message-State: AFqh2kqJ32RWI9bM8fXCrpl6I71ch0g2FoBOIZ8hSFuYf6XhYNcSmBC/
	EjYeUzAckttWarNhkdr7bzMYFEaVIE4EKqLDY+jfXvaNoR+5NCFL1LITU7WjS2kZvyuTOmQDtMT
	rLKgrwM20xWecW8QKWcBbo6KyJ5TIS1nLiFYEyrfKBgadlTMmRuJkmnztP9zyxlSggeCE6u0o4l
	pWD4n04S/1Yg==
X-Google-Smtp-Source: AMrXdXvU/TE++7j3AkRLf/KOYTXcYiiY22xpSTc/h/DXT5PHgkrbF0bU3ho8hu0dP/cS19JeRjs+Sw==
X-Received: by 2002:a17:90a:a895:b0:229:d400:11c1 with SMTP id h21-20020a17090aa89500b00229d40011c1mr27005675pjq.10.1674656488157;
        Wed, 25 Jan 2023 06:21:28 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:27 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Changbin Du <changbin.du@intel.com>,
	Myrtle Shah <gatecat@ds0.me>
Subject: [PATCH -next v13 05/19] riscv: Disable Vector Instructions for kernel itself
Date: Wed, 25 Jan 2023 14:20:42 +0000
Message-Id: <20230125142056.18356-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062129_970369_FFDBEC91 
X-CRM114-Status: GOOD (  10.03  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Disable vector instructions execution for kernel mode at its entrances.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
[vineetg: split off vecreg file clearing]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 99d38fdf8b18..e38676d9a0d6 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,10 +77,10 @@ _save_context:
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU to detect illegal usage of floating point in kernel
-	 * space.
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS
+	li t0, SR_SUM | SR_FS_VS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index ea803c96eeff..7cc975ce619d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -140,10 +140,10 @@ secondary_start_sbi:
 	.option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 	/* Set trap vector to spin forever to help debug */
@@ -234,10 +234,10 @@ pmp_done:
 .option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 #ifdef CONFIG_RISCV_BOOT_SPINWAIT
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
