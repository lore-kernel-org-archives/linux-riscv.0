Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC36C021A6
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJnWeP5+qLgc3ntMm6vvhHmtMS0+Mh3ZwTUvT/r7d/4=; b=oZENIdg3QbJfVv
	4L6cEViU4pTv+sIILgoCYl2WXjOgJ3PUOcMIywlMDk4BEUVEGDj8CpbJGL3H2UVFlCoR8si+BoNKa
	dZKWvWzR3/oHwD14narwMqql4SqC8bjaQ0XUof/zgn+khXg3ff8/jMzKt7/0+uO4nqoEGG9qaUpNV
	h4IcLyani2ecoTeKd4gpsUqTb+P4vsv6CzIJ2M6ybX2AftSkgwaiRL3+mFNsYXX7cNPwYsw1dg/1i
	/C1lObvPXnhIQ9ZmQxV1w1YqW3ow+7kDpnbme6VEhHi1qdKxx8YaK3l2N5rimSvXF2DYhm6eTnc+1
	e7yT3PSHGOf6jlBgXG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkd-00000003nPo-25C4;
	Mon, 17 Feb 2025 08:45:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkZ-00000003nLH-0ret
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f22fe889aso3098230f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781909; x=1740386709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmOiuBasU6JQWrtvlHuH5EGMnpuZux+G/rw1YW3ZnKQ=;
        b=iqE38VDPriJ+JoIdAckv0hcOr3PSVj5jtcMVyOILR+jGtn6wbCRjI/aHbwnVOHbWda
         v0lCxf36Lr6SUV897SfbyPzucGySlNsQjOPDldlQ7rdnhdZCn78zzT78Glj9hJFFeUEo
         vEDhLxUJ5R1AOaK1HuX15a5eQum/i0oDsb2N+c0O7JFfZ5FcllSucTSAumcIL+72UnDu
         hsVHm6eMLIjdEu2D7E1t2+XzuC1A1cOHklteTi2MP2UZxprHaTy6ojeSLUK97YDlbdjo
         RyUZyjaKelt7YXQa9KMeepO8kjVe8KL3x59grUc/tJKz+xNfPP7w4qwke4XETpSuOcWt
         +HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781909; x=1740386709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmOiuBasU6JQWrtvlHuH5EGMnpuZux+G/rw1YW3ZnKQ=;
        b=Nbhy4DHR8IfHMF2U2Z7WRfZGbXmYw1Ag35t7bb2ybJiKVtQQR1E5DwC3/U1+uDgICZ
         8gTlhapkZe9YqWjSXDfEzk/NCEuDxtM/0SyRaE1oOcJcxb0MI5O5yvfFvy3LXW75WFQC
         I+dVOP/uMhU7IwQWdbbKaiVusqszna7QdhWRTXo/sF3TLqnxTFrXqW3/uFbKMrp3tab4
         dJfypm/7CtjprhaZnq6Y+KL1mO6m1oTb0QN3Qf6IIPFb/Qw7bzQ62pHw/f0UqmGrQxCs
         f1b9UqPFxM8ZZh/HForUVTc9Zn238AqjtdwMEVa4fjnpoKN8ZZ53042J0VrYYP6Mw0mN
         mABw==
X-Forwarded-Encrypted: i=1; AJvYcCVMrUn46WTkaXL3rhkbYRkV2fG2/9wPogIXvriojikp/vsbagtLM6wWWbzseiT9XiRFhtc+iM4aqtNvyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxykC9pVzxFtJImgRmaNe4bASS0oo4iuGSmhhR5UBtCJnsATj3p
	OdnKBQki1K+z8KNq1S8v/mc+J5WTX/uQbiDsdD99nHfxOZgDqF2W0P76OOxLyvU=
X-Gm-Gg: ASbGncsuFyr4bSV4PxiU/s/3G0R91lhDsYHXfL75IYFYMW9h+jAM4oQF4Tr5tLGqMnq
	it/IBY7rRR8L1EZ0aev35Blb+33+cAQ71vKT9owBxNAgsLVHN25iAyD7pWpZvgqVlGT4TTf8rbU
	9ryvCK/4Iuhf2Z62Vwv6sh8SDgUtJsOQsmmRzl1jO/M1rilG/IOv+h1HYIgoDem0BbM1szt6e0F
	CqxwpNw33ri+oPI8ncG72IaHmKCEzKSgzlgDxd582I4sW9lpxtydQxiLDz5Em9ZGf/GG929vc6n
	RRI=
X-Google-Smtp-Source: AGHT+IG4XexX5u4a9ST4SKpxQS8lH/aGBNXid1q/a0drWF3aciYyLxMBoUybxw0lIHE5NbqdkQOXHQ==
X-Received: by 2002:a5d:694b:0:b0:38e:65db:517d with SMTP id ffacd0b85a97d-38f33f5107dmr7035502f8f.40.1739781909479;
        Mon, 17 Feb 2025 00:45:09 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f8c4bsm11630555f8f.46.2025.02.17.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:09 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 1/5] riscv: KVM: Fix hart suspend status check
Date: Mon, 17 Feb 2025 09:45:08 +0100
Message-ID: <20250217084506.18763-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
References: <20250217084506.18763-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004511_244699_0BF2FDA3 
X-CRM114-Status: GOOD (  10.76  )
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

"Not stopped" means started or suspended so we need to check for
a single state in order to have a chance to check for each state.
Also, we need to use target_vcpu when checking for the suspend
state.

Fixes: 763c8bed8c05 ("RISC-V: KVM: Implement SBI HSM suspend call")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_hsm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index dce667f4b6ab..13a35eb77e8e 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -79,12 +79,12 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
 	if (!target_vcpu)
 		return SBI_ERR_INVALID_PARAM;
-	if (!kvm_riscv_vcpu_stopped(target_vcpu))
-		return SBI_HSM_STATE_STARTED;
-	else if (vcpu->stat.generic.blocking)
+	if (kvm_riscv_vcpu_stopped(target_vcpu))
+		return SBI_HSM_STATE_STOPPED;
+	else if (target_vcpu->stat.generic.blocking)
 		return SBI_HSM_STATE_SUSPENDED;
 	else
-		return SBI_HSM_STATE_STOPPED;
+		return SBI_HSM_STATE_STARTED;
 }
 
 static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
