Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B02C00A5A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fa6fIZssWWAXk86UtJ9as1sQ/07F0Xtglcz1vLAZic0=; b=iznU+1Na+tAnr2
	t9XPfbAVTp2EDkAzw6N++xs/c882FrX0tEy9mbIc3TNWRCmFItLQ95IjaR8mfhoKHCp6MQ7t99ykk
	YEODppm9SJbBFv98ILtwkLBQj1iRoYJs/nnYg91qo9+o55A46XmOLVqcy9Z7+aZ1tOxoMGUIsvBBz
	AdcOp/GaWl7g5P5G6F+dEB27zZ/BWqvzkrjfTegkOt7ls36YUJihjNZZW/aLEmbxU8nd9WvXATEve
	Lhu+by50ZbN+UFS93l0a6l97pHa/XnFBzYuT0fa5sDOf201xNLvBoqcCqE2uEr70myxLczWtQg+4K
	s7Y3d3LlD7PgDRRpeYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkj-0019BC-2m;
	Tue, 07 Nov 2023 10:56:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkh-00198o-0x
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32fa4183535so811442f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354568; x=1699959368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyYMJgRzMjwrKO5L5hSYe/4Gc/T+AURoIx9X2Um34ac=;
        b=Op5gsU3erY+gcRL4MSpDErtdAmeo0XJk/Ff1LaV98wTn/1+z8+i3lL/kurra7yzTW5
         AQsG1eQ/nSPh+nWbOgnewmxch6cw7GKsamMQg3LhCgiWmfr5J9pa3EBvOmcD0r/mcyJc
         T7pRoNXG60B6maVWh9ivds/6q6ivBq8+3H5AimORa38LDHE8RY7rKBwW+U6X1zr+mbBN
         ddMVgieVKgJlbiquYiZxAprcbDNgiRwdIwYOL1c+dsX5zLpTIL2FxxwXAsGLCoF0DCXM
         Ovl1bjEGmrB8Grn4pHjzh5LJhUWSJ7k+agXrA6fBdQv1wS1uoUQ1y2dfmY6JxbUpyX6v
         Fjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354568; x=1699959368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyYMJgRzMjwrKO5L5hSYe/4Gc/T+AURoIx9X2Um34ac=;
        b=IYtpTY7FuD1SiNF3q0LgOM4RLZqXbvrP9pKmU7Yv0eFqMGyZAze09+loJhgVrhg8Ul
         0wut+kUaqwalXDsFCWy5MMFdgiRq49McLOD1JjMtZkOzxn7fuJhbhDi7uUGkvC74bhKZ
         8QSwMc+IAn7iEbA5E4ooIbm5pUK+st5+v2kv6ilvaE1ZxDcp9QeFyyeXUOZIEjkTCS1u
         Pjx9DwwwG9S4NoEk6WEzyTXJioLotJphleP78GysILk8uSDzdO6GGvGP7bXEF58mmUDJ
         xvQhmnSLXxghj/KkrcVhLhdfvdylmu7n1XqpHyX27uHhFFV0UkIVOuJAcnAoZG9vyJDp
         rl/w==
X-Gm-Message-State: AOJu0YyL8y1DJv67BCb7tWIeTp5094Lh1Sn8wQF7dfSDpKCjO0TB+x5q
	abfJO/ix/pnbH87X0Zx7cjzJlonab3wHxDj/15wdvQ==
X-Google-Smtp-Source: AGHT+IFyFFeGXMuHqpYj47DkgB8JLp7nUxjM9lX3FEcMg/41/OmRaYpLLNof5//xRHlJ5upcdLIHaQ==
X-Received: by 2002:a05:600c:4fcc:b0:405:4721:800 with SMTP id o12-20020a05600c4fcc00b0040547210800mr26080850wmq.1.1699354567943;
        Tue, 07 Nov 2023 02:56:07 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:07 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 06/20] riscv: add ISA extension parsing for vector crypto
Date: Tue,  7 Nov 2023 11:55:42 +0100
Message-ID: <20231107105556.517187-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025611_337775_584873BF 
X-CRM114-Status: GOOD (  12.91  )
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

QWRkIHBhcnNpbmcgb2Ygc29tZSBadiogdmVjdG9yIGNyeXB0byBJU0EgZXh0ZW5zaW9ucyB0aGF0
IGFyZSBtZW50aW9uZWQKaW4gIlJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUg
SUkiIFsxXS4gVGhlc2UgSVNBIGV4dGVuc2lvbnMKYXJlIHRoZSBmb2xsb3dpbmc6CgotIFp2YmI6
IFZlY3RvciBCYXNpYyBCaXQtbWFuaXB1bGF0aW9uCi0gWnZiYzogVmVjdG9yIENhcnJ5bGVzcyBN
dWx0aXBsaWNhdGlvbgotIFp2a2I6IFZlY3RvciBDcnlwdG9ncmFwaHkgQml0LW1hbmlwdWxhdGlv
bgotIFp2a2c6IFZlY3RvciBHQ00vR01BQy4KLSBadmtuZWQ6IE5JU1QgU3VpdGU6IFZlY3RvciBB
RVMgQmxvY2sgQ2lwaGVyCi0gWnZrbmhbYWJdOiBOSVNUIFN1aXRlOiBWZWN0b3IgU0hBLTIgU2Vj
dXJlIEhhc2gKLSBadmtzZWQ6IFNoYW5nTWkgU3VpdGU6IFNNNCBCbG9jayBDaXBoZXIKLSBadmtz
aDogU2hhbmdNaSBTdWl0ZTogU00zIFNlY3VyZSBIYXNoCi0gWnZrbjogTklTVCBBbGdvcml0aG0g
U3VpdGUKLSBadmtuYzogTklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBjYXJyeWxlc3MgbXVsdGlw
bHkKLSBadmtuZzogTklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBHQ00uCi0gWnZrczogU2hhbmdN
aSBBbGdvcml0aG0gU3VpdGUKLSBadmtzYzogU2hhbmdNaSBBbGdvcml0aG0gU3VpdGUgd2l0aCBj
YXJyeWxlc3MgbXVsdGlwbGljYXRpb24KLSBadmtzZzogU2hhbmdNaSBBbGdvcml0aG0gU3VpdGUg
d2l0aCBHQ00uCi0gWnZrdDogVmVjdG9yIERhdGEtSW5kZXBlbmRlbnQgRXhlY3V0aW9uIExhdGVu
Y3kuCgpMaW5rOiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFnYjlPTEgtRGhiQ2dX
cDdWd3BQT1Zyclk2ZjNvU0pMTC92aWV3IFsxXQpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oIHwgMTQgKysrKysrLQogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgNjggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA2OWNj
NjU5Y2Y2NWUuLjU1NmQxZGEwMjg3NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtNzEsOCAr
NzEsMTggQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aS1NFRAkJNTMKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aS1NICQk1NAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pLVAkJNTUKLQotI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX01BWAkJNjQKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkJCCQk1Ngor
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWQkMJCTU3CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZL
QgkJNTgKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktHCQk1OQorI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pWS05FRAkJNjAKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktOSEEJCTYxCisjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWlZLTkhCCQk2MgorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1NFRAkJ
NjMKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktTSAkJNjQKKyNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aVktUCQk2NQorCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKICNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCiAKICNpZmRlZiBDT05GSUdfUklTQ1ZfTV9NT0RF
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggMGQ3ODc5MTI4OGRhLi41NjU3MGI4Mzg5MTAgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTEyMSw2ICsxMjEsMTAgQEAgc3RhdGljIGJvb2wgcmlz
Y3ZfaXNhX2V4dGVuc2lvbl9jaGVjayhpbnQgaWQpCiAjZGVmaW5lIF9fUklTQ1ZfSVNBX0VYVF9C
VU5ETEUoX25hbWUsIF9idW5kbGVkX2V4dHMpIFwKIAlfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1l
LCBSSVNDVl9JU0FfRVhUX0lOVkFMSUQsIF9idW5kbGVkX2V4dHMsIEFSUkFZX1NJWkUoX2J1bmRs
ZWRfZXh0cykpCiAKKy8qIFVzZWQgdG8gZGVjbGFyZSBleHRlbnNpb25zIHRoYXQgYXJlIGEgc3Vw
ZXJzZXQgb2Ygb3RoZXIgZXh0ZW5zaW9ucyAoWnZiYiBmb3IgaW5zdGFuY2UpICovCisjZGVmaW5l
IF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChfbmFtZSwgX2lkLCBfc3ViX2V4dHMpIFwKKwlfUklT
Q1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgQVJSQVlfU0laRShfc3ViX2V4
dHMpKQorCiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3prX2J1bmRsZWRfZXh0c1td
ID0gewogCVJJU0NWX0lTQV9FWFRfWkJLQiwKIAlSSVNDVl9JU0FfRVhUX1pCS0MsCkBAIC0xNDcs
NiArMTUxLDU0IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfemtzX2J1bmRsZWRf
ZXh0c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWktTSAogfTsKIAorI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pWS04JXAorCVJJU0NWX0lTQV9FWFRfWlZLTkVELAlcCisJUklTQ1ZfSVNBX0VYVF9aVktO
SEIsCVwKKwlSSVNDVl9JU0FfRVhUX1pWS0IsCVwKKwlSSVNDVl9JU0FfRVhUX1pWS1QKKworc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtuX2J1bmRsZWRfZXh0c1tdID0geworCVJJ
U0NWX0lTQV9FWFRfWlZLTgorfTsKKworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96
dmtuY19idW5kbGVkX2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pWS04sCisJUklTQ1ZfSVNB
X0VYVF9aVkJDCit9OworCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a25nX2J1
bmRsZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZLTiwKKwlSSVNDVl9JU0FfRVhUX1pW
S0cKK307CisKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktTCVwKKwlSSVNDVl9JU0FfRVhUX1pW
S1NFRCwJXAorCVJJU0NWX0lTQV9FWFRfWlZLU0gsCVwKKwlSSVNDVl9JU0FfRVhUX1pWS0IsCVwK
KwlSSVNDVl9JU0FfRVhUX1pWS1QKKworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96
dmtzX2J1bmRsZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZLUworfTsKKworc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtzY19idW5kbGVkX2V4dHNbXSA9IHsKKwlSSVND
Vl9JU0FfRVhUX1pWS1MsCisJUklTQ1ZfSVNBX0VYVF9aVkJDCit9OworCitzdGF0aWMgY29uc3Qg
dW5zaWduZWQgaW50IHJpc2N2X3p2a3NnX2J1bmRsZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9F
WFRfWlZLUywKKwlSSVNDVl9JU0FfRVhUX1pWS0cKK307CisKK3N0YXRpYyBjb25zdCB1bnNpZ25l
ZCBpbnQgcmlzY3ZfenZiYl9leHRzW10gPSB7CisJUklTQ1ZfSVNBX0VYVF9aVktCCit9OworCitz
dGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a25oYl9leHRzW10gPSB7CisJUklTQ1Zf
SVNBX0VYVF9aVktOSEEKK307CisKIC8qCiAgKiBUaGUgY2Fub25pY2FsIG9yZGVyIG9mIElTQSBl
eHRlbnNpb24gbmFtZXMgaW4gdGhlIElTQSBzdHJpbmcgaXMgZGVmaW5lZCBpbgogICogY2hhcHRl
ciAyNyBvZiB0aGUgdW5wcml2aWxlZ2VkIHNwZWNpZmljYXRpb24uCkBAIC0yMjUsNiArMjc3LDIy
IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHprdCwgUklTQ1ZfSVNBX0VYVF9aS1QpLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHprc2VkLCBSSVNDVl9JU0FfRVhUX1pLU0VEKSwKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6a3NoLCBSSVNDVl9JU0FfRVhUX1pLU0gpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBF
UlNFVCh6dmJiLCBSSVNDVl9JU0FfRVhUX1pWQkIsIHJpc2N2X3p2YmJfZXh0cyksCisJX19SSVND
Vl9JU0FfRVhUX0RBVEEoenZiYywgUklTQ1ZfSVNBX0VYVF9aVkJDKSwKKwlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHp2a2csIFJJU0NWX0lTQV9FWFRfWlZLRyksCisJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtu
LCByaXNjdl96dmtuX2J1bmRsZWRfZXh0cyksCisJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtu
YywgcmlzY3ZfenZrbmNfYnVuZGxlZF9leHRzKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtu
ZWQsIFJJU0NWX0lTQV9FWFRfWlZLTkVEKSwKKwlfX1JJU0NWX0lTQV9FWFRfQlVORExFKHp2a25n
LCByaXNjdl96dmtuZ19idW5kbGVkX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a25o
YSwgUklTQ1ZfSVNBX0VYVF9aVktOSEEpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmtu
aGIsIFJJU0NWX0lTQV9FWFRfWlZLTkhCLCByaXNjdl96dmtuaGJfZXh0cyksCisJX19SSVNDVl9J
U0FfRVhUX0JVTkRMRSh6dmtzLCByaXNjdl96dmtzX2J1bmRsZWRfZXh0cyksCisJX19SSVNDVl9J
U0FfRVhUX0JVTkRMRSh6dmtzYywgcmlzY3ZfenZrc2NfYnVuZGxlZF9leHRzKSwKKwlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dmtzZWQsIFJJU0NWX0lTQV9FWFRfWlZLU0VEKSwKKwlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6dmtzaCwgUklTQ1ZfSVNBX0VYVF9aVktTSCksCisJX19SSVNDVl9JU0FfRVhU
X0JVTkRMRSh6dmtzZywgcmlzY3ZfenZrc2dfYnVuZGxlZF9leHRzKSwKKwlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NNQUlBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0
YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01TVEFURUVOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShz
c2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJQSksCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
