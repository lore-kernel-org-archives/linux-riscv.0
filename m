Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82354C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzGw/sG45Wv5N/vy5MXMT1SmrOWd2Jx17Vn0UKv7n30=; b=mjKYv9TRelWEHi
	KQW0BCc9MN/FZcCcKmaknOcJZkCTfhLKNuVNSQcTg+NYDGiFCL2470UL9jyZu1N9uRqUqE3lth1hA
	JUAKF0+1XQGAv/9eiHeWizG2TakutYl72hNdxnmgbuJETLggGRitKjtWKUC+LX8c7vdGnuaPZW2Mz
	w875IIaFSYKZQXD3wyr7dJN+l16LlOI3uQfn0fhHE/ABWLAj6V7bVmn0fbhF1YE+c73kQ+Owd3AoO
	w2zvDcrCWSwKIw6rGI+NY1m0I60XjnkdJRhgKYRKwND7PzU7qs6BEnwrmX1hEUaqFs3SVxY1QTweL
	Mkujnn6fqwpA1WF+SYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seB2c-00000006XXC-33yP;
	Wed, 14 Aug 2024 10:15:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99r-00000006CmB-1GWg
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UZ85hK5DD6/7RMQg7pUyZ001ybckvLWjPJtkX5mnwuQ=; b=km8VXfo9g4YC+X2Z4vVdjEb34i
	EXhn7oDBWyxet3C/T7sUBtmLEkFpMyll1/eSBE70kpAoIrK4PhNJ50Ced0OvisOtUdlSlTx51BbZ5
	9rJf1/SKsbYqYdkx/WbSgkPgBQ8Zh4+jePyg2xuMJEPzyZnuIUfUVNQ3zc4YN1cUdGk8MLgq7D8FA
	+i+czHJJNuzQ3MZV460lAHIvl4EIm95DLpUOrHh1bFwTcNiyV5lGG2JpWTSjpKOByZ/9pKvbdKM1T
	qMAO9kTxTVAG6v6PEw9CMPtUVhU3/BfGCNBI3U8VEAnib+FuaOx4kue2muvjXfqCs0E/uR8vUQ3Pz
	PuhDEktg==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99n-00000007wk1-1tis
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:15:01 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7a103ac7be3so3934468a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623296; x=1724228096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ85hK5DD6/7RMQg7pUyZ001ybckvLWjPJtkX5mnwuQ=;
        b=cVU9JjEy16klBbGLjQ3YLXuI4P6ZMQTWytVWg3sdHjDeS/DN1a3Ovjcyher82gc7xd
         H26GSxugHi4ErrQKoEqgwTNrYeoUx+XQp3t/7zHoZqNrx9PaUWi6nhBN8WkW6Ydw4oAk
         6YBnIR4E4BEpnRqyhV3NMQwaMB+YUhK5pgwWNWauU4/FGYtAq5Q9ZwKXtEk4y4zkbEZI
         ZWHMPqufj+c2fTp0fQGwkEpF05BuIJes3uL1I43pPNPN7g4jZNEI53dDGw0EKSWxHKfm
         zLroxrtsfLyCTKTKKMp66QT476FM42WKlcrM3AkXSEnfU41YphhkpmzMz37yD5lWdD/E
         RWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623296; x=1724228096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ85hK5DD6/7RMQg7pUyZ001ybckvLWjPJtkX5mnwuQ=;
        b=sGEUbFAW8izyGtQ+jq5i9fWrbldHPy9Yk552Tp+mPipy7YWRLe8mDyMk56crpSd2u+
         Zr2pMLc2s+KMYPX9WTzG0AHt7rJKtY+rZGAjaFa+hTqmVuXv+/9VxRV6UHK34+VkRCM+
         4CTfY0f/MctyjxR82U3lWmqmog5L6aoYZ/z7TBz0zQO+qLYD0ygE8o7rTMbZdFWLiJxV
         ZeeDv2JBdKgSXyP6zSAPfx6dAC/tQplToDpzRCkOUwfaLZlRrfq62DIIFXMyVUBg93C1
         M7jaWkJx/fHqROs8lxgfMS9Fe6Tam8+Mm/QPavtIt1FzrB91UOdK1LwUFE3ckO7Em3oV
         KR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo7/DknS8vVZpsV1k4jhxgZd1oFV5t2ow67SwlujRBI/Rj8O01XbgVYF6WRiQtbyRGaZ6ZLznvg9EBtDQR76oeMKJTJ0zpM/CeHghOsC79
X-Gm-Message-State: AOJu0YwuRGKfKnrbqb4iiXuPZJYqNiDnvMGUHHMoUABN8twAQeXPuu2A
	eVZPhm4ZVJxqaF5pJIp2dnc67nxF7UgBbMgOZHYoEhPbN7Kxc95Vqz4mEyfrxXM=
X-Google-Smtp-Source: AGHT+IGU5Szuwnx6XGiK2l31SU67FoDgx2bwF5oKXl5MDXQtHNeKYjkuW/YSzMujNYTEJ2w7/ZPvKg==
X-Received: by 2002:a05:6a20:d04c:b0:1c0:e1a5:9583 with SMTP id adf61e73a8af0-1c8eae6f542mr2858028637.17.1723623295864;
        Wed, 14 Aug 2024 01:14:55 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:55 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 10/10] KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test
Date: Wed, 14 Aug 2024 01:13:37 -0700
Message-ID: <20240814081437.956855-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081437.956855-1-samuel.holland@sifive.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_091459_761111_2A33FB00 
X-CRM114-Status: UNSURE (   9.35  )
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

Add testing for the pointer masking extensions exposed to KVM guests.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8e34f7fa44e9..54ab484d0000 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -41,9 +41,11 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_I:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_M:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMNPM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSNPM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
@@ -414,9 +416,11 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(I),
 		KVM_ISA_EXT_ARR(M),
 		KVM_ISA_EXT_ARR(V),
+		KVM_ISA_EXT_ARR(SMNPM),
 		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSCOFPMF),
+		KVM_ISA_EXT_ARR(SSNPM),
 		KVM_ISA_EXT_ARR(SSTC),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
@@ -946,8 +950,10 @@ KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
+KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
+KVM_ISA_EXT_SIMPLE_CONFIG(ssnpm, SSNPM);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
@@ -1009,8 +1015,10 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_f,
 	&config_fp_d,
 	&config_h,
+	&config_smnpm,
 	&config_smstateen,
 	&config_sscofpmf,
+	&config_ssnpm,
 	&config_sstc,
 	&config_svinval,
 	&config_svnapot,
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
