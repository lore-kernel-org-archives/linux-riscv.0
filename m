Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC51C48BC3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oyz50s2S0QiJmtO73Ikdfka/Culggel74pxUsWbGpFc=; b=YtP8yve/+j1uj0+Q1OIpfVNobi
	uDoKqLo6menPCYlvWKqUJetS3UF4K+OYhhTqaQkmppBjotCSwdMEMQ5UrTKSSlEOXY8o7qHr795rh
	hx4pzEO5RTyRjxKyt8la5Jhu3us/sLrq+Fb2pwxTB4P62k/cqogGkv0lHItugvZtil+zTsTKAjMC/
	jJyW4TlCtyMuDIbEQHZuOVSya5L5+9unEhUEWsNQdC5q+8H4c+R1TT9nmNFxdEtlyls/XkfVVjK6L
	FShO09GkajlTfttXlypQbJCZVyfmph4BWb/q2NZj4hDJn0SXvBvcEzsBmjmRCaql9MEG3mRcDOnqZ
	Ki4C7jBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKV2-00000005iC1-0GVK;
	Sat, 17 Feb 2024 13:13:00 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKUy-00000005iBP-1POW
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 13:12:58 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc6ceade361so5595715276.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 05:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708175575; x=1708780375; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Nhq6jELtlORL5ogz3lCatqW4aS8TpTjuA/JogYOAbE=;
        b=BNy/gqTTpfmCXCQ2cIMbBzWEglYF8i2jaiSAmTL6OwQfuRnDEwESyReL6LXt9juvTE
         WvqTNqWfMbJEF4X1tt94RvG0DFOIMyZk+k4rTOBtza5C3OJYtx7t85khlWU0An95WH+Q
         wFz+tLpZTxq0MlY8ka+b4RoWl46zXTxJ6l3rElN0OQF71GFOkQoik/cXWMCoAUoNTHg3
         b24C3v2ytI6JItWv8LH8uawHaT2m7i1Vuf1vqkO3aaZtCxMW/phZc6GkoH1eOyVZxXz4
         2pVCt+tZLLgP4Y2eH0ru83xBuUaZWw7wKtZ0TiGsRfV2d2QRi95QG9oKEVjBHD6uMtG0
         CNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708175575; x=1708780375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Nhq6jELtlORL5ogz3lCatqW4aS8TpTjuA/JogYOAbE=;
        b=TF4Wtp7YJAvTr45/Mwa1dlBs6LYQ5l4KszWbsYt4oE4pDvJpSLhZ8hZBxOS/dxRoXp
         RqS0BIL4WPLXt9qmlF/HW4kDuJBUhZqTzIrr/hRh+bvM6h3BELAUxugbVXXi+vnDIYLC
         ITN2XP8lWGi1oxsosTN5yXGI209BbmlJ5xiIF1HkekTJBm3SXn036S+rpjsQNcz0JfHF
         MZqyFSmikwG4+UM506euzXgPAZLcUWpQoEIh+3ur6Y2Rxi0dl5v20k1XbglqUWbwTASS
         mWfv2zb8CTDRUebK7PVkE5/J/tGZVpy+kLbGi7JpAsWlFkFPrs5MvEAwgmT2UBEeD5yn
         ko5Q==
X-Gm-Message-State: AOJu0YzQaFxUI8Nu1CzWyfwtXDJN8CaEvM87i3HkhxUpxR2Upn5t2fR5
	jr9SObcAnpoWJSZ5Pv+R0/zAAMKO33SkeSQHfxqy4vI9Fhf5EnLE1cACKBMbC2e0rzZTrRYIZeV
	g0n57+a9KSjkY/CcEEA==
X-Google-Smtp-Source: AGHT+IELhbiToXabxhoUii8w461MsVDnMXHO661y+j2h5Y0RY6bmJ1OQ3jt3aXw7K1MJbxPyaQkNPeYOrWzAEoyD
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:2284:b0:dc8:5e26:f4d7 with
 SMTP id dn4-20020a056902228400b00dc85e26f4d7mr1779458ybb.13.1708175574920;
 Sat, 17 Feb 2024 05:12:54 -0800 (PST)
Date: Sat, 17 Feb 2024 13:12:49 +0000
In-Reply-To: <20240217131206.3667544-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240217131206.3667544-1-ericchancf@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240217131249.3668103-1-ericchancf@google.com>
Subject: [PATCH v6 1/4] riscv/barrier: Define __{mb,rmb,wmb}
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com, conor.dooley@microchip.com, parri.andrea@gmail.com, 
	emil.renner.berthing@canonical.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_051256_395005_B56777D3 
X-CRM114-Status: UNSURE (   9.04  )
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

Introduce __{mb,rmb,wmb}, and rely on the generic definitions for
{mb,rmb,wmb}. Although KCSAN is not supported yet, the definitions can
be made more consistent with generic instrumentation. Also add a space
to make the changes pass check by checkpatch.pl.
Without the space, the error message is as below:
ERROR: space required after that ',' (ctx:VxV)
26: FILE: arch/riscv/include/asm/barrier.h:23:
+#define __mb()         RISCV_FENCE(iorw,iorw)
                                        ^

Signed-off-by: Eric Chan <ericchancf@google.com>
---
v5 -> v6: let this change to pass review by checkpatch.pl instead
of overwriting again in [PATCH 4/4]

v3 -> v4: fix commit message weird line breaks

 arch/riscv/include/asm/barrier.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 110752594228..173b44a989f8 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -20,9 +20,9 @@
 	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

 /* These barriers need to enforce ordering on both devices or memory. */
-#define mb()		RISCV_FENCE(iorw,iorw)
-#define rmb()		RISCV_FENCE(ir,ir)
-#define wmb()		RISCV_FENCE(ow,ow)
+#define __mb()		RISCV_FENCE(iorw, iorw)
+#define __rmb()		RISCV_FENCE(ir, ir)
+#define __wmb()		RISCV_FENCE(ow, ow)

 /* These barriers do not need to enforce ordering on devices, just memory. */
 #define __smp_mb()	RISCV_FENCE(rw,rw)
--
2.44.0.rc0.258.g7320e95886-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
