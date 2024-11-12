Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E520D32D9E
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQ+V6S8v8zxiVZGcuQwfvKfSS721LDkeyAbrQfakSws=; b=uXlExhO/AIP2v9
	7IiHihs5M+rlc7dW327i1wb+zV0H8hi+MMWmWzmRkhI5SrpxACoU+LBRP3VREABUeZMvanmIpQc6p
	a+T7YvOvCNq/RiAiS+xWonzqjk4I2puySW0JfL5/v6l0OkMAMAAgMluyeUia26TnaSi81NHgPTMcM
	KGxns2EDocsXAd2qf1i1VOg7Qk64fLroIJ/FNI6gRq/jPztQypme41Sr8o+nz9MTB/1tLHQbXMoWB
	J9b7wNxTu34/GfaLEadhVv+3skvyzHVXrxuA57EZDi3eqv/j8tkWU21hGS0ix+FTTxvHgq+X3ZKR+
	eQU57vOA8mCqFyN4REJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApvb-00000003NmZ-14HR;
	Tue, 12 Nov 2024 12:23:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApe3-00000003Kuo-1l2W
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 12:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68B76A4186B;
	Tue, 12 Nov 2024 12:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEA9C4CED0;
	Tue, 12 Nov 2024 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731413118;
	bh=3cMtTIEGjOTBq/rpaFcUbPlOwMZMkBoEmZY0c/eZGYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmC4LlwZY2UTiC4oBuvreQj8ilDpgg2S/9Z6CxKU00MgQq45EvwjhDjreUScg27is
	 WVfTdtbue/9dOdMrgp39oRqjofq56CONSuyfaUPMvM6YvIGA9GkU+Md0sdTKEmD32q
	 MtdwjwrB9uL29Po0BOANP3D7KXaeXFhYDibVr4BfyizhYGrrOc8KTsMTgKVsgwjpFq
	 wXFsNNnGGz/sI52AZyEpuHdkDQjxihs+l35FeT1Hq0sIdNeGjjj+JaKkse7IaNqSpk
	 OhS5iRFSPXiUweMQ7jzKT7hdBZNcrHm100q1V8Tlx85tBAhOwfV1drM6tMQndXpg2Q
	 evd/SSp/htn6Q==
Date: Tue, 12 Nov 2024 12:05:10 +0000
From: Will Deacon <will@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Message-ID: <20241112120510.GA21181@willie-the-truck>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
 <20241103145153.105097-14-alexghiti@rivosinc.com>
 <20241111164259.GA20042@willie-the-truck>
 <CAJF2gTTuvmtmKVFMZCTMxEWHrpSpqPE8QO4MC5njPAskGEmpig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTuvmtmKVFMZCTMxEWHrpSpqPE8QO4MC5njPAskGEmpig@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_040519_591399_3AD87636 
X-CRM114-Status: GOOD (  22.58  )
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

T24gVHVlLCBOb3YgMTIsIDIwMjQgYXQgMDk6NDk6MTVBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUdWUsIE5vdiAxMiwgMjAyNCBhdCAxMjo0M+KAr0FNIFdpbGwgRGVhY29uIDx3aWxsQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwgTm92IDAzLCAyMDI0IGF0IDAzOjUxOjUz
UE0gKzAxMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+ID4gSW4gb3JkZXIgdG8gcHJvZHVj
ZSBhIGdlbmVyaWMga2VybmVsLCBhIHVzZXIgY2FuIHNlbGVjdAo+ID4gPiBDT05GSUdfQ09NQk9f
U1BJTkxPQ0tTIHdoaWNoIHdpbGwgZmFsbGJhY2sgYXQgcnVudGltZSB0byB0aGUgdGlja2V0Cj4g
PiA+IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIGlmIFphYmhhIG9yIFppY2Nyc2UgYXJlIG5vdCBw
cmVzZW50Lgo+ID4gPgo+ID4gPiBOb3RlIHRoYXQgd2UgY2FuJ3QgdXNlIGFsdGVybmF0aXZlcyBo
ZXJlIGJlY2F1c2UgdGhlIGRpc2NvdmVyeSBvZgo+ID4gPiBleHRlbnNpb25zIGlzIGRvbmUgdG9v
IGxhdGUgYW5kIHdlIG5lZWQgdG8gc3RhcnQgd2l0aCB0aGUgcXNwaW5sb2NrCj4gPiA+IGltcGxl
bWVudGF0aW9uIGJlY2F1c2UgdGhlIHRpY2tldCBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiB3b3Vs
ZCBwb2xsdXRlCj4gPiA+IHRoZSBzcGlubG9jayB2YWx1ZSwgc28gbGV0J3MgdXNlIHN0YXRpYyBr
ZXlzLgo+ID4KPiA+IEkgdGhpbmsgdGhlIHN0YXRpYyBrZXkgdG9nZ2xpbmcgdGFrZXMgYSBtdXRl
eCAoanVtcF9sYWJlbF9sb2NrKCkpIHdoaWNoCj4gPiBjYW4gdGFrZSBhIHNwaW5sb2NrIChsb2Nr
LT53YWl0X2xvY2spIGludGVybmFsbHksIHNvIEkgZG9uJ3QgZ3JvayBob3cKPiA+IHRoaXMgd29y
a3M6Cj4gPgo+ID4gPiArc3RhdGljIHZvaWQgX19pbml0IHJpc2N2X3NwaW5sb2NrX2luaXQodm9p
ZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgY2hhciAqdXNpbmdfZXh0ID0gTlVMTDsKPiA+ID4gKwo+
ID4gPiArICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfVElDS0VUX1NQSU5MT0NLUykp
IHsKPiA+ID4gKyAgICAgICAgICAgICBwcl9pbmZvKCJUaWNrZXQgc3BpbmxvY2s6IGVuYWJsZWRc
biIpOwo+ID4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKyAgICAgfQo+ID4gPiArCj4g
PiA+ICsgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkFCSEEpICYmCj4gPiA+
ICsgICAgICAgICBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkFDQVMpICYmCj4gPiA+ICsg
ICAgICAgICByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBaQUJIQSkgJiYKPiA+
ID4gKyAgICAgICAgIHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFpBQ0FTKSkg
ewo+ID4gPiArICAgICAgICAgICAgIHVzaW5nX2V4dCA9ICJ1c2luZyBaYWJoYSI7Cj4gPiA+ICsg
ICAgIH0gZWxzZSBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgWklDQ1JT
RSkpIHsKPiA+ID4gKyAgICAgICAgICAgICB1c2luZ19leHQgPSAidXNpbmcgWmljY3JzZSI7Cj4g
PiA+ICsgICAgIH0KPiA+ID4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9DT01CT19TUElOTE9D
S1MpCj4gPiA+ICsgICAgIGVsc2Ugewo+ID4gPiArICAgICAgICAgICAgIHN0YXRpY19icmFuY2hf
ZGlzYWJsZSgmcXNwaW5sb2NrX2tleSk7Cj4gPiA+ICsgICAgICAgICAgICAgcHJfaW5mbygiVGlj
a2V0IHNwaW5sb2NrOiBlbmFibGVkXG4iKTsKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4g
PiA+ICsgICAgIH0KPiA+ID4gKyNlbmRpZgo+ID4KPiA+IGkuZS4gd2UndmUgcG90ZW50aWFsbHkg
YWxyZWFkeSB1c2VkIHRoZSBxc3BpbmxvY2sgYXQgdGhpcyBwb2ludC4KPiBZZXMsIEkndmUgdXNl
ZCBxc3BpbmxvY2sgaGVyZS4gQnV0IHJpc2N2X3NwaW5sb2NrX2luaXQgaXMgY2FsbGVkIHdpdGgK
PiBpcnFfZGlzYWJsZWQgYW5kIHNtcF9vZmYuIFRoYXQgbWVhbnMgdGhpcyBxc3BpbmxvY2sgb25s
eSBwZXJmb3JtcyBhCj4gdGVzdC1zZXQgbG9jayBiZWhhdmlvciBieSBxc3BpbmxvY2sgZmFzdC1w
YXRoLgoKVGhhdCdzLi4uIGhvcnJlbmRvdXMuCgpXaWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
