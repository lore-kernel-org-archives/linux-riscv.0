Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765DCC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joBHxzpDlFt08OB0KpT9Zh0PYqWZO9a1B2W5l+IrLLQ=; b=U1UzKvqWW6L7xJ
	JMO9vmUpsD1WusyQjrdVJvet/gtzUrJCAElRR7FXCuu10ZW2RU3Qmj2AXo/0gTq7HWJAB7RSdTsct
	yRlJUNakznZMGGfSJ74hk8j0skCNs1Ugysk6KnIs29L1sRJWJwlZI0EWfbZFsb2qmcKxpK5uD/MdO
	kazKWRYfVp2e7uV3kns5mrrmQch8w8tAoyE27FdcpbKn1t6JyJ13zRdaZIL1PSy4VybeZJ2gfNAUV
	qgjMzr+C7kQgZb/r+TckRLJXl5Y0S/GQY4PCJ4uDIZRdkAg8uy8qHIK8/PdN0BZzanwSaXZE24und
	g0xlsLLE4ayW9pmnpScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uB7-00G9Pj-36;
	Tue, 14 Nov 2023 14:14:09 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAu-00G95e-0V
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:58 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-77773d3246aso14496185a.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971233; x=1700576033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTkSM9bAUTwt3Wciw9Vfs7ckFoeuejbzVqs+azlN9Lg=;
        b=bsTGsoQnMxF5+zz99KEnTQdkhCF4y2xzKJLpajyPELEpWOELrBtQfN6spYMLYu8r7e
         +YX4Aj3tUGy/Vz+D5BP/W7a8yCl3hvr7dcwlnRbvt77j2p5UxbffCyEJcm4plbIicm0H
         fpkecW/ESzJ4kiOF6ak5K8HpUOiVl/Q0Ji3mJgSfZYXpo17vpI8GactPgJYWK68cvBT9
         7Il95MUqy+GRwJqtViTZR9fBRVJtCaLuDChlWbk1n0zjieWVhwKx37fvIDabKvK9L0A2
         eruTru1iNFbD9dK2IsHNel2Ww6rPDZWJQcmTkQMvqAhuES2BuT6vQweuPRH+q1lMIMu9
         06hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971233; x=1700576033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTkSM9bAUTwt3Wciw9Vfs7ckFoeuejbzVqs+azlN9Lg=;
        b=BURAqz16Y04HOPuB081KkpNRnHQP/3dWDMFjVASH0g9SzTDXg4cq7pPlY8CuVHbKbP
         So2YlEUFUZo6fiVQ6iIG2jFM5i64DuMZbBpJrtEDY/G9qsypYh9Gw0opAEd9GbBrdbJs
         VT0aMc3IvqI5B73uNK8DmDpJNRGOAWpvbyKxIZ5iHWqjmaFZsNvtGNUCV9T3B5Tv25iY
         yVlPwDeKO2XEYDBAXEjASa+uUVvfa+W4uRB6qyb5vDPx+Wtt0dxFQtHEgkeCXCeIqLyf
         BGvBAvYQTBmsNGZcDcHAIGaE6pPgonyZFG1Z3U6DSJHnarsixLmIn7+kuQ+fEH6ZXcVt
         z8oQ==
X-Gm-Message-State: AOJu0YyjqQ2BWoZ2R4e5/SskaB1KsAnLhu1Iud8J0jrCk/o+YOTAQzB1
	mwrbRoX6WaPq2qoVHKRYzk8SD9P78qqrgNx1bP/iBw==
X-Google-Smtp-Source: AGHT+IH10FrNz5wJfdEN4PWoaaLBM1zx/8nZEqjt+rAkZMedk134cZsiD1LAwi+cZemn3bnj/q1syg==
X-Received: by 2002:a05:620a:d94:b0:775:82e2:dc19 with SMTP id q20-20020a05620a0d9400b0077582e2dc19mr2498746qkl.2.1699971233218;
        Tue, 14 Nov 2023 06:13:53 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:52 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 16/20] riscv: hwprobe: export Zvfh[min] ISA extensions
Date: Tue, 14 Nov 2023 09:12:52 -0500
Message-ID: <20231114141256.126749-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061356_278945_6544A168 
X-CRM114-Status: GOOD (  10.04  )
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

RXhwb3J0IFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHRocm91Z2ggaHdwcm9iZS4KCkxpbms6
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMV9ZdDYwSEdBZjFyMWh4N0puc0lwdHcw
c3FrQmQ5QlE4L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29t
PgotLS0KIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA4ICsrKysrKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMiArKwogYXJjaC9yaXNj
di9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAgICB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCBhYThl
YmVlZGRmZTYuLjg5NmVjZmJiZTVmNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jp
c2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dApAQCAtMTQ5LDYgKzE0OSwxNCBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJSElOVE5UTGA6IFRoZSBaaWhpbnRudGwg
ZXh0ZW5zaW9uIHZlcnNpb24gMS4wCiAgICAgICAgaXMgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4g
dGhlIFJJU0MtViBJU0EgbWFudWFsLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pWRkhgOiBUaGUgWnZmaCBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFzCisgICAgICAgZGVmaW5l
ZCBpbiB0aGUgUklTQy1WIFZlY3RvciBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgZTJjY2Qw
NTQ4ZDZjCisgICAgICAgKCJSZW1vdmUgZHJhZnQgd2FybmluZ3MgZnJvbSBadmZoW21pbl0iKS4K
KworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkZITUlOYDogVGhlIFp2ZmhtaW4g
ZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBW
ZWN0b3IgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IGUyY2NkMDU0OGQ2YworICAgICAgICgi
UmVtb3ZlIGRyYWZ0IHdhcm5pbmdzIGZyb20gWnZmaFttaW5dIikuCisKICogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZv
cm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29y
cy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggZDcyYzY5ZWEwNzQw
Li5mZmZjNjlkOWY2YmEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAt
NTMsNiArNTMsOCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aRkgJCSgxIDw8IDI3KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZITUlO
CSgxIDw8IDI4KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMCSgxIDw8IDI5
KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZGSAkJKDEgPDwgMzApCisjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aVkZITUlOCSgxIDw8IDMxKQogI2RlZmluZSBSSVNDVl9IV1BST0JF
X0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05P
V04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAko
MSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCBhNDZlNGY2ODIxZGQuLmU5MDUzNzU5M2Y1
ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE4Niw2ICsxODYsOCBAQCBzdGF0aWMgdm9pZCBo
d3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkJRVhUX0tFWSha
VktTRUQpOwogCQkJRVhUX0tFWShaVktTSCk7CiAJCQlFWFRfS0VZKFpWS1QpOworCQkJRVhUX0tF
WShaVkZIKTsKKwkJCUVYVF9LRVkoWlZGSE1JTik7CiAJCX0KIAogCQlpZiAoaGFzX2ZwdSgpKSB7
Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
