Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD822CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6GfO83N5gaQAZ9dCMQd78EwlaN8Bx510bJt16yjtyU=; b=1B0CfVQnflD/Kp
	Mlqm2Q0EATlg1Ij68kSsnKEIfoTvyECPZkEykLk1J5KcHETbcKq325VfXavrq7qamTG5jR6N/aiY2
	8VYVtBQSqpMQJeJgYf9SXXUxYwcznyL/JnGdE8LzRT+pzaJcAE0BYfntrSP0QJY6NKPDwWjBcxzs2
	EqoFKc+lfWCA8p3G5jn7FzRQZadShwO5BllN8QUnpxLOg3ZZYvjvxfUGqDX51UX+EucNF+QRjGfaq
	vCF8qczkrJExeaeCJfxFjBA3OdQBCwPphHMLEmUOZ7BBWNb1hjHf01x6f0ApxpxvJEePrw/A5Ospz
	Cf8lBcqTG9bWLFpAfyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSx-0000000BqtB-13M0;
	Mon, 20 Oct 2025 04:25:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSw-0000000BqsU-0fO1
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 04:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=; b=MEQGK47HeZS0p5tmQlVkVJ97LZ
	sCVzlpciXvBwB/Ro7joPKKlfskqsNi8S/FuOts4rNdfT2h+g7muk0jyVPTpL0hpa9hNCxxHheMy9p
	+TRzblftUTVxpSamCtikJXbGJ9ZpIh/tG9VP2DLnB9tll8V9l5qx0+AcUBjropt0gSk9oj09B4vk7
	IokrrCDbmp9s9zz3nN9JoQ5YNSfVB0A02ybg5XkjG2iyDrSM2/QLYo2UK56jhMSuBl4yquIC9telH
	GuGBUsBgUAkFu5srWy/RYF8eeFM61pUqDXxvnl9PmoNG0XiAFgGyhYelg0YrhIQzFBZtU5LaJdwg5
	clYvobYw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSs-00000009VBM-2caK
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:25:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-26a0a694ea8so28750685ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934345; x=1761539145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=ai8bWfWrMUG8zhvfpo8AcZ+VhwcvHIt8pa6j2rgK8yk0qK67h+4UyjYXv7osM2XXT6
         LWNaNnk0Jh/It5BPCIu5YV3cLqnMznrcKp50ZKIYBaJ+B00dVYtMOkp/A+h0fP59rDZt
         4JVxasPqO/wIHlPlYwW/CkIYuLmpYD6KL4Z9SvOsd6sBsLV3+PBc8H8g8wqWmCtXj57J
         E5ArviX0GXbkJDAFgccOwkyCP+Q8yLLjKjaHMWXVVWiTa5sDFgNH7P9u7/aa3iSrhpak
         vuUM7U3xXE5b+u7xoc2MmLHo/yuqpmTvNTIqdhpwlmyuHMP8Gmg/+1ZHIZSw4UHqmWeO
         5Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934345; x=1761539145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=UjsxBZpaxtRtxBfHakhf1xnO1giyhouW5Ymm8eEo+FEn2RcGc6kNn0LH4H/x3oxDDX
         DFqehrMK8aPZi7vqg5WJ7+xE0Q32HrqezQakPyRUUeVjiPMxM8UvbABgi8zOdQxFq3T7
         SspmlKKZdkhVYvtCrF1DobnKe4cP3OR1SK/piURQOzg6NYQVEc066UY2YcrVyclPWdrk
         4y7bu7/KGu23q757rPwuetH7MJXef5aWxRehoEtopUQBjo6bqeouSAn8KslmbDVF4dHs
         A+fuyceKgBjTWetsRKaECL1Bh6o3fZD20tsBPal19SZr1h8KptrGQ8+IYt5cWSscFemm
         pKUg==
X-Forwarded-Encrypted: i=1; AJvYcCVHk+9eJBOZgD1nxVX++SufUFtbv98fTXWdPwhHZHl7eF3QUrt8bycAaKbmrDz/1Q6gWLyH5RYnnC/WHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk7PhEi7Kgkm+NHpowZbAyl+qpaS3zzsYH9zXqbv7n2j8y1vSM
	SA8NYBh+7nFOmsS64dbCdvglc+4YIzQhrG8RtQYmX8QW5kIPyQaPro+T6pZAPeAOmYI=
X-Gm-Gg: ASbGncvMAJE2BxZfTIhUgrI0oFEKJtTUv4b1ma5afCmrLV0YCa9TRg153Uk3Ls3s7Xk
	WGsvFyg/lkSuqeu/m/tvd1663/SJiYHpX4wINuYexqD4a60cKCPCiKnntwKOt4xj/zIU0BpVssf
	p6j/Ta5sX9PPkXvI7a5mTvmr2i12xRARzrNEIHUhSalKkDV4yT82EwkP/RldA5rSSzzNI/JevD4
	358mbSGuKGBbsmXgP7xoqQqyKfxWJg+zs2HK0XmtP0o9PWdetlmX+TZkYEtm5nuzHxkFu0igvL4
	IKqGmBxlRu4HJ2RCWvopKgFQSMtJLiy1YxtVH/rozyVJAT+SwO3aEtKtqOA0BNBV29OdZNBHxu8
	3nhmCWRCgc5tOhU85pA0A6g/snIeBCnayo+7EMC1fwuBqIjz/iAU6/6IcpJaOTzgihC8mbocqaD
	NS2CYJJx/uSpKcFxHoZCbL+bgcX+9jtscRZ17hnTzM7ix5Av/AvFjiEwwnmkGN81amnKS9jmUMv
	A==
X-Google-Smtp-Source: AGHT+IH0j6CDe697/Hu2JYLa69TXmwS2tLcGClfdWod/OVynSzlnBv0UTOF6Th9AWlAgJGMUHpIxww==
X-Received: by 2002:a17:903:3c24:b0:269:8f2d:5221 with SMTP id d9443c01a7336-290c9c89cd4mr136224525ad.9.1760934344799;
        Sun, 19 Oct 2025 21:25:44 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:44 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
Date: Mon, 20 Oct 2025 12:24:56 +0800
Message-ID: <20251020042457.30915-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042457.30915-1-luxu.kernel@bytedance.com>
References: <20251020042457.30915-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052546_952406_D3441BB3 
X-CRM114-Status: UNSURE (   8.09  )
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

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zalasr extensions for Guest/VM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da11..4fbc32ef888fa 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_ZAAMO,
 	KVM_RISCV_ISA_EXT_ZALRSC,
+	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f2..6ae5f9859f25b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,6 +50,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
+	KVM_ISA_EXT_ARR(ZALASR),
 	KVM_ISA_EXT_ARR(ZALRSC),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
@@ -184,6 +185,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
