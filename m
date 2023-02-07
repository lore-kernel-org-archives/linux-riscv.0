Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C14FC636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZX3MsT5SNchcfx5INoK39BxdgdTzgj0tsd+jOcango=; b=bbWmton7ZraLU+
	nTl1Hdg6NnWBTkkRJDgqvcl9fsn8ISi6bUlsKmVb0zuyVy5qVk5D39rg1emLxahj3bZQIzkXRV/z+
	/zGkHYewa3kY9ES41fhyeGcEHkD1JoUXrIGZtyyZ48WPnxUd60dU1vD+zLKp9aIEeDepSfE1rcAgU
	a1cHYVnAe8vxbyVVUs9BTtrdBN66Kur0oprvXMGXVfcu7a5+lz1Bg4Vmcw/6kL/qE1FxKSLPFgyXe
	wkNptQD8dGZFrXQoIHfiyCOo1IC5TBS/3ATOxLtAHXObeJNujiTfBemRzaARZIcXF/CoUvQS6Nm5b
	P9PxgCscw9mfUzHRWgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLiD-00BqY9-AS; Tue, 07 Feb 2023 11:00:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKiH-00BbLr-0o
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 09:56:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id d2so10760645pjd.5
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 01:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=;
        b=RZdqDs25xResS/KYEDi/LtQFjek0M+Plb/4s7ffMGS3hx5ZzV4nC3lSe6hphmBNMYc
         ohPhw0Hffp1TF8CvnrZbYI/IGviC7OKfGm1gGf85RcIKMMXUZbZheC3Prsz1oF4E0ZH5
         hzKTtIm4AXANG8W8gUKbQjrizR36Dv81M5mOPqk36sqOn5CjoP+bGmdiMwB5ZL0MwJXa
         J8JFKBnNKaZhAVAuWAVBKa+RkPkutzJL5LSsjz5MBsRfYEpnV6mIhFhV2/WDSAND/Cwl
         xtwXLkLb5JFo34JL15qk7gNKbbTQh9mJZi0xNfBZMYhE8ZTrDtCYQ9ltix3keZw8CjJs
         oSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=;
        b=2c3APnjQZ/w+4yZbwiEGpCrEKPGOdvCqbBVW7W9wBe+TP6HBwhk2mA5rmietX0O02Y
         88zoRIryamUK6+BYF7mneXcurtMP3Qf4CSi5GKbwp82SWfje+kcP7LqJB9rDMk93B+M/
         9DyCmKAF2FMMuuna8e/zlcMNn/p7/S22XWF9ZAg4mgKHusMwOxZmhC/Xx28ePCxgvaEi
         vh88GFhZSbHuHD2C/J0ScyfF20GdTn8eab88tgD/43n3eayVxrZxrk5giyCI6Rg03rQY
         pd3v+ZUZYBET9S+XedLgRYmMYhJzzDlU4QodbqvGtGz0d7+tT2dLhaJzQ4zfd5LNCUOq
         3LHQ==
X-Gm-Message-State: AO0yUKV0XS//Qcy9UddGXborwbXrJB9djWeJkSfpx8s+lmdE8V81ci/S
	ZVBs4v/rgAzlWTeDoiqE0fvDRg==
X-Google-Smtp-Source: AK7set+yWUejKGqKbCenoyjAhUDv3HTfD5iunwTnaUqSClL1mPUrIF1mJqLBV0a3M9F3PPfyImKdPg==
X-Received: by 2002:a17:902:e88d:b0:196:433e:2384 with SMTP id w13-20020a170902e88d00b00196433e2384mr2470244plg.57.1675763791523;
        Tue, 07 Feb 2023 01:56:31 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b0019602b2c00csm4030598pll.175.2023.02.07.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:56:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 4/8] RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
Date: Tue,  7 Feb 2023 01:55:25 -0800
Message-Id: <20230207095529.1787260-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207095529.1787260-1-atishp@rivosinc.com>
References: <20230207095529.1787260-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_015633_117957_C008FB7A 
X-CRM114-Status: UNSURE (   9.85  )
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

Any guest must not get access to any hpmcounter including cycle/instret
without any checks. We achieve that by disabling all the bits except TM
bit in hcounteren.

However, instret and cycle access for guest user space can be enabled
upon explicit request (via ONE REG) or on first trap from VU mode
to maintain ABI requirement in the future. This patch doesn't support
that as ONE REG interface is not settled yet.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 58c5489..c5d400f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
 	hideleg |= (1UL << IRQ_VS_EXT);
 	csr_write(CSR_HIDELEG, hideleg);
 
-	csr_write(CSR_HCOUNTEREN, -1UL);
+	/* VS should access only the time counter directly. Everything else should trap */
+	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
