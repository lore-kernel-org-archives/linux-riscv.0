Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E381FC61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8yce3LN7kfkfmnXD1+YhLSJ7eRF7qNQJIav8fLBMfk=; b=cIfMvTrcjGsX3a
	4VOYPPX1C/ad46d0kQg70zxlW4a5Q+tm8RuRzGQLZwW3EwWQiGJ7gLFfnSK055PwMogSXbbuBgwyj
	KiZiUGgVaF6kQ/D6vUzFejqMYGcKcC7TPle4EKRthM9kWE6O1L08j4Xbcvqqs8Cb+nYbihiw5ctxD
	07efHzTGh69TJdKlc3QZhfQHmQUO2L12/EIS/tOPCeuIamsIcBYzZahxAmekFPiSaGOPR+8tAMLZJ
	AJkhzU2n2eFCIUocqo/P7N2SOR/j14LD+VCt+DoWxk1XBAH+94/f1bOa4qhL0KKAaUsWfZzTXwMv1
	C8nd9dCEvpvw9CGbuA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLURb-00G7Fu-Lo; Fri, 27 Jan 2023 19:31:27 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQZ-00G2aV-QT
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 18:26:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so9412760pji.5
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izgQjGebJOE3RdsQHdegT8RbHZUq8xzpqR3/LUH4GSg=;
        b=a9q6O59eBw3CpprTPbzQxW83Q7UrY2+lKmZmXjuTmVoRmWq832uyL21I+/u/2jlFsO
         bTlm0YBWf2ah/OxNoOPiZxfWIeGbfnN6qqpFy+vDApROfAjY7xLdi+oHeD5YAzXrntLp
         0iA7A84/LEUf3mVNSHCXRjpqYhD5EyLDz8/2zyHnDr7cKiUp7p2pzS596BsBKHsnBxAk
         G89h93eoTjPyxN8e6Txu2tZ0uIjZaYWgpUApxOIgGu3sq4yuNH7SSPIAbXdbH2l+GwV5
         PzoXrmBsDm+Di6HYC9puIB+BtcJFyZ4EposGAB4Xp8Pyn5GQ/BX/pp2f8FI38oYMDVU5
         OtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izgQjGebJOE3RdsQHdegT8RbHZUq8xzpqR3/LUH4GSg=;
        b=RPZgicCZWfYgWyV2ysLv9zARICYfx3fw9Ha8ZKbqGMacHM/+bQaQH0QHICKp8hNI27
         xzihkDIw3GXvGZtswTsO3yP7vClnzqOxnTzkrYrHpZgu7HEijPH5im7lk7qmas8iKUAD
         sE2F9FJORHu6zsXX9P1aELDVfq/p9X76/mzrptGwwWd2e5o9qViOLtyCKH0va2c+Y8xB
         kiefoRwzN21GZ8fAjXJGOlwM4qzhphIJsML6OjUeJ4kL9vN783ulXlrKKZUpx00Wldje
         b94Zi3qZ0Ef1V29hqyQ1sXr66wyjZBQfTSa1DTBiSLHlf/9rnDA84yMJTVKUlqnM6A7k
         gQsg==
X-Gm-Message-State: AFqh2kpmjqQM59EaXlSXoDMfkD74/oASwzYInODm7Zvy0XEafkPD+dVZ
	6x2AfUmc500EboDEzWXHaAdiRQ==
X-Google-Smtp-Source: AMrXdXvB7tRUnB3Hfypgm0M3o3xtG8B8LuON2IbfpnFe7fWjhVF0jWMVK4kOMJuFNqdvYFt/7ZMBfA==
X-Received: by 2002:a17:902:6a89:b0:194:88a3:6e28 with SMTP id n9-20020a1709026a8900b0019488a36e28mr38634507plk.51.1674843977309;
        Fri, 27 Jan 2023 10:26:17 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:17 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 04/14] RISC-V: KVM: Define a probe function for SBI extension data structures
Date: Fri, 27 Jan 2023 10:25:48 -0800
Message-Id: <20230127182558.2416400-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_102619_927239_D8CB7A92 
X-CRM114-Status: GOOD (  15.30  )
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

Currently the probe function just checks if an SBI extension is
registered or not. However, the extension may not want to advertise
itself depending on some other condition.
An additional extension specific probe function will allow
extensions to decide if they want to be advertised to the caller or
not. Any extension that does not require additional dependency checks
can avoid implementing this function.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
 arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index f79478a..45ba341 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
 	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
 		       bool *exit);
+
+	/* Extension specific probe function */
+	unsigned long (*probe)(struct kvm_vcpu *vcpu);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 5d65c63..846d518 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
@@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 */
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
 			*exit = true;
-		} else
-			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+		} else {
+			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
+			if (sbi_ext) {
+				if (sbi_ext->probe)
+					*out_val = sbi_ext->probe(vcpu);
+				else
+					*out_val = 1;
+			} else
+				*out_val = 0;
+		}
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
 		*out_val = vcpu->arch.mvendorid;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
