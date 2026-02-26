Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2379BFC5910
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHY72V4DeRFltQtqTFiJpUgEoHch/2xmRX0vWpQk9gs=; b=lpFppI564DRGx+
	MIFvzcKZSHU81YxH+nzEEubIEeP6QGHPiUz2KbOELrz7l+rLlYEYMSTHSRpY0s8ug76nL6wJgOvOl
	WgghtAeQUDdWwVbR/N0MlZCEO/rbyKu/vMaa5fij/nrEsKUrOgqpbP5oG71QB2pp90CdAqP7a4BOa
	SU1o9O9r5E95swdE1BjwQaYG55r48l8iKMo8vvqhCVuQLof9y4MeazAsjEATMKliZuj/W2zmM5nb8
	wE0DqAsWS2AwEnGNnkjgB52vZuEHLwvV50eV30N608advNHYDDJ9qrjymLjvHjK3lmGA/pIpCkJrA
	IsNI2esVKAz8t2NtD4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXl4-00000005p3E-0VNY;
	Thu, 26 Feb 2026 09:34:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXl0-00000005p2J-3mb6
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 09:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772098446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkGmC86NoLQjvZOxhyrqXHuM788hxYhHZtfwsGaL3u0=;
	b=iO/LXXDkwdFZJzVmwtnM+Wwo4Ya+YjuCZG968XBmEJ6bxSFvLYuDP+vdoJ/vdb4TwYW8gu
	gBLAFt258OD3OTdiErsBFUAhFeKdonht+/V4LncUgnfGWWD1pupPUqNnpaSy2H5DPBqGtv
	k+NuvVszZ7f75wb6WdbwQmvGqodPiMY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-cKoIy_McNXyrDuGueNJKMw-1; Thu,
 26 Feb 2026 04:33:56 -0500
X-MC-Unique: cKoIy_McNXyrDuGueNJKMw-1
X-Mimecast-MFC-AGG-ID: cKoIy_McNXyrDuGueNJKMw_1772098431
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7373E18002FB;
	Thu, 26 Feb 2026 09:33:49 +0000 (UTC)
Received: from localhost (unknown [10.72.112.101])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88ECE30001B9;
	Thu, 26 Feb 2026 09:33:44 +0000 (UTC)
Date: Thu, 26 Feb 2026 17:33:36 +0800
From: Baoquan He <bhe@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, paulmck@kernel.org,
	lirongqing@baidu.com, arnd@arndb.de, ardb@kernel.org,
	leitao@debian.org, rppt@kernel.org, cfsworks@gmail.com,
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
Message-ID: <aaATcPGToAxEVIvh@MiWiFi-R3L-srv>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
 <20260224085342.387996-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20260224085342.387996-5-ruanjinjie@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: fujvzf2LkruTZTYyyti0TDvY6030bb3VePx_NHYLqlQ_1772098431
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_013407_002944_D3C3A186 
X-CRM114-Status: GOOD (  22.52  )
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

T24gMDIvMjQvMjYgYXQgMDQ6NTNwbSwgSmluamllIFJ1YW4gd3JvdGU6Cj4gQ29tbWl0IDM1YzE4
ZjI5MzNjNSAoIkFkZCBhIG5ldyBvcHRpb25hbCAiLGNtYSIgc3VmZml4IHRvIHRoZQo+IGNyYXNo
a2VybmVsPSBjb21tYW5kIGxpbmUgb3B0aW9uIikgYW5kIGNvbW1pdCBhYjQ3NTUxMGUwNDIgKCJr
ZHVtcDoKPiBpbXBsZW1lbnQgcmVzZXJ2ZV9jcmFzaGtlcm5lbF9jbWEiKSBhZGRlZCBDTUEgc3Vw
cG9ydCBmb3Iga2R1bXAKPiBjcmFzaGtlcm5lbCByZXNlcnZhdGlvbi4KPiAKPiBDcmFzaCBrZXJu
ZWwgbWVtb3J5IHJlc2VydmF0aW9uIHdhc3RlcyBwcm9kdWN0aW9uIHJlc291cmNlcyBpZiB0b28K
PiBsYXJnZSwgcmlza3Mga2R1bXAgZmFpbHVyZSBpZiB0b28gc21hbGwsIGFuZCBmYWNlcyBhbGxv
Y2F0aW9uIGRpZmZpY3VsdGllcwo+IG9uIGZyYWdtZW50ZWQgc3lzdGVtcyBkdWUgdG8gY29udGln
dW91cyBibG9jayBjb25zdHJhaW50cy4gVGhlIG5ldwo+IENNQS1iYXNlZCBjcmFzaGtlcm5lbCBy
ZXNlcnZhdGlvbiBzY2hlbWUgc3BsaXRzIHRoZSAibGFyZ2UgZml4ZWQKPiByZXNlcnZhdGlvbiIg
aW50byBhICJzbWFsbCBmaXhlZCByZWdpb24gKyBsYXJnZSBDTUEgZHluYW1pYyByZWdpb24iOiB0
aGUKPiBDTUEgbWVtb3J5IGlzIGF2YWlsYWJsZSB0byB1c2Vyc3BhY2UgZHVyaW5nIG5vcm1hbCBv
cGVyYXRpb24gdG8gYXZvaWQKPiB3YXN0ZSwgYW5kIGlzIHJlY2xhaW1lZCBmb3Iga2R1bXAgdXBv
biBjcmFzaOKAlHNhdmluZyBtZW1vcnkgd2hpbGUKPiBpbXByb3ZpbmcgcmVsaWFiaWxpdHkuCj4g
Cj4gU28gZXh0ZW5kIGNyYXNoa2VybmVsIENNQSByZXNlcnZhdGlvbiBzdXBwb3J0IHRvIGFybTY0
LiBUaGUgZm9sbG93aW5nCj4gY2hhbmdlcyBhcmUgbWFkZSB0byBlbmFibGUgQ01BIHJlc2VydmF0
aW9uOgo+IAo+IC0gUGFyc2UgYW5kIG9idGFpbiB0aGUgQ01BIHJlc2VydmF0aW9uIHNpemUgYWxv
bmcgd2l0aCBvdGhlciBjcmFzaGtlcm5lbAo+ICAgcGFyYW1ldGVycy4KPiAtIENhbGwgcmVzZXJ2
ZV9jcmFzaGtlcm5lbF9jbWEoKSB0byBhbGxvY2F0ZSB0aGUgQ01BIHJlZ2lvbiBmb3Iga2R1bXAu
Cj4gLSBJbmNsdWRlIHRoZSBDTUEtcmVzZXJ2ZWQgcmFuZ2VzIGZvciBrZHVtcCBrZXJuZWwgdG8g
dXNlLgo+IC0gRXhjbHVkZSB0aGUgQ01BLXJlc2VydmVkIHJhbmdlcyBmcm9tIHRoZSBjcmFzaCBr
ZXJuZWwgbWVtb3J5IHRvCj4gICBwcmV2ZW50IHRoZW0gZnJvbSBiZWluZyBleHBvcnRlZCB0aHJv
dWdoIC9wcm9jL3ZtY29yZSwgd2hpY2ggaXMgYWxyZWFkeQo+ICAgZG9uZSBpbiB0aGUgY3Jhc2gg
Y29yZS4KPiAKPiBVcGRhdGUga2VybmVsLXBhcmFtZXRlcnMudHh0IHRvIGRvY3VtZW50IENNQSBz
dXBwb3J0IGZvciBjcmFzaGtlcm5lbCBvbgo+IGFybTY0IGFyY2hpdGVjdHVyZS4KPiAKPiBBY2tl
ZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBK
aW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+IC0tLQo+IHYzOgo+IC0gQWRkIEFj
a2VkLWJ5Lgo+IHYyOgo+IC0gRnJlZSBjbWVtIGluIHByZXBhcmVfZWxmX2hlYWRlcnMoKQo+IC0g
QWRkIHRoZSBtdGl2YXRpb24uCj4gLS0tCj4gIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2Vy
bmVsLXBhcmFtZXRlcnMudHh0IHwgMiArLQo+ICBhcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tl
eGVjX2ZpbGUuYyAgICAgICAgICB8IDggKysrKysrKy0KPiAgYXJjaC9hcm02NC9tbS9pbml0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1ICsrKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IGNiODUwZTUyOTBjMi4u
NDk3ZjYzYjc2ODk4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2Vy
bmVsLXBhcmFtZXRlcnMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQKPiBAQCAtMTEyMSw3ICsxMTIxLDcgQEAgS2VybmVsIHBhcmFtZXRl
cnMKPiAgCQkJSXQgd2lsbCBiZSBpZ25vcmVkIHdoZW4gY3Jhc2hrZXJuZWw9WCxoaWdoIGlzIG5v
dCB1c2VkCj4gIAkJCW9yIG1lbW9yeSByZXNlcnZlZCBpcyBiZWxvdyA0Ry4KPiAgCWNyYXNoa2Vy
bmVsPXNpemVbS01HXSxjbWEKPiAtCQkJW0tOTCwgWDg2LCBwcGNdIFJlc2VydmUgYWRkaXRpb25h
bCBjcmFzaCBrZXJuZWwgbWVtb3J5IGZyb20KPiArCQkJW0tOTCwgWDg2LCBBUk02NCwgcHBjXSBS
ZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gga2VybmVsIG1lbW9yeSBmcm9tCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn4gClRoaXMgc2hvdWxkIGJlIHdyaXR0ZW4g
YXMgJ1BQQycsIGV2ZW4gdGhvdWdoIGl0J3Mgbm90IGludHJvZHVjZWQgaW4gdGhpcyBwYXRjaC4K
PT09CiBQUEMgICAgIFBvd2VyUEMgYXJjaGl0ZWN0dXJlIGlzIGVuYWJsZWQuCj09PQoKT3RoZXIg
dGhhbiB0aGlzIG5pdCwgdGhlIG92ZXJyYWwgbG9va3MgZ29vZCB0byBtZS4KCj4gIAkJCUNNQS4g
VGhpcyByZXNlcnZhdGlvbiBpcyB1c2FibGUgYnkgdGhlIGZpcnN0IHN5c3RlbSdzCj4gIAkJCXVz
ZXJzcGFjZSBtZW1vcnkgYW5kIGtlcm5lbCBtb3ZhYmxlIGFsbG9jYXRpb25zIChtZW1vcnkKPiAg
CQkJYmFsbG9vbiwgenN3YXApLiBQYWdlcyBhbGxvY2F0ZWQgZnJvbSB0aGlzIG1lbW9yeSByYW5n
ZQouLi4uLi5zbmlwLi4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
