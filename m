Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D2FC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7L2zZL+Q4BPDqGo/OZXWzRRdmEbuj0NU9XSFe3w6BYs=; b=JOoXCmm6OKdyY5
	GntQcMpJ4H2DVBLe7wpUXzI7rtx80bc1OMeQrt/6SmKLstUrutx3nwEnUqQ74Br5KfZW9tK6PaAif
	ZPlZH6cZfOlNuzDVJN+rW4c8E3qoXRoiOs/TsTzoJOawXZoY962GUFkbnxjlnvscgvjETIomoMK+H
	mXincDEuG8SmVmr4mYWkW8odoGRfoq+zQ5SByd42VubSiSdgCEBZxoUsO+WOiBchwY2dw9plrIr99
	NJ4Yh5II6ZAXbIFrYgaDy5gPv4Kz1tYHLt74GFklyHZAa406LDuoce/febXBcYy5hKtgU2krBkq25
	TX4MX+zlbTGbkMe5Zzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUU-005ZyT-1x;
	Tue, 28 Nov 2023 14:55:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUR-005ZuS-2q
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:55:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cfb4d28c43so26358555ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183305; x=1701788105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwaKI1lgANZQjTOA+BSUck4M/d+5iVp8xCEzRTmcPWo=;
        b=ST7wqi6uu8K7OcPGxPNrj2AStdb8ngOoOoXLmE2ej0NseyBMSsiMdtLLgaqGqL7KCj
         fR5IclN0DSgZs6kSVb4tcY5s0RTqc6ghfO17834u16h/9Ihd1+IlJAjMnf74yAWaQW5M
         o62DNOHwzznLziF3vRmm4XR+nRCBwtk1XBmikEz6Grd+kHWq0vefRIDOIL87kkQRnBAh
         YAp7Fx08QlsfQUEbd1PS23c0DZgOakHW1sIoLURg5FXImAvqisk2pNNAHKld3JPVEh2b
         RFo8vTEsx/cDJsz2Z8hMzm+I9UIqX4gSTyDWKFZpX/xap7Qpiwbhf87amZTseQeGzhPW
         +S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183305; x=1701788105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwaKI1lgANZQjTOA+BSUck4M/d+5iVp8xCEzRTmcPWo=;
        b=Vn7pqynPOE5LXnu5/znD1IemH606lVvAkopzjIvyJx5vJlaw4RLmPMJUkmm1qSL9tf
         5uE1qm4NU6R2gVO4b1Q8ke/IFcf9j27GxKErBoy2+lGPK35nIaCp2lHRljowsBjasbAq
         1EmT5NtT9dUcxwDA4pa4F7Hy9A0APwMf8/3hew71C7w20fk7jW/Lp6ynlOtGuTi1ruJs
         1Izdagil5ylSxeqUIoKQPa9YTQ9ARbsy/7cdDttJ8jih/544d0UxAa6SVg92eWlSqpmS
         Dub6Fc9UXUjOjWS2Q//LllfLcCSLZrAcWJ1DqAnoBfzdm9r7fOe9FEKIL9yTD2TSIIOP
         BlGg==
X-Gm-Message-State: AOJu0Yxrw+XEFsE1VeF0FXfNry+gMBhNmhv/pvMehqWSNJ9hk7S6/E8z
	Do0iQuT5ecDz58lFEdWl/FvP9A==
X-Google-Smtp-Source: AGHT+IFdL6lrc2rq3C3h5rQ26OCZchgBFYHtaZqvZgLoeRcXvlSFiVjZWOWYlj4SJdtu9QHCgheMng==
X-Received: by 2002:a17:902:db07:b0:1cf:c37f:7160 with SMTP id m7-20020a170902db0700b001cfc37f7160mr8891565plx.63.1701183305589;
        Tue, 28 Nov 2023 06:55:05 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:55:05 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 11/15] KVM: riscv: selftests: Add Zihintntl extension to get-reg-list test
Date: Tue, 28 Nov 2023 20:23:53 +0530
Message-Id: <20231128145357.413321-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065507_923922_AE82EB90 
X-CRM114-Status: UNSURE (   8.20  )
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

The KVM RISC-V allows Zihintntl extension for Guest/VM so let us
add this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 4af0f9a750e8..e1d43cc9da16 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -57,6 +57,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTNTL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKND:
@@ -397,6 +398,7 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZICOND),
 		KVM_ISA_EXT_ARR(ZICSR),
 		KVM_ISA_EXT_ARR(ZIFENCEI),
+		KVM_ISA_EXT_ARR(ZIHINTNTL),
 		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 		KVM_ISA_EXT_ARR(ZIHPM),
 		KVM_ISA_EXT_ARR(ZKND),
@@ -798,6 +800,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
+KVM_ISA_EXT_SIMPLE_CONFIG(zihintntl, ZIHINTNTL);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknd, ZKND);
@@ -843,6 +846,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicond,
 	&config_zicsr,
 	&config_zifencei,
+	&config_zihintntl,
 	&config_zihintpause,
 	&config_zihpm,
 	&config_zknd,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
