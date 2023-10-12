Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1878CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Wv87bO5mUJcOUq11eiO+8vIsfFKGzPp/ZPnVZbVObk=; b=qqDhFUu4rd0acB
	xuG1xAGLgsP5ZmTLnq1oojEec7JDhMvAINZmm30gBMhguH1DoLA1YeC7IEBcMhNKR/XJSBuvkg4eZ
	Ho7RZqBM4wyQWVCeTTTVnnK8uD+wyIqhf/x/GUKw44x9SZBJUT0vRrYpBEkL6ePMrHSVwBgzO/w7K
	wQbswsmiMUK8S2v3jC8nKJBOendNo0oh5z3xBKHDvF4MD/7MLHCSG/gc19WS8ET7sw4L8ccLAvSCH
	A3mJqcViyYefsIb4rihjGL1JEO7IPzLNavdFyvAugHPCQFS4uwvdRCoOKZj4Iff+Oa/U1cz//OGvp
	/1nLIW3DGl0q+Yv9+ToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2o-00HRAh-39;
	Thu, 12 Oct 2023 05:15:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2l-00HR7k-07
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:32 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5a1d88165a3so446662a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087728; x=1697692528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=VsjAKfJ3/4SeKOu8vq4mbsSymMcXLfKrJH+l6ALvQGlRBDIGeB09s8b0VA4frI/x/v
         3zqeKWXf9eXAHEHbjnSWTv3i7H2mGniSwiWE4Z5ijLZlLpcT+iBxKkZZaKK57RPD6Rzy
         SjCqZ2ac76qxb4BCyH+6taNsmlOnCCIaqmwT3LuxG++nfP13BogO7EqzOjrwNx1L4lKq
         16g9j4I35PlD1yzHNZFvybBKSBMp7P8aMmIAUdwX/0gdK2MjXWs5fkNaEfayxYCiFbAp
         VnD8QkT6en6aEvF5WVzzAp/R4lP2ftgFyl72hAUF8RE9T3b8JsEFf1w/WQiIHb3c/KqE
         x+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087728; x=1697692528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=hWbmDxHj5NkYB/zp3VwNt4J5/0NE+tN5JWFTIIyKPA+SNl+WJ9PhdJlOIA8RGKQFbs
         reqhLt2xFY8h7u2UMvHLvjfsemb6byxcqt4xEm/tiDDM7cftwswSoKaU/rqQJUwmSQQs
         SrxD59LvRuIhMBLBrsdM9cqWTImRGEZQGe0QNCMVwYkgD/SWk6CxH6zva3YJ4cC6nSa2
         EhvL+ClpK1eCLb7fn44CZKEe7fSU1cFB4jRIW/3RF8nrPiebtzLw1Y0BAjTiMvO05NEz
         DDSq8f7V3Fv5Uw0VSRDrYEaF4fDLfhbKIYOOoyOuPE0Y0IAGrrUB9U0i6K98kL/vdF8S
         mGLw==
X-Gm-Message-State: AOJu0Yw+cMhiLivQki/h4DRZ+fq72x6b2qaXhXisZTKdpRS5RUMRn8Wm
	XtjvYr9aTU7oXZm31SHslDpn8g==
X-Google-Smtp-Source: AGHT+IEYTYmKd3tYlh3LiHGeR+Se06zPGfuu6PsLv0v0PYM+oZ1DNY/YAR7he8NCW/RMMx46gl3FeQ==
X-Received: by 2002:a05:6a21:7784:b0:173:318:b1ec with SMTP id bd4-20020a056a21778400b001730318b1ecmr5209664pzc.35.1697087727987;
        Wed, 11 Oct 2023 22:15:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:27 -0700 (PDT)
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
Subject: [PATCH v2 2/8] RISC-V: KVM: Change the SBI specification version to v2.0
Date: Thu, 12 Oct 2023 10:45:03 +0530
Message-Id: <20231012051509.738750-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221531_073614_0A5D9FFA 
X-CRM114-Status: GOOD (  10.06  )
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
