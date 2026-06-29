Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D940C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 11:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81bGIAh6+CtDWBkO4/Ygac1VYYZuC6tc3pShZpIQmuw=; b=FO1AOA8pBzgqxU
	Rpz/Jd9YoSNml4cUd0w75Ou5hicVs+BHm60Lvt1oGXDivmJNqSMRynz5sy2aF6ymUks/fkbKOriDd
	zaBobacgIbmbDzGRupjJl04sB2zKe8IBnuL+LDZHIiy0lUCt3FASvh67PYjtzGysllV8uFeIctAnX
	gSseZIK4eIiPvfY1upS8Pfvc5v3mS4u0ScoUQScDS95EN1ZwtynnAnIaC+URBfaDPAxYAHi+UQCqE
	YiKW+GmACCXbTxtwPaVReCuGHTQk1/LrTsI87FbEoCt3FTIrnl6Uyk3HaZnYMy5AC11CRz8oNsfjA
	71dwJrjr9BQIrv13hIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAAS-0000000ERB5-1rtM;
	Mon, 29 Jun 2026 11:28:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAAQ-0000000ERAf-1IZS
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 11:28:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAC68600C8
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 11:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636661F00A3A
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782732525;
	bh=2SGF5N2MQo78vGzqyV7/apPuXFO2rP32pwgUlpuOhCM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z+0/8IVNPNzLaX+cAHumKXyLIGetyMOrlba45W400NLvAFGsm1b4czPFceeKYdEUa
	 g8HgTaWUDgmu+CZyz3EYnoBr6ox7+YRsFbnFoiNC8XayyFYh0MRYaWjMrn6l3LeZT8
	 pKJ0WR8FO6dz/tYWm5ULT+k33cQLB7RhKgRnIXSyXT3zQ9EEmyaIaMeuCH8hyerZ4S
	 g4rRsM3VRgwuReJJdH3T8aVxHhqwOStoWfx5LYMYR1pit6hvseU0QkJaex3qBeJIPn
	 /SMntij8ibUAP9GYL5bpLF5RJkODA334aMwug2ZyKIGeZnOJRRtFLZstcI9XaBpo/b
	 ih6xxN0jsRAtA==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47362928f65so831089f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 04:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RopvzTDFgBesv2q9e+DJ52bKh6wpqzRFKw4Yl5vkGWnYbvjavCRZSJKmHjZUnUzQg2tMb33BETdUwwVcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIw0Jyg8/yJ015MmuOEAbuAZNsVz6HCV5n0jOVCYORFMUGPKo7
	/YElOX8NmSD0jZbD3PLkejXGM9OtGDKaNqEpHSPelaJnzSc8v6wKgjvKM1XYMJfyWgTWCX6GePy
	tzbJI4hml1yxf64ctW5hDwuFnwU1TUb0=
X-Received: by 2002:a05:6000:2c03:b0:464:79f0:9162 with SMTP id
 ffacd0b85a97d-474ff09dd29mr78407f8f.19.1782732523175; Mon, 29 Jun 2026
 04:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260629094746.191843-1-ruanjinjie@huawei.com> <20260629094746.191843-7-ruanjinjie@huawei.com>
In-Reply-To: <20260629094746.191843-7-ruanjinjie@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Jun 2026 19:28:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS5xMdFcuYBd2d+jvZTTSAJ_A6Eid0LqB-3WVAcT4NptA@mail.gmail.com>
X-Gm-Features: AVVi8Cfb_YoOBZUDhpGGsfHfl7o1RJdl6tur8fEdDE_oRtNsU4-e7q_E2QvES68
Message-ID: <CAJF2gTS5xMdFcuYBd2d+jvZTTSAJ_A6Eid0LqB-3WVAcT4NptA@mail.gmail.com>
Subject: Re: [PATCH v17 06/10] riscv: kexec_file: Use crash_prepare_headers()
 helper to simplify code
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, baoquan.he@linux.dev, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, elver@google.com, 
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org, 
	lirongqing@baidu.com, leitao@debian.org, kees@kernel.org, coxu@redhat.com, 
	cfsworks@gmail.com, jbohac@suse.cz, osandov@fb.com, ryan.roberts@arm.com, 
	tangyouling@kylinos.cn, sourabhjain@linux.ibm.com, ritesh.list@gmail.com, 
	gaohan@iscas.ac.cn, david@kernel.org, wangruikang@iscas.ac.cn, 
	muchun.song@linux.dev, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
	namcao@linutronix.de, rick.p.edgecombe@intel.com, djbw@kernel.org, 
	liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, vishal.l.verma@intel.com, 
	chenjiahao16@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
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

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgNTo0OOKAr1BNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gVXNlIHRoZSBuZXdseSBpbnRyb2R1Y2VkIGNyYXNoX3By
ZXBhcmVfaGVhZGVycygpIGZ1bmN0aW9uIHRvIHJlcGxhY2UKPiB0aGUgZXhpc3RpbmcgcHJlcGFy
ZV9lbGZfaGVhZGVycygpLCBhbGxvY2F0ZSBjbWVtIGFuZCBleGNsdWRlIGNyYXNoIGtlcm5lbAo+
IG1lbW9yeSBpbiB0aGUgY3Jhc2ggY29yZSwgd2hpY2ggcmVkdWNlIGNvZGUgZHVwbGljYXRpb24u
Cj4KPiBPbmx5IHRoZSBmb2xsb3dpbmcgdHdvIGFyY2hpdGVjdHVyZSBmdW5jdGlvbnMgbmVlZCB0
byBiZSBpbXBsZW1lbnRlZDoKPiAtIGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXMoKS4gQ2FsbCBn
ZXRfbnJfcmFtX3Jhbmdlc19jYWxsYmFjaygpCj4gICB0byBwcmUtY291bnRzIHRoZSBtYXggbnVt
YmVyIG9mIG1lbW9yeSByYW5nZXMuCj4KPiAtIGFyY2hfY3Jhc2hfcG9wdWxhdGVfY21lbSgpLiBV
c2UgcHJlcGFyZV9lbGY2NF9yYW1faGVhZGVyc19jYWxsYmFjaygpCj4gICB0byBjb2xsZWN0cyB0
aGUgbWVtb3J5IHJhbmdlcyBhbmQgZmlsbHMgdGhlbSBpbnRvIGNtZW0uCj4KPiBDYzogUGF1bCBX
YWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFi
YmVsdC5jb20+Cj4gQ2M6IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1Pgo+IENjOiBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+Cj4gQ2M6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgo+IFJldmlld2VkLWJ5OiBTb3VyYWJoIEphaW4gPHNvdXJhYmhqYWluQGxpbnV4Lmli
bS5jb20+Cj4gQWNrZWQtYnk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgo+IEFja2VkLWJ5
OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KPiAtLS0KPiAgYXJjaC9y
aXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgfCA0NyArKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+IGluZGV4IGZhMjk0
NmFhOWI4Zi4uMWRmYjFkOWViNjkxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL21h
Y2hpbmVfa2V4ZWNfZmlsZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhl
Y19maWxlLmMKPiBAQCAtNDUsNiArNDUsMTUgQEAgc3RhdGljIGludCBnZXRfbnJfcmFtX3Jhbmdl
c19jYWxsYmFjayhzdHJ1Y3QgcmVzb3VyY2UgKnJlcywgdm9pZCAqYXJnKQo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+ICt1bnNpZ25lZCBpbnQgYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdlcyh2
b2lkKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzID0gMjsgLyogRm9yIGV4
Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KPiArCj4gKyAgICAgICB3YWxrX3N5c3Rl
bV9yYW1fcmVzKDAsIC0xLCAmbnJfcmFuZ2VzLCBnZXRfbnJfcmFtX3Jhbmdlc19jYWxsYmFjayk7
Cj4gKwo+ICsgICAgICAgcmV0dXJuIG5yX3JhbmdlczsKPiArfQo+ICsKPiAgc3RhdGljIGludCBw
cmVwYXJlX2VsZjY0X3JhbV9oZWFkZXJzX2NhbGxiYWNrKHN0cnVjdCByZXNvdXJjZSAqcmVzLCB2
b2lkICphcmcpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBjcmFzaF9tZW0gKmNtZW0gPSBhcmc7Cj4g
QEAgLTU2LDQxICs2NSw5IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9lbGY2NF9yYW1faGVhZGVyc19j
YWxsYmFjayhzdHJ1Y3QgcmVzb3VyY2UgKnJlcywgdm9pZCAqYXJnKQo+ICAgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IHByZXBhcmVfZWxmX2hlYWRlcnModm9pZCAqKmFkZHIs
IHVuc2lnbmVkIGxvbmcgKnN6KQpJIGFncmVlIHRvIG1ha2UgYXJjaF9jcmFzaF9wb3B1bGF0ZV9j
bWVtIG1vcmUgZ2VuZXJpYywgYW5kIGxlYXZlCmFyY2hfY3Jhc2hfcG9wdWxhdGVfY21lbSAmIHBy
ZXBhcmVfZWxmNjRfcmFtX2hlYWRlcnNfY2FsbGJhY2sgaGVyZSBhcwpjYWxsYmFja3MuCgpSZXZp
ZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+ICtpbnQgYXJjaF9jcmFzaF9w
b3B1bGF0ZV9jbWVtKHN0cnVjdCBjcmFzaF9tZW0gKmNtZW0pCj4gIHsKPiAtICAgICAgIHN0cnVj
dCBjcmFzaF9tZW0gKmNtZW07Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzOwo+IC0g
ICAgICAgaW50IHJldDsKPiAtCj4gLSAgICAgICBucl9yYW5nZXMgPSAyOyAvKiBGb3IgZXhjbHVz
aW9uIG9mIGNyYXNoa2VybmVsIHJlZ2lvbiAqLwo+IC0gICAgICAgd2Fsa19zeXN0ZW1fcmFtX3Jl
cygwLCAtMSwgJm5yX3JhbmdlcywgZ2V0X25yX3JhbV9yYW5nZXNfY2FsbGJhY2spOwo+IC0KPiAt
ICAgICAgIGNtZW0gPSBrbWFsbG9jX2ZsZXgoKmNtZW0sIHJhbmdlcywgbnJfcmFuZ2VzKTsKPiAt
ICAgICAgIGlmICghY21lbSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gLQo+
IC0gICAgICAgY21lbS0+bWF4X25yX3JhbmdlcyA9IG5yX3JhbmdlczsKPiAtICAgICAgIGNtZW0t
Pm5yX3JhbmdlcyA9IDA7Cj4gLSAgICAgICByZXQgPSB3YWxrX3N5c3RlbV9yYW1fcmVzKDAsIC0x
LCBjbWVtLCBwcmVwYXJlX2VsZjY0X3JhbV9oZWFkZXJzX2NhbGxiYWNrKTsKPiAtICAgICAgIGlm
IChyZXQpCj4gLSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+IC0KPiAtICAgICAgIC8qIEV4Y2x1
ZGUgY3Jhc2hrZXJuZWwgcmVnaW9uICovCj4gLSAgICAgICByZXQgPSBjcmFzaF9leGNsdWRlX21l
bV9yYW5nZShjbWVtLCBjcmFzaGtfcmVzLnN0YXJ0LCBjcmFzaGtfcmVzLmVuZCk7Cj4gLSAgICAg
ICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICBnb3RvIG91dDsKPiAtCj4gLSAgICAgICBpZiAo
Y3Jhc2hrX2xvd19yZXMuZW5kKSB7Cj4gLSAgICAgICAgICAgICAgIHJldCA9IGNyYXNoX2V4Y2x1
ZGVfbWVtX3JhbmdlKGNtZW0sIGNyYXNoa19sb3dfcmVzLnN0YXJ0LCBjcmFzaGtfbG93X3Jlcy5l
bmQpOwo+IC0gICAgICAgICAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gb3V0Owo+IC0gICAgICAgfQo+IC0KPiAtICAgICAgIHJldCA9IGNyYXNoX3ByZXBhcmVf
ZWxmNjRfaGVhZGVycyhjbWVtLCB0cnVlLCBhZGRyLCBzeik7Cj4gLQo+IC1vdXQ6Cj4gLSAgICAg
ICBrZnJlZShjbWVtKTsKPiAtICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICByZXR1cm4gd2Fs
a19zeXN0ZW1fcmFtX3JlcygwLCAtMSwgY21lbSwgcHJlcGFyZV9lbGY2NF9yYW1faGVhZGVyc19j
YWxsYmFjayk7Cj4gIH0KPgo+ICBzdGF0aWMgY2hhciAqc2V0dXBfa2R1bXBfY21kbGluZShzdHJ1
Y3Qga2ltYWdlICppbWFnZSwgY2hhciAqY21kbGluZSwKPiBAQCAtMjgyLDcgKzI1OSw3IEBAIGlu
dCBsb2FkX2V4dHJhX3NlZ21lbnRzKHN0cnVjdCBraW1hZ2UgKmltYWdlLCB1bnNpZ25lZCBsb25n
IGtlcm5lbF9zdGFydCwKPiAgICAgICAgIGlmIChpbWFnZS0+dHlwZSA9PSBLRVhFQ19UWVBFX0NS
QVNIKSB7Cj4gICAgICAgICAgICAgICAgIHZvaWQgKmhlYWRlcnM7Cj4gICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgaGVhZGVyc19zejsKPiAtICAgICAgICAgICAgICAgcmV0ID0gcHJlcGFy
ZV9lbGZfaGVhZGVycygmaGVhZGVycywgJmhlYWRlcnNfc3opOwo+ICsgICAgICAgICAgICAgICBy
ZXQgPSBjcmFzaF9wcmVwYXJlX2hlYWRlcnModHJ1ZSwgJmhlYWRlcnMsICZoZWFkZXJzX3N6LCBO
VUxMKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHByX2VycigiUHJlcGFyaW5nIGVsZiBjb3JlIGhlYWRlciBmYWlsZWRcbiIpOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+IC0tCj4gMi4zNC4xCj4KCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
