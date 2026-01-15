Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDDBD3CC8C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 00:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jmy8B9HFHigX41JJpKAkW/XKU+zEEr6e0zDUXm/shI0=; b=DVg8ysY1EYUSno
	JqlEbOe1IqT9bcxha3BitlghvykO/NISJhdmU5w3KS289M9MXyV+HEp6ZMO/6tcFfELs/eILElIqm
	sic3tsV0khRKB6U52E1eM+ZtP4tO7vg9PlSHZ5kFhiYBPZCJtbMwY4cv5lhWqUk9RxbSfHepSHDUM
	aTMWCy+CTu34ntbCmEX5uZIqyIv6Pa//h1IP0ZpdMz0NscfRpHzykeqHzr+/ybdzFWdVe+oDmNgZ4
	VEeo+Um8MkHBzEMsOi1gss5bqb9m0Kz4v92wxoIkskei+AQQyQl6uANI0plQHxgCWZ8eCsJOd4fut
	J2JIQ+hVluApmyNCtaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBDs-0000000BE51-3TNJ;
	Thu, 15 Jan 2026 00:28:24 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBDp-0000000BE4M-2o2Z
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 00:28:23 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12336c0a8b6so697353c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 16:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768436900; x=1769041700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URN8+ZC1AFNXe0LdXxPcdTT+rD36xODGehUphyn7S/0=;
        b=BYF959r48x8bBRnod5fr3D8ovEVnOmQHLE7cVl4LP5bN3NNrEq5LcoQAO945zQimcW
         sxz5mlIb0J/TQoRxQ1ffEylD5xWuBsaXtjJWKn0j0q/Yc7tzI+xHicmAPXFbidEb+a2/
         DXXwMH2/WaXsXC0SV7cyv1sXFsQPx4XZ909N+GebPSw/dlXPtVyyytKBqCHVj9YQzuCY
         D4AGMw5W7YzjkioVaYKxlaxi4f9Z2BcH7i9pCPliO0evSJ14brw6ctiikPmkEeMBmVFy
         qiWb95eP/DCZr1Cd3kLBHAkwSdFdlSfXSk7yD//emWhAGV6tEFej6lzY2Vl8/iqwWepr
         PpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768436900; x=1769041700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URN8+ZC1AFNXe0LdXxPcdTT+rD36xODGehUphyn7S/0=;
        b=jZAK4yXdqCLtBcvmHojivGDZy9ghBDAXjwaQIk83mjiu8XRVsowAwBESAGVXn91Kvf
         NifYV0QhaQlbNolkXmQklmVAIUBIDwOiRll8yGHL9I/l6gi3dl6Czeg4BrGso1jorz4Q
         P7Fx+lI7bzgZwXhjKo54Mp3YW1B3gTTR3SOztGNy5a6+Q9PuNRad1ks1T8/vAkSmS3r0
         lGVhaTURs1sIAzp3i1OcwqsZmXk8tVKtmBOgXd1YzbM7I/MWLT4ZF9h55zVYDKSjvqmm
         SoFTdxgBYMBgjKOh1g0iNr02zAuWj9isxoyYkpRnp5VSDs8o1BaJUy2CxBZwlR1MYEM4
         BEWA==
X-Forwarded-Encrypted: i=1; AJvYcCVNFDAr0mYrivYVeSa47ZIY2pzBkTT25JgbnMNUL42EDLI/E+hGgxpp0cPJHVhuavjVWrgN7PHbHmWw3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqovOJTcu9dUynFVS4jQEWbLdyekDuaMOCQVXgx2u9DQcMLLVu
	fCMAc3MTA/0zmivxSuGGvmZVM1DiyZMaTXFSmNcHBotFeMwS33eo3Z3p
X-Gm-Gg: AY/fxX5CAB6s3zNeA0aWApTCW1DTz6xb9KOGe54FxuquDNR2SPAVl0JSuSrlebfXQzp
	kcdJcXzHf7LkNxri/y+n54qdP97blKj1cq9ppQ5O8vvWQNeVb6F8xQo/faAs+xygFu9bOGUyeH4
	CGHSmmcer+8NqPUoCbDxBnXs0s9hKF/ZFlh01IqXbqqGQA6OLrzRV/l2e+IX2z3+5oHVKanyyF6
	oIZIyiV14mp1UmMRhahMB9NpQhiCWTyjXVsM8kYy9d4hKwuv0jEhT1keqNbbUVpFfZp0TChnUMO
	6b6L4QT73WhfKFDrVRrm5+wMCJM+NJ65V6C2b/g6y+OkaQho7iYtW4hlLpOq1RAm0IzeRqLT1JO
	3Fi8PrLlP24+N4W8+hs2OuZbW62gMlXtiCIkwb8akmqLMXqLpwJa3LRie+TiDh9+KdpcLH7yh1F
	Az58XMmjvANw==
X-Received: by 2002:a05:701b:2504:b0:11b:ca88:c503 with SMTP id a92af1059eb24-12336a33f69mr4080770c88.3.1768436900049;
        Wed, 14 Jan 2026 16:28:20 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm32527342c88.11.2026.01.14.16.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:28:19 -0800 (PST)
Date: Thu, 15 Jan 2026 08:28:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
Message-ID: <aWg0XmwwBRZzOZ5U@inochi.infowork>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
 <20260115-adding-b-dtsi-v2-3-254dd61cf947@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-adding-b-dtsi-v2-3-254dd61cf947@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_162821_769976_C5082881 
X-CRM114-Status: GOOD (  17.55  )
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

On Thu, Jan 15, 2026 at 07:18:59AM +0800, Guodong Xu wrote:
> "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> checking rule is now enforced, which requires that when zba, zbb, and zbs
> are all specified, "b" must be added as well. Failing to do this will
> cause dtbs_check schema check warnings.
> 
> According to uabi.rst, as a single-letter extension, "b" should be added
> after "c" in canonical order.
> 
> Update sg2044-cpus.dtsi to conform to this rule.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch, a split from the Patch 2 in v1. This patch is for
>     Sophgo sg2044.
> ---
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
>  1 file changed, 128 insertions(+), 128 deletions(-)
> 


LGTM, I will queue this patch for the next rc.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>


> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> index 523799a1a8b8..3135409c2149 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -24,10 +24,10 @@ cpu0: cpu@0 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -60,10 +60,10 @@ cpu1: cpu@1 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -96,10 +96,10 @@ cpu2: cpu@2 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -132,10 +132,10 @@ cpu3: cpu@3 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -168,10 +168,10 @@ cpu4: cpu@4 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -204,10 +204,10 @@ cpu5: cpu@5 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -240,10 +240,10 @@ cpu6: cpu@6 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -276,10 +276,10 @@ cpu7: cpu@7 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -312,10 +312,10 @@ cpu8: cpu@8 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -348,10 +348,10 @@ cpu9: cpu@9 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -384,10 +384,10 @@ cpu10: cpu@10 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -420,10 +420,10 @@ cpu11: cpu@11 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -456,10 +456,10 @@ cpu12: cpu@12 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -492,10 +492,10 @@ cpu13: cpu@13 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -528,10 +528,10 @@ cpu14: cpu@14 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -564,10 +564,10 @@ cpu15: cpu@15 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -600,10 +600,10 @@ cpu16: cpu@16 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -636,10 +636,10 @@ cpu17: cpu@17 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -672,10 +672,10 @@ cpu18: cpu@18 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -708,10 +708,10 @@ cpu19: cpu@19 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -744,10 +744,10 @@ cpu20: cpu@20 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -780,10 +780,10 @@ cpu21: cpu@21 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -816,10 +816,10 @@ cpu22: cpu@22 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -852,10 +852,10 @@ cpu23: cpu@23 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -888,10 +888,10 @@ cpu24: cpu@24 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -924,10 +924,10 @@ cpu25: cpu@25 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -960,10 +960,10 @@ cpu26: cpu@26 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -996,10 +996,10 @@ cpu27: cpu@27 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1032,10 +1032,10 @@ cpu28: cpu@28 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1068,10 +1068,10 @@ cpu29: cpu@29 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1104,10 +1104,10 @@ cpu30: cpu@30 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1140,10 +1140,10 @@ cpu31: cpu@31 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1176,10 +1176,10 @@ cpu32: cpu@32 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1212,10 +1212,10 @@ cpu33: cpu@33 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1248,10 +1248,10 @@ cpu34: cpu@34 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1284,10 +1284,10 @@ cpu35: cpu@35 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1320,10 +1320,10 @@ cpu36: cpu@36 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1356,10 +1356,10 @@ cpu37: cpu@37 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1392,10 +1392,10 @@ cpu38: cpu@38 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1428,10 +1428,10 @@ cpu39: cpu@39 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1464,10 +1464,10 @@ cpu40: cpu@40 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1500,10 +1500,10 @@ cpu41: cpu@41 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1536,10 +1536,10 @@ cpu42: cpu@42 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1572,10 +1572,10 @@ cpu43: cpu@43 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1608,10 +1608,10 @@ cpu44: cpu@44 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1644,10 +1644,10 @@ cpu45: cpu@45 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1680,10 +1680,10 @@ cpu46: cpu@46 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1716,10 +1716,10 @@ cpu47: cpu@47 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1752,10 +1752,10 @@ cpu48: cpu@48 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1788,10 +1788,10 @@ cpu49: cpu@49 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1824,10 +1824,10 @@ cpu50: cpu@50 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1860,10 +1860,10 @@ cpu51: cpu@51 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1896,10 +1896,10 @@ cpu52: cpu@52 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1932,10 +1932,10 @@ cpu53: cpu@53 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1968,10 +1968,10 @@ cpu54: cpu@54 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2004,10 +2004,10 @@ cpu55: cpu@55 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2040,10 +2040,10 @@ cpu56: cpu@56 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2076,10 +2076,10 @@ cpu57: cpu@57 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2112,10 +2112,10 @@ cpu58: cpu@58 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2148,10 +2148,10 @@ cpu59: cpu@59 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2184,10 +2184,10 @@ cpu60: cpu@60 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2220,10 +2220,10 @@ cpu61: cpu@61 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2256,10 +2256,10 @@ cpu62: cpu@62 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2292,10 +2292,10 @@ cpu63: cpu@63 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> 
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
