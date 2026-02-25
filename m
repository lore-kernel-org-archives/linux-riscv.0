Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38497FD3762
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5foQY6iR5GIqFxVsBUuvchyIAuQhHQTtgLfPmgV6vmU=; b=uhi1NNOFtRD1BB
	6aQUkq+zjLePxrzoKkXasiKrBeNczewRdRc2BomfwMaTa7jEJ+Jx9WpeWiQhvrbkoWdcLDXtBBBkV
	QNxdoipKhe1M0jZliKHyG0bzKs9sWRFtup8wXG++XoePeYfL8edLPZGRvlT1/EkwyNX9abSwXiNrk
	kDykhXONXxwzxen8DsGV2lxpHBxq12n0gMHpIJml5iwCbPs1gFUeUhMBp0MwoNPNQtshjegpf9sMn
	wtZs3ag1xaWSh9GxKjtdzTjUWFd9FGuX6ioJkAyHh+Sz3TjIq8Osa2wbRAe0GYe9+lEdMo/H0ME+U
	Vc/qFz7WpJYhyIQoyRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvH8M-00000004Pbt-1w1s;
	Wed, 25 Feb 2026 15:49:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvH8K-00000004PaM-1EBN;
	Wed, 25 Feb 2026 15:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A66F40302;
	Wed, 25 Feb 2026 15:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FE8C116D0;
	Wed, 25 Feb 2026 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772034541;
	bh=pZbjdg50KRzQ422ePCSptr4aHcihMfDCR1tS1O1TEsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I532EFVbqE8GHVn3wRpwoiLj0xwBUMITr7qrrtSKpJfbKKP2U/jR/Ni/Xh5FwubUQ
	 jrXuYjxxcGNKvyfvMLOzJTh8WpizKg9jXQ+SIgnrUBkOvnrS/UQQfOCywEFDs+14MG
	 VpQfSsfwndpTxDyTJi1RmrnGh747jM4VFDZfl/9mjXQdhFDHJJ5GhvxFi41iW4ufFr
	 gGwS9ktAeJD8zfB+zANO2NWjTrPQl3JcenJ3IBlSv2Zoo4hbDHTzH7P7+NLi/p1hT8
	 Ej6MKtOO9hHHUpDMRg6/ChlWZatqgw3xueHfPQ7IsX+e4bjL/EzBH94u6Sx1SQv5NA
	 Q3SR4khoEgBhg==
Date: Wed, 25 Feb 2026 17:48:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org,
	pmladek@suse.com, dapeng1.mi@linux.intel.com, kees@kernel.org,
	paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de,
	ardb@kernel.org, leitao@debian.org, cfsworks@gmail.com,
	ryan.roberts@arm.com, sourabhjain@linux.ibm.com,
	tangyouling@kylinos.cn, eajames@linux.ibm.com,
	hbathini@linux.ibm.com, ritesh.list@gmail.com,
	songshuaishuai@tinylab.org, samuel.holland@sifive.com,
	kevin.brodsky@arm.com, vishal.moola@gmail.com,
	junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
	fuqiang.wang@easystack.cn, jbohac@suse.cz, brgerst@gmail.com,
	x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [PATCH v6 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <aZ8Z2WXw3QwaXRo8@kernel.org>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
 <20260224085342.387996-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260224085342.387996-5-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_074904_375787_58D65F11 
X-CRM114-Status: GOOD (  29.25  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMDQ6NTM6NDFQTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
dGU6Cj4gQ29tbWl0IDM1YzE4ZjI5MzNjNSAoIkFkZCBhIG5ldyBvcHRpb25hbCAiLGNtYSIgc3Vm
Zml4IHRvIHRoZQo+IGNyYXNoa2VybmVsPSBjb21tYW5kIGxpbmUgb3B0aW9uIikgYW5kIGNvbW1p
dCBhYjQ3NTUxMGUwNDIgKCJrZHVtcDoKPiBpbXBsZW1lbnQgcmVzZXJ2ZV9jcmFzaGtlcm5lbF9j
bWEiKSBhZGRlZCBDTUEgc3VwcG9ydCBmb3Iga2R1bXAKPiBjcmFzaGtlcm5lbCByZXNlcnZhdGlv
bi4KPiAKPiBDcmFzaCBrZXJuZWwgbWVtb3J5IHJlc2VydmF0aW9uIHdhc3RlcyBwcm9kdWN0aW9u
IHJlc291cmNlcyBpZiB0b28KPiBsYXJnZSwgcmlza3Mga2R1bXAgZmFpbHVyZSBpZiB0b28gc21h
bGwsIGFuZCBmYWNlcyBhbGxvY2F0aW9uIGRpZmZpY3VsdGllcwo+IG9uIGZyYWdtZW50ZWQgc3lz
dGVtcyBkdWUgdG8gY29udGlndW91cyBibG9jayBjb25zdHJhaW50cy4gVGhlIG5ldwo+IENNQS1i
YXNlZCBjcmFzaGtlcm5lbCByZXNlcnZhdGlvbiBzY2hlbWUgc3BsaXRzIHRoZSAibGFyZ2UgZml4
ZWQKPiByZXNlcnZhdGlvbiIgaW50byBhICJzbWFsbCBmaXhlZCByZWdpb24gKyBsYXJnZSBDTUEg
ZHluYW1pYyByZWdpb24iOiB0aGUKPiBDTUEgbWVtb3J5IGlzIGF2YWlsYWJsZSB0byB1c2Vyc3Bh
Y2UgZHVyaW5nIG5vcm1hbCBvcGVyYXRpb24gdG8gYXZvaWQKPiB3YXN0ZSwgYW5kIGlzIHJlY2xh
aW1lZCBmb3Iga2R1bXAgdXBvbiBjcmFzaOKAlHNhdmluZyBtZW1vcnkgd2hpbGUKPiBpbXByb3Zp
bmcgcmVsaWFiaWxpdHkuCj4gCj4gU28gZXh0ZW5kIGNyYXNoa2VybmVsIENNQSByZXNlcnZhdGlv
biBzdXBwb3J0IHRvIGFybTY0LiBUaGUgZm9sbG93aW5nCj4gY2hhbmdlcyBhcmUgbWFkZSB0byBl
bmFibGUgQ01BIHJlc2VydmF0aW9uOgo+IAo+IC0gUGFyc2UgYW5kIG9idGFpbiB0aGUgQ01BIHJl
c2VydmF0aW9uIHNpemUgYWxvbmcgd2l0aCBvdGhlciBjcmFzaGtlcm5lbAo+ICAgcGFyYW1ldGVy
cy4KPiAtIENhbGwgcmVzZXJ2ZV9jcmFzaGtlcm5lbF9jbWEoKSB0byBhbGxvY2F0ZSB0aGUgQ01B
IHJlZ2lvbiBmb3Iga2R1bXAuCj4gLSBJbmNsdWRlIHRoZSBDTUEtcmVzZXJ2ZWQgcmFuZ2VzIGZv
ciBrZHVtcCBrZXJuZWwgdG8gdXNlLgo+IC0gRXhjbHVkZSB0aGUgQ01BLXJlc2VydmVkIHJhbmdl
cyBmcm9tIHRoZSBjcmFzaCBrZXJuZWwgbWVtb3J5IHRvCj4gICBwcmV2ZW50IHRoZW0gZnJvbSBi
ZWluZyBleHBvcnRlZCB0aHJvdWdoIC9wcm9jL3ZtY29yZSwgd2hpY2ggaXMgYWxyZWFkeQo+ICAg
ZG9uZSBpbiB0aGUgY3Jhc2ggY29yZS4KPiAKPiBVcGRhdGUga2VybmVsLXBhcmFtZXRlcnMudHh0
IHRvIGRvY3VtZW50IENNQSBzdXBwb3J0IGZvciBjcmFzaGtlcm5lbCBvbgo+IGFybTY0IGFyY2hp
dGVjdHVyZS4KPiAKPiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+IC0t
LQo+IHYzOgo+IC0gQWRkIEFja2VkLWJ5Lgo+IHYyOgo+IC0gRnJlZSBjbWVtIGluIHByZXBhcmVf
ZWxmX2hlYWRlcnMoKQo+IC0gQWRkIHRoZSBtdGl2YXRpb24uCj4gLS0tCj4gIERvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwgMiArLQo+ICBhcmNoL2FybTY0
L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyAgICAgICAgICB8IDggKysrKysrKy0KPiAgYXJj
aC9hcm02NC9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1ICsrKy0tCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGlu
ZGV4IGNiODUwZTUyOTBjMi4uNDk3ZjYzYjc2ODk4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBAQCAtMTEyMSw3ICsxMTIxLDcg
QEAgS2VybmVsIHBhcmFtZXRlcnMKPiAgCQkJSXQgd2lsbCBiZSBpZ25vcmVkIHdoZW4gY3Jhc2hr
ZXJuZWw9WCxoaWdoIGlzIG5vdCB1c2VkCj4gIAkJCW9yIG1lbW9yeSByZXNlcnZlZCBpcyBiZWxv
dyA0Ry4KPiAgCWNyYXNoa2VybmVsPXNpemVbS01HXSxjbWEKPiAtCQkJW0tOTCwgWDg2LCBwcGNd
IFJlc2VydmUgYWRkaXRpb25hbCBjcmFzaCBrZXJuZWwgbWVtb3J5IGZyb20KPiArCQkJW0tOTCwg
WDg2LCBBUk02NCwgcHBjXSBSZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gga2VybmVsIG1lbW9yeSBm
cm9tCj4gIAkJCUNNQS4gVGhpcyByZXNlcnZhdGlvbiBpcyB1c2FibGUgYnkgdGhlIGZpcnN0IHN5
c3RlbSdzCj4gIAkJCXVzZXJzcGFjZSBtZW1vcnkgYW5kIGtlcm5lbCBtb3ZhYmxlIGFsbG9jYXRp
b25zIChtZW1vcnkKPiAgCQkJYmFsbG9vbiwgenN3YXApLiBQYWdlcyBhbGxvY2F0ZWQgZnJvbSB0
aGlzIG1lbW9yeSByYW5nZQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5l
X2tleGVjX2ZpbGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jCj4g
aW5kZXggYzMzODUwNmE1ODBiLi5jODg2MmE3NjJlYjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02
NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9t
YWNoaW5lX2tleGVjX2ZpbGUuYwo+IEBAIC00Miw3ICs0Miw3IEBAIGludCBhcmNoX2tpbWFnZV9m
aWxlX3Bvc3RfbG9hZF9jbGVhbnVwKHN0cnVjdCBraW1hZ2UgKmltYWdlKQo+ICAjaWZkZWYgQ09O
RklHX0NSQVNIX0RVTVAKPiAgdW5zaWduZWQgaW50IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXMo
dm9pZCkKPiAgewo+IC0JdW5zaWduZWQgaW50IG5yX3JhbmdlcyA9IDI7IC8qIGZvciBleGNsdXNp
b24gb2YgY3Jhc2hrZXJuZWwgcmVnaW9uICovCj4gKwl1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzID0g
MiArIGNyYXNoa19jbWFfY250OyAvKiBmb3IgZXhjbHVzaW9uIG9mIGNyYXNoa2VybmVsIHJlZ2lv
biAqLwo+ICAJcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDsKPiAgCXU2NCBpOwo+ICAKPiBAQCAtNjQs
NiArNjQsMTIgQEAgaW50IGFyY2hfY3Jhc2hfcG9wdWxhdGVfY21lbShzdHJ1Y3QgY3Jhc2hfbWVt
ICpjbWVtKQo+ICAJCWNtZW0tPm5yX3JhbmdlcysrOwo+ICAJfQo+ICAKPiArCWZvciAoaSA9IDA7
IGkgPCBjcmFzaGtfY21hX2NudDsgaSsrKSB7Cj4gKwkJY21lbS0+cmFuZ2VzW2NtZW0tPm5yX3Jh
bmdlc10uc3RhcnQgPSBjcmFzaGtfY21hX3Jhbmdlc1tpXS5zdGFydDsKPiArCQljbWVtLT5yYW5n
ZXNbY21lbS0+bnJfcmFuZ2VzXS5lbmQgPSBjcmFzaGtfY21hX3Jhbmdlc1tpXS5lbmQ7Cj4gKwkJ
Y21lbS0+bnJfcmFuZ2VzKys7Cj4gKwl9CgpXaHkgZG8gd2UgbmVlZCB0byBhZGQgY21hIHJhbmdl
cyBoZXJlPyBUaGV5IGFyZSBhbnl3YXkgd2lsbCBiZSBleGNsdWRlZCBpbgpjcmFzaF9leGNsdWRl
X2NvcmVfcmFuZ2VzKCkuCgpUaGUgc2FtZSBjb21tZW50IGFwcGxpZXMgdG8gcmlzY3YgcGF0Y2gu
Cgo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
bW0vaW5pdC5jIGIvYXJjaC9hcm02NC9tbS9pbml0LmMKPiBpbmRleCA5NjcxMWI4NTc4ZmQuLjE0
NGUzMGZlOWE3NSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L21tL2luaXQuYwo+ICsrKyBiL2Fy
Y2gvYXJtNjQvbW0vaW5pdC5jCj4gQEAgLTk2LDggKzk2LDggQEAgcGh5c19hZGRyX3QgX19yb19h
ZnRlcl9pbml0IGFybTY0X2RtYV9waHlzX2xpbWl0Owo+ICAKPiAgc3RhdGljIHZvaWQgX19pbml0
IGFyY2hfcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2b2lkKQo+ICB7Cj4gKwl1bnNpZ25lZCBsb25nIGxv
bmcgY3Jhc2hfYmFzZSwgY3Jhc2hfc2l6ZSwgY21hX3NpemUgPSAwOwo+ICAJdW5zaWduZWQgbG9u
ZyBsb25nIGxvd19zaXplID0gMDsKPiAtCXVuc2lnbmVkIGxvbmcgbG9uZyBjcmFzaF9iYXNlLCBj
cmFzaF9zaXplOwo+ICAJYm9vbCBoaWdoID0gZmFsc2U7Cj4gIAlpbnQgcmV0Owo+ICAKPiBAQCAt
MTA2LDExICsxMDYsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IGFyY2hfcmVzZXJ2ZV9jcmFzaGtl
cm5lbCh2b2lkKQo+ICAKPiAgCXJldCA9IHBhcnNlX2NyYXNoa2VybmVsKGJvb3RfY29tbWFuZF9s
aW5lLCBtZW1ibG9ja19waHlzX21lbV9zaXplKCksCj4gIAkJCQkmY3Jhc2hfc2l6ZSwgJmNyYXNo
X2Jhc2UsCj4gLQkJCQkmbG93X3NpemUsIE5VTEwsICZoaWdoKTsKPiArCQkJCSZsb3dfc2l6ZSwg
JmNtYV9zaXplLCAmaGlnaCk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybjsKPiAgCj4gIAlyZXNl
cnZlX2NyYXNoa2VybmVsX2dlbmVyaWMoY3Jhc2hfc2l6ZSwgY3Jhc2hfYmFzZSwgbG93X3NpemUs
IGhpZ2gpOwo+ICsJcmVzZXJ2ZV9jcmFzaGtlcm5lbF9jbWEoY21hX3NpemUpOwo+ICB9Cj4gIAo+
ICBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IG1heF96b25lX3BoeXMocGh5c19hZGRyX3Qgem9u
ZV9saW1pdCkKPiAtLSAKPiAyLjM0LjEKPiAKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
