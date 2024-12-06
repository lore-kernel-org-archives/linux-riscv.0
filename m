Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5DBE77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 17:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sIA37XHvZlntCS2OcEZYyu2Sb4L2kGPTfcPUFOaIiYk=; b=tbPNL2qL1mjQ9x
	rpgVuDv0asyg8xUqwLZma6SaBXjM+0rM5TfjvNalgUG8Q0cohjCWDsBDJXPfuTfUtva8+3ZhSVOG+
	BddiAn/ygRFIpGTfKqcAEsUfBpv7R6/ZnRPfGXEV7t2XsRduDAcVerRylGtlWunXJzQcHZlYOrvpi
	bAtnKxTaP/tjiN+2DJsTYpjnLtnidNTgffYTUzB0z2tPQq94zPDAF0nwNzEr+8B8Q2C8gVLSosntH
	85DgrqGnQePzIvHalZk/rngQdaoaPfrJ8V6S5MzNaY0A92LO+9zhfYWTZCEU1VvWDlHYas3v5mjmA
	1LVrvoJHgS36iKpapLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcV7-00000002OTe-2sTL;
	Fri, 06 Dec 2024 17:52:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcV5-00000002OTE-066L
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 17:52:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21628b3fe7dso1178365ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 09:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733507540; x=1734112340; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t74r+A3G8A2DioiaE7k2dQqMFjTyp32lyeabaPRYOLc=;
        b=wwChnFJe1loiaGJqLoQL1kbf0CFVF82dU2h4Jg1gtxi88WhczJsoJsU4O5psJh/1P7
         4HzsQm9/cJIr5DtmqOam+vR2gyugVw4LenjJadBj0O4mmtF3m9ftGIvtmjrbOdDZUlLJ
         TVVqQJ0qTIadlN07pHel6mR8KfmCXA3exVHkPf5CzPJsPUYyPbByGtr9RiAK7m7Z+TmR
         JFfFiZADBm0SbJRKVdv3oxd1hdaLsSM2ydjks4yI9TOraF+SCH9YLfpDczD10IYHurnk
         zoTWZbg9+Uu17tCL256XXyZlWLEbA2wYVtb5R3GxbpHfUfuk/KCBXvvpjGbGfci+TMnF
         6qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733507540; x=1734112340;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t74r+A3G8A2DioiaE7k2dQqMFjTyp32lyeabaPRYOLc=;
        b=VfxvH6X06ONM005/sbfpgWRzt18rmjN9mw9qLRaEPQ5vT/Sj2mXf5BL3pUZwfAzE5g
         E+uYez8Myp4ASMXKJPQuURVOnJYcPp0mXceM2sxXsy7WDh5/Da7TgY4/GF4ZsquGHxj9
         km55FWaHJy3zoAFd/MzXNNiJOHSBHqCBAT54ep3ww/n6VMs5VluuTUSL81HVKurjypPI
         aZqh9yuvkOu9FqyiN25y8cI/pjtpn3LgE7jn9VmllJDumPOO0S3J/jyMIttKOwik15hK
         /RZl7+fREAJHe8ve3c9hI3Yqr/tftf4hav+TwpRAFIzD2DdDMnLEeeyOzaXSa2pDunKB
         D4/w==
X-Forwarded-Encrypted: i=1; AJvYcCVrvaNIdLcwIOSA7wiMo70FCNcCdvk4bJ/VkxoetYG2XplcKegNNrw67a0AutyIK7yViKlvVAf7CEgQhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3AsQZXqMZkBi80XRCUCNBWBuwEwNTCn0O/F5AURm0fir6fVJH
	mfQ16giURd9J/IEej8je6mO+2EegaHxRw/CQueW3FjLkQELmC4x9iVCeo2/U9sQ=
X-Gm-Gg: ASbGncurQxohu14H39R558w+qZ4gobriIpiIEnE8orCIze2yArtLRI75WQyGQcUu8W5
	Niw8a4MhIZMIi/45qErta5tk4mV8RFl4h+mGTVdFsHtdyzbT7vo7vfZCyDKwkI0DO0QBfbpYf9r
	Wyq7rW/3erEsg7zwWy+Yl+GKuT3lnL/R87vbGrPNWqSYzqiBJSskRCey5dvY23F6+9VshW5LJeU
	bQrTes8eKHVrXVV9tHGs6tb3KIAwjSAkG9WOGL16yX68PGG99W0qzzC8HFUf1+RCg==
X-Google-Smtp-Source: AGHT+IHJY3+a/koaJNAgjd3cks/U/UAswsKw1upCByf2SIYnfguQrHFIStQdCoJiAXcWG1KzXuXRfg==
X-Received: by 2002:a17:902:cecc:b0:215:b18d:ef with SMTP id d9443c01a7336-21614d4e548mr43127485ad.25.1733507539892;
        Fri, 06 Dec 2024 09:52:19 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f091fesm31464545ad.194.2024.12.06.09.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:52:19 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 06 Dec 2024 09:52:11 -0800
Subject: [PATCH v5] riscv: selftests: Fix warnings pointer masking test
MIME-Version: 1.0
Message-Id: <20241206-fix_warnings_pointer_masking_tests-v5-1-ed566c2f27e8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMo5U2cC/5XNwW7DIBAE0F+JOJcKMIvtnvofVWRhsiSrKhCxF
 k0V+d9LcqqqHOrjjDRvboKxELJ4291EwUpMObUALzsRTj4dUdKhZWGUsdooKyNdpy9fEqUjT5d
 MacEynT1/tmJakBeW3eAU2tiBNaNo0KVgWz1OPvYtn4iXXL4fn1Xf20181VJL9BpH5yBg798L1
 cyUwmvIZ3F/qGa7apqq56gCqBEiDE/U7rcK/1K7pkIww6zi6Kw6PFHtdtU2VYW+x7k3YAf3R13
 X9Qcc1RmG2QEAAA==
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3302; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=wHElZ6pqb0iSr7hWzaw1Hkcd5+EIf3oGgJDHM5LJtKY=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qw5WnfF8acWToTNvwVzjh6/IRoUr4p30Q17/mnt2Y4i
 z86P/V+RykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABOpXc3I0HJaKCGA4+SsaGXr
 gzOO/z8lu0HcLq3kG8uhQMlPnwXqpRn+V0wy9V5u0n42cNmH3xl2xyY/aFn91TXqtvw1OUOfB0c
 auQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_095223_061734_9690D3F4 
X-CRM114-Status: GOOD (  11.75  )
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

V2hlbiBjb21waWxpbmcgdGhlIHBvaW50ZXIgbWFza2luZyB0ZXN0cyB3aXRoIC1XYWxsIHRoaXMg
d2FybmluZwppcyBwcmVzZW50OgoKcG9pbnRlcl9tYXNraW5nLmM6IEluIGZ1bmN0aW9uIOKAmHRl
c3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bOKAmToKcG9pbnRlcl9tYXNraW5nLmM6MjAzOjk6IHdh
cm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkKZGVjbGFyZWQgd2l0
aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCiAg
MjAzIHwgICAgICAgICBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7IHwKICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5jOjIwODo5OiB3YXJuaW5nOgppZ25vcmlu
ZyByZXR1cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlCuKA
mHdhcm5fdW51c2VkX3Jlc3VsdOKAmSBbLVd1bnVzZWQtcmVzdWx0XQogIDIwOCB8ICAgICAgICAg
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwoKSSBjYW1lIGFjcm9zcyB0aGlzIG9uIHJpc2N2NjQt
bGludXgtZ251LWdjYyAoVWJ1bnR1CjExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCgpGaXggdGhpcyBi
eSBjaGVja2luZyB0aGF0IHRoZSBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbiBlcXVhbCB0aGUgZXhw
ZWN0ZWQKbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4uCgpGaXhlczogNzQ3MGI1YWZkMTUwICgicmlz
Y3Y6IHNlbGZ0ZXN0czogQWRkIGEgcG9pbnRlciBtYXNraW5nIHRlc3QiKQpTaWduZWQtb2ZmLWJ5
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KQ2hhbmdlcyBpbiB2
NToKLSBObyBsb25nZXIgc2tpcCBzZWNvbmQgcHdyaXRlIGlmIGZpcnN0IG9uZSBmYWlscwotIFVz
ZSB3cmFwcGVyIGZ1bmN0aW9uIGluc3RlYWQgb2YgZ290byAoRHJldykKLSBMaW5rIHRvIHY0OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjA1LWZpeF93YXJuaW5nc19wb2ludGVyX21h
c2tpbmdfdGVzdHMtdjQtMS0wYzc3ZWI3MjU0ODZAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY0
OgotIFNraXAgc3lzY3RsX2VuYWJsZWQgdGVzdCBpZiBmaXJzdCBwd3JpdGUgZmFpbGVkCi0gTGlu
ayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNS1maXhfd2FybmluZ3Nf
cG9pbnRlcl9tYXNraW5nX3Rlc3RzLXYzLTEtNWMyOGIwZjk2NDBkQHJpdm9zaW5jLmNvbQoKQ2hh
bmdlcyBpbiB2MzoKLSBGaXggc3lzY3RsIGVuYWJsZWQgdGVzdCBjYXNlIChEcmV3L0FsZXgpCi0g
TW92ZSBwd3JpdGUgZXJyIGNvbmRpdGlvbiBpbnRvIGdvdG8gKERyZXcpCi0gTGluayB0byB2Mjog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNC1maXhfd2FybmluZ3NfcG9pbnRlcl9t
YXNraW5nX3Rlc3RzLXYyLTEtMWJmMGM1MDk1ZjU4QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2
MjoKLSBJIGhhZCByZXQgIT0gMiBmb3IgdGVzdGluZywgSSBjaGFuZ2VkIGl0IHRvIGJlIHJldCAh
PSAxLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4
X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12MS0xLWVhMWU5NjY1Y2U3YUByaXZvc2lu
Yy5jb20KLS0tCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2lu
Zy5jICB8IDIyICsrKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwppbmRleCBkZWU0MWI3ZWUzZTMuLjUwYzRk
MWJjNzU3MCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3Bv
aW50ZXJfbWFza2luZy5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9w
b2ludGVyX21hc2tpbmcuYwpAQCAtMTg1LDggKzE4NSwyMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2Zv
cmtfZXhlYyh2b2lkKQogCX0KIH0KIAorc3RhdGljIGJvb2wgcHdyaXRlX3dyYXBwZXIoaW50IGZk
LCB2b2lkICpidWYsIHNpemVfdCBjb3VudCwgY29uc3QgY2hhciAqbXNnKQoreworCWludCByZXQg
PSBwd3JpdGUoZmQsIGJ1ZiwgY291bnQsIDApOworCisJaWYgKHJldCAhPSBjb3VudCkgeworCQlr
c2Z0X3BlcnJvcihtc2cpOworCQlyZXR1cm4gZmFsc2U7CisJfQorCXJldHVybiB0cnVlOworfQor
CiBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKIHsKKwljaGFy
ICplcnJfcHdyaXRlX21zZyA9ICJmYWlsZWQgdG8gd3JpdGUgdG8gL3Byb2Mvc3lzL2FiaS90YWdn
ZWRfYWRkcl9kaXNhYmxlZFxuIjsKIAljaGFyIHZhbHVlOwogCWludCBmZDsKIApAQCAtMjAwLDE0
ICsyMTIsMTIgQEAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZvaWQp
CiAJfQogCiAJdmFsdWUgPSAnMSc7Ci0JcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwotCWtzZnRf
dGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAtRUlO
VkFMLAotCQkJICJzeXNjdGwgZGlzYWJsZWRcbiIpOworCWlmICghcHdyaXRlX3dyYXBwZXIoZmQs
ICZ2YWx1ZSwgMSwgIndyaXRlICcxJyIpKQorCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoZXJyX3B3
cml0ZV9tc2cpOwogCiAJdmFsdWUgPSAnMCc7Ci0JcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwot
CWtzZnRfdGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9
PSAwLAotCQkJICJzeXNjdGwgZW5hYmxlZFxuIik7CisJaWYgKCFwd3JpdGVfd3JhcHBlcihmZCwg
JnZhbHVlLCAxLCAid3JpdGUgJzAnIikpCisJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbChlcnJfcHdy
aXRlX21zZyk7CiAKIAlzZXRfdGFnZ2VkX2FkZHJfY3RybCgwLCBmYWxzZSk7CiAKCi0tLQpiYXNl
LWNvbW1pdDogNDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNwpjaGFuZ2Ut
aWQ6IDIwMjQxMjA0LWZpeF93YXJuaW5nc19wb2ludGVyX21hc2tpbmdfdGVzdHMtMzg2MGU0ZjM1
NDI5Ci0tIAotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
