Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13B9C001DC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPcodpnPPnEeTJQslkfoZq8q8cdmw2biJLZzT8RrRcs=; b=hz9yWinojFIGP/
	krplz6xY+F7+pxgkaleNDVLdXOaC1wi1xYUFDEHxwJIvaiwI9PG1joP9A9qqAsEYT4SGzrejKGaDx
	rc6UKdj4qYM75pvWsau7UJbm6mdtCK5JwA1sQGLZ+2OvjtXNmqU+pUrKYUq4C5SuyQl26uc+7XNK5
	E9nKCCBY0OyouQAQqFNdUdi315A0qXoB3YsRUwVRJxXZo+YHnOAV0zK/JosSp27IU3RjYB7XXYEt6
	xaxt0qmCPD7Vlyb+2vgRCW7jDKgcjRUtHbO0uG1oxmUinD1LPgNRdDCkq/aprZHbVV4pTzos6Qqyu
	Flk+ct/3iXNSK3Sj8Rvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GM-005wsi-1P;
	Sat, 24 Jun 2023 12:21:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GG-005woQ-2G
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 12:21:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f80b192aecso4273545e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687609263; x=1690201263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN/Bpcd3g2BBD8IENaIvpqjenPqBgjOGqqvyeNWy6hM=;
        b=S7Qug/L8+jW8rcAlVoty9CtIsTLlm7GoXtnsOASUOfExV8W14+nl81+uKtroNm1s07
         ioZUFXzxJ0BtUU4MvAuFR6D504wL5FcuBd5hiXnYgMjsGgVplXR0GsSKfG9K7psiptXp
         W+17RG3pSPSeeV46yBxeEUW62zoQZHRBxvcQaXqYN3lzAssysvZo5TKxpcNuxYdwyqhY
         FOfscDUcMo/1U+vvgocX47LDEnT0c1MhbXMqYYC30sF9/8XSLKfm9RTQfdX6kJKAJM6b
         Mzdvrof+ebl5xvWFGwb/njJC5xUgWaTdhgC+fFF5Qc9q5gagn9LPkooMcaJwEQxpuBuY
         /Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687609263; x=1690201263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN/Bpcd3g2BBD8IENaIvpqjenPqBgjOGqqvyeNWy6hM=;
        b=fod65L01iiqNABY+O+jFHXfjYlrf5ONK66oD8TyT2esLSYaAaIN2OXVITfoQZnu1r8
         dQCVDxDa2rtzbj3ST0HiJS9fmtgkyvyipE0lkDfCUXWm1S0hfoLMudcjAbkbnaS3yrBL
         Z2gl57giL+2u/yenlEzHVMrCbjl5Tlsu2hmu53Ds+RJzlVQT2wJLbiJi1PuN3fEtTxu1
         Z507M0OWHmgftAgyYePguzSAMOlKM1zQyXDR9QBLBwYfCnyP31V8DYZ0L5Y+dkifxhoV
         eDWwb9k0sl561ghggEbtNu/Z/TWhttdDVeTQUnFbMiySBBa7NiKaVtBX5guEAKNReSCz
         qQPQ==
X-Gm-Message-State: AC+VfDyLwl9kMr5rRZNrLstr0DhRzl9qSmHL4SlI7aQ1iMk8F5qnvA6/
	h0YPlNVL03jfEmCTxgAeY9OUTg==
X-Google-Smtp-Source: ACHHUZ4N+s9JDq+KJBGUVTphvOM9RzUpUcJe7aoOxsQriy0LYzQji5fTNu3KxQojc980fZEbPL/iQQ==
X-Received: by 2002:a05:600c:19d2:b0:3f7:fb5d:6e7a with SMTP id u18-20020a05600c19d200b003f7fb5d6e7amr22343211wmq.0.1687609262634;
        Sat, 24 Jun 2023 05:21:02 -0700 (PDT)
Received: from carbon-x1.home ([2a01:cb15:81c2:f100:94c1:d2b1:7300:5620])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003f8f9ab6f30sm2058823wmj.20.2023.06.24.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 05:21:02 -0700 (PDT)
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
Subject: [RFC PATCH 5/6] riscv: add support for PR_SET_UNALIGN and PR_GET_UNALIGN
Date: Sat, 24 Jun 2023 14:20:48 +0200
Message-Id: <20230624122049.7886-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624122049.7886-1-cleger@rivosinc.com>
References: <20230624122049.7886-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_052104_741907_873E4F26 
X-CRM114-Status: GOOD (  16.66  )
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

Tm93IHRoYXQgdHJhcCBzdXBwb3J0IGlzIHJlYWR5IHRvIGhhbmRsZSBtaXNhbGlnbm1lbnQgZXJy
b3JzIGluIFMtbW9kZSwKYWxsb3cgdGhlIHVzZXIgdG8gY29udHJvbCB0aGUgYmVoYXZpb3Igb2Yg
bWlzYWxpZ25tZW50IGFjY2Vzc2VzIHVzaW5nCnByY3RsKCkuIEFkZCBhbiBhbGlnbl9jdGwgZmxh
ZyBpbiB0aHJlYWRfc3RydWN0IHdoaWNoIHdpbGwgYmUgdXNlZCB0bwpkZXRlcm1pbmUgaWYgd2Ug
c2hvdWxkIFNJR0JVUyB0aGUgcHJvY2VzcyBvciBub3Qgb24gc3VjaCBmYXVsdC4KClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgfCAgOSArKysrKysrKysKIGFyY2gvcmlzY3Yv
a2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysrCiBhcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAgNyArKysrKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDM2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAppbmRl
eCA5NGEwNTkwYzY5NzEuLjRlNjY2N2Q1Y2E2OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nv
ci5oCkBAIC03LDYgKzcsNyBAQAogI2RlZmluZSBfQVNNX1JJU0NWX1BST0NFU1NPUl9ICiAKICNp
bmNsdWRlIDxsaW51eC9jb25zdC5oPgorI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+CiAKICNpbmNs
dWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgogCkBAIC0zOSw2ICs0MCw3IEBAIHN0cnVjdCB0aHJlYWRf
c3RydWN0IHsKIAl1bnNpZ25lZCBsb25nIHNbMTJdOwkvKiBzWzBdOiBmcmFtZSBwb2ludGVyICov
CiAJc3RydWN0IF9fcmlzY3ZfZF9leHRfc3RhdGUgZnN0YXRlOwogCXVuc2lnbmVkIGxvbmcgYmFk
X2NhdXNlOworCXVuc2lnbmVkIGxvbmcgYWxpZ25fY3RsOwogfTsKIAogLyogV2hpdGVsaXN0IHRo
ZSBmc3RhdGUgZnJvbSB0aGUgdGFza19zdHJ1Y3QgZm9yIGhhcmRlbmVkIHVzZXJjb3B5ICovCkBA
IC01MSw2ICs1Myw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX3RocmVhZF9zdHJ1Y3Rfd2hp
dGVsaXN0KHVuc2lnbmVkIGxvbmcgKm9mZnNldCwKIAogI2RlZmluZSBJTklUX1RIUkVBRCB7CQkJ
CQlcCiAJLnNwID0gc2l6ZW9mKGluaXRfc3RhY2spICsgKGxvbmcpJmluaXRfc3RhY2ssCVwKKwku
YWxpZ25fY3RsID0gUFJfVU5BTElHTl9OT1BSSU5ULAkJXAogfQogCiAjZGVmaW5lIHRhc2tfcHRf
cmVncyh0c2spCQkJCQkJXApAQCAtODAsNiArODMsMTIgQEAgaW50IHJpc2N2X29mX3BhcmVudF9o
YXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpOwog
ZXh0ZXJuIHZvaWQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKTsKIGV4dGVybiBpbnQgYXJjaF9kdXBf
dGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAq
c3JjKTsKIAorZXh0ZXJuIGludCBnZXRfdW5hbGlnbl9jdGwoc3RydWN0IHRhc2tfc3RydWN0ICos
IHVuc2lnbmVkIGxvbmcgYWRkcik7CitleHRlcm4gaW50IHNldF91bmFsaWduX2N0bChzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKiwgdW5zaWduZWQgaW50IHZhbCk7CisKKyNkZWZpbmUgR0VUX1VOQUxJR05f
Q1RMKHRzaywgYWRkcikJZ2V0X3VuYWxpZ25fY3RsKCh0c2spLCAoYWRkcikpCisjZGVmaW5lIFNF
VF9VTkFMSUdOX0NUTCh0c2ssIHZhbCkJc2V0X3VuYWxpZ25fY3RsKCh0c2spLCAodmFsKSkKKwog
I2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwogCiAjZW5kaWYgLyogX0FTTV9SSVNDVl9QUk9DRVNT
T1JfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jCmluZGV4IGUyYTA2MDA2NjczMC4uYjhhNDFlM2MxMzMzIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvY2Vzcy5jCkBAIC0xOSw2ICsxOSw3IEBACiAjaW5jbHVkZSA8YXNtL3VuaXN0ZC5o
PgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KICNpbmNsdWRlIDxhc20vY3NyLmg+CisjaW5j
bHVkZSA8YXNtL3NiaS5oPgogI2luY2x1ZGUgPGFzbS9zdGFja3RyYWNlLmg+CiAjaW5jbHVkZSA8
YXNtL3N0cmluZy5oPgogI2luY2x1ZGUgPGFzbS9zd2l0Y2hfdG8uaD4KQEAgLTQwLDYgKzQxLDI1
IEBAIHZvaWQgYXJjaF9jcHVfaWRsZSh2b2lkKQogCWNwdV9kb19pZGxlKCk7CiB9CiAKK2ludCBz
ZXRfdW5hbGlnbl9jdGwoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHVuc2lnbmVkIGludCB2YWwp
Cit7CisjaWYgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfU0JJKQorCWlmICghc2JpX2RlbGVnYXRl
X21pc2FsaWduZWQoKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisjZW5kaWYKKwl0c2stPnRocmVhZC5h
bGlnbl9jdGwgPSB2YWw7CisJcmV0dXJuIDA7Cit9CisKK2ludCBnZXRfdW5hbGlnbl9jdGwoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0c2ssIHVuc2lnbmVkIGxvbmcgYWRyKQoreworI2lmIElTX0VOQUJM
RUQoQ09ORklHX1JJU0NWX1NCSSkKKwlpZiAoIXNiaV9kZWxlZ2F0ZV9taXNhbGlnbmVkKCkpCisJ
CXJldHVybiAtRUlOVkFMOworI2VuZGlmCisJcmV0dXJuIHB1dF91c2VyKHRzay0+dGhyZWFkLmFs
aWduX2N0bCwgKHVuc2lnbmVkIGxvbmcgX191c2VyICopYWRyKTsKK30KKwogdm9pZCBfX3Nob3df
cmVncyhzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAlzaG93X3JlZ3NfcHJpbnRfaW5mbyhLRVJO
X0RFRkFVTFQpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IGU0YTI3M2Fi
NzdjOS4uYjgyOGEwZjNkNGY3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBA
IC04LDYgKzgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4
L2lycS5oPgogI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgorI2luY2x1ZGUgPGxpbnV4L3By
Y3RsLmg+CiAKICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CiAjaW5jbHVkZSA8YXNtL3B0cmFj
ZS5oPgpAQCAtMjc3LDYgKzI3OCw5IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHN0cnVj
dCBwdF9yZWdzICpyZWdzKQogCWlmICghSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfTV9NT0RFKSAm
JiAhdXNlcl9tb2RlKHJlZ3MpKQogCQlyZXR1cm4gLTE7CiAKKwlpZiAoKGN1cnJlbnQtPnRocmVh
ZC5hbGlnbl9jdGwgJiBQUl9VTkFMSUdOX1NJR0JVUykpCisJCXJldHVybiAtMTsKKwogCWlmIChn
ZXRfaW5zbihlcGMsICZpbnNuKSkKIAkJcmV0dXJuIC0xOwogCkBAIC0zNzMsNiArMzc3LDkgQEAg
aW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCWlmICgh
SVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfTV9NT0RFKSAmJiAhdXNlcl9tb2RlKHJlZ3MpKQogCQly
ZXR1cm4gLTE7CiAKKwlpZiAoKGN1cnJlbnQtPnRocmVhZC5hbGlnbl9jdGwgJiBQUl9VTkFMSUdO
X1NJR0JVUykpCisJCXJldHVybiAtMTsKKwogCWlmIChnZXRfaW5zbihlcGMsICZpbnNuKSkKIAkJ
cmV0dXJuIC0xOwogCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
