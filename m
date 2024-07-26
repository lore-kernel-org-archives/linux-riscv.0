Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D2FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQEtx5C3holwquz4DBunG35+AS40fA8Rq7yrnJwTq7g=; b=YT7gYGP2v8SvEV
	guPj3jqBo9N9ftSlht10UCckg3oH8PnhC/simwZanSr1wmk16NZ8LnYSEK3kYDROFNZDTRHmr0/Lo
	Wvd8Hgyr1ve0uMYKeqJaRMQfon5pdR00FPXdiwgXHLrf9eLfuVTCq5DfezFP+FwH9nCp6aHQ/lmXh
	UtY9DEb+MQxKmB0au9b9n+PHlbBGyXNpZU0IO59Nqj2zfgzKp0ws9RDOEzZcOCL3JheuE6pEgYlJD
	JAbnRfhfVjVFhf3ODp9oiKxlGMvQWXQ/sT8PPnCzRyMAbT7o6Vg2W6CutH6HvLP0x7Lsae90cvwfj
	oIiH7UHtrDuIgNgJ923g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGeA-00000003N1k-1kX9;
	Fri, 26 Jul 2024 08:49:54 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGe7-00000003MzN-2E3n
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:49:53 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5d4fb707895so470001eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721983790; x=1722588590; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77ZeIPjPX018h5j/Du3ed2s3nc75ljoul3aJ99owNM0=;
        b=ILG0hEjMTacgqIsMv+gh7Ri9lqw2jyfLfI6guGxSF6c7N4otJCI+bEvW4t53yy/mHm
         J69cbTXoupbRwsGGuXfNE8rOsna3UCkFqsxXK5zAonC5egJrX0YbyB9JB7iwQv3J/KH6
         cTCV60dEMJ33rwh9fdtJGFJFzo9leTFNL+65bbA6bIXS324y2tk4csr9KoEyEbKD3rqR
         uE5GTsDt6vQgwAcAkB0pL0XS6u3oLXMxc1fcVVL+mgw4Yp34nfC6y5T6LWB9ioajopLp
         bCvIv2i6px/uG8sw6kI0TfNAqdyAh2rVP4rNB6zVCFASYsdQvval4sQ3xW6k/WQmoLm4
         cCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983790; x=1722588590;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77ZeIPjPX018h5j/Du3ed2s3nc75ljoul3aJ99owNM0=;
        b=L1Q6wLMHDAL5eJjuQ8n5XNB/8j7UPQ57KxSYANHr47jrlscjX36oOOi7gRswoxB5xd
         oxW+IBjUtBF8EIAd3DQ7SLJfJS7AZqsjr4YV2zqmDGYiHy4LJpfimsqF5LDeE7w3DrdE
         gi7E2xpn73Hano6BKKFJGCh7VAHo+Q1N8kC59MnU//COrAggjcsdy3BFD935NdPLzrgB
         V2i7uWG3g0ZFyu9UuWhiG8vloi/zSazSQJlRVCthsd3HqY4498EmUCla5j9zgDiwj1vG
         mGw0P2np8hUXCh3QHgzTbOzfMRo4nwqNwbzlzR49zwV+Ycg7Qhyk5I+3QxCdwTE62Qmy
         Zzjw==
X-Forwarded-Encrypted: i=1; AJvYcCWGzz63llbkJogDykr8pecRK9bKhBqufr3Sq2wJC+ZURBJoymLeXqooQklCEPA6W+36rRmcQkDaM6K++k4hnt5/wWWJU6k4xgPQU7xNLpDD
X-Gm-Message-State: AOJu0YxPUL2OHWbqgriBMCPkhw6HePOeZmxpUfLy1eXJkiG8jwHxrfWM
	lhY8vAbCJp58k5337Hr1flJ//jYwrdMkKJo8A+vOKNIagfN4P9YxcZTj2rz+QsA=
X-Google-Smtp-Source: AGHT+IFWUVeizwcBPBvvU0CwwN+HhSdGaM3PUv2PgwHw7ovlutORf8Wnz0oqxg0bCN2ABKZmavFvLQ==
X-Received: by 2002:a05:6358:784:b0:1a4:8048:56df with SMTP id e5c5f4694b2df-1acf88fa089mr701897855d.22.1721983790331;
        Fri, 26 Jul 2024 01:49:50 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f816db18sm2049645a12.33.2024.07.26.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:49:50 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 2/5] dt-bindings: riscv: Add Svade and Svadu Entries
Date: Fri, 26 Jul 2024 16:49:27 +0800
Message-Id: <20240726084931.28924-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_014951_660868_2D2939C0 
X-CRM114-Status: GOOD (  10.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
property.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..b3885756766d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -153,6 +153,34 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: svade
+          description: |
+            The standard Svade supervisor-level extension for SW-managed PTE A/D
+            bit updates as ratified in the 20240213 version of the privileged
+            ISA specification.
+
+            Both Svade and Svadu extensions control the hardware behavior when
+            the PTE A/D bits need to be set. The default behavior for the four
+            possible combinations of these extensions in the device tree are:
+            1) Neither Svade nor Svadu present in DT => It is technically
+               unknown whether the platform uses Svade or Svadu. Supervisor
+               software should be prepared to handle either hardware updating
+               of the PTE A/D bits or page faults when they need updated.
+            2) Only Svade present in DT => Supervisor must assume Svade to be
+               always enabled.
+            3) Only Svadu present in DT => Supervisor must assume Svadu to be
+               always enabled.
+            4) Both Svade and Svadu present in DT => Supervisor must assume
+               Svadu turned-off at boot time. To use Svadu, supervisor must
+               explicitly enable it using the SBI FWFT extension.
+
+        - const: svadu
+          description: |
+            The standard Svadu supervisor-level extension for hardware updating
+            of PTE A/D bits as ratified in the 20240528 version of the
+            privileged ISA specification. Please refer to Svade dt-binding
+            description for more details.
+
         - const: svinval
           description:
             The standard Svinval supervisor-level extension for fine-grained
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
