Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E755AC433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 03:41:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE0764FB3
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 03:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE0764FB3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t91vDw7i/aaAKSocZ+LFB0pFcS6yOD/zluF6DqGKdGM=; b=ISu9lX9uwE+nTkLBFlQxsk6ucI
	npEdB6WsLptEGK+9zm92FmE27xDusiKdb27jEQ0AuNmYoo64tIGi9p22apA3zqeZ7sjmKqkXstGca
	fFxAgGM15nOFFTeJSiWehDJsZvQOwuaY+NVhY/YfvwFax0YaS7Qf6AoIciM8W36s+XoYzBuE8cVMR
	DoyubuPDqXAtzv6stl11PJgdA2t8jQeeA2owgmiRkf2CoXA424mOcTO3u47pK9fex13inf7LwgQ7f
	HIxOVSap8iuch3rTVJ0AMfflFDvvcB75k363ga3RSKyc6KEmYGwVNz0aZ151DlqPFYgKvc6SIod4H
	S8iCS26A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7s05-0004gL-Io; Fri, 05 Feb 2021 03:41:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7s02-0004fE-2Z
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 03:41:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id y10so2869026plk.7
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 19:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=XPv9UeIW/g8j3YWUDvgidB0ONJf39fc9JGHRKHAQFsI=;
 b=iykkDVX0eGoZLo0iHPHBquvrEjcIwuw4z58EatThFQ/Wc2cbRMJ0aoVI7TjMLN+Z5b
 f+bcNS2iy+6udLYDGEC7QA9eGNBPINa03G4i+AYntOIqtCC0cQ8BlKswTp3xDbDzF4/4
 zHD2GTsNcLdXK7qtOf26oUdNKO+EVxKAk0emzwhYDxkPuKjvXWB0oNOam0r7bYSnhW9B
 rrZuc0hutI3ua7ebPaDKOcHuajsK6J4DkJI3xUtzYdmLu4U0XxcJgQ3+GE/nirApLs66
 YbW3qvxsENnQZI0KPouHX4zLqyypK7zfuueprKwMndBdvIbYBE/+R9d+ZQGL7awAB6MW
 vLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=XPv9UeIW/g8j3YWUDvgidB0ONJf39fc9JGHRKHAQFsI=;
 b=luxXkpidPngFSjeXlhwqTXMmgRBVMN14Bx/Byax4LU0c5d1uzwQ8qBb1OLzew02dpx
 KxPN5oO1UYRE1+t58U6/7GYukNHzLxuXf39KDOe9QiX/LLDGA7hYL3Cpp/MqIEzGukpN
 Aogpxwem/TfuPQBgoz3m/YD+2oCSEmUZP/h6xjgx8bQftls99mvv3fVLaTn2yoDdMUmU
 wbn8Kvk4sUfCnbZedwFd6iMiZz4XgHpjnaaBw7miRFyQiWA66coccfUHHeqPg0d+up03
 EQTuZoaBOsAcbGoMN5DbVxVF2jprvj35FG6xzLCaAPHXpCALcmNEKkfLCeM2tHpUi0dO
 2a0Q==
X-Gm-Message-State: AOAM531LOTTc9zgP7Z+zx+LdmbhbdSu4HjNKRhPZaCpzewg5pVlMpXoQ
 4i8Dwxnga7NN3t5GXr/w0i52Qw==
X-Google-Smtp-Source: ABdhPJy+UOfuYzHdNONaTTFWTJ7JSrVIFoLGj2lZsAUeJZVG2hyvWNwFRlRea/rNcWgF5zE1BPX0SQ==
X-Received: by 2002:a17:90b:2312:: with SMTP id
 mt18mr2277495pjb.81.1612496494017; 
 Thu, 04 Feb 2021 19:41:34 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w4sm7235138pfi.191.2021.02.04.19.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 19:41:33 -0800 (PST)
Subject: [PATCH] Revert "dts: phy: add GPIO number and active state used for
 phy reset"
Date: Thu,  4 Feb 2021 19:41:12 -0800
Message-Id: <20210205034112.2147142-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_224138_135650_2B8C7BB7 
X-CRM114-Status: GOOD (  11.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, yash.shah@sifive.com, robh+dt@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sagar.kadam@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

VSC8541 phys need a special reset sequence, which the driver doesn't
currentlny support.  As a result enabling the reset via GPIO essentially
guarnteees that the device won't work correctly.

This reverts commit a0fa9d727043da2238432471e85de0bdb8a8df65.

Fixes: a0fa9d727043 ("dts: phy: add GPIO number and active state used for phy reset")
Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 24d75a146e02..60846e88ae4b 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -90,7 +90,6 @@ &eth0 {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.0771";
 		reg = <0>;
-		reset-gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.30.0.478.g8a0d178c01-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
