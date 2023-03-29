Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF1BC761AF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 04:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+dFR/Sq2DedrHg3WxDfJ/MSTsBvsypZOhz7mH6wtjc=; b=CN7zr08AmkrGyf
	5kdqO5vaKgzpXf1CyUq7SE7ZVikK3IOti5VzEcbXLRYLdODPdxIeQbuWi9RRNXIQYg1mCrOH8hU8v
	ZH+cgxDuO8oAs1odvr8oXVzQii4iO0cOgO996I5SThi0LwNSmDV/fiT0OnMewhuFwEoDNdhNKa4B0
	hgE3wAmJxBBnbalViwfCSkskqnVWqvnGwGJmduKSxGfiARzPepkiGWg2X6fkLZVmL+XkkNP9Psr8+
	ZGX5/mfSVYS44G4ywvOeW+8GfvR/IILJtLDfDq7363eIm26oc1DcT466kDdQO9kKQIkfu7/DE6rvz
	hP3KHlXsc5IKoJpFPj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNuT-00GcZ6-01;
	Wed, 29 Mar 2023 04:59:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNuP-00GcYJ-2e
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 04:59:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so10648725wmq.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 21:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2nyBWkEl893cb8p3Xcv9ddibZeqm3dx5h/n4mJzM0I=;
        b=a+A3vmtN33rV7G2K+kBT5+09RNfw/x9RSy+q2X3PBbr29xgkn5AQt12Fbediy1rrcC
         iHU5gwK6JXKuap5Q1K7ZWEHCpYah/bxgqzwBr1yWkZ7mh7r58y1ARcbbZcV8tzEpyFZf
         VDgXJr/tDJG2F0g9ahkj0NkZFJvy+ATuc/EtdJZvDtU/skKpBzTkNMEHgFcM7dZ0S8Er
         0eHpqVt7Wim1e1rCAGgxA04h6ZrRWhIYTlP6NK+v9auLZyoJkLfTpVcTWrSdLfMq4V8r
         hjcdeqmxZeOMiEHhoNumsB/hafrv2w9DmhB2P7mDfgctEKEXOeNUvMmKfuAJRA7CSlDX
         2FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2nyBWkEl893cb8p3Xcv9ddibZeqm3dx5h/n4mJzM0I=;
        b=vOkdxPIf/FPDYmOmcMVbGxBYUD8F2VNcmDmKSvRJu3sUTZBn1QjieRJqmh0+6iLTRc
         U6y9dgV7r6rEyZuCFqNU/h9m5l/GWspKwadpGOIRs9fg9gZepOr6v5b4QFDRPn2c27tL
         xOqswV1kNP+RxaKRRbhEe+2bIrhiqVYQSAshvOrr8rU4jtTSz+oG1WpBDGcVaBshR7Qq
         kLb81LC3/knuqhoW3n+dOf/ojGPcWZ2jfUk9jQ8juMLI2tX3mEP7LdGUCYFQnFyytmBW
         7YhXzB6lujo44s4AekK5WxTDBa7CLeovhkRHk+3i6W+X8G/8VYvoHbfxXRF8dukAKFcK
         zpfw==
X-Gm-Message-State: AO0yUKUcNpgBp6tLFcAsThc3Jn28R4S7QmQIgDVP7iKjHoWkX0CnNxRs
	PF15wngIhw2kTUvOxkFvs8lS2+mWIQlr7l4VFC0=
X-Google-Smtp-Source: AK7set/hrrFzd6yhsYIengKEXesiDvT2OHC1fUfzzUtI8h99/a73zFv/Utk9ctYdbI75FCHmhSsncw==
X-Received: by 2002:a05:600c:209:b0:3ee:282d:1016 with SMTP id 9-20020a05600c020900b003ee282d1016mr13218010wmi.25.1680065980323;
        Tue, 28 Mar 2023 21:59:40 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q18-20020a7bce92000000b003ef71d541cbsm842566wmj.1.2023.03.28.21.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:59:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 6/6] riscv: Use --emit-relocs in order to move .rela.dyn in init
Date: Wed, 29 Mar 2023 06:53:29 +0200
Message-Id: <20230329045329.64565-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_215941_859537_2683B70A 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VG8gY2lyY3VtdmVudCBhbiBpc3N1ZSB3aGVyZSBwbGFjaW5nIHRoZSByZWxvY2F0aW9ucyBpbnNp
ZGUgdGhlIGluaXQKc2VjdGlvbnMgcHJvZHVjZXMgZW1wdHkgcmVsb2NhdGlvbnMsIHVzZSAtLWVt
aXQtcmVsb2NzLiBCdXQgdG8gYXZvaWQKY2FycnlpbmcgdGhvc2UgcmVsb2NhdGlvbnMgaW4gdm1s
aW51eCwgdXNlIGFuIGludGVybWVkaWF0ZQp2bWxpbnV4LnJlbG9jcyBmaWxlIHdoaWNoIGlzIGEg
Y29weSBvZiB2bWxpbnV4ICpiZWZvcmUqIHN0cmlwcGluZyBpdHMKcmVsb2NhdGlvbnMuCgpTdWdn
ZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+ClN1Z2dlc3RlZC1ieTog
TmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L01ha2VmaWxlICAgICAgICAgIHwgIDIgKy0KIGFyY2gvcmlzY3YvTWFrZWZpbGUucG9zdGxpbmsg
fCAxMyArKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUgICAgIHwgIDcgKysr
KysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKaW5k
ZXggODYwYjA5ZTQwOWM3Li43ZGM2OTA0YTY4MzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvTWFr
ZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQpAQCAtOCw3ICs4LDcgQEAKIAogT0JKQ09Q
WUZMQUdTICAgIDo9IC1PIGJpbmFyeQogaWZlcSAoJChDT05GSUdfUkVMT0NBVEFCTEUpLHkpCi0J
TERGTEFHU192bWxpbnV4ICs9IC1zaGFyZWQgLUJzeW1ib2xpYyAteiBub3RleHQgLXogbm9yZWxy
bworCUxERkxBR1Nfdm1saW51eCArPSAtc2hhcmVkIC1Cc3ltYm9saWMgLXogbm90ZXh0IC16IG5v
cmVscm8gLS1lbWl0LXJlbG9jcwogCUtCVUlMRF9DRkxBR1MgKz0gLWZQSUUKIGVuZGlmCiBpZmVx
ICgkKENPTkZJR19EWU5BTUlDX0ZUUkFDRSkseSkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFr
ZWZpbGUucG9zdGxpbmsgYi9hcmNoL3Jpc2N2L01ha2VmaWxlLnBvc3RsaW5rCmluZGV4IGQ1ZGU4
ZDUyMGQzZS4uYTQ2ZmM1NzhiMzBiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlLnBv
c3RsaW5rCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUucG9zdGxpbmsKQEAgLTE1LDEyICsxNSwy
NSBAQCBxdWlldF9jbWRfcmVsb2NzX2NoZWNrID0gQ0hLUkVMICAkQAogY21kX3JlbG9jc19jaGVj
ayA9IAkJCQkJCQlcCiAJJChDT05GSUdfU0hFTEwpICQoc3JjdHJlZSkvYXJjaC9yaXNjdi90b29s
cy9yZWxvY3NfY2hlY2suc2ggIiQoT0JKRFVNUCkiICIkKE5NKSIgIiRAIgogCitpZmRlZiBDT05G
SUdfUkVMT0NBVEFCTEUKK3F1aWV0X2NtZF9jcF92bWxpbnV4X3JlbG9jcyA9IENQUkVMICAgdm1s
aW51eC5yZWxvY3MKK2NtZF9jcF92bWxpbnV4X3JlbG9jcyA9IGNwIHZtbGludXggdm1saW51eC5y
ZWxvY3MKKworcXVpZXRfY21kX3JlbG9jc19zdHJpcCA9IFNUUklQUkVMICRACitjbWRfcmVsb2Nz
X3N0cmlwID0gJChPQkpDT1BZKSAgIC0tcmVtb3ZlLXNlY3Rpb249Jy5yZWwuKicgICAgICAgXAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLXJlbW92ZS1zZWN0aW9uPScucmVsX18q
JyAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS1yZW1vdmUtc2VjdGlv
bj0nLnJlbGEuKicgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tcmVt
b3ZlLXNlY3Rpb249Jy5yZWxhX18qJyAkQAorZW5kaWYKKwogIyBgQHRydWVgIHByZXZlbnRzIGNv
bXBsYWludCB3aGVuIHRoZXJlIGlzIG5vdGhpbmcgdG8gYmUgZG9uZQogCiB2bWxpbnV4OiBGT1JD
RQogCUB0cnVlCiBpZmRlZiBDT05GSUdfUkVMT0NBVEFCTEUKIAkkKGNhbGwgaWZfY2hhbmdlZCxy
ZWxvY3NfY2hlY2spCisJJChjYWxsIGlmX2NoYW5nZWQsY3Bfdm1saW51eF9yZWxvY3MpCisJJChj
YWxsIGlmX2NoYW5nZWQscmVsb2NzX3N0cmlwKQogZW5kaWYKIAogJS5rbzogRk9SQ0UKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmls
ZQppbmRleCBjNzJkZTcyMzJhYmIuLjIyYjEzOTQ3YmQxMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9ib290L01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmlsZQpAQCAtMzMsNyAr
MzMsMTQgQEAgJChvYmopL3hpcEltYWdlOiB2bWxpbnV4IEZPUkNFCiAKIGVuZGlmCiAKK2lmZGVm
IENPTkZJR19SRUxPQ0FUQUJMRQordm1saW51eC5yZWxvY3M6IHZtbGludXgKKwlAICghIFsgLWYg
dm1saW51eC5yZWxvY3MgXSAmJiBlY2hvICJ2bWxpbnV4LnJlbG9jcyBjYW4ndCBiZSBmb3VuZCwg
cGxlYXNlIHJlbW92ZSB2bWxpbnV4IGFuZCB0cnkgYWdhaW4iKSB8fCB0cnVlCisKKyQob2JqKS9J
bWFnZTogdm1saW51eC5yZWxvY3MgRk9SQ0UKK2Vsc2UKICQob2JqKS9JbWFnZTogdm1saW51eCBG
T1JDRQorZW5kaWYKIAkkKGNhbGwgaWZfY2hhbmdlZCxvYmpjb3B5KQogCiAkKG9iaikvSW1hZ2Uu
Z3o6ICQob2JqKS9JbWFnZSBGT1JDRQotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
