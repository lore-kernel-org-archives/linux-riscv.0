Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B456FC282D2
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYS2HXBhY/CB9xXa+uWiIA2ZgjwSIp8WUBDKja/Q0J0=; b=KI6IlSOKRg8xoR
	9aEjKFdcu5hUj4rTjg6NHYPBTKGArJBnqi94Y5WurnaZ30HwUvqfMcmkhhmTvyPy5CqpzfFzrLTlS
	fLYA7OSCe8JATj+UaGBF+9qcohJSMpS2XXKrV4FvjFfXuz5+jlpTJO5e9fQcf0Lq1lKwwrpFzNrCR
	WyQFaiYYfHhyzUz+sHqnlBjLDfpxAR3kxry6r3ARH0YNbv+kvSXKUtSDldXz+AxPQ2U66rre4p+VO
	YG5sKqAA842U8096IvvOn1joHxpj14yreOcuxIJL9T6C7g95g5J/T0qbZI2zkMBNokDEwZiSHXp7L
	NjizUZxqNUH5Y2j5pUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEez-00000002Vzq-2VpQ;
	Mon, 03 Mar 2025 22:53:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEev-00000002Vw5-3S2Y
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:16 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223378e2b0dso71982745ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042393; x=1741647193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mugBhowmjHeOZ8voD78niLPk8kFDSWBL6lZCl8cn1Qg=;
        b=ch3ccgSJtvNry+ip5X0qGjeYI5gMZ7V5/KXNQmr9PTahLbHlH72IfJJAgNQLyiNAFt
         BUNJjBUADoXqozPgKSAro5qBkXO5kMpEvV631lWcPb9yqPh9lShILqWxXMJi2PgG4lTp
         1lTNcj/LKoujmFSZbrhVGsy6h+w2+Is8Y0jgv6O/2F3XHZTKCCpGErvhb/55xNsJU62k
         N5nXCHCywbfGZvNosyTVCX3zK9SFBw2jet0u+/o6BN4VNb6G8Mp7cfjpoP4T2SuFkGI+
         +TIFepY4cydDDbHRzYVxe/m9TWUEgx1EzADTGlZO7+HQPOKYVW7VxDVhH8irLSyun0V0
         dkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042393; x=1741647193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mugBhowmjHeOZ8voD78niLPk8kFDSWBL6lZCl8cn1Qg=;
        b=jaYJMJVl7N71W/Ni9pSX5QaXaiwJU0cG0Ci4vqhOTUrRS6/FuuAUeY1nnDrluy1Cww
         fYwIk2cGJCH/Hwg01NPtqAuf2gvx7YHCE5k+fOlbWDKT7NzhPiMoDcxRPBH20KYZly2G
         9pTXfKdMqX//r13JK+ttdCAxQSEB6YXKL3JuDtM9ieqqoM2DncPAk1lixzALEiyODUwN
         7AbP5qj+Ci/ZmGfq1qb9OMC9vFhJyqjsc5oL6ytcKvfTzQVmcOl9zONE3X2ZDqpxVIKw
         v6p5uCLzJh+SeaYFlE7+p2whEYnN2K7XSwOognc1DzftcFeT1scpmWRiUqBBSJybJQGH
         f2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCW+pWkw7G3JkvIKWj9A1TcDe24ncfGs4/M7h/D3jimBJT0JUjeP62r8WAKO58iZzFf0331nkHUxBmGCVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIwzRV3K45D69pSrZgeYdMChCZub7Nfs1W2rEbZkeQdK7IPboI
	Jrdn8OdLO1dlA89zsJIM5vt2qx1l37UohRr9lZXbVjZueP6zZ1Dyocf1Kpr3sL4=
X-Gm-Gg: ASbGnctiH+OZTBRe6DCHaYhGAbRLKWS2TYVaG6rqOtKjSZVHeIuOq/RxOamE5lUHd1R
	mKYF5fADXioiSao9XSTSKh6K10zBz137ZPfLK2XZ1cRVIWpCn+skQkld7EZcS66Sir+02a4YF/m
	sZT/W+LSXtnVNCrKZo9kdz/XODx0/Zpoh5IsBNf8qr3agTBc8TY4Vkwx+WRaPUGwwNE8fwm3fZr
	JLySbtd2nD+QO6+3t1D9Mt2roMufIA+GYHOl9eLI68vWY/z/Bae+Hqw+BmCsSNpsVwDM2dNHS9Z
	vj+Gg1QMDtbdjlmrRqT3Hnz44K2Ul7cf4QH9AN8rUBN5NcGILzs2x/Qp5A==
X-Google-Smtp-Source: AGHT+IGcN7KmSzWUc3x2Q9hIKcCxmrhzor1ESo6ey42ZNpnLuX0uKU0+qCp3SXFy7hHj8nlBIEN6rA==
X-Received: by 2002:a05:6a00:240c:b0:732:2170:b68b with SMTP id d2e1a72fcca58-734abee4a68mr22681643b3a.0.1741042393072;
        Mon, 03 Mar 2025 14:53:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:12 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 03 Mar 2025 14:53:06 -0800
Subject: [PATCH v2 1/4] RISC-V: KVM: Disable the kernel perf counter during
 configure
MIME-Version: 1.0
Message-Id: <20250303-kvm_pmu_improve-v2-1-41d177e45929@rivosinc.com>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145313_863586_FADD0B20 
X-CRM114-Status: UNSURE (   9.50  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
