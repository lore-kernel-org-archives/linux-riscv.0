Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E279C48BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eMUxwaJm0Il8G0jiyQsU51mogawBb4CMuELAir11jw=; b=0uq6ErT31nSn53
	9jIOW4o6rZPuunsVLHfA1k32FH5QICadBk+fVnZrnmWQzlMuZP7GtcLM+W8wKtDvQ0DYiT5/nLBHO
	R+6NVhcaJ0fzoM9jt+DnkutdyTdXKCUJhHdoSpjwi80NQ411wAO1iqHelIabWAJJB536odrGUIWSL
	Oekm0Bx/RwDl5rSuqp2ue7y9WXFyVBb4mSzYW9ycQlK6ms7CTsjXroXOmHbkMWCabcwIeX6FRYGr2
	dRSgmO5AN5cauNswqI3XEHHTeu62ejE+HilYomxzenX5FMl2U1SEgh0COCudVcaZzTC1UQbAqwRhG
	v2PHBFkinTAg/l389rvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb929-00000004Hyg-2JX0;
	Sat, 17 Feb 2024 00:58:25 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb926-00000004Hvy-3aIB
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:24 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-214ca209184so1745318fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131501; x=1708736301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMgr1ik/uEkkoRNgvQCIWXGmAGeZi75wQYv7ioKJulE=;
        b=Ui/iSDXEAEaqgKV7oWTVVWiMbLyWAKn6VQWj0l4t8Dt6vCGAxViiOSIeCtw2Nt5xSe
         2SbiZT7122f6DNvAQZZkaJioC1IQgJ73vEqEWhxVzdgbT76G5ZZPvbLPOheNsVL57UDd
         IjIuMSXNXQ9svQ035iQeSSUjeqcyuvQssY0Aj3RgT6BNWGDgAqXkgUKemxry7fzcp+rC
         tSKY17HMRPdWWZdZFxXF8tfbDl6ihHZV66PbkLvTEVN6tvfqb6qtJPuw8FJOMDnb2B7B
         ZY7LUtpxqfw8+jbAJ9TJTOAKwni2yoSduljjHTrF7IWGYZFMuUZSUAl4yAtCD7ryiYF+
         xQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131501; x=1708736301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMgr1ik/uEkkoRNgvQCIWXGmAGeZi75wQYv7ioKJulE=;
        b=Zvkej+AOtg7u1Ky2+Gf1xJtosE9DkMENfJSiNbVHT+lx+khpJBVCb6gXtQEVw7UGZq
         rPvF6EkMO2b1FVI4/ZQxGv5WPwcBAX1LvaersxzTPGe/Fvdtng99sy+ulbRtKS9VAaD5
         sYt3F6FvZKBpy3Y5ca9oDRXdvsDrtgePfajH9XGo5v4ula2luu/NWwfyPkzdtpuy6EN3
         VX4WRFIlTcl39GLlKgtrBLqo0shdmRAQCynFDw9at42PgvjGo9ygPGqcipGg3POWRLkb
         mYyqhBSu3ZYgRHR/kQ0RWwyNLNZ1Q0wGvy0JhjAM/wUN3+8o1e5gFS4Tk/Zlg7T6nzQH
         0ktg==
X-Forwarded-Encrypted: i=1; AJvYcCUu9zQEnc3Ix77yoNE5wo/xuSt/PDH3EKW1MOADz5m1kgd9QFydmstQMnj0RSgDcoRPAR1ucEWvyi8KWEP65Nc9gftn9rWM1BZ/XTNa1dCj
X-Gm-Message-State: AOJu0YwDxYYdOBBCB9ddWa2Y02X6n3oIU3hiMXyCnLy+mZyGZI0JhPSl
	qGl9cpxHWB06NIDfurbMb2riKZhWLdipWnIUyV+Xzb30aS2/a8Y7PQmFjUR1gEw=
X-Google-Smtp-Source: AGHT+IE6LQp69xLCLOFFJy6mutWlZnmsAZsBULNSC4jH5aWno9vuisH9O/sW+xQ1B/XKb7HuL+17UQ==
X-Received: by 2002:a05:6870:224d:b0:218:d374:9b7b with SMTP id j13-20020a056870224d00b00218d3749b7bmr7867438oaf.38.1708131501652;
        Fri, 16 Feb 2024 16:58:21 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:21 -0800 (PST)
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
Subject: [PATCH RFC 03/20] RISC-V: Add Sxcsrind ISA extension definition and parsing
Date: Fri, 16 Feb 2024 16:57:21 -0800
Message-Id: <20240217005738.3744121-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165823_001057_2AC56345 
X-CRM114-Status: GOOD (  11.31  )
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

The S[m|s]csrind extension extends the indirect CSR access mechanism
defined in Smaia/Ssaia extensions.

This patch just enables the definition and parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5340f818746b..44df259cc815 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,8 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_SSCSRIND		74
+#define RISCV_ISA_EXT_SMCSRIND		75
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..52ec88dfb004 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -301,7 +301,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
