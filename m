Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980F2C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLK+yaGVrlwB1BiYrqSrTB3PhKDfHBWOZ6S3JGvGivw=; b=XC+2MUUk0tRFsJ
	WMk9vhDeTkcN4lTVLOhl7moiBs355Qv5ZDd1dRvPqM1CkQuYw1pCZLq1SeDmei4CJCSne1qLmfRjG
	YhUWbaldJEEK6js+ZJPGi6wu/8WUjWOptAFJo8cdZk0W9v4bznFI4r+Q3dbfCTWwye0P2m8V5Nt61
	/0Oq9FwDmG/ceqfp65KDHnqOqbgjPxDmZb/s3BcqgkeXKbFCVsf45YTKH/xqxaBSCWDEnAlDM1jFl
	rDTkHxIE316KqmXoK03Z4hGJ0mjZH3TFJL/3o1qs8vT8jmm8oq5O/6EbWu2T3dctbavmLIepzjFuv
	ZCTtFZwkmRKkx7gbN+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ4Y-0000000HOKN-1Nd3;
	Sat, 25 Jul 2026 00:16:58 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ4V-0000000HOIv-0QuA
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:16:56 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6aac8a94a2bso553071eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938614; x=1785543414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQiF3eVVe6gJYJ8m70qxbI5yAOLzmDA8u0NMqlvADAY=;
        b=CpNPUwYiQ1SFutGBDjGRlwoPSb/oJc4xGGaa3htTo+trFM4UWN0EfymksRFKR1ZXDU
         H6F/jWdLUcpAClOBSA39JtSfzubrCNLo7hJYIpR6PLaU+Q1HOT1hWvFOxLUA4wEPG62M
         n0rGORbBsknxDWG712jJLqu+vFCd5htxdclkwZZqe7pEyHp7Rbu0Rbxh4zegtTsT+ra1
         nxJvJxfKbtuRtdfMsvvyVZ0q+T1TtBAvFEsRRmdY+zXadiBpEsbfc1UbBCW1SPx8UqtT
         xzigeW2yV1uvtE1DXEt2wyPegsBPfr5hgtLMsLoFBmuhpAK1dIBHI2/uqfTrNcjUJpEv
         cDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938614; x=1785543414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XQiF3eVVe6gJYJ8m70qxbI5yAOLzmDA8u0NMqlvADAY=;
        b=XbfdPspwnd4uwfi4f7vNTf2y0jOU5hj65ioYzU5/iGKN7MnY+J75OvuDvSlA7Xfkdm
         ocRC1hBqSQvIxWWvVEPKu1Q1kHVlVPgYoCP+Y9iLRRKguVtYLWyuV8C7y59/07c0XqvW
         hKPHRvhFcEisnwRt0Gp/JZWqqcazVO1cIEVqEmPfjShc2SPb+Tz4rBn8BjrpcyQEgZZv
         t54BEF21PU9wSugHtjmFx6CAw2q+UAJNaatgi4dpIdY2U8lKg9XjaCB3TK8WdaVdA0xs
         VJQOqXcHjI+88+JbZWEIitrroRyZzproE1J7xvlyNe7sofoweF1ahBhKIczSFBtly5Ky
         6u7w==
X-Forwarded-Encrypted: i=1; AHgh+RqU8bNSUST8lYNvVaIYBPfoe0yg02RZuvEuPxx4Z6vRzPQqdtn0HQjy8hiGpAPP0K+cy5X0+Xl8u31gLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1tbXX8bkW2s57YV9cD0hJ+QsNj+shrtOeh0OcBGZXxJbq18bz
	zW5HBT7jV8s/DUy7mhPCIVl881EeymsX+s6ueHRObZMpes8+Uew/gcIspU0lgWsmkDA=
X-Gm-Gg: AR+sD10oizkzo4npq97AQG1rqLoMP8AEcd87g3d7Z835dI/8WN91zmZ7LOU6Z6Yqz/X
	MAY5e5BZCl+8Qt989iGNUTtPrFmAYyuUSwbuDrJStaJbBogTzxJ19iRgOTRdNhHzmXfWV4NSndW
	vTGhk6rkTIfXipRR1hkFEwi9VrycHzndxZkBvj5qtsbSjj8dPheYfAUPGUsyPTWUk4QYXx7A3/p
	V5r1FTUDG/TQp7ztDkfCfH7UIBzggYML6Z+0Bex1QqjdN1JeNa/HnzaS4/oyreif0vkIPk8y0p2
	RITdmiA5GlQcRwTQY6pZOrIZVtBFOsF11A1GbV4uvGR6ohCPvNi+Yqmm2qG0ary0Q+nkxFan//w
	eU/HiFgZrnx7eBoTDO3j6EVhWM+88Y3ubyIGhHw3xI2HMQOvVq9CGkDhnRWkA28M/WXfDB/nOW/
	U3NjOLpkS0w3oWTgNSzVoTu+TOowBkC70tGyo=
X-Received: by 2002:a05:6820:198f:b0:6aa:e344:85f7 with SMTP id 006d021491bc7-6aaffa01e9emr460747eaf.40.1784938614046;
        Fri, 24 Jul 2026 17:16:54 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm882929eaf.7.2026.07.24.17.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:16:53 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v3 1/3] riscv: hwprobe: initialize pair->value in hwprobe_one_pair()
Date: Fri, 24 Jul 2026 19:15:50 -0500
Message-ID: <20260725001614.2578617-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725001614.2578617-1-tchiu@tenstorrent.com>
References: <20260725001614.2578617-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171655_153840_2B7B0122 
X-CRM114-Status: GOOD (  11.76  )
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

The vendor-extension handlers reached from hwprobe_one_pair()
(hwprobe_isa_vendor_ext_thead_0() and friends) only OR the present bits
into pair->value via VENDOR_EXTENSION_SUPPORTED() and clear their own
missing bits; they assume the caller has already zeroed pair->value.

That holds for hwprobe_get_values() (it zeroes each pair) and
hwprobe_get_cpus() (it re-initializes its scratch pair per key), but not
for complete_hwprobe_vdso_data(), which reuses a single pair across all
keys without re-zeroing. A vendor key therefore inherits stale bits from
the previously probed key, and the wrong value is cached in the vDSO
all_cpu_hwprobe_values[] and handed to userspace on the fast patih.

Zero pair->value once at the top of hwprobe_one_pair() so every handler
starts from a clean value regardless of the caller, and drop the now
redundant zeroing in the *_BLOCK_SIZE cases. hwprobe_isa_ext0() keeps its
own zeroing because hwprobe_ext0_has() calls it directly, bypassing
hwprobe_one_pair().

Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v3:
 - new patch since v3
---
 arch/riscv/kernel/sys_hwprobe.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index caf6762427c8..d2bb70fed8b9 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -295,6 +295,8 @@ static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			     const struct cpumask *cpus)
 {
+	pair->value = 0;
+
 	switch (pair->key) {
 	case RISCV_HWPROBE_KEY_MVENDORID:
 	case RISCV_HWPROBE_KEY_MARCHID:
@@ -329,17 +331,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
-		pair->value = 0;
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
 			pair->value = riscv_cboz_block_size;
 		break;
 	case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
-		pair->value = 0;
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
 			pair->value = riscv_cbom_block_size;
 		break;
 	case RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE:
-		pair->value = 0;
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOP))
 			pair->value = riscv_cbop_block_size;
 		break;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
