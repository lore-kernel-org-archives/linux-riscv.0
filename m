Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0C1C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYD2oJu0KVL8IWJn8DzGrXMGpqqi3zj7T4imzT/CMEw=; b=WE10suihHLd+Kl
	ISzKi2OoJ7GwZjVqncNe44QfPD2oF3E3Y10skHA8qti37t/qr29fQlHlU3q082kuic7EG1SBpU8Ie
	FBbjVOO7X/51LRkj9ddQ04krzXkbMLXhTwoIlmYoBi4zTgiNJyaY7We15rqY1v7B2tyYJ22z/Gzv0
	NJObC4s0vB2oarkV0AhACvC9Wopq5TtKLiyaKHC2KRAQj7SRCTvOZ9Ancpkvm3gxawGJQOKHqXbwN
	fS3ZVBToi0zNMqc/KURh6TupgXAetlPH0+oTP+ctg/s2MPp60rrk6jt9n/n3S8NEK6MmWYHwtI9kn
	PuWhqL0u4Ln1j5o2v5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prii2-004UIW-02;
	Wed, 26 Apr 2023 17:13:38 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prihz-004UFd-0J
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 17:13:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94f3df30043so1190099966b.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682529211; x=1685121211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7yo9bVha72+sBsBMxWgYP9QvranjKNqfZXNxICaThQ=;
        b=MPmqSKrXYajpwKmF09ub/E/fmIyqOKAtEIEHMcQgftfTlzz3dE7egtDNQsu4MkvJgY
         0Uu3jm4F/c8CNO/JhbUSqMNL0gyq7J2JEzhPzhZPbCWhXeQPyYH42YzzLfEfZiRU8XsJ
         7bkJeEFvcz9j/+PSO3+DZWZvLoclCkOB8x1TR8YwgAup6mgYAbeElr2yUPIQSxzjiPWW
         becQkDSMBmfoB6PJbBD7SQnjIWyBV89EvNAq7YdLW9VJf+2PzZxxjcYm4JKR/IED0iCD
         1VNBwtWqOWjArFKnsgYwmAu6lPt2SmJO6i30ZgTC4UYV35Oy3rjCa5a/tEtYPNFNdGzr
         wY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682529211; x=1685121211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7yo9bVha72+sBsBMxWgYP9QvranjKNqfZXNxICaThQ=;
        b=UX7sd01JnGaje2lG8wvqyE3Bem1Ps9YYUndhDbi4Rr8mUlMgFNfra9RC4lJMoKs7N+
         t27Qif8tZk90n0YetwlVUBUz6YKjS0QmE5BP3bxGEEZB1eu+lInJYG5u9McipmV5s2Js
         goHVWK/oBWxeQMIMrZ0ihkpHfC7IR2E+j8qsYrFyq+qId2vMAznVrPyyODg6dpmDZUXf
         jxtUEXym2wXI5MEMwNY07XKOnTscboKacdSvTvXfuh1WX2zL1To/Z7VqherI8WDw7odC
         L62oGYUihJneax7LJ1Paeg0LzGmf+01f5vfM83wmUIlNUecAm40OOwKmekOGmH0QDN1O
         ipHQ==
X-Gm-Message-State: AAQBX9ewzsBjUyh2PjNPhuL07TnGyLKnccdyD3Ad9ZeGjaRFYewkpYt/
	jjOO0Jrw5oyAxDx8nAeVTqiCIg==
X-Google-Smtp-Source: AKy350aaKoi8HMKrWXAUe1fHTi6e79Y8RGbYHQx5TQvvIGBDEf4tI9h2sruZT0i8Y3uFTnjKQ600bg==
X-Received: by 2002:a17:906:280d:b0:94e:fe9a:f617 with SMTP id r13-20020a170906280d00b0094efe9af617mr15897714ejc.20.1682529211348;
        Wed, 26 Apr 2023 10:13:31 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id vf1-20020a170907238100b0094f71c73d35sm8641759ejb.145.2023.04.26.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:13:31 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>
Subject: [PATCH 1/3] RISC-V: KVM: Disable SBI extension when its probe fails
Date: Wed, 26 Apr 2023 19:13:26 +0200
Message-Id: <20230426171328.69663-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426171328.69663-1-ajones@ventanamicro.com>
References: <20230426171328.69663-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_101335_133201_7296EA06 
X-CRM114-Status: GOOD (  12.32  )
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

When an SBI extension specific probe function exists and fails, then
use the extension_disabled context to disable the extension. This
ensures the extension's functions cannot be invoked. Doing the
disabling in kvm_vcpu_sbi_find_ext() allows it to be done lazily
on its first use. Checking extension_disabled prior to probing
ensures the probe is only executed once for disabled extensions.
Later patches ensure we only execute probe once for enabled
extensions as well.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index e52fde504433..aa3c126d2e3c 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -307,18 +307,25 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid)
 {
-	int i;
-	const struct kvm_riscv_sbi_extension_entry *sext;
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		sext = &sbi_ext[i];
-		if (sext->ext_ptr->extid_start <= extid &&
-		    sext->ext_ptr->extid_end >= extid) {
-			if (sext->dis_idx < KVM_RISCV_SBI_EXT_MAX &&
-			    scontext->extension_disabled[sext->dis_idx])
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+
+		if (ext->extid_start <= extid && ext->extid_end >= extid) {
+			if (entry->dis_idx >= KVM_RISCV_SBI_EXT_MAX)
+				return ext;
+			if (scontext->extension_disabled[entry->dis_idx])
+				return NULL;
+			if (ext->probe && !ext->probe(vcpu)) {
+				scontext->extension_disabled[entry->dis_idx] = true;
 				return NULL;
-			return sbi_ext[i].ext_ptr;
+			}
+			return ext;
 		}
 	}
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
