Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29F1C44501
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlWBcfddeb7Pwfm7hdTxhZzrQip8ZmCiAOUUwHdxFuA=; b=QNvLgrAbRx552Z
	k6f8rDPjwdchtNS5F28oQD027tvAt54yVA76/CAyhELIuUfAFjris+lvqSY4UDDQdtPisYiJ0IgJq
	XxtQj6Xrq9CJO2uMZjuEp9XhVJNb05MZle842oHmH9GjeGw1e3YIc9LHy14SfgvaaWpvEWxjOaDsI
	Vq+3GhJnDBLcK4/mVilpjL9LH0M6o2eBOhgL4Kdv22eaH5OXBGbLnnih9ajnKIbStbtlLDOWsuffB
	pFmjmZQnenSPjOKwqV2a30bnM24P+O9yglnwTvX8FJz5Hn7f9LOIdwNlqMqgv82WidNAWbHgpJgT4
	Con6M+HmaKHS1GnoXp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5s-0000000GGFD-0feE;
	Wed, 08 Jul 2026 03:37:04 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5P-0000000GFiF-2DCp
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:44 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c999f162c9aso88281a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481795; x=1784086595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQP7Zg98ed5QAQ3p607k58/RvHAX4L5abtdMGBqW+Xg=;
        b=djM3WRXmsozQ0irz9TAjI/ELKFyRNT9Su2wLMFRcb1hBwzKlEzHYTFuuvlDpDi/Aag
         8uwRg8lSRm5EvpMiLtKfVsHwj8tkLqV8Ef7dwfV9GnfZaer5RNHoMX5y2xcUTq+yUy71
         iYIzcjtpfm5EQj9gmJMOLuBdAO1qhgucpAOpEZU9JsKQ6PR1z73de+6BTnheGJjbJiOo
         pwUcU7nPD66FIhJhuFBnQDPF3+4ikUnqx1El8x4GNlwiOBePrlTlucfEC+qKfRPmuAZN
         fjnpObUtJjB9EHDFHrnj5TR9vc+SeTFfsOA2+LToMrEfzwYKbPOG5Ddjhhyk1Dm7cxrl
         IWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481795; x=1784086595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQP7Zg98ed5QAQ3p607k58/RvHAX4L5abtdMGBqW+Xg=;
        b=S98Cbp0Jj7gplWsVpE6Bs0G1QLO5VW2TihPvLReQH2yChRxGERqBUU/BeIeuwzG6Fq
         jPN/oyDM9I9+b1VbjI+7OvCwHXjoZ++1UhXBX22yTaiEdm2h+OW0/rIBfL4uFgs05n1m
         +Z53JgtlE1YokRm/0+rBFwXNxJgkUkSFiDaoSudiN+FT1Kyd+P0fRxSyJY99uEhiSupX
         Gu5WYJE00O479SWel1EfakLWoSKw1TwmrwPkvXhc/qFlwmjdEx7+1b3HYP0M1uPq1rYY
         Lm/hF/AAtKekFYEh2lU9NakJvjDT3ACWvG55MpGRr4C15ZaMyMQxscMd/oHfYs7ZD5EB
         n9gA==
X-Gm-Message-State: AOJu0YxzKwYxn66l/0QCf8LZ/UYxquHeTXIZ9Ft5/BLH/nmhfT6E1d/0
	YvVAx+l0HTpne7htnuoJHs6sS1/2/Pzl00Wvo7XZPyD00MaH3NOUqj/l
X-Gm-Gg: AfdE7cl1aIGT0HpqU9IyvVRO6c9Kgwik2SRPHMtw8ylM12prjGnuEp3n/mgD88Eci6Y
	IWfFIeQuRUjHYolHxVBKP2J4ZwnsXEEzuuI5mA7E5WKMhE0EyGJ28f0OCoo5t4cCNYHAi6EvwWG
	AG6eKbaULuyqNUAXXli106RwGGrDHlQv5GEQ+POI9KHlU1C6UYi/vfkJXwh2IoIBeGqLZcNMWcJ
	TlvAhEdr8Ws4t+2Yvtkm0ngnqFFjMTXXUbHz7VDf2kdfZSMCzEKiJZ4wncLCx8yLJEV84kiA5Us
	F79qCE595838U18XPYji5hrURz+PQSLMoFDckE7NsbOEnuZ5TH1WbxxmVh7pZKctEx0T5C0lzwy
	/Nu+83fgUfa1hTZ7Ujd7MPhp4hCSd16BSrgN4Y6pFQ2Q7hyKNy3ppd+bQ8W2+lAItuUlHlnRsqP
	6iYCnDC/UIlXnxggnn296r+HnfnBdq6k2RD+kI4Sg=
X-Received: by 2002:a05:6a20:12d0:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3c0bc8c3838mr706484637.5.1783481794544;
        Tue, 07 Jul 2026 20:36:34 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:34 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:32 -0700
Subject: [PATCH v3 09/17] riscv: kvm: Use generated instruction headers for
 csr code
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-9-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=3063;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=8h6OBVit0ds2zZ8RVCdpLv2LV7rJmlpswIauG6njnhM=;
 b=nvPyCvQ98MT+LzRjxR/eVGC5foeEGKAjYI/KWit5kqNp0b4lsnz1ixztK11IvVWEoTuM2qj9P
 MpHVRzte8/HCD0KZ4tfz44btH0dFJxu0tvHmYpcZ8QBhsv3AvWMzkeH
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203636_017469_812DEE7F 
X-CRM114-Status: GOOD (  13.81  )
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

Migrate the csr parsing code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This is a simple transformation that I have again validated through
brute force.
---
 arch/riscv/kvm/vcpu_insn.c | 50 +++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f09f9251d1f0..a1898ab8bbe8 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -144,45 +144,49 @@ int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	return 0;
 }
 
+static inline unsigned long get_reg(struct kvm_cpu_context *context, unsigned int rd)
+{
+	return *((unsigned long *)(context) + rd);
+}
+
 static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
 	int i, rc = KVM_INSN_ILLEGAL_TRAP;
-	unsigned int csr_num = insn >> SH_RS2;
-	unsigned int rs1_num = (insn >> SH_RS1) & MASK_RX;
-	ulong rs1_val = GET_RS1(insn, &vcpu->arch.guest_context);
+	unsigned int csr_num;
 	const struct csr_func *tcfn, *cfn = NULL;
 	ulong val = 0, wr_mask = 0, new_val = 0;
 
 	/* Decode the CSR instruction */
-	switch (GET_FUNCT3(insn)) {
-	case GET_FUNCT3(INSN_MATCH_CSRRW):
+	if (riscv_insn_is_csrrw(insn)) {
 		wr_mask = -1UL;
-		new_val = rs1_val;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRS):
-		wr_mask = rs1_val;
+		new_val = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrw_extract_xs1(insn));
+		csr_num = riscv_insn_csrrw_extract_csr(insn);
+	} else if (riscv_insn_is_csrrs(insn)) {
+		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrs_extract_xs1(insn));
 		new_val = -1UL;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRC):
-		wr_mask = rs1_val;
+		csr_num = riscv_insn_csrrs_extract_csr(insn);
+	} else if (riscv_insn_is_csrrc(insn)) {
+		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrc_extract_xs1(insn));
 		new_val = 0;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRWI):
+		csr_num = riscv_insn_csrrc_extract_csr(insn);
+	} else if (riscv_insn_is_csrrwi(insn)) {
 		wr_mask = -1UL;
-		new_val = rs1_num;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRSI):
-		wr_mask = rs1_num;
+		new_val = riscv_insn_csrrwi_extract_imm(insn);
+		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+	} else if (riscv_insn_is_csrrsi(insn)) {
+		wr_mask = riscv_insn_csrrwi_extract_imm(insn);
 		new_val = -1UL;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRCI):
-		wr_mask = rs1_num;
+		csr_num = riscv_insn_csrrsi_extract_csr(insn);
+	} else if (riscv_insn_is_csrrci(insn)) {
+		wr_mask = GET_REG(riscv_insn_csrrwi_extract_imm(insn));
 		new_val = 0;
-		break;
-	default:
+		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+	} else {
 		return rc;
 	}
 
+	#undef GET_REG
+
 	/* Save instruction decode info */
 	vcpu->arch.csr_decode.insn = insn;
 	vcpu->arch.csr_decode.return_handled = 0;

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
