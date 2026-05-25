Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9E5CD5BB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXlFodTgNSp0+je3HlFautWeUEKBDyVdQijjzNOEbY8=; b=NfLAsUhWHKuAJZ
	J5bjhCT3N1I7gBJH4ncQszJr7yLMN9X1a7Xtti5ULGeom4AP84WbthpMKnMvLGFNcP0TemRnM5EWl
	uGCz8ySzvrkfK1K6K3Uqj85u0hXh6iFFPlyvo4xs/62y4c1H0d7LiWhPIZR3MKiuGwKbloO7Pccxw
	JDa/hYJkZboeBIju9O1df6ZJHcqm53thwoLTu9hhYYBk81aSAoo4upwohye5PWjm4maip3moXjrld
	+Ma1DVKYXQ05wJzc+SIrj82ftNAGe6bpTk2NjBc8jCC2L1KtOKi1AELFAaaVPrn1feR3DmR981e50
	9ZuXbo2A1W4zqRhvd5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVBZ-0000000HIAZ-3zlT;
	Mon, 25 May 2026 13:17:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVBX-0000000HI9J-3whW
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 13:17:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B3F34097A
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 13:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E711F00A3D
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715055;
	bh=qV78+XoJ5yl4lw7jTkTV5DIdhzm9s8UbSBBAw5Rneo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lDqq8Fy5VgOpZtqbw/qRDQoZe5dLCTdD35zXcL6KXVaVgBelgvs1e5mG3B2iM/g58
	 NHhhq0NehUP2SQ8wGLedA3fC738TOSMGq58KGFNhlDFT2OJI4VQQ+MgxbRLzucKRok
	 la7b0f5OM0RQuLttVAEtt1bljKx4ShOtGzoGjgMQrdzgUZ1UBNN/oFNlWSVDJp+6xR
	 SLPRXxBGAbv6xSSn6BQUJDPYg8Sj5tc0bB3uNq4i66usyTJQ91Df0wiKEjxBaBDLvL
	 iCfy9ed971097MnHZoegWhOSVqQDo86W7+CPzY0MIUDhTaeeuuk0OoVqNw6P8kot97
	 OTmu273JL9Klg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6896c54a7easo2018967a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 06:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CePR/CopSE7yIoLrK4dl5xn1Xb6DA5vdCF6xtY4+JMvcqvvsPGsCn7k7KrlR/nJ6SYdZS0HVFUQWGBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjpv2e1NAPkU4ONNIrFjEjB6r9YY1KkDlk4gJjthbEBgz22KoV
	leFXbPt+RTUc5/ftpRziYV1IPHkO0PCGxvzj/LUF3hJwY4mGttxKx4hs51wSLBEaj+bCWClx368
	lY5CdeHDqAoKtbBDGw/GSxaj1qMmOmmE=
X-Received: by 2002:a17:906:5a58:b0:bd5:7c2:7622 with SMTP id
 a640c23a62f3a-bdd26fcc664mr633046266b.49.1779715053431; Mon, 25 May 2026
 06:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com> <ahQ0WRiMsB011tym@kernel.org>
In-Reply-To: <ahQ0WRiMsB011tym@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 25 May 2026 21:17:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
X-Gm-Features: AVHnY4KF6iz3ZOONNz4YfBuRaFyzFjWLq0_9v1vlnlGZ6xwTI_B6DWjmlURC67Q
Message-ID: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA reservation
To: Mike Rapoport <rppt@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, skhan@linuxfoundation.org, 
	catalin.marinas@arm.com, will@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
	rdunlap@infradead.org, pmladek@suse.com, feng.tang@linux.alibaba.com, 
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, 
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org, 
	paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org, masahiroy@kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, james.morse@arm.com, leitao@debian.org, 
	sourabhjain@linux.ibm.com, yeoreum.yun@arm.com, coxu@redhat.com, 
	jbohac@suse.cz, ryan.roberts@arm.com, cfsworks@gmail.com, 
	tangyouling@kylinos.cn, ritesh.list@gmail.com, songshuaishuai@tinylab.org, 
	junhui.liu@pigmoral.tech, vishal.moola@gmail.com, kas@kernel.org, 
	debug@rivosinc.com, namcao@linutronix.de, liaoyuanhong@vivo.com, 
	fuqiang.wang@easystack.cn, seanjc@google.com, guoren@kernel.org, 
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, bgwin@google.com, 
	takahiro.akashi@linaro.org, lizhengyu3@huawei.com, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_061736_017300_74ECEC68 
X-CRM114-Status: GOOD (  15.22  )
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgNzozN+KAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBIdWFjYWksCj4KPiBPbiBNb24sIE1heSAyNSwgMjAyNiBh
dCAwNjoxNDo1MlBNICswODAwLCBIdWFjYWkgQ2hlbiB3cm90ZToKPiA+IE9uIE1vbiwgTWF5IDI1
LCAyMDI2IGF0IDQ6NTDigK9QTSBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gSmluamllIFJ1YW4gKDE2KToKPiA+ID4gICByaXNjdjoga2V4ZWNf
ZmlsZTogRml4IGNyYXNoa19sb3dfcmVzIG5vdCBleGNsdWRlIGJ1Zwo+ID4gPiAgIHBvd2VycGMv
Y3Jhc2g6IEZpeCBwb3NzaWJsZSBtZW1vcnkgbGVhayBpbiB1cGRhdGVfY3Jhc2hfZWxmY29yZWhk
cigpCj4gPiA+ICAgYXJtNjQ6IGtleGVjOiBGaXggaW1hZ2UtPmVsZl9oZWFkZXJzIG1lbW9yeSBs
ZWFrIGR1cmluZyByZXRyeSBsb29wCj4gPiA+ICAgeDg2L2tleGVjOiBGaXggcG90ZW50aWFsIGJ1
ZmZlciBvdmVyZmxvdyBpbiBwcmVwYXJlX2VsZl9oZWFkZXJzKCkKPiA+ID4gICBhcm02NDoga2V4
ZWNfZmlsZTogRml4IHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cgaW4KPiA+ID4gICAgIHByZXBh
cmVfZWxmX2hlYWRlcnMoKQo+ID4gPiAgIHJpc2N2OiBrZXhlY19maWxlOiBGaXggcG90ZW50aWFs
IGJ1ZmZlciBvdmVyZmxvdyBpbgo+ID4gPiAgICAgcHJlcGFyZV9lbGZfaGVhZGVycygpCj4gPiA+
ICAgTG9vbmdBcmNoOiBrZXhlYzogRml4IHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cgaW4KPiA+
ID4gICAgIHByZXBhcmVfZWxmX2hlYWRlcnMoKQo+ID4gPiAgIGNyYXNoOiBBZGQgY3Jhc2hfcHJl
cGFyZV9oZWFkZXJzKCkgdG8gZXhjbHVkZSBjcmFzaCBrZXJuZWwgbWVtb3J5Cj4gPiA+ICAgYXJt
NjQ6IGtleGVjX2ZpbGU6IFVzZSBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBoZWxwZXIgdG8gc2lt
cGxpZnkgY29kZQo+ID4gPiAgIHg4Ni9rZXhlYzogVXNlIGNyYXNoX3ByZXBhcmVfaGVhZGVycygp
IGhlbHBlciB0byBzaW1wbGlmeSBjb2RlCj4gPiA+ICAgcmlzY3Y6IGtleGVjX2ZpbGU6IFVzZSBj
cmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBoZWxwZXIgdG8gc2ltcGxpZnkgY29kZQo+ID4gPiAgIExv
b25nQXJjaDoga2V4ZWM6IFVzZSBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBoZWxwZXIgdG8gc2lt
cGxpZnkgY29kZQo+ID4gPiAgIGNyYXNoOiBVc2UgY3Jhc2hfZXhjbHVkZV9jb3JlX3Jhbmdlcygp
IG9uIHBvd2VycGMKPiA+ID4gICBhcm02NDoga2V4ZWM6IEFkZCBzdXBwb3J0IGZvciBjcmFzaGtl
cm5lbCBDTUEgcmVzZXJ2YXRpb24KPiA+ID4gICByaXNjdjoga2V4ZWM6IEFkZCBzdXBwb3J0IGZv
ciBjcmFzaGtlcm5lbCBDTUEgcmVzZXJ2YXRpb24KPiA+ID4gICBhcm02NC9jcmFzaDogQWRkIGNy
YXNoIGhvdHBsdWcgc3VwcG9ydAo+ID4gSSBoYXZlIHNvbWUgYmlrZXNoZWVkaW5ncyBhYm91dCB0
aGUgc3ViamVjdHMuIENhbiB3ZSB1bmlmeSB0aGUgcHJlZml4IGZvcm1hdHM/Cj4gPiB4ODYva2V4
ZWMsIGFybTY0OiBrZXhlY19maWxlLCByaXNjdjoga2V4ZWNfZmlsZSwgTG9vbmdBcmNoOiBrZXhl
YyAuLi4uLgo+Cj4gSXQgbWlnaHQgbG9vayB3ZWlyZCBpbiB0aGUgc2VyaWVzLCBidXQgcG93ZXJw
YyBhbmQgeDg2IHVzZSAnLycgYW5kIGFybTY0IGFuZAo+IHJpc2N2IHVzZSAnOicgc28gaW4gdGhl
IGxvZ3MgaW4gYXJjaC8gdGhpcyB3b3VsZCBiZSBhY3R1YWxseSBmaW5lLgpPSywgYnV0IGF0IGxl
YXN0IHdlIGNhbiB1bmlmeSBrZXhlYyBhbmQga2V4ZWNfZmlsZS4KCkh1YWNhaQoKPgo+IFdpdGgg
dGhlIG9ubHkgZXhjZXB0aW9uIG9mIGFybTY0L2NyYXNoIHRoYXQgc2hvdWxkIGhhdmUgYmVlbiBh
cm02NDogY3Jhc2g6Cj4KPiA+IEh1YWNhaQo+Cj4gLS0KPiBTaW5jZXJlbHkgeW91cnMsCj4gTWlr
ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
