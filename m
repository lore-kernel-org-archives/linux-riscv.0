Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E0AC48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6kLLb+esDUmfpbvEi/JR+oh44XFyIb/ZPgVMg+vZLo=; b=0DJdR5W4AVF2kC
	2SxAx/og9kMtOb0xph4v6lmsAqcNSTAMfEWzDdOqGYuYn90v+fl8uyDBBPv7TEpsv2GxKyXz4vMw2
	saHTXj0aQWyiPGNFsPmwSN5rH8q1u/GfxS3vRUdH2bdPUxmNWUimVjjig1inMZnrusmaIDj/qjR2A
	JiL88qoCUg7mP+DQsOqP+7D0C7G5JfFDkEvUwDOk4jxdMFh+/GkF9saqI4loZEvBKYbHXGhu8olma
	U7MTORrJiFwupyo2xGufJ7V8YJ9Nm/ZsVkQfH+r/Q+8DPpOKT4yQsiNfFYsBsz5dIgZPG6fMQuKMy
	N2mCu6ZD6D6VcDkANbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92e-00000004IRI-1p1k;
	Sat, 17 Feb 2024 00:58:56 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92M-00000004IBF-2a39
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:43 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so1127536a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131517; x=1708736317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXnbbBG8uU1BPF0JsrRvm9475kp9ExkHduilmVeFprU=;
        b=yYDOaVa1HHTmHFELz6tyG+Ai0GVp0CQA0yku5JWXhwEcWq57ztw264XD7SFnk8MIky
         03adajtLNiJqrqOvyQD7vprVbTnI2qarbNa5tQeOdROTh96gJRemRT5Fthb3BX2A/Zsu
         TLR7CORwB2V6vM7n/s/IqQwRmXd605c6KynmnYDgQKC3NhxZSzMkYVmysUMd30anWA/m
         IMKEwDCarUrtgCCECSQKwBIF1Z+GHSEu83l0FF7eB9KUjl760rKZMC9ux5vmsG4jYkkt
         aW3ZchY6Dgd+1PhwsWhcWsRlA0gnCv5vhSUQFawc1TfG9XuxnHdmpMf1r/2kbqUbfDQ6
         5N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131517; x=1708736317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXnbbBG8uU1BPF0JsrRvm9475kp9ExkHduilmVeFprU=;
        b=ZdAonul6u/H9pBuZhtqxgDzQvpVOSoJlk2GUHcg6bepr2EdI65hNm73QsCtVgJNC3S
         RZUOji2rMS8x98MZdyiutMosvAoMH36NQ4wxOy/ev6GOmoMIbL34MemsEgEYZ3oR3hPV
         GLN6XYfO/4oO2JmfnJojPz0TcD1k0olRoGPZAdOk/5zqpvqvsgpvU27dt9+Wu7FTIrgt
         ZP8oY406Ojj3FjO5Q21IG/7+OwWDvvimUujH4wwZ0cO5WLUH2/Wb2MQ+rqRkDH1m9t9W
         m4kw7Ps58tPw4r2ihicaqSX+RB+Kr/KIQfZvxAcQIj0X2M7DC2qzMQ4sPqqop6xnExXT
         RKCg==
X-Forwarded-Encrypted: i=1; AJvYcCXpslVmgvP6SNgEdgTi/RdJH604zWxzhQgjPKtIw0ClQaMKDgsHHOM+K7wW9urdoHXPjgGlmGndrV+B2KBgrXaRJ4WB5SOyyIIbAfmPxpol
X-Gm-Message-State: AOJu0YzJMW+M3ZLbWnRy4VheK3RkTKGq+kZso3cs+W5yW9yRGkxofx+P
	IRGcQHvClXtz0qQWCJF7FUZuf0F0hfc3+s27gju/n8FDuuOp4FFDxCrsEhwbxnw=
X-Google-Smtp-Source: AGHT+IEd55O/kx49zwv2ulB5iw+jovlUvxT19+VDOzMjgyKdkOtaXKU1w9iKYbRt3ClDO/pqc7Grgw==
X-Received: by 2002:a05:6a21:918a:b0:19e:9647:dad3 with SMTP id tp10-20020a056a21918a00b0019e9647dad3mr13656557pzb.12.1708131517282;
        Fri, 16 Feb 2024 16:58:37 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:36 -0800 (PST)
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
Subject: [PATCH RFC 09/20] RISC-V: Add Smcntrpmf extension parsing
Date: Fri, 16 Feb 2024 16:57:27 -0800
Message-Id: <20240217005738.3744121-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165838_968241_71752C6C 
X-CRM114-Status: GOOD (  11.84  )
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

Smcntrpmf extension allows M-mode to enable privilege mode filtering
for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
only available only in Ssccfg only Smcntrpmf is present.

That's why, kernel needs to detect presence of Smcntrpmf extension and
enable privilege mode filtering for cycle/instret counters.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5f4401e221ee..b82a8d7a9b3b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -84,6 +84,7 @@
 #define RISCV_ISA_EXT_SMCSRIND		75
 #define RISCV_ISA_EXT_SSCCFG            76
 #define RISCV_ISA_EXT_SMCDELEG          77
+#define RISCV_ISA_EXT_SMCNTRPMF         78
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 77cc5dbd73bf..c30be2c924e7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -302,6 +302,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
