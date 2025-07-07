Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDB1C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 03:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yg11kIcyYhk0tc68Lnwh0hxl+CU7ai+NtyuQOulL/2o=; b=fw5Q88hrdAVei1
	QOrj+hDvJStsUJyNcGe75EVOcAr6K/hWr58pDUDKEABu00iUJTuc4rDgqoDIotmGOSa5B22yOZihC
	Ql3XvGqqCRbl4D+Gdew75fLgczJu5NCgF9Is/XabuR5zkoXXDGvte4IkKeg2r64p9+0r/nT6MpF/i
	wKAiZrnelBsLxi+NRr135SdcowSn7XESJKq/Xqql9DdDrCokaOHclNTSHmswu33FkAhU9WR2VDnT9
	elFeCLplcoxdD2oEhUOR65pDKkZLWRJ3rxwyuZPzzRiVXhYQ7tyS8QHKfJZbnGZvK/NnpoOikOgnG
	m7ccBnZW1mTrIaAaxK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvb-00000001Kmh-13wp;
	Mon, 07 Jul 2025 03:54:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvY-00000001Kk6-1jV0
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 03:54:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31a93a4b399so1991160a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 20:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751860439; x=1752465239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfAi3fd+E8Ej2lF9gnj/0qdp/peypswYQnHcbvVqddo=;
        b=QWVDVSsP0EkkC4M16aB8U/E7np0g2oPSaV2k8C213rBf2RUc8JOBw3mIMNQ9RFj7m6
         tFZR+MtZICRDeRErjNn+ABeXUaN4SZQDY1wtrVxlNmlZQAZ60FE1Mr3xvsy+jyecEEOW
         Zx7r4O+ak+DrMeRBy5nzFci9YH9oCQI2pfWr3gLX8qtgJL+aLT743ZGgmlqdwmagM/Ff
         5BfwK7+n3c40tirTIH3jxFgObwyaqg9nIqpEgtFHhOPfdIVcdB93win6rD0ov8dPg0TQ
         /Ekv65MxT4sGel6Lv+ZPPVo76IuirFKQF2ma2LL0s/IHrzbsFbWYMFAzvHpFMAEyQP+e
         ZKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860439; x=1752465239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfAi3fd+E8Ej2lF9gnj/0qdp/peypswYQnHcbvVqddo=;
        b=ljQQzXXoLx6YvNGRwE0z8gpknz4ofTHIgrAojyjfCk6gk12k5oxVq8JMTcrH/RU1dE
         YAxmeYKasGF+DS/m4SqCsvnu7E5e1x+Rx6b/IKTcIzl8KS0A4vi43LKMXp3OgqVnXAot
         O++Ms9Xxu1XMx7bRx3+WrBrHc5VQjyPKkNaaxfOUpPyoBYc6D+A8s2bCtSWHRmfaQfee
         7LjK41FRWcbvTR5V2NavA/bmM69Wg9r1+AV6iVa83V6BWXcuxMjfznr2ZhIVBAXWOq9K
         nCHgU85iSXSdmD6PmOlZwFIcTEcijbGu1xMddq4eBIj+i+MvMdqe6I2h7r/0509ijVIj
         vkUw==
X-Forwarded-Encrypted: i=1; AJvYcCXMDXF9DAufYeoAjLfYsXKJAevVUVRzmoFjlmCUS7GBbPV3/YUdukXPDOTiALA1KkYe0CiL3dn0c5K+Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRt/fq46G9tOo107jZYe/2l0xiVUsO/t4PyGniaeFMRNKJEaj9
	W2KnSOffp/KhzUIzXjpLrwCBPzOGa6RAD8FrFLOerkengNsH4Gh8NgYc80tGK5W+0VlHRAzrGWh
	SQsJX
X-Gm-Gg: ASbGnct+7fWySbNHLnIjW6b37GscI24C73mUde2+SL+/gsRX6fecbrMY5CFtFngcA6k
	0UmrE1XyLPpEU7YnG/Ktjc7k7DqXv8FA3Ir0XeWcmPGVwLoq5b1gMihEp7CRYPD4qwvqscefeq0
	3N97xRosglc1bbDoIcwJGXdCW1afAeK1tRzO4qpgrsYyqteSzJcitq6vs9nWeQJ2d9npy0KVUuE
	kSJ/ho3uFnTGRgrBsX2qzztNEpE+RUKM8fJMK28bYTyyvC9WNB3KWHcA0I7Exe/ehaUb8KttNgB
	uhcE7xO7nRwJT/4uqe1f9VfOU3viEt5z8hIMj9fXsGTVBOSRXK2d3lvycJQVYMv+HOUcAV9TOuX
	T2UfNxAaFy4q31TNLA54=
X-Google-Smtp-Source: AGHT+IGeNKIzrYtZHWrzPyAaXd9wmbWip0uCwcq3zrRW80YaPsp+TGeA7hn5Q+daneEYm75wjzhZiw==
X-Received: by 2002:a17:90b:5847:b0:313:f995:91cc with SMTP id 98e67ed59e1d1-31aaaf7301bmr16967530a91.2.1751860439499;
        Sun, 06 Jul 2025 20:53:59 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae80ae0sm8159137a91.21.2025.07.06.20.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:53:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v2 1/2] RISC-V: KVM: Disable vstimecmp before exiting to user-space
Date: Mon,  7 Jul 2025 09:23:43 +0530
Message-ID: <20250707035345.17494-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707035345.17494-1-apatel@ventanamicro.com>
References: <20250707035345.17494-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_205400_455623_7D461FD7 
X-CRM114-Status: UNSURE (   9.99  )
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

If VS-timer expires when no VCPU running on a host CPU then WFI
executed by such host CPU will be effective NOP resulting in no
power savings. This is as-per RISC-V Privileged specificaiton
which says: "WFI is also required to resume execution for locally
enabled interrupts pending at any privilege level, regardless of
the global interrupt enable at each privilege level."

To address the above issue, vstimecmp CSR must be set to -1UL over
here when VCPU is scheduled-out or exits to user space.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Fixes: cea8896bd936 ("RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc")
Reported-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_timer.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ff672fa71fcc..85a7262115e1 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -345,8 +345,24 @@ void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
 	/*
 	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
 	 * upon every VM exit so no need to save here.
+	 *
+	 * If VS-timer expires when no VCPU running on a host CPU then
+	 * WFI executed by such host CPU will be effective NOP resulting
+	 * in no power savings. This is because as-per RISC-V Privileged
+	 * specificaiton: "WFI is also required to resume execution for
+	 * locally enabled interrupts pending at any privilege level,
+	 * regardless of the global interrupt enable at each privilege
+	 * level."
+	 *
+	 * To address the above issue, vstimecmp CSR must be set to -1UL
+	 * over here when VCPU is scheduled-out or exits to user space.
 	 */
 
+	csr_write(CSR_VSTIMECMP, -1UL);
+#if defined(CONFIG_32BIT)
+	csr_write(CSR_VSTIMECMPH, -1UL);
+#endif
+
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
 		return;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
