Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1668FC636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyIDu5MpYiw8rnknGEw1ABjWO9ZtWiaIf4OsqY1WoBk=; b=sKw/fW1tCoL8U+
	FHLKJkWBroBzvl5Z6IevNVOlBkjd5Vn+7iXfJH3XSvmUyRvxqF3oFPj11TxjsV0MmM07+uOPTAEsZ
	1tG6++AzHVhRjrDnTJpnEE0l4wa0+ezi1ww9MFI8z7c9Q3rfGjStu4q+dlCEC01TxurvecjHt4J81
	Q42p6DqtWJZAVImC46XR7tfRu5KCnB3CkX1R8aKlCUDR3wUfIpLnlaOri4BB3pWh6F5YL+i7j+yPR
	ZjNGQiKFYrptzdj5V49g3M4LDEUKSLsNOW+1yqfJ7QZZryJAxE/lFctclWHh+poa1RqRC6f2gBn9I
	BfjxmyRygkBW7A3z5zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPP5v-00CXba-00; Tue, 07 Feb 2023 14:37:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPP5q-00CXa4-9h; Tue, 07 Feb 2023 14:37:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5358CB8198A;
	Tue,  7 Feb 2023 14:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FD8C433D2;
	Tue,  7 Feb 2023 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675780622;
	bh=5V2Syffk8V3ekNhiqQlGMq9dI2fG3xmtlwW6CrEnKH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I2yhgFhinb6T8bdHK0Fx54Twb94PXrpghjeDVP6T+wP1qa/ucgsMWdSa7RP9a3nkg
	 hZJ6JDxoSN2gi8bZWqgpyesv6Iv1IGIXFwPPe20lpSvmt/vR1eHWQEQ4o2Wl8B3I90
	 Zcaf9clscGDRq76H7y4Pfc4ze9UuBcv4IWbF+cscgV0ZZg64ymh8PYQImXy+wyWeSQ
	 t4KeCUg/oInGdlim3dNKeyTer7D9RV2QG8nCb/AWPP5NbpwN6zPVMMncKBFy4oJ0py
	 en1mTniZz/myPMDEhIa7A3RHSSQX/VhSxrxlLOyEfwbaqbLY6J9bv7mHpQxaDVm6Pk
	 /CfOi7YlgTgcQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones
 <ajones@ventanamicro.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
 <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, Vincent
 Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, Li Zhengyu
 <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, Changbin
 Du <changbin.du@intel.com>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <20230125142056.18356-11-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
Date: Tue, 07 Feb 2023 15:36:59 +0100
Message-ID: <875ycdy22c.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_063710_670628_77426C46 
X-CRM114-Status: GOOD (  19.28  )
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

QW5keSwKCihLZWVwaW5nIHRoZSBodWdlIENjOi1saXN0IGZvciBub3cuLi4pCgpBbmR5IENoaXUg
PGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0ZXM6Cgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNkZDU4ZDFjOGIzYwo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+IEBAIC0wLDAgKzEsODkg
QEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiArLyoK
PiArICogQ29weXJpZ2h0IChDKSAyMDIzIFNpRml2ZQo+ICsgKiBBdXRob3I6IEFuZHkgQ2hpdSA8
YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gKyAqLwo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQvc2ln
bmFsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3VhY2Nl
c3MuaD4KPiArCj4gKyNpbmNsdWRlIDxhc20vdGhyZWFkX2luZm8uaD4KPiArI2luY2x1ZGUgPGFz
bS9wcm9jZXNzb3IuaD4KPiArI2luY2x1ZGUgPGFzbS9pbnNuLmg+Cj4gKyNpbmNsdWRlIDxhc20v
dmVjdG9yLmg+Cj4gKyNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gKyNpbmNsdWRlIDxhc20vYnVn
Lmg+Cj4gKwo+ICtzdGF0aWMgYm9vbCBpbnNuX2lzX3ZlY3Rvcih1MzIgaW5zbl9idWYpCj4gK3sK
PiArCXUzMiBvcGNvZGUgPSBpbnNuX2J1ZiAmIF9fSU5TTl9PUENPREVfTUFTSzsKPiArCS8qCj4g
KwkgKiBBbGwgVi1yZWxhdGVkIGluc3RydWN0aW9ucywgaW5jbHVkaW5nIENTUiBvcGVyYXRpb25z
IGFyZSA0LUJ5dGUuIFNvLAo+ICsJICogZG8gbm90IGhhbmRsZSBpZiB0aGUgaW5zdHJ1Y3Rpb24g
bGVuZ3RoIGlzIG5vdCA0LUJ5dGUuCj4gKwkgKi8KPiArCWlmICh1bmxpa2VseShHRVRfSU5TTl9M
RU5HVEgoaW5zbl9idWYpICE9IDQpKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCWlmIChvcGNvZGUg
PT0gT1BDT0RFX1ZFQ1RPUikgewo+ICsJCXJldHVybiB0cnVlOwo+ICsJfSBlbHNlIGlmIChvcGNv
ZGUgPT0gT1BDT0RFX0xPQURGUCB8fCBvcGNvZGUgPT0gT1BDT0RFX1NUT1JFRlApIHsKPiArCQl1
MzIgd2lkdGggPSBFWFRSQUNUX0xPQURfU1RPUkVfRlBfV0lEVEgoaW5zbl9idWYpOwo+ICsKPiAr
CQlpZiAod2lkdGggPT0gTFNGUF9XSURUSF9SVlZfOCB8fCB3aWR0aCA9PSBMU0ZQX1dJRFRIX1JW
Vl8xNiB8fAo+ICsJCSAgICB3aWR0aCA9PSBMU0ZQX1dJRFRIX1JWVl8zMiB8fCB3aWR0aCA9PSBM
U0ZQX1dJRFRIX1JWVl82NCkKPiArCQkJcmV0dXJuIHRydWU7Cj4gKwl9IGVsc2UgaWYgKG9wY29k
ZSA9PSBSVkdfT1BDT0RFX1NZU1RFTSkgewo+ICsJCXUzMiBjc3IgPSBFWFRSQUNUX1NZU1RFTV9D
U1IoaW5zbl9idWYpOwo+ICsKPiArCQlpZiAoKGNzciA+PSBDU1JfVlNUQVJUICYmIGNzciA8PSBD
U1JfVkNTUikgfHwKPiArCQkgICAgKGNzciA+PSBDU1JfVkwgJiYgY3NyIDw9IENTUl9WTEVOQikp
Cj4gKwkJCXJldHVybiB0cnVlOwo+ICsJfQo+ICsJcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICtp
bnQgcnZ2X3RocmVhZF96YWxsb2Modm9pZCkKPiArewo+ICsJdm9pZCAqZGF0YXA7Cj4gKwo+ICsJ
ZGF0YXAgPSBremFsbG9jKHJpc2N2X3ZzaXplLCBHRlBfS0VSTkVMKTsKPiArCWlmICghZGF0YXAp
Cj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwljdXJyZW50LT50aHJlYWQudnN0YXRlLmRhdGFwID0g
ZGF0YXA7Cj4gKwltZW1zZXQoJmN1cnJlbnQtPnRocmVhZC52c3RhdGUsIDAsIG9mZnNldG9mKHN0
cnVjdCBfX3Jpc2N2X3Zfc3RhdGUsCj4gKwkJCQkJCSAgICBkYXRhcCkpOwo+ICsJcmV0dXJuIDA7
Cj4gK30KPiArCj4gK2Jvb2wgcnZ2X2ZpcnN0X3VzZV9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+ICt7Cj4gKwlfX3VzZXIgdTMyICplcGMgPSAodTMyICopcmVncy0+ZXBjOwo+ICsJdTMy
IHR2YWwgPSAodTMyKXJlZ3MtPmJhZGFkZHI7Cj4gKwo+ICsJLyogSWYgViBoYXMgYmVlbiBlbmFi
bGVkIHRoZW4gaXQgaXMgbm90IHRoZSBmaXJzdC11c2UgdHJhcCAqLwo+ICsJaWYgKHZzdGF0ZV9x
dWVyeShyZWdzKSkKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwkvKiBHZXQgdGhlIGluc3RydWN0aW9u
ICovCj4gKwlpZiAoIXR2YWwpIHsKPiArCQlpZiAoX19nZXRfdXNlcih0dmFsLCBlcGMpKQo+ICsJ
CQlyZXR1cm4gZmFsc2U7Cj4gKwl9Cj4gKwkvKiBGaWx0ZXIgb3V0IG5vbi1WIGluc3RydWN0aW9u
cyAqLwo+ICsJaWYgKCFpbnNuX2lzX3ZlY3Rvcih0dmFsKSkKPiArCQlyZXR1cm4gZmFsc2U7Cj4g
KwkvKiBTYW5pdHkgY2hlY2suIGRhdGFwIHNob3VsZCBiZSBudWxsIGJ5IHRoZSB0aW1lIG9mIHRo
ZSBmaXJzdC11c2UgdHJhcCAqLwo+ICsJV0FSTl9PTihjdXJyZW50LT50aHJlYWQudnN0YXRlLmRh
dGFwKTsKPiArCS8qCj4gKwkgKiBOb3cgd2Ugc3VyZSB0aGF0IHRoaXMgaXMgYSBWIGluc3RydWN0
aW9uLiBBbmQgaXQgZXhlY3V0ZXMgaW4gdGhlCj4gKwkgKiBjb250ZXh0IHdoZXJlIFZTIGhhcyBi
ZWVuIG9mZi4gU28sIHRyeSB0byBhbGxvY2F0ZSB0aGUgdXNlcidzIFYKPiArCSAqIGNvbnRleHQg
YW5kIHJlc3VtZSBleGVjdXRpb24uCj4gKwkgKi8KPiArCWlmIChydnZfdGhyZWFkX3phbGxvYygp
KSB7Cj4gKwkJZm9yY2Vfc2lnKFNJR0tJTEwpOwo+ICsJCXJldHVybiB0cnVlOwo+ICsJfQoKU2hv
dWxkIHRoZSBhbHRzdGFjayBzaXplIGJlIHRha2VuIGludG8gY29uc2lkZXJhdGlvbiwgbGlrZSB4
ODYgZG9lcyBpbgp2YWxpZGF0ZV9zaWdhbHRzdGFjaygpIChzZWUgX194c3RhdGVfcmVxdWVzdF9w
ZXJtKCkpLgoKUmVsYXRlZDsgV291bGQgaXQgbWFrZSBzZW5zZSB0byBpbXBsZW1lbnQgc2lnYWx0
c3RhY2tfc2l6ZV92YWxpZCgpIGZvcgpyaXNjdiwgYW5hbG9nb3VzIHRvIHg4Nj8KCgpCasO2cm4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
