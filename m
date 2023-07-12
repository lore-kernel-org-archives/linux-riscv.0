Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7BCEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URsXAvwd5Z3gGUsvy2o1gZLFAwa1p0EMx2QGTJ5moPo=; b=PQBRpdWmpbI6oS
	AX8ZIzE7AUv8gJw2a9RlqBviNrcS2w5+5aBBMyAcJTuX9H6UfTwLePBtPlOcWWKdksVGQtBHMN6rz
	SW3lJKj2oOun3zHj2pQ0w8jiBP7Tm8nQSiqnw6OvqwLwtx6UPYBraJN80DyPQAn2vNURBrOkM9JSE
	2wCCbK+xIUYzhnkhVpuh9RrWlXoIkhqrGv5eWD7uFenrUrNzxkfLHoH8aOLNRM/vx+J86JJ+zHpjj
	zXfFjX40+PWfg+Vb+9gdGMx1N1CnUw9oM7AkTiIcr3lzklOzbY8iCwQvQH1nJ7coN7HlamBK72MAK
	DqEBJN8K/2W6gBX/+gFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcQz-000Tg2-2Z;
	Wed, 12 Jul 2023 16:11:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcQu-000Ta2-15
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:11:18 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5577900c06bso5439397a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689178273; x=1691770273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4eCvgIEwUhNpUS/9a23InYjY0pR/vf8cughyXw/poo=;
        b=oFNNIVC+CISviFrM5Vq5FH0kRBY5kviSOIb0veSS6PqYkk04O51aDXHMPf+RyxK559
         BdqwgsAfWPphwmsN9ZSPRmZP64wNsrVtNoZc2WvfZYiSde4hGaVFAQeOrcXf3Sygnkd/
         SGZ6OhgD3slRwedfyssodEbncbVjEbp0FP+Ez7Y7g5gdZv1DnmIYV/sDneB9upEx41sV
         y7P/RUcccpOA9sgTxHHaSsBRJBUP6MtaHOewj779biMoUZSp/OJ7aKoniVmaYRJIbYeb
         HUxsM8cW1WtfHhGL4OeFQgKi83dYW6bSw5KVZG6gePc0P2jyam3oe7Z8frf+1qeODQBK
         2nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178273; x=1691770273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4eCvgIEwUhNpUS/9a23InYjY0pR/vf8cughyXw/poo=;
        b=MmfmoXKxawoPpLY8uO3rR+Y6pRc1KBYF9NRoxpmavBT2Wo1f2T9rKuVN2Qfom3dllU
         IMObyhxvKS/b9Q/7fhZ6SfcCbaca3fAJZISPn02WoYKKEliEQ0piBmONu7AkjTUt5Yrl
         ayxWTaa4czunWkvO8BB4ScZXN6r9RvCXx7iLSNLvxgCOj2QSIDWlUCj8u+WA4uRdmTUa
         4r3AUDoTtMQf93xlt6xB6yOqkBdXOWR4wqHyrSiMB1EWCZC+wTK04vsmPQSHaTGX69/e
         DgSZRVZqnXNgWviJbb5pZLi84Nu0TCXTDki4hyMNsZyKWBfSWRZjgcNwAZ9my/EU44yd
         kwFA==
X-Gm-Message-State: ABy/qLZwjx/d+T47i/JrPUJyjnnaSWmZQNwwqJDWRr3PgcVn8kAGBpHh
	5OyIIJd332wpNKwlYKCKb16qAhTpcMAJmQYU7+k=
X-Google-Smtp-Source: APBJJlHj2x7yj/VukJwmedNdpQID1nbTjJYHe48QPbo5swu8h+VBiX7XkelJf6YwNGHe6Ubn6M6HVw==
X-Received: by 2002:a17:90b:614:b0:260:fd64:a20 with SMTP id gb20-20020a17090b061400b00260fd640a20mr19650835pjb.9.1689178273292;
        Wed, 12 Jul 2023 09:11:13 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.173])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm3811650plb.3.2023.07.12.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 09:11:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/7] RISC-V: KVM: Allow Zba and Zbs extensions for Guest/VM
Date: Wed, 12 Jul 2023 21:40:43 +0530
Message-Id: <20230712161047.1764756-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091116_411966_D902509C 
X-CRM114-Status: UNSURE (   9.22  )
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
user space to detect and enable Zba and Zbs extensions for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 6c2285f86545..68f929d88f43 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -124,6 +124,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SSAIA,
 	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_SVNAPOT,
+	KVM_RISCV_ISA_EXT_ZBA,
+	KVM_RISCV_ISA_EXT_ZBS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 236359722364..555acebcbe02 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -37,7 +37,9 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
+	KVM_ISA_EXT_ARR(ZBS),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
@@ -81,7 +83,9 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
+	case KVM_RISCV_ISA_EXT_ZBS:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
