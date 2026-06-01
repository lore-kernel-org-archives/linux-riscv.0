Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEE0CD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0i90NueMmHeYEYvqrYxex4h5wddsvGODANlCOUjiVlI=; b=XmYAxc+ih9pTok
	FWfMV3TkQ7Y7NikZr7bShz4CMwbEvrALuH+bfARkNXjgSACD8CRbd6bBbQavsQiX3UPkDnDbmiWtA
	pVvgnN9RjEG7s/15nZev7yIzQ/vt9cFeVi6fMshoYDUYM6bd2FDswWdC6J/XOj+km1edeV+Y4Ymu9
	fu089PWzoPuIXbVl9WUhHdCNkH6sC4hVo7LGIDswq6TvAnGytdajsoeYNthaPWZeFkj8jU5DR8l0M
	4b+0w5XINoB1u2XKnbB9y5w9LXSW4CE4YzB1Y768hvyvs4GbS/z6R3iTvc2MToadrPsZ/QzK2u4V2
	ygGnaIbWIiFkQvCNAmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFi-0000000AOEY-0SUh;
	Mon, 01 Jun 2026 08:44:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFf-0000000AOBo-0qQf
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf30d530bdso24806625ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303442; x=1780908242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSRGQKpWCLbV+j0YDeovxMcfa4aON74s/dnTPwpNiss=;
        b=QcvT0NvwPv/3eu5g7f0uuRFN+Yl4N/v9DPSVXvQqKSPY6hoDVjVC0Zc64UipQfdAP3
         6C4heGdJdbJcfd0hgaGT81EtI0nMvZmY+ywj7SVxGcc+UMvPsx1G+r0hO/BzFesuYx1W
         SPT/ya7hooRqRpl+u+JLxc4ipXq/Xbc0y8oizWaN1/ZWyNPSx1Akt3dr0zS8F+wpY1Fa
         BmEGZleBJJYihb+AzziZnLrbd3Nd5i9HY5vYXiFeoKRpo7bzrULSzAQ+aU1CGNzLCODA
         G3TKG9gsoA2dY+s+Okk6ZH8t4Shw1N0HjO5T7j5cJ015/rCt4gO6xsxJBByk05GoGe8e
         Yp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303442; x=1780908242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSRGQKpWCLbV+j0YDeovxMcfa4aON74s/dnTPwpNiss=;
        b=rpmBk74BmbX1lHP/dz6EpPSz/8fNz/Jmo64z0NLyDQQ+40+nJwo2I7aH7UbjJ5SAr9
         tfmOovVINtVxXpC02Mg4XNxMS9W0zQ81cUkGyE6X3shMsYx7mqk76ozWiLMByy1s6cSV
         bK9SS2rAuQyFuXWnjAE4zljAJ58DbwKKRTeUohTPXzyoh8jCEBIkKaGYiL814pcMH3IU
         yYA0e9AuDE/zPlAa+vszhTBQRpEPLTRSqAa2bX8VeC5MpgSiUBeJavtg0oRAO6eFOvTE
         4ex2OO61Mo0MAFCzUZPrx2vz1DQHOsBONQSjCFNtMq+aigXSsFVp7Q9wX+NDGcxEIQjw
         CJIQ==
X-Gm-Message-State: AOJu0YzJRfb93Izm2stJ4NL7RhE/5E9BAZMv1dcyRgFuH7EfaxmB5VNS
	CN5raNwVjSQYYsryCVitM2eapdOsEG9znXyfYONMhmiA+a97uvsVbRd4
X-Gm-Gg: Acq92OG77VvophWhh3JSPa+mXXAfBslhJ9JjFOlG9ZNdAQuinXAMBFEIn397xBvgCjP
	n71XQfJX8ZyOzKGsa8jlKUaijfM4oB63Byns+nGGZ5iCTZRo7MNJH21GkcS1TyiqXW6TjvT3WqQ
	xb8vTQpYNUNxxiPz+H3ltdPtxECdvvEA2fgZaE6MtvvLrmWSc0XCW5vxtDAN0JEp6N60o2APvGs
	gyxuUy2tm9zzmizAq/TrbdDCpxT6LZ0m9fAV9UTz3JFBN9K51AB4lhw6dDgnqnYl7RFztIXNLIK
	WAJOOntY37F0qp4c1Y7MlPjVfofNSpmxuJsOFYjEKoR+AvPbBnWBT1HvASJ3MtCT4QZjv1XqjlW
	Zf4TCuf8eIR2J5WhkoSMV5qDryjKn1xEJtauhNwdsXrlQPvtdic1b8mhhbdVUJ49o+MUTC4Ji/0
	dNjtsLmV/DFOi4ha5te+U+kvoKbxpYLipqL88XnBrAdRJe
X-Received: by 2002:a17:902:ea12:b0:2b2:3bb6:fbf8 with SMTP id d9443c01a7336-2bf367aa3a1mr120210065ad.16.1780303442300;
        Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c4dd4csm99949505ad.78.2026.06.01.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 2/7] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Mon,  1 Jun 2026 16:43:30 +0800
Message-ID: <20260601084336.2601675-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014403_310204_D069DAF7 
X-CRM114-Status: UNSURE (   8.71  )
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

The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6fdb5d38b8..d88edef77ccf 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -712,6 +712,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -905,6 +908,9 @@ static __u64 sbi_fwft_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
 };
 
 static __u64 zicbom_regs[] = {
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
