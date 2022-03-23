Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53736C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EKYwxFXFA4P79LHNLVLOot6qF7RRKkwnxrrjSu5p3tw=; b=4ZZUaaRWrj/nkB
	hGes+WARqE5PaZ8cRvMeshmrYcLzsjOfnWgUUw2TRwT+g5tEBG5HBvnUDBukmukHrk0VMsaEQmadA
	OpF4BJvXe9nUF2khoDqiHNOI3uHcOZho3nBKpEVEkJC1iv2h2vNzx+MBbp/3PLKxqOihBfjqlzV3T
	0kakNwPJ3cXcQDJVZE8lhgYh0YpRfuUPmp2pLuZAlSCQ98HxqmvE7nhcv576anu9eSJ/mihzJPVJ8
	A8nHSXU8eyiiOFZYdk+ISetFB+pKv3IAuRLn6vXlhgkxYpW6cQ1oEUaR6VW8jqVAqaLRuXT5ww0g4
	e/cg1BqLA6FziBuYHrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwrU-00DAOf-Tm; Wed, 23 Mar 2022 09:01:00 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwrS-00DAOC-2Z
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 09:00:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so1156785pjm.0
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 02:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbfwNZ672/QivizbpxYzAD70C990QzKhms0ROZ5rRjk=;
 b=Ab35ObTt3m/gbH6C1Zds39aaaYWaVb6ZBPHzy4/6PeVpzh1QZXhoWQ1HJPlOfNpnhG
 dBmsIxIV5kPgpN0wxJTkNeUY7wFCjFkhpM39aCLJg5Y8tCqiNVrWrW+GtTf1XU0rz0UI
 5cxPrHkRRSHR4MMW34IXmYArx36xNyNMjQuz4FGTzuVFIwx3zGgmyq11nBQWxbGN298W
 rwep3U21MPSdEZc04u6pRJqo6AQbEgAy74iC+Hm51wTojvjulgzg3dxzfbNlkKLof4QW
 EbJ3ppmOvVFm5N+dQz1r46b5KBoN2hR4lmavmAaklqUArGZudXDO4dv2cUAIg4zSUMDt
 9i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbfwNZ672/QivizbpxYzAD70C990QzKhms0ROZ5rRjk=;
 b=ilgMT+5klbaGUPNs304s8tMwM8CXmHjJksgJmbPTb1yXBdgACeBEZ2prURFKrISCY+
 q/9ytfKGz298tXR4kCcFNFDCit1SkaHixLQ/zfqfT9CK/ShDLsHfH5ZyLGJUjIi0gbMz
 iRZjtvZAd0+UOcHLYwHiNBIbGvdehqQbVmMeaYIlK0IU9rG6CzUhFrUslfrQ5oQHpCxy
 lQlgbsWKlZlqkuX2ESPExOPg6b05x4yCXR9madl4nDz5o52M4MeQ4dLKyzXUJhp1T2tM
 g4Ls7VatKgA6Rosh41/YtLfiZp8Eot7xu/K64RCD2H71j7bhQh5/QU2pxy7TyxafPXtL
 Jhsw==
X-Gm-Message-State: AOAM533AEMsy83hMZkBKUiUGPBLhQrD71E6WK3KjGwfRLXef0Nj8kqSG
 ksIF8RJunaiL//JjCYf9KlaOIg==
X-Google-Smtp-Source: ABdhPJytP6LLZxBu0sisrxqgLnFnXaLVrohP/INGBzvNNYJQLbSBjeWW4JywHU+xzfySv/O/MnjPEA==
X-Received: by 2002:a17:90a:a594:b0:1bc:5def:a652 with SMTP id
 b20-20020a17090aa59400b001bc5defa652mr10268506pjq.167.1648026056686; 
 Wed, 23 Mar 2022 02:00:56 -0700 (PDT)
Received: from localhost.localdomain ([223.182.250.48])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a633c46000000b003817d623f72sm19642115pgn.24.2022.03.23.02.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 02:00:56 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: Enable perf events by default
Date: Wed, 23 Mar 2022 14:30:25 +0530
Message-Id: <20220323090025.546808-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_020058_164168_F3A4EADE 
X-CRM114-Status: UNSURE (   7.87  )
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

Let us enable perf events by default in RV32 and RV64 defconfigs
so that we can use RISC-V PMU drivers on various RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f120fcc43d0a..57aaedc7cf74 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PERF_EVENTS=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 8b56a7f1eb06..21d422e740d5 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PERF_EVENTS=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
