Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AB0D68BDA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2zlJOGbyPViMbSfs31YVsXWmAwA5p7SUXwF/UWDrmwE=; b=qKinNXDZDuFpwg
	OxtDXUGH/JEPIgqreJNtbAV17CHI0u5pR/GLlRjfPj3ayf0n+e9aRDHfdkCaGTQOj/9hB5qsDhumG
	e1XjhEpZPHP1c+eTbJ4qbHVdioBJty8YMeN8kDmXGivy1dRZ0FtGnV6pP1LqB67kwRUhCXPNeUsC4
	gk2Vcxe0NIYoCWB67LOagWZjCHtf0l6k+1dR7erfWxzog7YbJE6ZhIVtDOp/NOjdyKQ9cDhes+xJI
	tdmUQ8YqMKeufWqyy4d5JISCBIzAPGPkLdSvITVybTi4J5v6Sf229BNp6PgBa6zprIQDEhqjsG/IJ
	K9dt93kI6A7QysIPIFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5o2-00000004ZAj-0VPv;
	Fri, 15 Nov 2024 23:32:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5nz-00000004ZAF-0jYI
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 23:32:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-382026ba43eso1482212f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 15:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731713565; x=1732318365; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh6tDwODnq8Uz0ftqgMQifASUmQBQRHrNSlc/NxcVPs=;
        b=IedupwF1ZBhlB1zDhhD8UjldGoEf8I+LteZyP+AcrFiGJt396JY2rJnSvtym6aE4U2
         aQz/7Azo/frqQlGQZRCZBLTeolzjJr35mmKORCTb3a8CjEro04ans3P4fwGKQG/aoxSm
         gY4ArP14q0nxNEBdOlker16uIYeRLBpeZkBHAtfZU3L6gdC7YjyfY/90AbykremiQkmg
         XXy3YJYDChAJAYbtcGat1pc+n56VokShVeJA2oR6Cw3s59ZLdMmjLdCW9KEL/y2qX0HC
         FeWu4ZflC+6YT157AY6iiGGfMc5cjWLHq7uYPUkDq+rGD3yaSbfyD/jQe6OF9s3N0gHJ
         2WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731713565; x=1732318365;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bh6tDwODnq8Uz0ftqgMQifASUmQBQRHrNSlc/NxcVPs=;
        b=UtBgXNIM+9rYf+UGRo17JTpLnL5TAhLNOathodBUPcEvVVMlhJ2f/W/UmJXcKCJmez
         zpAY9wmAd6eMUVsFqZ3hCZNKO5K3M4c12G5PN/Mm/LlmcwCwIJ28xj5lDVTXillwlR0B
         M0+GIkLLhxJuwDn5z6S0Hb77e4LaexVdKgmWzkurhWhjjqoeOhhRFDxxBfC5eiI+lDR+
         uK4KqJNbMQvTWZ2RWe5+k/uWUuTuatBeXAeepHBqEsod1CZV4RxnBJsdkZG1QoqgoiNR
         C5Mvbl8FDDfGB6SBo53NfgIzUYR/IjbpZzItvY/LGO8qXXYU4572vYnz+Tsxk6Ty3wGI
         xp4g==
X-Forwarded-Encrypted: i=1; AJvYcCUV4MhQR64E80rBmCZkUpJ1fxQ1F/1tx6pIkWW48kk/JGFIffS9bJC/D5QV8Df20wRqU5LfS67w+mCGOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypO9/iN3WinJY5hFaMTavbzVDYE84dh17TtQs8PggALfQj9OFy
	dQ1c2ZRLGXpFU7KhTLXXnTwqWbEqKuQyj+Wn68HbSMaf6e8L9gfd
X-Google-Smtp-Source: AGHT+IF+13KXSUbKCa1sqaGVFC2eXYP/XSlFhfc3SaEKJ5GBSoOKuGlI1jesZSuVgFdztcKkZo8ZSQ==
X-Received: by 2002:a5d:64c8:0:b0:382:2276:c93c with SMTP id ffacd0b85a97d-38225a8a36cmr4291816f8f.44.1731713565042;
        Fri, 15 Nov 2024 15:32:45 -0800 (PST)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-58e8-a69e-d502-6c71.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:58e8:a69e:d502:6c71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382247849b0sm3617373f8f.97.2024.11.15.15.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 15:32:43 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 16 Nov 2024 00:32:39 +0100
Subject: [PATCH v3] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
MIME-Version: 1.0
Message-Id: <20241116-cpuidle-riscv-sbi-cleanup-v3-1-a3a46372ce08@gmail.com>
X-B4-Tracking: v=1; b=H4sIABbaN2cC/33NTQ6CMBCG4auYrh3TTpFQV97DuCjtCJPwl1YaD
 eHuAnHBiuX7JfPMJCIFpihup0kEShy575bQ55Nwte0qAvZLC5SYKYkG3DCybwgCR5cglgyuIdu
 NA5AptStNTir3YrkfAr34s9mP59I1x3cfvturpNb1r2p5oCYFEq4kC4voTCbNvWotNxfXt2JVE
 +4ldSQhKLCWcvS60EoVe2me5x9SPvP8DAEAAA==
To: Anup Patel <anup@brainfault.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731713562; l=2176;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=OSD+oIIobbkjTj3wZizfrrejaW10Hs0ipasM8FAF5aE=;
 b=CgLScY+fBx01z2OhvbnOitrjuXIF70J+E1fl1CA/E6YXlP/Lrjz6NKa4IET03JPGbMxO2h4kN
 4GLGXY52VRbAV2+a6go6DR6Y9mafHIFep3P44cBsfzvKGgTNaPxW6nm
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_153247_220057_5D546841 
X-CRM114-Status: GOOD (  13.70  )
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

The 'np' device_node is initialized via of_cpu_device_node_get(), which
requires explicit calls to of_node_put() when it is no longer required
to avoid leaking the resource.

Instead of adding the missing calls to of_node_put() in all execution
paths, use the cleanup attribute for 'np' by means of the __free()
macro, which automatically calls of_node_put() when the variable goes
out of scope. Given that 'np' is only used within the
for_each_possible_cpu(), reduce its scope to release the nood after
every iteration of the loop.

Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v3:
- Unwrap line (100 char width).
- Link to v2: https://lore.kernel.org/r/20241031-cpuidle-riscv-sbi-cleanup-v2-1-aae62d383118@gmail.com

Changes in v2:
- Squash patches for mainline solution without intermediate steps.
- Link to v1: https://lore.kernel.org/r/20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 14462c092039..0c92a628bbd4 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -504,12 +504,12 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	int cpu, ret;
 	struct cpuidle_driver *drv;
 	struct cpuidle_device *dev;
-	struct device_node *np, *pds_node;
+	struct device_node *pds_node;
 
 	/* Detect OSI support based on CPU DT nodes */
 	sbi_cpuidle_use_osi = true;
 	for_each_possible_cpu(cpu) {
-		np = of_cpu_device_node_get(cpu);
+		struct device_node *np __free(device_node) = of_cpu_device_node_get(cpu);
 		if (np &&
 		    of_property_present(np, "power-domains") &&
 		    of_property_present(np, "power-domain-names")) {

---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241029-cpuidle-riscv-sbi-cleanup-e9b3cb96e16d

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
