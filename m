Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BFECF58E5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vaIwSZHmV4SDdvIsNZipQhsIQdN7HbDvxhYQU4ihOY=; b=Nt1pR/sdpVsSb8
	3R+uf5+6qMtPCjsF1YGo7AmtUbVeUoHifNSPZzHJ94gNA8Zz2H/k0DsdwQx6ATPK6G42bOK41/nt1
	npuWN3WZ9iTrJBxyAInlW6HkMq/2KYCviT0LPUdILpxwXhgDdYjpZtO7mcX7uDVDWn08wAFiyEaUt
	BU6NhK/Yo/og12y4ctkA9s4c3pNDwODFWpp4wsZD08zXXjVYNISEA9liZVNnLVoQq+gZmrETjxCWw
	CjYPkeFWYINMbsefRiqIpjLEV0M0NA12I1YgBFcc6ZTFkLnR14x61Pjgp5PGKLq5DvGiA+tfqyVs/
	R6qbrf8l3mQ1uC8HTafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEt-0000000BdmY-344r;
	Fri, 20 Sep 2024 07:39:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEl-0000000BdeS-2i6n
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 07:39:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2053616fa36so22744665ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 00:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726817970; x=1727422770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56knnfie3gn40U1586qIcyfLVXwVK5l1OK1pmMi2fA0=;
        b=EyRplqE1BeHms8tgJGiGQEn1HLtDqvGNjKXcv79nvdkRsZk5oee7kDLBVWurq5fNyB
         s3UwFfYqmmnQ8uANq1xibmm+QTmA5AWRo/OO+s+A9aS5JG4rWtMOQ0JBigV5CvKss6UT
         2lYWk/GAJ1ggoKw8F6lCKW179KmLgIEbhXlm07H2mFnzk0NSr6stt0TChwXnjFM/EKHE
         2+7J73RhikLg7svJfzusnpQrC9gmL/Cktn2PJDQKStPU/g/pqkqV795UtcykatFmlxfN
         HPsfzxy+7acLPeUxVH4WiGV6e83FHE53zVqzRK+L4Wa1dKTKymJdmPzOXljuFM4x5rbp
         jkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726817970; x=1727422770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56knnfie3gn40U1586qIcyfLVXwVK5l1OK1pmMi2fA0=;
        b=hiXVNI+cXLaR4aF/a7Bhxs/SM+MjWxu3cNNAoP1CKO2Kjaoxwa+Ov4fu9/A2GABWqo
         BDN5HkAub02YBPwDG1xV1RI+/T0B8UjULeHT1hodCP92WJzdRrSIGYlUybISA5jHj6dl
         dKbandelujnZ/caF/6jN4xy71dTcy2nFA+dvI+/xhs5b/dHJ6wfZml03zkCZRtIl3gMO
         MSnO22evH/GOa6fXNeW5HPVjjmvbXoEVve86Rgo1YhN2sRd48AqFT1XwQbgGsMQ0MlB9
         /rxDRS/XZ4nuCCwSVIxOycOBL++q0FfiOzo/8tCKBrHnR0BuR2Yn96F/UbpJ3ztyOP7m
         b4gg==
X-Forwarded-Encrypted: i=1; AJvYcCVR+z82LW+QvwKjXHwHltGLNhb223KOI6JFP8G81h92PyarR37p9b+UkafYs4EH9VN/cjduCoIcVtCwQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5MciOsE0mzyMM4mxc3cwWwvx+2buo218fgo7bK1CoSfF14VHZ
	5HdpaxNTX1C9aCjqMRsOMdKernVEuDedX9RdSZH1Yx32FR3kpYPJliRHxUzRevU=
X-Google-Smtp-Source: AGHT+IFdJWu48cTXjfm7pmPi0SJjjpoM8oaSNh7cs+sv8ppa+Eh8rcIfQI/ARHDbsMfIMGKI31JoxA==
X-Received: by 2002:a17:903:8c8:b0:205:410c:f3b3 with SMTP id d9443c01a7336-208d8442483mr26756335ad.59.1726817970349;
        Fri, 20 Sep 2024 00:39:30 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946fcaa4sm89645805ad.212.2024.09.20.00.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:39:29 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Sep 2024 15:39:05 +0800
Subject: [PATCH RFC 3/3] riscv: KVM: Add Svukte extension support for
 Guest/VM
MIME-Version: 1.0
Message-Id: <20240920-dev-maxh-svukte-rebase-v1-3-7864a88a62bd@sifive.com>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=H2dmJr8hpjnnkdgnm3AAwF3pNuKwnFfGeFFtmmrBeZo=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm7SalRgR20+oKL/qOJCPUSe6TlQ9TxOvvbzCZ3
 /oFZ1j4YAyJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZu0mpQAKCRDSA/2dB3lA
 vWC7DAC6wEj/n9CbTmnWTmX1V13illBvFuFZRuglicYsApqy50khOjplX6PJZuGQ95zwOU7MgL0
 R3EiVMLLWH+svNhI0RKdAYZgkYaC+ebdN6rmtFUPZoTDzYN29PcsufuUTCYGVx6yhvRJ6tUsKz5
 XsfgxNU5bsp2/TrTrtpBr9ikId9PSeSaZjSvYX+XjxRKaRAUBl1ZEOjWlR6QKCMo0GO4KW5CSWx
 jptrxxQmq5XHZvg6nChHyWTNRYK6hDH2Kn6+AjKgyNIjnl/0QzAv4UalKsaHJk5wiwJWMQ3oCa4
 lQcTWE/+8v3Dtz9RlFFQHkuyEY06ph9ETUWB9+qstgSGitlZYBMi9uaOTRlXgoK9XF1yo0VmF7L
 p/gBoLYn0F29Vo7Zu2MiEfzlww2NgqTkTtIHEt5VgQZac5TIQq52VSoq/Bwz8S+4LBKeb1gOeR6
 bCoaMInYzf6Jur0ktZwEGciz7Mw/YS+SFW3LprnqtS5bHDVHzRYf9Tp9JY0o4dbSO3Yuw=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_003931_728971_B2779C20 
X-CRM114-Status: UNSURE (   8.87  )
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

Add KVM ISA extension ONE_REG interface to allow VMM tools to
detect and enable Svukte extension for Guest/VM.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e97db3296456e19f79ca02e4c4f70ae1b4abb48b..41b466b7ffaec421e8389d3f5b178580091a2c98 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -175,6 +175,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_ZCMOP,
 	KVM_RISCV_ISA_EXT_ZAWRS,
+	KVM_RISCV_ISA_EXT_SVUKTE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index b319c4c13c54ce22d2a7552f4c9f256a0c50780e..67237d6e53882a9fcd2cf265aa1704f25cc4a701 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -41,6 +41,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(SVUKTE),
 	KVM_ISA_EXT_ARR(ZACAS),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
