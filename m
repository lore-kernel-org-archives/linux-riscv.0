Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D8DC4453A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCGmw8DHwIB9IiwFNjUApW9KP//VJq7X0zjSU/A5DzA=; b=IR97racwspI6Cv
	uDbogFwuv57WGaH9jcunQPyNIgpVyVMU0DuhbPYuL8M+VVi5z0z+7/bn2pyY6BLglPreNQINDN4bc
	NP/MSM+oUcHS1O9EvzcUDIDBlSYtsjbqqBGiOuBDvsR66XBKF3jUCv6oHUtP1Ho3vvs1IFIjXJCDq
	WhjtHRKimFbISyatbFdSZ/Ayc1pBA/kg+sXpk8h502mV+spLipt9L7TOr+ZK2oU2K+H8yEAJXFYWO
	7H/q7QCMkuwcJ/9I4A3aSTir57lyO2orjrMwf6gpSKs+vKlQYKu0NfZRPimQHW8szXvIsNlyEdy5b
	6nfCmKwgGZs6wv1O6z3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUqL-0000000BcWM-3jd0;
	Wed, 22 Jul 2026 11:10:29 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUqH-0000000BcVu-3EP9
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 11:10:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7fZ6ZKpSewI1alqxdp5Iq+hQOnwQ2qVqzUF460FpOro=;
	b=Dz0RTasxHANwEJIVjEc/iLkxLjwM+ACQkwB0IqIcXkLjoYTJmzjxGHoP9CljCG3ftBsWS5v23
	43GaTWvwdec6jtmIVPjaKVlJXi8W/m0D12ZyE7UXmPxVP3ZcWCZSmAaVrN/MK4CYw6NqFaH/QSD
	G+IHfuGHC6bi2sfpqXvNELw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4h4rrq4dX4zcb4c;
	Wed, 22 Jul 2026 19:00:43 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 863AD40561;
	Wed, 22 Jul 2026 19:10:12 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 22 Jul
 2026 19:10:11 +0800
Message-ID: <2cd8255d-2b0a-45d8-bbc2-ac19e196c41a@huawei.com>
Date: Wed, 22 Jul 2026 19:10:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 2/3] selftests/bpf: test timed may_goto
 preserves R0-R5
Content-Language: en-US
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
	<memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Ihor Solodrai
	<ihor.solodrai@linux.dev>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
 <20260722-riscv-bpf-timed-may-goto-v4-2-e117e6337bc7@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260722-riscv-bpf-timed-may-goto-v4-2-e117e6337bc7@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_041026_444313_D89B71D5 
X-CRM114-Status: GOOD (  12.16  )
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

CgpPbiAyMDI2LzcvMjIgMTI6MjEsIEZlbmcgSmlhbmcgd3JvdGU6Cj4gQWRkIGEgdGVzdCB0aGF0
IGNoZWNrcyBSMC1SNSBhcmUgcHJlc2VydmVkIGFjcm9zcwo+IGFyY2hfYnBmX3RpbWVkX21heV9n
b3RvKCkgY2FsbHMuCj4gCj4gVXNlIGJwZl9nZXRfcHJhbmRvbV91MzIoKSB0byBhdm9pZCB0aGUg
dmVyaWZpZXIgcmVtb3ZpbmcgdGhlIGNoZWNrcwo+IHZpYSBEQ0UuCj4gCj4gU3VnZ2VzdGVkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEZlbmcg
SmlhbmcgPGppYW5nZmVuZ0BreWxpbm9zLmNuPgo+IC0tLQo+ICAgLi4uL3NlbGZ0ZXN0cy9icGYv
cHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9fMS5jICAgICAgfCA1NyArKysrKysrKysrKysrKysrKysr
KysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9fMS5j
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX21heV9nb3RvXzEu
Ywo+IGluZGV4IDRiZGY0MjU2YTQxZS4uOThkNTkxMDhkMDk3IDEwMDY0NAo+IC0tLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMKPiArKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9fMS5j
Cj4gQEAgLTEwNiw0ICsxMDYsNjEgQEAgX19uYWtlZCB2b2lkIG1heV9nb3RvX2JhdGNoXzIodm9p
ZCkKPiAgIAk6IF9fY2xvYmJlcl9hbGwpOwo+ICAgfQo+ICAgCj4gKy8qCj4gKyAqIFVzZSBicGZf
Z2V0X3ByYW5kb21fdTMyKCkgdG8gcHJldmVudCBEQ0UgZnJvbSByZW1vdmluZyB0aGUgY2hlY2tz
Lgo+ICsgKiByZXR2YWw6IDA9YWxsIG9rLCAxLTY9UjAtUjUgY2xvYmJlcmVkLgo+ICsgKi8KPiAr
U0VDKCJyYXdfdHAiKQo+ICtfX2Rlc2NyaXB0aW9uKCJ0aW1lZCBtYXlfZ290byBwcmVzZXJ2ZXMg
UjAtUjUiKQo+ICtfX2FyY2hfeDg2XzY0Cj4gK19fYXJjaF9hcm02NAo+ICtfX2FyY2hfcmlzY3Y2
NAo+ICtfX3N1Y2Nlc3MKPiArX19yZXR2YWwoMCkKCl9fYXJjaF9zMzkweCBpcyBhbHNvIHN1cHBv
cnRlZCB0aW1lZF9tYXlfZ290bwoKPiArX19uYWtlZCB2b2lkIHRpbWVkX21heV9nb3RvX3ByZXNl
cnZlc19yZWdzKHZvaWQpCj4gK3sKPiArCWFzbSB2b2xhdGlsZSAoCj4gKwkiY2FsbCAlW2JwZl9n
ZXRfcHJhbmRvbV91MzJdOyIKPiArCSJyNiA9IHIwOyIKPiArCSJyMCA9IDB4MTExMTsiCj4gKwki
cjAgKz0gcjY7Igo+ICsJInIxID0gMHgyMjIyOyIKPiArCSJyMSArPSByNjsiCj4gKwkicjIgPSAw
eDMzMzM7Igo+ICsJInIyICs9IHI2OyIKPiArCSJyMyA9IDB4NDQ0NDsiCj4gKwkicjMgKz0gcjY7
Igo+ICsJInI0ID0gMHg1NTU1OyIKPiArCSJyNCArPSByNjsiCj4gKwkicjUgPSAweDY2NjY7Igo+
ICsJInI1ICs9IHI2OyIKPiArCSIuOGJ5dGUgJVttYXlfZ290b107Igo+ICsJIi44Ynl0ZSAlW2xv
b3BdOyIKPiArCSJyMCAtPSByNjsiCj4gKwkicjEgLT0gcjY7Igo+ICsJInIyIC09IHI2OyIKPiAr
CSJyMyAtPSByNjsiCj4gKwkicjQgLT0gcjY7Igo+ICsJInI1IC09IHI2OyIKPiArCSJpZiByMCAh
PSAweDExMTEgZ290byAxZjsiCj4gKwkiaWYgcjEgIT0gMHgyMjIyIGdvdG8gMmY7Igo+ICsJImlm
IHIyICE9IDB4MzMzMyBnb3RvIDNmOyIKPiArCSJpZiByMyAhPSAweDQ0NDQgZ290byA0ZjsiCj4g
KwkiaWYgcjQgIT0gMHg1NTU1IGdvdG8gNWY7Igo+ICsJImlmIHI1ICE9IDB4NjY2NiBnb3RvIDZm
OyIKPiArCSJyMCA9IDA7Igo+ICsJImV4aXQ7Igo+ICsJIjE6IHIwID0gMTsgZXhpdDsiCj4gKwki
MjogcjAgPSAyOyBleGl0OyIKPiArCSIzOiByMCA9IDM7IGV4aXQ7Igo+ICsJIjQ6IHIwID0gNDsg
ZXhpdDsiCj4gKwkiNTogcjAgPSA1OyBleGl0OyIKPiArCSI2OiByMCA9IDY7IGV4aXQ7Igo+ICsJ
Ogo+ICsJOiBfX2ltbShicGZfZ2V0X3ByYW5kb21fdTMyKSwKPiArCSAgX19pbW1faW5zbihtYXlf
Z290bywgQlBGX1JBV19JTlNOKEJQRl9KTVAgfCBCUEZfSkNPTkQsIDAsIDAsIDEsIDApKSwKPiAr
CSAgX19pbW1faW5zbihsb29wLCBCUEZfUkFXX0lOU04oQlBGX0pNUCB8IEJQRl9KQSwgMCwgMCwg
LTIsIDApKQo+ICsJOiBfX2Nsb2JiZXJfYWxsKTsKPiArfQo+ICsKPiAgIGNoYXIgX2xpY2Vuc2Vb
XSBTRUMoImxpY2Vuc2UiKSA9ICJHUEwiOwo+IAoKbm90IHdvcmssIHBscyB0YWtlIGEgbG9vawoK
cm9vdEAobm9uZSk6L21udC9icGYjIC4vdGVzdF9wcm9ncyAtdiAtYSB2ZXJpZmllcl9tYXlfZ290
b18xCmJwZl90ZXN0bW9kLmtvIGlzIGFscmVhZHkgdW5sb2FkZWQuCkxvYWRpbmcgYnBmX3Rlc3Rt
b2Qua28uLi4KWyAgIDI2LjEyMzU0OV0gYnBmX3Rlc3Rtb2Q6IGxvYWRpbmcgb3V0LW9mLXRyZWUg
bW9kdWxlIHRhaW50cyBrZXJuZWwuClsgICAyNi4xMjc4ODVdIGJwZl90ZXN0bW9kOiBtb2R1bGUg
dmVyaWZpY2F0aW9uIGZhaWxlZDogc2lnbmF0dXJlIGFuZC9vciAKcmVxdWlyZWQga2V5IG1pc3Np
bmcgLSB0YWludGluZyBrZXJuZWwKU3VjY2Vzc2Z1bGx5IGxvYWRlZCBicGZfdGVzdG1vZC5rby4K
dGVzdGVyX2luaXQ6UEFTUzp0ZXN0ZXJfbG9nX2J1ZiAwIG5zZWMKcHJvY2Vzc19zdWJ0ZXN0OlBB
U1M6b2JqX29wZW5fbWVtIDAgbnNlYwpwcm9jZXNzX3N1YnRlc3Q6UEFTUzpzcGVjc19hbGxvYyAw
IG5zZWMKcnVuX3N1YnRlc3Q6UEFTUzpvYmpfb3Blbl9tZW0gMCBuc2VjCnJ1bl9zdWJ0ZXN0OlBB
U1M6dW5leHBlY3RlZF9sb2FkX2ZhaWx1cmUgMCBuc2VjClZFUklGSUVSIExPRzoKPT09PT09PT09
PT09PQpwcm9jZXNzZWQgNDMgaW5zbnMgKGxpbWl0IDEwMDAwMDApIG1heF9zdGF0ZXNfcGVyX2lu
c24gMCB0b3RhbF9zdGF0ZXMgNCAKcGVha19zdGF0ZXMgNSBtYXJrX3JlYWQgMAo9PT09PT09PT09
PT09CmRvX3Byb2dfdGVzdF9ydW46RkFJTDoxMTE0IEZBSUw6IFVuZXhwZWN0ZWQgYnBmX3Byb2df
dGVzdF9ydW4gZXJyb3I6IDIyIAooSW52YWxpZCBhcmd1bWVudCkgIzY2MC8xICAgdmVyaWZpZXJf
bWF5X2dvdG9fMS90aW1lZCBtYXlfZ290byBwcmVzZXJ2ZXMgClIwLVI1OkZBSUwKIzY2MCAgICAg
dmVyaWZpZXJfbWF5X2dvdG9fMTpGQUlMClN1bW1hcnk6IDAvMCBQQVNTRUQsIDAgU0tJUFBFRCwg
MSBGQUlMRUQKU3VjY2Vzc2Z1bGx5IHVubG9hZGVkIGJwZl90ZXN0bW9kLmtvLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
