Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC158E7E379
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=urb/fDqGT+r6HJCYn261+SgMwxcbJhm3YFcYABpRlK4=; b=ZYy51XAGM4nhU5
	ksqDwDlwL2eCi7TqAOtIQ78t2zpyl47guU+pTiLqOc5qATy/pvMaHnwvnB9Vssk//3U/tXq2LnG3j
	xfWxU7PFUtKu6Wa14Oe4DN/glv0/8FwDlXdBcbrpxRvo+WT4xm8gZS/gYerKrhv+AhOweEltUnZWZ
	Qgutv3Z1jROZ9lITT5rskqsMwtBtdD8Vb0FCUh/7uq51Ggm5k9XdCA/MievWPzjuvtifmuicJQHcZ
	EJmEcLHRoFjaqlbkczQU6cyxBhJ7VEiIYIpezn5IQvcED4ZNksFR9LpouNMQgVDTSNDKNBWcXLt26
	prWmLIPsppfLmPuVKZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cpN-00000001xse-1iEU;
	Fri, 03 Apr 2026 11:36:41 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cpK-00000001xsG-2wrm
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:36:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso1070372a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216198; x=1775820998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASYJwuBhu5a8LjNhoHAH0mC1WnGEKpiV1VXSV5azjak=;
        b=iPg8WT8nPKGtwngCx25osAteJ9hO5E9OkMjSwKQXRk2w3xa14LjbG6A5n48Y2AaEGM
         xgX2vr8KbpxX+77vW3YA6iMZYp+5OieLbxftol911peJxDylN54iRIWu4oUj5NVfR8//
         Rc7oxta5AwL//BJ31oMSrfbwfMcDu0ZgchPL4UlMlTKNCi3l6FzyIdU8P7JLP541VMzG
         y75rTUZ9SPqNWHpUulhpcx8OtKdUp0/r+cCO8d2B4QeKczTUC4hc76tndtBkLigJGFT5
         womvtuzSsjiLm8mUf46FSi4lCRF2QkEkCgvNqNl+XHKOo6d3iCyzRMgTTAF5u6Km4ylB
         z7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216198; x=1775820998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASYJwuBhu5a8LjNhoHAH0mC1WnGEKpiV1VXSV5azjak=;
        b=LKuJXTJi4bsPpcjKzdjo9MvxGa1xEiX0/fJi1hsQIM9BMG9Z+ibdEnkZkqNS1YuvUi
         E8jx0tz1/7prfMNiav2OeYzrIuma9t/ShVKSviZx3u3ExbtGFkhRZmH5FdCd6Z2TT9QZ
         dDWsPaqc3GKcJmMNmTP8H9aem7Kyh2TWA2P3KvVRmCWvn5p/O1lAQ1at/NZSYhpRLJhv
         g44yh4BGiC0EvyKT7YhnUY/t4ey7xcBIw4szZEH/55zJh3vYaulmG+TWQCGSoLEhL/Um
         EKaM4wNgygkoPu1l0fJMXHrePUs4uiJY/1P/QaGUEo8Do2A1Hya2Ym1MFQpis3aaEUGB
         rHEg==
X-Forwarded-Encrypted: i=1; AJvYcCW9FXowtZOZU5cCf31anrDBKg+eHUs9bKaawe5Hl/hUGCBJOX/5mbQVHXrEifCoZwt9aG2LWzzQ1HpQig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiY6dEjR+54k1AkrBHlNCcBS2AxG9FxflhY/P6CofwULysUK4t
	rLG7wLZ2FD1sWVrDUeFR34hlntOebwcRN8ndgUwnlbpXhNO/fBsgamHO
X-Gm-Gg: AeBDievtD0WI3LwWo0rb5rZgqTKwQy44QiiL+++1JQN/PGv3/rA7Mj2mmCLW7oGuAn3
	jPp/aiSWNu2hTB7QteHWR0c65WqCoB+9zyemTFT7hCIlEFlQiZ+3UjfiR1XcVDcefKkkdohAAH0
	LCVaPvVAsvsP5MDd8nljNZ4y1VpTRIaAaJMoKpgCD+S7I/hojbntITssI2MsOsmaLVkC9yCZe2B
	5w85DmcE43Nus9aNpx8l6m/rCEBf/tJPGiHh5GBNkBcDOE4dEYeQ0UBXV+riCqTpyIIlUiz2qRQ
	MNtp/Q9yRrNce/0uCeEJNGUjlYu7mV7DEO6gD8NGCvMZuR8f+pTXLeysFhN14Z2EZ/u2SfvvPCO
	BiZyHzOjxXDjwIr1VYuBTk4G/KLiBZAKiiSBL7xwW+ZBaHDYJYjDxP/tBEoZ7jYGNhVULGEq6Br
	/1MVgJznRJc3RGvnP3Z04=
X-Received: by 2002:a17:90b:4b89:b0:35d:a9bd:1ff6 with SMTP id 98e67ed59e1d1-35de695fa86mr2252467a91.23.1775216197136;
        Fri, 03 Apr 2026 04:36:37 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:36:36 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH linux-next v1 0/3]  spacemit: k1-bananapi-f3: Fix the power source of USB3 nodes
Date: Wed, 25 Mar 2026 13:46:07 +0530
Message-ID: <20260325081700.1502-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_043638_741863_9FD9D925 
X-CRM114-Status: UNSURE (   7.92  )
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

Following changes fix the power source of USB 3 on K1-Bananapi-F3
development board.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view (page 24)

Use this patch now we can enable USB hub
[2] https://lore.kernel.org/all/20260326100010.3588454-2-amadeus@jmu.edu.cn/

check regulator_summary for more details

$ cat /sys/kernel/debug/regulator/regulator_summary 
 dc_in_12v                        3    2      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc5v0_sys                    3    2      0 unknown  5000mV     0mA  5000mV  5000mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV
    vcc_4v                        1    0      0 unknown  4000mV     0mA  4000mV  4000mV

Thanks
-Anand

Anand Moon (3):
  riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for
    Banana Pi F3
  riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard
    usb and lable
  riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)


base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
