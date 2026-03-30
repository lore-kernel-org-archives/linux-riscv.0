Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E328FF493A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 03:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7C+DU3WXFFsQfjO82v299gFe4AP81c5IKe0wsEWC8jI=; b=hvqwH/2GgQuR86
	LE2ezA6Wc0IKrU0V5DpjGUhn00WiU/QbdDY5BzvAeBFTPbrFkG/Vxvp6cWE2MGB7iTRE3TgCPVgHm
	AKqOZb+ZMRE1iUwgNRRQTiCYdjC3qX4WQhSNZ7EPoSISyalmNp6TyT43T4bcFV2CTJkOVWWcW2F7w
	T/1/1pYATUIYc+3L7xBSU0tNEW9WbeL9TKDzYXgQmMxJ2lTKX6G3e2weD56E57spKrO6ZAAexEBT6
	07I0zSz1s6XIElCXvHZK9ik6YjEuTIk2VE0PGubEKxNIVXEPbnrTIVf+zNSym5O7bcipOtYvk3Dca
	G44eeO/bLOwN5TOSDV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w73dR-0000000AZUr-0aBD;
	Mon, 30 Mar 2026 03:49:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w73dO-0000000AZTs-0N8M
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 03:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E7D64449E
	for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 03:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65457C2BCB5
	for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774842589;
	bh=obCDFOyxCbjX0f8M408do6wNaHwmsZQneN83knIeC68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eoZ8B/stmhNenV55/GZwaY1J2F6+Mdl80yqD9NRcEWBOsoYl+9c7bLnMbhuDm8UCy
	 /HdFRjzUQbmAk/UyPSD+aNwyk+7+AXRsactruboxv4TBhmx7ZVUw3PnXCFXHbt/2Tv
	 8gPyg7oqfxDRPwPwOxonENTYb7rY2pfqtB3H6lN+8wTRbtHFo5byuP+ppf4WRnAd5Y
	 XciAnSMYuc3D6bWIB/pXvfsgHa26rnCnF4gtv6axbQIdyVpVlSoEdBsZ3ZtXIwQJfW
	 magEl9/ciAmyJ46LOqRQucXon3Rz5vlKU6TS+JdRCMl0FTU+kXQTbAQM34dEaStji4
	 KbhEz4mM9Fraw==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so336444f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 20:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW80gchv2GozMArQWUjcDM9bp4z+Vww2N1tRa2iON/9dXa5jI/7r7+Lo3wEVPQwQGwgTc8tVyaJcZ3iQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN0OQUQdA6k3fysgaWGDxKwFzujrp3yUo727tjpj9Nv/HqNSm1
	lQyfTMTMDUUsN9zgczHWU7RD+RO1IiOJwcYTfkyIYcIAJBUZS6ETezCpzRdXFFst7cVrt2EHfXF
	YP+GBBQF3hrT+tKWlf2kNYuX3P+xew0I=
X-Received: by 2002:a05:6000:250f:b0:43c:f4df:923c with SMTP id
 ffacd0b85a97d-43cf4dfaca4mr10913170f8f.49.1774842587366; Sun, 29 Mar 2026
 20:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260328074013.3589544-1-ruanjinjie@huawei.com> <20260328074013.3589544-2-ruanjinjie@huawei.com>
In-Reply-To: <20260328074013.3589544-2-ruanjinjie@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 30 Mar 2026 11:49:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
X-Gm-Features: AQROBzDiH9EGqvtsmkvuTI8F_a_MxhnUfiDn46oBgBr7JyKcMW8nH_9Y5zS6MkE
Message-ID: <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260329_204950_169490_B3321F6B 
X-CRM114-Status: GOOD (  17.20  )
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

T24gU2F0LCBNYXIgMjgsIDIwMjYgYXQgMzo0MeKAr1BNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gQXMgZG9uZSBpbiBjb21taXQgOTQ0YTQ1YWJmYWJjICgi
YXJtNjQ6IGtkdW1wOiBSZWltcGxlbWVudCBjcmFzaGtlcm5lbD1YIikKPiBhbmQgY29tbWl0IDQ4
MzFiZTcwMmI5NSAoImFybTY0L2tleGVjOiBGaXggbWlzc2luZyBleHRyYSByYW5nZSBmb3IKPiBj
cmFzaGtyZXNfbG93LiIpIGZvciBhcm02NCwgd2hpbGUgaW1wbGVtZW50aW5nIGNyYXNoa2VybmVs
PVgsW2hpZ2gsbG93XSwKPiByaXNjdiBzaG91bGQgaGF2ZSBleGNsdWRlZCB0aGUgImNyYXNoa19s
b3dfcmVzIiByZXNlcnZlZCByYW5nZXMgZnJvbQo+IHRoZSBjcmFzaCBrZXJuZWwgbWVtb3J5IHRv
IHByZXZlbnQgdGhlbSBmcm9tIGJlaW5nIGV4cG9ydGVkIHRocm91Z2gKPiAvcHJvYy92bWNvcmUs
IGFuZCB0aGUgZXhjbHVzaW9uIHdvdWxkIG5lZWQgYW4gZXh0cmEgY3Jhc2hfbWVtIHJhbmdlLgo+
Cj4gQ2M6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IENjOiBCYW9xdWFuIEhlIDxiaGVA
cmVkaGF0LmNvbT4KPiBGaXhlczogNTg4MmU1YWNmMThkICgicmlzY3Y6IGtkdW1wOiBJbXBsZW1l
bnQgY3Jhc2hrZXJuZWw9WCxbaGlnaCxsb3ddIikKPiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVh
biA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9tYWNo
aW5lX2tleGVjX2ZpbGUuYyB8IDE0ICsrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGlu
ZV9rZXhlY19maWxlLmMKPiBpbmRleCA1NGUyZDk1NTJlOTMuLjNmNzc2NjA1N2NhYyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jCj4gQEAgLTYxLDcgKzYxLDcgQEAg
c3RhdGljIGludCBwcmVwYXJlX2VsZl9oZWFkZXJzKHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25n
ICpzeikKPiAgICAgICAgIHVuc2lnbmVkIGludCBucl9yYW5nZXM7Cj4gICAgICAgICBpbnQgcmV0
Owo+Cj4gLSAgICAgICBucl9yYW5nZXMgPSAxOyAvKiBGb3IgZXhjbHVzaW9uIG9mIGNyYXNoa2Vy
bmVsIHJlZ2lvbiAqLwo+ICsgICAgICAgbnJfcmFuZ2VzID0gMjsgLyogRm9yIGV4Y2x1c2lvbiBv
ZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KPiAgICAgICAgIHdhbGtfc3lzdGVtX3JhbV9yZXMoMCwg
LTEsICZucl9yYW5nZXMsIGdldF9ucl9yYW1fcmFuZ2VzX2NhbGxiYWNrKTsKPgo+ICAgICAgICAg
Y21lbSA9IGttYWxsb2NfZmxleCgqY21lbSwgcmFuZ2VzLCBucl9yYW5nZXMpOwo+IEBAIC03Niw4
ICs3NiwxNiBAQCBzdGF0aWMgaW50IHByZXBhcmVfZWxmX2hlYWRlcnModm9pZCAqKmFkZHIsIHVu
c2lnbmVkIGxvbmcgKnN6KQo+Cj4gICAgICAgICAvKiBFeGNsdWRlIGNyYXNoa2VybmVsIHJlZ2lv
biAqLwo+ICAgICAgICAgcmV0ID0gY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2UoY21lbSwgY3Jhc2hr
X3Jlcy5zdGFydCwgY3Jhc2hrX3Jlcy5lbmQpOwo+IC0gICAgICAgaWYgKCFyZXQpCj4gLSAgICAg
ICAgICAgICAgIHJldCA9IGNyYXNoX3ByZXBhcmVfZWxmNjRfaGVhZGVycyhjbWVtLCB0cnVlLCBh
ZGRyLCBzeik7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsK
PiArCj4gKyAgICAgICBpZiAoY3Jhc2hrX2xvd19yZXMuZW5kKSB7Cj4gKyAgICAgICAgICAgICAg
IHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNtZW0sIGNyYXNoa19sb3dfcmVzLnN0YXJ0
LCBjcmFzaGtfbG93X3Jlcy5lbmQpOwpFeGNsdWRlIGNyYXNoa19sb3dfcmVzIGlzIHJlYXNvbmFi
bGUsIGJ1dCBoYXZlIHlvdSB0ZXN0ZWQgdGhpcz8KCj4gKyAgICAgICAgICAgICAgIGlmIChyZXQp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgcmV0ID0gY3Jhc2hfcHJlcGFyZV9lbGY2NF9oZWFkZXJzKGNtZW0sIHRydWUsIGFkZHIs
IHN6KTsKPgo+ICBvdXQ6Cj4gICAgICAgICBrZnJlZShjbWVtKTsKPiAtLQo+IDIuMzQuMQo+CgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
