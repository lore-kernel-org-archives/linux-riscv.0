Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1005CCD129B
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1H/vtTTV4ukCydWOZ1dFo3eAHSRjT6lAEpIoyhpsSE=; b=DEZscYDmOIgPNL
	P4QQZfbl3KtepKvJpnGBMHSXZOSakxbgVRyGqaqOMPey4Adq3cjH0oHfTiJ4C2oqZyNbV8LeId9u7
	gLKBpdydHFU4Qq3UjVfW+W7R8tLCRnnb5g7ML7KTCgskTPOXoAwHCgSw38KE/85vmN83L5ONO+AX4
	BHrst+9s/9ZbkR8Wutsk8ondsYO1dbbsJfMDhGRE+BYANFJOS2PrkV5hvGXpxO81irQRS2waynZPp
	7b938iFKzX7hp67xOyjqrCukln0iax+sKQO2hYFbHVyZR0qkr+yma02tg2VGEpoPn3Js8vP78k886
	4ifOMuE1RcK7YMm2xOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEj-00000000ZQL-3lyF;
	Wed, 03 Apr 2024 23:41:45 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEb-00000000ZIn-2FHc
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e27fadbbe1so3261525ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187696; x=1712792496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZyd6VrWHdcQvYv7dwWjrHMr68qSu7kdpqu35DQkCbw=;
        b=GoOY4PHj5Y/rOHFXxH0CkCHBu83CDsSmJ9w3359XWqMxmj+Y2URPCVw71JRELFLsXb
         ZDgdDSGNsmT1l4RwcYsjIcOGGiIKjM1EMc/H48dVmavFX2II4/dih8ne6Jhyplpe2+P6
         Gqcs7Ch0z5kHxKc9zMXqmkm6Z0yOEhOORUWOxp/EeXbcwi51F9BhTrOaphQDpECcbQCk
         Vv0kQohBzL2efSS56rgKmxvcr7o1yZwT4caCl43VXUwbC0SNWccehl+nrgj9beA8pV97
         MjyZcw3c6uPzeFnWoz7D4Sctq6T86har3gjamx6P1JGI6zzkDA58AxqjGR8/gggms+b8
         eMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187696; x=1712792496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZyd6VrWHdcQvYv7dwWjrHMr68qSu7kdpqu35DQkCbw=;
        b=XQdZfgg+4d1z8pOb9czNG7v0FqhyluR9V4yGml1nYVUaFlbXQe47czRKK/Hdlir7af
         6AHL0bSLq8e+ZYR8aZJeu6eLeVvxu8E1nmLCvNtsSWmz29/6QaGL/MUoAekcdox/6Oyp
         5jIySmFF6bxM1X5vhTifRAH4O9cr72G57vHxRmHVNI2VXYHmnS7+QUm/S/C3fXwobXHa
         o5oRRdQdQ/Vulx5lRxTKiv9Y2gKZdU70X2eotmtq5NRB/YjuUjg+qajDmZXhCuySm6Lc
         Z1fuhi9W4o5AmaA1y0OU6MzYE2Rr0zwtkKqPqCXu/KBiwxLYVRReUThf8ud6QR0kpDzl
         KnpA==
X-Forwarded-Encrypted: i=1; AJvYcCWgmtak6amy/AB5uqf2kEONxOvvL2y0taW5ELBZeg75N1vKrbbkE7ilzKnUisEmOHwwCxWewVrrFsn0PvHbn6IG697J3TxkmGcVfk9RIkQJ
X-Gm-Message-State: AOJu0YzcJkNs8NdN9HpOC/ydnW/vctmVeHEC0IxEazLLDjuFhgf0nE4p
	oV1sQlzLwq3e6Am9Ob235I6G/ehVEurDXoF2gklfGhB90t+FKQb9q78PweYxBwE=
X-Google-Smtp-Source: AGHT+IHZ1DeudjBR3oiYEW2qXm9zKF1SD2kfhoLrPxZT3yYrf04a37H+jHkRe47joBAEcaPm46pZuA==
X-Received: by 2002:a17:902:778c:b0:1e2:aa07:37d7 with SMTP id o12-20020a170902778c00b001e2aa0737d7mr551009pll.22.1712187695773;
        Wed, 03 Apr 2024 16:41:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 02/29] riscv: define default value for envcfg for task
Date: Wed,  3 Apr 2024 16:34:50 -0700
Message-ID: <20240403234054.2020347-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164138_085707_CB1F1631 
X-CRM114-Status: GOOD (  10.68  )
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

Defines a base default value for envcfg per task. By default all tasks
should have cache zeroing capability. Any future base capabilities that
apply to all tasks can be turned on same way.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 arch/riscv/kernel/process.c  | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..bbd2207adb39 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -202,6 +202,8 @@
 #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
 #define ENVCFG_CBIE_INV			_AC(0x3, UL)
 #define ENVCFG_FIOM			_AC(0x1, UL)
+/* by default all threads should be able to zero cache */
+#define ENVCFG_BASE			ENVCFG_CBZE
 
 /* Smstateen bits */
 #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..d3109557f951 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -152,6 +152,12 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	else
 		regs->status |= SR_UXL_64;
 #endif
+	/*
+	 * read current envcfg settings, AND it with base settings applicable
+	 * for all the tasks. Base settings should've been set up during CPU
+	 * bring up.
+	 */
+	current->thread_info.envcfg = csr_read(CSR_ENVCFG) & ENVCFG_BASE;
 }
 
 void flush_thread(void)
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
