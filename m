Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F8C3ABAA
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 03:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHLPS7m27vPLcI6KYHGaA24HRPLZ8pQMuZuoakKDiVk=; b=GYKCK6FyfTOGHB
	WwhwVn7OjL1cxkGMNy0c4QFDvFori+oRQO77CoMXcn/gcPXGbCQd5WEAufSjg+Vd2jWfuEiEQctBn
	oo4JSxxxjz98zUFfebRnIVlNtXceccPhxB/xExgKlURxLl//9I65A1Sqn9qMrC09HReGwT1EFNJvL
	8TpCY3hVpD9p/gk4jralec66xWsWt5+H0FU0YwmqLV0ej99Fe2/p093AQDe671vfnfE9ZyY7yipP5
	ztYZCzgzzCgs9UVUedlhj7YVOt2hZnVQFHim7VVaNwd3FLJjB0uLSVFe8aEQzNwVNaosOSSfVoEzg
	NEjNqZ3E0KNRrCqJO1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xvp-0000000BZZX-293f;
	Wed, 30 Apr 2025 03:16:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wu0-0000000BUus-2gvy
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 02:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OESwfI0upP7wQb7BEkzIfrVPZL2ZfmY8EtLpKrTgHwQ=; b=QPD5dPm1ZRvLDABFetb0s3xuYX
	+iOYftl6Hv7WMJE63A3YEaRKcggBTVr8KdGgYTssl0MSX7CjaBWzzWiNSm1B1I9Tw/lW+LDEvhL9S
	zwDh41qToFgTTTfChPvokL9fWl/x6SbqN+20H9FWf48BQhdRqITF9mYQqyicTizN7VDsfxz5otAKn
	jsb8jM3FbtsrPcvgbFlTbzU2kAIUZMVojbSUXZhvUoXTLb8LkmGeX5QYi7ESJ76eDqwgn3MDr0qEj
	HJgF1SdZhZ7VA4LVhnT+4yGJyqbWuQB4aCvHowmtNrLiEAufLAxRSxgRyo4C06m0QTYrz8AYPxi9v
	Gwo0a5gQ==;
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9wtg-0000000DdbP-0R2f
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 02:10:23 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-476805acddaso84738881cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 19:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745979000; x=1746583800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OESwfI0upP7wQb7BEkzIfrVPZL2ZfmY8EtLpKrTgHwQ=;
        b=hWxzqCjS3Ow9+AAzvaOEWFddsDOTdQUgVuCqQMbJhK5lMrg32hMXY0FHwW+51Qy4Dn
         sSD4jH3o1AamhP8fNjvc9nGZNbZxMh7ET4qWsXXFaRlPJAYOQNaDZmdbVSXa0Ctf7P0q
         XrZEx71q50e3o6gDGkvckqCQY8Eyd5rR6ywdEmA9182dusYjoaNqv/U2N87tndtUTsf2
         BruGDOTKUi6O+VD2UZxxCH9xnL1LEBKP2U3t5OGhGoPK9iAKUSy5NQDOy78/HAYThex+
         6iB7SryarFrTjQY6LRBXs06hMxESwFdBJxI5Y4XRI5AqAYkf/qMfylv8zVZHYAMUQXQ4
         t2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745979000; x=1746583800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OESwfI0upP7wQb7BEkzIfrVPZL2ZfmY8EtLpKrTgHwQ=;
        b=h2JOywJG8yGq/C31r2bGkCPMNu2INXqIi64gvhvUONZqWu/0b0ZfuF5E1oA+jeukkz
         nyk3Y8P05mAlM0N7dJ+1ZIo0BUapO/60j91TdigEcsbmUa+ijFxv8q/uHOhz/et14EkN
         01p1kMxUWNLs3Gh9LYxWlK5stEptp3yB/n/J94ocZ7qbkdVhdDWe+orp0MG7xScEvslv
         I2MkkDUyIUkHIeaCp5ryhF5+F2ftjIAQOosr5nw+tbPymJNnRL2bkVQp1cOo6rGqU22n
         Ce/8yP7ZMom5iMWbLI4ztsZmqMqQzxlbvY6s+c9cJrDFtq3k0HdnTsRTDq8BAxP6it8i
         EL+w==
X-Forwarded-Encrypted: i=1; AJvYcCVtj+t1zCpGOfAxpjMH/6FDKYbp6CmCrPt/drLJZ8CQcNr+wC8ICny4V2aQncVQIyCUO+9XVHGECCGeTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/eB2hS2eI0pxhD/1He4ctdi3E9s04b7jAcLZpfiR9uwbmEpbh
	5/SODLneevRmalubDQkGLE+FT6EhAYeZH4M8vAMrw9XXNUm0ut2R
X-Gm-Gg: ASbGncth9m5Vh4hBPXq/h12Xef6wUwN9Zs1j7IoibcPzPUgm53xitKREKxak/f7qIDU
	mNS+fpvCnZhbZtrfHdV54VYhdWZNqdUEFYfayU4K6tQXt/C88wb6Tl10fT2w7oRWPn+WBM+VS9B
	8yw4wWNVxVz6c7tc46HM/pQaENQnMxqAHQ4shgGJ8+OZ+SmFfDNj/Wt8lDt5dj+V8Mm/bDbo/aV
	TFawL9Fsj7xXHZTx4rRI5NwXI3f6ac1CsGS9isKsWBghm65Oaaz+2X8IV+D2ZlA2Mrn1lWd+DyM
	udNMxTKvG9egD+JfZTk89lmBrVg=
X-Google-Smtp-Source: AGHT+IEw+u1VOIT3kMd+/VKXR6Vg7KtGCCSMCagVWCz8MZpIQ61san10JzgRKCphUO6By5kz9Ks2qQ==
X-Received: by 2002:a05:6214:2486:b0:6ed:1da2:afb9 with SMTP id 6a1803df08f44-6f4fcebf45bmr28113456d6.19.1745979000035;
        Tue, 29 Apr 2025 19:10:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe70a277sm2901756d6.55.2025.04.29.19.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
Date: Wed, 30 Apr 2025 10:09:31 +0800
Message-ID: <20250430020932.307198-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_031004_246937_1C04BD67 
X-CRM114-Status: GOOD (  10.70  )
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

replace newly added precise compatible with old one for existed
clock device of CV18XX series SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 88707cc13fb4..90de978f69c1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -29,7 +29,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1800-clk";
+			compatible = "sophgo,cv1800b-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 0974955e4e05..9a2a314d3347 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1810-clk";
+			compatible = "sophgo,cv1812h-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 6f09c9199102..b9e4b4687046 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,sg2000-clk";
+			compatible = "sophgo,sg2002-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
