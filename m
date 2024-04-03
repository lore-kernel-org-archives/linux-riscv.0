Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5AFCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryy3EyzZyEAMAaiKd9yVMmeFVUGr6+O5wgoWja9iPmM=; b=i7oaXzKPtHIxdL
	MQJLucis8Q0m3bO+PMCG3eUqkmDpXEE+LkzOYxyReQrxW3m5yDdRd9c3SKlCG9dfe7sngHJVhwJxH
	FHhC0wQHEzeCZdZ85IM565YCI+NmD3s198QNUWkZO2R5+PtZU8kE3F9w3nit4ugwTIjwBW4uerg65
	miGiD/C6/WXeCIUv/OK57CLtMffdCTF1mpnPrHGyN/fQGMySDaE1vWv4NJgIvVENveskTYuNsDvmg
	iJdSRumzKUAbWHRUXG6Dyg7cgROD95HaS+Hnx+4aZdb2vLWZOHP40adquQIzJm7xwCsjYTDBluQU0
	qtARLm3ceiJ6+9LT0GuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEn-00000000ZU3-1PqT;
	Wed, 03 Apr 2024 23:41:49 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEd-00000000ZKu-3g2A
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:44 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e0878b76f3so3541115ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187698; x=1712792498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FP/iR/CjhZ8+5rFjFCPv+Z1AgkLCTj0+E8uD6j+a7EM=;
        b=XhARLyoR1r3yT5cLRPhZ5MVoXv2QYDT/j8NjtWBliG6ywF0Jl8e9q8VfiIrWNdfR9Y
         /Pi3sdx4aoYfhBSuCAHHoLVKiEsu6Yk35fsDL4INJy602N/zwnIq0USWKGnu64uxpOIi
         J+V/gfiLNSRZW1FqaxtYHKm+74r5nizCJ82+fKmrTCW8yKCwgO8Dd6tsJn/7HNQMTL8h
         Tsl4cCVUVVwDaXraLoHcH5fbJE6fkhhTFQhqMFkwbkevHOt0q78BmfVWq6fRkTeoGE8u
         tR6xfjF/kLrvEzHH2UTquQrTUlsGFAnT0OQ4TSxOuBR6XwrUAliX4CFYy46aS4hkGdw3
         pQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187698; x=1712792498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP/iR/CjhZ8+5rFjFCPv+Z1AgkLCTj0+E8uD6j+a7EM=;
        b=MzrbhZ6s7csjoPRk8cEYHzUtgpnGWEXeRcuW4FcHBtR0KmDuwWmWhNySE3cqhyPsQI
         amXpUagGOmqoXnjGHTP+71s5GH+Lrk1O330imY0IlU8216CsYG8zS2X9HNupCmbGJWwA
         nkxuV0ZrEifwr0GnSloJkNc3n29vPn193DEbAtmHhbI2Xgd9j5jEI/DTEULMEkqWQiyH
         AfpMCH5yXOFHXRxmWx55AaXM/TWWgYzfzq+AURFX+qjJiA52D3qqVDQey+CKLTjpHdRV
         2dAnvpOI2EUiNtTRc+uomqidRfUS+zD9Bx+n/0cce231zXM49AKl2b6/RamUo1xDDXy9
         x6vw==
X-Forwarded-Encrypted: i=1; AJvYcCUGHA15B06qy5lllEsD3gLwcVSh+lo4pyyISVMJw3zSkncqYwtWb1QHpfUrSgm84AnmLW3exfwldpr+Z33I3tWQrruyU38pMCwA6qkTFJR6
X-Gm-Message-State: AOJu0YyubWoTCnsYSrTGWril1Vp4btfXvnjDcqQLtQSfF8HvCytWqgoI
	wOYxjdSp6OWytNlVMKAoDp33hsacyRoK+esvY9vSeW2W2HF1RAdTpK/UhbN415M=
X-Google-Smtp-Source: AGHT+IGz7S4BbcAxWhl0gW+uX+xLjSyvbd4TctmglI8Ag3ABaLDho4nYEEcOpuaastWra5ggKM/l9g==
X-Received: by 2002:a17:902:ea08:b0:1e2:8f1d:6fa8 with SMTP id s8-20020a170902ea0800b001e28f1d6fa8mr5120728plg.19.1712187698319;
        Wed, 03 Apr 2024 16:41:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:38 -0700 (PDT)
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
Subject: [PATCH v3 03/29] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Date: Wed,  3 Apr 2024 16:34:51 -0700
Message-ID: <20240403234054.2020347-4-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164140_121843_8FC06276 
X-CRM114-Status: UNSURE (   8.22  )
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

riscv will need an implementation for exit_thread to clean up shadow stack
when thread exits. If current thread had shadow stack enabled, shadow
stack is allocated by default for any new thread.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e3142ce531a0..7e0b2bcc388f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -149,6 +149,7 @@ config RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_EXIT_THREAD
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index d3109557f951..ce577cdc2af3 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -200,6 +200,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
