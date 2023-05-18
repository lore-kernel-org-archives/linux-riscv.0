Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E76C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Seu/MrU2yY9IWgI5K3L1ZbsF/9VtC5q+jQYZ/GDA0jk=; b=ngfi6Gv2xlIHkF
	pWTOrsfjaNbxbzDapWE4YmGGKMFtnD8wLuA/TK06AW9RoxuLc/S3ovfd3enEiOH0w9H/QtZktVDKy
	XiedycrVYNgo+61KpdF121ePnLGhHGWm8FmlakN1IGh/Y/ZcBSE/JrZPQ1N/qEmTqR0hhJiZlZcs4
	sBWiT5Aon4p7OyPgHRtAkGltQsNu1YAqjDBrk2Qwh5jdFhqs9shwuti8VmN/sY+WTwcr3YdozlnyB
	cJodPlq7ICNH5v53UbrKN1wa7EaH/N5bO28zr6V8W8jMXAQidVbwKj6eyGs4pK0ZpD8O7LbdhyLUi
	I6RRqjxfK5pV1tYtIHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhSh-00De1S-0C;
	Thu, 18 May 2023 17:30:47 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgNP-00DRKK-0c
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:21:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d247a023aso478429b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426874; x=1687018874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UElBVrkqMO4WVRUcV67o7DLF+YtWWWQQqoV8c4X2CtE=;
        b=Scde8osi/RJWI78dDSKr9Z8zWs3x8xPBm7l1tsizui43fhRived2P29XpJ+Tr3cfUw
         O+Msaan3TmLTy2WSQlVsaVY+AKWfCkMVXM6ruBeqLn38u1LI1STlqIJ6gq2JHVSzi9dn
         q3oJpW4k2Ck4yskG1u74t4T4UGzN2EHF6wryxDyyb8YNnTYwINS3zGwrc/tonnvVkEDV
         hxSbmgO9XxYbna0eYq9P16kZZ+oWfcD5/HkY8zV1qS2+zLWE+RQUh7DaL+87Go0G5dFP
         MnMYiupH+f/cnwSLLxCTIZy/mf6AkkoYAmgdP57+MNywsFnztrio0DPW4ryIPJaO6+MI
         Sqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426874; x=1687018874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UElBVrkqMO4WVRUcV67o7DLF+YtWWWQQqoV8c4X2CtE=;
        b=FuyKCwZTd1oZmT3g1nTqL8cBksg77BrDUfdaLAxj56lvA7jcmow/8yMDVIJhMQiIas
         VzCZXd3Bw/v5cLlZbdr7im4XsOEJ6kWIv7Po+F2CuMXtaIx4bZeuKCtVQEXzKQxd8opE
         Kvh6P+Uc2s2WTfSoRI8j1YcjdhMnYpok5lfXbAmHnLEy4UDdlWphj/YLN7p4D1mkJdyD
         K1xpoxoLS4SBhZh3eUvL/W+0Tbtw4DzGTMBVfYtQSKy69MYj02BZvLVLL4TQXC+0zy5I
         Cz+BvOCyppEk8UcUYIAWxCLMx+BzGVZLJjF9rdZcXuuyYbQthTyzYNZl5Skjb6M7AfQ8
         4bxQ==
X-Gm-Message-State: AC+VfDxu0PojSAeGnp3/kgGWlal6M9A0cmvd4uv8XAaF9BF6mZKmT2li
	Ez3gUu9MXz9h+FbU3M78+sEeCXfPz68UONmWc/FJx/y9FDrQcmhmW3H6caGo4lgq2REK/gb5PZ/
	n8IMJjwNkNzGcETtBXs6cnkGaWVLQx2OBkT0+A4V2oBIUehQfaOnXFfccGczh/qCuoWRIMES71r
	DSzxLYICDzeDAJcUU=
X-Google-Smtp-Source: ACHHUZ7mYJfDn8dYj10Uzy8lAsi6jLSO38aJQ0xk/g4kw/WOaV0IOZxx9B9xtvb9xbMssxcC1CskWw==
X-Received: by 2002:a05:6a00:1ace:b0:644:18fe:91cc with SMTP id f14-20020a056a001ace00b0064418fe91ccmr5785812pfv.12.1684426874115;
        Thu, 18 May 2023 09:21:14 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:21:13 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v20 10/26] riscv: Add task switch support for vector
Date: Thu, 18 May 2023 16:19:33 +0000
Message-Id: <20230518161949.11203-11-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092115_232444_0F341880 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Jisheng Zhang <jszhang@kernel.org>, Nick Knight <nick.knight@sifive.com>, Peter Zijlstra <peterz@infradead.org>, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Ruinland Tsai <ruinland.tsai@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KClRoaXMgcGF0Y2gg
YWRkcyB0YXNrIHN3aXRjaCBzdXBwb3J0IGZvciB2ZWN0b3IuIEl0IGFsc28gc3VwcG9ydHMgYWxs
Cmxlbmd0aHMgb2Ygdmxlbi4KClN1Z2dlc3RlZC1ieTogQW5kcmV3IFdhdGVybWFuIDxhbmRyZXdA
c2lmaXZlLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBOaWNrIEtuaWdodCA8bmljay5rbmlnaHRAc2lm
aXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljayBLbmlnaHQgPG5pY2sua25pZ2h0QHNpZml2ZS5j
b20+CkNvLWRldmVsb3BlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+CkNvLWRldmVs
b3BlZC1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KQ28tZGV2ZWxvcGVk
LWJ5OiBSdWlubGFuZCBUc2FpIDxydWlubGFuZC50c2FpQHNpZml2ZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFJ1aW5sYW5kIFRzYWkgPHJ1aW5sYW5kLnRzYWlAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1i
eTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTog
VmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5keSBD
aGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJu
ZXJAdnJ1bGwuZXU+ClRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZy
dWxsLmV1PgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICB8ICAxICsK
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggICB8ICAzICsrKwogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIHwgIDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNo
L3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgfCAxOCArKysrKysrKysrKysrCiA1IGZp
bGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aAppbmRleCA5NGEwNTkwYzY5NzEuLmYwZGRmNjkxYWM1ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oCkBAIC0zOSw2ICszOSw3IEBAIHN0cnVjdCB0aHJlYWRfc3RydWN0IHsKIAl1bnNp
Z25lZCBsb25nIHNbMTJdOwkvKiBzWzBdOiBmcmFtZSBwb2ludGVyICovCiAJc3RydWN0IF9fcmlz
Y3ZfZF9leHRfc3RhdGUgZnN0YXRlOwogCXVuc2lnbmVkIGxvbmcgYmFkX2NhdXNlOworCXN0cnVj
dCBfX3Jpc2N2X3ZfZXh0X3N0YXRlIHZzdGF0ZTsKIH07CiAKIC8qIFdoaXRlbGlzdCB0aGUgZnN0
YXRlIGZyb20gdGhlIHRhc2tfc3RydWN0IGZvciBoYXJkZW5lZCB1c2VyY29weSAqLwpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc3dpdGNoX3RvLmgKaW5kZXggNGI5NmIxM2RlZTI3Li5hNzI3YmU3MjNjNTYgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaApAQCAtOCw2ICs4LDcgQEAKIAogI2luY2x1ZGUg
PGxpbnV4L2p1bXBfbGFiZWwuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrX3N0YWNrLmg+
CisjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogI2luY2x1ZGUgPGFzbS9od2NhcC5oPgogI2luY2x1
ZGUgPGFzbS9wcm9jZXNzb3IuaD4KICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+CkBAIC03OCw2ICs3
OSw4IEBAIGRvIHsJCQkJCQkJXAogCXN0cnVjdCB0YXNrX3N0cnVjdCAqX19uZXh0ID0gKG5leHQp
OwkJXAogCWlmIChoYXNfZnB1KCkpCQkJCQlcCiAJCV9fc3dpdGNoX3RvX2ZwdShfX3ByZXYsIF9f
bmV4dCk7CVwKKwlpZiAoaGFzX3ZlY3RvcigpKQkJCQkJXAorCQlfX3N3aXRjaF90b192ZWN0b3Io
X19wcmV2LCBfX25leHQpOwlcCiAJKChsYXN0KSA9IF9fc3dpdGNoX3RvKF9fcHJldiwgX19uZXh0
KSk7CQlcCiB9IHdoaWxlICgwKQogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKaW5k
ZXggZTBkMjAyMTM0YjQ0Li45N2U2ZjY1ZWMxNzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVh
ZF9pbmZvLmgKQEAgLTgxLDYgKzgxLDkgQEAgc3RydWN0IHRocmVhZF9pbmZvIHsKIAkucHJlZW1w
dF9jb3VudAk9IElOSVRfUFJFRU1QVF9DT1VOVCwJXAogfQogCit2b2lkIGFyY2hfcmVsZWFzZV90
YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzayk7CitpbnQgYXJjaF9kdXBfdGFza19z
dHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsK
KwogI2VuZGlmIC8qICFfX0FTU0VNQkxZX18gKi8KIAogLyoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5o
CmluZGV4IDNjMjlmNGViNTUyYS4uY2U2YTc1ZTljZjYyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9y
LmgKQEAgLTEyLDYgKzEyLDkgQEAKICNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1YKIAogI2luY2x1
ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+CisjaW5jbHVk
ZSA8bGludXgvc2NoZWQvdGFza19zdGFjay5oPgorI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KICNp
bmNsdWRlIDxhc20vaHdjYXAuaD4KICNpbmNsdWRlIDxhc20vY3NyLmg+CiAjaW5jbHVkZSA8YXNt
L2FzbS5oPgpAQCAtMTI0LDYgKzEyNywzOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92
X3ZzdGF0ZV9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpyZXN0b3JlXwogCXJp
c2N2X3ZfZGlzYWJsZSgpOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVf
c2F2ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssCisJCQkJICAgICAgIHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQoreworCWlmICgocmVncy0+c3RhdHVzICYgU1JfVlMpID09IFNSX1ZTX0RJUlRZKSB7
CisJCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAmdGFzay0+dGhyZWFkLnZz
dGF0ZTsKKworCQlfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUodnN0YXRlLCB2c3RhdGUtPmRhdGFwKTsK
KwkJX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKKwl9Cit9CisKK3N0YXRpYyBpbmxpbmUg
dm9pZCByaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKKwkJ
CQkJICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlpZiAoKHJlZ3MtPnN0YXR1cyAmIFNSX1ZT
KSAhPSBTUl9WU19PRkYpIHsKKwkJc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnZzdGF0ZSA9
ICZ0YXNrLT50aHJlYWQudnN0YXRlOworCisJCV9fcmlzY3Zfdl92c3RhdGVfcmVzdG9yZSh2c3Rh
dGUsIHZzdGF0ZS0+ZGF0YXApOworCQlfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKHJlZ3MpOworCX0K
K30KKworc3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnByZXYsCisJCQkJICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0KQoreworCXN0
cnVjdCBwdF9yZWdzICpyZWdzOworCisJcmVncyA9IHRhc2tfcHRfcmVncyhwcmV2KTsKKwlyaXNj
dl92X3ZzdGF0ZV9zYXZlKHByZXYsIHJlZ3MpOworCXJpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUobmV4
dCwgdGFza19wdF9yZWdzKG5leHQpKTsKK30KKwogI2Vsc2UgLyogISBDT05GSUdfUklTQ1ZfSVNB
X1YgICovCiAKIHN0cnVjdCBwdF9yZWdzOwpAQCAtMTMyLDYgKzE2Nyw5IEBAIHN0YXRpYyBpbmxp
bmUgaW50IHJpc2N2X3Zfc2V0dXBfdnNpemUodm9pZCkgeyByZXR1cm4gLUVPUE5PVFNVUFA7IH0K
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfdmVjdG9yKHZvaWQpIHsgcmV0dXJuIGZh
bHNlOyB9CiBzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfcXVlcnkoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpIHsgcmV0dXJuIGZhbHNlOyB9CiAjZGVmaW5lIHJpc2N2X3ZfdnNpemUgKDAp
CisjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX3NhdmUodGFzaywgcmVncykJCWRvIHt9IHdoaWxlICgw
KQorI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHRhc2ssIHJlZ3MpCWRvIHt9IHdoaWxl
ICgwKQorI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBfX25leHQpCWRvIHt9IHdo
aWxlICgwKQogI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxlICgw
KQogI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdoaWxlICgwKQogCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9jZXNzLmMKaW5kZXggZTJhMDYwMDY2NzMwLi5iN2ExMDM2MWRkYzYgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9j
ZXNzLmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+CiAjaW5j
bHVkZSA8YXNtL3RocmVhZF9pbmZvLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWlkbGUuaD4KKyNpbmNs
dWRlIDxhc20vdmVjdG9yLmg+CiAKIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFs
IF9fYXNtX18oImdwIik7CiAKQEAgLTE0NiwxMiArMTQ3LDI4IEBAIHZvaWQgZmx1c2hfdGhyZWFk
KHZvaWQpCiAJZnN0YXRlX29mZihjdXJyZW50LCB0YXNrX3B0X3JlZ3MoY3VycmVudCkpOwogCW1l
bXNldCgmY3VycmVudC0+dGhyZWFkLmZzdGF0ZSwgMCwgc2l6ZW9mKGN1cnJlbnQtPnRocmVhZC5m
c3RhdGUpKTsKICNlbmRpZgorI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgorCS8qIFJlc2V0IHZl
Y3RvciBzdGF0ZSAqLworCXJpc2N2X3ZfdnN0YXRlX29mZih0YXNrX3B0X3JlZ3MoY3VycmVudCkp
OworCWtmcmVlKGN1cnJlbnQtPnRocmVhZC52c3RhdGUuZGF0YXApOworCW1lbXNldCgmY3VycmVu
dC0+dGhyZWFkLnZzdGF0ZSwgMCwgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSk7
CisjZW5kaWYKK30KKwordm9pZCBhcmNoX3JlbGVhc2VfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tf
c3RydWN0ICp0c2spCit7CisJLyogRnJlZSB0aGUgdmVjdG9yIGNvbnRleHQgb2YgZGF0YXAuICov
CisJaWYgKGhhc192ZWN0b3IoKSkKKwkJa2ZyZWUodHNrLT50aHJlYWQudnN0YXRlLmRhdGFwKTsK
IH0KIAogaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYykKIHsKIAlmc3RhdGVfc2F2ZShzcmMsIHRhc2tfcHRfcmVn
cyhzcmMpKTsKIAkqZHN0ID0gKnNyYzsKKwkvKiBjbGVhciBlbnRpcmUgViBjb250ZXh0LCBpbmNs
dWRpbmcgZGF0YXAgZm9yIGEgbmV3IHRhc2sgKi8KKwltZW1zZXQoJmRzdC0+dGhyZWFkLnZzdGF0
ZSwgMCwgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSk7CisKIAlyZXR1cm4gMDsK
IH0KIApAQCAtMTg0LDYgKzIwMSw3IEBAIGludCBjb3B5X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnAsIGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncykKIAkJcC0+dGhyZWFk
LnNbMF0gPSAwOwogCX0KIAlwLT50aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9m
b3JrOworCXJpc2N2X3ZfdnN0YXRlX29mZihjaGlsZHJlZ3MpOwogCXAtPnRocmVhZC5zcCA9ICh1
bnNpZ25lZCBsb25nKWNoaWxkcmVnczsgLyoga2VybmVsIHNwICovCiAJcmV0dXJuIDA7CiB9Ci0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
