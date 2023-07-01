Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27540EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgRcx892o1iMKhgU7eJscI5H3alQQS6p+xHm5/GkCSI=; b=RlNh4VRGMlYV+O
	GaXiYgc9R0P48u1zWwuxq7ABK+yjA4kbwqwae+3KiHhEUhWA8gSFGlpUPxtLKm5orJLX046pfFWTl
	poHvYWsQ/3LvYSrdpc6e1u6h0mY+IN3Gd9oHsiRM7J/eVe4/0AMA1IZBWfHFR0QnDN9pVXfDrnc/M
	+hif1frg4gxjvj4bAR+gOm3SXTfHcMA4IYacAamSI25euevh6csY5ITMPbdN3lnRmXPIBqvnaVoei
	I8zp0m/3sDyBWi8/TO9jvixz2Olc2QGCNW9waSnE89gzq+kCdnwFzHVta2elSWxdj1T6nOd4hx3il
	c06RXUr/HsWuOhWnDLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFbhi-006ATg-2n;
	Sat, 01 Jul 2023 14:36:02 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFbhf-006ARD-1y;
	Sat, 01 Jul 2023 14:36:01 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69f1570b2so48333071fa.0;
        Sat, 01 Jul 2023 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688222157; x=1690814157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V/OaCk35GXcvxIpFzFUkmNdu7t+Cev7etdBc/VnCek=;
        b=lM2R9YLWTG63m4x3XLk1JBq46StY57Yi1KchPgo6OP1FGoUOGKGeA2mSLMbBPoN/R3
         wwHbCBy/o7/MZp6JBoZqKE5CWisIZmWdwlJNzLZChC/3/y5gKq4jlYyseMonUPnbemcO
         6fm581uIutzDokJzmJ3/tHMh1bRG/3TPNbRQ4TDLC+7DzgmE6zkKK475KqsAhq0DjeIL
         ziF+8fs5yGgaT8EUHtCP5J89OX1P36SU7zDL/7ue6y/WiDgK0/g1ivKOXTSkhUyvIkzF
         Noal17wCUkpPLCPxlmGil+JaW7kqp293Ph89hxPOBHRAl56YKYT5hs415bdMytOaGU3T
         xnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688222157; x=1690814157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V/OaCk35GXcvxIpFzFUkmNdu7t+Cev7etdBc/VnCek=;
        b=fZbTXAzl5VVA19wmv9P05xwRcOEwZpsTnfYqo34IAWOPDm5hetGrkTqNDID2MPx8HW
         9BCxWgoOAo1dx016e1UdKamZ/usd6NYTOfNV737/YGa0U46q17G6BVq3+2FAIon4Nj55
         9CMhX3s54Cj+CJsxLC0C5twc0gS9Sa7Fn4RYVtja9l1wp1HsCV5n3NocgOalCYO17dbj
         RYy/whSKoomVb4paZKGPWQeT+tYjgnlPar+w2C1TNAm6Hy9/jqqQ4pTPxs1JYQG1WzVM
         XwJ/bjiBKskYB3Jz1XGfXssEh3mny9BhwtSmLgfznscBFUmFt0kJIQBdYYG1tcus0FUb
         P/qQ==
X-Gm-Message-State: ABy/qLZP4k6Cee36oZZVpohiQbZyf/y3+vZduF0M9tmuyPVwv82Y0lOM
	vQYYd2gfAjhcSzGKE+4ZXfPIjrVh2hIcrsTI1qw=
X-Google-Smtp-Source: APBJJlG/QIcXSayEfxPpuYGywiiOlYiD+XK2+DWZtT+iwy6MKp99BEaedzmKCQ1YYvFUUhsoDckL5zr5JRnH+C0ENJY=
X-Received: by 2002:a2e:780e:0:b0:2b6:b85d:b48b with SMTP id
 t14-20020a2e780e000000b002b6b85db48bmr3828061ljc.32.1688222156753; Sat, 01
 Jul 2023 07:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688010022.git.haibo1.xu@intel.com> <0a418f26388e744b6ae2f17639bea08a05643549.1688010022.git.haibo1.xu@intel.com>
 <20230701-2da2a0ffa7c1ccd3a549acea@orel>
In-Reply-To: <20230701-2da2a0ffa7c1ccd3a549acea@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sat, 1 Jul 2023 22:35:45 +0800
Message-ID: <CAJve8o=c9TV6arYd=sOTOM8BS37cgV+oO8LBjLwb1Za9NZnA+Q@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] KVM: selftests: Add skip_set facility to
 get_reg_list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_073559_648147_8BC341F7 
X-CRM114-Status: GOOD (  19.39  )
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

T24gU2F0LCBKdWwgMSwgMjAyMyBhdCAxMDoyOOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdWwgMDEsIDIwMjMgYXQgMDk6NDI6
NTlQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBBZGQgbmV3IHNraXBzX3NldCBtZW1iZXJz
IHRvIHZjcHVfcmVnX3N1Ymxpc3Qgc28gYXMgdG8gc2tpcAo+ID4gc2V0IG9wZXJhdGlvbiBvbiBz
b21lIHJlZ2lzdGVycy4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1
QGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQt
cmVnLWxpc3QuYyAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0KPiA+ICAuLi4vc2VsZnRlc3Rz
L2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaCAgICAgfCAgMiArKwo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiBpbmRleCA3NGZiNmY2ZmRkMDku
LjFhMzJhOTAwYWVlYSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9nZXQtcmVnLWxpc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dl
dC1yZWctbGlzdC5jCj4gPiBAQCAtMTU3LDYgKzE1Nyw3IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0
KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gIHsKPiA+ICAgICAgIGludCBuZXdfcmVncyA9
IDAsIG1pc3NpbmdfcmVncyA9IDAsIGksIG47Cj4gPiAgICAgICBpbnQgZmFpbGVkX2dldCA9IDAs
IGZhaWxlZF9zZXQgPSAwLCBmYWlsZWRfcmVqZWN0ID0gMDsKPiA+ICsgICAgIGludCBza2lwcGVk
X3NldCA9IDA7Cj4gPiAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7Cj4gPiAgICAgICBzdHJ1
Y3Qga3ZtX3ZtICp2bTsKPiA+ICAgICAgIHN0cnVjdCB2Y3B1X3JlZ19zdWJsaXN0ICpzOwo+ID4g
QEAgLTIxMCw3ICsyMTEsNyBAQCBzdGF0aWMgdm9pZCBydW5fdGVzdChzdHJ1Y3QgdmNwdV9yZWdf
bGlzdCAqYykKPiA+ICAgICAgICAgICAgICAgICAgICAgICAuaWQgPSByZWdfbGlzdC0+cmVnW2ld
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgIC5hZGRyID0gKF9fdTY0KSZhZGRyLAo+ID4gICAg
ICAgICAgICAgICB9Owo+ID4gLSAgICAgICAgICAgICBib29sIHJlamVjdF9yZWcgPSBmYWxzZTsK
PiA+ICsgICAgICAgICAgICAgYm9vbCByZWplY3RfcmVnID0gZmFsc2UsIHNraXBfcmVnID0gZmFs
c2U7Cj4gPiAgICAgICAgICAgICAgIGludCByZXQ7Cj4gPgo+ID4gICAgICAgICAgICAgICByZXQg
PSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCByZWdfbGlzdC0+cmVnW2ldLCAmYWRkcik7Cj4gPiBAQCAt
MjIxLDggKzIyMiw4IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KHN0cnVjdCB2Y3B1X3JlZ19saXN0
ICpjKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICsrZmFpbGVkX2dldDsKPiA+ICAgICAgICAg
ICAgICAgfQo+ID4KPiA+IC0gICAgICAgICAgICAgLyogcmVqZWN0c19zZXQgcmVnaXN0ZXJzIGFy
ZSByZWplY3RlZCBhZnRlciBLVk1fQVJNX1ZDUFVfRklOQUxJWkUgKi8KPiA+ICAgICAgICAgICAg
ICAgZm9yX2VhY2hfc3VibGlzdChjLCBzKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgLyog
cmVqZWN0c19zZXQgcmVnaXN0ZXJzIGFyZSByZWplY3RlZCBmb3Igc2V0IG9wZXJhdGlvbiAqLwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChzLT5yZWplY3RzX3NldCAmJiBmaW5kX3JlZyhz
LT5yZWplY3RzX3NldCwgcy0+cmVqZWN0c19zZXRfbiwgcmVnLmlkKSkgewo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVqZWN0X3JlZyA9IHRydWU7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXQgPSBfX3ZjcHVfaW9jdGwodmNwdSwgS1ZNX1NFVF9PTkVfUkVH
LCAmcmVnKTsKPiA+IEBAIC0yMzQsOSArMjM1LDE2IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KHN0
cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIC8qIHNraXBzX3Nl
dCByZWdpc3RlcnMgYXJlIHNraXBwZWQgZm9yIHNldCBvcGVyYXRpb24gKi8KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpZiAocy0+c2tpcHNfc2V0ICYmIGZpbmRfcmVnKHMtPnNraXBzX3NldCwg
cy0+c2tpcHNfc2V0X24sIHJlZy5pZCkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNraXBfcmVnID0gdHJ1ZTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICsr
c2tpcHBlZF9zZXQ7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAtICAg
ICAgICAgICAgIGlmICghcmVqZWN0X3JlZykgewo+ID4gKyAgICAgICAgICAgICBpZiAoIXJlamVj
dF9yZWcgJiYgIXNraXBfcmVnKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gX192
Y3B1X2lvY3RsKHZjcHUsIEtWTV9TRVRfT05FX1JFRywgJnJlZyk7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKHJldCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJp
bnRmKCIlczogRmFpbGVkIHRvIHNldCAiLCBjb25maWdfbmFtZShjKSk7Cj4gPiBAQCAtMjgxLDkg
KzI4OSw5IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+
ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIFRFU1RfQVNTRVJUKCFtaXNzaW5nX3JlZ3MgJiYgIWZh
aWxlZF9nZXQgJiYgIWZhaWxlZF9zZXQgJiYgIWZhaWxlZF9yZWplY3QsCj4gPiAtICAgICAgICAg
ICAgICAgICAiJXM6IFRoZXJlIGFyZSAlZCBtaXNzaW5nIHJlZ2lzdGVyczsgIgo+ID4gLSAgICAg
ICAgICAgICAgICAgIiVkIHJlZ2lzdGVycyBmYWlsZWQgZ2V0OyAlZCByZWdpc3RlcnMgZmFpbGVk
IHNldDsgJWQgcmVnaXN0ZXJzIGZhaWxlZCByZWplY3QiLAo+ID4gLSAgICAgICAgICAgICAgICAg
Y29uZmlnX25hbWUoYyksIG1pc3NpbmdfcmVncywgZmFpbGVkX2dldCwgZmFpbGVkX3NldCwgZmFp
bGVkX3JlamVjdCk7Cj4gPiArICAgICAgICAgICAgICAgICAiJXM6IFRoZXJlIGFyZSAlZCBtaXNz
aW5nIHJlZ2lzdGVyczsgJWQgcmVnaXN0ZXJzIGZhaWxlZCBnZXQ7ICIKPiA+ICsgICAgICAgICAg
ICAgICAgICIlZCByZWdpc3RlcnMgZmFpbGVkIHNldDsgJWQgcmVnaXN0ZXJzIGZhaWxlZCByZWpl
Y3Q7ICVkIHJlZ2lzdGVycyBza2lwcGVkIHNldCIsCj4gPiArICAgICAgICAgICAgICAgICBjb25m
aWdfbmFtZShjKSwgbWlzc2luZ19yZWdzLCBmYWlsZWRfZ2V0LCBmYWlsZWRfc2V0LCBmYWlsZWRf
cmVqZWN0LCBza2lwcGVkX3NldCk7Cj4gPgo+ID4gICAgICAgcHJfaW5mbygiJXM6IFBBU1NcbiIs
IGNvbmZpZ19uYW1lKGMpKTsKPiA+ICAgICAgIGJsZXNzZWRfbiA9IDA7Cj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oCj4gPiBp
bmRleCBlNDQ4MDA0OTAwMGQuLjY3YzAzMWZlODlhMSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaAo+ID4gKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oCj4gPiBAQCAt
MTM0LDYgKzEzNCw4IEBAIHN0cnVjdCB2Y3B1X3JlZ19zdWJsaXN0IHsKPiA+ICAgICAgIF9fdTY0
IHJlZ3NfbjsKPiA+ICAgICAgIF9fdTY0ICpyZWplY3RzX3NldDsKPiA+ICAgICAgIF9fdTY0IHJl
amVjdHNfc2V0X247Cj4gPiArICAgICBfX3U2NCAqc2tpcHNfc2V0Owo+ID4gKyAgICAgX191NjQg
c2tpcHNfc2V0X247Cj4gPiAgfTsKPiA+Cj4gPiAgc3RydWN0IHZjcHVfcmVnX2xpc3Qgewo+ID4g
LS0KPiA+IDIuMzQuMQo+ID4KPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
