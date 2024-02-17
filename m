Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B05C48BC4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 02:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN7ztriMsJBphY5Y3ik9LQ+WT+++bPjUzvfOW0AO6lQ=; b=KmV/xMVoyT92bG
	dFHtQZjZDdluAp2m4OI5tIZzDajUBsTZqx9mu/RbM6UZ/GC8GZReEeCVOkvCgyHQJurhWl3JiC+m8
	ocjk5/iIY9JTiJE3vhoidKMjj45lk88lENV3SqMRDKGLX6LAhw+lCGhPhgjdMWBdb928cbo9lZ/C0
	ucerymn802BwD/ohX0gjAt5hyzBKa1NTFri7jH4y1krfiUxJnT47GeTLneWzUmg/j4k/jDbtXQ+Ka
	TZvBJ4lkd2FS9cAC8niqAtjrnJJAbwPjJjSm8eXZa5uI7o2/S9q2nM8P/VC1CcG6eUxDB7ypLyuQ0
	xZjMbqKfm6kQaLInf5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbA3P-00000004S95-3IOY;
	Sat, 17 Feb 2024 02:03:47 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92B-00000004HyA-2Oh8
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:29 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-204f50f305cso1848265fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131504; x=1708736304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGOhtuG2UaHnTQxcaDC8cd9FvgXaDTb+kFLo3H4sRjk=;
        b=xHsNJpHUr2cyxXFzCn9wYZrPEzfjC+h5zCTT/G4/LD8oaFQuPCmrssQl/U38v2Atdw
         HyQUByqr7Zzc8hBQkpI3KBYAIG+7a7M7FJbzKkeojfwMqco7IYk6oAAsb6zBb5bFFp6h
         zo5QR/uQyfRaHG2GVs8XKkuAoL3NZ6aJvVrbTIXpnh4NpJSp3HKLWkEihl3aY4cGSEyl
         AN4HvWTayrJEVD2c9l0a5EtU31cb01fUVfukCgjFtam9bIKV79XJ+0guwrcWUydvB0/p
         p/2LpayzSHyAC1Rc0tGTnbDguqqJyVfaD3UF46bEWbnFfbVGSf7xomqvDvhK+coHFLWM
         7ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131504; x=1708736304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGOhtuG2UaHnTQxcaDC8cd9FvgXaDTb+kFLo3H4sRjk=;
        b=CfnkZy3h6Kb8ysCM7Ts1N+XzV8HpSUgW2N277i8GIdIjd8s45tn6wpprpnL++2OzH2
         jJwmTmblclqOhvcXkUCoreqRK+GBXBW8Aryj32y7rAcOwoqG7Pm/KVZYCHNgIjaZuKlX
         nUSYr0xowy7nxzMzLHpB6WP2c0l78jbC0ie5faUnd2jkUWHBLg9iXgOmavT+3ILMiy6p
         Lo2jxK7c+qyv7nHzv2xdjGjDlBPj8GOwiiQb+s7NUaldvIS49B9d9XZl9GCUvO1kayy/
         bU2QeB8oXVBPECPm6fiFRZrVtnQuzswjT/sUTcAqAEdPE4vvpC13rtt56nnaV8kceMTS
         UvsA==
X-Forwarded-Encrypted: i=1; AJvYcCWZkSm92jcojYRfT7yoQN37GZOYnIMA02vMBkBYHcoWKavb/svG51rWRq4MS5BLQW91QBM8doh0fJNdZ4NYgn/yqwLldR1P6DrIOcYPYrDy
X-Gm-Message-State: AOJu0Yz/eMSAgqC3H8IuIK/cFNRDKKut5mCKe7uAu5ZBctoJolPk2zrm
	AQ82U8Q36QoIft4OCqmvpdF2FU2N2s6EjyTUqfsTrxvv/yaBIJ75t3o6rqtFjcY=
X-Google-Smtp-Source: AGHT+IHVmqRBo/P6TbzgA+IGRtey54aZ2Ug+NftR1Tt1j04Iczb8JXsSk87BBrBxRg2sWo4RpRMoyA==
X-Received: by 2002:a05:6870:40d3:b0:21e:7fba:1960 with SMTP id l19-20020a05687040d300b0021e7fba1960mr1993804oal.18.1708131504258;
        Fri, 16 Feb 2024 16:58:24 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:23 -0800 (PST)
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
Subject: [PATCH RFC 04/20] dt-bindings: riscv: add Sxcsrind ISA extension description
Date: Fri, 16 Feb 2024 16:57:22 -0800
Message-Id: <20240217005738.3744121-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165827_713951_764074B5 
X-CRM114-Status: UNSURE (   9.68  )
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

Add the S[m|s]csrind ISA extension description.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..77a9f867e36b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -134,6 +134,20 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+	- const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Smaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in M-mode.
+
+	- const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Ssaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in S-mode.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
