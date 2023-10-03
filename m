Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1842CE784A8
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 03:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGtJ5jGR3ZgjpGy+zPalzXx+Ft9cPks5Ix6BGvIvM90=; b=CEYC7FhWmUuLtw
	LORsKm5k6EpwV9OpXeISmS5Z7I7QICUR72ykSxaHtOsjjNPT9vCBRavu1s9vwahwwUiCtF/a9Zo6S
	j06bQ7SvPXF0qLkc4ylaUr4J0n9zRQXYTf8i8zeD1qS/pG/JUp7e7hPk+hSCr7rigcxUBKu1wGTma
	nBgRocyDeI0mDjYzp7oSPgI5TzfKHTFywYKsZAdPBAAR8IRY0epH9fbHexsqtPT0KpAVaZuwpfCwu
	PcmO7jxbphktD9CuT9twW5Skxezab4DNL0uAMen//uFyf6AKRjwPCp74ZVQYDovF1h1L2D3tWOCUu
	o4qlM0MZzsE4tl7XWgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSx-00Dk5T-2v;
	Tue, 03 Oct 2023 03:52:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSu-00Dk3L-1w
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 03:52:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c760b34d25so3338725ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 20:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696305175; x=1696909975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR9YD+pr7hv0tmO2NOz2gpQmVbaE/cJ/IAsO/LYC7Pc=;
        b=oIDuP1nihATFH968C21a93XFu8TAro5JTD6iJl4y7abCzPHIM8XCvZI5Ow4bSb0QnK
         ZDhuQ30lJeDeRg8mh4SqE6RJypzt4JhWeMOwRWyJEW047wkqn1NKavL5XmBgNG6QG/jE
         +GQjiKQIC2/EQVfxijskqktFluL5XLXWCiYou5docZ1PPC9AXMWNMblf1MATL7BtoCTD
         IZiojaVkROd/AAyW1+U3R/UFekQiXrGHcfimEsYSUKzeSMLHy6hXt2CtgLhGOuDcM+pb
         EXp/9D+2kUI6aGARxml8wEllWJ6FSitbAxBPmzEtYnt4nG7x9kK45qYdnX/b7+1nkbBB
         jVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696305175; x=1696909975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR9YD+pr7hv0tmO2NOz2gpQmVbaE/cJ/IAsO/LYC7Pc=;
        b=gX1+jf+h2c3FDVZuRljgctsv+AsggZJ/XqtA9ixhUJZnMd4ZVQp7zerMjd6OqTtqkV
         6SSI9i3KAE2BOJ99kN+KZaR489359EFOBQ6F8jelZDLOJd3F680fka/QyKPHwMS0ZnQc
         5gCZiCVlmNLt08VZLVJRMksr2cVfc/BN2hwCNI05j4fibZb1Ne7u1cg/RiDfjmnC1RHy
         Q1V0n4d3yYd2IY9zKcDWG8umMiB3Q4V0LPtaJqk30MYmMVDzm/lUUrTJeDjMZoMLID9S
         XkPtsZGeHbGy+pZYvMbV3rQC4Vvy6kxG8tEP9DPTS7vVk9s73mSZSYSOvFcdlWFWxdAx
         sLOw==
X-Gm-Message-State: AOJu0YzklhZPI9e5d78JrmTJJAHngp52i/5vDbFB05DN0bc/tMC8hali
	QIZEQ5YI/6Y5L7Hsi7qEq7X6vw==
X-Google-Smtp-Source: AGHT+IHVWdwg/sK94Dq4Rgb1USUh5bXBpGZ0ZnKGbSP+03oAaRBZUxn2NXa8Zq60ZS2d7KJ4sbaXhg==
X-Received: by 2002:a17:903:244d:b0:1c3:2ee6:3802 with SMTP id l13-20020a170903244d00b001c32ee63802mr13278709pls.47.1696305175387;
        Mon, 02 Oct 2023 20:52:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001bf846dd2d0sm277381plb.13.2023.10.02.20.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:52:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 3/6] RISC-V: KVM: Allow Zicond extension for Guest/VM
Date: Tue,  3 Oct 2023 09:22:23 +0530
Message-Id: <20231003035226.1945725-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003035226.1945725-1-apatel@ventanamicro.com>
References: <20231003035226.1945725-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_205256_639662_C12CBF1F 
X-CRM114-Status: UNSURE (   9.54  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zicond extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b1baf6f096a3..917d8cc2489e 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -138,6 +138,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
+	KVM_RISCV_ISA_EXT_ZICOND,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 388599fcf684..c6ebce6126b5 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -46,6 +46,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICNTR),
+	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
@@ -93,6 +94,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
+	case KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
