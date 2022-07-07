Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004BCC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 05:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHELp3jWekCvUP3fdBnT9W/HwDBsBOMC5n6IVz1MC0M=; b=AVU2T9+IL2M4On
	70eAuTFSnShAFF1/kP7PBu+0r0TS3VhHPZLMGWbeT2PIdhcISWMemy0P9j0axL0NuGBwOYV4ivPDW
	QjGyc8fCBNbjaK00zHDrjgQ9rl4TXCeBZR6FUUeP/gEOOtaadj59v6yfaSL90U4NVq0tR4bbjts+l
	GrPB4fj1hSeeXK7IBMUg3CAvaguYtk7V7bCdDZxVbiP20NZsLyq/ZZo2tNDWAHqPUac39mxWuPo2s
	OJ+UnamnLV+GH65iF+1QLUCYoF2of6kv/wdP/X9rzTgipq/evZ2vsaSZXXlYsgC7ZpnvNPjm+V7Ke
	4jtzSTKyapHwi8NzQqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Jj9-00Dcuq-Ib; Thu, 07 Jul 2022 05:06:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Jj6-00Dcsi-GW
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 05:06:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A9A6621D7
	for <linux-riscv@lists.infradead.org>; Thu,  7 Jul 2022 05:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01532C385A2
	for <linux-riscv@lists.infradead.org>; Thu,  7 Jul 2022 05:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657170414;
	bh=Jp56n1Q8nuuJ/Ol2IwRkJZiElt4410mpz3pcmqKCxJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I1mHjlHJxkhERsYiWWoScAocHbegZ5nwykODXA9JF6/ezIFU8xlsxfW8wK2spOPVE
	 Vd/cNkQoBEkZl6RAs1uCG6VSH+loyFtRWxpa8Ne6rgPah7r/F3rGWV26UV1Ogqeun6
	 Qird4SyRPqwS3JrPGYcrf/1SOkOxK/RQlmHu0MZsYBLgSRbnQeRanInT6VIhbUeWx0
	 zV4YLh3MkYmijuKJLveWnY3fhCYXOGYSK3DMu9gABcAGgyfv0z2K9V2BIA78Su3iYb
	 xseBAQyxEwRJWOxAIzi+c2iDJFdE9CFFe9Wg6JxpM8aFUTu6FFATHhqF8Vd0PdPcv4
	 ZSsmiigw5/J2g==
Received: by mail-vs1-f54.google.com with SMTP id k2so7527154vsc.5
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 22:06:53 -0700 (PDT)
X-Gm-Message-State: AJIora9x4QUi+239cGYEmydX/ee7fUpfxYleuEp25QaVuWHaWxwrC97i
	GcvazW37Fbz47Tnk/Kq1WK1MLxHllG1ZY3aDP5o=
X-Google-Smtp-Source: AGRyM1sBMYmY+OGkZyWew1/NJ8m7Qs8YwqG4AF408nwDsdImXvFwJf0275nYv5IOS7xzaf2G+kyMnCcJ1FIsKk2mlbI=
X-Received: by 2002:a67:ae0e:0:b0:356:c48b:401d with SMTP id
 x14-20020a67ae0e000000b00356c48b401dmr10397967vse.51.1657170412784; Wed, 06
 Jul 2022 22:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220705224703.1571895-1-heiko@sntech.de> <20220705224703.1571895-4-heiko@sntech.de>
 <CAJF2gTT6DzPihaP+BHLM6Wvn=Hba-jb-bhs96U3+ApdSmT593g@mail.gmail.com> <3111003.5fSG56mABF@diego>
In-Reply-To: <3111003.5fSG56mABF@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 Jul 2022 13:06:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRN1J3edjbt5L9ELLtMzXKWUABQb=QxDA90uY7mj=O0rw@mail.gmail.com>
Message-ID: <CAJF2gTRN1J3edjbt5L9ELLtMzXKWUABQb=QxDA90uY7mj=O0rw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] riscv: Add support for non-coherent devices using
 zicbom extension
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, Samuel Holland <samuel@sholland.org>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, 
	Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, 
	devicetree <devicetree@vger.kernel.org>, Drew Fustini <drew@beagleboard.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_220656_663398_3A88D051 
X-CRM114-Status: GOOD (  32.60  )
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

T24gVGh1LCBKdWwgNywgMjAyMiBhdCA3OjAzIEFNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gSGkgR3VvLAo+Cj4gQW0gTWl0dHdvY2gsIDYuIEp1bGkgMjAyMiwg
MDE6MzI6MTIgQ0VTVCBzY2hyaWViIEd1byBSZW46Cj4gPiBPbiBXZWQsIEp1bCA2LCAyMDIyIGF0
IDY6NDcgQU0gSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IFRoZSBaaWNib20gSVNBLWV4dGVuc2lvbiB3YXMgcmF0aWZpZWQgaW4gbm92ZW1iZXIgMjAy
MQo+ID4gPiBhbmQgaW50cm9kdWNlcyBpbnN0cnVjdGlvbnMgZm9yIGRjYWNoZSBpbnZhbGlkYXRl
LCBjbGVhbgo+ID4gPiBhbmQgZmx1c2ggb3BlcmF0aW9ucy4KPiA+ID4KPiA+ID4gSW1wbGVtZW50
IGNhY2hlIG1hbmFnZW1lbnQgb3BlcmF0aW9ucyBmb3Igbm9uLWNvaGVyZW50IGRldmljZXMKPiA+
ID4gYmFzZWQgb24gdGhlbS4KPiA+ID4KPiA+ID4gT2YgY291cnNlIG5vdCBhbGwgY29yZXMgd2ls
bCBzdXBwb3J0IHRoaXMsIHNvIGltcGxlbWVudCBhbgo+ID4gPiBhbHRlcm5hdGl2ZS1iYXNlZCBt
ZWNoYW5pc20gdGhhdCByZXBsYWNlcyBlbXB0eSBpbnN0cnVjdGlvbnMKPiA+ID4gd2l0aCBvbmVz
IGRvbmUgYXJvdW5kIFppY2JvbSBpbnN0cnVjdGlvbnMuCj4gPiA+Cj4gPiA+IEFzIGRpc2N1c3Nl
ZCBpbiBwcmV2aW91cyB2ZXJzaW9ucywgYXNzdW1lIHRoZSBwbGF0Zm9ybQo+ID4gPiBiZWluZyBj
b2hlcmVudCBieSBkZWZhdWx0IHNvIHRoYXQgbm9uLWNvaGVyZW50IGRldmljZXMgbmVlZAo+ID4g
PiB0byBnZXQgbWFya2VkIGFjY29yZGluZ2x5IGJ5IGZpcm13YXJlLgo+ID4gPgo+ID4gPiBSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gPiA+IENjOiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+ID4gQ2M6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3
ZGMuY29tPgo+ID4gPiBDYzogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+IENjOiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlz
Y3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAzMSArKysrKysrKwo+ID4gPiAgYXJjaC9y
aXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICA0ICsKPiA+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY2FjaGUuaCAgICAgICB8ICAgNCArCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NhY2hlZmx1c2guaCAgfCAgMTAgKysrCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2VycmF0YV9saXN0LmggfCAgMTkgKysrKy0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdjYXAuaCAgICAgICB8ICAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyAg
ICAgICAgICAgICAgfCAgIDEgKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
ICAgICAgIHwgIDI0ICsrKysrKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAg
ICAgICAgIHwgICAyICsKPiA+ID4gIGFyY2gvcmlzY3YvbW0vTWFrZWZpbGUgICAgICAgICAgICAg
ICB8ICAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jICAgICAgfCAx
MTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxMSBmaWxlcyBjaGFuZ2VkLCAy
MDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiBpbmRleCAzMmZm
ZWY5ZjZlNWIuLmY3YjJiM2E0YjdmMSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29u
ZmlnCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiBAQCAtMTEzLDYgKzExMyw3
IEBAIGNvbmZpZyBSSVNDVgo+ID4gPiAgICAgICAgIHNlbGVjdCBNT0RVTEVTX1VTRV9FTEZfUkVM
QSBpZiBNT0RVTEVTCj4gPiA+ICAgICAgICAgc2VsZWN0IE1PRFVMRV9TRUNUSU9OUyBpZiBNT0RV
TEVTCj4gPiA+ICAgICAgICAgc2VsZWN0IE9GCj4gPiA+ICsgICAgICAgc2VsZWN0IE9GX0RNQV9E
RUZBVUxUX0NPSEVSRU5UCj4gPiA+ICAgICAgICAgc2VsZWN0IE9GX0VBUkxZX0ZMQVRUUkVFCj4g
PiA+ICAgICAgICAgc2VsZWN0IE9GX0lSUQo+ID4gPiAgICAgICAgIHNlbGVjdCBQQ0lfRE9NQUlO
U19HRU5FUklDIGlmIFBDSQo+ID4gPiBAQCAtMjE4LDYgKzIxOSwxNCBAQCBjb25maWcgUEdUQUJM
RV9MRVZFTFMKPiA+ID4gIGNvbmZpZyBMT0NLREVQX1NVUFBPUlQKPiA+ID4gICAgICAgICBkZWZf
Ym9vbCB5Cj4gPiA+Cj4gPiA+ICtjb25maWcgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gPiA+ICsg
ICAgICAgYm9vbAo+ID4gPiArICAgICAgIHNlbGVjdCBBUkNIX0hBU19ETUFfUFJFUF9DT0hFUkVO
VAo+ID4gPiArICAgICAgIHNlbGVjdCBBUkNIX0hBU19TWU5DX0RNQV9GT1JfREVWSUNFCj4gPiA+
ICsgICAgICAgc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFUKPiA+ID4gKyAgICAgICBz
ZWxlY3QgQVJDSF9IQVNfU0VUVVBfRE1BX09QUwo+ID4gPiArICAgICAgIHNlbGVjdCBETUFfRElS
RUNUX1JFTUFQCj4gPiA+ICsKPiA+ID4gIHNvdXJjZSAiYXJjaC9yaXNjdi9LY29uZmlnLnNvY3Mi
Cj4gPiA+ICBzb3VyY2UgImFyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGFzIgo+ID4gPgo+ID4gPiBA
QCAtMzc2LDYgKzM4NSwyOCBAQCBjb25maWcgUklTQ1ZfSVNBX1NWUEJNVAo+ID4gPgo+ID4gPiAg
ICAgICAgICAgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gPiA+
Cj4gPiA+ICtjb25maWcgQ0NfSEFTX1pJQ0JPTQo+ID4gPiArICAgICAgIGJvb2wKPiA+ID4gKyAg
ICAgICBkZWZhdWx0IHkgaWYgNjRCSVQgJiYgJChjYy1vcHRpb24sLW1hYmk9bHA2NCAtbWFyY2g9
cnY2NGltYV96aWNib20pCj4gPiA+ICsgICAgICAgZGVmYXVsdCB5IGlmIDMyQklUICYmICQoY2Mt
b3B0aW9uLC1tYWJpPWxwNjQgLW1hcmNoPXJ2MzJpbWFfemljYm9tKQo+ID4KPiA+IC1tYWJpPWxw
NjQgZm9yIHJ2MzI/Cj4KPiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoYXQhIDotKQpPa2F5LCBBZGQg
bXkgIlJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4iIGluIHlvdXIgbmV4
dCB2ZXJzaW9uLgoKPgo+IFdoZW4gSSBjb252ZXJ0ZWQgb3ZlciB0byB1c2luZyB0aGUgcmVhbCBp
bnN0cnVjdGlvbnMgZm9yIFppY2JvbSBpbnN0ZWFkIG9mCj4gcHJlLWNvZGVkIG9uZXMsIEkgdXNl
ZCBhIGRpZmZlcmVudCBmb3JtYXQgZmlyc3QgZm9yIGRldGVjdGluZyB0aGUgWmljYm9tCj4gZXhp
c3RlbmNlIGFuZCBJIGd1ZXNzIHdoZW4gbW92aW5nIG92ZXIgdG8gdGhlIGFib3ZlIEkgbWFkZSBh
IG1pc3Rha2UKPiBpbiB0aGUgY29udmVyc2lvbi4KPgo+IEluIGFueSBjYXNlLCB0aGF0IHNob3Vs
ZCBvZiBjb3Vyc2UgYmUgaWxwMzIsIHNhbWUgYXMgaW4gdGhlIE1ha2VmaWxlLgo+IFdpdGggdXBk
YXRlZCBvcGVuc2JpIGFuZCBRZW11IEkgaGF2ZSBub3cgcmUtdGVzdGVkIGFsbCBwb3NzaWJsZQo+
IGNvbWJpbmF0aW9ucyBhbmQgYW0gcHJldHR5IGhvcGVmdWxseSB0aGF0IHRoaXMgc2hvdWxkIGZp
dCBub3cuCj4KPiB2NyBmb2xsb3dpbmcgc2hvcnRseS4KPgo+IFRoYW5rcwo+IEhlaWtvCj4KPgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
