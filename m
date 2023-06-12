Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6D3C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=evZYuEdQXQp0CK9hGlLHV2J6Yvxzwx6hM3Tb2SD6EjU=; b=Bh0MpGpMkOTVTi
	MVBWDtB27oggJ5uzM1kazoxuayTDkj0Jd04JTWtzzDUDcKhezWW7hZ1dFhFe0gTOmcMGaI08FAKKF
	JHDbVSYmM7H5d8bGCAkU2y8PAMEhZBjQLgRK9+VYtEhJ6gHxl3798z945cNX3ZhiyHFAjjgAwbYNh
	4yZJlS1KuIVVbfQV40TWPnnND7JSnXO1mbbafBlFpFVSyXDuwGKk5ViXtRiO7pbnJrXvku1ziyVam
	laNDsRED2qrNlLaS9Ni7OREuYo10chxLiSCjK45X47uOmNW6V215bbVOup524Kv3oWHKz6GEJ+KC4
	Omt8aIo9bftRKrl2Wkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fRt-003ilB-1H;
	Mon, 12 Jun 2023 11:11:01 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fRq-003ijl-1K
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 11:10:59 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-19f9f11ba3dso2265959fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686568255; x=1689160255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zL7XkrZyqya8n0rx7DgOZlvul+j+rHB3G7NIYCr/fJ4=;
        b=Cu8HvVsL3Oo1kBqetVxfB8kxfDzsr/6mR6QXuR/GV6F3dSI2mMfAfYmUdskwrE+YsA
         H5Xpd2MWKbgGnHgAlzwLyQGRzDOcQ0Lc/c4rMu/XtI2+d33IF5dIjqFbD0aMM8f+jRMt
         zbnZ6+0uRsLg4nUomzgoSWkHxaJEwmsHgC8C0xNYgzV7UnT5kbB5fGUIP90W8/x25Usl
         JDx2Hv4KBbxi140bn/X+aovN+bd/5S42CXTgrweuu7HZzeDwgXczUzzZSyVj/aR9WUxl
         DQtCVdeDP6NxSOe7fs/+A/rghZs/zkufpNgWpQnpa1lrrFtP5B0rtCZUGUf0YRULaxhY
         oTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568255; x=1689160255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zL7XkrZyqya8n0rx7DgOZlvul+j+rHB3G7NIYCr/fJ4=;
        b=FaDnS7V6Vu6VSOmdl7pa44PDncUwLHqVEYkuEfJdsMJ0bCf54KJ/6+VKtu5yWFPzXD
         Fs6LW11xY9qdmQbTouxYt/HeMKslaO7hojX68pkRgQhoIZdJPAcghZx2pn4iLoutAsq4
         1DDQK4v+upTLsJxaZTU9Ml2iGA0IiMqsQKZ8g+IKMaiZIGzWvjDgvHm0SHAe7pnT399B
         j61OvBGBu1yif9qiiW4OsKKUE/WJ/rs2smnOqfbaRvoYOJ5Vctc3vhMXcw2oGXeDUKNP
         aNCJfmr/xoMVoEfDx678Ml+/eYqYpLsqi1ZjpBgea4YP6aEVciJN+xqlZw67MvWXhEQQ
         kpfA==
X-Gm-Message-State: AC+VfDzfQO7hTRuRUuujWScMmcL0bx/jK8WMiziZv8wlVoX/HEwVplQs
	yulnQW4a4LIEbtrXE37cx90yaw==
X-Google-Smtp-Source: ACHHUZ4gRLnvcXL/JEGjteWqrP6XC6G4pxlYpyz+2HznJdMy7z5H1TyKvw56mBzuGJaiSuGr3hPVzQ==
X-Received: by 2002:a05:6870:4353:b0:196:4cb3:7b7 with SMTP id x19-20020a056870435300b001964cb307b7mr5797393oah.43.1686568255008;
        Mon, 12 Jun 2023 04:10:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id c8-20020a056870c08800b0017fea9c156esm5715955oad.18.2023.06.12.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:10:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Allow Svnapot extension for Guest/VM
Date: Mon, 12 Jun 2023 16:40:44 +0530
Message-Id: <20230612111044.87775-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_041058_455269_56D464F3 
X-CRM114-Status: UNSURE (   7.89  )
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
user space to detect and enable Svnapot extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 61d7fecc4899..a1ca18408bbd 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -122,6 +122,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICBOZ,
 	KVM_RISCV_ISA_EXT_ZBB,
 	KVM_RISCV_ISA_EXT_SSAIA,
+	KVM_RISCV_ISA_EXT_SVNAPOT,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 2db62c6c0d3e..7b355900f235 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -61,6 +61,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
+	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
@@ -102,6 +103,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
+	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_RISCV_ISA_EXT_ZBB:
 		return false;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
