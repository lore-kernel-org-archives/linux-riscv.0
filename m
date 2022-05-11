Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6AEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8q+ks6uoI7cytvaronewUHAlclpvJlZRAiwgDOLrB9o=; b=dV0HD/+7j/W0Jw
	4x50/IKVO1bab99stLz/qnP558R8TxUGOkZii8gDkQwVQ1myCdHNQbn8rYR1GBrnr3FmdIE0fgVmB
	ItnoKMb6Ma1lYdssUA2vYxRDuyf3vwYGDmgyJPfyU4xpLbU6VC4TDflqhhvTY1C+ko1m+56YJ+qaN
	u0TNlcbTzGJtwUo+ZRKr/K08Z4EMJuJF4iwkbViMBuuVzle521NUbyJ9W4m+k/O1D0cJhM8MlaR75
	g2fkB8TO+9F4C5eMgQwkuxGfOOfeWLeBeBcQ1yIPwsaroQ8P8z5qQHuNTeS4lQ8+EYWut7gyW4Xzs
	QJWT/BpPVwTdMVTFyYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohl0-005xLp-8A; Wed, 11 May 2022 08:31:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohkt-005xCW-Fo
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso4308062pjw.0
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=JRX/iLnU0PEl4aE1jsRvHTuo999D/a+QvZpCGEgPlUA=;
 b=HAJWgvIRoqs0LfgalWP6ojZO1g0sEnjUIfCygsOcXzR06mAxirp7FsF1rIPz8xH0TJ
 6QsOm/LPEddHAO1rPR6C1P0qVYnfEaOEq9u6XnbvJdfGD5ewDaY8kEgX1D3+A5pxOeUm
 InWSlP3RoygZr7h5hwVCVIiSevSmzaY9psUk9V+iuUhrhPZHWEsZXWEtDPb4R4jOk+yf
 8sGmPstZ4OThvmH0GMvS0A9RIcU3oIU6fDlFPdvfOkw1gXc1q0Kol19+GikYAl1Ufzy4
 TKI7aV/WyUFKaPykbHiXZeRjqn+Bwi0EdFA9/+5fsahSFUh1lwf3opCPCxV8ijiIU/Up
 NEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=JRX/iLnU0PEl4aE1jsRvHTuo999D/a+QvZpCGEgPlUA=;
 b=Flu5QA5Gfy3EW4VADTx0+LkS5PQoN+2LQaOrV18QEPUkeFlDWpzSFmwnWEjftxt6eN
 fPWSY/XkvEf5jBnBEaHWAtCnLrCu8WQCmB2NC/hzf/RyKJuWLrzp7X/S14Gb5ZBjZ1dP
 oevV3YHvG2JVT6IPE4ryOdUmVAbXd07sYM/cyi1C4tOOxICdWMRKEk6I0HWp4iyOr++N
 hFPAvHDP0EgTpJzpQcbf9/Mzh1ZhwzfMixpDtkAPEtkPEMUtRLe38BYyiXWB6Q148wXW
 6PIf/JZkxxRLwjLSsuKgqSaKmoAcl8SaW4AhaWbZVnirGJTjjPs3waa3aItXxZdRiBT8
 kfwA==
X-Gm-Message-State: AOAM5316kKEmjfEaaYVfVvMxJI8AotCm7//GzXw4Dy5tVbX7PLaK1/BN
 bbLor9QFEOrwRWhvldtMOAGdCg==
X-Google-Smtp-Source: ABdhPJwsXQV+fb5RuleuyZPN6gdlX4DQrCU1gxu8pD+8g8dT4KUeC1ecnrXP925EDhqQm1GhsYAz1w==
X-Received: by 2002:a17:90b:4f87:b0:1dd:100b:7342 with SMTP id
 qe7-20020a17090b4f8700b001dd100b7342mr4146651pjb.64.1652257892511; 
 Wed, 11 May 2022 01:31:32 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:32 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 02/16] riscv: Extending cpufeature.c to detect V-extension
Date: Wed, 11 May 2022 08:31:12 +0000
Message-Id: <7fcce42051191f2c90f536d0bdbc57da1ee1d9c2.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013135_569737_05DFD1AB 
X-CRM114-Status: UNSURE (   9.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

Current cpufeature.c doesn't support detecting V-extension, because
"rv64" also contain a 'v' letter and we need to skip it.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..92a8fd6bd3ed 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -76,6 +76,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
