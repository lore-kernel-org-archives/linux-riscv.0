Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E242CD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 09:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iOV9z05lnAABqj2+A/pElVe0GS8qFu17JqQ92u1TcU=; b=ZBaBeJHTARb8Wm
	ZQ6IJqGBkMXNvjy362c1oPd2kvMta4+K4nsXX+YySYdCCZ5hHFPvUJCBPHLO1gWoOUhZOdK5NcYwA
	Jg3BDZTdVGQNjnKvjxDx4uNCRocd63Y+tLh+7YOTCtBqJwkQ3U+gAQOTLf8fR47aj+/p9GY4vO7w4
	ot4eg+Vev8xE3C5vnHrFh1Ly17IOQEp5jg658+aoKILG4GrNLxHCUk+w06Dq1xYQ3uRc+0NbrjVch
	M+ObCmRD3QwbnkpVk2g/gUsulZMVZwUzvtvSRSOonSO8jh5+AXzN/587RbX/d73hMX6isDDjU6Ypq
	w9rEx7njWapHZ+GunfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wd-0000000HUO7-2nhQ;
	Fri, 29 Mar 2024 09:27:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8WY-0000000HUJo-2ygg
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:27:48 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-29f1686ff12so1380841a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704464; x=1712309264; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36s8w1btdvP+IRdBHf7/8nd9U/EcEkIO6Yh0YtSkXJI=;
        b=X4C8a/ydQTEpJNADRn5tYSXA/cmFyx5SgGL6JecAC9PIzlQcFY2nBSjGNakGKeGuhu
         7aJeACTf6rnH+vGPomRlle2wR5eStwK1cT49MDoKG6+BPSMELbMSDwvncODHdFh+Pqub
         Dnjfs3SwBe9JDCbfG1Hika2GRnxlTYBfHv1IFgwVMg/CBGnzykbdYM7wbXf15WB6T4S+
         b3K1rpO2T8lJUNr31MiZSC8SVnFovrN0CcpqPbD6SN9zzSgxpkKeWvkOrv8wwkkgkdaE
         iAfGTTNKQ1my0at4optcO2nhhS06d8CJbbcMqd0YMV95iPUVo9aljK/NDDCqiSPr6FH+
         52wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704464; x=1712309264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36s8w1btdvP+IRdBHf7/8nd9U/EcEkIO6Yh0YtSkXJI=;
        b=SY9rIqnIBT2ohAOVePtrdqtli9d4Ax2qS/3ZH+9B0hYoNO0Wjd40m2yyWKBh9qZjQ6
         5fCCp0wOnKuj6gYrxN/3bEufBoUq2pSHaWJWmGnNnkHIgcgiafM+z+njIY5Ctom0efVj
         zyZBCAoojWqABlrDeU8Zhf223zJlax+KjF5B0UPv4t15ocRHeMcz0zToi+rT/8DypQER
         4n2Uzl/miilgk0AUtZ/o0nQInLrPFdy/uCwx27p/bNoE20ho51stTEMC0E8b9c25/WNS
         CLCUJQTphEyS6q0DXPXxaNjWiQ23y5nkp4B/Rsz+foOrDXBrI9j7VqFBqoOmuxHiWrbP
         SC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKdqHupTwxOtl3igencfkZi2K5pPEom22QDHv9ShBmWqXcCSKoqIlyFzSi2hu3ppWiZy7sxtRMXoIOc1KeRWRo/z1bODvIrTZSp9A0PI2i
X-Gm-Message-State: AOJu0Yw3t4JHLhZYhN2w4jWiFsqYF6uUbW5S9zxA8g2zdWOYc9Dj2wbj
	gb94bn16+U5O5GuN0hbYySjrRAXyS/f9uBLne8ll3xyG9NGAm4AYZSjGDfXhaulEZWZ4DCneW09
	rFnxLrR8hX5QP2pywhEQ9NNWh1+CvmEUOUiEqreePWQNrhXlazkNVCQ8pEYUeaD776qxM1IzE+j
	xKjSA/vd4Ru9w75zCD+2YqKqIFNhaw9zkuLzDgwiWE1sCTIlBZFQ==
X-Google-Smtp-Source: AGHT+IFlwBZNBeq8Vspi+hcWxSywtk3eGAD9nkXigHO0/VIsXQXySmGGcQSPVllJIcGqIgMzGVu2Kw==
X-Received: by 2002:a17:90a:6986:b0:2a2:1012:fbbf with SMTP id s6-20020a17090a698600b002a21012fbbfmr1808164pjj.14.1711704464008;
        Fri, 29 Mar 2024 02:27:44 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:27:43 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:17 +0800
Subject: [PATCH RFC 01/11] dt-bindings: riscv: Add Sdtrig ISA extension
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-1-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022746_888584_79149BFD 
X-CRM114-Status: UNSURE (   7.62  )
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

As riscv-debug-spec [1] Chapter 5 introduce Sdtrig extension.

Add an entry for the Sdtrig extension to the riscv,isa-extensions property.

Link: https://github.com/riscv/riscv-debug-spec/releases/download/ar20231208/riscv-debug-stable.pdf [1]
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..47d82cd35ca7 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -121,6 +121,13 @@ properties:
             version of the privileged ISA specification.
 
         # multi-letter extensions, sorted alphanumerically
+        - const: sdtrig
+          description: |
+            The standard Sdtrig extension for introduce trigger CSRs for
+            cause a breakpoint exception, entry into Debug Mode,
+            or trace action as frozen at commit 359bedc ("Freeze Candidate")
+            of riscv-debug-spec
+
         - const: smaia
           description: |
             The standard Smaia supervisor-level extension for the advanced

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
