Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE23CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/F60VFU4j/vGn7YDESjIXUyM17BYbG6OVxOgXHhnjGI=; b=VaOebPD5Sighz7
	jypXQV3pYj+Kr60a6MknDsMqW/rwnxSJ/rvo15gjTxbUdE+QMY2zbl5VEr1XzaeyRm/73Yd21oSgl
	K2zmWJXNTJu2LkNkBOIlsfnvAVIg2yGZR7AfmKMUCt8S/bQLOTsQ6uG9FfME4KQTlVuvE2Q3q2cOl
	LrvQxGZTJQ3os5mvXQClDr5J+T0DW/pDonSFtB1WJQdJvdj4IRSVgSta9zfw5lbxlZLQZ4WtEg0NG
	DcTaRr0lq9lZQ1cjsofd8r2QGD7W+16o3P5JyvK9L3WN5zefqHUquxE0lx1wiMNvnKfPzis3a/8kN
	BojeXn6g/U70pVkYIw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mse-00000008M3X-1YWb;
	Fri, 17 Oct 2025 16:00:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9msd-00000008M2Y-0YLn
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XGrq7dE9mGPhrWe1XWbI1ElRSHZxTOfH8a4rxkkGojA=; b=YBJUuFoRPsgX2DPKM+pifCIIP8
	8rgqlAFe9rxP7eUD/5GqV39DatzJAxhDgXHVYnMmlRJZOKWMLmv2wjCWrKU/uxOstqPNxMDwQWZcC
	cP6ZtgIaZb4yo/Bd63AQdrWcjhrsD54ivlES6yGsPyPFoirNEqeN1wnxvSwAWgRLR+0k7vpZa9YHA
	+hmdnYu0gnUoNY8TJil66uSbfKjt8+DNrcJ6jv/IoKpniI79yQrQdpdPGBIIscW+lQFwWuqx8pNZf
	aZiu9MByDhSmy05yza65NMP+zs0g3/kvB/T6RdBIvvbM0tp1Hkicq2qfWHarU1XClD92dA23DwHZP
	uY/+2jAg==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrv-00000007iRj-3gos
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:00:09 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b60971c17acso1694397a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760716790; x=1761321590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGrq7dE9mGPhrWe1XWbI1ElRSHZxTOfH8a4rxkkGojA=;
        b=Qwnd7md5Ro9B14ZMZXKXYow6lfGe3XPclir+08L2tPSljpAhhE6bZpcA1XVLtsbk4J
         VEqciMPJ1ctFYLHp89HkREqwvWPJ6e/qiR2drk9ajkzt84ZNR/Np5WOL1/nWwBHkIY0t
         AXF/SAMuIVs6barJLimtynoAzPzoYg9vH1pir0go4JTdojXe3BaScMtUDk+ufzIp/5NU
         4vrB47iWy32UkdNt637BkTADA2+jal/AnYkF17+b++ONmw9eFrgXwUd8VfHnx8XOAVp7
         VuSrcJheOkgZ75BD9ceyCINnYShxbZZQlYIN0sTY0eCG5LQGQfI/pHk8HG0pymL85RGV
         B8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716790; x=1761321590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGrq7dE9mGPhrWe1XWbI1ElRSHZxTOfH8a4rxkkGojA=;
        b=GycMiMdtFUtSZPyhsF1SXzNRiYTLour9ySwpgTMgWT10wI1FdAKkyHyl4Nb1+gnxX+
         3AtbI6jcRwJeuG3VT1CMXETcxxQdZ2gm+Z2fkDVb72HU6aeT62p7YdnqwyKSecnK3xLs
         hPke62BI4ueh/R66ibNBY4Ks6iRMAFMdZack0NOmW5h0lpfkxnSVeOIz4ffW055UAZA9
         39mKyJegARbV+E8Tbt3hLVpHwPWJFs71v+SQrWiwYzFhxRrHpVhCsG26WszRfQf3XKvy
         cP838zFV+O/8MH8MiL3scRUl1Oij/FhHTST9jA0waDFJwUaQZyucALIlvizaQrkYtQSP
         V03w==
X-Forwarded-Encrypted: i=1; AJvYcCUnvU3iNHmH2JZ29XyInIwot3nQpG2BISwszD6pLw/DOYOtQbHwy0CNhLy8J6O0VKU3n/TgZuru70SEQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7osjjof+ik6JW2ExdKVGy7asJLL2/jUdRutCF0wKHKspCrhF/
	RYAY1tV2nMqILiYGVY0XdnnW7myInCsiQHf4sxguR6N9pRb+eKrCLztYGbfidaM8pUY=
X-Gm-Gg: ASbGnctK6lGDyQq35lxQpqMWYSS8gi70wyNZFHHEG8BcGjv3VxV1fsSr6E46gUREj/b
	GY4Tznd+DIaqROSIezUnDUR/dBnw71HJM2So3o+IFkzsbkFROoRBw2G9GxkUFbdAlcLgCwvp23Q
	/F7ZvWPHA/rS6PPuURE9tdiJUMoID3eo5Xeh2GrOymofZSDqlWDSXC50DIisxc0I/vTcfqjqxBH
	TtfvsQ3iNT/VKpUR5QvubI1bGm7/FflIw8XxtT97w1/nGEG8S8ngBeds6nT1O1+gzhrzTaOMOsr
	tYi8JsTiWpkB45qrDxi+zMzfShc2ZY00fisgrf0T0INxpwlSj1xykweu0KY5rYicTI3qEvRdvH4
	GFTLqbQeB/M59l1DwY8AeGKJXJNCOI19RzPg/MSKlCHR18q1fzzMxTdTeLftAmwfrgAA2n8GBZe
	FFWTSrbg02vJEshtRSnVVZcACldSzrbSyBuEqJLCDHJGw=
X-Google-Smtp-Source: AGHT+IEjhb0cA2r/R2/eGguQc8wJ0VGA660zoYKsRyUrDokrj4BSrZrFe4SkzJzL8cy+UNwStJFbqg==
X-Received: by 2002:a05:6a20:958f:b0:334:8335:9d87 with SMTP id adf61e73a8af0-334a856e41amr6075209637.19.1760716789785;
        Fri, 17 Oct 2025 08:59:49 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7669392csm151067a12.18.2025.10.17.08.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:59:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/4] RISC-V: KVM: Add SBI MPXY extension support for Guest
Date: Fri, 17 Oct 2025 21:29:24 +0530
Message-ID: <20251017155925.361560-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017155925.361560-1-apatel@ventanamicro.com>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170005_345027_9459A7C8 
X-CRM114-Status: GOOD (  10.55  )
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

The SBI MPXY extension is a platform-level functionality so KVM only
needs to forward SBI MPXY calls to KVM user-space.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 1 +
 arch/riscv/include/uapi/asm/kvm.h     | 1 +
 arch/riscv/kvm/vcpu_sbi.c             | 4 ++++
 arch/riscv/kvm/vcpu_sbi_forward.c     | 7 +++++++
 4 files changed, 13 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 446f4a8eb3cd..c1a7e3b40d9c 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -107,6 +107,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_mpxy;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 759a4852c09a..37213d86c0d1 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -211,6 +211,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_STA,
 	KVM_RISCV_SBI_EXT_SUSP,
 	KVM_RISCV_SBI_EXT_FWFT,
+	KVM_RISCV_SBI_EXT_MPXY,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index fd4106c276d8..46ab7b989432 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -82,6 +82,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_FWFT,
 		.ext_ptr = &vcpu_sbi_ext_fwft,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_MPXY,
+		.ext_ptr = &vcpu_sbi_ext_mpxy,
+	},
 	{
 		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 		.ext_ptr = &vcpu_sbi_ext_experimental,
diff --git a/arch/riscv/kvm/vcpu_sbi_forward.c b/arch/riscv/kvm/vcpu_sbi_forward.c
index dbfa70c2c775..5a3c75eb23c5 100644
--- a/arch/riscv/kvm/vcpu_sbi_forward.c
+++ b/arch/riscv/kvm/vcpu_sbi_forward.c
@@ -25,3 +25,10 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
 	.default_disabled = true,
 	.handler = kvm_riscv_vcpu_sbi_forward_handler,
 };
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_mpxy = {
+	.extid_start = SBI_EXT_MPXY,
+	.extid_end = SBI_EXT_MPXY,
+	.default_disabled = true,
+	.handler = kvm_riscv_vcpu_sbi_forward_handler,
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
