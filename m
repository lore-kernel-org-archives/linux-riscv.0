Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD546EC01B4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05ILSkQsGjrnwsBryJXPqUEhUtxuZviI8T/bvcvlubU=; b=EPikvgZuqiwzRz
	QYWs5ukIaq4agjI/euJJgiO3/qqfPIna0/cIruxtRdlAbPLW2TvjCqBsShDdTG2Gy9hFAki6FMkZF
	MKwPD2fts5vspmD7Fxj40JvR9SwMVimN2NQUdO3pwUMgGyyq6+MiQkvv0auE2EDn7UsyF1WwR+3WE
	wWgA3b6JVNLpLKLLPDpsRxOgoy5Wv9OMIruQJWcBgvYplZmksQMWmlly/x3oh5pU/rUzutSNIBVAt
	f4/YUS4HV14MNFo12rtB10hS1yZv4j351USBQdHoaSapaOr8s+n9UZsE4HNSjcrFf54u0kFO9heE3
	9BtoY04mJFtfczfaZCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cQr-0000000GVM8-45kK;
	Mon, 23 Mar 2026 10:22:49 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cQo-0000000GVIn-3Gob;
	Mon, 23 Mar 2026 10:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=DH+iNz08X6EuAL3xC9z+JByLMXFyPiPYDRa6C8Lo498=; b=cOELZ+GzPUk5kjUi33kxf6Lu7p
	GY3nwOVi920GJ9UbvJXatjMBuQEPT0FOX4okImlD8Vj3T4hBJwuD4uVDmjAO+AoxU+1owP1yMDUJv
	6jIqukt9sJv843ocVhBm8CQf/EgCYlBeY70qonTJ07RkEANn/O90EI9F2qKxX/Ruiw+ig35xTfySr
	TCQUi13ye1jWvFFXVEayi3gPh6rq4OrCVTXd3UdB4U39KNNRni9xgjm24sZzkklawm4ICVKu9C6Bt
	6iaiADnz4fz5s6LsXVZRgEIBNtVWG99q9re5mqluxiVD7HtUILcAbo0RaYSXFH39nUpc6WAzPyJnG
	O3Zbf8gA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4cP7-007SfO-16; Mon, 23 Mar 2026 10:20:59 +0000
Date: Mon, 23 Mar 2026 03:20:48 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	safinaskar@gmail.com, rppt@kernel.org, ardb@kernel.org, jbohac@suse.cz, 
	cfsworks@gmail.com, osandov@fb.com, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, samuel.holland@sifive.com, 
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com, 
	fuqiang.wang@easystack.cn, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v9 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <acETyW3FYaWCShUc@gmail.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323072745.2481719-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260323072745.2481719-5-ruanjinjie@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_032246_895395_E6D08983 
X-CRM114-Status: GOOD (  21.55  )
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

T24gTW9uLCBNYXIgMjMsIDIwMjYgYXQgMDM6Mjc6NDRQTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
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
dGVjdHVyZS4KPiAKPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9y
Zz4KPiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4gQWNrZWQtYnk6IE1p
a2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogQXJk
IEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVh
biA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+IC0tLQo+IHY3Ogo+IC0gQ29ycmVjdCB0aGUgaW5j
bHVzaW9uIG9mIENNQS1yZXNlcnZlZCByYW5nZXMgZm9yIGtkdW1wCj4gICBrZXJuZWwgaW4gb2Yv
a2V4ZWMuCj4gdjM6Cj4gLSBBZGQgQWNrZWQtYnkuCj4gdjI6Cj4gLSBGcmVlIGNtZW0gaW4gcHJl
cGFyZV9lbGZfaGVhZGVycygpCj4gLSBBZGQgdGhlIG10aXZhdGlvbi4KPiAtLS0KPiAgRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgfCAyICstCj4gIGFyY2gv
YXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAgICAgICAgIHwgMiArLQo+ICBhcmNo
L2FybTY0L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrLS0KPiAg
ZHJpdmVycy9vZi9mZHQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA5ICsrKysr
LS0tLQo+ICBkcml2ZXJzL29mL2tleGVjLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDkgKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJh
bWV0ZXJzLnR4dAo+IGluZGV4IGNiODUwZTUyOTBjMi4uYWZiMzExMjUxMGY3IDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBAQCAt
MTEyMSw3ICsxMTIxLDcgQEAgS2VybmVsIHBhcmFtZXRlcnMKPiAgCQkJSXQgd2lsbCBiZSBpZ25v
cmVkIHdoZW4gY3Jhc2hrZXJuZWw9WCxoaWdoIGlzIG5vdCB1c2VkCj4gIAkJCW9yIG1lbW9yeSBy
ZXNlcnZlZCBpcyBiZWxvdyA0Ry4KPiAgCWNyYXNoa2VybmVsPXNpemVbS01HXSxjbWEKPiAtCQkJ
W0tOTCwgWDg2LCBwcGNdIFJlc2VydmUgYWRkaXRpb25hbCBjcmFzaCBrZXJuZWwgbWVtb3J5IGZy
b20KPiArCQkJW0tOTCwgWDg2LCBBUk02NCwgUFBDXSBSZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gg
a2VybmVsIG1lbW9yeSBmcm9tCj4gIAkJCUNNQS4gVGhpcyByZXNlcnZhdGlvbiBpcyB1c2FibGUg
YnkgdGhlIGZpcnN0IHN5c3RlbSdzCj4gIAkJCXVzZXJzcGFjZSBtZW1vcnkgYW5kIGtlcm5lbCBt
b3ZhYmxlIGFsbG9jYXRpb25zIChtZW1vcnkKPiAgCQkJYmFsbG9vbiwgenN3YXApLiBQYWdlcyBh
bGxvY2F0ZWQgZnJvbSB0aGlzIG1lbW9yeSByYW5nZQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVf
a2V4ZWNfZmlsZS5jCj4gaW5kZXggYzMzODUwNmE1ODBiLi5jYzU3N2Q3N2RmMDAgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPiArKysgYi9hcmNo
L2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+IEBAIC00Miw3ICs0Miw3IEBAIGlu
dCBhcmNoX2tpbWFnZV9maWxlX3Bvc3RfbG9hZF9jbGVhbnVwKHN0cnVjdCBraW1hZ2UgKmltYWdl
KQo+ICAjaWZkZWYgQ09ORklHX0NSQVNIX0RVTVAKPiAgdW5zaWduZWQgaW50IGFyY2hfZ2V0X3N5
c3RlbV9ucl9yYW5nZXModm9pZCkKPiAgewo+IC0JdW5zaWduZWQgaW50IG5yX3JhbmdlcyA9IDI7
IC8qIGZvciBleGNsdXNpb24gb2YgY3Jhc2hrZXJuZWwgcmVnaW9uICovCj4gKwl1bnNpZ25lZCBp
bnQgbnJfcmFuZ2VzID0gMiArIGNyYXNoa19jbWFfY250OyAvKiBmb3IgZXhjbHVzaW9uIG9mIGNy
YXNoa2VybmVsIHJlZ2lvbiAqLwoKWW91IHVwZGF0ZSBhcmNoX2dldF9zeXN0ZW1fbnJfcmFuZ2Vz
KCkgdG8gYWNjb3VudCBmb3IgQ01BIHJhbmdlcywgYnV0CnByZXBhcmVfZWxmX2hlYWRlcnMoKSBp
biB0aGUgc2FtZSBmaWxlIChsaW5lIDUxKSBzdGlsbCBoYXMgdGhlCmhhcmRjb2RlZDoKCiAgICAg
ICAgbnJfcmFuZ2VzID0gMjsgLyogZm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCByZWdpb24g
Ki8KCmFuZCBkb2VzIG5vdCBleGNsdWRlIENNQSByYW5nZXMgZnJvbSBjbWVtLiBJZiB0aGUgZ2Vu
ZXJpYyBjcmFzaCBjb3JlCmhhbmRsZXMgQ01BIGV4Y2x1c2lvbiBmcm9tIHZtY29yZSwgdGhlbiBz
aG91bGRuJ3QKYXJjaF9nZXRfc3lzdGVtX25yX3JhbmdlcygpIGFsc28gbm90IG5lZWQgdGhpcyBj
aGFuZ2U/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
