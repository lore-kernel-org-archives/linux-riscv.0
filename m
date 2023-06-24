Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB7EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xClAnFaaq4Z2xtpLhZWR8jMIBewPQiIioNRI6Fmidc=; b=H6eznhRuwcUWKw
	mQ7Mp9h0KjtaJBUObCGN/H0O9ccrR9QooGecuDHH9He2RZ2lXZTT+J0p8+Nm/0pVVfE0jrGj6iocf
	2Dj3Ia1jgoxpqCNd6IBftoZw8oFiUMRRabf520a7JGPZdRUR3bzxDmTloLNYrTqbo8n1qCIZXm45j
	wVa4qn6989ewPY/o84NXh+UYW6G9uCo/EKDKpKkR9ye51MqMkpNuANzHuEKm8rJaH9aodzP3RBFnL
	BDjMxYSTUr2VPOjn5i2qshQtMJLPubaT2HiYzU4kBAo6qyHwoUd/rYolP1UjV2vGGOAzLc5MNUC6+
	QyBmeubCguKh9nSgdkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GG-005woy-1G;
	Sat, 24 Jun 2023 12:21:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GB-005wko-2z
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 12:21:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3127e67842aso423850f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687609258; x=1690201258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0yKSEPQ2uBWE2LY+saIm//xFx7HrBCHNyL34cp2oHM=;
        b=QeZjgJfhQJvqZvx1t1IeWYsbwQNI5QY0nY+n+6iuKprKzqPPDhqAlCK/X8MXw9lllM
         MF7MJUd3AyF6NLExmFN2tqOyKJxGXQ5A620LqDfFp1F1MgWOF2XqUr8EUczC4R2MWmPT
         FPV9ONEJm4zSLcf0xZlhrZVG+xsG//PTKyBEZCr7/8dLR1hNjsmbGDUqGsh9vM21Svm7
         dAy7RyMU7SrYkSqPju5iD/CqEc/7iiUHvgjZoAQEvI82vuQl+FYI2+3r31+PjQUdTX5Y
         sjL2IQB9LnUMnP7pvvD/q1oELJQNwk2RV0RkSmIPwXN9cWyi2KhZGSAxqRLH8HJDsVlQ
         TIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687609258; x=1690201258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0yKSEPQ2uBWE2LY+saIm//xFx7HrBCHNyL34cp2oHM=;
        b=FRQNJdvY2Znfgli4gqz/55YNL0PwU357i/mmwY8XdAQ3O89cjyyyn1xtcXNL2buvQZ
         6ZeVCjspj5JTe19KhV52kXjAgGYhorzRNo7YnJRmXMrSXjnSyuaOmzXh+SRGliRD65Zo
         W/Krsr2saabuoIuXWvTD2PlQ37jhls3XfAmdtaEk0uO4AMsPivcOzONE2dE7noezC0s1
         utGw2jlsjAPj+svzLBNfWfwOTfLwTryZrEYp42QFod2orNkLNvd7ZGEblacj9ByAEV1U
         aOcLPIR61i1Qw65Swo2ilEXQuWQWicVX7BHH2i+yK+/ChL1QTvLIEWT3WPBmU2zBwcGO
         HXxQ==
X-Gm-Message-State: AC+VfDx2J3AV71bdgrGqSvBiNeBdsfiAFDF3J/f5LtOTnYVwtYUrlzL0
	lWPoflH4IA/KK95b5k3up5r3DQ==
X-Google-Smtp-Source: ACHHUZ4ou5+mAhAZf0neB/pEp/lFSTloYGI60h/0wpB1djUbSRRuQtMMLGSiDbhu49FUgBf4zF50Sg==
X-Received: by 2002:adf:fdc8:0:b0:313:e3a8:b477 with SMTP id i8-20020adffdc8000000b00313e3a8b477mr1055898wrs.2.1687609258116;
        Sat, 24 Jun 2023 05:20:58 -0700 (PDT)
Received: from carbon-x1.home ([2a01:cb15:81c2:f100:94c1:d2b1:7300:5620])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003f8f9ab6f30sm2058823wmj.20.2023.06.24.05.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 05:20:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Stafford Horne <shorne@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/6] riscv: add support for misaligned handling in S-mode
Date: Sat, 24 Jun 2023 14:20:45 +0200
Message-Id: <20230624122049.7886-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624122049.7886-1-cleger@rivosinc.com>
References: <20230624122049.7886-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_052059_971079_8E93EA42 
X-CRM114-Status: GOOD (  20.61  )
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

TWlzYWxpZ25tZW50IGhhbmRsaW5nIGlzIG9ubHkgc3VwcG9ydGVkIGZvciBNLW1vZGUgYW5kIHVz
ZXMgZGlyZWN0CmFjY2Vzc2VzIHRvIHVzZXIgbWVtb3J5LiBpbiBTLW1vZGUsIHRoaXMgcmVxdWly
ZXMgdG8gdXNlIHRoZQpnZXRfdXNlcigpL3B1dF91c2VyKCkgYWNjZXNzb3JzLiBJbXBsZW1lbnQg
bG9hZF91OCgpLCBzdG9yZV91OCgpIGFuZApnZXRfaW5zbigpIHVzaW5nIHRoZXNlIGFjY2Vzc29y
cy4gQWxzbywgdXNlIENTUl9UVkFMIGluc3RlYWQgb2YKaGFyZGNvZGVkIG10dmFsIGluIGNzcl9y
ZWFkKCkgY2FsbCB3aGljaCB3aWxsIHdvcmsgZm9yIGJvdGggUy1tb2RlIGFuZApNLW1vZGUuIFdo
ZW4gdXNlZCBpbiBTLW1vZGUsIHdlIGRvIG5vdCBoYW5kbGUgbWlzYWxpZ25lZCBhY2Nlc3NlcyB0
aGF0CmFyZSB0cmlnZ2VyZWQgZnJvbSBrZXJuZWwgbW9kZS4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9N
YWtlZmlsZSAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyB8IDExMSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgOTkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQppbmRleCAx
NTM4NjRlNGYzOTkuLjYxYmFkMDkyODBhNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
TWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKQEAgLTU2LDkgKzU2LDkg
QEAgb2JqLXkJKz0gc3RhY2t0cmFjZS5vCiBvYmoteQkrPSBjYWNoZWluZm8ubwogb2JqLXkJKz0g
cGF0Y2gubwogb2JqLXkJKz0gcHJvYmVzLworb2JqLXkJKz0gdHJhcHNfbWlzYWxpZ25lZC5vCiBv
YmotJChDT05GSUdfTU1VKSArPSB2ZHNvLm8gdmRzby8KIAotb2JqLSQoQ09ORklHX1JJU0NWX01f
TU9ERSkJKz0gdHJhcHNfbWlzYWxpZ25lZC5vCiBvYmotJChDT05GSUdfRlBVKQkJKz0gZnB1Lm8K
IG9iai0kKENPTkZJR19TTVApCQkrPSBzbXBib290Lm8KIG9iai0kKENPTkZJR19TTVApCQkrPSBz
bXAubwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IGU3YmZiMzMwODljMS4u
ZTRhMjczYWI3N2M5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0xMiw2
ICsxMiw3IEBACiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPGFzbS9wdHJh
Y2UuaD4KICNpbmNsdWRlIDxhc20vY3NyLmg+CisjaW5jbHVkZSA8YXNtL2J1Zy5oPgogCiAjZGVm
aW5lIElOU05fTUFUQ0hfTEIJCQkweDMKICNkZWZpbmUgSU5TTl9NQVNLX0xCCQkJMHg3MDdmCkBA
IC0xNTEsMjEgKzE1MiwyNSBAQAogI2RlZmluZSBQUkVDSVNJT05fUyAwCiAjZGVmaW5lIFBSRUNJ
U0lPTl9EIDEKIAotc3RhdGljIGlubGluZSB1OCBsb2FkX3U4KGNvbnN0IHU4ICphZGRyKQorI2lm
ZGVmIENPTkZJR19SSVNDVl9NX01PREUKK3N0YXRpYyBpbmxpbmUgaW50IGxvYWRfdTgoY29uc3Qg
dTggKmFkZHIsIHU4ICpyX3ZhbCkKIHsKIAl1OCB2YWw7CiAKIAlhc20gdm9sYXRpbGUoImxidSAl
MCwgJTEiIDogIj0mciIgKHZhbCkgOiAibSIgKCphZGRyKSk7CisJKnJfdmFsID0gdmFsOwogCi0J
cmV0dXJuIHZhbDsKKwlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIHN0b3JlX3U4
KHU4ICphZGRyLCB1OCB2YWwpCitzdGF0aWMgaW5saW5lIGludCBzdG9yZV91OCh1OCAqYWRkciwg
dTggdmFsKQogewogCWFzbSB2b2xhdGlsZSAoInNiICUwLCAlMVxuIiA6IDogInIiICh2YWwpLCAi
bSIgKCphZGRyKSk7CisKKwlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGlubGluZSB1bG9uZyBnZXRf
aW5zbih1bG9uZyBtZXBjKQorc3RhdGljIGlubGluZSBpbnQgZ2V0X2luc24odWxvbmcgbWVwYywg
dWxvbmcgKnJfaW5zbikKIHsKIAlyZWdpc3RlciB1bG9uZyBfX21lcGMgYXNtICgiYTIiKSA9IG1l
cGM7CiAJdWxvbmcgdmFsLCBydmNfbWFzayA9IDMsIHRtcDsKQEAgLTE5NCw5ICsxOTksNjMgQEAg
c3RhdGljIGlubGluZSB1bG9uZyBnZXRfaW5zbih1bG9uZyBtZXBjKQogCTogW2FkZHJdICJyIiAo
X19tZXBjKSwgW3J2Y19tYXNrXSAiciIgKHJ2Y19tYXNrKSwKIAkgIFt4bGVuX21pbnVzXzE2XSAi
aSIgKFhMRU5fTUlOVVNfMTYpKTsKIAotCXJldHVybiB2YWw7CisJKnJfaW5zbiA9IHZhbDsKKwor
CXJldHVybiAwOworfQorI2Vsc2UKK3N0YXRpYyBpbmxpbmUgaW50IGxvYWRfdTgoY29uc3QgdTgg
KmFkZHIsIHU4ICpyX3ZhbCkKK3sKKwlyZXR1cm4gX19nZXRfdXNlcigqcl92YWwsIGFkZHIpOwor
fQorCitzdGF0aWMgaW5saW5lIGludCBzdG9yZV91OCh1OCAqYWRkciwgdTggdmFsKQoreworCXJl
dHVybiBfX3B1dF91c2VyKHZhbCwgYWRkcik7CiB9CiAKK3N0YXRpYyBpbmxpbmUgaW50IGdldF9p
bnNuKHVsb25nIG1lcGMsIHVsb25nICpyX2luc24pCit7CisJdWxvbmcgaW5zbiA9IDA7CisKKwlp
ZiAobWVwYyAmIDB4MikgeworCQl1bG9uZyB0bXAgPSAwOworCQl1MTYgX191c2VyICppbnNuX2Fk
ZHIgPSAodTE2IF9fdXNlciAqKW1lcGM7CisKKwkJaWYgKF9fZ2V0X3VzZXIoaW5zbiwgaW5zbl9h
ZGRyKSkKKwkJCXJldHVybiAtRUZBVUxUOworCQkvKiBfX2dldF91c2VyKCkgdXNlcyByZWd1bGFy
ICJsdyIgd2hpY2ggc2lnbiBleHRlbmQgdGhlIGxvYWRlZAorCQkgKiB2YWx1ZSBtYWtlIHN1cmUg
dG8gY2xlYXIgaGlnaGVyIG9yZGVyIGJpdHMgaW4gY2FzZSB3ZSAib3IiIGl0CisJCSAqIGJlbG93
IHdpdGggdGhlIHVwcGVyIDE2IGJpdHMgaGFsZi4KKwkJICovCisJCWluc24gJj0gR0VOTUFTSygx
NSwgMCk7CisJCWlmICgoaW5zbiAmIF9fSU5TTl9MRU5HVEhfTUFTSykgIT0gX19JTlNOX0xFTkdU
SF8zMikgeworCQkJKnJfaW5zbiA9IGluc247CisJCQlyZXR1cm4gMDsKKwkJfQorCQlpbnNuX2Fk
ZHIrKzsKKwkJaWYgKF9fZ2V0X3VzZXIodG1wLCBpbnNuX2FkZHIpKQorCQkJcmV0dXJuIC1FRkFV
TFQ7CisJCSpyX2luc24gPSAodG1wIDw8IDE2KSB8IGluc247CisKKwkJcmV0dXJuIDA7CisJfSBl
bHNlIHsKKwkJdTMyIF9fdXNlciAqaW5zbl9hZGRyID0gKHUzMiBfX3VzZXIgKiltZXBjOworCisJ
CWlmIChfX2dldF91c2VyKGluc24sIGluc25fYWRkcikpCisJCQlyZXR1cm4gLUVGQVVMVDsKKwkJ
aWYgKChpbnNuICYgX19JTlNOX0xFTkdUSF9NQVNLKSA9PSBfX0lOU05fTEVOR1RIXzMyKSB7CisJ
CQkqcl9pbnNuID0gaW5zbjsKKwkJCXJldHVybiAwOworCQl9CisJCWluc24gJj0gR0VOTUFTSygx
NSwgMCk7CisJCSpyX2luc24gPSBpbnNuOworCisJCXJldHVybiAwOworCX0KK30KKyNlbmRpZgor
CiB1bmlvbiByZWdfZGF0YSB7CiAJdTggZGF0YV9ieXRlc1s4XTsKIAl1bG9uZyBkYXRhX3Vsb25n
OwpAQCAtMjA3LDEwICsyNjYsMjEgQEAgaW50IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCiB7CiAJdW5pb24gcmVnX2RhdGEgdmFsOwogCXVuc2lnbmVkIGxvbmcg
ZXBjID0gcmVncy0+ZXBjOwotCXVuc2lnbmVkIGxvbmcgaW5zbiA9IGdldF9pbnNuKGVwYyk7Ci0J
dW5zaWduZWQgbG9uZyBhZGRyID0gY3NyX3JlYWQobXR2YWwpOworCXVuc2lnbmVkIGxvbmcgaW5z
bjsKKwl1bnNpZ25lZCBsb25nIGFkZHI7CiAJaW50IGksIGZwID0gMCwgc2hpZnQgPSAwLCBsZW4g
PSAwOwogCisJLyoKKwkgKiBXaGVuIHJ1bm5pbmcgaW4gc3VwZXJ2aXNvciBtb2RlLCB3ZSBvbmx5
IGhhbmRsZSBtaXNhbGlnbmVkIGFjY2Vzc2VzCisJICogdHJpZ2dlcmVkIGZyb20gdXNlciBtb2Rl
LgorCSAqLworCWlmICghSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfTV9NT0RFKSAmJiAhdXNlcl9t
b2RlKHJlZ3MpKQorCQlyZXR1cm4gLTE7CisKKwlpZiAoZ2V0X2luc24oZXBjLCAmaW5zbikpCisJ
CXJldHVybiAtMTsKKworCWFkZHIgPSBjc3JfcmVhZChDU1JfVFZBTCk7CiAJcmVncy0+ZXBjID0g
MDsKIAogCWlmICgoaW5zbiAmIElOU05fTUFTS19MVykgPT0gSU5TTl9NQVRDSF9MVykgewpAQCAt
Mjc0LDggKzM0NCwxMCBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKIAl9CiAKIAl2YWwuZGF0YV91NjQgPSAwOwotCWZvciAoaSA9IDA7IGkgPCBsZW47
IGkrKykKLQkJdmFsLmRhdGFfYnl0ZXNbaV0gPSBsb2FkX3U4KCh2b2lkICopKGFkZHIgKyBpKSk7
CisJZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7CisJCWlmIChsb2FkX3U4KCh2b2lkICopKGFk
ZHIgKyBpKSwgJnZhbC5kYXRhX2J5dGVzW2ldKSkKKwkJCXJldHVybiAtMTsKKwl9CiAKIAlpZiAo
ZnApCiAJCXJldHVybiAtMTsKQEAgLTI5MCwxMCArMzYyLDIxIEBAIGludCBoYW5kbGVfbWlzYWxp
Z25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAl1bmlvbiByZWdfZGF0YSB2YWw7
CiAJdW5zaWduZWQgbG9uZyBlcGMgPSByZWdzLT5lcGM7Ci0JdW5zaWduZWQgbG9uZyBpbnNuID0g
Z2V0X2luc24oZXBjKTsKLQl1bnNpZ25lZCBsb25nIGFkZHIgPSBjc3JfcmVhZChtdHZhbCk7CisJ
dW5zaWduZWQgbG9uZyBpbnNuOworCXVuc2lnbmVkIGxvbmcgYWRkcjsKIAlpbnQgaSwgbGVuID0g
MDsKIAorCS8qCisJICogV2hlbiBydW5uaW5nIGluIHN1cGVydmlzb3IgbW9kZSwgd2Ugb25seSBo
YW5kbGUgbWlzYWxpZ25lZCBhY2Nlc3NlcworCSAqIHRyaWdnZXJlZCBmcm9tIHVzZXIgbW9kZS4K
KwkgKi8KKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1JJU0NWX01fTU9ERSkgJiYgIXVzZXJfbW9k
ZShyZWdzKSkKKwkJcmV0dXJuIC0xOworCisJaWYgKGdldF9pbnNuKGVwYywgJmluc24pKQorCQly
ZXR1cm4gLTE7CisKKwlhZGRyID0gY3NyX3JlYWQoQ1NSX1RWQUwpOwogCXJlZ3MtPmVwYyA9IDA7
CiAKIAl2YWwuZGF0YV91bG9uZyA9IEdFVF9SUzIoaW5zbiwgcmVncyk7CkBAIC0zMjcsOCArNDEw
LDEwIEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykK
IAkJcmV0dXJuIC0xOwogCX0KIAotCWZvciAoaSA9IDA7IGkgPCBsZW47IGkrKykKLQkJc3RvcmVf
dTgoKHZvaWQgKikoYWRkciArIGkpLCB2YWwuZGF0YV9ieXRlc1tpXSk7CisJZm9yIChpID0gMDsg
aSA8IGxlbjsgaSsrKSB7CisJCWlmIChzdG9yZV91OCgodm9pZCAqKShhZGRyICsgaSksIHZhbC5k
YXRhX2J5dGVzW2ldKSkKKwkJCXJldHVybiAtMTsKKwl9CiAKIAlyZWdzLT5lcGMgPSBlcGMgKyBJ
TlNOX0xFTihpbnNuKTsKIAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
