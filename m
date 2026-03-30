Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4A5FF4958
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 07:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvSA2Rt0tNYvcoNpfCK8p7ChGlZPxYkH0D5lXI4YhQQ=; b=QBcQe7yUAP5T/8
	GKpfRQLwXi5BugyYJVmytvuWgieKSETU6KhGEat5FGIKKeZaXPcNWNg+gvNAhOnYy+8FjMwtq/WQ4
	hnOi9+wots3FyHRbRGfqGV1CIK+UmXKnJSbpM3LAJY/Ee18m3SXh2o87froB6Rbe0kvJo2XWlNWJ3
	AxiUSEbk3DmYLwrHBDBgJ3isytdP81ov1qRJIfKdCbXOCi6sde7Z38nFDS/rXh3iSSpfDSPrY5ucc
	Y0cjSLutCptjd8G0rgRqwkLDnA9/Ux1U3yUsJjT7EVy2aycW1/a7PRzTAICuG+/bhAl+YguJmX0Sy
	JEF/h6YIbHIb2H83wkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Ny-0000000Amwr-0E6g;
	Mon, 30 Mar 2026 07:50:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Ns-0000000Amvc-1pbK
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 07:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96C79445A3
	for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 07:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716FBC4AF0F
	for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774857003;
	bh=6kNN1RP6hfrxfLPYE0OI9tP3SvLOgSwkQmqyXhzTfyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EMLHc9RRxxgF/q9IZFv1dePuIbnzTXNBuB6kVaoFukkr1ucrR8VtgGKJZxfHAPeda
	 NoOd5dNf4iw60IKhVuiihGzS20d2asneYTQFmIOPC+oibw6j5mB26gshymPA5cOnQU
	 8GwY3XAP/WUOAwUMhNJWulE7D51LKZLfsJ9jYrL2MWSm1AILniv6msGhMHwB2u72wL
	 NV3ZtFjq+6XUwCBsWxZDTcToYuFN8/MCoIOLkqqGR2/HpQGpyQ0uABqlI4zp2AJnVK
	 Rx/alDJqKvr0Bm4U2x6vI4IQVFXpJjTEyE984Dy+/l4J9Tk2CuS6GlGU6iWDdxPTfe
	 2ky4e5ATIv/aQ==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso885957f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 00:50:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrg7uYPaMGL9As0C5LUyk17sZ8nFJfUEu4pbxD0ylSxy/Iwd/fUQrDhbUSCwuZWwKR8TjvnYvrw3wBhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVXdsWfd3QB23D+8uCgDkJTO8bEKaO4psZzgxb2kXZpIR44hyq
	KBeUeqx9ULVgSgwYQjfz60V6SetYKnbqk/qYujFAfWDcezMT9X34vS4EkVjkc4IFsR6vVHMeLD3
	gE1BeaR7dODZXj0OefD6lYngZbYiWHh4=
X-Received: by 2002:a05:6000:2409:b0:43b:447a:11b8 with SMTP id
 ffacd0b85a97d-43b9e9d6050mr19116932f8f.6.1774857000398; Mon, 30 Mar 2026
 00:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260328074013.3589544-1-ruanjinjie@huawei.com>
 <20260328074013.3589544-2-ruanjinjie@huawei.com> <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
 <baa90080-9e6e-c1e5-13a1-b17496c690b4@huawei.com>
In-Reply-To: <baa90080-9e6e-c1e5-13a1-b17496c690b4@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 30 Mar 2026 15:49:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQE58ooXwyPSztDHbrxMRWCWhJNMKcRJZJsmKznBD12wA@mail.gmail.com>
X-Gm-Features: AQROBzBd-gKOewl3PX_5GW7wfDT6ZMEcMbV186WYHO9lbJECvy1QYs-DBc7P3MM
Message-ID: <CAJF2gTQE58ooXwyPSztDHbrxMRWCWhJNMKcRJZJsmKznBD12wA@mail.gmail.com>
Subject: Re: [PATCH v11 01/11] riscv: kexec_file: Fix crashk_low_res not
 exclude bug
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	peterz@infradead.org, feng.tang@linux.alibaba.com, 
	pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	rppt@kernel.org, leitao@debian.org, ardb@kernel.org, cfsworks@gmail.com, 
	osandov@fb.com, jbohac@suse.cz, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, coxu@redhat.com, fuqiang.wang@easystack.cn, 
	liaoyuanhong@vivo.com, chenjiahao16@huawei.com, hbathini@linux.ibm.com, 
	takahiro.akashi@linaro.org, james.morse@arm.com, lizhengyu3@huawei.com, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_005006_716694_0E69763C 
X-CRM114-Status: GOOD (  22.35  )
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

T24gTW9uLCBNYXIgMzAsIDIwMjYgYXQgMzoxMeKAr1BNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMjYvMy8zMCAxMTo0OSwgR3VvIFJlbiB3
cm90ZToKPiA+IE9uIFNhdCwgTWFyIDI4LCAyMDI2IGF0IDM6NDHigK9QTSBKaW5qaWUgUnVhbiA8
cnVhbmppbmppZUBodWF3ZWkuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEFzIGRvbmUgaW4gY29tbWl0
IDk0NGE0NWFiZmFiYyAoImFybTY0OiBrZHVtcDogUmVpbXBsZW1lbnQgY3Jhc2hrZXJuZWw9WCIp
Cj4gPj4gYW5kIGNvbW1pdCA0ODMxYmU3MDJiOTUgKCJhcm02NC9rZXhlYzogRml4IG1pc3Npbmcg
ZXh0cmEgcmFuZ2UgZm9yCj4gPj4gY3Jhc2hrcmVzX2xvdy4iKSBmb3IgYXJtNjQsIHdoaWxlIGlt
cGxlbWVudGluZyBjcmFzaGtlcm5lbD1YLFtoaWdoLGxvd10sCj4gPj4gcmlzY3Ygc2hvdWxkIGhh
dmUgZXhjbHVkZWQgdGhlICJjcmFzaGtfbG93X3JlcyIgcmVzZXJ2ZWQgcmFuZ2VzIGZyb20KPiA+
PiB0aGUgY3Jhc2gga2VybmVsIG1lbW9yeSB0byBwcmV2ZW50IHRoZW0gZnJvbSBiZWluZyBleHBv
cnRlZCB0aHJvdWdoCj4gPj4gL3Byb2Mvdm1jb3JlLCBhbmQgdGhlIGV4Y2x1c2lvbiB3b3VsZCBu
ZWVkIGFuIGV4dHJhIGNyYXNoX21lbSByYW5nZS4KPiA+Pgo+ID4+IENjOiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KPiA+PiBDYzogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4gPj4g
Rml4ZXM6IDU4ODJlNWFjZjE4ZCAoInJpc2N2OiBrZHVtcDogSW1wbGVtZW50IGNyYXNoa2VybmVs
PVgsW2hpZ2gsbG93XSIpCj4gPj4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5q
aWVAaHVhd2VpLmNvbT4KPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9r
ZXhlY19maWxlLmMgfCAxNCArKysrKysrKysrKy0tLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21h
Y2hpbmVfa2V4ZWNfZmlsZS5jCj4gPj4gaW5kZXggNTRlMmQ5NTUyZTkzLi4zZjc3NjYwNTdjYWMg
MTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMK
PiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+ID4+IEBA
IC02MSw3ICs2MSw3IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9lbGZfaGVhZGVycyh2b2lkICoqYWRk
ciwgdW5zaWduZWQgbG9uZyAqc3opCj4gPj4gICAgICAgICB1bnNpZ25lZCBpbnQgbnJfcmFuZ2Vz
Owo+ID4+ICAgICAgICAgaW50IHJldDsKPiA+Pgo+ID4+IC0gICAgICAgbnJfcmFuZ2VzID0gMTsg
LyogRm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KPiA+PiArICAgICAgIG5y
X3JhbmdlcyA9IDI7IC8qIEZvciBleGNsdXNpb24gb2YgY3Jhc2hrZXJuZWwgcmVnaW9uICovCj4g
Pj4gICAgICAgICB3YWxrX3N5c3RlbV9yYW1fcmVzKDAsIC0xLCAmbnJfcmFuZ2VzLCBnZXRfbnJf
cmFtX3Jhbmdlc19jYWxsYmFjayk7Cj4gPj4KPiA+PiAgICAgICAgIGNtZW0gPSBrbWFsbG9jX2Zs
ZXgoKmNtZW0sIHJhbmdlcywgbnJfcmFuZ2VzKTsKPiA+PiBAQCAtNzYsOCArNzYsMTYgQEAgc3Rh
dGljIGludCBwcmVwYXJlX2VsZl9oZWFkZXJzKHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25nICpz
eikKPiA+Pgo+ID4+ICAgICAgICAgLyogRXhjbHVkZSBjcmFzaGtlcm5lbCByZWdpb24gKi8KPiA+
PiAgICAgICAgIHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNtZW0sIGNyYXNoa19yZXMu
c3RhcnQsIGNyYXNoa19yZXMuZW5kKTsKPiA+PiAtICAgICAgIGlmICghcmV0KQo+ID4+IC0gICAg
ICAgICAgICAgICByZXQgPSBjcmFzaF9wcmVwYXJlX2VsZjY0X2hlYWRlcnMoY21lbSwgdHJ1ZSwg
YWRkciwgc3opOwo+ID4+ICsgICAgICAgaWYgKHJldCkKPiA+PiArICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gPj4gKwo+ID4+ICsgICAgICAgaWYgKGNyYXNoa19sb3dfcmVzLmVuZCkgewo+ID4+
ICsgICAgICAgICAgICAgICByZXQgPSBjcmFzaF9leGNsdWRlX21lbV9yYW5nZShjbWVtLCBjcmFz
aGtfbG93X3Jlcy5zdGFydCwgY3Jhc2hrX2xvd19yZXMuZW5kKTsKPiA+IEV4Y2x1ZGUgY3Jhc2hr
X2xvd19yZXMgaXMgcmVhc29uYWJsZSwgYnV0IGhhdmUgeW91IHRlc3RlZCB0aGlzPwo+Cj4gSnVz
dCBzaW1wbHkgdGVzdGVkIG9uIHFlbXUgd2l0aCBjcmFzaGtlcm5lbD00RyB3aXRoIGZvbGxvd2lu
ZyBrZXhlYwo+IG1lbnRpb25lZCBpbgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIz
MDcyNjE3NTAwMC4yNTM2MjIwLTEtY2hlbmppYWhhbzE2QGh1YXdlaS5jb20vLgo+IEFuZCB0aGUg
c2Vjb25kIGtlcm5lbCBjYW4gYmUgc3RhcnRlZCBub3JtYWxseS4KPgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9jaGVuamgwMDUva2V4ZWMtdG9vbHMvdHJlZS9idWlsZC10ZXN0LXJpc2N2LXYyCj4KPiAj
IGRtZXNnIHwgZ3JlcCBjcmFzaAo+IFsgICAgMC4wMDAwMDBdIGNyYXNoa2VybmVsIGxvdyBtZW1v
cnkgcmVzZXJ2ZWQ6IDB4ZjgwMDAwMDAgLSAweDEwMDAwMDAwMAo+ICgxMjggTUIpCj4gWyAgICAw
LjAwMDAwMF0gY3Jhc2hrZXJuZWwgcmVzZXJ2ZWQ6IDB4MDAwMDAwMDE3ZmUwMDAwMCAtCj4gMHgw
MDAwMDAwMjdmZTAwMDAwICg0MDk2IE1CKQpBZGRpbmcgYSB0ZXN0IGxvZyB0byB0aGUgY29tbWl0
IGxvZyBtYWtlcyB0aGUgcGF0Y2ggbW9yZSB0cnVzdHdvcnRoeS4KClJldmlld2VkLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4KPgo+Cj4gPgo+ID4+ICsgICAgICAgICAgICAgICBp
ZiAocmV0KQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4+ICsgICAg
ICAgfQo+ID4+ICsKPiA+PiArICAgICAgIHJldCA9IGNyYXNoX3ByZXBhcmVfZWxmNjRfaGVhZGVy
cyhjbWVtLCB0cnVlLCBhZGRyLCBzeik7Cj4gPj4KPiA+PiAgb3V0Ogo+ID4+ICAgICAgICAga2Zy
ZWUoY21lbSk7Cj4gPj4gLS0KPiA+PiAyLjM0LjEKPiA+Pgo+ID4KPiA+CgoKCi0tIApCZXN0IFJl
Z2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
