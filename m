Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB8AC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDAnbU/wW8/wcyFmzAZWta1wBl/I2Z5LV1nwWooMye4=; b=YQT7VKdsTIzPfR
	01tx+YUgX6TsDwwzTdKq9eapbAfeMlqVIAQo5w2pYdNwZtdWBt3S0blpws8bi/IJnyWb4XyXBF28H
	S15Dv0GWgJslsJeZA9oWVw+aBI6XGrkoAnJn4qOVta/GtsabYFcJAc2hNLZUxFQfcFdHVI6o6v57X
	m0rRto0/CkQRbNIBpU5Qo1KbGJS1SBsbHW463dkZYNmf1txNoGZIrrtxbD7/CA7ElpZ0JC7N14Pqa
	0fzCCYwkEdz9OP1BjLEIBI2FR46sgwVh6WumzByuPSTUInec9uargvqhl5rkZG/lz2rGHzRQYp7Fc
	yOwNRgSbcoTYhGseGvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6xr-004LHf-3C;
	Wed, 02 Aug 2023 08:12:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6xp-004LGQ-0M
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:12:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso60233315e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963932; x=1691568732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cSgJAHYTUnT7EM82v2w304ZdRWAgN6wEFUjF/hB87M=;
        b=ZY45fPleIMseKM4cyfGJi+sI4NPdRTXruHiC2M15hOTi+UE4Bf2pB9Z9MVAI4IBQF/
         BbMvcTvkB7VZKimvVYxFY2XWlber5/H8MaKOH//zydx6HH45VnqXhuFLywrrQ0zaRUnL
         Ptqi0H9fU7/oLemakiWSI3CFeW53PivDuvpUxYu0x2rWtIw2VE7waNFLqu+42jJQhn3u
         dBNwDsBVQk6TZhy8KsveIxKeHIQWbdizzvg8yt9CP7dywSzDVzMaSz1+elrSSjlBVVGF
         m7X3irDoPLF+saps91kRPqpUGnUWvgkOdLFqgKIj0sPaatw7YetpNJcoZk16pvdtJNkv
         SM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963932; x=1691568732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cSgJAHYTUnT7EM82v2w304ZdRWAgN6wEFUjF/hB87M=;
        b=dC9WCa8emnazN9//3XROeeGVwBz/FKOSkezCUffEHOh0GneT4EYh++Tm+g66+OJkf0
         Y/gIyrvSSF/bQ/gTQ19fEIdR48ZYoAK6v65R4mloQGQqE9ApfwRInhxyzoYGos4hzbTx
         6vuUfYlJ0foJoHGFFUSQJI5K+3RVhfUO2u37M6PS4Ux5O9njMhvjPEA4FxtyN75dxcRl
         KF0fmFfSS7CFpR9zUYP1Z16pg95tCN5G+NrXddN8SUJNd3uEnfuNMjpFF69zwxFCfr0x
         LOgAZdWXboCGlh7CjxmL81DPpBQE37KhsrA4Pm6aRvMk0ZF19JF6REMye1LbHxuIzAWm
         7GSQ==
X-Gm-Message-State: ABy/qLY3fSWje7IGyDCUiIhzeM091bkH7lCY8lJa4vkmdMlut3Bp5oLZ
	b6H5OKYD9G7sxrm6Xegbi8JkJg==
X-Google-Smtp-Source: APBJJlFODy2Hmr2Q6DovqhlsZUIZjP/yEjAO7EKuY8afbw5+j6M3rXaiiUZ8xQpTUJ2mKjGA2xKlgw==
X-Received: by 2002:a7b:ce14:0:b0:3fc:a8:dc3c with SMTP id m20-20020a7bce14000000b003fc00a8dc3cmr4134949wmc.37.1690963931776;
        Wed, 02 Aug 2023 01:12:11 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d48c9000000b0031433443265sm18269448wrs.53.2023.08.02.01.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:12:11 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date: Wed,  2 Aug 2023 10:03:26 +0200
Message-Id: <20230802080328.1213905-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_011213_152952_133D4C89 
X-CRM114-Status: GOOD (  12.45  )
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

riscv now uses this sysctl so document its usage for this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 27 ++++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 3800fab1619b..8019103aac10 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -941,16 +941,35 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
 The default value is 8.
 
 
-perf_user_access (arm64 only)
-=================================
+perf_user_access (arm64 and riscv only)
+=======================================
+
+Controls user space access for reading perf event counters.
 
-Controls user space access for reading perf event counters. When set to 1,
-user space can read performance monitor counter registers directly.
+arm64
+=====
 
 The default value is 0 (access disabled).
 
+When set to 1, user space can read performance monitor counter registers
+directly.
+
 See Documentation/arch/arm64/perf.rst for more information.
 
+riscv
+=====
+
+When set to 0, user space access is disabled.
+
+The default value is 1, user space can read performance monitor counter
+registers through perf, any direct access without perf intervention will trigger
+an illegal instruction.
+
+When set to 2, which enables legacy mode (user space has direct access to cycle
+and insret CSRs only). Note that this legacy value is deprecated and will be
+removed once all user space applications are fixed.
+
+Note that the time CSR is always directly accessible to all modes.
 
 pid_max
 =======
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
