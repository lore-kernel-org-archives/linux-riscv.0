Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46030FB3CE5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBckrjLRhiz0TcGt9k32LNG+CZFE96mxoUQ9wxWYVKA=; b=ILSz5m803hyIX4
	FBTMIwdvWYez9yxL2z8kGfQroKzTzAjoxQeNp2e9Wqd4O0Gm85zF6L+8VSkVg/Z9Sq9rLV16533Ts
	37iIYkAM4Ni4YHoomHSZiawjPS1Y98vpbmW0m9T4+vJ69SX/KAcSQZ8XbdHGWy/0tBASDYQPOv6zh
	Is7NiF+6b6nKEPLfAXnOtCJpsAAY//UqrgohxenFCK3yzD7yV9f5cSft4NIWT52pY093qm7PRCmez
	Cav4K4VUK/1hM7zQN6iADf6HofzKZqdL4KiQHmgw1oZaSegf71IixZl0wI7FPR7KrhA87DgOMrdKs
	8eSJIOnXH+JvsCIPR66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78iy-0000000AweA-3Md6;
	Mon, 30 Mar 2026 09:15:56 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78it-0000000Awd1-0BU7;
	Mon, 30 Mar 2026 09:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=WO1vn6Tln5KFquM2TJaKxzbEqp7cPSRmlLOOnQm4DBk=; b=IjoUdYg7H5HjzhmD9Ya8KzCZED
	MOdt/f/iybG0j7ZLGmiC7aJOgf9EGEZ5AT6v30A7lr8C+eX+qUGhl5lLwhUy7Ag2vW87+rI4cKgR0
	IreKmv/ogatlCLSyoDgJQL/Bm0oZPTC3Ph6N6bEB8K2FbqIE9a2RJzwF5rC3QyiVtqaFsRExlbFnq
	w6kBr9fPUeAdfZ2RsOnmOj6jLS7FgdEY+TwNyaPu3c4DAiLI7ICVb5EP/dox4qH2GHtCEzV9jz6MU
	LmEcDrV31BMlEKYMm8KfrbhCwKfgUBdd6N399NiMCtz+aDHCvorriy5EW4hCaA9xT6qUKgk0TT0qt
	Qm7u5jxA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w78hH-001L8R-10;
	Mon, 30 Mar 2026 09:14:10 +0000
Date: Mon, 30 Mar 2026 02:13:57 -0700
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
	rppt@kernel.org, ardb@kernel.org, cfsworks@gmail.com, osandov@fb.com, 
	jbohac@suse.cz, tangyouling@kylinos.cn, sourabhjain@linux.ibm.com, 
	ritesh.list@gmail.com, eajames@linux.ibm.com, songshuaishuai@tinylab.org, 
	kevin.brodsky@arm.com, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
	coxu@redhat.com, fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com, 
	guoren@kernel.org, chenjiahao16@huawei.com, hbathini@linux.ibm.com, 
	takahiro.akashi@linaro.org, james.morse@arm.com, lizhengyu3@huawei.com, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v11 10/11] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <aco-v4BuRSiZx7yy@gmail.com>
References: <20260328074013.3589544-1-ruanjinjie@huawei.com>
 <20260328074013.3589544-11-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260328074013.3589544-11-ruanjinjie@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_021551_084218_64308AC9 
X-CRM114-Status: GOOD (  11.14  )
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

T24gU2F0LCBNYXIgMjgsIDIwMjYgYXQgMDM6NDA6MTJQTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
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
dGVjdHVyZS4KPiAKPiBBY2tlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNA
YXJtLmNvbT4KPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4K
PiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4gQWNrZWQtYnk6IE1pa2Ug
UmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogQXJkIEJp
ZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8
cnVhbmppbmppZUBodWF3ZWkuY29tPgoKVGVzdGVkLWJ5OiBCcmVubyBMZWl0YW8gPGxlaXRhb0Bk
ZWJpYW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
