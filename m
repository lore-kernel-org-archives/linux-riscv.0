Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C35AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 02:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3125A60EBC
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 02:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3125A60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTxqS871CNfpcn8W8KOc95nkEtTyvWVgfevd6/chHlg=; b=Y1jqIGBdOzfPOl
	CACJwXdUp8i2xOmn0ehpTZp3O9de5pSpriXrO03ZK449ZURx7SVYkSPfkAM5VYegvTmxI+wv4peoD
	6XPv7y30MhigsVBQSGBY6RNu0/NTMUe3lXJS+Q+ziMxtk0XqYQwI+itKsTXG7K3yMpn4+Zm5rIOVp
	qLxkC35NhLRsSGmNdKh2O6CjM+vnhuadTHE9gJz7+lzIBzEu9rrVIxyzxpfzcN/b4mX3n49yD6vpY
	VcPqxnaFKcmS0raf282rO8vhofAA6Yz/pumGdmjHPG63rpLSh7W21Mtjc+vi/Yt9Omh4YYD1uKlUC
	qse7C5F1APIA7Kju+xIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhjDj-000Ff8-7p; Tue, 02 Nov 2021 02:08:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhjDf-000Fek-Or
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 02:08:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE9F360EE5
 for <linux-riscv@lists.infradead.org>; Tue,  2 Nov 2021 02:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635818890;
 bh=o4Y1/O2KjncLfMawRxMHVVrBmttatJPx2bTgoqvhEa8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=USyQYj8tZrbFP0RtAU7zuQ0P6HLB8dC9bpfEtHQZrECUNwO/leygblXTl183Toohd
 Sk5wH6O+zWstyvzjqTskWAyxAueOPERqG/8PGe+b4wgWvafjsJZqwkEALbig7PVwQU
 2VQ3OKB5EmUAVmFmMMZ1rEz1Lq2om3qf7+KmkyrOH9VxNGlvrhqASeeNcjgSVwjOEC
 kkWjokpgRXRyGppujlD8d4Z0IVr2DS/cI0etsUjlPm7Op6vDV+fLxv553DBFHJ4wZe
 EDUjkoKHCkh88f7xVQRGXdfYUY1sunm5oROvldF848ngkL059FBDSzq7okqg6fo4Ce
 T+65gAq2PVW6A==
Received: by mail-ua1-f50.google.com with SMTP id ay21so14750026uab.12
 for <linux-riscv@lists.infradead.org>; Mon, 01 Nov 2021 19:08:10 -0700 (PDT)
X-Gm-Message-State: AOAM532LPYlg0hytKX0G8NPk5TT2OGw43/et2bdGOziPXrlyYW12jFVq
 bQvMFU+orraUHDpyCkMde5uyJgxBWcUsaPO4le8=
X-Google-Smtp-Source: ABdhPJw+B6DnDEcgSX/gvPPBK4ZiKWQ5vR/FFezghPiwBbO0YAxFFIFTuIIkY4l0r+6LXZGZUhicdBDxGcxduaxlT6s=
X-Received: by 2002:a05:6102:510d:: with SMTP id
 bm13mr14823367vsb.28.1635818889988; 
 Mon, 01 Nov 2021 19:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
In-Reply-To: <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 2 Nov 2021 10:07:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT90V6gQw12XZEXB1TJXb5QNdXM6qcfXh1yzWzDPExgPQ@mail.gmail.com>
Message-ID: <CAJF2gTT90V6gQw12XZEXB1TJXb5QNdXM6qcfXh1yzWzDPExgPQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>, Anup Patel <Anup.Patel@wdc.com>, 
 Atish Patra <Atish.Patra@wdc.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_190811_898696_E63645B4 
X-CRM114-Status: GOOD (  35.05  )
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

T24gV2VkLCBPY3QgMjcsIDIwMjEgYXQgODoxMiBBTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFi
YmVsdEBnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgMjQgT2N0IDIwMjEgMjE6MDY6MDUg
UERUICgtMDcwMCksIHdlZnVAcmVkaGF0LmNvbSB3cm90ZToKPiA+IEZyb206IEZ1IFdlaSA8d2Vm
dUByZWRoYXQuY29tPgo+ID4KPiA+IFRoaXMgcGF0Y2ggZm9sbG93cyB0aGUgIFJJU0MtViBzdGFu
ZGFyZCBTdnBibXQgZXh0ZW5zaW9uIGluCj4gPiBwcml2aWxlZ2Ugc3BlYyB0byBzb2x2ZSB0aGUg
bm9uLWNvaGVyZW50IFNPQyBETUEgc3luY2hyb25pemF0aW9uCj4gPiBpc3N1ZXMuCj4gPgo+ID4g
VGhlIHN2cGJtdCBQVEUgZm9ybWF0Ogo+ID4gfCA2MyB8IDYyLTYxIHwgNjAtOCB8IDcgfCA2IHwg
NSB8IDQgfCAzIHwgMiB8IDEgfCAwCj4gPiAgIE4gICAgIE1UICAgICBSU1cgICAgRCAgIEEgICBH
ICAgVSAgIFggICBXICAgUiAgIFYKPiA+ICAgICAgICAgXgo+ID4KPiA+IE9mIHRoZSBSZXNlcnZl
ZCBiaXRzIFs2Mzo1NF0gaW4gYSBsZWFmIFBURSwgdGhlIGJpdHMgWzYyOjYxXSBhcmUgdXNlZCBh
cwo+ID4gdGhlIE1UIChha2EgTWVtVHlwZSkgZmllbGQuIFRoaXMgZmllbGQgc3BlY2lmaWVzIG9u
ZSBvZiB0aHJlZSBtZW1vcnkgdHlwZXMKPiA+IGFzIHNob3duIGluIHRoZSBmb2xsb3dpbmcgdGFi
bGXvvJoKPiA+IE1lbVR5cGUgICAgIFJJU0MtViBEZXNjcmlwdGlvbgo+ID4gLS0tLS0tLS0tLSAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAwMCAt
IFBNQSAgICBOb3JtYWwgQ2FjaGVhYmxlLCBObyBjaGFuZ2UgdG8gaW1wbGllZCBQTUEgbWVtb3J5
IHR5cGUKPiA+IDAxIC0gTkMgICAgIE5vbi1jYWNoZWFibGUsIGlkZW1wb3RlbnQsIHdlYWtseS1v
cmRlcmVkIE1haW4gTWVtb3J5Cj4gPiAxMCAtIElPICAgICBOb24tY2FjaGVhYmxlLCBub24taWRl
bXBvdGVudCwgc3Ryb25nbHktb3JkZXJlZCBJL08gbWVtb3J5Cj4gPiAxMSAtIFJzdmQgICBSZXNl
cnZlZCBmb3IgZnV0dXJlIHN0YW5kYXJkIHVzZQo+Cj4gRG8geW91IGhhdmUgYSBwb2ludGVyIHRv
IHRoZSBzcGVjIHRoYXQgY29udGFpbnMgdGhlc2U/ICBJJ20gc3BlY2lmaWNhbGx5Cj4gd29ycmll
ZCBhYm91dCB0aGVzZSBwYWdlLWJhc2VkIGF0dHJpYnV0ZXMgYmVpbmcgZWxpZGVkIHdoZW4gcGFn
aW5nIGlzCj4gb2ZmIChpZSwgTS1tb2RlKSwgd2hpY2ggaGFzIGNhdXNlZCBpc3N1ZXMgaW4gc3lz
dGVtcyBJJ3ZlIHdvcmtlZCB3aXRoIGluCj4gdGhlIHBhc3QuCkRvbid0IHdvcnJ5IGFib3V0IHRo
YXQsIEkndmUgY29tcGlsZWQgdGhlIExpbnV4IHdpdGggdGhlIHBhdGNoIGFuZApiZWxvdyBtb2Rp
ZmljYXRpb24gaW4gazIxMF9ub21tdV9kZWZjb25maWcuIFBhc3NlZAoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmgKYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUtYml0cy5oCmluZGV4IDNiMzhmZTE0ZjE2OS4uYjRiYjQxMzM3ZmRjIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmgKQEAgLTI1LDcgKzI1LDcgQEAKICNkZWZp
bmUgX1BBR0VfU09GVCAgICAgICgxIDw8IDgpICAgIC8qIFJlc2VydmVkIGZvciBzb2Z0d2FyZSAq
LwoKICNpZm5kZWYgX19BU1NFTUJMWV9fCi0jaWZkZWYgQ09ORklHXzY0QklUCisjaWYgZGVmaW5l
ZChDT05GSUdfNjRCSVQpICYmIGRlZmluZWQoQ09ORklHX01NVSkKIC8qCiAgKiBydjY0IFBURSBm
b3JtYXQ6CiAgKiB8IDYzIHwgNjIgNjEgfCA2MCA1NCB8IDUzICAxMCB8IDkgICAgICAgICAgICAg
OCB8IDcgfCA2IHwgNSB8IDQgfAozIHwgMiB8IDEgfCAwCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCmluZGV4IGQxOThlYWJlNTVkNC4uNTg2
MzlkZmU1OTE3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jp
c2N2L21tL2luaXQuYwpAQCAtODU2LDcgKzg1Niw3IEBAIGludCBfX21lbWluaXQgdm1lbW1hcF9w
b3B1bGF0ZSh1bnNpZ25lZCBsb25nCnN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwgaW50IG5vZGUs
CiB9CiAjZW5kaWYKCi0jaWZkZWYgQ09ORklHXzY0QklUCisjaWYgZGVmaW5lZChDT05GSUdfNjRC
SVQpICYmIGRlZmluZWQoQ09ORklHX01NVSkKIHN0cnVjdCBfX3Jpc2N2X3N2cGJtdF9zdHJ1Y3Qg
X19yaXNjdl9zdnBibXQgX19yb19hZnRlcl9pbml0OwogRVhQT1JUX1NZTUJPTChfX3Jpc2N2X3N2
cGJtdCk7CgpTbywgSSBkb24ndCB0aGluayB0aGUgcGF0Y2ggd291bGQgYWZmZWN0IE0tbW9kZSBu
b21tdSBMaW51eC4KClRvIHNlcGFyYXRlIE1NVSAmIG5vLU1NVSBjbGVhcmx5LCBJIHN1Z2dlc3Qg
ZnV3ZWkgYWRkCiNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkgJiYgZGVmaW5lZChDT05GSUdfTU1V
KQoKPiBJJ20gYXNzdW1pbmcgdGhlcmUncyBzb21ldGhpbmcgcmVsYXRlZCB0byB0aGlzIGluIHRo
ZSBzcGVjcywKPiBidXQgSSdtIHdvcnJpZWQgd2UnbGwgbmVlZCBzb21lIHNvcnQgb2YgYWNrIGZy
b20gTS1tb2RlIHRoYXQgaXQncyBiZWVuCj4gc2V0dXAgdG8gd29yayB0aGF0IHdheS4gIE9uZSBj
b3VsZCBpbWFnaW5lIGFuIE1QUlYtbGlrZSBhcHByb2FjaAo+IHdvcmtpbmcsIGJ1dCBJIGRvbid0
IHNlZSBlbm91Z2ggaW4gdGhlIG9sZCBzcGVjcyBhbmQgSSdtIGhhdmluZyB0cm91YmxlCj4gZmln
dXJpbmcgb3V0IHdoZXJlIHRoZSBjYW5vbmljYWwgdmVyc2lvbiBvZiB0aGlzIGxpdmVzLgo+Cj4g
PiBUaGUgc3RhbmRhcmQgcHJvdGVjdGlvbl9tYXBbXSBuZWVkbid0IGJlIG1vZGlmaWVkIGJlY2F1
c2UgdGhlICJQTUEiCj4gPiB0eXBlIGtlZXBzIHRoZSBoaWdoZXN0IGJpdHMgemVyby4KPiA+IEFu
ZCB0aGUgd2hvbGUgbW9kaWZpY2F0aW9uIGlzIGxpbWl0ZWQgaW4gdGhlIGFyY2gvcmlzY3YvKiBh
bmQgdXNpbmcKPiA+IGEgZ2xvYmFsIHZhcmlhYmxlKF9fcmlzY3Zfc3ZwYm10KSBhcyBfUEFHRV9E
TUFfTUFTSy9JTy9OQyBmb3IKPiA+IHBncHJvdF9ub25jYWNoZWQgKCZ3cml0ZWNvbWJpbmUpIGlu
IHBndGFibGUuaC4KPiA+IFdlIGFsc28gYWRkIF9QQUdFX0NIR19NQVNLIHRvIGZpbHRlciBQRk4g
dGhhbiBiZWZvcmUuCj4gPgo+ID4gRW5hYmxlIGl0IGluIGRldmljZXRyZWUgLSAoQWRkICJtbXUt
c3VwcG9ydHMtc3ZwYm10IiBpbiBjcHUgbm9kZSkKPiA+ICAtIG1tdS1zdXBwb3J0cy1zdnBibXQK
Pgo+IE1heWJlIHRoaXMgaXMgZW5vdWdoIG9mIGFuIGFjaywgYnV0IHdlJ2xsIG5lZWQgdG8gaGF2
ZSBzb21lIHByZXR0eQo+IHNwZWNpZmljIGRvY3VtZW50YXRpb24gaWYgdGhhdCdzIHRoZSBjYXNl
LiAgSXQncyBub3QgZGVzY3JpYmVkIHRoYXQgd2F5Cj4gaW4gdGhlIGRvY3MgcmlnaHQgbm93LCB0
aGV5IGp1c3QgdGFsayBhYm91dCBDUFUgc3VwcG9ydCAoSU1PIHdlIGNvdWxkCj4gcHJvYmUgdGhh
dCB3aXRoIGEgdHJhcCwgYnV0IEknbSBmaW5lIHdpdGggdGhlIERUIGVudHJ5IGFzIGl0J3MgYSBi
aXQKPiBzaW1wbGVyKS4KPgo+ID4gV2VpIEZ1ICgyKToKPiA+ICAgZHQtYmluZGluZ3M6IHJpc2N2
OiBhZGQgbW11LXN1cHBvcnRzLXN2cGJtdCBmb3IgU3ZwYm10Cj4gPiAgIHJpc2N2OiBhZGQgUklT
Qy1WIFN2cGJtdCBleHRlbnNpb24gc3VwcG9ydHMKPiA+Cj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvY3B1cy55YW1sICAgICAgIHwgIDUgKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9maXhtYXAuaCAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUtNjQuaCAgICAgICAgICAgfCAgOCArKy0tCj4gPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaCAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysr
KysrLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgICB8
IDM5ICsrKysrKysrKysrKysrLS0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyAgICAgICAgICAgICAgICB8IDMyICsrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvbW0v
aW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKwo+ID4gIDcgZmlsZXMgY2hh
bmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKCgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
