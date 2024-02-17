Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E766BC48260
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 02:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4ebKkXTlKi7eK4gsxSTxVRwHzdTidoro9j5cgJ9QAA=; b=ot9VuTA/OkdeuN
	PAt4o9LsdpP+jgqSSoHyEJdKkNRnrsgmVoLDTq/Hao2SfeX1NMWkeUehhQC7eFOS/RYWa+wLcQ4gf
	iZxRSCc3aME3HzoFMPVAmGXE5gSedgJmzoGHVXODRLtBv8kW6rbCuuE1oHRrZpNuuL1aml8IxNnPX
	K6lNcG+RyISZQrQqVT2s8t4dzG1Z/rDRn/DaAPvT/++140xEmmOyiviG4PEZuH3gmpCit0p7JjZc+
	r5ygSv4AGNV3lO1stJ+eqqABBc99/QrJ8Av/WHSBpFmRekQgPgJ2/Yc+bZllUNF0NTmE+0VRK3nKs
	yWJWUPB6L4pS8VFftmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbA3R-00000004S9b-2Y6H;
	Sat, 17 Feb 2024 02:03:49 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92K-00000004I8N-0hVW
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:41 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7c47f06863bso96713139f.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131515; x=1708736315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM1FhW7Qr3v0FtC5FiOLqFulLhlj/jL3zhy6p8GYU3U=;
        b=QnuxqFRnTaO7quft0T86pdal1XMc0Hju7hwM3XS/56Ydpc/wWJbki63TiGClUr8fGO
         7/qAOMSDITXzflGKZ9DaPSdyHi76A5pplEMrmOBSp/HbEuo/qABhIGaBwI16pDoYCvxt
         DzGXilzRQalj/zcWoE1EXIJ5nrm0WxafJT1/6t/PgX6KjjX5HHDgtbORiYGKaUfinwtp
         n7FSVrWVhXU7jqFI1HyKiCUyf55E22eAoejyIfpdyxshWj47/i2GMekbFvtwDKlLh+EP
         VCFo300smPZUcOeIFT4NWzXIReNfBy+dwEYejSaQAU80zNkVwKRqxwcILujFOnKRCw96
         ATag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131515; x=1708736315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zM1FhW7Qr3v0FtC5FiOLqFulLhlj/jL3zhy6p8GYU3U=;
        b=XBpR3j1rTUYzjuZ2dJ7fuuhDcVltH5BjsnD7gMpw7jfXFmkxP8xCsr3kVcSJVr68KF
         BSlZVnMwhlXdbUlcq8ZkFAwPhEe1Djz35bzPpbCbflB+K2kSfutrpomOCTQiNPWUHEcY
         DgAOzpNuOdTSj1Wz7KljO3KitOwxDjKn0pL2tlmhvg8FOeOtsoG4W/wfmS+MC1+G2Meg
         djm+VLReqr/bkpkns3xAuqh9sJUl4TphmqXupg7+1yoPc0h297LAZfO1q4p0GDYy5AVR
         n1C/tesnnPwj7VUCgy8PqVZerKZDpTvcia4sJ4Y9R+86kpPfpMLNB/0QDtCXjVMt/92I
         0P5A==
X-Forwarded-Encrypted: i=1; AJvYcCXClgWwzmV6W/LYO7L78WAWo26YL/PQiwrvdaMrh9fWjNaG0890yY8x6WiexnfK+RnOOwW42gDpowHh/W1wN5TQwHErNhSUf9h4/RODWT7c
X-Gm-Message-State: AOJu0YxETN89uNJaWDjO7/6Il+4V9XkbNf6L2tG96PaW1wJSfLfxCLqA
	dkj7QrkAjVpnwnlMtAuIAsrtEcGmCP4TzXV4AYL0jfTkH8Mro6iclq9ZpGcJ7QY=
X-Google-Smtp-Source: AGHT+IG/18cu0XQrzjjkqrWO02cvxzc2sKclTHZn6KgjzARvIp50etYjTOykyTJQBV988xbbQes5Kw==
X-Received: by 2002:a6b:7018:0:b0:7c4:2254:8e59 with SMTP id l24-20020a6b7018000000b007c422548e59mr6880303ioc.5.1708131514686;
        Fri, 16 Feb 2024 16:58:34 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:34 -0800 (PST)
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
Subject: [PATCH RFC 08/20] dt-bindings: riscv: add Ssccfg ISA extension description
Date: Fri, 16 Feb 2024 16:57:26 -0800
Message-Id: <20240217005738.3744121-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165836_617005_8AFD6811 
X-CRM114-Status: GOOD (  11.40  )
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

Add description for the Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 77a9f867e36b..15adeb60441b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,13 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+	- const: smcdeleg
+	  description: |
+	    The standard Smcdeleg supervisor-level extension for the machine mode
+	    to delegate the hpmcounters to supvervisor mode so that they are
+	    directlyi accessible in the supervisor mode. This extension depend
+	    on Sscsrind, Zihpm, Zicntr extensions.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -154,6 +161,12 @@ properties:
             interrupt architecture for supervisor-mode-visible csr and
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
+	- const: ssccfg
+	  description: |
+	    The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode. This extension depend on Sscsrind, Smcdeleg, Zihpm, Zicntr
+            extensions.
 
         - const: sscofpmf
           description: |
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
