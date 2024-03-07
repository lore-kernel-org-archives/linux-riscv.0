Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC8C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s7+pznHs34GiPpJyd5CcZhMDRU7nGi3yaCAa3F/TliQ=; b=oSeNazl5MdjIyB
	JIWxvh/+qjRHYCpJAe5jvm5MVHehr9wuprHsnjiCNXg8RfkFq8O798eoP8+cjMbHOA1W8MSAK4WdQ
	3Tn7/4F+VY5MyMcxNqqntranhESHvmBfYFTy14S/NUEnp2/TYRmsn8Rbp5oQrThpKh458azUigi+v
	Pf7JUsicrSUN6yri7MqT2+QUwJTb+v676+tr3zirvkHhy5cFtbYHlkbGATGSAGhTkqhDKF39bq/Di
	BB2BWJ0vRi7E1h/kbu/tbhAbzmEL7BGNfDRKSmI6o+lmC8FmGg4VG+hm+Ow8Kjd+UOQqRAI6ALhNS
	cE41wV89yZBhwZ9rFeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8yv-00000003apI-0363;
	Thu, 07 Mar 2024 08:20:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8yq-00000003anx-092d;
	Thu, 07 Mar 2024 08:19:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-412ea23a750so3623135e9.0;
        Thu, 07 Mar 2024 00:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709799593; x=1710404393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3cfeh/qgTCzNyqJWZG5K1iEv2VogtsczNtBj4FEYbc=;
        b=ScZDQK3YbLqk278jCcNGWmSZ9TNjkpxEi56Qhc7/Q6gYZjqkixhmtrIwe5wRAk92RM
         Tc/YZE/PWgObHmXckZk1tgkFE/RGK5o66f4Liv2GOdOoNgQfCFW4lOQeCMQhCTsdVcHH
         xIoWBT/TcvUo5nhOLCeXBCSMZmuu+lXAXMu0eCBt94QGGkwvL8BrGg/23AI6/bic54WC
         6qk8Kj8GzdPt/3s/dG5sFbYyfWXr2nos0yxPrGErQ3MYyu6+rpqgFEwIn9A/XfbbdE1T
         +B5PuynDmg9P59olFX518jPMEcQ2pSQ/C/6V4Ttkfsci/v/YmswaOJSdCFHQwMqJ5SZX
         Nonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799593; x=1710404393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3cfeh/qgTCzNyqJWZG5K1iEv2VogtsczNtBj4FEYbc=;
        b=j6weGiAHm+WASN9Yt4mgHJWBozT4KTXrIl5uIQpSVQt+L7NyLBU91/wtUZxeNVGmd8
         RO3yNAoG1zHhqvNHvlew/ziRJTY+WGgbjObT2bT1lPHNXurLDeCX9VIWRewi55UCSYSf
         T0sKssdDEZopQqwr6/JylHUwQ9VoM7S94T/lU1vda0HjP2Pkt5gqj+Ac1emjC/o1ux9i
         J6JdBH5xjdWnW7y0yCbtQeTrXr5+6l4CN+jQzZKU8dX3dnMHGCwH0q1wUM6xf94Ux8bv
         4EHnOnQ2hEc40EN8AABYzEs2Rp//yrRWWHgWHjYDOpz9eZjfDf7rQ0cIMy+F33tkGlh7
         LUBA==
X-Forwarded-Encrypted: i=1; AJvYcCWr3CwCcCYE4nY2z/rl9r504VYDcOPffe2y5/JD663/g02N01XRqn7vPXo/9UynsEn/ropAW//xo0uJwXO+/055clPOZX98apUlP311kaen5mTjPeISAu0vuqZZH1HSZkpGjItrO0qWYhY+VtDfbHrKbkTwFjAukxFRIp+8S/gNBmTZCQFVlp1G7mlvRper1g5sqc8/
X-Gm-Message-State: AOJu0Yxc2AT7BSAxUAd2/KF2sIQHvMJ5c47PfgIBV9WUwOSBtr3AC5B3
	0oyXRevb/7FHfoklrJg/ORCpcgH+ARCyMyvPHFKl3Ev8XyjzJQ0O
X-Google-Smtp-Source: AGHT+IHxp22ZICjNl26x1Qf0pwp3S9ZJz469LBsA59Wew3XXWy7W/Otp9bwAH8nrbisN+qEZRG5Xig==
X-Received: by 2002:a05:600c:4f91:b0:413:119:33e2 with SMTP id n17-20020a05600c4f9100b00413011933e2mr701067wmq.14.1709799593095;
        Thu, 07 Mar 2024 00:19:53 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id fb12-20020a05600c520c00b00412f81ba413sm1788954wmb.11.2024.03.07.00.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 00:19:52 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org
Subject: [PATCH][next] KVM: selftests: Fix spelling mistake "trigged" -> "triggered"
Date: Thu,  7 Mar 2024 08:19:51 +0000
Message-Id: <20240307081951.1954830-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_001956_295291_2E2FE96D 
X-CRM114-Status: GOOD (  10.31  )
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

There are spelling mistakes in __GUEST_ASSERT messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/kvm/aarch64/arch_timer.c | 2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
index ddba2c2fb5de..16ac74d07d68 100644
--- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
+++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
@@ -136,7 +136,7 @@ static void guest_run_stage(struct test_vcpu_shared_data *shared_data,
 		irq_iter = READ_ONCE(shared_data->nr_iter);
 		__GUEST_ASSERT(config_iter + 1 == irq_iter,
 				"config_iter + 1 = 0x%lx, irq_iter = 0x%lx.\n"
-				"  Guest timer interrupt was not trigged within the specified\n"
+				"  Guest timer interrupt was not triggered within the specified\n"
 				"  interval, try to increase the error margin by [-e] option.\n",
 				config_iter + 1, irq_iter);
 	}
diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
index e22848f747c0..0f9cabd99fd4 100644
--- a/tools/testing/selftests/kvm/riscv/arch_timer.c
+++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
@@ -60,7 +60,7 @@ static void guest_run(struct test_vcpu_shared_data *shared_data)
 		irq_iter = READ_ONCE(shared_data->nr_iter);
 		__GUEST_ASSERT(config_iter + 1 == irq_iter,
 				"config_iter + 1 = 0x%x, irq_iter = 0x%x.\n"
-				"  Guest timer interrupt was not trigged within the specified\n"
+				"  Guest timer interrupt was not triggered within the specified\n"
 				"  interval, try to increase the error margin by [-e] option.\n",
 				config_iter + 1, irq_iter);
 	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
