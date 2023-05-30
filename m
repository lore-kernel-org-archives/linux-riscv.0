Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD42FC77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTfdbDzHyY9HJ6wZj0dOCGIl6kf0jXR0QV+ymJhttlg=; b=U0IKDxHYTBGXgz
	xUGwKxwnDwJ/7ITyBtgPnn1oAry/xrYh1OcLoPs1g0bqPzBOGlglbU8s4/Oy12E+r3UGOqqMlhO4W
	/1o/aUyOovDAoGN18MLhs9vKA7r8f1qZkRn/kg+Jvu175wKYKliRC8+GfpBtIuokpvaN8XJ6yBiZy
	qYRDuVw8ONIzNESGF1fUlW+fscCSLeHhl67KE3s8B8sIfsZ2YuhyMq8yn8fiHfwOenSHSHyu1rE52
	WsfUSe6aZzleLnVXfLKHZ1PzS1j4n4Me3RFLYHD480xG+d8gJ9khEjDst4ErQHhL+IugyrmIY1jjs
	ddzaU98Q+k3qsQ/DBCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UY-00EnsD-39;
	Tue, 30 May 2023 17:50:42 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UU-00Eno1-0S
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:50:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5148ebc4b89so6943481a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685469033; x=1688061033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVt7iTT2D9wqVUs//SVQEPcNAwHSQ8ygr6CC6S2Y9lw=;
        b=kzpnY31cxlNAe/57RgcF4IjeA9RvspdJtTQefBUizKG4XQq63OehMCmBOKZZnyExQt
         ERSDnY/+Vcm19h1Ene83NjxGSQfILYd2aq0htrXca5hXQsD6BtP6VRRLPJxgIUBUI0oR
         uGtBEOMewybcqQlgyeO6cmRAaDeujWx+GDEfEWvJe+E9gx14xdgjctwiSHTfmdwQtWA0
         bbTVapnT8ulCvFttOHU/lGsPrMTX3z3CZWMVTxh31OMwIDnsawlnmx22K/G7QjuGlOql
         REp8h1rfn8Ar2uLc0o54lL5Syg1nzpgLCWN0VnxaRf64QcpPV/X/uANMtLLGAQZG+tNZ
         s6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685469033; x=1688061033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVt7iTT2D9wqVUs//SVQEPcNAwHSQ8ygr6CC6S2Y9lw=;
        b=g7Mwdb+Dp7yALG09bokMkIYreLIAtmOGIk7h5Ylk1ZhTlPgoC0gm4vdY1SaraGRAwC
         hDkfLQ52U0RoUQb55EsZGdbVwWzmnNfTY0qRLpWjlw7L2Jkoa0CrUGhj5vLjjQhwpYIT
         ZpizkSQ3nWrqdkzrIGJHQ5H3R3XenptDjf+AIU6ISJXaFaWz1KfhEOwCoHhnzUu5nAXK
         dvWmCXo9bIrVoaMZhAoDqR2QaTx3szGfdIas/BzYmzvM4/ZfpR2/Z/AEaFjrKax+Ug6G
         jOmBzPAYS2m29ipSrX7o26D58dKyesN7kK1RhPEidZ3tuhv9gadQKD2MogA6t1sCPjjh
         ye0Q==
X-Gm-Message-State: AC+VfDz49HcD0cZlYU6d8bfFQezSYolACwsEBvtjuJuSqQD8xmENK3Qg
	VLrP9JeQ78pWW4adzIY8uQLDKborXTbiHJu6jkY=
X-Google-Smtp-Source: ACHHUZ56RnFfZP/P7r/GoZ1GFMlsf+mDdP88CdexCpoJi8iv2Pn5pihOYHyzlS9COImJzkrXfp/E2A==
X-Received: by 2002:a17:907:3f1b:b0:965:7fba:6bcf with SMTP id hq27-20020a1709073f1b00b009657fba6bcfmr3198779ejc.67.1685469033400;
        Tue, 30 May 2023 10:50:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k17-20020a170906681100b0096f7105b3a6sm7586539ejr.189.2023.05.30.10.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:50:33 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [PATCH v3 2/3] RISC-V: KVM: Convert extension_disabled[] to ext_status[]
Date: Tue, 30 May 2023 19:50:23 +0200
Message-Id: <20230530175024.354527-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530175024.354527-1-ajones@ventanamicro.com>
References: <20230530175024.354527-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_105038_179358_AF1F5996 
X-CRM114-Status: GOOD (  12.13  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 7 ++++++-
 arch/riscv/kvm/vcpu_sbi.c             | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4278125a38a5..ad1588d6064b 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -14,9 +14,14 @@
 #define KVM_SBI_VERSION_MAJOR 1
 #define KVM_SBI_VERSION_MINOR 0
 
+enum kvm_riscv_sbi_ext_status {
+	KVM_RISCV_SBI_EXT_AVAILABLE,
+	KVM_RISCV_SBI_EXT_UNAVAILABLE,
+};
+
 struct kvm_vcpu_sbi_context {
 	int return_handled;
-	bool extension_disabled[KVM_RISCV_SBI_EXT_MAX];
+	enum kvm_riscv_sbi_ext_status ext_status[KVM_RISCV_SBI_EXT_MAX];
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
