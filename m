Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E4D3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvNmRWHkIadmO8mC5Enw99QUMhBSMGXeV4oY7RaFu9c=; b=aPMwN4XxbNDy3t
	Iv0ClhRX1AEHrgO41tGeICo4t0WCorET6iv6TnW+evifzFNQLvi6Lh8t7c6bCj3Q6SE6FX7CTvwek
	jTNcL6QjIhXGPr1kyA4v/u/YydUqf/kzk6b0lHquWGM3H75W2k18F5I26vsgwFjnXN0wO/VCHtG8e
	Q2OT5Kw+yhzW0LH2xA1TkPD0lYgV91hpK6SclvrYiArTHRa5ZDe4LDRfyGM0GmXzDVipw//Fd9vED
	uY4y7u9WQha4n9jhdCa/mpMcputLFYqvd47zpg986fLGZcJTrUrYErC1nU8EBX/s4KcHRMbP3+VpI
	FJRKvIfcIpfiUh8EWp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buR-00000005N0c-2FsN;
	Sun, 20 Oct 2024 19:48:15 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu7-00000005Mjd-41Tt
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:48:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e2dcf4b153so2768383a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453675; x=1730058475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=160oEn3Hw+w/iZ7EFhTc6TJAcZCL3iOZo0psz4xgbB0=;
        b=HmvICT2vWRR7AaF7bpBVj5iFtdo/uNItZTIDpUgl2+O9RCZMaeA4V99lXO4WwlYB8b
         LI/EvJq9hmQAmsimc8JOyMMEb2YwnhOdmwGELx6iqWRa87JyUn3tTMgjMhCRnb0Ur/49
         ndnEkRIUNrliaf9V01emgYASx/IGIdQX3yrZ3zrFkeIJOHFhTYvBUzPoRkdox1fNw3s2
         F8Hq8s+ExyPQhM4FSGgO6hYR/qLg6f4EJk4Zv8iRDYzoNDRDMkBQtNiZ8Lo6BlHiYvXz
         +A37mJlavCU+jOICGyfKPRRXAWdIMUPRShOX//D2/MtC4oYwkfmXvXEqwvKEIYyCCJtq
         dRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453675; x=1730058475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=160oEn3Hw+w/iZ7EFhTc6TJAcZCL3iOZo0psz4xgbB0=;
        b=UV7qZUG32VRn1Q73oURk/ceh3h3EuICv4YiS3rxBFnbZfZHAp6MSx0Yr235ZSIyb5n
         RLjcZAbGbbzweVXNuC2SbXToWtz+9PbQEOefe7cXxUqSGRVcycOUuzPlBefSK5fi4/Hp
         tJKbLM3PLIWDJq0QyCae8Ja/b9Za4yAXxT2hJgDayvt4A9DYsJGOF3GYr/UG8GAllhPp
         YtdwURNjX/e4hSj7SNZmKndirzpLoxNbThxeCcYdrgwXUYuUPBe7JSvA06n32+amZekA
         oyqaAokgGLoGom9Lr0mhIsSHCTVdvBt0t/kOxT9jYKXwU2kFged1JwJoaJg//AXVv4TI
         j38A==
X-Forwarded-Encrypted: i=1; AJvYcCX6zDib5Bi+C6cGjzuquqBUmCgJnBozo9c0Dv4VX7qM5ozl8E6NLXiV5+/jlFIfxj84PKOrU+MAeZscQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoaGjq/lXJmxgAl5K1GBCfpn9Y3K2gvht7u8Qrr/0o7m0VftOW
	PCMp+COkfSw/kps2HUZrr0wlZutZXdxI6gltIpc2sFFtCJFI67CZI2DCG6yQ8Do=
X-Google-Smtp-Source: AGHT+IFjSRTaADFfRKm/pM//eGuPDafKddIxjEZ6I/KXrnokbyilNV7LBvfBGmNKmpBhs1ancwD0CA==
X-Received: by 2002:a17:90a:ab0e:b0:2e0:74c9:ecf1 with SMTP id 98e67ed59e1d1-2e561718d7amr7870206a91.10.1729453674952;
        Sun, 20 Oct 2024 12:47:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 06/13] RISC-V: KVM: Don't setup SGEI for zero guest external interrupts
Date: Mon, 21 Oct 2024 01:17:27 +0530
Message-ID: <20241020194734.58686-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124756_082624_3E6B1318 
X-CRM114-Status: UNSURE (   8.88  )
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

No need to setup SGEI local interrupt when there are zero guest
external interrupts (i.e. zero HW IMSIC guest files).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/aia.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 17ae4a7c0e94..8ffae0330c89 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -499,6 +499,10 @@ static int aia_hgei_init(void)
 			hgctrl->free_bitmap = 0;
 	}
 
+	/* Skip SGEI interrupt setup for zero guest external interrupts */
+	if (!kvm_riscv_aia_nr_hgei)
+		goto skip_sgei_interrupt;
+
 	/* Find INTC irq domain */
 	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
 					  DOMAIN_BUS_ANY);
@@ -522,11 +526,16 @@ static int aia_hgei_init(void)
 		return rc;
 	}
 
+skip_sgei_interrupt:
 	return 0;
 }
 
 static void aia_hgei_exit(void)
 {
+	/* Do nothing for zero guest external interrupts */
+	if (!kvm_riscv_aia_nr_hgei)
+		return;
+
 	/* Free per-CPU SGEI interrupt */
 	free_percpu_irq(hgei_parent_irq, &aia_hgei);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
