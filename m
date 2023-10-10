Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9579CD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Wv87bO5mUJcOUq11eiO+8vIsfFKGzPp/ZPnVZbVObk=; b=AHgrrx8l4MBbGE
	RnwSu0KjKGeLdHr4au3A477rHgSXkCSaPtXN/TNs7agB7S9cy0L29xsMHDEMe3daH0RR8Ry0Wpguj
	H6/HUwQFjcRzwFHP7xKw/TG1PVEKOjDG73DeiySk45ZN3jaJtb7hAM8CD18Of+h8zgmoaKV56JxK5
	ASenSxDeObfe3dRs6AaRduqk9Qp7jzK21JAn/Ak8osODZqbP/pUznWNuCNLfr6A004nkY9Uy3+a8W
	NzXrERWORVDKTD2dosBzavG8XmOoJNEplonIIchvM34+ZyxzXXRdLtH+FAQgdNRUQp9oET27uXtb8
	rW1LpyPTIibxHkHZ35dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAl-00DoOd-1S;
	Tue, 10 Oct 2023 17:05:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAj-00DoJN-06
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:05:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c7373cff01so251075ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957525; x=1697562325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=gMHp+n2B3x2B2UYrPGyjpz6SnWiJTaq8NMGyU6+PzFmLKT95mmdq03e5wmLYoPijep
         yr7OFdIHVchHBk5uj/zFLZ0y1zeErbG2iQHGc86NvuUFTAV06ZJzGC8v4cA1qJkJzBBQ
         fsCPqX7yKvROQOKfcS6GeuzwVo8IX1S5M6q+mJxIdnqdJR/4BtxLkpOTQYRcNJ9wDsy4
         EzsXI2RyU0/uD+8DJ5WUVtnmchcKZZXujYWRnMY0NuDf3VvjplC7siV7051RheioVn9J
         kPBVr7DnbOI1GDdPFujRgGx6hDBGD6tUA0+/8rGQwOFIaqUNlDzOSPZ+HJB/cu6wbbXc
         7w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957525; x=1697562325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=fGJdvg32voim5FZJ0raiV2SGwxU4CO/myML8M4AarYt7pjEvGH0wiaE1l5xhZ3kdeg
         Ep9dO+UYlz1rIvezLgqkU1wnu+bFzOsKSL+mg7lWw4vMTuU2SgKXT1+JRl5F+U+B+OdW
         eUQEZIIzityplzB51MJP7cz1IH7c1/2twzElLxmpXgtWhaHDeMrdIPL6LBZHQ+tyATHo
         UTIVgp0jf0gyomwM8vVT7S1OizTaBpqpqWKlMZEbUmXXSo3fRj8lMhjJffwPQfdPZEQy
         UDC+FDA7MDq5AHSy5SDFeNhy7EXjhHEoruPleDngf14Z+NdQJJ8Kbm9dKv2sDPEij9qy
         JxTQ==
X-Gm-Message-State: AOJu0YygjJ9QHWxcLbPqvUTozn1hMw5QhY4w/zfzCrMdFgguNTMuV6Nb
	c737T1UgpUQxh45r08ir+qqtnQ==
X-Google-Smtp-Source: AGHT+IG+mbNrQmt2GEYzZRkORnAD/EBo6KEPWJykcTVHm9mjjc11kbkmKKhIYwMGoWp8ra4yRmdzoQ==
X-Received: by 2002:a17:902:d352:b0:1c6:de6:5eb4 with SMTP id l18-20020a170902d35200b001c60de65eb4mr18397397plk.13.1696957524587;
        Tue, 10 Oct 2023 10:05:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:24 -0700 (PDT)
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
Subject: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to v2.0
Date: Tue, 10 Oct 2023 22:34:59 +0530
Message-Id: <20231010170503.657189-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010170503.657189-1-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100529_068089_934483BD 
X-CRM114-Status: GOOD (  10.41  )
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
