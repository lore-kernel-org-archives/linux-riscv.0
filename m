Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C728CCF2C4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4huavVVCQzEj2h+YOwTamS/inJvC2wP2ksmrQ7JX50=; b=4i1+6EaoWz49A6
	w9YaiMfsLPHbn/37ZyNycaJr57TKzrbFkm9N/OL81fokiwWxyEF6jMrVIJ+HWNv/vjJadIATHHFie
	7yjRGfx8X14ySMnQvP672wevjSajClVE7fMwDj4cs6QZ+jnW1NsKxZYqZhh2fR/6/yvdJqimku9GG
	uLwO9bxqM0VAA+5n6P6SBAmC0gJdMpss9mwFX+fKKcJA/oV0j9M/UAwjQelNZY5PYK7HInikCrER4
	sjobRywecI2/tlSDK+m/dJz90vw4Wy9cczrPqxg67NlkstjPGhqzgISx2j3ta1l07foRP0P6vpCEC
	382rHIBQzeDxht6E3n7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsp-00000003vPe-0gpY;
	Fri, 16 Oct 2026 19:46:27 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsn-00000003vOL-2kuN
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:26 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35ef6b49813so481033eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179985; x=1792784785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzEjDaJTDISex2ZPOiizRCuwngZ28JcDGHKte0m6HrM=;
        b=r9PfYDJwdiNRuAMyuxviHc5jEeujW2CkjUybgXmEa0X08aTEGEyXa8J7Lrn0h0o9wm
         e7iCoRsvxLgh7IQVnekM66gXhPxi+3o9CjRR+b0EDy06L9YVNi8a+7veVfvIDts3yIy7
         YixxTB92maPnTo1EczUC/pdSHnemC8RzmevI+ErJvT3mRKZAX2782Pcgplzl6+ThnnFi
         wOZmoQnkVt6SmVe7TFr0GrHRFpCT0Sqr8rvzUrAA+3kRC/EPJJXprCrsh58qZQl8G5hq
         65nUIx6EVrWsSMygSmlr75xRRV9Pldc2zKsIF4fO8/wErwuhlDJ1VXmZOE6HScwCQbyn
         TKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179985; x=1792784785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzEjDaJTDISex2ZPOiizRCuwngZ28JcDGHKte0m6HrM=;
        b=ip+es6bUqS0QeBSqxFsmNpveQvNwxeQNQbSR4HMFDqAUET0S/EJZt8ukYMyOa+EGNZ
         /u2NBtXey8JaoK8UYp2hDVDE7dexFg+Wo5Z2tht0Gst/8QSir7V6mM5M4uEdL6LWFasA
         cpq+qCGnSznXSMBc7T/AysMXVh4H8Eyh0Xg6az1+cWui2NStlX1Y6dqt+9ZYOnWHgmOz
         xljuPUcWscTcZOh108c4X4kh5zoUdDk3YrHpoIu7AJO082nQMG0Z1kOyupXT5bq5K4Kt
         s06KaP7IYNiGUNLVzzT3EEspjdC687gIGFIUdiHE9tYFFNzDXy5l9myx63QvLv456H7d
         YoYA==
X-Forwarded-Encrypted: i=1; AKwUvBxZqkyGwvuEfM4Pbd6OYCqjOv4pFvndtxzzZQUyMeOc/pGP/0bMWX8gga6EBEzpY7FU4467huKfZiCH9g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJF4RlH69ktHclZ/LEwCtTYKD7dMakwspqdaAYRgkdtv9aUM4sW
	O/BMj4MoHBpRe6eGW+kPv9GrthIebto0uH0oYdXdwmoatNH1Xa1czXSS
X-Gm-Gg: AYBFou2geQkQor1SLzQa68ypfaYfo3CHgKPGFC8UYU/960zNxW2AgHRpEFTu0+enYdH
	hkDJnY9SYFkqz/c2haHDU+84kh56NRs0dNTUivADu2BnfBNdjifmApilarbJ06D/UiK3Pjgjws9
	fSMG1NMwlVWRz1T7BaiGPvcZCcuBp/AHDXShK2uuOq2FUjgVfJMYKZ3ZdMcbtbnHfz6xG1c0Zet
	uSJPXsqe8tj7DgIwiagAnm1yYOaIp9E3mb6AK8qMk7eh0Ho2gTFEJelGht7/Ls1dhFk2qXJdspS
	oHMtapk/GZ4urvZAihy4nSSFsMDlY58yYdT72tnpnm/ugfffvENUDWQrQsuGnC/ZWeWN/2mGeMv
	MTIaXmt5RTkSBfQ3e36953ALSKjIS/2faegq3qMG2BJs/V01/dECD4E5mFry0sSCjoYApqudLEG
	J4dwoEIFdV9diPaMH/GmlZj3oBRQw1ZKYmRQoifPuXye/U2cXkzu2ORJZY00ZrMrx0BYfNTWDnf
	R8=
X-Received: by 2002:a05:7022:f90e:b0:168:3243:c937 with SMTP id a92af1059eb24-185119e3cfamr1015727c88.16.1792179983649;
        Fri, 16 Oct 2026 12:46:23 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:22 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] riscv/shstk: release shadow stack on failed fork
Date: Fri, 16 Oct 2026 16:46:01 -0300
Message-ID: <75e29a5db0166247c407bd51f184864b398a2ee6.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124625_712672_CCC075A7 
X-CRM114-Status: GOOD (  13.67  )
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

Y29weV90aHJlYWQoKSBtYXBzIGEgc2hhZG93IHN0YWNrIGZvciBhIENMT05FX1ZNIGNoaWxkIGFu
ZCBjYW4gc3RpbGwKcmV0dXJuIDAuIEEgbGF0ZXIgY29weV9wcm9jZXNzKCkgZmFpbHVyZSwgaW5j
bHVkaW5nIGNsb25lMygpCkNMT05FX1BJREZEIHdoZW4gcHV0X3VzZXIoKSBmYWlscywgZ29lcyB0
aHJvdWdoCmJhZF9mb3JrX2NsZWFudXBfdGhyZWFkIGFuZCBleGl0X3RocmVhZCgpLiByaXNjdiBk
aWQgbm90IHNlbGVjdApIQVZFX0VYSVRfVEhSRUFELCBzbyB0aGF0IGZyZWUgd2FzIGEgbm8tb3Au
IHNoc3RrX3JlbGVhc2UoKSBhbHJlYWR5CmRvY3VtZW50cyB0aGlzIGNhbGw7IGRlYWN0aXZhdGVf
bW0oKSBpcyB0aGUgb25seSBwYXRoIHRoYXQgYWN0dWFsbHkKcmVhY2hlZCBpdC4KClNlbGVjdCBI
QVZFX0VYSVRfVEhSRUFEIGFuZCBjYWxsIHNoc3RrX3JlbGVhc2UoKSBmcm9tCmV4aXRfdGhyZWFk
KCkuIFRoZSBoZWxwZXIgYWxyZWFkeSByZWZ1c2VzIGEgZGlmZmVyZW50IG1tIGFuZCBhCmNsZWFy
ZWQgYmFzZSwgc28gQ0xPTkVfVkZPUkssICFDTE9ORV9WTSwgYW5kIGEgc2Vjb25kIGNhbGwgYWZ0
ZXIKZGVhY3RpdmF0ZV9tbSgpIHN0YXkgbm8tb3BzLgoKRG8gbm90IGZyZWUgd2hlbiBzaHN0a19h
bGxvY190aHJlYWRfc3RhY2soKSBmYWlscy4gVGhhdCBlcnJvcgpyZXR1cm5zIGZyb20gY29weV90
aHJlYWQoKSB3aXRoIHRoZSBpbmhlcml0ZWQgcGFyZW50IGJhc2Ugc3RpbGwgaW4KcGxhY2UsIGFu
ZCBjb3B5X3Byb2Nlc3MoKSBza2lwcyBleGl0X3RocmVhZCgpIG9uIHRoYXQgcGF0aC4KCkEga3Ro
cmVhZCBjb3BpZXMgdGhlIGNhbGxlcidzIHRyYWNraW5nIHZpYSBhcmNoX2R1cF90YXNrX3N0cnVj
dCgpLgprZXJuZWxfdGhyZWFkKCkgdXNlcyBDTE9ORV9WTSwgc28gZHVyaW5nIGEgZmFpbGVkIGNv
cHlfcHJvY2VzcygpCnRoZSBjaGlsZCBzdGlsbCBzaGFyZXMgdGhlIGNhbGxlcidzIG1tIGFuZCBz
aHN0a19yZWxlYXNlKCkncyBtbQpjaGVjayBkb2VzIG5vdCBzYXZlIHVzLiBDbGVhciB0aGUgaW5o
ZXJpdGVkIHRyYWNraW5nIGFzIHBhcnQgb2YKa3RocmVhZCBzZXR1cC4KCkZpeGVzOiBmZDQ0YTRh
ODU1MTYgKCJyaXNjdi9zaHN0azogSWYgbmVlZGVkIGFsbG9jYXRlIGEgbmV3IHNoYWRvdyBzdGFj
ayBvbiBjbG9uZSIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCkNjOiBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT4KQXNzaXN0ZWQtYnk6IExMTQpTaWduZWQtb2ZmLWJ5OiBJdsOh
biBFemVxdWllbCBSb2RyaWd1ZXogPGl2YW5yd2NtMjVAZ21haWwuY29tPgotLS0KIGFyY2gvcmlz
Y3YvS2NvbmZpZyAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyB8
IDE4ICsrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmlu
ZGV4IDU4NzRjYTMwZjRmNi4uNzYzNWY4Y2IwMzk3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tj
b25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC0xNjksNiArMTY5LDcgQEAgY29uZmln
IFJJU0NWCiAJc2VsZWN0IEhBVkVfRlVOQ1RJT05fR1JBUEhfRlJFR1MKIAlzZWxlY3QgSEFWRV9G
VU5DVElPTl9UUkFDRVIgaWYgSEFWRV9EWU5BTUlDX0ZUUkFDRQogCXNlbGVjdCBIQVZFX0VCUEZf
SklUIGlmIE1NVQorCXNlbGVjdCBIQVZFX0VYSVRfVEhSRUFECiAJc2VsZWN0IEhBVkVfR0VORVJJ
Q19USUZfQklUUwogCXNlbGVjdCBIQVZFX0dVUF9GQVNUIGlmIE1NVQogCXNlbGVjdCBIQVZFX0ZV
TkNUSU9OX0FSR19BQ0NFU1NfQVBJCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9j
ZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggN2NjNWE2YTVjMDIwLi5k
ZWYxZjUyMGQ5ZWYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKQEAgLTEyLDYgKzEyLDcgQEAKICNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPGxp
bnV4L3NjaGVkL2RlYnVnLmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgogI2luY2x1
ZGUgPGxpbnV4L3NjaGVkL3Rhc2tfc3RhY2suaD4KICNpbmNsdWRlIDxsaW51eC90aWNrLmg+CiAj
aW5jbHVkZSA8bGludXgvcHRyYWNlLmg+CkBAIC0yMTMsNiArMjE0LDE2IEBAIHZvaWQgYXJjaF9y
ZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQogCQlyaXNjdl92X3Ro
cmVhZF9mcmVlKHRzayk7CiB9CiAKK3ZvaWQgZXhpdF90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0
ICp0c2spCit7CisJLyoKKwkgKiBzaHN0a19yZWxlYXNlKCkgZG9jdW1lbnRzIHRoaXMgY2FsbCBm
b3IgYSBmYWlsZWQgQ0xPTkVfVk0KKwkgKiBjbG9uZS4gY29weV9wcm9jZXNzKCkgcmVhY2hlcyBp
dCBvbmx5IGFmdGVyIGNvcHlfdGhyZWFkKCkKKwkgKiByZXR1cm5zIDA7IGRlYWN0aXZhdGVfbW0o
KSBkb2VzIG5vdCBydW4gb24gdGhhdCBwYXRoLgorCSAqLworCXNoc3RrX3JlbGVhc2UodHNrKTsK
K30KKwogaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYykKIHsKIAlmc3RhdGVfc2F2ZShzcmMsIHRhc2tfcHRfcmVn
cyhzcmMpKTsKQEAgLTI2MSw2ICsyNzIsMTMgQEAgaW50IGNvcHlfdGhyZWFkKHN0cnVjdCB0YXNr
X3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdzKQogCQlwLT50
aHJlYWQuc1swXSA9ICh1bnNpZ25lZCBsb25nKWFyZ3MtPmZuOwogCQlwLT50aHJlYWQuc1sxXSA9
ICh1bnNpZ25lZCBsb25nKWFyZ3MtPmZuX2FyZzsKIAkJcC0+dGhyZWFkLnJhID0gKHVuc2lnbmVk
IGxvbmcpcmV0X2Zyb21fZm9ya19rZXJuZWxfYXNtOworCQkvKgorCQkgKiBrZXJuZWxfdGhyZWFk
KCkgdXNlcyBDTE9ORV9WTSwgc28gYSBmYWlsZWQKKwkJICogY29weV9wcm9jZXNzKCkgc3RpbGwg
c2hhcmVzIHRoZSBjYWxsZXIncyBtbS4KKwkJICogSW5oZXJpdGVkIHRyYWNraW5nIHdvdWxkIHRo
ZW4gbG9vayBsaWtlIGEgY2hpbGQKKwkJICogbWFwcGluZyB0byBzaHN0a19yZWxlYXNlKCkuCisJ
CSAqLworCQlzZXRfc2hzdGtfYmFzZShwLCAwLCAwKTsKIAl9IGVsc2UgewogCQkvKiBhbGxvY2F0
ZSBuZXcgc2hhZG93IHN0YWNrIGlmIG5lZWRlZC4gSW4gY2FzZSBvZiBDTE9ORV9WTSB3ZSBoYXZl
IHRvICovCiAJCXNzcCA9IHNoc3RrX2FsbG9jX3RocmVhZF9zdGFjayhwLCBhcmdzKTsKLS0gCjIu
NDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
