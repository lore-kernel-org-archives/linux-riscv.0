Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C0810A1E65
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBKMBikd/qZQdJjp+hDs1Rqd+mFMwauXwu5wa/FyvqI=; b=B9X0zCF7ZMOzRo
	kilsfgHvlil0H8soX3ct4clSknt2kCEjwBg5FmZTCth4WUudPgPNwXfhiIorxQvXLN6sdGIAz36Yx
	b1MO+aWTHQLIPE2mtFmLRNQm3hMUhSDY/w1DksaqnoNh6VeC6yWe4vsFDTj2oXFNJTb4+VfY3wDk3
	n/WThFAIxT6G0dYOnzKWGalhcCog5WdtONGC8EVT2+h/oZ+HQBqB0EEafcSpV0EvWu23lSJ9nI+Oh
	rLRU/x1v0+HqmTaDKyxS3Ra4PtnbK9UkRQ5Tlurb3T8NBfd/Mb58di4MQWtDxmumJk63aqDyotVon
	mvqOPBgcPfay/fzxqJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iLz-00000005ImS-2Qa3;
	Thu, 26 Mar 2026 10:54:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iLu-00000005Il6-2Ho6;
	Thu, 26 Mar 2026 10:54:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7625D175A;
	Thu, 26 Mar 2026 03:54:06 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E50D13FB90;
	Thu, 26 Mar 2026 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774522452; bh=8IXmdtIFEytfMHYy2/zN6eUVEhDW6CUJvZu3Mba6/Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVuxS70wtA+CNyc+9Yfuu8kLdwGx0hAOW4qIgVCCdqd3eWV81ySjZ1drGGhP2OXoL
	 +ZNCcv/2wvx0wEMhP2Dp3UCFRMfOF2SBHpPH29ZkEJibdsvI0zy0/8alDG7Ivbi7i4
	 oE7duHHNhvv6uUVGYqsXoDVURWRztrpZN8osSmlg=
Date: Thu, 26 Mar 2026 10:54:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org,
	peterz@infradead.org, pawan.kumar.gupta@linux.intel.com,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, paulmck@kernel.org,
	lirongqing@baidu.com, rppt@kernel.org, ardb@kernel.org,
	leitao@debian.org, osandov@fb.com, cfsworks@gmail.com,
	tangyouling@kylinos.cn, sourabhjain@linux.ibm.com,
	ritesh.list@gmail.com, eajames@linux.ibm.com,
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com,
	samuel.holland@sifive.com, vishal.moola@gmail.com,
	junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
	jbohac@suse.cz, fuqiang.wang@easystack.cn, guoren@kernel.org,
	chenjiahao16@huawei.com, hbathini@linux.ibm.com,
	james.morse@arm.com, takahiro.akashi@linaro.org,
	lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v10 6/8] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <acUQSSNgxCCK5LnI@arm.com>
References: <20260325025904.2811960-1-ruanjinjie@huawei.com>
 <20260325025904.2811960-7-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325025904.2811960-7-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_035414_696744_F48AF06B 
X-CRM114-Status: GOOD (  11.26  )
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

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMTA6NTk6MDJBTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
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
biA8cnVhbmppbmppZUBodWF3ZWkuY29tPgoKQWNrZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0
YWxpbi5tYXJpbmFzQGFybS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
