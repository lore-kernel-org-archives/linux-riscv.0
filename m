Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11408C25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 21:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QtSav6a064fI4IH+sox7XhF/cGTlbj485LYGlc3XvM4=; b=ednLu2ozYxaiB0
	St6BlIQBg15r+kyz7d7XNd8qHb+/c/ulrsxS05cLV+2tgGYbYSPuAE8ZymrDbHxhMP//uS9BEc4ZE
	/icZeciPFhs1kyOCmK2FMje3cZS+0+gInlcfub71MLl7PzZl3SJxbiyfTOxOT83ZnI84mBE7PhAHL
	QKNQM6wZLhOcK+6VXupa07XE1nqJmYx3PQQoeXQGaj6j2GyTTiWl5N2GF1MZvIQq//3BTPOKuMEnQ
	GVTIpmVjj6teL9Mb01TTb7d+BGKlYxv4CXzOxkCaoTebVck7YgNIzGOtMF3nQZibaaOko1ACH9qz5
	uEdcknd8bGnUq6qSZnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MVz-00000002y1L-0olB;
	Wed, 15 May 2024 21:50:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MVv-00000002y0e-0Auc
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 21:50:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6f457853950so5511331b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715809817; x=1716414617; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPoEGWcFNM5Ac7p7zaIQJhacd+hmWksSsGfBqQ9x+34=;
        b=obsxb/Y6VTEKPv8tvKKzuvfnTbwKZyHv6qac8KjzrwQN/gQ7NMHD5OsWGbRutF426k
         hkGXbUUeCyjpC1m73INa1Q291UmtmntcUQZvt2dZmWqgLUZ5EjtdwlNrT5eQYhZPVhQa
         AVJBoF1zNIb51O7VUTM/DiubrcNJqA8m8FNB6MkNfeDH40hvUh2vGn2igCeIWIAp+rIl
         bFExiOnapBaYUO1uFPOMH42kMn8QJzCd2wXOj0eegJ+FazjxzBZYywG7Mjxf4PSAtmos
         2R1jvdVjwmmVV1b+vCbJHzITGUItoCgI9/JU+zwKBaKznHCqWw3rlc5sYQwHCpKo3pfO
         vSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715809817; x=1716414617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPoEGWcFNM5Ac7p7zaIQJhacd+hmWksSsGfBqQ9x+34=;
        b=wmJqhY6Q0HtXa3PnpBKQMeJNCXr/bhtJiukFj02G1aWoSk0YSAYrQSSfZWkZHmqC7X
         WGF+Ch9LKSing4RUV8v0HQ5dDu9a6VWl507JFBoQPjwajZFzzug+u9gZIGecReYzk1uX
         gNIlOGgqpGWTyQzlF2J1PQHOM2bVUPBWa5CaDxhvgp7PFXvd1VOgxPYmXRNV8b9wILNh
         ZCwWgP28PHaMH7hzMrMv9MxOM6jlmwuNonBNn3bAhRC4Fe7A776YqkNkb27WYVPqJbDH
         UW11Oz9CiyewXusnm9mBazwyGnqR8lh1qsmkK5p1e1RBm+1T6OdyLLzXGpZXXBHq20x5
         KjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4exC2os4pE0bNSWQbzLkM3rmar9D0lL52W1cY/ePOEamHvAx0AGjzYPACgTGMKJ8/3+cwviXJvSUDyKkMiHch3/JNEK4lKfLj9/JS2R9H
X-Gm-Message-State: AOJu0Yzk2fv7Mb2RDM+RHB4A7xw+um/jXF09YyN1dSz3h3V9vima4Lcc
	WC+BLh3/Fve14ELJzKWEvl34WstTq0HuqpXF8rX7Sa70dkg0zMfPB2WAbWl2i9Q=
X-Google-Smtp-Source: AGHT+IF5Gr9Uvw1E9W3ONU1uWg3LggBP3lJhDNnWVyW+gMvBcIPC/4PE3shbuxqBWxeL539zSSHZrA==
X-Received: by 2002:a05:6a20:4323:b0:1af:58f8:1190 with SMTP id adf61e73a8af0-1afde0d5a81mr23719147637.12.1715809817327;
        Wed, 15 May 2024 14:50:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm11638629b3a.60.2024.05.15.14.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 14:50:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Allow vlenb to be probed from DT
Date: Wed, 15 May 2024 14:50:13 -0700
Message-Id: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABUuRWYC/3WNwQ7CIBAFf6XZsxhowRpP/odpSIHFbqJgoCGah
 n8Xe/c4k7x5G2RMhBku3QYJC2WKoYE4dGCXOdyRkWsMPe8lV0Kx2TldHhiMXqN2Kxv4aIzkJ7R
 WQVu9Enp678Xb1HihvMb02Q+K+Nn/rSIYZ54PfpQjDrI/XxOVmCnYo41PmGqtX85eqYyxAAAA
To: Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715809814; l=1245;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=c4LlbPQQIBW0EY+raJTf9Sq+v6mtxv6mLuVOawRyfPI=;
 b=+GS9U1THGMp1qD7oH2HEN2rPKyTNMLV48Ujp0YQK3a3r6JILWA3YeyyDpN6XLBgdWmg/ewOQz
 EytEXhrktHbB9pkexU5E3ZawhX1Kj8dAqEM+y0Upld68uUOeVc82Hc9
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_145019_121715_1EDF8A68 
X-CRM114-Status: UNSURE (   8.42  )
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

The kernel currently requires all harts to have the same value in the
vlenb csr that is present when a hart supports vector. In order to read
this csr, the kernel needs to boot the hart. Adding vlenb to the DT will
allow the kernel to detect the inconsistency early and not waste time
trying to boot harts that it doesn't support.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
The two patches in this series were previously part of a series "riscv:
Support vendor extensions and xtheadvector" but has been factored out
due to a lack of reviews on the thead specific parts so that series will
be updated separately.

---
Charlie Jenkins (1):
      riscv: vector: Use vlenb from DT

Conor Dooley (1):
      dt-bindings: riscv: cpus: add a vlen register length property

 Documentation/devicetree/bindings/riscv/cpus.yaml |  6 +++
 arch/riscv/include/asm/cpufeature.h               |  2 +
 arch/riscv/kernel/cpufeature.c                    | 47 +++++++++++++++++++++++
 arch/riscv/kernel/vector.c                        | 12 +++++-
 4 files changed, 66 insertions(+), 1 deletion(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240515-add_vlenb_to_dt-307bb406ecc5
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
