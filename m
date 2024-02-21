Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F936C48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 02:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gg/5ORr5fBhZMkuJeQiXv1bo+ZCrDQRGw51zcmROQL4=; b=SsE+3lhkKkJhZl
	52+CDhkYEFVMD+CU9gWOLC6RjpzxTNnaDF4sby89yl1Y7sy310L8ZR7BioS+x+CMaZP0heo5LefdS
	dxiv+PkvPjDLIJx7L4qWszOxeTeE2MtjjjXYzzEb1LQD4tNuULlr4Tn9r/rMQ7M6s0fYxn0tEGKwB
	lWepfOWykU8QG9h7lfCKMooLl5NnqCVdMYs0EgJlguD38t1Dgoc1KZMlKbBi0BjsQ6RMzIndJGzFW
	rRHvh/mK463G2XyDj0WBEyLfXF4dj3yXFiJ5W+DvNcQ6weCAdbNpGPlxkbvpFdc9nb2HPe6Bkm5xC
	DyDfIjCewqPreTRMWI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcc6w-0000000GpeJ-0pyd;
	Wed, 21 Feb 2024 02:13:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcc6t-0000000GpdN-0E5O;
	Wed, 21 Feb 2024 02:13:24 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51197ca63f5so6720773e87.1;
        Tue, 20 Feb 2024 18:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708481600; x=1709086400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyL4+gid2LCVkf5A3UEC4DDd5q5l+TxrzdeM+WtCs/s=;
        b=JPKpx9x3iyC46AVLlMA8yXOx5fAkQf4DBX2rCgWlZJjsVxpetgPpW1a4lD8Ps8Avo7
         tvIenpWlMhkoyzZ7UQTEesEjXwc2ThYkoajlj+scap7WVXVBStkn1+FiAgK2MkZQW9Mu
         XX3CujXDntq6YY34P2HWMzWNb6dlLlrYA5erTRJ92q+wG1ScBfyj7baJOgSxLQZarKGy
         v7P+m9SyyDTHgkXFw/KdWE6qA4g0M6Hb8bcXtip+KuzLDmfgHcPl71aQUrS4W236u/G7
         7KD5G0gW4AfJLa64e5Q/MAVClkLf2GSV728FhkS0uVGdSjzwGTNGm6roXowBVWxesU3f
         vN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708481600; x=1709086400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyL4+gid2LCVkf5A3UEC4DDd5q5l+TxrzdeM+WtCs/s=;
        b=fy/BQ6IHms+XvoJEKbzBxUQbokYWRSdj6UFpS89mHHlWoDc1zzI/eZh6wQdlPwGb9R
         gRbO1HS0PTFqWWJJwov6PB0bXNOunNzGDDZ+sUyyInVNuEGovJITqEpzyYWUFlkJOCw+
         86DoRWrczA91a5ArGzmRjFlNmTHVxBRjdDcU110fmgQ185Y/kjZ6xrtvSkPOBHLkRCyl
         lGhNmmUEQHzTweC/9zmdlbxeiOVTEo3vH5AycJA17IbhG9z8DuJ8c6+MwMxH7DDLM7vm
         1RJpctMehF7cPxaFh8iDzseUepa2bH1jUNMBLeghl/m3Nl031hn2e5XO8raiWXy/yXvb
         8mSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw3VayzBGbj5WOLoTg6j5OlrKibp5xlUX2SOdlLsuWjZ3U5yDqY42dl3ZjgSoigTrjMyfwMw/pNAKnKWMLzpaaRXfUSS6gk7DZqMNCpiS5Lfa9j3PwnMpRtjOAo+PmKTxYaIvtmuAx29Jjy2idM014kgrGnUz8GlpNAPFNGWQn42W3UFyGX0MY6UME21lbDp/fSwmE
X-Gm-Message-State: AOJu0YzG3c+9eTzZVFdZss9Y2zMUBFrPtW/2aBJxqTsZoqiZebIpxOvE
	UMiltvkUJT9i9FwiUf+cjjuEZD9515FqjyyX6jHQjm7evQO9rmL0o81BbZZ5sLjuCtnQsBIbP/g
	ftzbGlhaW7tMM+emPfJIlY57cgKw=
X-Google-Smtp-Source: AGHT+IHRdTziSrABqkKvSI9ZOcTbR2Q3vrcU+ABOUUUq5c2+ia7YA91JhISWBunQmlRCXavtuJjiR/cXOesvX0Bn5yk=
X-Received: by 2002:a05:6512:ba6:b0:512:bebf:1a with SMTP id
 b38-20020a0565120ba600b00512bebf001amr3977383lfv.57.1708481599992; Tue, 20
 Feb 2024 18:13:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
 <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
In-Reply-To: <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 21 Feb 2024 10:13:08 +0800
Message-ID: <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
To: Atish Patra <atishp@atishpatra.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, 
	Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_181323_119733_BAA079D6 
X-CRM114-Status: GOOD (  27.12  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNzowM+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRp
c2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMTo0OOKAr0FN
IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBNb3ZlIHZjcHVf
aGFzX2V4dCB0byB0aGUgcHJvY2Vzc29yLmMgYW5kIHJlbmFtZSBpdCB0byBfX3ZjcHVfaGFzX2V4
dAo+ID4gc28gdGhhdCBvdGhlciB0ZXN0IGNhc2VzIGNhbiB1c2UgaXQgZm9yIHZDUFUgZXh0ZW5z
aW9uIGNoZWNrLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50
ZWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9y
aXNjdi9wcm9jZXNzb3IuaCB8ICAyICsrCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAgICAgfCAxMCArKysrKysrKysrCj4gPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgfCAxMSArLS0tLS0t
LS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNs
dWRlL3Jpc2N2L3Byb2Nlc3Nvci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1
ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiA+IGluZGV4IGI2OGIxYjczMWEzNC4uYmQyN2UxYzY3NTc5
IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlz
Y3YvcHJvY2Vzc29yLmgKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNs
dWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gPiBAQCAtNDIsNiArNDIsOCBAQCBzdGF0aWMgaW5saW5l
IHVpbnQ2NF90IF9fa3ZtX3JlZ19pZCh1aW50NjRfdCB0eXBlLCB1aW50NjRfdCBpZHgsCj4gPiAg
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1JFRyhpZHgpIF9fa3ZtX3JlZ19pZChLVk1fUkVHX1JJU0NW
X0lTQV9FWFQsIFwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlkeCwgS1ZNX1JFR19TSVpFX1VMT05HKQo+ID4KPiA+ICtib29sIF9fdmNwdV9oYXNfZXh0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCk7Cj4gPiArCj4gPiAgc3RydWN0IGV4X3Jl
Z3Mgewo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIHJhOwo+ID4gICAgICAgICB1bnNpZ25lZCBs
b25nIHNwOwo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIv
cmlzY3YvcHJvY2Vzc29yLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2
L3Byb2Nlc3Nvci5jCj4gPiBpbmRleCAzOWExZTk5MDJkZWMuLmRhZDczY2UxODE2NCAxMDA2NDQK
PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29y
LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vz
c29yLmMKPiA+IEBAIC0xNSw2ICsxNSwxNiBAQAo+ID4KPiA+ICBzdGF0aWMgdm1fdmFkZHJfdCBl
eGNlcHRpb25faGFuZGxlcnM7Cj4gPgo+ID4gK2Jvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+ID4gK3sKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyB2
YWx1ZSA9IDA7Cj4gPiArICAgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICAgIHJldCA9IF9f
dmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGV4dCksICZ2YWx1ZSk7Cj4gPiAr
Cj4gPiArICAgICAgIHJldHVybiAhcmV0ICYmICEhdmFsdWU7Cj4gPiArfQo+ID4gKwo+Cj4gTm90
IHN1cmUgd2hhdCB3YXMgdGhlIGJhc2UgcGF0Y2ggb24gd2hpY2ggdGhpcyB3YXMgcmViYXNlZC4g
VGhlIGFjdHVhbAo+IGNvbW1pdCBpbiB0aGUgcXVldWUgYnJhbmNoIGxvb2tzIGRpZmZlcmVudC4K
PgoKVGhpcyBwYXRjaCBzZXQgd2FzIGJhc2VkIG9uIDYuNy1yYzguCgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9rdm0tcmlzY3YvbGludXgvY29tbWl0LzU1NjM1MTdjYzIwMTJlMzMyNjQxMWIzNjBjOTky
NGQzZjI3MDZjOGQKPgo+IEJvdGggc2VlbSB0byBoYXZlIHRoZSBzYW1lIGJ1ZyB0aG91Z2ggdGhl
IHRlc3RzIGZhaWwgbm93IGFuZCByZXF1aXJlCj4gdGhlIGZvbGxvd2luZyBmaXguCj4gVGhlIGV4
dCBpZCBzaG91bGQgYmUgdWludDY0X3QgYW5kIHdlIG5lZWQgdG8gcGFzcyBleHQgZGlyZWN0bHkg
c28gdGhhdAo+IFNCSSBleHRlbnNpb24gdGVzdHMgY2FuIGFsc28gcGFzcy4KPgoKSXQncyB3ZWly
ZCB0aGF0IDYuNy1yYzggaGFzIGFscmVhZHkgaW5jbHVkZWQgQW5kcmV3J3MgY2hhbmdlIG9uIHRo
ZSBJU0EgZXh0IHJlZywKYnV0IHRoaXMgcGF0Y2ggd2FzIG5vdCBnZW5lcmF0ZWQgYWdhaW5zdCBo
aXMgY2hhbmdlLgoKY29tbWl0IGJkZjZhYTMyOGYxMzdlMTg0YjBmY2U2MDdmZDU4NTM1NGMzNzQy
ZjEKQXV0aG9yOiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgpEYXRlOiAg
IFdlZCBEZWMgMTMgMTg6MDk6NTggMjAyMyArMDEwMAoKICAgIFJJU0MtVjogS1ZNOiBzZWxmdGVz
dHM6IFRyZWF0IFNCSSBleHQgcmVncyBsaWtlIElTQSBleHQgcmVncwoKQW55d2F5LCB5b3VyIGNo
YW5nZXMgd2VyZSByaWdodC4gUGxlYXNlIGdvIGFoZWFkIHRvIGluY2x1ZGUgdGhlbSB3aGVuIG1l
cmdpbmcuCgpUaGFua3MsCkhhaWJvCgo+Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IEBAIC00OCw3ICs0OCw3IEBAIHN0
YXRpYyBpbmxpbmUgdWludDY0X3QgX19rdm1fcmVnX2lkKHVpbnQ2NF90IHR5cGUsCj4gdWludDY0
X3Qgc3VidHlwZSwKPiBLVk1fUkVHX1JJU0NWX1NCSV9TSU5HTEUsIFwKPiBpZHgsIEtWTV9SRUdf
U0laRV9VTE9ORykKPgo+IC1ib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgaW50IGV4dCk7Cj4gK2Jvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1aW50NjRfdCBleHQpOwo+Cj4gc3RydWN0IGV4X3JlZ3Mgewo+IHVuc2lnbmVkIGxvbmcgcmE7
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJv
Y2Vzc29yLmMKPiBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vz
c29yLmMKPiBpbmRleCAyODI1ODdjZDRiYmMuLmVjNjZkMzMxYTEyNyAxMDA2NDQKPiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gKysrIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IEBAIC0x
NSwxMiArMTUsMTIgQEAKPgo+IHN0YXRpYyB2bV92YWRkcl90IGV4Y2VwdGlvbl9oYW5kbGVyczsK
Pgo+IC1ib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkK
PiArYm9vbCBfX3ZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVpbnQ2NF90IGV4
dCkKPiB7Cj4gdW5zaWduZWQgbG9uZyB2YWx1ZSA9IDA7Cj4gaW50IHJldDsKPgo+IC0gcmV0ID0g
X192Y3B1X2dldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVlKTsKPiAr
IHJldCA9IF9fdmNwdV9nZXRfcmVnKHZjcHUsIGV4dCwgJnZhbHVlKTsKPgo+IHJldHVybiAhcmV0
ICYmICEhdmFsdWU7Cj4gfQo+Cj4gV2l0aCB0aGUgYWJvdmUgdGhlIGZpeCwgQm90aCBTQkkvSVNB
IGV4dGVuc2lvbiB0ZXN0cyBwYXNzLgo+ICMgLi9nZXQtcmVnLWxpc3QKPiBzYmktYmFzZTogUEFT
Uwo+IHNiaS1zdGE6IFBBU1MKPiBzYmktcG11OiBQQVNTCj4gc2JpLWRiY246IFBBU1MKPiBhaWE6
IFBBU1MKPiBmcF9mOiBQQVNTCj4gZnBfZDogUEFTUwo+IDEuLjAgIyBTS0lQIC0gaCBub3QgYXZh
aWxhYmxlLCBza2lwcGluZyB0ZXN0cwo+IHNtc3RhdGVlbjogUEFTUwo+IHNzY29mcG1mOiBQQVNT
Cj4gc3N0YzogUEFTUwo+IDEuLjAgIyBTS0lQIC0gc3ZpbnZhbCBub3QgYXZhaWxhYmxlLCBza2lw
cGluZyB0ZXN0cwo+IDEuLjAgIyBTS0lQIC0gc3ZuYXBvdCBub3QgYXZhaWxhYmxlLCBza2lwcGlu
ZyB0ZXN0cwo+IDEuLjAgIyBTS0lQIC0gc3ZwYm10IG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRl
c3RzCj4gemJhOiBQQVNTCj4gemJiOiBQQVNTCj4gemJjOiBQQVNTCj4gMS4uMCAjIFNLSVAgLSB6
YmtiIG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3RzCj4gMS4uMCAjIFNLSVAgLSB6YmtjIG5v
dCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3RzCj4gMS4uMCAjIFNLSVAgLSB6Ymt4IG5vdCBhdmFp
bGFibGUsIHNraXBwaW5nIHRlc3RzCj4gemJzOiBQQVNTCj4gemZhOiBQQVNTCj4gMS4uMCAjIFNL
SVAgLSB6Zmggbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMKPiAxLi4wICMgU0tJUCAtIHpm
aG1pbiBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0ZXN0cwo+IHppY2JvbTogUEFTUwo+IHppY2Jv
ejogUEFTUwo+IHppY250cjogUEFTUwo+IDEuLjAgIyBTS0lQIC0gemljb25kIG5vdCBhdmFpbGFi
bGUsIHNraXBwaW5nIHRlc3RzCj4gemljc3I6IFBBU1MKPiB6aWZlbmNlaTogUEFTUwo+IHppaGlu
dG50bDogUEFTUwo+IHppaGludHBhdXNlOiBQQVNTCj4gemlocG06IFBBU1MKPgo+Cj4gPiAgc3Rh
dGljIHVpbnQ2NF90IHBhZ2VfYWxpZ24oc3RydWN0IGt2bV92bSAqdm0sIHVpbnQ2NF90IHYpCj4g
PiAgewo+ID4gICAgICAgICByZXR1cm4gKHYgKyB2bS0+cGFnZV9zaXplKSAmIH4odm0tPnBhZ2Vf
c2l6ZSAtIDEpOwo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9y
aXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYwo+ID4gaW5kZXggMjVkZTRiOGJjMzQ3Li5lZDI5YmE0NTU4OGMgMTAwNjQ0
Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0
LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxp
c3QuYwo+ID4gQEAgLTc1LDE1ICs3NSw2IEBAIGJvb2wgY2hlY2tfcmVqZWN0X3NldChpbnQgZXJy
KQo+ID4gICAgICAgICByZXR1cm4gZXJyID09IEVJTlZBTDsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRp
YyBpbmxpbmUgYm9vbCB2Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0
KQo+ID4gLXsKPiA+IC0gICAgICAgaW50IHJldDsKPiA+IC0gICAgICAgdW5zaWduZWQgbG9uZyB2
YWx1ZTsKPiA+IC0KPiA+IC0gICAgICAgcmV0ID0gX192Y3B1X2dldF9yZWcodmNwdSwgUklTQ1Zf
SVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVlKTsKPiA+IC0gICAgICAgcmV0dXJuIChyZXQpID8gZmFs
c2UgOiAhIXZhbHVlOwo+ID4gLX0KPiA+IC0KPiA+ICB2b2lkIGZpbmFsaXplX3ZjcHUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ICB7Cj4gPiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgaXNhX2V4dF9zdGF0ZVtLVk1fUklTQ1ZfSVNBX0VYVF9NQVhdID0g
eyAwIH07Cj4gPiBAQCAtMTExLDcgKzEwMiw3IEBAIHZvaWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gICAgICAgICAgICAg
ICAgIF9fdmNwdV9zZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKHMtPmZlYXR1cmUpLCAx
KTsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgLyogRG91YmxlIGNoZWNrIHdoZXRoZXIgdGhlIGRl
c2lyZWQgZXh0ZW5zaW9uIHdhcyBlbmFibGVkICovCj4gPiAtICAgICAgICAgICAgICAgX19URVNU
X1JFUVVJUkUodmNwdV9oYXNfZXh0KHZjcHUsIHMtPmZlYXR1cmUpLAo+ID4gKyAgICAgICAgICAg
ICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0KHZjcHUsIHMtPmZlYXR1cmUpLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlcyBub3QgYXZhaWxhYmxlLCBza2lwcGlu
ZyB0ZXN0c1xuIiwgcy0+bmFtZSk7Cj4gPiAgICAgICAgIH0KPiA+ICB9Cj4gPiAtLQo+ID4gMi4z
NC4xCj4gPgo+Cj4KPiAtLQo+IFJlZ2FyZHMsCj4gQXRpc2gKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
