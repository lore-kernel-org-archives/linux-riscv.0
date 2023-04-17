Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F89AC77B72
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWe1kVPfCAPBq/eTIb0zs/2zMOyJGLW8PREXJkFvJrU=; b=4FZKDEhaf/MptN
	u2rydOb71z5K1s0Ie98CgJA1BBbEi1oRaIVZa10Qao4AD/MOW3bBVZXl1KYlrS+sX60YH8G7cGShG
	cxFA/nrwI/1wWjyaGFl+3K7DXlXri4gTpQo/sHizyKUGaIGftmGoVaFCorSXfFsDW8Fip19u5oZV1
	zzCkOJCjaEAcHMYMiV2nsy/y9R32xVzMBkmw2k/ZqtpYQ2SPX7kU4zHdkYGcrT8/vP02UrcTZcajI
	G9mjMBjusPnjbbpZis3cd8beJz0bTHsOqkt2Pw3vXBzxkqFqrkVBGr5nwnKTlumRPP5pr47twsO9b
	uQBNTUm3J5hVrl4w9LHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIX-00G1Tg-2w;
	Mon, 17 Apr 2023 11:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIV-00G1Q0-1T
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Apr 2023 11:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JpoFBEIlxv7eZ7n6CoVPM/mRtkR3IaM5HNJVkEJtlis=; b=Muo8jyPetLFm4LbtwuEHBrrSBV
	ugB92ztQYnzOwP9rQK26Kg+wa1Ioz4Yfahynj0AGuZZ20LKSdi9HDS0OPCxC22Q4Ou9MMcYNLwN/b
	xL47lX9z/veXuOcwf7bRB9wffYXXEbbnpiD0YXjdvgMtONW8tAqwnfYO85Vf1TkSx9uLegDT0pvHB
	GpOPOLKxQdgBzpiXH4NkXI9J/IMaKbOgEtJvjcUbBkfzvFqEbnG8NRwVL69cvWnIxXpSqhfuE4gOt
	cWiea0j3ARFLNIJcNgkHq+fSvQISrg3OLIzfNWyzrlFP9nOOIg3DkQuwwL+yHq/wMHWSu+GDACyIg
	mO9A7dvQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBn-00HIER-1C
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:34 +0000
Received: by mail-ej1-x62c.google.com with SMTP id u3so10807027ejj.12
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727665; x=1684319665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpoFBEIlxv7eZ7n6CoVPM/mRtkR3IaM5HNJVkEJtlis=;
        b=DbiVCjQzK7KtWFyqkNmWD6IwdctV2+wAOvLYs5lMub8w7VaDzWr+Z4wKj8TQCOErcN
         hPfmIJchYOFVmH05glyMArHwSBmMljyQ+E1b+K6Eagme4CkwZ304RrwcreZMoM84i7wV
         psOCcqqgPGdMU7P0pVkDD7bN2dFAggJC+naellzmuCZYVT8JGeLIeS7P73B4cmU/4Awl
         5TKw3lRc/udh5SqdQ14pmPiodGgewmH5v8mERoAv/jTe4eeNi7WCUsK14pjoS6O0PrpF
         X8Zkjo8MkrQmFNjDmpOPGQS0DVzcNR0UTFJq0F1NVSfGCkW6sLaBX1d26NY3olOpNub0
         cG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727665; x=1684319665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpoFBEIlxv7eZ7n6CoVPM/mRtkR3IaM5HNJVkEJtlis=;
        b=Mb9Ko90Q9jsh6cFnr8/duyJ/T2sJ+kItvXpX3+FqZw227bnIAO0pZl+bMjBhpaA6rn
         eXUK6qOGCn89UEqbcasHB0XsLcSSavK4ywMx6kk6eHOtZKhCDsRkEmAzALQ+E143N64T
         pDdnPDGPWbpMWbXwedcB1rrsrFgU2+jpJc/IjXkaM30K7ZrKKqOzRhnzsC0AaXQFWo1t
         YEoKR+kA9XVEQPx6YQ/3KF2ugrMi/vTd1YWSs/F+PkO14tG3WfKBlU7v+PbSSHD3k0DD
         1mEfDALBLevGsgT1cY7AQHNCmerPqVZphj8jEdZ1Y6uJJ2LjCTKw7InB1hLVtEvQJV4t
         M3jg==
X-Gm-Message-State: AAQBX9dYHPdoVlB06Jl8ZmUj1iNHP0qtBkQfFmxBSBzFfdLJRHAnwSs4
	uLRw3YX7Kx4laqdY5vLoMZ7QGQ==
X-Google-Smtp-Source: AKy350Zzt1OYEcUGzCjbeGBO0uHpBnok5XOlT8XC0Wctd2oB0D1g2vjZZSxBC8Nkj3Op7V41sBT7zA==
X-Received: by 2002:a17:906:4d05:b0:94e:4523:b0d8 with SMTP id r5-20020a1709064d0500b0094e4523b0d8mr6218381eju.73.1681727665586;
        Mon, 17 Apr 2023 03:34:25 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a12-20020a170906368c00b0094e8de89111sm6340298ejc.201.2023.04.17.03.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:25 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 12/14] KVM: selftests: riscv: Add guest_sbi_probe_extension
Date: Mon, 17 Apr 2023 12:34:00 +0200
Message-Id: <20230417103402.798596-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_113427_549555_DE6FC102 
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

Add guest_sbi_probe_extension(), allowing guest code to probe for
SBI extensions. As guest_sbi_probe_extension() needs
SBI_ERR_NOT_SUPPORTED, take the opportunity to bring in all SBI
error codes. We don't bring in all current extension IDs or base
extension function IDs though, even though we need one of each,
because we'd prefer to bring those in as necessary.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h   | 21 +++++++++++++++++++
 .../selftests/kvm/lib/riscv/processor.c       | 19 +++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index d00d213c3805..1c6908342f22 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -99,6 +99,17 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define SATP_ASID_SHIFT				44
 #define SATP_ASID_MASK				_AC(0xFFFF, UL)
 
+/* SBI return error codes */
+#define SBI_SUCCESS				0
+#define SBI_ERR_FAILURE				-1
+#define SBI_ERR_NOT_SUPPORTED			-2
+#define SBI_ERR_INVALID_PARAM			-3
+#define SBI_ERR_DENIED				-4
+#define SBI_ERR_INVALID_ADDRESS			-5
+#define SBI_ERR_ALREADY_AVAILABLE		-6
+#define SBI_ERR_ALREADY_STARTED			-7
+#define SBI_ERR_ALREADY_STOPPED			-8
+
 #define SBI_EXT_EXPERIMENTAL_START		0x08000000
 #define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
 
@@ -106,6 +117,14 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define KVM_RISCV_SELFTESTS_SBI_UCALL		0
 #define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
 
+enum sbi_ext_id {
+	SBI_EXT_BASE = 0x10,
+};
+
+enum sbi_ext_base_fid {
+	SBI_EXT_BASE_PROBE_EXT = 3,
+};
+
 struct sbiret {
 	long error;
 	long value;
@@ -116,4 +135,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+bool guest_sbi_probe_extension(int extid, long *out_val);
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index de67197ee848..c8f4f666e3f1 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -393,3 +393,22 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 	return ret;
 }
+
+bool guest_sbi_probe_extension(int extid, long *out_val)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
+			0, 0, 0, 0, 0);
+
+	GUEST_ASSERT_2(!ret.error || ret.error == SBI_ERR_NOT_SUPPORTED,
+		       ret.error, ret.value);
+
+	if (ret.error == SBI_ERR_NOT_SUPPORTED)
+		return false;
+
+	if (out_val)
+		*out_val = ret.value;
+
+	return true;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
