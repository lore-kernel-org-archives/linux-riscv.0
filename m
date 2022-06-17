Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C473BC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQpBTFCqoL8WchohFA5f0Ek/oXBEprMcW2wFR974eAM=; b=iEfWwIzVDnedDd
	BAGVcu8+3O8YZaAbq08GryLE6x+t8+C2Z6LiaHEFu2FgYHVLPAtqvI1AEUuoPfzRp5YKWhOS/d1Lz
	NKlCsnOvwPmOwoGgdAIgSnKYgvlXtQQSHv9gzUq6rlw85r52LLGcwSxptlTbhMJaxsY2iorMk7h+0
	ZHcsowT81m5gxaTCEjx8CGpC342mnejZ9A598E6Dbt/sCoj9Kg9gsVkZRBKn2n3yAb0M5RXckHdl+
	LKVBh6Qy+utvs96bOvJsHqSb+795ymNC7dbVOQdeQ7CpxsbS0cr/qRd9aZUyOd/P5Kc5BUjM188Vj
	A+Vlg1DuQvNA54P4HL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Ewb-008FQX-8X; Fri, 17 Jun 2022 16:35:37 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2EwY-008FPD-HN
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 16:35:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id cv13so2031183pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YC4lHPVY+NpHj3GKC25ozKimf28WFmpvKhW7LG+BTy8=;
        b=UsxyjyMoLjBPKYKC3U2zf532HFCp04b5+9o9WujpjaYtYQf+8vWwqXRK1bK7kGqDvk
         tgPnltWu4COg7LTZpq8kRcB8gpxorwCbp4SnSXkNWWYYbOmlrnqyD1G8ai9wvE6SiiMJ
         3P+yE/xhOgzjwkeQ/230iRZ1yEHyg0vA4BqGyaycZuxmZgvCSTKaQVMAW48Y/dvRXSQu
         ak36qYhHA5Ic+O6Lg9fjWV+mk/krYzVDdv3r1LrkSl5tONmsKxWsTGWtkjN3wvDddNT3
         HLXeW87raNT+eeZz3H4S0r6qksCmTY+KNYSaiKV2mPsxuCnRraUd/mku2blH6ekOnkMq
         MQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YC4lHPVY+NpHj3GKC25ozKimf28WFmpvKhW7LG+BTy8=;
        b=w7tL2tZKaKfOHZtGmAcsZyg0A24YSZF9FgK7S+HleEBfunC0ZLbETMDnyG7UGTcaLh
         AW9yO1GshNLJbCvJb/LcXgs3hJ2ZuQBy3pg0yk7PTXFVylcfvCYV1Oq6phwCMwkf73Id
         GACV4v9GgcKIi1Tf557e5CquBxaOGf5uQT0BadM6Jz3juzdx0yCBpJf6cZ5KnK5+haNr
         gJQU7RrHOcr7u3egZMYWfTTGtAc9zt88E8tG/BYJq7HU3sP+KY2KE7sAjGJvvj9R/l5b
         Zrz3KBvMAbnTbbvZnTbnUWCK4MWx3ihQ6Z2NrOqoBMcNVCiuKiudh94n8H5ppmGtFRbR
         AwRw==
X-Gm-Message-State: AJIora/JzBLLD4eEN5KKsqz2wG8O5Q856wu/0aKP0M/DvqYvHBVb2hyL
	bTpgIDB1AQK0dRawecjzB4jh/mB3xMoxbOfUTiTs0Q==
X-Google-Smtp-Source: AGRyM1sN0DcOFBiV+zxTkpfPAqlvlWi7aS2OR55Qj/QMUtyPp2fnRrdwjyOz3nP/haPqOGfi6GtpJrWH31oSMj7lAEs=
X-Received: by 2002:a17:90b:4382:b0:1ea:f4b6:1e29 with SMTP id
 in2-20020a17090b438200b001eaf4b61e29mr8933813pjb.159.1655483731236; Fri, 17
 Jun 2022 09:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220615211415.3111271-1-daolu@rivosinc.com> <6b52cc2c-7bc5-5015-b7a6-4c13bb4789f7@sholland.org>
In-Reply-To: <6b52cc2c-7bc5-5015-b7a6-4c13bb4789f7@sholland.org>
From: Dao Lu <daolu@rivosinc.com>
Date: Fri, 17 Jun 2022 09:35:20 -0700
Message-ID: <CAKh7v-QB4+UHjmtmBNQBojx8jB6fDT0WCvjPSPwFU0K_4wqbdg@mail.gmail.com>
Subject: Re: [PATCH v3] arch/riscv: add Zihintpause support
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Wei Fu <wefu@redhat.com>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Rob Herring <robh@kernel.org>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
	Yury Norov <yury.norov@gmail.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_093534_639681_135E2A22 
X-CRM114-Status: GOOD (  25.63  )
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

V2lsbCBsb29rIGF0IHJlYmFzaW5nIHRvIHVzZSB0aGUgdW5pZmllZCBzdGF0aWMga2V5IG1lY2hh
bmlzbSBmb3IKdGhlIG5leHQgdmVyc2lvbi4KClJlZ2FyZHMsCkRhbwoKT24gVGh1LCBKdW4gMTYs
IDIwMjIgYXQgODo0OSBQTSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4gd3Jv
dGU6Cj4KPiBPbiA2LzE1LzIyIDQ6MTQgUE0sIERhbyBMdSB3cm90ZToKPiA+IEltcGxlbWVudCBz
dXBwb3J0IGZvciB0aGUgWmlIaW50UGF1c2UgZXh0ZW5zaW9uLgo+ID4KPiA+IFRoZSBQQVVTRSBp
bnN0cnVjdGlvbiBpcyBhIEhJTlQgdGhhdCBpbmRpY2F0ZXMgdGhlIGN1cnJlbnQgaGFydOKAmXMg
cmF0ZQo+ID4gb2YgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudCBzaG91bGQgYmUgdGVtcG9yYXJpbHkg
cmVkdWNlZCBvciBwYXVzZWQuCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+Cj4gPiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRl
Y2guZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW8gTHUgPGRhb2x1QHJpdm9zaW5jLmNvbT4KPiA+
IC0tLQo+ID4KPiA+IHYxIC0+IHYyOgo+ID4gIFJlbW92ZSB0aGUgdXNhZ2Ugb2Ygc3RhdGljIGJy
YW5jaCwgdXNlIFBBVVNFIGlmIHRvb2xjaGFpbiBzdXBwb3J0cyBpdAo+ID4gdjIgLT4gdjM6Cj4g
PiAgQWRkZWQgdGhlIHN0YXRpYyBicmFuY2ggYmFjaywgY3B1X3JlbGF4KCkgYmVoYXZpb3IgaXMg
dW5jaGFuZ2VkIGlmIGVpdGhlciB0aGUKPiA+IHN5c3RlbSBvciB0aGUgdG9vbGNoYWluIGRvZXMg
bm90IHN1cHBvcnQgWmlIaW50UGF1c2UKPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmggICAgICAgICAgfCAgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNv
L3Byb2Nlc3Nvci5oIHwgMTkgKysrKysrKysrKysrKysrKy0tLQo+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdS5jICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMgICAgICAgICAgfCAgOCArKysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwg
MzAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+IGluZGV4IDM0Y2Y4YTU5
ODYxNy4uNmRkYWNjNmY0NGI5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZQo+
ID4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4gQEAgLTU2LDYgKzU2LDEwIEBAIHJpc2N2
LW1hcmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKSAgOj0gJChyaXNjdi1tYXJjaC15KWMKPiA+ICB0
b29sY2hhaW4tbmVlZC16aWNzci16aWZlbmNlaSA6PSAkKGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFy
Y2g9JChyaXNjdi1tYXJjaC15KV96aWNzcl96aWZlbmNlaSkKPiA+ICByaXNjdi1tYXJjaC0kKHRv
b2xjaGFpbi1uZWVkLXppY3NyLXppZmVuY2VpKSA6PSAkKHJpc2N2LW1hcmNoLXkpX3ppY3NyX3pp
ZmVuY2VpCj4gPgo+ID4gKyMgQ2hlY2sgaWYgdGhlIHRvb2xjaGFpbiBzdXBwb3J0cyBaaWhpbnRw
YXVzZSBleHRlbnNpb24KPiA+ICt0b29sY2hhaW4tc3VwcG9ydHMtemloaW50cGF1c2UgOj0gJChj
YWxsIGNjLW9wdGlvbi15biwgLW1hcmNoPSQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UpCj4g
PiArcmlzY3YtbWFyY2gtJCh0b29sY2hhaW4tc3VwcG9ydHMtemloaW50cGF1c2UpIDo9ICQocmlz
Y3YtbWFyY2gteSlfemloaW50cGF1c2UKPiA+ICsKPiA+ICBLQlVJTERfQ0ZMQUdTICs9IC1tYXJj
aD0kKHN1YnN0IGZkLCwkKHJpc2N2LW1hcmNoLXkpKQo+ID4gIEtCVUlMRF9BRkxBR1MgKz0gLW1h
cmNoPSQocmlzY3YtbWFyY2gteSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBpbmRl
eCA0ZTI0ODY4ODE4NDAuLmYyNGY0ZjhjOTE0NCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oCj4gPiBAQCAtNTMsNiArNTMsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBlbGZfaHdjYXA7
Cj4gPiAgZW51bSByaXNjdl9pc2FfZXh0X2lkIHsKPiA+ICAgICAgIFJJU0NWX0lTQV9FWFRfU1ND
T0ZQTUYgPSBSSVNDVl9JU0FfRVhUX0JBU0UsCj4gPiAgICAgICBSSVNDVl9JU0FfRVhUX1NWUEJN
VCwKPiA+ICsgICAgIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UsCj4gPiAgICAgICBSSVNDVl9J
U0FfRVhUX0lEX01BWCA9IFJJU0NWX0lTQV9FWFRfTUFYLAo+ID4gIH07Cj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaAo+ID4gaW5kZXggMTM0Mzg4Y2JhYWExLi4z
MTRlYzE3YzQwZDggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28v
cHJvY2Vzc29yLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNz
b3IuaAo+ID4gQEAgLTQsMTUgKzQsMjggQEAKPiA+Cj4gPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18K
PiA+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KPiA+ICAjaW5jbHVkZSA8YXNt
L2JhcnJpZXIuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4gPgo+ID4gK2V4dGVybiBz
dHJ1Y3Qgc3RhdGljX2tleV9mYWxzZSByaXNjdl9wYXVzZV9hdmFpbGFibGU7Cj4gPiAgc3RhdGlj
IGlubGluZSB2b2lkIGNwdV9yZWxheCh2b2lkKQo+ID4gIHsKPiA+ICsgICAgIGlmICghc3RhdGlj
X2JyYW5jaF9saWtlbHkoJnJpc2N2X3BhdXNlX2F2YWlsYWJsZSkpIHsKPiA+ICAjaWZkZWYgX19y
aXNjdl9tdWxkaXYKPiA+IC0gICAgIGludCBkdW1teTsKPiA+IC0gICAgIC8qIEluIGxpZXUgb2Yg
YSBoYWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBsb25nLWxhdGVuY3kgc3RhbGwuICovCj4gPiAt
ICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVt
bXkpKTsKPiA+ICsgICAgICAgICAgICAgaW50IGR1bW15Owo+ID4gKyAgICAgICAgICAgICAvKiBJ
biBsaWV1IG9mIGEgaGFsdCBpbnN0cnVjdGlvbiwgaW5kdWNlIGEgbG9uZy1sYXRlbmN5IHN0YWxs
LiAqLwo+ID4gKyAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAs
IHplcm8iIDogIj1yIiAoZHVtbXkpKTsKPiA+ICAjZW5kaWYKPiA+ICsjaWZkZWYgX19yaXNjdl96
aWhpbnRwYXVzZQo+ID4gKyAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsg
ICAgICAgICAgICAgICogUmVkdWNlIGluc3RydWN0aW9uIHJldGlyZW1lbnQuCj4gPiArICAgICAg
ICAgICAgICAqIFRoaXMgYXNzdW1lcyB0aGUgUEMgY2hhbmdlcy4KPiA+ICsgICAgICAgICAgICAg
ICovCj4gPiArICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgicGF1c2UiKTsKPiA+
ICsjZW5kaWYKPiA+ICsgICAgIH0KPiA+ICAgICAgIGJhcnJpZXIoKTsKPiA+ICB9Cj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1LmMKPiA+IGluZGV4IGZiYTllOWY0NmE4Yy4uYTEyM2U5MmIxNGRkIDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dS5jCj4gPiBAQCAtODksNiArODksNyBAQCBpbnQgcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZChzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4gPiAgc3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2Rh
dGEgaXNhX2V4dF9hcnJbXSA9IHsKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29m
cG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHN2cGJtdCwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpLAo+ID4gKyAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAo+ID4gICAg
ICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoIiIsIFJJU0NWX0lTQV9FWFRfTUFYKSwKPiA+ICB9Owo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGluZGV4IGE2ZjYyYTZkMWVkZC4uNzhjMjg0
YzQ4N2U4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IEBAIC0zMCw2ICszMCw4
IEBAIHN0YXRpYyBERUNMQVJFX0JJVE1BUChyaXNjdl9pc2EsIFJJU0NWX0lTQV9FWFRfTUFYKSBf
X3JlYWRfbW9zdGx5Owo+ID4gICNpZmRlZiBDT05GSUdfRlBVCj4gPiAgX19yb19hZnRlcl9pbml0
IERFRklORV9TVEFUSUNfS0VZX0ZBTFNFKGNwdV9od2NhcF9mcHUpOwo+ID4gICNlbmRpZgo+ID4g
K0RFRklORV9TVEFUSUNfS0VZX0ZBTFNFKHJpc2N2X3BhdXNlX2F2YWlsYWJsZSk7Cj4gPiArRVhQ
T1JUX1NZTUJPTF9HUEwocmlzY3ZfcGF1c2VfYXZhaWxhYmxlKTsKPgo+IFRoaXMgcGF0Y2ggc2hv
dWxkIHByb2JhYmx5IGJlIHJlYmFzZWQgdG8gdXNlIHRoZSB1bmlmaWVkIHN0YXRpYyBrZXkKPiBt
ZWNoYW5pc21bMV0sIHNpbmNlIHRoYXQgcGF0Y2ggaGFzIG5vdyBiZWVuIG1lcmdlZC4KPgo+IFJl
Z2FyZHMsCj4gU2FtdWVsCj4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjIwNTIyMTUzNTQzLjI2NTYtMi1qc3poYW5nQGtlcm5lbC5vcmcvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
