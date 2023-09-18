Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AF6CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XH5pA+g+2PUur97MIb81x7ujwL3G7ARfL1l0BxlpqQ=; b=Vhf51X2Fiu2RND
	PBmMcA2fdrrIPsWEJSYYpoo4cQAYqcTTSWLlLmcmoYNB7ZdgX2lgdEH4lbRz+xlmzZggolryat+OO
	ACkzzYAixhQ3BnRNDRBYxWidlj4czaEDCv9Mrd9/7gVultMPlqs8YflvvxaZsU9wGtbrH5YiT/FhY
	A6+usoTGGOjwltDRh9dcXUfEyKdbOBGPXmCIplnHC490ItsLhha6Tepb3rh/GbN1AZmQS22RcreVz
	M3D0Y+m69I6SwRo/96BRNDayYKucKYxAlCpYX8cPH6dNMLh4GUuDU6wS5NHvl4Ex7q462g/+Ruyhy
	z07TUDfe2hPWsj6+IjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeM-00G2We-2C;
	Mon, 18 Sep 2023 18:07:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeK-00G2Tq-0f
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 18:07:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bf1935f6c2so34303935ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695060426; x=1695665226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i1eIcDaE0yWa5Js2PwK7z4plrujub6N9pwbwUycwvI=;
        b=F6UbqCjha3rjakwhjGqMp5GDCogVSGnXqzsa9U9e6hh70gSIGG5kK9T+v6llfZdp4f
         01agelCVOuuCHkkVV0YTawJX+3bMJK097EzthvqwfsnUQml5s99I2zp3Rg10nIKLIGJH
         gdPF1Ty/PVzvnDuFh40vx/KjmRX5D/tGJiLUHamwlXLbbw6AgXhItVzVvyA6ED1AFnLg
         Nfsk6DjbOVIZp634ftH1C5RxlS0fJJ3w17Ad0oypWCrIufksRD5NEV334Os6XNSwfQUX
         DM5HV/La47eVKQVJr8oZWqp3/VCGFPx4XJgQtobb1oKe9srqMDuNioUfovshtggtzt8a
         TLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695060426; x=1695665226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5i1eIcDaE0yWa5Js2PwK7z4plrujub6N9pwbwUycwvI=;
        b=pAd0nvLFEXSysaPkrVE96KI00BZrmdUY5K8LciaO3pfbmpppURs6ch4N7FpiE2Y9u9
         8kJ/gNxbYDnaS6H3Cl6z9JsMuGrA+i5Q28Y09lc/+/H8sYfZR5F36KWE9bWG8mwlI7+7
         IJNgcwI2hH+pcbv1L6bqgrsCL+CwF6hbjiYVnXKZmLv3xJE7YQ9V17CwKPQAcf7jsg/M
         7kVILm5tD97z3oemUETeaHC7F3kO0B5mvDKKsnFIw3rXxyN4NtgLCV9Fc1TsUQOSNO9s
         /lTTxaPOnEiKNbNk/M1aEsMGA3e5AHNZ1XJ4Ry6NqjW4H2wqz1cs0R5mmRivbduBpQiY
         YdBA==
X-Gm-Message-State: AOJu0Yx+m/gCaK64+pgspK3hB45owxq6VzkplOIJAegFfkr0Uo6hNGhD
	jy7diC72z6RsCLBGZ9UPzc3hGA==
X-Google-Smtp-Source: AGHT+IETi36u/uUFnqQ3ujRXaYRtNA+dM21DQd6+dA5XB+7tI1/bMH90xqm0GwYq/Oq3VArOSjGyvA==
X-Received: by 2002:a17:903:41cb:b0:1bd:d510:78fb with SMTP id u11-20020a17090341cb00b001bdd51078fbmr529431ple.3.1695060426120;
        Mon, 18 Sep 2023 11:07:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001aaf2e8b1eesm8556720plt.248.2023.09.18.11.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 11:07:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/4] RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing extensions
Date: Mon, 18 Sep 2023 23:36:44 +0530
Message-Id: <20230918180646.1398384-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918180646.1398384-1-apatel@ventanamicro.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_110708_241612_ADCBB367 
X-CRM114-Status: GOOD (  12.20  )
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

The riscv_vcpu_get_isa_ext_single() should fail with -ENOENT error
when corresponding ISA extension is not available on the host.

Fixes: e98b1085be79 ("RISC-V: KVM: Factor-out ONE_REG related code to its own source file")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e7e833ced91b..b7e0e03c69b1 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -460,8 +460,11 @@ static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -ENOENT;
 
-	*reg_val = 0;
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
+	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
+		return -ENOENT;
+
+	*reg_val = 0;
 	if (__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext))
 		*reg_val = 1; /* Mark the given extension as available */
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
