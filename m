Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E314C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yd9zBWv2+xz0d+WaNzYjH3Kb92YMGc12XH9w7AqLUzE=; b=s8E0Eo6MI3ht5i
	kM0l4Qh8tl0Ok0OoLYOILEUGsxm9Bd/m3BOVO1bPAxOJV4Md6ymnlv+eJsniAu113fQ9artRfGBuK
	DGCiAk7GuaEx/QopydSMJyN1oy49VMW3IHfwuYbuFoF5skUU82LwZ6kXxH0PNoZabd8fd6gdWyzgu
	eIHq/PLM4PRE03PsiSiy9kOsmh25zqAKqHop5J7BnidQDIwz44dgkL90F4NqJ/kK51Llfu7QJae8D
	z0aKMItQ2WjAu6Xv5cftDL0+RjjWe2iU5g05iVg2Ofiesu9Q9Z5GPF6+CaTniej/h0N/6UXS59k3R
	FGnH2L5ONi9zt0XdWVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBwm-007dIX-1o;
	Wed, 01 Nov 2023 14:11:52 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBwj-007dHw-0L
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 14:11:51 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53fa455cd94so5140772a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698847907; x=1699452707; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=kJCSl6f6X4o6XuXPdXYwbMzr8jK43syYXHj7vVymgkA=;
        b=Y1CCTm0VtBUEhHQVG7V1S55b1ExRRY4oDsjqKyMxN8hxgWBc5udjfOzWq/sYvQ/Xxu
         DyktqPH43nXX66xVev17v0XXr2JBUcusKivMp2F3h0SGpYH2IDDKQ3ZOQowgF7yTRv52
         JXuiDAAFiBNxwrq7H1m5IbesCCxFeMm72yV94h8h5kt2QM9H16OqoxxJ8ZvikVlKX29l
         ZExUuX38mrilcTnRH+fearz9akuhZY4kPPl271eB2i1bM9znn5A5+5yaZrQt46V+lzVM
         BLBq/kVR05H2Q8jZVnraxNBUAvDwoJKrR79vQ0tR8FieOcL4zvZ3p5KMLjWt1HUidDm7
         Mu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698847907; x=1699452707;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJCSl6f6X4o6XuXPdXYwbMzr8jK43syYXHj7vVymgkA=;
        b=SAb+gv7Z5e1GPuzC2afncr3BhA4KWNt9r7FQlE0iBQMPqv+X5Jdg5HQyZyIf8gN1br
         iCu0QkDz09mgDuMYZpmmnub3PwEAbUBU8/stbN0U0sX7PMU8B53a1WSKKTD4BGd01C5P
         /z5NqPKLuCKP3cETl4skWfgqinohOQRa0eI/YMNkKl1yt+JfrkI2jYn56nCY6XYpWQhU
         qoe7AvhAUwI7Z632bWe8KNeBvRzr0HpWI1pM02YSKfGgQtgwiBm1wn1LlNdIi+85IfXp
         aXvh6BWX7mdQpDn64SETNZVoiluRCVr1Gylw9oGQLOQxdMRO7YACSyyx3uUIExqg5aOJ
         +C/g==
X-Gm-Message-State: AOJu0Yx7W59PLIqWR+znhvItSE4AaeiO9GvRxEzRdamCpk6YQo6GR4OD
	RquWovMrLA4Rw6wpyUc+4sY+5ggwCp+tx3y/f1Q=
X-Google-Smtp-Source: AGHT+IFg/u+au8kvxjjsxG/97ywGGhA/F2in6OG6bv3wuozncJhNO2IsVmNTo4FBJvM6S96qNOMbQA==
X-Received: by 2002:a17:90a:4b07:b0:27f:f260:ceaf with SMTP id g7-20020a17090a4b0700b0027ff260ceafmr12192187pjh.10.1698847906641;
        Wed, 01 Nov 2023 07:11:46 -0700 (PDT)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id ei4-20020a17090ae54400b00280c9ba1176sm794823pjb.48.2023.11.01.07.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:11:46 -0700 (PDT)
Subject: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
Date: Wed,  1 Nov 2023 07:11:04 -0700
Message-ID: <20231101141103.30682-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_071149_145846_BBB123E4 
X-CRM114-Status: GOOD (  19.18  )
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

A handful of user-visible behavior is based on the frequency of the
machine-mode time.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
"Stat_headcrabed" on IRC asked for this.  I said it was easy and they
should do it themselves, but they'd logged off by the time I got around
to reading messages this morning.  This is more of an example than
anything, but I figured it'd be easier to just send it.

We likely need to think a bit about exactly how this is defined: there's
more than just mtime now, and we've also got things like virtualization
and perf.  I'm not even sure it's sane to put this in hwprobe as opposed
to providing it via some perf-related infrastructure...

It's the merge window so I'm not going to think about it, if someone
wants to pick this up they're more than welcome to.
---
 Documentation/riscv/hwprobe.rst       | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index a52996b22f75..3ec35c1f3819 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -96,3 +96,5 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MTIME_FREQ`: Frequency (in Hz) of `mtime`.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 78936f4ff513..39df8604fea1 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 5
+#define RISCV_HWPROBE_MAX_KEY 6
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 006bfb48343d..2dc34d474724 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -36,6 +36,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
+#define RISCV_HWPROBE_KEY_MTIME_FREQ	6
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 473159b5f303..facfa38f4c8a 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -8,6 +8,7 @@
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
+#include <asm/delay.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
 #include <asm/vector.h>
@@ -215,6 +216,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
+	case RISCV_HWPROBE_KEY_MTIME_FREQ:
+		pair->value = riscv_timebase;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
