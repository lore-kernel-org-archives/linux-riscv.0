Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D977CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNkgurOajXvvmENY195uU6HtFNpkG+RcVzu6qc078Uo=; b=jaPpu5Kff3eECP
	tMWf7LIb+8lqniOeKlgls02zDI8lB3sYCnkGJJBhhUnVf8CVW/bjzZUH00kr2NDz0AjJ+btsNG+SB
	bHE7oeTGO+t1XX6d38NBdo1p13xvrgH7dNfwx//IWfeLZWSSMkbXJeegL/rbQj6sWXEzutMwZLWWi
	2DlLgZfspmgrYRD7Z6ySL512D2TEDYKTNbZMpWkIkHm69IdGc1CT/fhwjFqxU4ELYehYfA70LP4Lc
	lPa7D1XxGPamDqa0XzQJam/Z7gbQ2b2oe64clp3gkmt+BUmyprMZH6IcPSJdbbQUAvwRge2JI3Yq6
	v+grcLLcCLSwBXgbsZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwG-00000004D6s-2eMD;
	Sat, 23 Aug 2025 06:41:20 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrJ-00000003GBR-046S
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:47:27 +0000
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b1099192b0so39196141cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755884843; x=1756489643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfYucjg1h8+O9tUzDFG8M32q+vBz17OTGpTy9qZYkXU=;
        b=az3hJk6DIstxJAOAuCyyFyvv/2znrrUL6avrf/8/y0+iQ6nK2f/SgytLcf90m0Ta3a
         HB1PFChmPcAgwIYFu+okzjHMQbSHhFvJL5GV9BDRPYjGOeFGcbo1fj1mBsM4Ges2FLxm
         0P+VNNxmYk3kdz7aUiKA7sBicdhABViQWnBBYl5yS9pbFOsr1i4Fh8pGn/b1eo5wEJyF
         UGeC9fnAMwwm2bnxdpSmZwrMfxdkfJpvj/NmgRq1YKJxiOxwgh5yXsYwLrs/CA1E0D9G
         gEAVTk9m1ddAdt1I1YfjsrZjcRV2+hAUl2aHNdHbDDVxlqn5wIfCDcZfXN8wHHDthBNr
         ApUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884843; x=1756489643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfYucjg1h8+O9tUzDFG8M32q+vBz17OTGpTy9qZYkXU=;
        b=Vjmrkdb0hMR6MkTroRJhmjHGyaU876+d7mMSfBmE5YUjD/QsSbeCFU1Z7y8PfnVmCr
         KinJSsST4MHfs+zEJ66lzsXt5itzGF842ZuIp/XRDc8+pOxEhgQ62bF8e2Z4bLThppZ5
         N1XbSWjOCNNx0T71sMjOMYXUoYpf0RKntAl00ldRKSqCPjbPts6loI/F2Ld74PNQUpKI
         8lSK8dah8667ftB/SLl+I5fyzMmgCFYmHKM5xrChT/BKomc06npK4CN3YxvgkDe5Cebg
         Zxg4Kez3D82rh8/i7M1P3IjQoC2Or4ead0RMiRwnD3qvP7NzOswE2aN012ZBco/yEp8Q
         SV4Q==
X-Gm-Message-State: AOJu0Yx7RGVXiiBqVjJuuR8iZRmhrn9XIMtBYsH4rNyP7drq38AVaBvR
	m9729X6X2IZKE6epOVD9KoY4LwxHNMEjIwIGmSNtZjhx9uOyYu5ffuWSBLfcZ7ij3ny0eZkhr0D
	2qLaR
X-Gm-Gg: ASbGnctPfUNNWGehcUbufPBkdVdqx2BlKZLLTzIpOv3gZsFKEJgZ1tFlQSGuNZhzen/
	B86V0tDd44ecbG+Z/yEJR0b0sCDt7ZINDKRKU2FacHswy5SWnzGxSdHUneqpKAjuIsK2NMwwbNU
	8U0YJRW1SRW7w9VhfQ1cJVVccli4XhymSBZeE66iY0IX9qYurT4MOQfQXJaYVo0Ta533kONt8ik
	+FR7ETtHjs36j35LrUpv4l/qDxdpE7tA3t5bnxGXu9IPry4fwSpvUm43YCbNx7fwme77jJ/KgGc
	DehjBl4aKTtKXk6K0OlqEpDFJRE+beE7lajEblolOp0Z/3UAGI1kG2ltNltrGLXKPY/lQmnOMFn
	+UkCWZh9uROWormiKTUbf2LgixQotvIv7FS+7hQ/1rJq76cwAI5NUrnGIhJfZRjGH/77uOH/vr4
	t9IWn64Q==
X-Google-Smtp-Source: AGHT+IGIVSOen45mpOt0xYdR05GnbUoonndymEzs2Y2tUjKO6oUDKgrfkoqnPSp/0zNTXeE4BQVymQ==
X-Received: by 2002:a05:622a:2615:b0:4b0:75ed:bbf9 with SMTP id d75a77b69052e-4b2aaacb9dfmr44784981cf.33.1755884842505;
        Fri, 22 Aug 2025 10:47:22 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e6023asm3121361cf.53.2025.08.22.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:47:22 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/8] riscv: Add SBI debug trigger extension and function ids
Date: Fri, 22 Aug 2025 10:47:09 -0700
Message-ID: <20250822174715.1269138-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822174715.1269138-1-jesse@rivosinc.com>
References: <20250822174715.1269138-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104725_055639_12E9C92B 
X-CRM114-Status: GOOD (  13.83  )
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

From: Himanshu Chauhan <hchauhan@ventanamicro.com>

Debug trigger extension is a proposed SBI extension to support
native debugging in S-mode and VS-mode.

The proposal for the extension can be found at:
https://lists.riscv.org/g/sig-hypervisors/message/361

This patch adds the extension and the function IDs defined
by the extension.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
RFC -> V1:
 - No change
V1 -> V2:
 - No change
---
 arch/riscv/include/asm/sbi.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..be2ca8e8a49e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_DBTR = 0x44425452,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,34 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI debug triggers function IDs */
+enum sbi_ext_dbtr_fid {
+	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
+	SBI_EXT_DBTR_SETUP_SHMEM,
+	SBI_EXT_DBTR_TRIG_READ,
+	SBI_EXT_DBTR_TRIG_INSTALL,
+	SBI_EXT_DBTR_TRIG_UPDATE,
+	SBI_EXT_DBTR_TRIG_UNINSTALL,
+	SBI_EXT_DBTR_TRIG_ENABLE,
+	SBI_EXT_DBTR_TRIG_DISABLE,
+};
+
+struct sbi_dbtr_data_msg {
+	unsigned long tstate;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct sbi_dbtr_id_msg {
+	unsigned long idx;
+};
+
+union sbi_dbtr_shmem_entry {
+	struct sbi_dbtr_data_msg data;
+	struct sbi_dbtr_id_msg id;
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
