Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7184AECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eT5T+rZzstu6pSLSAkAjlvMjUHfYa63WecSJ2VCLwWA=; b=SU7gamqdVOOHMB
	n5w6zl92XOEI6Os7jDcA/4g6eaAFqXd71++n+CyeXyrlNlwaobgqH4OClRzLiLf0QQ2GxJPQcIpeO
	GgCWy+ElF/P8BdKLn1VQzUO4il0VEFHMXjeJmQcaoLm8hY+bJwdQvRgzSvXspdMMzUZv39Y7uws30
	UyxVC/WNAnJazKoS4rUJAWMccUilPFpAQkCPcv5NQhvLBm1DLeUCL6rnuSl0F5MJiiAZnePvgbVdc
	CFIwUuT6L/aHq9E/XGvBBWhQ3qIZqKkQtzcl9knBMbgbcUNQfMoq4a9YK2fnryallqp6Wn9iMLEy2
	TD+XhPYzvWE+YdPaX+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7XY-00CkYx-U0; Wed, 21 Sep 2022 21:45:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7XW-00CkXJ-1R
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:45:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so140092pja.5
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Mj3l9TL6WKmPWu+0iN9vSXqZMe6kPxftZnXjHP2P8BU=;
        b=gRooOxATLU9/plxfbBItc5MyPgEqAIU8yk7UUi6tX8/Sj5TPJ4jOh2lLNZLIq03yD/
         Anz/Evd4AH3ChAtCsJuDGmKHg+0rcdzi1lQKRfwjFD85+ZVWFk3CFtpS42CYRWzeuEfc
         oELczcbuVEbrDxXJldujOAbTmpHkCa1YbObrjZR7sqUTetjEfsRocYoGbfz6w58b4Eyc
         KSXltdTvPqvblVn5uIuiWudlA4rjbmTUDaOjtU+cebKWEStWWDZsMyb/IEnKhJkYDWg9
         xyUebBdly9VFkHNCzurtWPCABQx3Qgi03nhK7Xs1vx3Opd613fJpoPUWoPIusUNpdyXU
         5mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Mj3l9TL6WKmPWu+0iN9vSXqZMe6kPxftZnXjHP2P8BU=;
        b=O329yf+3rp0uJtkLGDKrwgkx/ofOhu97hGG2c3ybTn63sOMqFhWg1tjThITvu2PqLg
         ZjuoKnUGgDB1kmqqfoEavd7+JepQ5LHNa19GegExSfFPKb6LVLWK5sLOhLCOvvqVBGDu
         zQh7y8Qi5p+3TEr32guTNgvUZpM6sozv7izJdsfAHXErJcPG0dE737LNEY6PbRkH7FVX
         uDFZ/jnxi1n+WK3pohpkQnY4tmdptiRWhiI+vthyATPMBSveuDCA0m6RqefB8O156a+T
         80HdS9N+D4Dnmxhlt4vgoypGIM3nbvNgihCXaU0q3DjfHLQStx4NiPh75H20QzrpWo+0
         xs5Q==
X-Gm-Message-State: ACrzQf0xqDMxyCHvsfUue00x8RLl3lqc5tYY8CZRKNz6RcRKvQOtfHyL
	PKb7EyPlCHwc4gh/+ZBjx7Xkhw==
X-Google-Smtp-Source: AMsMyM7vI5SJE0+lFi/SjzwB7byCbic4o87lhgQGCKazRPjoqX2GRJ8LTCmVDof9ZJUchurT/snvBQ==
X-Received: by 2002:a17:902:c792:b0:178:2bd6:c429 with SMTP id w18-20020a170902c79200b001782bd6c429mr201075pla.52.1663796751176;
        Wed, 21 Sep 2022 14:45:51 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:45:50 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Guo Ren <ren_guo@c-sky.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <anup@brainfault.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Chris Stillson <stillson@rivosinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Dao Lu <daolu@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Knight <nick.knight@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Changbin Du <changbin.du@intel.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Peter Collingbourne <pcc@google.com>,
	Colin Cross <ccross@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barret Rhoden <brho@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 02/17] riscv: Extending cpufeature.c to detect V-extension
Date: Wed, 21 Sep 2022 14:43:44 -0700
Message-Id: <20220921214439.1491510-2-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_144554_089619_4304C010 
X-CRM114-Status: GOOD (  12.58  )
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
index 553d755483ed..8d4448c2d4f4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,6 +83,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
