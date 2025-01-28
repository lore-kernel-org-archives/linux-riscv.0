Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57287C02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ts44Ey3pJ/Nm6GUOq44gG3x69glFknw/LqPd3J/DCQE=; b=E/JdKQclhucrBJ
	feyubcaVk2F/isLwW4HJ2cHAY/hWpzGpkDfnSS1HS9/icDq4zO503pTHNa+Fl0cBGMNglpD1MCVP5
	7mYYd8rAOaEThRJpIQS+rLe7en40nTzvruws+VeQ65Q4VblAU4T1no3Ws+sp+qDSURFqaDo/TCv/+
	Gxv1Jj0ig9MM8HvItwrwZoXK735ycFcVjT5Fs1Ry/GlQz6C2UbAYqLD1W6wqMYViscXHnKz67wq6q
	5/5il40xJPFzTe02vjKZRqJ2Dw1oja3vIfADG79fWGew6ygVu1D/Fb7eLwqeWe+HD2bZVeo4Ek0kx
	R8j4AgdpoTob/+b5915Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdtD-000000047e5-1DhQ;
	Tue, 28 Jan 2025 05:11:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhi-000000044Uo-3XBB
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:05 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso6975173a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040402; x=1738645202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ysqLj76yIXMmN0DuXp9ro2na+awhMKH5VmavOAjzvw=;
        b=VeyZSer4KuDZu8cM6gR/zPRyN6BQ2Ki8XjG9o5Tq2zOw1TBiO2UKZOo4tqnnooie4p
         zRropFMUP+eCjG6x3ZLIu+d9zZiQmpOoPdBDFU/Fi+JWyAkzLPD6lSB+kvymKWhYdDfe
         I0wPpEd7L3xI4eTTxpQfuFa7+anyUJ0PGWrGvvxkUa1aAP3+SwuKKq5W4y+WMiONcPjD
         YUVIVUKJtG5yZsGvZo/9iWwaEGYqjZkPVhr5zh7KtNBTHJxHZDGoBD+1hUUDwC0Sm7+V
         G1E2WpTuKjqVMYyGvmC+WpA5oJ7BYpGok3lqHDY7AulG/WfEDFC1grnRO2Bw3uaFVLXD
         oTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040402; x=1738645202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ysqLj76yIXMmN0DuXp9ro2na+awhMKH5VmavOAjzvw=;
        b=bnJ3dbkWKFqpAX3gvVHhssr0mp3UicTps1Y5JKJylz2v6lAHcuOsYHusRpuMRt2A5h
         bUGk957yCAC8WmpEwxwYm5+JBVyxvoQ+KzgBw5QScrCrjYhp/5O4OvaO7KcXFcivRgAe
         JW6TwJ9SyQLeBL2buvSE5kiI83la81k25fpuYOc08BV4cPT3i8QQGZj/vwbr/98cQKUm
         ZE0KPX+a/kEtQQ2vyDKCD+WjVI0ADv5xxEfiGCJhHy9wWrzC9s9TYzYaDjnPOwyaQITI
         9T5dELWAsXeQ7JAEEuGMU96/n+iaGQlwtLVDaPKkMLkXX/fBw41orI/531ksrgePCMyh
         uaUg==
X-Gm-Message-State: AOJu0Yy/ICWn/oA9NzUuIQ6Ulx3tnL5QOxc+8mpIq+yfv1Su2+79YPYu
	ub6sQcDwb2reSNTeshuQNG9RS3KMPN2hHwErGggrLLLGyJ+jfx/F4luhMcbJ47g=
X-Gm-Gg: ASbGnctJL6o6dXYW9PYf6hpRhqOVBVlJMEhCCZzY05isD2GqvqBkzctieC7x0QQbmB0
	Tm4kLy6xGQRxhlwooTac3sSH2lrxSm4WvRXcleXmfJADVUuH6jvrhDlj7pZR24YGUOCM3PR+cjx
	rjQ42x76/YOcLKl5XWADfOEP/kzPHlEm8iMh8vjH2qZ1sry3FyfojZxwwUUnoYLQaiRlgqOKE+M
	abz33kF4OuY0XX62/5j4L3TF+WfeXlkd1IrQmBGjI51vaxDZ9sMsE5+ncwSxuJM92IJze4JyyDO
	5xFDr0pWG/ksDu15xDTilK0TGN62
X-Google-Smtp-Source: AGHT+IFdfSM4LoL408uYEIffufa8tyqHYMXtXIXqsBrutmD1adLWVCNfMy18lpD4qkSPUrqnOkGRNw==
X-Received: by 2002:a17:90b:270d:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2f782ca5d86mr58401904a91.21.1738040402292;
        Mon, 27 Jan 2025 21:00:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:49 -0800
Subject: [PATCH v3 08/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-8-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210002_912537_3B2A18A2 
X-CRM114-Status: GOOD (  11.17  )
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

Add description for the Smcdeleg/Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f47d829545db..1706a77729db 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcdeleg
+          description: |
+            The standard Smcdeleg supervisor-level extension for the machine mode
+            to delegate the hpmcounters to supvervisor mode so that they are
+            directlyi accessible in the supervisor mode as ratified in the
+            20240213 version of the privileged ISA specification. This extension
+            depends on Sscsrind, Zihpm, Zicntr extensions.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -169,6 +177,14 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccfg
+          description: |
+            The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode as ratified in the 20240213 version of the privileged ISA
+            specification. This extension depends on Sscsrind, Smcdeleg, Zihpm,
+            Zicntr extensions.
+
         - const: sscofpmf
           description: |
             The standard Sscofpmf supervisor-level extension for count overflow

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
