Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F376BC19F5C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7kJBw5U2PK5RRPH924StPWOAf0s5q6LFD1i9sKlsgk=; b=QJceGWE4iddVyX
	wL59NURKZDh1hXjNWEol31Jq+rHZLly7i1vwB5kQu3N4t+Nm008IPMWwDmZl7T5FJGTJScB+z9XhY
	dyhhpRK3Ra8hyezcZgccN/jyOrGjClkEv/f8eY+fE7c21gkmKTwx424pNSVlDzhPTizpls+uTnTke
	BcazKhpICkvyYtKmw/DTjEkhe8yYxz1g3RVVl+uJisDlEch5wtlrBPwkFsVRztPsG/cqH/FnMylXN
	OluIL+19Wm4T/QYBjtOdN3kEe4V1jTarWx2XlxzzizOI+0Qa3BRZpHAqosyNTw5aRCOU8loSiw8yC
	bcoyg7siGPPyLz80GkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpf-001Q7g-11;
	Fri, 20 Oct 2023 07:22:07 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpc-001Q44-1u
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso469231b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786519; x=1698391319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeCDV01Cfgp2ua0LgBWyAWr2dv9+xpkaYGG6VewjHJM=;
        b=QI8TY+F6nm6sA1qOqa9e5etqgdai/9VjKucjakjV4bMZ+e/BktspmtNZRuHrAJwEZ5
         oRMlaPGxJqV2VslLk61iT7F8+DYgxJPiWxSABPXczQ4PmqJStcSnYO2c76OeBOsErDq+
         UAjqstFRd1k9xmjru87nsNi7wSf45ExOLRYb8zEVflUMZaUQM4zUX0YssnIB+1le3nCU
         rB8cViC9vO6kTFbtBk7PnKEyOAhy5Crht7jyDu18z4FxCkP+MIFEM5GdcWh/VpH1EJ14
         nlBS0vWBTWX+2NmngWhJRyYB+xGDebPRRqwBJzePYlEIptepc9cDLVfzd8Qr7/7Sq75O
         aruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786519; x=1698391319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeCDV01Cfgp2ua0LgBWyAWr2dv9+xpkaYGG6VewjHJM=;
        b=nMUyxDotVWGrckj50bpWydSmGYjhHCQuCXWCvIZwQGWwHrlHwx0X1CSxw7YMTLTbI0
         AmU97zfkIiRYsLdpjRI+U4jnFI59a3j8+WUG7N9XEgFIdwt1iBBxHZ7o2KxYF02a0tpi
         +ANFzDgFECFD69AwTD1bxJ9kxD6NpujigJvZzbW0e9a19BD6hSezr7hj7hc5GtUkt7Q9
         PlNl+Gh5/1dhEYXKPl38cjRyydlaShV0OVppv1FDmmIs4vCNduMp6Njd5Ywg05mJ1Yic
         ZLwPIFlNQcU/hm8H4GYXdoaN4zr24p/zYUHXI6TIQGjTAqHTK4Qk+ImBDgMrDD5Mq/qa
         +mYA==
X-Gm-Message-State: AOJu0Yye2alFSRs2SJMw0yIsuqZomRlj7TKXqHR6nZy/lYq/45ju2ywa
	rvdbI4VuRJSKE+F3Tiuk/6auLQ==
X-Google-Smtp-Source: AGHT+IHW872RFsEW0M8OTGxKAzWnTo/8F6Le59a6yN6WSYq8GfyXYOW1jHmUi8NhTnVPlD9i+6DmJA==
X-Received: by 2002:a05:6a00:b8e:b0:6be:4789:97ba with SMTP id g14-20020a056a000b8e00b006be478997bamr1029478pfj.3.1697786518893;
        Fri, 20 Oct 2023 00:21:58 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:21:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 2/9] RISC-V: KVM: Change the SBI specification version to v2.0
Date: Fri, 20 Oct 2023 12:51:33 +0530
Message-Id: <20231020072140.900967-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002204_649643_96AD0664 
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

We will be implementing SBI DBCN extension for KVM RISC-V so let
us change the KVM RISC-V SBI specification version to v2.0.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index cdcf0ff07be7..8d6d4dce8a5e 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 1
+#define KVM_SBI_VERSION_MAJOR 2
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
