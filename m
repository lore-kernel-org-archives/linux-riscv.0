Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F3AC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ok512U0WFV/gT0LM4NDZ+yfEB00KM1h+lX9wIQgt/Ho=; b=oqtahyaJMChk7G
	e/NdE2wr/bLvAXrST2o26d2GpT4hOdmraYMYb2pY6nfTJA4r7H1CXnozNrwOIT3+QrvJ3XnHu5ha+
	r6vOqy7KqqHPwQfmecNT7C22c3mdz8PZVnwSIk33RasV6PJoSvTDnmo3xL2MYyRxDCiUUV2+hJawa
	l0DYIMpygjIyE6i1xfpooxbYvj/NAZ3/gmrOPgADe2kCrcG9VnrpBnl9j2ZZDrTZjTHb13Nmckujz
	VsyyOPOuLe1U+bzw1eAF2ULpwJUd8dni+MTwvype0R2mnaOyJWdZ6D7TcGgZP59YYRiL4kmPWr8xJ
	jeQ7PDPhT84F/rTwTZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8m2y-00BeNY-0V;
	Thu, 30 Nov 2023 18:46:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8m2v-00BeMf-0e
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 18:45:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a011e9bf336so179269366b.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 10:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701369955; x=1701974755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19SmYlxjNraGGWq0JnZDbDwFeLuwZTO6nO0m0aEnkms=;
        b=m+545f4crOUsYVnUZPlK/hFrRBrR/+51Vw8tydcD+4RtGFel+3eCvUrMmo1OxMacL+
         29OjKwZbccAarKxX4aK0bqzmPYAYoPyhSoBkVdlihTPm9JgHmmc+/ds9dxmJcgOnm++j
         UKtiOuhzdqnY6oZ1jZ/BvhysB2GoTIVx1BYgmfuetY9lbaZSLCCfGzTe6PyhfNEiDcDE
         oX8iUV9rIN+aXTGAYhvJfmCgupoDcg0OD57CJPH9aauLbww46BABTSdEi97//PbYlNq7
         zlIJ5jsB5p8RfNq9nzXgYKv8TrTUQoUq4VZfXmRk6KZodP8YwWKeS7CYdzgl2I2OGLfX
         +GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701369955; x=1701974755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19SmYlxjNraGGWq0JnZDbDwFeLuwZTO6nO0m0aEnkms=;
        b=nmJUmhSRFv4gbfm5zhD4snmQ4NHgG5QXT72cIj7SessjGXlKfjP8ClA84wXtB0KR92
         asaYAakYMDc3Qtaw0DFvg/VCIviU/P7GAu2wC1PyNOfO/82F6rXS+ducscTLIQp8FQAO
         /9MY3tEzVzfyIae3mOUz6B2nZ9ogYNM0NT6z7ZF7JMsB0uVBwl59dZTo2Xw/ScJ9Onvg
         yUSC8rZequpRL67dAsD+pXm1dmU+exOIygIZ1fA/QtqinAl7BLn2hFUaWMoIf2h1J53g
         j/kBmp7M4K4XWWM8wbhCEJWyIs+L4WZc/NoSfuIQVx3c/Dgs7rRh44+BN9MRCDZ07thc
         8pnA==
X-Gm-Message-State: AOJu0Yysw+3BYdfjXHyuZkHvOMroKAuQjQVRvjMktUq5agVZ9xNBiTOw
	oR+u9LRANbhtbJR4jbriemfMAmVD8lA2g41az9g=
X-Google-Smtp-Source: AGHT+IE4aof6vL5VH5D2L8zIFOfAXkDVpyhNifx71pybdpPdwelQbWx28pnTxu+znznNuti532xwig==
X-Received: by 2002:a50:aad2:0:b0:54c:4837:7d1f with SMTP id r18-20020a50aad2000000b0054c48377d1fmr14267edc.94.1701369348220;
        Thu, 30 Nov 2023 10:35:48 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ca25-20020aa7cd79000000b005489e55d95esm804648edb.22.2023.11.30.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:35:47 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH 2/6] KVM: riscv: selftests: Drop SBI multi registers
Date: Thu, 30 Nov 2023 19:35:40 +0100
Message-ID: <20231130183537.55203-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_104557_239477_E9185DD8 
X-CRM114-Status: UNSURE (   8.40  )
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

These registers are no longer getting added to get-reg-list.
We keep sbi_ext_multi_id_to_str() for printing, even though
we don't expect it to normally be used, because it may be
useful for debug.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 3ae919469c38..42c6244c8d6d 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -623,8 +623,6 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_DIS | 0,
 };
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
