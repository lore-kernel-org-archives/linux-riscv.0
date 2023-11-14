Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A29C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TldhYRgJl0GAJ1T8kjgmu0MLj8YpIFR4e9pGD5a7YS0=; b=Ya63zq0jyeyUk8
	h6q4g1U228R/XeST2PgLwsWWa3YaL3nc5OeDmIHQIe3Uc/P1m+Z2HtlGescyG5Vp9lqSuIzIE/8FL
	8qutGUvP4nDmrF1ILNaqGLwkgCI8SiZdmVWH0JNLmqg/QmZjKRhbU5YAymiiolQL0TcMMR5n0EqpL
	WU0cV5icvzM3ZyqHf4LgXlYVclSSW5m1YjvhiygB8AE/41t4eZrcWjl//nUiyZtARGadhSe2gTBMN
	U7lKJB3skVfzfqbvrUTKYJzh/svFYxpKJ6Wmms8Xn2+4+m+pBOk71zqhhn8imJkIGCUx3alcSq3NG
	ondqRy+jX4gJXPViOoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAl-00G8yC-1T;
	Tue, 14 Nov 2023 14:13:47 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAf-00G8qt-0b
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:43 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-779d0c05959so55567285a.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971220; x=1700576020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g4r4bjsySLwk77l9XIM5/wH2ybzV4V3VQlpQWbskRU=;
        b=CBVwUYP3zKSIrJTxIVxk+KjY+v/JZTDvegjXe3U2X6ERSCDSQe48Ur+dqCIKaUbpsJ
         PK6LDOMMY/G8bS56Q6U6CdH68FZiOT6hNQe9ysZ1mNO7IVoVonhH2x19cuJJ/i8MVI2c
         MZNt/FcTFjVdViYIflz12fOvjO+SVlRqkgXivcWxzRGqK37Q0VfqOFePnTWx5i5/78nv
         AruArmCBiKYJ9oUjNLlUYFmsmOX2WZoEjl/6ya4Wnfe5+LQ+lCwd1j9gy4ZiPt6BJzFy
         zYGJerzJ07pAzDWCS3lRvNWgDG1013IuFrG0N31wOnt/1pk8ZkJHWGl3eKevus1XXWzC
         Lopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971220; x=1700576020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+g4r4bjsySLwk77l9XIM5/wH2ybzV4V3VQlpQWbskRU=;
        b=XPJcrcQoHHlgqL47Y3kJYiEDbyMxz313uIs3z3nBsdSF56h/TJvszZobCfRD/a/jlU
         5G0ZgGPdmqQEN4yXelzn6R787evwi/d4MX0SGlxC4w83UWzeOH8/aHuW2KYiK+kDL0O3
         ruRMvUmrWukFw6gLAyswBLVv/3/zIXO7AdzA92FQqq3GsJt+WZ+ewGlSCXCrdOmFngbO
         RCcYYNhRe2RfpFLC9h97nnesCG9ZJ/RLifmWOYmkAWpX1OBhyCDlIDq+Bcue9R9gnOHw
         3G5cj5w4Y1UjjITMNA3uxEaWX6rYTWfxP9wX40pkYXlFtoiXuQyCAjkLU14tKX7px6h7
         vtUA==
X-Gm-Message-State: AOJu0YzC1AcBKfeij9k4Qt8Iyk38MIUdUOF9m7DWiOKiVCGFSivNJ4aX
	KJ+uhMfOaUn838IZR8rNvlyHCRwDoHM0feomWFWYtw==
X-Google-Smtp-Source: AGHT+IH7kpjtCOGgFTVn0VXhNLv2IfiHOGHCQO3TA/WLBqK62He/u3Tqp6my3moeV85XJ3AUbedh2w==
X-Received: by 2002:a05:620a:3945:b0:776:f188:eee6 with SMTP id qs5-20020a05620a394500b00776f188eee6mr2482783qkn.2.1699971218961;
        Tue, 14 Nov 2023 06:13:38 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:37 -0800 (PST)
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
Subject: [PATCH v4 06/20] riscv: add ISA extension parsing for vector crypto
Date: Tue, 14 Nov 2023 09:12:42 -0500
Message-ID: <20231114141256.126749-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061341_241705_EC1F45DD 
X-CRM114-Status: GOOD (  12.49  )
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
cC5oIHwgMTIgKysrKysrLQogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgNjQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IGIwODU3
YzY0YmY2ZS4uNDc3MjU0NjY4ZDgyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC02OCw4ICs2
OCwxOCBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pLU0VECQk1MwogI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1pLU0gJCTU0CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWktUCQk1NQorI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWQkIJCTU2CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZCQwkJNTcKKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktCCQk1OAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS0cJ
CTU5CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLTkVECQk2MAorI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pWS05IQQkJNjEKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktOSEIJCTYyCisjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWlZLU0VECQk2MworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1NICQk2
NAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1QJCTY1CiAKLSNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9NQVgJCTY0CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCiAKICNpZmRlZiBDT05GSUdfUklTQ1ZfTV9NT0RFCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggYTI4NzFiY2VhYWQ5Li5jNGQwZjE2YzI5YjkgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKQEAgLTEyMyw2ICsxMjMsMTAgQEAgc3RhdGljIGJvb2wgcmlzY3Zf
aXNhX2V4dGVuc2lvbl9jaGVjayhpbnQgaWQpCiAjZGVmaW5lIF9fUklTQ1ZfSVNBX0VYVF9CVU5E
TEUoX25hbWUsIF9idW5kbGVkX2V4dHMpIFwKIAlfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBS
SVNDVl9JU0FfRVhUX0lOVkFMSUQsIF9idW5kbGVkX2V4dHMsIEFSUkFZX1NJWkUoX2J1bmRsZWRf
ZXh0cykpCiAKKy8qIFVzZWQgdG8gZGVjbGFyZSBleHRlbnNpb25zIHRoYXQgYXJlIGEgc3VwZXJz
ZXQgb2Ygb3RoZXIgZXh0ZW5zaW9ucyAoWnZiYiBmb3IgaW5zdGFuY2UpICovCisjZGVmaW5lIF9f
UklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChfbmFtZSwgX2lkLCBfc3ViX2V4dHMpIFwKKwlfUklTQ1Zf
SVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgQVJSQVlfU0laRShfc3ViX2V4dHMp
KQorCiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3prX2J1bmRsZWRfZXh0c1tdID0g
ewogCVJJU0NWX0lTQV9FWFRfWkJLQiwKIAlSSVNDVl9JU0FfRVhUX1pCS0MsCkBAIC0xNDksNiAr
MTUzLDUwIEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfemtzX2J1bmRsZWRfZXh0
c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWktTSAogfTsKIAorI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pWS04JXAorCVJJU0NWX0lTQV9FWFRfWlZLTkVELAlcCisJUklTQ1ZfSVNBX0VYVF9aVktOSEIs
CVwKKwlSSVNDVl9JU0FfRVhUX1pWS0IsCVwKKwlSSVNDVl9JU0FfRVhUX1pWS1QKKworc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtuX2J1bmRsZWRfZXh0c1tdID0geworCVJJU0NW
X0lTQV9FWFRfWlZLTgorfTsKKworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtu
Y19idW5kbGVkX2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pWS04sCisJUklTQ1ZfSVNBX0VY
VF9aVkJDCit9OworCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a25nX2J1bmRs
ZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZLTiwKKwlSSVNDVl9JU0FfRVhUX1pWS0cK
K307CisKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktTCVwKKwlSSVNDVl9JU0FfRVhUX1pWS1NF
RCwJXAorCVJJU0NWX0lTQV9FWFRfWlZLU0gsCVwKKwlSSVNDVl9JU0FfRVhUX1pWS0IsCVwKKwlS
SVNDVl9JU0FfRVhUX1pWS1QKKworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtz
X2J1bmRsZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZLUworfTsKKworc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtzY19idW5kbGVkX2V4dHNbXSA9IHsKKwlSSVNDVl9J
U0FfRVhUX1pWS1MsCisJUklTQ1ZfSVNBX0VYVF9aVkJDCit9OworCitzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IHJpc2N2X3p2a3NnX2J1bmRsZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRf
WlZLUywKKwlSSVNDVl9JU0FfRVhUX1pWS0cKK307CisKK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBp
bnQgcmlzY3ZfenZiYl9leHRzW10gPSB7CisJUklTQ1ZfSVNBX0VYVF9aVktCCit9OworCiAvKgog
ICogVGhlIGNhbm9uaWNhbCBvcmRlciBvZiBJU0EgZXh0ZW5zaW9uIG5hbWVzIGluIHRoZSBJU0Eg
c3RyaW5nIGlzIGRlZmluZWQgaW4KICAqIGNoYXB0ZXIgMjcgb2YgdGhlIHVucHJpdmlsZWdlZCBz
cGVjaWZpY2F0aW9uLgpAQCAtMjI3LDYgKzI3NSwyMiBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNh
X2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3Qs
IFJJU0NWX0lTQV9FWFRfWktUKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3NlZCwgUklTQ1Zf
SVNBX0VYVF9aS1NFRCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemtzaCwgUklTQ1ZfSVNBX0VY
VF9aS1NIKSwKKwlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZiYiwgUklTQ1ZfSVNBX0VYVF9a
VkJCLCByaXNjdl96dmJiX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NW
X0lTQV9FWFRfWlZCQyksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VY
VF9aVktCKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtnLCBSSVNDVl9JU0FfRVhUX1pWS0cp
LAorCV9fUklTQ1ZfSVNBX0VYVF9CVU5ETEUoenZrbiwgcmlzY3ZfenZrbl9idW5kbGVkX2V4dHMp
LAorCV9fUklTQ1ZfSVNBX0VYVF9CVU5ETEUoenZrbmMsIHJpc2N2X3p2a25jX2J1bmRsZWRfZXh0
cyksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrbmVkLCBSSVNDVl9JU0FfRVhUX1pWS05FRCks
CisJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtuZywgcmlzY3ZfenZrbmdfYnVuZGxlZF9leHRz
KSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtuaGEsIFJJU0NWX0lTQV9FWFRfWlZLTkhBKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtuaGIsIFJJU0NWX0lTQV9FWFRfWlZLTkhCKSwKKwlf
X1JJU0NWX0lTQV9FWFRfQlVORExFKHp2a3MsIHJpc2N2X3p2a3NfYnVuZGxlZF9leHRzKSwKKwlf
X1JJU0NWX0lTQV9FWFRfQlVORExFKHp2a3NjLCByaXNjdl96dmtzY19idW5kbGVkX2V4dHMpLAor
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a3NlZCwgUklTQ1ZfSVNBX0VYVF9aVktTRUQpLAorCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHp2a3NoLCBSSVNDVl9JU0FfRVhUX1pWS1NIKSwKKwlfX1JJU0NW
X0lTQV9FWFRfQlVORExFKHp2a3NnLCByaXNjdl96dmtzZ19idW5kbGVkX2V4dHMpLAorCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHp2a3QsIFJJU0NWX0lTQV9FWFRfWlZLVCksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHNtc3RhdGVlbiwgUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pLAogCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKLS0gCjIuNDIuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
