Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B4CCDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SA+Glo82LRSM0liZHGepHgE4HuhOX8yiAFj0Dv6zg0=; b=bi744MgOB20UO6
	wDpmqfJUjWBrLbzNef93i1Wniyrkor5RUJweyezwDUugGHv9N2+SVWvBwpnn/WYVrhmjjoXy5s6nK
	FaoYBO38fPJlZHgjiZqvzZhRm/PbgrqqcTentOt8rdfX8cavXi5EwcMslHY+N97YyM3xFmZeQ89E0
	fgoR9huVI06i9XXff9dEJW/fZO8AyxA6vFys1+YeNnmDSOYV9JoqxPQW8L+LV30zu0R4mxhvBRaxE
	p5S6WKop8XKx2rQ8Z8wFhcblGH5l2RG80Nwnd2ekBEh3kvMGRbhE8KAE+zazZhPF/vOIXrkTzUxR9
	AH16qPd9o3I+Dqo6h3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpo-001QFG-26;
	Fri, 20 Oct 2023 07:22:16 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpm-001QCW-2E
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:15 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b2b1af964dso384571b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786533; x=1698391333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XKdexmGCdd2bnnrJTDfux86dDbyR62+1G32W+zioUE=;
        b=X39BuKKc2dT75Xd4KPHqPolJ2bWSNwAo7bX/ai4G7aLcC5fhZ3iDsKAInwWPtnW1mB
         P49ovMhhMxY1Jv8jLlecFVnJGIsLtN5ry5lfGpDZDFPObtmn3nSvOJOBoWZDZYjtTx0z
         Dr8yXCrWRlE53dElvYAQfms108NsdYYT7GuV2qfz44rFLSIuwYctzb/jiG03ftiRp+O5
         lpbP1y9vnPTcdE0uWJvvt2wx7u4SJ6yn+NWU9Mr0wI7NhzPZmGpNtf0LZ9dA7XTqzxYb
         oGOMVn9LN+4IBs8LrMZ0vwbm768fTdwJx+qnoEDvSHR7idehb02dHoBwPXhWSwGQbQFz
         fx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786533; x=1698391333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XKdexmGCdd2bnnrJTDfux86dDbyR62+1G32W+zioUE=;
        b=WXi+5TLx4Qgyk4lg3fAniaPzdw8GTeUNJK0sBANO31/3R4BvaHIskJLQgik4YnWZYs
         YvUGogjoh7CyTLQ1M3Td33W71Ha0hneGdl+DUw4+08Ih/NmyzdI1t8dRYWSIOFAkxaH1
         Sn+SMYE7r29pCp5BSINEGAS4/NyrJTxDHRe59JQ3sU1b56X7hEROoFGtLXnFAtLrhRM3
         0qpBXJcMfxs7rDJEMSd5WmRizyvh0vZxNXZcs00lCf+w34wHq/4x+2ciCrTw7isb/TWg
         xxSMw5iW50S6HS3+S/n0QV8hftq3cpFDvCvf4894m4rJ/wtCNgJE9r1ZbSVAvnK//pKO
         e23w==
X-Gm-Message-State: AOJu0YyCvUFc7ycyrunhjuJjYPqcHLi/NHZ7VJRqVDVpi03x8/GXotDQ
	DE8ynble/d37+fLbYKEvqUJxVw==
X-Google-Smtp-Source: AGHT+IGNA3teY62UcK8wOWxlnmVNiOGXjjS4KNoIU7oF6NdgPgGX2+CnnNq3uwbgRObNWcOANMq+ew==
X-Received: by 2002:a05:6808:144d:b0:3b2:dcff:9e54 with SMTP id x13-20020a056808144d00b003b2dcff9e54mr1358519oiv.24.1697786532716;
        Fri, 20 Oct 2023 00:22:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:12 -0700 (PDT)
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
Subject: [PATCH v3 5/9] KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
Date: Fri, 20 Oct 2023 12:51:36 +0530
Message-Id: <20231020072140.900967-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002214_728935_39C22BCC 
X-CRM114-Status: UNSURE (   9.12  )
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

We have a new SBI debug console (DBCN) extension supported by in-kernel
KVM so let us add this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 234006d035c9..6bedaea95395 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -394,6 +394,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name))
@@ -567,6 +568,7 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_DIS | 0,
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
