Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F721C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4oxY1ZcFFrbFnzKog8LxYlqdjOupKiF8x43vulcc7k=; b=zLIln5o22tgLNM
	cZRLDKdSPm0njXeiRykChZ6LgCu7oAoxuN31JJnPjYWaPOUH8i5zGn5EDL2efJuw7Sbkdk0JJ5zAV
	WmuEutMmeezsqx3dV5SbVhEugZdE7YK/2tVqtyA4gwK5wrq/YUt3mHciFs/xuIVq4eMFRnq8FNbfe
	qjguwZjFYkGmq50Ry3XHJrLbjmviqbToit/kCcksRfgiRFa/AMXjGNSvD3gEo1nZ5Sc/iEjdepANz
	KkLkmYf4NBGX5qd6LqX8kStWkqOuF3fSWYrPcPQw4xv3kMfM9GcZXOYDONGE77/NvrIH1tD6fot8+
	DN60SpGTQCEjREeKrEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuOp-000000018Pn-084t;
	Tue, 25 Jun 2024 00:51:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuOm-000000018O5-3C1c
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 00:51:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fa1a542466so16909355ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 17:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276664; x=1719881464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8PvHLug8r0Usox0R6aX+Qr/KVZBRToAr5dZQC5ZPHA=;
        b=CYrajDYQHkWbpRZRl81l2a7YOFQQ4Cbj69ydMK0ltQlOCHqjFiv4tuNuyUj+AgHZEX
         e3k73blUbpkwjbKp7ZwtMpCk0L3a3NiVmm+oGu6L266qelsi0+cdCeFyRR00J5/vVvte
         13SqEluKCwetM4Qx/ls2oa5g2JlzYbAX4HEL6xrlErqEpGIgpy9/qL5V8qlqvQMVFw8z
         Zkn6dmVFme1RhQXIMFjdW3WSL2HePbNKUOiXZRQXnV9cEDbqHwyK+R7EaO50NOxQuZkT
         UOWDayAkEJDqDfSUhlU3NKzf1MrE+GGx7HV2qBxgB8cfsCkqICpWSJS3spMAAF0WVoaV
         leSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276664; x=1719881464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8PvHLug8r0Usox0R6aX+Qr/KVZBRToAr5dZQC5ZPHA=;
        b=SetwxQikFecGJq5cyomWbD/FEFUA7jOiWvGzAkKq3as6X3QKtwFZKmRNfEkPuv45uY
         HHmEpEE88dmdobvRk4wsJakZJYZ3ZkXE7SkrdxnXonw9wSVkLk76fD42S79naHNbANiG
         7UOXNszA0yxVr9G5B4/UapyZVTGcRK0ctKpPQmKAe6euQ5TJSxLh82Zbits8sLwi0gvf
         WSmu9286Bzb4koFQAFB7LI/7rbAZnu5Zlds0OGfklhUA5ejhd1hQiADbAVfSTtscFjY9
         jh5QRFueqsDqI5nIbneROeh3ayaKXsagH5MCEYB00VaILGcOE3ee3ZtjBEyNUDyD+2hP
         l9GQ==
X-Gm-Message-State: AOJu0Yyuit9BnkJzkWknJagD3k5RyYdjvIPoZdgSJbkuJ1vUEGHb1WtC
	+Fz73tbfW/ToL53OIuNwn8hKMpPSwQra226TXDiIy5XbfSr0sWgKFObPfq70/OYEm2W06nT7PWd
	6
X-Google-Smtp-Source: AGHT+IEAP5AqPSLGnRbl2LW9e1HkZo4YnWE4Xye4a5nUkIMhcY2MADnRmTPJFFoHvz1mEZkNhxwJ0g==
X-Received: by 2002:a17:903:c1:b0:1f7:1b42:42f3 with SMTP id d9443c01a7336-1fa0f8cdcd6mr55557855ad.18.1719276663833;
        Mon, 24 Jun 2024 17:51:03 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:51:03 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 3/8] RISC-V: Check scalar unaligned access on all CPUs
Date: Mon, 24 Jun 2024 20:49:56 -0400
Message-ID: <20240625005001.37901-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625005001.37901-1-jesse@rivosinc.com>
References: <20240625005001.37901-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_175104_865871_E4442C1C 
X-CRM114-Status: GOOD (  14.27  )
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

Originally, the check_unaligned_access_emulated_all_cpus function
only checked the boot hart. This fixes the function to check all
harts.

Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Cc: stable@vger.kernel.org
---
V1 -> V2:
 - New patch
V2 -> V3:
 - Split patch
---
 arch/riscv/kernel/traps_misaligned.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..8fadbe00dd62 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,31 +526,17 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+static void check_unaligned_access_emulated(struct work_struct *unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
-
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
-	/*
-	 * If unaligned_ctl is already set, this means that we detected that all
-	 * CPUS uses emulated misaligned access at boot time. If that changed
-	 * when hotplugging the new cpu, this is something we don't handle.
-	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
-		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
-		while (true)
-			cpu_relax();
-	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +548,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
