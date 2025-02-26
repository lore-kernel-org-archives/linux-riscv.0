Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8078FC1B087
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13av1zCnXRGub7etFs2rEfSZhx1vgjQrE6ACyxhBm1o=; b=YX22XMtK146g3r
	Qn6SA2tyKZ4XNam/pXIJv/RSy7+3NqMtk+fzOO7mZm/ZD++9OcPb92Se37YzSlx0Big6ZMG2RXzaX
	PRek7rwApb/InYi0+Np4kfFi04estv2WQen4/Hmf66Nk+iKTmfkgzDUxh7NNZ+Wj2e2/LM8BHXpTt
	s3Z1u7XpBQ36c1vKeyJG95eI8hyffN8I0+ohhKSpxfiwjnDRwPmoKTppqBPREHrfced0oT7cULbr6
	8XL/A+/RCaZNma8gQ11vU+QbQxZqoQfIAjXRRRTGzNwbxnOHPueHgTClHJEgVWN/RJySQjhRJWiyL
	BX1ypbRsAhsYzCU2Brrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1B-00000005LCk-0S9i;
	Wed, 26 Feb 2025 20:28:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxw-00000005KQ2-1Vl4
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223378e2b0dso2809265ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601511; x=1741206311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sbKkO5vslqQzNclWEzfBDF/g1FIfkcy+q0e0Bhe+Aw=;
        b=xTW1aWpeVgV2k5lBnADqBby4LbnZbWzmRKdVexmEtiqr0qbrYkpgQw+u+zn/NYlmZo
         lgSJw3e99txTg13vgmygp9IpXwn/xV4daxSTwE55zWpdp44BwEeLriVOIE/fdysO/7a3
         3CQxkiRQl3FGhUCBqpVFxchJot51TnRzik3HMhP52sQTiJsLh8kJFd7DKSTm7q1Jd5XD
         g8OL6MAvQ5MfAEbW1NySRU1K0Yculp5aMRnBLEfVxj/u0DE9M05ve4xRihcH7TnIDn1M
         4JuvUSfcbs0/3RB65n87WdjhlzoeA+TQcR9/th4UzwNlNPSplxIeukSTC+vsx49MI1zV
         I93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601511; x=1741206311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sbKkO5vslqQzNclWEzfBDF/g1FIfkcy+q0e0Bhe+Aw=;
        b=FLkJxQOylN6pYMrkWrs5gPX1hwG/PkPANzTGVUVs9mdNO6zo6qMGNQXKmRK4CCO7Oz
         1NfYPglbOtNfRTxoVxREazEvH5PKcpZtNSaAKz38oSU7J0yeT2MhbyQw/NxmXaYuzOiV
         rQqUsi85dWhJopPxSrQUv7jJL7IlRkAwaPONrCGTU+1B08NF02ursMQpPBkeVsgQZhdU
         io4jYd6DeRoWpkVclB8EzmDicSMMgF8P8NpapEJs3UKvcwclQ+m2uUVfXL/rOubyqxdr
         R+jAMdDSJ2afzLZxp03UU2ifyFb1LofOmu9AV34+sFoHZNBJqd5ZisJn5+ZNG40OeY4x
         p1aA==
X-Forwarded-Encrypted: i=1; AJvYcCUvtOSYZyiExDJVRJmBupOD+/JVI6cUirtnzvHYGDFL5dGw31muKs38ETOOfb9x6IfNG2oGxMonZIwTGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTNmuPYlwi7YDmdXxD8M63kM+v5PWoqjSj9XrA1x7F0bTjksPc
	WAuX1Yzpjr91evvQpiljFuHSvHe91/DuTtIISHLeqtyq8xHDiZ1bNtdn8l4djAc=
X-Gm-Gg: ASbGnctvY8IPTnQEKO64gX4PmvLtvvODX1s3SUkiReYIlu2vYYPzFuKVQARZG1jkJfQ
	zHjE5ZtNxypNVU6G32MSSA+LVuhwUQlk0le/hKl8kk5OC8I0JPz4cmlPUu7HyqeF8vOe+I9cxk1
	l9pPjqdvpCY6QmLfAj19XivModpF0wsrEK7bbgOMhBdnNXqpDZJOOVx+2UtHwmDYraHdhiSKuut
	TomGJ+6ffGzbfG/Zk1QoPDfmtmGolKSfyatbgFplij46rESsZLbOwZhraBvq86pHBRknk4MW0Lu
	CHxzJ3gS5sw/usF8wz2jlaPVxNb4F3O7EiwdMTQ=
X-Google-Smtp-Source: AGHT+IEWIj7IHjMpuZgHnt8pmhZWNooJK4EQmrGTIUbek2AswW1q0QzF8a3PR6HcOQhdoiMYN4qKxA==
X-Received: by 2002:a05:6a00:1ad4:b0:730:888a:252a with SMTP id d2e1a72fcca58-7347918d99bmr11980276b3a.15.1740601511484;
        Wed, 26 Feb 2025 12:25:11 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:11 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 12:25:03 -0800
Subject: [PATCH 1/4] RISC-V: KVM: Disable the kernel perf counter during
 configure
MIME-Version: 1.0
Message-Id: <20250226-kvm_pmu_improve-v1-1-74c058c2bf6d@rivosinc.com>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
In-Reply-To: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122512_416126_07388E03 
X-CRM114-Status: UNSURE (   9.53  )
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

The perf event should be marked disabled during the creation as
it is not ready to be scheduled until there is SBI PMU start call
or config matching is called with auto start. Otherwise, event add/start
gets called during perf_event_create_kernel_counter function.
It will be enabled and scheduled to run via perf_event_enable during
either the above mentioned scenario.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..78ac3216a54d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -666,6 +666,7 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 		.type = etype,
 		.size = sizeof(struct perf_event_attr),
 		.pinned = true,
+		.disabled = true,
 		/*
 		 * It should never reach here if the platform doesn't support the sscofpmf
 		 * extension as mode filtering won't work without it.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
