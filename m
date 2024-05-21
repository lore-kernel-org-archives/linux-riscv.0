Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B70AC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxYqBDQqanTmxpgXcVLG2r79ukT8OiSaYIvngsz58Qk=; b=ap2Iwj35oPPMUD
	MFrduUSQxD2PaiYCIoPHdEDAc9MsEBDtQCc5VCPSf+z/MbKZ4Xv4fzJKjOTRGfGj2PoZ86gWdJThk
	fAKCs2H2B023x2yW458Q8EebB2061ohfj6KOfk/FNCQfySj9q/Vux5Mv2/uEG6T5RGYZWhnE4kn1T
	IVJsreW8cRD4EMs6kzfNpsOV3J6lIJ4OjsXaL2uVg74hKCUOB2jvlM/n1ZJROzgkXuCKKBrscacm1
	RlhYT63CjTjMkgbJM1T7W2+J8l7IACcQMuihUVIGQbw/7zY5ypH61IATS9VUTqFTM0X6w3ggvMdOM
	jGrt/do/QaovboetStSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9S3R-00000000STJ-0KeB;
	Tue, 21 May 2024 16:09:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9S3O-00000000SSi-2RGN
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 16:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8CA861BFE;
	Tue, 21 May 2024 16:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E5AC2BD11;
	Tue, 21 May 2024 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716307769;
	bh=RkSBxB1mPmJZ/DR8Fr08TnX1zxdKqejkPexNssbR7dQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YCo9ASI2Js2y0lYzH+ndmKVe0VBlFTGkycxT7Zujt14aad9AwhyXNS7KaKggq6hOZ
	 CjqBuMvBipIHRI0dSeAnRaGdIWq9dw+lco9sDto8ytsjwHOsLdjahwZxFEMUyF2PJo
	 rsSN3ldZuKLPl165ORt4ogze7omXIAaPwrKrmNWACeG75cOkrx5NAC189ciVuC4xpg
	 Dh8KVRkGsbWFABrokxiEiOf/Gc1ifElhhLSV1S7Fye8UgqFZ5Ir1yPlX4Yr65gHiyY
	 28FCxQDb2DcdZ6d5HsyVkKt/PaQmniprxTRaBhweDbGOnULeN9u2tGzvd6gEdrMkEp
	 /B4suKzHDu8yg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Albert Ou
 <aou@eecs.berkeley.edu>, David Hildenbrand <david@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v3 2/9] riscv: mm: Pre-allocate vmemmap/direct map PGD
 entries
In-Reply-To: <20240521114830.841660-3-bjorn@kernel.org>
References: <20240521114830.841660-1-bjorn@kernel.org>
 <20240521114830.841660-3-bjorn@kernel.org>
Date: Tue, 21 May 2024 18:09:25 +0200
Message-ID: <87frubdu4q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_090930_830980_E5786EC6 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBUaGUgUklTQy1WIHBvcnQgY29waWVzIHRo
ZSBQR0QgdGFibGUgZnJvbSBpbml0X21tL3N3YXBwZXJfcGdfZGlyIHRvCj4gYWxsIHVzZXJsYW5k
IHBhZ2UgdGFibGVzLCB3aGljaCBtZWFucyB0aGF0IGlmIHRoZSBQR0QgbGV2ZWwgdGFibGUgaXMK
PiBjaGFuZ2VkLCBvdGhlciBwYWdlIHRhYmxlcyBoYXMgdG8gYmUgdXBkYXRlZCBhcyB3ZWxsLgo+
Cj4gSW5zdGVhZCBvZiBoYXZpbmcgdGhlIFBHRCBjaGFuZ2VzIHJpcHBsZSBvdXQgdG8gYWxsIHRh
YmxlcywgdGhlCj4gc3luY2hyb25pemF0aW9uIGNhbiBiZSBhdm9pZGVkIGJ5IHByZS1hbGxvY2F0
aW5nIHRoZSBQR0QgZW50cmllcy9wYWdlcwo+IGF0IGJvb3QsIGF2b2lkaW5nIHRoZSBzeW5jaHJv
bml6YXRpb24gYWxsIHRvZ2V0aGVyLgo+Cj4gVGhpcyBpcyBjdXJyZW50bHkgZG9uZSBmb3IgdGhl
IGJwZi9tb2R1bGVzLCBhbmQgdm1hbGxvYyBQR0QgcmVnaW9ucy4KPiBFeHRlbmQgdGhpcyBzY2hl
bWUgZm9yIHRoZSBQR0QgcmVnaW9ucyB0b3VjaGVkIGJ5IG1lbW9yeSBob3RwbHVnZ2luZy4KPgo+
IFByZXBhcmUgdGhlIFJJU0MtViBwb3J0IGZvciBtZW1vcnkgaG90cGx1ZyBieSBwcmUtYWxsb2Nh
dGUKPiB2bWVtbWFwL2RpcmVjdCBtYXAgZW50cmllcyBhdCB0aGUgUEdEIGxldmVsLiBUaGlzIHdp
bGwgcm91Z2hseSB3YXN0ZQo+IH4xMjggd29ydGggb2YgNEsgcGFnZXMgd2hlbiBtZW1vcnkgaG90
cGx1Z2dpbmcgaXMgZW5hYmxlZCBpbiB0aGUKPiBrZXJuZWwgY29uZmlndXJhdGlvbi4KPgo+IFJl
dmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmggfCA0ICsrLS0KPiAgYXJjaC9yaXNjdi9tbS9p
bml0LmMgICAgICAgICAgIHwgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va2FzYW4uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2FzYW4uaAo+IGluZGV4IDBi
ODVlMzYzZTc3OC4uZTZhMDA3MWJkYjU2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va2FzYW4uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2FzYW4uaAo+IEBA
IC02LDggKzYsNiBAQAo+ICAKPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiAgCj4gLSNpZmRlZiBD
T05GSUdfS0FTQU4KPiAtCj4gIC8qCj4gICAqIFRoZSBmb2xsb3dpbmcgY29tbWVudCB3YXMgY29w
aWVkIGZyb20gYXJtNjQ6Cj4gICAqIEtBU0FOX1NIQURPV19TVEFSVDogYmVnaW5uaW5nIG9mIHRo
ZSBrZXJuZWwgdmlydHVhbCBhZGRyZXNzZXMuCj4gQEAgLTM0LDYgKzMyLDggQEAKPiAgICovCj4g
ICNkZWZpbmUgS0FTQU5fU0hBRE9XX1NUQVJUCSgoS0FTQU5fU0hBRE9XX0VORCAtIEtBU0FOX1NI
QURPV19TSVpFKSAmIFBHRElSX01BU0spCj4gICNkZWZpbmUgS0FTQU5fU0hBRE9XX0VORAlNT0RV
TEVTX0xPV0VTVF9WQUREUgo+ICsKPiArI2lmZGVmIENPTkZJR19LQVNBTgo+ICAjZGVmaW5lIEtB
U0FOX1NIQURPV19PRkZTRVQJX0FDKENPTkZJR19LQVNBTl9TSEFET1dfT0ZGU0VULCBVTCkKPiAg
Cj4gIHZvaWQga2FzYW5faW5pdCh2b2lkKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9p
bml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IGluZGV4IGI2NmY4NDZlNzYzNC4uYzk4MDEw
ZWRlODEwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9y
aXNjdi9tbS9pbml0LmMKPiBAQCAtMjcsNiArMjcsNyBAQAo+ICAKPiAgI2luY2x1ZGUgPGFzbS9m
aXhtYXAuaD4KPiAgI2luY2x1ZGUgPGFzbS9pby5oPgo+ICsjaW5jbHVkZSA8YXNtL2thc2FuLmg+
Cj4gICNpbmNsdWRlIDxhc20vbnVtYS5oPgo+ICAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KPiAg
I2luY2x1ZGUgPGFzbS9zZWN0aW9ucy5oPgo+IEBAIC0xNDg4LDEwICsxNDg5LDE2IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UodW5zaWduZWQgbG9uZyBz
dGFydCwgdW5zaWduZWQgbG9uCj4gIAlwYW5pYygiRmFpbGVkIHRvIHByZS1hbGxvY2F0ZSAlcyBw
YWdlcyBmb3IgJXMgYXJlYVxuIiwgbHZsLCBhcmVhKTsKPiAgfQo+ICAKPiArI2RlZmluZSBQQUdF
X0VORCBLQVNBTl9TSEFET1dfU1RBUlQKPiArCj4gIHZvaWQgX19pbml0IHBndGFibGVfY2FjaGVf
aW5pdCh2b2lkKQo+ICB7Cj4gIAlwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoVk1BTExPQ19T
VEFSVCwgVk1BTExPQ19FTkQsICJ2bWFsbG9jIik7Cj4gIAlpZiAoSVNfRU5BQkxFRChDT05GSUdf
TU9EVUxFUykpCj4gIAkJcHJlYWxsb2NhdGVfcGdkX3BhZ2VzX3JhbmdlKE1PRFVMRVNfVkFERFIs
IE1PRFVMRVNfRU5ELCAiYnBmL21vZHVsZXMiKTsKPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19N
RU1PUllfSE9UUExVRykpIHsKPiArCQlwcmVhbGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoVk1FTU1B
UF9TVEFSVCwgVk1FTU1BUF9FTkQsICJ2bWVtbWFwIik7Cj4gKwkJcHJlYWxsb2NhdGVfcGdkX3Bh
Z2VzX3JhbmdlKFBBR0VfT0ZGU0VULCBQQUdFX0VORCwgImRpcmVjdCBtYXAiKTsKCkFsZXggcG9p
bnRlZCBvdXQgdGhhdCBLQVNBTiBQR0RzIHNob3VsZCBiZSBwcmVhbGxvY2F0ZWQgYXMgd2VsbCEg
SSdsbAphZGRyZXNzIHRoaXMgaW4gdGhlIG5leHQgcmV2aXNpb24uCgoKQmrDtnJuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
