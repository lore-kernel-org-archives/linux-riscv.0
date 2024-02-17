Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81E7C48BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynX6CE9FzY7YHbxa/ktq6QTnlE1pUlRzSP78VJ9lYqs=; b=xbsXcVPrDCwO/b
	jCsZneA/Y4vx0DWowE7SFp/rdqfDxvYuR7Udx/jqDDsyeiuOJda38QV+ltpL6v3GGsNWg1rmV3bPr
	k2Bp9WVRXHwiWdlCKKad9yRck/9zCBIwr+upJ2TPzDw8FDXgk/AyRruF3EtLaZqGsYOrIuBI+SoS5
	7GXlU0krCBTNcykLz4wjEP5/B0H55WLeozkaIYCefKrwC6FTphC3UxoaNx8cj1T5vFCb9LxCKQRkP
	GifLf1bSbGtCCx6oJSfDocLCsEVOfO3qM7QE3Jhppb4VDhkcSYPHuqVEYzEQQZyLGwV9guwsiZYd0
	V5jIjkEKgoA6GdnddUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb93F-00000004IyT-3ioJ;
	Sat, 17 Feb 2024 00:59:33 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92k-00000004IWG-3uQd
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:12 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-36503a4980aso4941545ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131541; x=1708736341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWbguiNHtTSYUYCLfEbpuKVHcWVD1RqHX9iqh/aIsVE=;
        b=xoKusNgiHoxE7MnNGYkST+8WkpCymmKBnmEziZbiFCstaBSVhHDbxQqFuvKzbHClrt
         LUAx05KYhdMDc6Z066z15cJMjPzTzgOImL/q3Y8RRXVcXo0eU55Ch3IDIeeMnl0NlZDH
         MwRhbVQcibMiaEQmxC2WQBIQluKwE0xCCmzN9azSHcCFdt3O2VDBG54oM8N6tT7ZhfVZ
         EoH7nzeRX4WILthdzA0w+6TPLv3hfyv3JUPE0rKxlrzMO6OQRzcA1mfQZHwFtMPONUru
         IpwearEwFkggAS5ZhiG0WBnWrFOmDEmiZDFE9zyIM1ma4UpeMzQNcpv+bMhGDyJohsrF
         i82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131541; x=1708736341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWbguiNHtTSYUYCLfEbpuKVHcWVD1RqHX9iqh/aIsVE=;
        b=LAibzLDo0Va99+UZMpVZCx1xH/6IcWZ6C1Kj2193U1FWEk6km2TMos+eIdfHVIVRmz
         jF9AOzZtaA16yQyd7QSDGbz+NM7nt0DeAHgO+XZT9ShLA8mixSLrIqglANI//B6iZKUB
         q+x38LsV8eudCGEO4P787ZfoAX/iBe/Q9euLQqsQcqVYfO7vzx0SB0fkiXLDc5DsCotv
         OQJLm/bGfZVBsODGdQAO+c0FMo5xgyza73qePcmSW3n/Gqxs4s9F3jOHKZhvifRJGKKu
         X3RrkTfznsft6t7d8LiNtNChSwXVA5S8s0SeIPmdJLR7hrdu3koqXjKYVel03edvDERU
         bqDA==
X-Forwarded-Encrypted: i=1; AJvYcCX4dsCs1lDcPJ0gYegwySR4z3NDe1RnHhZ+3sHmkSa/DrtLCkbByL3S3nCdg0+KRAvZP/MKUCE4D2UG5k1/oIEABBIRgEJemIR20Qsd/cBL
X-Gm-Message-State: AOJu0YzKos4IKlsyi0AtKOQVoAOJYJmdH0P77IJeE40pHmKyg7GzkWFY
	a9E4ijqH1jw54V7i3Zl3ekccIS8hmukb7/mJFn7g6bY0WmQMetwQa/ioejuNKUU=
X-Google-Smtp-Source: AGHT+IHifVbaiIwPPRkQiapJsv+eTt7V3V9Fl84UxSNLoq2qUyNBCDP8xe0Qfv2O+RYJ3juxVaLu1g==
X-Received: by 2002:a92:c5cd:0:b0:365:44:1edb with SMTP id s13-20020a92c5cd000000b0036500441edbmr4716100ilt.3.1708131541456;
        Fri, 16 Feb 2024 16:59:01 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:59:01 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 18/20] tools arch uapi: Sync the uinstd.h header file for RISC-V
Date: Fri, 16 Feb 2024 16:57:36 -0800
Message-Id: <20240217005738.3744121-19-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165903_385485_C90ACA53 
X-CRM114-Status: GOOD (  12.71  )
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

The uninstd.h has been changed since it's last sync. Update it so
that perf tool can use the new RISC-V specific syscall in perf tool.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/arch/riscv/include/uapi/asm/unistd.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/arch/riscv/include/uapi/asm/unistd.h b/tools/arch/riscv/include/uapi/asm/unistd.h
index f506cca520b0..950ab3fd4409 100644
--- a/tools/arch/riscv/include/uapi/asm/unistd.h
+++ b/tools/arch/riscv/include/uapi/asm/unistd.h
@@ -15,11 +15,14 @@
  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
-#ifdef __LP64__
+#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SET_GET_RLIMIT
 #endif /* __LP64__ */
 
+#define __ARCH_WANT_SYS_CLONE3
+#define __ARCH_WANT_MEMFD_SECRET
+
 #include <asm-generic/unistd.h>
 
 /*
@@ -40,3 +43,12 @@
 #define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
 #endif
 __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
+
+/*
+ * Allows userspace to query the kernel for CPU architecture and
+ * microarchitecture details across a given set of CPUs.
+ */
+#ifndef __NR_riscv_hwprobe
+#define __NR_riscv_hwprobe (__NR_arch_specific_syscall + 14)
+#endif
+__SYSCALL(__NR_riscv_hwprobe, sys_riscv_hwprobe)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
