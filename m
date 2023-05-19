Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0188C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fp9lQu3ZMV/AGPu+8L1PQff9ZFmRj3L7fRnTVGWDLX0=; b=zuPUP1iEDz/PMV
	iAPE4mPgQO4WawLMaRTjNlqMFIIcl4+vhOAAdV5v4/MUIkKPm9844F9EY0ZG5J7vd+yLmXVvJ9L22
	bx5d3P+jNEGuXQiZIQ0JunRwOrUFxQAyD8ESYS9b8T4xDhFbsyzsDTSaYQLjOnPY3tPK/X3qb6iiF
	IRq8ucnoQx23CpEo/Rz8zo4HM+rDzZnLdUlvqOPf2Hvvfc1WMOEZfYxhN1j/1ev7mZ9INSGbUOkh3
	z7xyT98G+wwmxY95N+g3bIdszIObbmjfutbfnr5xEdIK8KgGnEjhnrkhsHnuJO/pDTTICTw2TwToL
	G+9bHWM/W0cXFPJPNEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxZh-00FvnB-2S;
	Fri, 19 May 2023 10:43:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxZe-00FvmR-0e
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 10:43:03 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 6732A20005;
	Fri, 19 May 2023 10:42:56 +0000 (UTC)
Message-ID: <ee3bc2ce-5ebe-927e-5b6d-0b9490ef3875@ghiti.fr>
Date: Fri, 19 May 2023 12:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor@kernel.org>
References: <20230515141235.0777c631@canb.auug.org.au>
 <54244db6-ff69-4cf8-894c-c3dd2f12df9c@infradead.org>
 <5d894e71-25ad-8ba0-f632-2eec6e017f46@ghiti.fr>
In-Reply-To: <5d894e71-25ad-8ba0-f632-2eec6e017f46@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_034302_367151_E241CF63 
X-CRM114-Status: GOOD (  18.33  )
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

Ck9uIDUvMTYvMjMgMDg6MTgsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBPbiA1LzE2LzIzIDA0
OjQ1LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+Cj4+IE9uIDUvMTQvMjMgMjE6MTIsIFN0ZXBoZW4g
Um90aHdlbGwgd3JvdGU6Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4gQ2hhbmdlcyBzaW5jZSAyMDIzMDUx
MjoKPj4+Cj4+IC4uL2FyY2gvcmlzY3YvbW0vaW5pdC5jOiBJbiBmdW5jdGlvbiAnY3JlYXRlX2Zk
dF9lYXJseV9wYWdlX3RhYmxlJzoKPj4gLi4vYXJjaC9yaXNjdi9tbS9pbml0LmM6OTI1OjE5OiB3
YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ3BhJyAKPj4gWy1XdW51c2VkLXZhcmlhYmxlXQo+PiDC
oMKgIDkyNSB8wqDCoMKgwqDCoMKgwqDCoCB1aW50cHRyX3QgcGEgPSBkdGJfcGEgJiB+KFBNRF9T
SVpFIC0gMSk7Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF5+Cj4KPgo+IFRoaXMgb25lIHNsaXBwZWQgdGhyb3VnaCwgSSdtIGFkZGluZyAhQlVJ
TFRJTl9EVEIgdG8gb3VyIGludGVybmFsIENJLCAKPiBJJ2xsIHNlbmQgYSBmaXggdG9kYXkuCgoK
SSdsbCBzZW5kIGEgZml4IGZvciB0aGlzIG9uZSB0b2RheS4KCgo+Cj4KPj4KPj4gL29wdC9jcm9z
c3Rvb2wvZ2NjLTEyLjIuMC1ub2xpYmMvcmlzY3Y2NC1saW51eC9iaW4vcmlzY3Y2NC1saW51eC1s
ZDogCj4+IHNlY3Rpb24gLmRhdGEgTE1BIFswMDAwMDAwMDAwNDFhMDAwLDAwMDAwMDAwMDc1YmZm
ZDddIG92ZXJsYXBzIAo+PiBzZWN0aW9uIC50ZXh0IExNQSBbMDAwMDAwMDAwMDBmMDlkNCwwMDAw
MDAwMDAzMzU2MmFiXQo+PiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTIuMi4wLW5vbGliYy9yaXNjdjY0
LWxpbnV4L2Jpbi9yaXNjdjY0LWxpbnV4LWxkOiAKPj4gc2VjdGlvbiAuaW5pdC5waS50ZXh0IExN
QSBbMDAwMDAwMDAwMzM1NjJhYywwMDAwMDAwMDAzMzU5MTM3XSAKPj4gb3ZlcmxhcHMgc2VjdGlv
biAuZGF0YSBMTUEgWzAwMDAwMDAwMDA0MWEwMDAsMDAwMDAwMDAwNzViZmZkN10KPgo+Cj4gSSds
bCBjaGVjayB0aGlzIG9uZSB0b28gd2hpY2ggc2VlbXMgdG8gYmUgcmVsYXRlZCB0byBrZXJuZWwv
cGkgCj4gaW50cm9kdWN0aW9uLgoKClRoYW5rcyB0byBCam9ybjogdGhpcyBpcyBjYXVzZWQgYnkg
WElQX0tFUk5FTCwgd2hpY2ggaXMga25vd24gdG8gaGF2ZSAKbGltaXRlZCBzaXplLCBoZW5jZSB0
aGUgb3ZlcmxhcCwgc28gbm8gZml4IGZvciB0aGlzIG9uZS4gSXMgdGhlcmUgYSB3YXkgCnRvIGV4
Y2x1ZGUgdGhpcyBjb25maWcgZnJvbSByYW5kY29uZmlnPwoKCj4KPj4KPj4gL29wdC9jcm9zc3Rv
b2wvZ2NjLTEyLjIuMC1ub2xpYmMvcmlzY3Y2NC1saW51eC9iaW4vcmlzY3Y2NC1saW51eC1sZDog
Cj4+IGRyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0ubzogaW4gZnVuY3Rpb24gYC5MMjI3JzoK
Pj4gaW8tcGd0YWJsZS1hcm0uYzooLmluaXQudGV4dCsweDQ0NCk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gCj4+IGBhbGxvY19pb19wZ3RhYmxlX29wcycKPj4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEy
LjIuMC1ub2xpYmMvcmlzY3Y2NC1saW51eC9iaW4vcmlzY3Y2NC1saW51eC1sZDogCj4+IGRyaXZl
cnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0ubzogaW4gZnVuY3Rpb24gYC5MMCAnOgo+PiBpby1wZ3Rh
YmxlLWFybS5jOiguaW5pdC50ZXh0KzB4YzRjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byAKPj4g
YGZyZWVfaW9fcGd0YWJsZV9vcHMnCj4+IC9vcHQvY3Jvc3N0b29sL2djYy0xMi4yLjAtbm9saWJj
L3Jpc2N2NjQtbGludXgvYmluL3Jpc2N2NjQtbGludXgtbGQ6IAo+PiBkcml2ZXJzL2lvbW11L2lw
bW11LXZtc2EubzogaW4gZnVuY3Rpb24gYC5MNjkwJzoKPj4gaXBtbXUtdm1zYS5jOigudGV4dCsw
eDIyNjApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIAo+PiBgZnJlZV9pb19wZ3RhYmxlX29wcycK
Pj4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEyLjIuMC1ub2xpYmMvcmlzY3Y2NC1saW51eC9iaW4vcmlz
Y3Y2NC1saW51eC1sZDogCj4+IGRyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5vOiBpbiBmdW5jdGlv
biBgLkwxMzA5JzoKPj4gaXBtbXUtdm1zYS5jOigudGV4dCsweDNmMjQpOiB1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIAo+PiBgYWxsb2NfaW9fcGd0YWJsZV9vcHMnCj4KPgo+IE9rLCB0aG9zZSBvbmVz
IHRvby4uLi4KCgpUaG9zZSBvbmVzIGFyZSBmaXhlZCBieSBSYW5keS4KCgo+Cj4KPiBUaGFua3Mg
Zm9yIHRoZSByZXBvcnQsCj4KPgo+IEFsZXgKPgo+Cj4+Cj4+Cj4+IEZ1bGwgcmFuZGNvbmZpZyBm
aWxlIGlzIGF0dGFjaGVkLgoKClRoYW5rcyBhZ2FpbiEKCkFsZXgKCgo+Pgo+Pgo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
