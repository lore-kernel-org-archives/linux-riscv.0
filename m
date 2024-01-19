Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA9AC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUwDBgmAHt23Eyd1KAlTsCdDQmouOyKrRrZWtcjSKLo=; b=ehfbiyGykctPD9
	Iqm7w0x6Fhdg4LulvwgcQxaavGAcdwqtS/xrT6P6PiMunHgN6oJ9xtn/wnfU2LrLU65u+vaJpCcmz
	0JjuM4VtbmE1XQzCldmJZhiZhqVD8F7Fgi1vPam0DO0jfrbM8xf+b2eckjUiMT+dibZp8t/soiG5N
	qHY2UG+f3xc/AGQrcfgkFscSuBDBCh8/vNsgVTKEJxADf/PA3+RGKf/uwOG44mhHYeaLk4ZtSzl1h
	88IcPbYclc/Ba4o4sU8NsY5JoHp+fPOlDDIYN40W9zjPIkXeE6LytMMb671uCuHdbekbKZYnNyhdQ
	xwNvZ60ZLEw4+Csln49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmEI-0056fY-18;
	Fri, 19 Jan 2024 10:36:06 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmEC-0056cJ-1P
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 10:36:04 +0000
X-QQ-mid: bizesmtp64t1705660495t7k8890j
X-QQ-Originating-IP: kpWPaONTxxvy0nOEGrSxFq1akJ6vzcOttZF/rCEqrtY=
Received: from [10.4.6.71] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Jan 2024 18:34:53 +0800 (CST)
X-QQ-SSF: 00200000000000B0B000000A0000000
X-QQ-FEAT: 4g9JbZ7lBbGYt5f2YVZ9RuBGDo2jTI9EeLQs3oNfXqrhUBaFQVqPrhhoJcJJ1
	ER1ylXifWxfMxWYKz9hF5gfbKgCzQ4idJ6F796Sg96DfHuVwv6g7okYYi+PY3MIUefL3ny+
	9RHZi5hZRA3pQ/GN1g7yOts83rk0lLNGwQMVhKkRNRAAARFiGtrC/24H5K8R8svRDKZcU10
	60uwPXeAVoOu4bWiDTqdS4/vhXc3/BybQJS4emGBRbiEHPceo8mF7NA/ytodyM6SwDBCTQ9
	phIiAS+OsjWTH1x2HC8xkpPzQhxfIgWnZYWy/koKv5dNXFm4dLt/0+6/RetUr2EiktDPY9B
	06RYMgpZgJFMo3G9OEqFKKLURyFZoOmUKETKrCv78KYYkQ1GGI=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9538942234933522215
Message-ID: <231AC634A34EBAF4+1a989394-a60f-4088-86ee-fe1344e7999f@tinylab.org>
Date: Fri, 19 Jan 2024 18:34:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2] riscv: Support RANDOMIZE_KSTACK_OFFSET
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, guoren@kernel.org, bjorn@rivosinc.com,
 jszhang@kernel.org, conor.dooley@microchip.com, andy.chiu@sifive.com,
 samitolvanen@google.com, coelacanthushex@gmail.com, dlemoal@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
References: <20231109133751.212079-1-songshuaishuai@tinylab.org>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <20231109133751.212079-1-songshuaishuai@tinylab.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_023600_818244_FDEFD726 
X-CRM114-Status: GOOD (  21.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CkhpLCBwYWxtZXI6CgrlnKggMjAyMy8xMS85IDIxOjM3LCBTb25nIFNodWFpIOWGmemBkzoKPiBJ
bnNwaXJlZCBmcm9tIGFybTY0J3MgaW1wbGVtZW50IC0tIGNvbW1pdCA3MDkxODc3OWFlYzkKPiAo
ImFybTY0OiBlbnRyeTogRW5hYmxlIHJhbmRvbV9rc3RhY2tfb2Zmc2V0IHN1cHBvcnQiKQo+IAo+
IEFkZCBzdXBwb3J0IG9mIGtlcm5lbCBzdGFjayBvZmZzZXQgcmFuZG9taXphdGlvbiB3aGlsZSBo
YW5kbGluZyBzeXNjYWxsLAo+IHRoZSBvZmZzZXQgaXMgZGVmYXVsdGx5IGxpbWl0ZWQgYnkgS1NU
QUNLX09GRlNFVF9NQVgoKSAoaS5lLiAxMCBiaXRzKS4KPiAKPiBJbiBvcmRlciB0byBhdm9pZCB0
cmlnZ2VyIHN0YWNrIGNhbmFyaWVzIChkdWUgdG8gX19idWlsdGluX2FsbG9jYSkgYW5kCj4gc2xv
d2luZyBkb3duIHRoZSBlbnRyeSBwYXRoLCB1c2UgX19ub19zdGFja19wcm90ZWN0b3IgYXR0cmli
dXRlIHRvCj4gZGlzYWJsZSBzdGFjayBwcm90ZWN0b3IgZm9yIGRvX3RyYXBfZWNhbGxfdSgpIGF0
IHRoZSBmdW5jdGlvbiBsZXZlbC4KPiAKPiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1l
ckByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNodWFpQHRpbnls
YWIub3JnPgpKdXN0IGEgUmVtaW5kZXIgaW4gY2FzZSB5b3UgbWlzcyB0aGlzIG9uZS4KCj4gLS0t
Cj4gQ2hhbmdlcyBzaW5jZSBWMToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di8yMDIzMTEwMTA2NDQyMy4xOTA2MTIyLTEtc29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmcvCj4g
LSBmaXggd2hpdGVzcGFjZSBlcnJvcnMgRGFtaWVuIHBvaW50ZWQgb3V0Cj4gLSBhZGQgQWNrZWQt
YnkgYW5kIFJldmlld2VkLWJ5IHRhZ3MKPiAKPiAtLS0KPiAgIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgICAgfCAgMSArCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgMTcgKysrKysrKysr
KysrKysrKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tj
b25maWcKPiBpbmRleCBkNjA3YWIwZjdjNmQuLjBlODQzZGUzM2YwYyAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMTAwLDYg
KzEwMCw3IEBAIGNvbmZpZyBSSVNDVgo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfS0dEQl9RWEZFUl9Q
S1QKPiAgIAlzZWxlY3QgSEFWRV9BUkNIX01NQVBfUk5EX0JJVFMgaWYgTU1VCj4gICAJc2VsZWN0
IEhBVkVfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUUyBpZiBDT01QQVQKPiArCXNlbGVjdCBIQVZF
X0FSQ0hfUkFORE9NSVpFX0tTVEFDS19PRkZTRVQKPiAgIAlzZWxlY3QgSEFWRV9BUkNIX1NFQ0NP
TVBfRklMVEVSCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9USFJFQURfU1RSVUNUX1dISVRFTElTVAo+
ICAgCXNlbGVjdCBIQVZFX0FSQ0hfVFJBQ0VIT09LCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5kZXggMTk4MDdj
NGQzODA1Li5hMWE3NTE2M2ZiODEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtNiw2ICs2LDcgQEAK
PiAgICNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4K
PiAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9yYW5kb21pemVf
a3N0YWNrLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiAgICNpbmNsdWRlIDxsaW51
eC9zY2hlZC9kZWJ1Zy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3NpZ25hbC5oPgo+IEBA
IC0yOTYsNyArMjk3LDggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9p
ZCBkb190cmFwX2JyZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAgCX0KPiAgIH0KPiAgIAo+
IC1hc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxf
dShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3Nl
Y3Rpb24gIF9fbm9fc3RhY2tfcHJvdGVjdG9yCj4gK3ZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVj
dCBwdF9yZWdzICpyZWdzKQo+ICAgewo+ICAgCWlmICh1c2VyX21vZGUocmVncykpIHsKPiAgIAkJ
bG9uZyBzeXNjYWxsID0gcmVncy0+YTc7Cj4gQEAgLTMwOCwxMCArMzEwLDIzIEBAIGFzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBw
dF9yZWdzICpyZWdzKQo+ICAgCj4gICAJCXN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNl
cl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+ICAgCj4gKwkJYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0
KCk7Cj4gKwo+ICAgCQlpZiAoc3lzY2FsbCA+PSAwICYmIHN5c2NhbGwgPCBOUl9zeXNjYWxscykK
PiAgIAkJCXN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPiAgIAkJZWxzZSBpZiAoc3lz
Y2FsbCAhPSAtMSkKPiAgIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKPiArCQkvKgo+ICsJCSAqIFVs
dGltYXRlbHksIHRoaXMgdmFsdWUgd2lsbCBnZXQgbGltaXRlZCBieSBLU1RBQ0tfT0ZGU0VUX01B
WCgpLAo+ICsJCSAqIHNvIHRoZSBtYXhpbXVtIHN0YWNrIG9mZnNldCBpcyAxayBieXRlcyAoMTAg
Yml0cykuCj4gKwkJICoKPiArCQkgKiBUaGUgYWN0dWFsIGVudHJvcHkgd2lsbCBiZSBmdXJ0aGVy
IHJlZHVjZWQgYnkgdGhlIGNvbXBpbGVyIHdoZW4KPiArCQkgKiBhcHBseWluZyBzdGFjayBhbGln
bm1lbnQgY29uc3RyYWludHM6IDE2LWJ5dGUgKGkuZS4gNC1iaXQpIGFsaWduZWQKPiArCQkgKiBm
b3IgUlYzMkkgb3IgUlY2NEkuCj4gKwkJICoKPiArCQkgKiBUaGUgcmVzdWx0aW5nIDYgYml0cyBv
ZiBlbnRyb3B5IGlzIHNlZW4gaW4gU1BbOTo0XS4KPiArCQkgKi8KPiArCQljaG9vc2VfcmFuZG9t
X2tzdGFja19vZmZzZXQoZ2V0X3JhbmRvbV91MTYoKSk7Cj4gICAKPiAgIAkJc3lzY2FsbF9leGl0
X3RvX3VzZXJfbW9kZShyZWdzKTsKPiAgIAl9IGVsc2UgewoKLS0gClRoYW5rcwpTb25nIFNodWFp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
