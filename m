Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBE6CD6E62
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8cQnYKMnJdsncfjnP9FFusCIuKrBqoXHxLNJ8njWH0=; b=I07J8Xo4+o+Se5
	arhcVgLy93EIz7Mskn98DLHWBw2oh9e3Dkg4OL9nHlh8b6RXu0k8Kz0waaF58tdvcPoLsGw+hBNaF
	zzdhyRyWvWCIO4Bla8xQlFWty0M0MJ3dijVYwi6EzDlOt8KegNbZw6qyRX4EXkCvd+8OfIf47dIua
	CqGaFiq8SgxTCn+7dyhur92QXrvUcM0vmUEKybb3fDDwnA2mTtAr0b7HI50gK23w30sXW3CUhDOtV
	Cg8Y3A/EPogtqhcSYjEICKnWWdgPq5Jimg6RKUGIJtGtlnpSkfupynjgHZcdy4PCYa4E3uDTS3JxJ
	dMHGCQ1Rqwq+3VEtUjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFl-0000000AOHN-1Gm4;
	Mon, 01 Jun 2026 08:44:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFi-0000000AOED-1NqV
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:08 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8423efad617so427061b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303445; x=1780908245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiMpL3okPlrr37XPCPDIwMU1jHFLDEyhgttQYYvX9pI=;
        b=fos+KWA1Y7H9PYnSm6OR5CpUyfOy5Zy92B4KW1TIHq58TdNwLY/WLOnnhnxoZXeWS1
         EuOq9fte6nTDLhXf6JREWYqPpoblwhuJKeKCpR79nSPVzkq7/aWpVat6dbxtw4Ecytwp
         y0/5vpJxuJ1DS2djgNa3AB8rHJ0Si6qo/5v5s5PO9j32lOoqHStW6QhVDXYckacEgIRd
         Hn1dNnOmNnRhWoYBcjUQXGzbwwaepS2bxLToximReVDTUrlaBJtuwj0mNe8x1Motx/xf
         XGUXovWYaPhvK09R1pycAt87OZQiqQMEGk2FvCotkkDu/zwZAVLD65tdu+kZL+ORzuqz
         dnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303445; x=1780908245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RiMpL3okPlrr37XPCPDIwMU1jHFLDEyhgttQYYvX9pI=;
        b=WU/p2KTnNXwyjcOhh8UkGOa/a0ji+WNLgsShFBaHYoAGH77aGCFbJuBhO89SPJ/LUC
         Ox+yGY6sru0lS0OBn0DDpz2ZLqP40mZ4diUqbtOPsUdUJRfE6ufUBD06iF4d4UmR1yud
         IpVNNBjvHMuhcSDi10qdGjdgsXcfKkVnnWdq8JiCXu+WZsuqzB0pjhFNfssi2ZwddbLT
         MTXK9D/6AkUbtgLnKFfYeZtJxTUe7ZseARasc3x5CWj6wjw/LyGZnBEHREWzJuRE4cgf
         x2VlBygkJjHh3wgfYAT7831koEUIQS+8Q+/FpdjbZwE1EPUv/xQg72KuW2hqHR3/b8FG
         tR9Q==
X-Gm-Message-State: AOJu0YzmJRJAeLhSM3gARHi52ewC83QXf8XYw+ErNNs+fTsGSapJAtbP
	/HSBBe2xpXfRYlgqkgIc/Gj6TZSec27al2DeJtChRiloZBKt4pd69mp4
X-Gm-Gg: Acq92OFUwPZ/RByP7+3gwxs0pmqB2FJFSPI0Ejbao3u1Ae7agZWvS4yrg7OZoGaNZNe
	fB/ENJAFiHYR2InouS99ZcXFe6LxnE2PQu9dc+dieXivrbqyErEH8zxnKh3cq9p2PWfSqJDpr3C
	y4MENLvHwsnerhnMA26fvQkcxcK++qufouV1SXqkMpx0ddPA93jgCtEVukvouFLyB9QxoJTsvMF
	9+FalvP4VJn2MPvl1u2+s53koLAoU5qUH37z0FEjjjfz5fLNVC1GK850TB9l8KNdL5lSMo1uy07
	+mG1yJwsGsImQGDIKiLQx/3ughy8Qh9VpBJKH6e3QmGhXP3bcM0C3akIMXv4GNlR51rlaRfo5X7
	haZaWF8n7ZnH1r2SZO0o2M5LTOkfmnX9bWd7WSzDe5WrPSvfWQ1/vnp2YSc5kSlnRMHw184XVWh
	qBfQEWbyG4CubIDxDEUPrskjNtOAw5T4Zfcw==
X-Received: by 2002:a05:6a00:3982:b0:822:6830:5900 with SMTP id d2e1a72fcca58-84225320cd2mr9410764b3a.6.1780303445292;
        Mon, 01 Jun 2026 01:44:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe1dsm9556085b3a.1.2026.06.01.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/7] RISC-V: KVM: Only enable Svadu extension when Guest/VM requests
Date: Mon,  1 Jun 2026 16:43:31 +0800
Message-ID: <20260601084336.2601675-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014406_421475_6621FBBE 
X-CRM114-Status: UNSURE (   9.16  )
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

Since the Svadu extension can be controlled by the FWFT, there is
no need to enable Svadu at startup. Only enable it when it is
requested.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_config.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b2a1028106d5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -53,10 +53,6 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		cfg->henvcfg |= ENVCFG_CBZE;
 
-	if (riscv_isa_extension_available(isa, SVADU) &&
-	    !riscv_isa_extension_available(isa, SVADE))
-		cfg->henvcfg |= ENVCFG_ADUE;
-
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
 		if (riscv_isa_extension_available(isa, SSAIA))
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
