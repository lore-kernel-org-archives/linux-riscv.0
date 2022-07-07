Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88BAC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxwfuF94NR9383u7JS/U1Akm1Bmu37tgkAeJFfRZe0I=; b=HpEiTfdcrOf5ZB
	QSjI8ix7w9P8V/bdLQxI9mZ1RsidCBmXSp7nfh60oL4Ztx2BHF6pxsalzkfjZhU021WGt9+u543q5
	AZLkWFerIKPILhoPUoaTRzN3t3QJOIYwvG/eBsFonBPAT73tYZvG2qahfgbMuta/k836XPldx6WE+
	liSvfsJxhexLM08PjYt+oCeamQ+eDwLvbCToHXctwV5zGDnQf1uQcuDA/K9emlFwI2h+WDDBA8CeA
	hevpJAjpbkzTSJUW6Pp56BI7jjl34QKXDWOf+DGxBkjXkR9QYyIYSX4lEnL1VqfDqCKF9DhldH0Uy
	IjKl41TPS+WqGSrwiktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9St2-00GdSJ-Jx; Thu, 07 Jul 2022 14:53:48 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssq-00GdBI-2u
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:53:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id bf13so5914058pgb.11
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fD57yUsjliqe5212UC73jciMYLhocl/mJZza20iLtLM=;
        b=HREjwpOHYeWrU6A6/U2oDeo0YtAehYjc/ZJ9j7FbEluYn7HuC1dGywFpW5pQZNDQka
         po7tV7v+W6APFRZv3E5Sfh3p95lGBAzAkE34O2BGSXhBfW7ePf36VhZHZHGsu0jBEOuZ
         hYeotUD3v1d4C9iqVEIIc7oRDwXgVbgDme5nEHPHA+MZD8l92z2Wxrjt7vdQ9m7RMPI6
         ZQrulgBKu1vD8bC+KurYyKhVVsS2GdRNUUoP3phn64wR3QTNpbAFw+NJJq555EkiXyNx
         w1g+vBw0i2lj40prRY3F+h0PgZZgqgzbCT70rpqbdfb5MTs94SktHewWkRXOdHHm1G+Y
         44TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fD57yUsjliqe5212UC73jciMYLhocl/mJZza20iLtLM=;
        b=AtOtLhkS+GV7fKpsaBllwdC6OrXwINK/VnEnBXRDUnXuZc9OcS6fdBXWGznaDn/QH9
         b1RMvsAjjecigu26wp8Yw8Os6e8cRKhs7M8AVvUmW7esYU0y0xdf5hD5CBndCHqKpW6H
         pQS6OK3jDLfvgQltSFnzCHWxhnWODWNXzZPLqbPMQIXcybfi9O2fiH1dQ6s+jWxF0+66
         wduSj8F2criisXhyLkSN4hdw+0WXIPqtyqaujQPXKxlW4TyASf0Mvrh/IZB5ttoqPXTO
         c9r7BsYutqyZNqJGjHmPlGHW4UQGkkW7uLtyAg+ltqs5smZcQ0Da6nH3lKgtKq5/oTqk
         feHQ==
X-Gm-Message-State: AJIora9OMEjpZy4/j3t4VLfam4aHjQ+I3EMrSBI1tofEIqhzbbBcgcZ9
	E/DWCt+9JbzqrZH1Cl+RL3FKsi9fVrHIZg==
X-Google-Smtp-Source: AGRyM1vkT5xNsTOaWuTJFKrN6WLK7LJ8+AssTop+Ji1DBkYJgjBG9dfbv3kSkw24C7PkCVqpljI9wg==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id k8-20020a056a00168800b00517cf7b9293mr53059954pfc.7.1657205615717;
        Thu, 07 Jul 2022 07:53:35 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([223.226.40.162])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7951a000000b0052535e7c489sm27144231pfp.114.2022.07.07.07.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:53:35 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/5] RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
Date: Thu,  7 Jul 2022 20:22:47 +0530
Message-Id: <20220707145248.458771-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707145248.458771-1-apatel@ventanamicro.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075336_152889_99F02890 
X-CRM114-Status: GOOD (  10.58  )
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

When the host has Svpbmt extension, we should use page based memory
type 2 (i.e. IO) for IO mappings in the G-stage page table.

To achieve this, we replace use of PAGE_KERNEL with PAGE_KERNEL_IO
in the kvm_riscv_gstage_ioremap().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f7862ca4c4c6..bc545aef6034 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -361,7 +361,7 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 	pfn = __phys_to_pfn(hpa);
 
 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
-		pte = pfn_pte(pfn, PAGE_KERNEL);
+		pte = pfn_pte(pfn, PAGE_KERNEL_IO);
 
 		if (!writable)
 			pte = pte_wrprotect(pte);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
