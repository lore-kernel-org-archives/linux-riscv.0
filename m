Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2422DEEE270
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IibOt2Ni9ClSCOSreXmAsHF2s3acizmzldpJUg2ENvM=; b=NLByyj+xuhwqt5
	P3m4YZuSiS58tq+iAbyAG6UIIhVVnlf5vRE7OVO81ouwvTqezteAJVMVe7GdrJCwXlhwkY8L2pQDp
	4T0DwFFShkvv52nP9bHYhGDuXOE6BA3pbTTu1qDaQZiNwVmg6T2jEVZ33/1rc7j2d1JeSKvHYOTo8
	KR1W7ImqZF2W02/MknStDHb7wB9mx3+unYitkAG5Tc42Vt7ImcWh5mqXooL/rv5CaVFYI/xav9HXa
	jfOUwDGV3QUmmzPeFEeNmBitW+rMySPwXjIxDaUibETK45jCHK0p2h8udJuMiBoX5dp/wSw/HUL+S
	/Xs5zKu6xt5oT7fdCYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souDF-0000000EaWT-2TRE;
	Fri, 13 Sep 2024 00:31:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot4P-0000000ERNe-0cbE
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OL3ZuDMqCGbJryHQ73fpa2Z59erwJkwOpRXQ2rxwv1I=; b=DaOP/Q/ewqX+Gw7+xIphXxwAMA
	hxnJ3wLzfl4CoQs345UE532T1aLsZDgKN/UReeo7MiNUp1vIgBtj5M9/qJ3U8KWkCgA6pgtbujNPV
	r1dSxVEv8eawmtHZsTU7PnSem2KSYG965z5KnonHTExa0pjlbVihclfEX6sDe9HXcvz5iARfRX9He
	cYzhCbTApgvscO3ybyeOA8Ja2ZiF3C6HYDuFgcoKtlrv6bP8TkxchEMMoCkh3iUyxYHa7MHRvJVmY
	pyZz1/rph/jOnKVfu3QpOtSEtD3/hxby9Dfx9VcltA4/0xXBUMjtM2h5W8sQweHqtTynu/PlVz8Fk
	eNAkBGmA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot4E-00000000Y6X-3343
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:17:46 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so1017346a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183052; x=1726787852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL3ZuDMqCGbJryHQ73fpa2Z59erwJkwOpRXQ2rxwv1I=;
        b=qx36p65w67+WlxBr8rNQbqlANkpX8Yok7qRUIhe23CBm5AsTB8cBguHc6C/2va8ULN
         S9Ms+uporu6jhZGOy3SYTy/A3PjgeGUjHFfhwaT21C3WyIA+rX4LA6WgjN4yy901cVwy
         CdJ0rWMz11PV2OPIKUrPCVU2R8R5yG36pqUXQl+Whx5OG1vN7ArHzvj/C7oU8ub3DeDS
         IfpZzrEFf951nHoXfcXp+5HaAFlo+1gFa+GV4qjQL+jp8kjx/y24LU4+cvcl0qFA8LOC
         DX7iPQNYc4CbLMWEoB43XhXU6HwpmbuAdOeLVuR+Q3povpgOCynvOpqPBXoYBdz/CH5Y
         l7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183052; x=1726787852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL3ZuDMqCGbJryHQ73fpa2Z59erwJkwOpRXQ2rxwv1I=;
        b=UzXsglcTuhQ/K2xK2oavp0SFNVl3Jk3sIKzAZi+xMJrd80iZgMaaPI4jY0fjNp8ZvU
         oCaJmdgdFhPiLaAnsZ9aaGI6PsH+OT5sCJTZHs7mVN/C0gOCYNbJS51xrpwZaQt/3PHy
         6XaNfU+gr6lIkEpVyAcZSocrFZSZu+5gZVaboYO6pdIxmKMHs6+YkFjBRVbGCrLjcz7C
         SslmdOMSayefeTTBnCRgTcj/xOqx5BRR+JyiPHIQVYb5MvT5IkWGLzd1sTICVTfqoExg
         XaA8tPuCtR2gOhKgEa4UPI7ff28kJe45pKxWdZXcdXNFJf3kCI7KyYPz5dSOhUPL5uql
         ny+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcfm0SNSYZCCRcx3afQZSOQjwojKoi36WFxFjX778Vw0tG48OQUBvQm/cHmF2tDWkIIRhOjJnZ5ViL2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyE0tD0ItWpfIJQ46Wls3kqjlbfcLcmtc/o8Oc0P4X08Qq1grp
	O/77+HMOI4B56bYu5hPjpKxqKTGDE5ErSMQbt1btuTly+s4Mz8NfN5u+Z5II3f4=
X-Google-Smtp-Source: AGHT+IE9fam6IfuuZkZ+ZvbmFrswnqok3RLTHJaic61nQCF+zeo3Ji5hunRDoKXFzuz+ce22C8cSog==
X-Received: by 2002:a17:90b:1889:b0:2d3:c4d3:de19 with SMTP id 98e67ed59e1d1-2db9fec65ddmr5214534a91.0.1726183052278;
        Thu, 12 Sep 2024 16:17:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 06/30] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Date: Thu, 12 Sep 2024 16:16:25 -0700
Message-ID: <20240912231650.3740732-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001743_077087_214893EB 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

riscv will need an implementation for exit_thread to clean up shadow stack
when thread exits. If current thread had shadow stack enabled, shadow
stack is allocated by default for any new thread.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..d1d629a3eb91 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -177,6 +177,7 @@ config RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_EXIT_THREAD
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e4bc61c4e58a..9b66dc07c3d2 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -192,6 +192,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
