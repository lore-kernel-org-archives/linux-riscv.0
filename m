Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEA6CD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSCNrGf5ii0r+l1Xn1SInVEhm17TYHsR5k5avlyXcRE=; b=Gz2q9YwqcZJwMg
	np4Wm2FIhWKgPB2JqTFcnlkGhRg2UMSrbW2tkonjJzvRXKEIekXRwwc3Ii1DTaWqqepfGnc1o1YW+
	mTydEElR2pRtT1CcziL5zpeSY6967CaIvH4j6+8QLn8IhNfuflPHU00C/Ryug0mfuYaOcbdJNFnPb
	INEJv4h2W9DHIMSphDcGjk9qE7JOd3gTknlljnFvXwQOoz4V5i2KONc6BJAUtsHXXEqsF6yXJ8tW1
	HVikEJ1GDl/qeToJIVb8T30nd9Ywt98Jcm+9z8PjWCn0eaiDEEbBYwjGviAjjjYiQyaO4+N2Ma/lu
	9+aADFwGooDnKIPACUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wo-0000000HUWm-1eeB;
	Fri, 29 Mar 2024 09:28:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wj-0000000HURi-0BEZ
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 09:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9zZjndsCXBnAhUzEP7RXDQ1mWPnsHyYv9gf2B2OXJhU=; b=ogJWgfBe2F4i6P2F9sJRNPXtTS
	YUqziwAgvEG8tUpECvLaeTvGAFkGP/GvTNvMRVm57hHHmkHisOy/eQViGBEdmCG3gvz0iut4dyHhM
	8NMbRGOrmA/HaQmyAPWh31Hu3dLc3r5B5k3bxZeegngTAUhGnJIv5YJ5YONqL+BEBaNj0Cg8By+nC
	dOgtpvyRqigI7pjEiT9ulIYfaCaJ5PKX3zSGPcfpTeieF8MicaxGSVXr/Q6cHLKcNnvTLMpXBhpNk
	8Hvhv9Ojl66+pE1zfiKiraJc7XPDr1I8Dplo7ntwGIvbKGl+KIyCrgnptDx7E0gVpNyfIoy4YPIPQ
	1vDuZ37A==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wf-00000001Ttg-2Sbt
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:27:55 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so1042847a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704471; x=1712309271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zZjndsCXBnAhUzEP7RXDQ1mWPnsHyYv9gf2B2OXJhU=;
        b=Dq/w/qh1XPjQyGFbKEpKo+Iou4HxCRSPZd7UATgdzLvIDgE+dj2Tzwu6q/d+Zt4zbC
         b8XqLvlmNVUVgn8PurDLb26n3FQ9LTDbENLMNqUOodK69hdSazcMOdihnz+ikKj7zKQJ
         6TzeT7q2LQ/xHnlvrnx3XugLEtjfwYEkAq/onNCJ8Zk4jsMQLCJPtJwptIg3RM66fQTS
         vK7bq5KtU0mb4CTpNXSRRKT4ev/IFYp+26iGTWHVysvgGbCJo8WM2gay3rRqebrmu7Ry
         SpNqyoJD8sQXsbhGOy4MrwNkTOAoxzmfxMF3hd01a0PZSN2wZGsqsIRjSvLyyIVP1Wm8
         eaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704471; x=1712309271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zZjndsCXBnAhUzEP7RXDQ1mWPnsHyYv9gf2B2OXJhU=;
        b=h7WVPwCFU5Zqt2O7jh7rjaP+uNR6yQZqaCFM/G6wR+sDI9n7uzRb8+rBRLdElPn5kQ
         UaSlOoiibOwgY2Qw+3YBZyye563BqEwtTcxJDj3H+NQf4ZC531mOxXvqVJ9Nhm7eHVIb
         fW/0K7Mz9ZfpKyowlu7ESq4lw9bz0MrFTpvqTfgP7PtDhajBJgE35KwwT4LrNsp+7TAj
         yFlB7hGJRO9uHXd6Pv+BVZKQSjB+CHauVwrWwutl3SWlx2x7aFhx5jEwFWQPQ3I5UNUQ
         7+7UyzW4AkKt/KFrTaqJlGN8NjUM4sZqrapHcX+N/r5QZ/CO79QfONwQs/35G0GryAIm
         /5zA==
X-Forwarded-Encrypted: i=1; AJvYcCWXclFLCY5mt9NL5RrNPXVCpOKWrVeh0SA/K6vHiLo8W61T07OHMpM2e2LiHx84JgSg2/dI0Iwui6W3zK9u/XaakH5ib0/5+hRO9MSKD4Dc
X-Gm-Message-State: AOJu0YxUJisZnq7ceLENmi2rkipuoprHKMD84kw0rtxFZOuwIcCgO7rc
	KrexSBwF1rRW9QKOgydH7VuifgBxp0zOgXRMKu2kB14/bzR8UCiyuD7+E2qWBFlR0NXq0idUbG7
	JJzAQO2/Io0XmyE5123S5fuVSHKgL9E0wZ7cLPF/4hcX+chqH+bN+Jul+mDnGSh0FrdYfDB7L6f
	l8FtgR5RThpCM9wbLg/cU6W9gd7JZT5iIMhFLOMlyA5UYc+M5zVg==
X-Google-Smtp-Source: AGHT+IFa9F+COKZa8ISch08bbNdcv43TGvP8EG5xj5dJ6X521KU5ZdxA9e79JCDBwefI9u7FZNld2Q==
X-Received: by 2002:a17:90a:ba88:b0:2a1:f3a0:181a with SMTP id t8-20020a17090aba8800b002a1f3a0181amr1796435pjr.31.1711704471054;
        Fri, 29 Mar 2024 02:27:51 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:27:50 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:19 +0800
Subject: [PATCH RFC 03/11] riscv: Add ISA extension parsing for Sdtrig
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-3-1534f93b94a7@sifive.com>
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
X-CRM114-CacheID: sfid-20240329_092753_843086_38AA8213 
X-CRM114-Status: UNSURE (   8.43  )
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

Add ISA extension parsing for Sdtrig as introduced
in riscv-debug-spec [1] Chapter 5

Link: https://github.com/riscv/riscv-debug-spec/releases/download/ar20231208/riscv-debug-stable.pdf [1]
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..9f8d780fce35 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_SDTRIG		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..080c06b76f53 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -296,6 +296,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
+	__RISCV_ISA_EXT_DATA(sdtrig, RISCV_ISA_EXT_SDTRIG),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
