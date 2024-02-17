Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0B6C48260
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptPFbJ8UxotF45qfgH5sHp75NPU427fz9g9N7kmBTWY=; b=2ZCeXa8sQ/Om2n
	P8svzXJSeZDU9f4xRSxCR+jbCnON5jr+/RSRRW5ekEUTCFx+X/GRwB6K+yymfSginM2VO+b/4l6a8
	TErMJeaFCgyfyFrV0oLjdq6BVcYiABIi4nD9jzAfVehAscbKdEl1FDNLR5H4GDdnKubbNRUP6bYYQ
	OlCx2qivY+dysLwG1uJB6OWVUjQ51rbYeqmcfozw0MPjIOVjWhZG9mIUUWZkh/Ye9dkndq+O37Spr
	38Po16oDdzubVD0GKjpdRfGOKKpAbnvniwGOfNdoPNT8LZKYbriYkF4m42lUkNfMyAErSf5c5rU1p
	O+jnJ/omQR0Gzvohy0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb93J-00000004J1h-2rDA;
	Sat, 17 Feb 2024 00:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92v-00000004Ifo-3zFp
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Feb 2024 00:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jA2bwMTLdR68IYWhAHQk0vem/FIvLYvJUSgd6oUDROA=; b=pN0FLsZcbffjKyC07Gc1/9kjR8
	+CmYWY8UDMlyKofQYqu1f7vzEH+EcTmPzbGCfSvoI7vS+pU+Xl+gN0a4GYVG8S4stnFBGa7Htzs+d
	/nr6cpaC1+eURgAM0Fyl5fBgGEAlGoOjRGmcg1cI2Nsfm+KhCMR73IZbsZqIlPBkwjC7cZ+2RnbfU
	IscsD8cdOcPHLN9dTfJPW4iCCmsrN7SkDhdCtrCBDWzu96sil8PGXi6CW+8eIznxaAsSO/TQuVD+M
	KCdq6kIOFWMaobGRjRXRDpI35oqXx4J+3wbA3BxX9BJ9ZFfPdSlsarAmoKTKzIcGOhJSxrbme7A8M
	3RNqn5Iw==;
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92R-000000007J0-2Cu9
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:04 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7bed9f5d35dso71079239f.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131520; x=1708736320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jA2bwMTLdR68IYWhAHQk0vem/FIvLYvJUSgd6oUDROA=;
        b=LfOLsA9ZndzAKGNXeAK065RAoQa6XREfts/chgglP8cfr+LRLTRuTCTrcPIL8iHIi8
         L7LrVbuuaJZrkUkuPC0C1/MBbA6UpPmSSBnc1iuiKUKZ/c1DfQgZaTy4Pnw+8s+R+mAT
         FubvaT2p1kh3jJD+zVNLvpT3WHc/XAzF/ioHYdREw9TurMB5K6h0kKv6BY4SPjlJ8fRo
         rNnVgjPmI2p4CbiNOfLXCuhFpwyw7mkG4Hx5s/1AkGihQkxRxqEpuzMN62BTNXY8oNWH
         duD6Ovp5OppshNY9+ov7+q2eQPft9dt1dGRm7O0k5FKPyILeGJmHYj7JrCJ0Y0ceyFCF
         NGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131520; x=1708736320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jA2bwMTLdR68IYWhAHQk0vem/FIvLYvJUSgd6oUDROA=;
        b=oAHnRtu6b+dNSjpSM2OJfN/x5fW0YpzySxqrxEIOJ9tD0PowxRq5CY/ZzKbD1+vpo4
         f/WulBglwgemZg+C7U3/5kkv407URR2Rf5tblC8rMqF88djvhvjDvtnqPZe4O046E6ov
         joG6kvFROhAn88iprJPdfPtqtQbL3N/EkvwfxTalwM8CC4avwQ7ekuZ85+3aX+DEkYhZ
         UOK5o6XT9O7yqjFTEZU3mSYvtz0FSWEhBuLlLYR8uehLSmRY+sgsdIhfEiVzpphqLfYZ
         mF5IkMn43eyzDuzIe5FFCdSLgXAT57irD2v3AUBAZYFNnq6bwpLuh1kT40kkSO99GOuy
         jkmg==
X-Forwarded-Encrypted: i=1; AJvYcCUEphqn3/h+lvFWQg5FxHnHik/MJLOBJM+LfECk6TxcU1WcOeFDrfyoUt3WzdRrQVQ67j9kgBDq8HDE8aYcjZ7sQ90u5KlMa+SN9Yf6oLgE
X-Gm-Message-State: AOJu0YxeYeRe8acPFPWGtkmcNF5SnY/tO9M4/Y6miBhUHX1c9Uy4nP/R
	82XtCjt8v+jgS+CbxPcT+MB8l+wywfs+Ne+T65dXjQd4qb+EqnGi2tW5N13Snk0=
X-Google-Smtp-Source: AGHT+IEdeqVqcC/VKKKrXOEHY/VeTvf9ltSju1U8A00Dr62R9FD2Xfm3+udDPMEcDgQNQ3u+AM/jrg==
X-Received: by 2002:a5e:c10c:0:b0:7c7:2e71:bb74 with SMTP id v12-20020a5ec10c000000b007c72e71bb74mr626708iol.4.1708131520123;
        Fri, 16 Feb 2024 16:58:40 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:39 -0800 (PST)
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
Subject: [PATCH RFC 10/20] dt-bindings: riscv: add Smcntrpmf ISA extension description
Date: Fri, 16 Feb 2024 16:57:28 -0800
Message-Id: <20240217005738.3744121-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_005846_247502_57C488F9 
X-CRM114-Status: GOOD (  10.32  )
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

Add the description for Smcntrpmf ISA extension

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 15adeb60441b..149ecf2a8af3 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -135,6 +135,13 @@ properties:
 	    directlyi accessible in the supervisor mode. This extension depend
 	    on Sscsrind, Zihpm, Zicntr extensions.
 
+	- const: smcntrpmf
+	  description: |
+	    The standard Smcntrpmf supervisor-level extension for the machine mode
+	    to enable privilege mode filtering for cycle and instret counters.
+	    The Ssccfg extension depends on this as *cfg CSRs are available only
+	    if smcntrpmf is present.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
