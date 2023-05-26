Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA19C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QH9viUHG3jUVc+mNreUQ/33TSwUyFRaFbbISBCxulTU=; b=Uy17NGUW13CsC6
	lQMaBUjnTwBbes1aldWvlsNkGRsQXQq/vm9SNfhx1pgujviGC0jzOGMGGYXeddYH3o3IVqpYvjtXB
	pf18zQ9TEYWimu1BOyUoE28inZuZScbJp/u3rctT633YiYLa+LtR6wHsxmaN1zqLicKUw53U6h4hs
	a/QPAmtcAOHnqc03yIYUwYb/kUcS2nxd9D0LB5eHIbhyKbEisZgkz5cuPAVXwjCTIrbOlUXERiLIU
	ceuqZP8vaCZME/Fu5Qp/+Q3zsnsyVl9ghJDjZntBlhCN7l8ZJfRSatX2sjfhJovOVPAPYk8VmD9eA
	BLvTRiY0lL0aCC7foyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udr-0020us-0P;
	Fri, 26 May 2023 10:25:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udm-0020rN-1u
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 10:25:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6dfc4e01fso6422225e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685096744; x=1687688744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkLPaM3OewarhprX7QkOl18kDZHht/2I105rvP66tis=;
        b=BBkVpn+AL7H9mCaDn6RynGdQG7RuhS5qTaLcqtz0rjw51c9D7GwVhLv+qBVr1iLMtO
         1KJxQQnoa8ZbKsjMcN4zj1E4iChjZJxILWOljcCnfSoM5A23dFTaU9f/78vc5HuJwZ2x
         bsAjjVr/uSaWKzKqf29Qt9uawI6Mn4UQOFfQDPjczMCO0O/DSh8nzEjUiOWmcIOwH8WS
         anBrmxEIMeXbX2CUTCvoMMhIvcbBXCdn91MdEtWdfJoARJF5Vzn/Y2Y7yz+hNe2Hk6+s
         PQJsKGHANsQCzC25142Lpi5Ck7htFfp7/QAdQ/bgQgSLb/I3SHtiJ3FtROAlYm0fkxzI
         x4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685096744; x=1687688744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkLPaM3OewarhprX7QkOl18kDZHht/2I105rvP66tis=;
        b=S2vwlyMv2CP4w9Muwk5NtsRjvHutYER6vMhzUN9Kzn/kvlvvNnmX9iTV9LqnuqplTs
         8CZQUDf7xLwaG2Et/uk9VdKs3o5BRyvdrvsAgsCNAHxRg3HYb4uh5fTv97p7J/pqLCYd
         ACo4J1xHLhBkL6RhEFY83jMSrbmk4VsGO71Ivz0TMOjTakLnV1EfNqkZ/ovEgJ0e0iZE
         2JPEwCczGuZWw/luPmY7YzXzbKlkaF2bcZ0dxigpe0y8ZkRvfttiO5pgCIALBSsTNRDx
         QSBFNa/0SqIA1zjLUzq1bdZWWlKe5UeNuek9qLMsjugGa4eOHs2C2PNORlb7G+GTLxNV
         W5jg==
X-Gm-Message-State: AC+VfDygUaz4KYAWlGrP3Uam/mn7eDXkZxBGlkesQH25ujucNxhyG6Sn
	IgOrafZ30yUQP20XmAqmEOkHV8k/8Xo0Cm8R6kg=
X-Google-Smtp-Source: ACHHUZ7Q3NH4OM1eh4Er7BLOO4AAcoiSCyhevsJvr2zWF8OvkvFF/ROLmR55D5Xe3Hf04zfT/DZVWQ==
X-Received: by 2002:a5d:58d5:0:b0:309:42d0:4c2d with SMTP id o21-20020a5d58d5000000b0030942d04c2dmr1025838wrf.28.1685096744223;
        Fri, 26 May 2023 03:25:44 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e13-20020adfe38d000000b003077a19cf75sm4719820wrm.60.2023.05.26.03.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 03:25:43 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Anup Patel ' <anup@brainfault.org>
Subject: [PATCH v2 2/3] RISC-V: KVM: Convert extension_disabled[] to ext_status[]
Date: Fri, 26 May 2023 12:25:39 +0200
Message-Id: <20230526102540.105013-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526102540.105013-1-ajones@ventanamicro.com>
References: <20230526102540.105013-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_032546_635856_3D0AEFC7 
X-CRM114-Status: GOOD (  11.86  )
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

Change the boolean extension_disabled[] array to an array of enums,
ext_status[]. For now, the enum only has two states, which correspond
to the previous boolean states, so this patch has no intended
functional change. The next patch will add another state, expanding
the purpose of ext_status[].

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 7 ++++++-
 arch/riscv/kvm/vcpu_sbi.c             | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4278125a38a5..cda99fc3d897 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -14,9 +14,14 @@
 #define KVM_SBI_VERSION_MAJOR 1
 #define KVM_SBI_VERSION_MINOR 0
 
+enum KVM_RISCV_SBI_EXT_STATUS {
+	KVM_RISCV_SBI_EXT_AVAILABLE,
+	KVM_RISCV_SBI_EXT_UNAVAILABLE,
+};
+
 struct kvm_vcpu_sbi_context {
 	int return_handled;
-	bool extension_disabled[KVM_RISCV_SBI_EXT_MAX];
+	enum KVM_RISCV_SBI_EXT_STATUS ext_status[KVM_RISCV_SBI_EXT_MAX];
 };
 
 struct kvm_vcpu_sbi_return {
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 6aa15f1b97d9..28e55ba023dc 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -155,7 +155,8 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	scontext->extension_disabled[sext->ext_idx] = !reg_val;
+	scontext->ext_status[sext->ext_idx] = reg_val ?
+		KVM_RISCV_SBI_EXT_AVAILABLE : KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
 }
@@ -180,7 +181,8 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	*reg_val = !scontext->extension_disabled[sext->ext_idx];
+	*reg_val = scontext->ext_status[sext->ext_idx] ==
+				KVM_RISCV_SBI_EXT_AVAILABLE;
 
 	return 0;
 }
@@ -316,7 +318,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 		if (sext->ext_ptr->extid_start <= extid &&
 		    sext->ext_ptr->extid_end >= extid) {
 			if (sext->ext_idx < KVM_RISCV_SBI_EXT_MAX &&
-			    scontext->extension_disabled[sext->ext_idx])
+			    scontext->ext_status[sext->ext_idx] ==
+						KVM_RISCV_SBI_EXT_UNAVAILABLE)
 				return NULL;
 			return sbi_ext[i].ext_ptr;
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
