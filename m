Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2A1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9i+HNndwn3Ot3yCOWCF6op1eASTiGfiGTkqwzpNnkU=; b=16KIf0Rt/VvVns
	oSMJydCW28Wyc//IeQJHTQMr04FImkr+BIoHrStSLyWYbcPMmWFv38Xd48Qhlrbx5z5ZmGRvXJYlG
	USJtwTAxryZ5ipMNlDVfm0xIEMgSdLBu5WK6sW0/zMyRT+4YYaMC1cKqr9PyPGu3PAArBTiXjsyCX
	95/FKlRnYev4rwkdo15PZUmQUaBRS9aVs/TFVBsdigONQ3wka9H+jqm4+RKJPmzbgBFKmcWfg6536
	90C/z3JRl0W3wxan9TrY8xQqcy+jlKUEWY4H1fdYnzNXtMKkVbDWTDGtfrxRzcWZR9nLmmRu9fGk6
	4c6AKcSyj/XeeXgZ5qvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysXN-00Ca6Q-Eg; Wed, 08 Jun 2022 10:03:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysWp-00CZoL-LE; Wed, 08 Jun 2022 10:03:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8E1DDCE274F;
	Wed,  8 Jun 2022 10:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3838CC3411C;
	Wed,  8 Jun 2022 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654682581;
	bh=IE2ioBq3LzKNaoMouoT+ks73JxPmJtR88S4lYSVl7wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAaCktvfr7A5t034XvRH9WIQQr/4Mw4S4pGwpHeH4fIQQ1OC3w+8pGZSBUX9y0GLQ
	 mgtqq5MQh0C5UQQpqLNjTSzsmtJPE/Oo1imEyoWuCfIeYrcOmnTHfbOUvxxuxYbsOI
	 XXKH0ppnWrlYoimgq23myaUGrrd9NdQaW16h4TGAmhBBX5NCp4i8cMQjk387d88JiQ
	 uHPdkfVZdVxnaXX/xz4qB49xdyEassZxq7C5wW2GToi1PY1VMiyNP3XmyxUpSQhuD/
	 w8hEhPJQlrPE5vkZm6aaML6rqgy/PNE0PefD+a42+p7LkMDHiSE2ZWn5MgafXB9SHF
	 JV/9iIXozkOOA==
Date: Wed, 8 Jun 2022 13:02:42 +0300
From: Mike Rapoport <rppt@kernel.org>
To: mawupeng <mawupeng1@huawei.com>
Cc: ardb@kernel.org, david@redhat.com, corbet@lwn.net, will@kernel.org,
	catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, dvhart@infradead.org, andy@infradead.org,
	akpm@linux-foundation.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
	keescook@chromium.org, songmuchun@bytedance.com,
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
	swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
	anshuman.khandual@arm.com, thunder.leizhen@huawei.com,
	wangkefeng.wang@huawei.com, gpiccoli@igalia.com,
	chenhuacai@kernel.org, geert@linux-m68k.org, chenzhou10@huawei.com,
	vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
Message-ID: <YqBzwgTgWEAx8J/C@kernel.org>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com>
 <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
 <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
 <29900b05-ec44-76a2-645a-22a13399d7fd@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29900b05-ec44-76a2-645a-22a13399d7fd@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_030308_101889_8BB7F2BB 
X-CRM114-Status: GOOD (  43.42  )
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

T24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDM6Mjc6MDlQTSArMDgwMCwgbWF3dXBlbmcgd3JvdGU6
Cj4gCj4g5ZyoIDIwMjIvNi83IDIyOjQ5LCBBcmQgQmllc2hldXZlbCDlhpnpgZM6Cj4gPiBPbiBU
dWUsIDcgSnVuIDIwMjIgYXQgMTQ6MjIsIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQu
Y29tPiB3cm90ZToKPiA+ID4gCj4gPiA+IE9uIDA3LjA2LjIyIDExOjM4LCBXdXBlbmcgTWEgd3Jv
dGU6Cj4gPiA+ID4gRnJvbTogTWEgV3VwZW5nIDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4KPiA+ID4g
PiAKPiA+ID4gPiBJbml0cmQgbWVtb3J5IHdpbGwgYmUgcmVtb3ZlZCBhbmQgdGhlbiBhZGRlZCBp
biBhcm02NF9tZW1ibG9ja19pbml0KCkgYW5kIHRoaXMKPiA+ID4gPiB3aWxsIGNhdXNlIGl0IHRv
IGxvc2UgYWxsIG9mIGl0cyBtZW1ibG9jayBmbGFncy4gVGhlIGxvc3Qgb2YgTUVNQkxPQ0tfTUlS
Uk9SCj4gPiA+ID4gZmxhZyB3aWxsIGxlYWQgdG8gZXJyb3IgbG9nIHByaW50ZWQgYnkgZmluZF96
b25lX21vdmFibGVfcGZuc19mb3Jfbm9kZXMgaWYKPiA+ID4gPiB0aGUgbG93ZXIgNEcgcmFuZ2Ug
aGFzIHNvbWUgbm9uLW1pcnJvcmVkIG1lbW9yeS4KPiA+ID4gPiAKPiA+ID4gPiBJbiBvcmRlciB0
byBzb2x2ZSB0aGlzIHByb2JsZW0sIHRoZSBsb3N0IE1FTUJMT0NLX01JUlJPUiBmbGFnIHdpbGwg
YmUKPiA+ID4gPiByZWluc3RhbGxlZCBpZiB0aGUgb3JpZ2luIG1lbWJsb2NrIGhhcyB0aGlzIGZs
YWcuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWEgV3VwZW5nIDxtYXd1cGVuZzFA
aHVhd2VpLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgIGFyY2gvYXJtNjQvbW0vaW5pdC5jICAg
ICB8ICA5ICsrKysrKysrKwo+ID4gPiA+ICAgaW5jbHVkZS9saW51eC9tZW1ibG9jay5oIHwgIDEg
Kwo+ID4gPiA+ICAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysr
KysrKysKPiA+ID4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+ID4gPiA+
IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2luaXQuYyBiL2FyY2gvYXJtNjQv
bW0vaW5pdC5jCj4gPiA+ID4gaW5kZXggMzM5ZWU4NGU1YTYxLi4xMTY0MWY5MjRkMDggMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9tbS9pbml0LmMKPiA+ID4gPiArKysgYi9hcmNoL2Fy
bTY0L21tL2luaXQuYwo+ID4gPiA+IEBAIC0zNTAsOSArMzUwLDE4IEBAIHZvaWQgX19pbml0IGFy
bTY0X21lbWJsb2NrX2luaXQodm9pZCkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICJp
bml0cmQgbm90IGZ1bGx5IGFjY2Vzc2libGUgdmlhIHRoZSBsaW5lYXIgbWFwcGluZyAtLSBwbGVh
c2UgY2hlY2sgeW91ciBib290bG9hZGVyIC4uLlxuIikpIHsKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgIHBoeXNfaW5pdHJkX3NpemUgPSAwOwo+ID4gPiA+ICAgICAgICAgICAgICAgIH0g
ZWxzZSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGludCBmbGFncywgcmV0Owo+ID4g
PiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gbWVtYmxvY2tfZ2V0X2Zs
YWdzKGJhc2UsICZmbGFncyk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQp
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgPSAwOwo+ID4gPiA+
ICsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIG1lbWJsb2NrX3JlbW92ZShiYXNlLCBz
aXplKTsgLyogY2xlYXIgTUVNQkxPQ0tfIGZsYWdzICovCj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICBtZW1ibG9ja19hZGQoYmFzZSwgc2l6ZSk7Cj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICBtZW1ibG9ja19yZXNlcnZlKGJhc2UsIHNpemUpOwo+ID4gPiAKPiA+ID4gQ2FuIHlv
dSBleHBsYWluIHdoeSB3ZSdyZSByZW1vdmluZytyZS1hZGRpbmcgaGVyZSBleGFjdGx5PyBJcyBp
dCBqdXN0IHRvCj4gPiA+IGNsZWFyIGZsYWdzIGFzIHRoZSBjb21tZW50IGluZGljYXRlcz8KPiA+
ID4gCj4gPiAKPiA+IFRoaXMgc2hvdWxkIG9ubHkgaGFwcGVuIGlmIHRoZSBwbGFjZW1lbnQgb2Yg
dGhlIGluaXRyZCBjb25mbGljdHMgd2l0aAo+ID4gYSBtZW09IGNvbW1hbmQgbGluZSBwYXJhbWV0
ZXIgb3IgaXQgaXMgbm90IGNvdmVyZWQgYnkgbWVtYmxvY2sgZm9yCj4gPiBzb21lIG90aGVyIHJl
YXNvbi4KPiA+IAo+ID4gSU9XLCB0aGlzIHNob3VsZCBuZXZlciBoYXBwZW4sIGFuZCBpZiByZS1t
ZW1ibG9ja19hZGQnaW5nIHRoaXMgbWVtb3J5Cj4gPiB1bmNvbmRpdGlvbmFsbHkgaXMgY2F1c2lu
ZyBwcm9ibGVtcywgd2Ugc2hvdWxkIGZpeCB0aGF0IGluc3RlYWQgb2YKPiA+IHdvcmtpbmcgYXJv
dW5kIGl0Lgo+IAo+IFRoaXMgd2lsbCBoYXBwZW4gaWYgd2UgdXNlIGluaXRyZG1lbT0zRywxMDBN
IHRvIHJlc2VydmUgaW5pdHJkIG1lbW9yeSBiZWxvdwo+IHRoZSA0RyBsaW1pdCB0byB0ZXN0IHRo
aXMgc2NlbmFyaW8oanVzdCBmb3IgdGVzdGluZywgSSBoYXZlIHRyb3VibGUgdG8gYm9vdAo+IHFl
bXUgd2l0aCBpbml0cmQgZW5hYmxlZCBhbmQgbWVtb3J5IGJlbG93IDRHIGFyZSBhbGwgbWlycm9y
IG1lbW9yeSkuCj4gCj4gUmUtbWVtYmxvY2tfYWRkJ2luZyB0aGlzIG1lbW9yeSB1bmNvbmRpdGlv
bmFsbHkgc2VlbXMgZmluZSBidXQgY2xlYXIgYWxsCj4gZmxhZ3MoZXNwZWNpYWxseSBNRU1CTE9D
S19NSVJST1IpIG1heSBsZWFkIHRvIHNvbWUgZXJyb3IgbG9nLgo+IAo+ID4gCj4gPiA+IElmIGl0
J3MgcmVhbGx5IGp1c3QgYWJvdXQgY2xlYXJpbmcgZmxhZ3MsIEkgd29uZGVyIGlmIHdlIHJhdGhl
ciB3YW50IHRvCj4gPiA+IGhhdmUgYW4gaW50ZXJmYWNlIHRoYXQgZG9lcyBleGFjdGx5IHRoYXQs
IGFuZCBoaWRlcyB0aGUgd2F5IHRoaXMgaXMKPiA+ID4gYWN0dWFsbHkgaW1wbGVtZW50ZWQgKG9i
dGFpbiBmbGFncywgcmVtb3ZlLCByZS1hZGQgLi4uKSwgaW50ZXJuYWxseS4KPiA+ID4gCj4gPiA+
IEJ1dCBtb3N0IHByb2JhYmx5IHRoZXJlIGlzIG1vcmUgbWFnaWMgaW4gdGhlIGNvZGUgYW5kIGNs
ZWFyaW5nIGZsYWdzCj4gPiA+IGlzbid0IGFsbCBpdCBlbmRzIHVwIGRvaW5nLgo+ID4gPiAKPiA+
IAo+ID4gSSBkb24ndCByZW1lbWJlciBleGFjdGx5IHdoeSB3ZSBuZWVkZWQgdG8gY2xlYXIgdGhl
IGZsYWdzLCBidXQgSSB0aGluawo+ID4gaXQgaGFkIHRvIGRvIHdpdGggc29tZSBjb3JuZXIgY2Fz
ZSB3ZSBoaXQgd2hlbiB0aGUgaW5pdHJkIHdhcwo+ID4gcGFydGlhbGx5IGNvdmVyZWQuCj4gSWYg
Im1lbT0iIGlzIHNldCBpbiBjb21tYW5kIGxpbmUsIG1lbWJsb2NrX21lbV9saW1pdF9yZW1vdmVf
bWFwKCkgd2lsbAo+IHJlbW92ZSBhbGwgbWVtb3J5IGJsb2NrIHdpdGhvdXQgTUVNQkxPQ0tfTk9N
QVAuIE1heWJlIHRoaXMgd2lsbCBicmluZyB0aGUKPiBtZW1vcnkgYmFjayBpZiB0aGlzIGluaXRy
ZCBtZW0gaGFzIHRoZSBNRU1CTE9DS19OT01BUCBmbGFnPwo+IAo+IFRoZSByZmMgdmVyc2lvbiBb
MV0gaW50cm9kdWNlIGFuZCB1c2UgbWVtYmxvY2tfY2xlYXJfbm9tYXAoKSB0byBjbGVhciB0aGUK
PiBNRU1CTE9DS19OT01BUCBvZiB0aGlzIGluaXRyZCBtZW1ibG9jay4KPiBTbyBtYXliZSB0aGUg
dXNhZ2Ugb2YgbWVtYmxvY2tfcmVtb3ZlKCkgaXMganVzdCB0byBhdm9pZCBpbnRyb2R1Y2luZyBu
ZXcKPiBmdW5jdGlvbihtZW1ibG9ja19jbGVhcl9ub21hcCk/Cj4gCj4gU2luY2UgY29tbWl0IDRj
NTQ2YjhhMzQ2OSAoIm1lbWJsb2NrOiBhZGQgbWVtYmxvY2tfY2xlYXJfbm9tYXAoKSIpIGFscmVh
ZHkKPiBpbnRyb2R1Y2VkIG1lbWJsb2NrX2NsZWFyX25vbWFwKCkuIENhbiB3ZSB1c2UgdGhpcyB0
byByZW1vdmUgZmxhZyBNRU1CTE9DS19OT01BUAo+IHRvIHNvbHZlIHRoaXMgcHJvYmxlbSByYXRo
ZXIgdGhhbiBicmluZyBmbGFnIE1FTUJMT0NLX01JUlJPUiBiYWNrPwoKQUZBSUNULCB0aGVyZSBh
cmUgdHdvIGNvcm5lciBjYXNlcyB0aGF0IHJlLWFkZGluZyBpbml0cmQgbWVtb3J5IGNvdmVyczoK
KiBpbml0cmQgbWVtb3J5IGlzIG5vdCBhIHBhcnQgb2YgdGhlIG1lbW9yeSByZXBvcnRlZCB0byBt
ZW1ibG9jaywgZWl0aGVyCmJlY2F1c2Ugb2YgZmlybXdhcmUgd2VpcmRuZXNzIG9yIGJlY2F1c2Ug
aXQgd2FzIGN1dCBvdXQgd2l0aCBtZW09CiogaW5pdHJkIG1lbW9yeSBvdmVybGFwcyBhIE5PTUFQ
IHJlZ2lvbgoKU28gdG8gbWFrZSBzdXJlIGluaXRyZCBtZW1vcnkgaXMgbWFwcGVkIHByb3Blcmx5
IGFuZCByZXRhaW5zCk1FTUJMT0NLX01JUlJPUiBJIHRoaW5rIHRoZSBiZXN0IHdlIGNhbiBkbyBp
cwoKCW1lbWJsb2NrX2FkZCgpOwoJbWVtYmxvY2tfY2xlYXJfbm9tYXAoKTsKCW1lbWJsb2NrX3Jl
c2VydmUoKTsKCiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5l
bC8yMDE2MDIwMjE4MDYyMi5HUDEwMTY2QGFybS5jb20vVC8jdAo+ID4gLgoKLS0gClNpbmNlcmVs
eSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
