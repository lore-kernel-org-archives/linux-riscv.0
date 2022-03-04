Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D5AC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVvYSrR33X/x10IwBqkrFQvyd903TyX7GfvSDP8fjw4=; b=ZSSi2Euy5I9KUO
	tSMVdGDbYgvAs6amUP9tVz1fSwkqPxLYw75x8yn1tKsrsGb9wD1y2QVseTAd2iyMaBOERi+hHslWd
	z65lWh3w4y4w9aDnRf15g0njoa0mtyJcMYyRdjm/VfVgzvqgBFdH3Jiin/sIIxEHH3hiIC0DSlnEL
	Csa4As0DBaUxNnu7QXp8zZkCl1FQYe1K5Wo/Qwr1WMRzNWAOB9mAKEAGaoXxneTaMv4KhxQzohz8R
	PpWc0LuTRzBzOPkFXROF6ZeK5dPQB6FQg/FvXYCuZxEXRIlVNKCgPMdfAHPzsnXiv7vxDUmhnqz5e
	ezPy1bie4wxqgIlq9I5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEGH-00BtDU-3N; Fri, 04 Mar 2022 20:10:49 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEGB-00Bt7w-TB
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:10:45 +0000
Received: by mail-qk1-x72b.google.com with SMTP id g24so7346541qkl.3
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 12:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOaq/RArOsIMDEytI6Sz1pnZYzBz3vUl5NUCRG67IW0=;
 b=qwkfyanXvztQ6XLHz71CS2ApVZCgU95lIC27jZPWXeHR2QT7ofzrhKQjLu8US8da3j
 +V4zJVXa1833fD7feTy7V19ftKSt58usT4zuDhsZY99fM3u4/VP08oB5BNHmy7mMUmBC
 Hd5+qCg79rcE+EW8alFQs34f1JBTdkEJhwX/KMoPc70/mwmRao4pvlOfyi9vWBIaga0J
 dqH7iXWKMJN0CAlQSWv3SEcZOgAGMT3IFmRtBnUsrvzvsDq6CJ+qHjejICE7X/qhd1mG
 QNyxZ3elzq1UufWglGovzC3hRw4Fbab9k9NwdCY6ZDP+EEK/o7lM7vwVVkxtC+PS1SFc
 LWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOaq/RArOsIMDEytI6Sz1pnZYzBz3vUl5NUCRG67IW0=;
 b=r0TKg69Abeo8t7aFS1kV7x2QvSuHkgJZVfsEnDuPeClwB70flKAuB024sYW3du0Uqc
 jmn0Lgn0ur1QSuSwyx0KXRl7UjBcRplnb2LXvyVf37OIIp5gXJaQYuXDN7iy3qD6Faxm
 CARcILCh3f3I9/TP0gUTlYVdPDuKAX2rnE60JMn3pGvl3l/YQYbD6qtXUvbautOKAZz9
 4WymkgqrXUXbs5ADwjtaOgMXYRdTFD5EcigqSMQn82goKYVncwk/9KM2P+3HYTzJx0hE
 4Ce+tgX2CclITTpEE1Xm+0iNS5+VcU19SzoObyfPBDzeQPhbjOlfOrE9CyscjBndDViu
 7l0A==
X-Gm-Message-State: AOAM53034dO+IF92o1EGB3uxC4OP0yE9aruuRYLHudNr6Wr8zXLvpkRp
 TK32Eak3mVqA5RP97kPHWPbrVg==
X-Google-Smtp-Source: ABdhPJyz4bobvXoyET5/f3LrTYV3os+fQ89XumUD4klEmrv0+DoLEKr8Botl+4EiH0M454t8eFvVIw==
X-Received: by 2002:ae9:dfc7:0:b0:648:e065:84be with SMTP id
 t190-20020ae9dfc7000000b00648e06584bemr209067qkf.129.1646424641718; 
 Fri, 04 Mar 2022 12:10:41 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm4605481qtp.1.2022.03.04.12.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:10:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 2/7] RISC-V: Enable sstc extension parsing from DT
Date: Fri,  4 Mar 2022 12:10:15 -0800
Message-Id: <20220304201020.810380-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304201020.810380-1-atishp@rivosinc.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_121043_981346_D16C2E47 
X-CRM114-Status: GOOD (  11.54  )
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

The ISA extension framework now allows parsing any multi-letter
ISA extension.

Enable that for sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 4 +++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 691fc9c8099b..7335e9138fb7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -51,6 +51,7 @@ extern unsigned long elf_hwcap;
  * available logical extension id.
  */
 enum riscv_isa_ext_id {
+	RISCV_ISA_EXT_SSTC = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 031ad15a059f..7568c7084a52 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -71,6 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 	}
 
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f3a4b0619aa0..1d8a06575cea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -192,8 +192,10 @@ void __init riscv_fill_hwcap(void)
 			if (!ext_long) {
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				set_bit(*ext - 'a', this_isa);
-			}
+			} else {
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 #undef SET_ISA_EXT_MAP
+			}
 		}
 
 		/*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
