Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C77CFD2FD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHfa+GwW3riVY/vSUDzt1wTwQ6Zr6+hmHpD/mtu4zes=; b=vJ5YfQSRc2C1MU
	I9+8yzKynlbDxZ0IYguhoF6opBY4hJrGEeXMse1x5agnlOm2rvD25Lp4J1YDumXQX+dDBBgEviJUx
	nEHS54oAGEs3UJ7LJTf9/9dckIAbokIn8ovCCjLPcjOtKaxLIjktaGCnmF0p143KvcpbZNTAa5rBN
	PLN+zRJJAwB3H1O7AQubJHNgNOUUplMGpQ6K7iVrHZonNzEUebBX3d4Sbnb1lejRH1QrcODVP80f4
	k49Bv4itvFn2iRipgcNye8bBid+zUU7UKi5Fg/Yr1CdieQ3DtFdeVbp8/P/nIPmo+TJBRvs2xAmax
	meTSeGAoqNFVtDU93knQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBWm-0000000FlXh-1upN;
	Fri, 11 Oct 2024 09:01:40 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBWj-0000000FlWH-0suR
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 09:01:38 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-50d24099415so102770e0c.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 02:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728637295; x=1729242095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uysJ7g+c/tt2dpBPUV7oA+MLpFLA1hU06tcG89yiU7Q=;
        b=P1bTEp18rSGrHacNNY4N/QUWXmiSLmLB6O3v6SSNEA8YjtM5H91opvhV+OBexatySU
         /TFIiHoC6NKDrYgBurbPUSgtYKk70bXYIzvCQipypmTpyLA31BcXDpJGI0YFNb8WfBqX
         Lxxu9GeDh6f13burGYGuregDL569fkbHouH89vSYPOm3dG4GOlKE2pFt031MoPUHql8b
         y4HkgPshDveBsUFVEhLbGMDIJgx1mTwYPcH9XJxJoeScW1hxPnXsBXVPyEsMtTuCHPoY
         3EACBpth7TGvIxfFurDJ6v201TaqYyL1o/o5J9jr5QHN3MwI/ESa65dQS8oWMUbSbiut
         GE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728637295; x=1729242095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uysJ7g+c/tt2dpBPUV7oA+MLpFLA1hU06tcG89yiU7Q=;
        b=fsHubDSjZqC+6qpqFVGRYlunqcAz69VOKJfw5YqBKt4XQEoo2Yg3XpL8gmHRD9K+/D
         TlUMDqByABG+2NIyE9ZsFrrVUN2gpKtjp7mGHFJIVsqkCkHpoxgAZHXKXHPleXvKmbpf
         Mf73nBDVnon4cudjdvGLSZBP0fjIhzTu9BOr14EvD3YtYCOFP0ArdM2/5VfCpd/4Qzc/
         37a2HYnAHPW9GWxB7F/H5HLJSsENB0oXi9QJX0jW2LL6ta4e/vNPR2zAkcn1O5qp4Jb4
         tF0sOXb4B+PJCClJAZfGPcGygSjnhEQZWm8/jq2okMDWK6r9/jmxWUzJSa1AinVhHh43
         IqUw==
X-Forwarded-Encrypted: i=1; AJvYcCWaT+pTlbZRdQGuQ5WtreV8rrDeAe6wi6omEt1wke03JJX+idC1hpqeJuT7chmQtyHhP13pcjwIkzXQJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdVSvVGaFXt1mf4ir4ScFDimx276PhcbA/eSRugrDdJwm+e7KT
	yDGX6eLsNbxLIfeNCJcPlU58FI/9wshqb/+3uwgh8v5NiwjeKpykl0hfEY5QAVl7XYXyL+hpf0p
	1eXtMVkXArJETa6iiD9K2QWEDlOI=
X-Google-Smtp-Source: AGHT+IFBEvQhqZAmhiXkT2DRgMS3AuuEHdltOVaoqYhXUWN+hvc3GaO0nF1TMt8WnObwooqUeHJIKhvjoPeOe/Z9oKI=
X-Received: by 2002:a05:6122:c87:b0:507:81f0:f952 with SMTP id
 71dfb90a1353d-50d1f56e250mr784275e0c.9.1728637294709; Fri, 11 Oct 2024
 02:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <0923c114886cbbb322a9802543177c29cedbdbc1.1727958898.git.geert+renesas@glider.be>
 <CA+V-a8sdmGs6h6iUMozgcRG8u8o3dueqY28U37k2weDLDkBEbw@mail.gmail.com> <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
In-Reply-To: <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Oct 2024 10:01:08 +0100
Message-ID: <CA+V-a8tAmhb4fGo3xVSo5NY2KmhKL8iJkL3W8qKOcOuNmHMj+g@mail.gmail.com>
Subject: Re: [PATCH LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_020137_279270_FBE38FED 
X-CRM114-Status: GOOD (  19.42  )
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

SGkgR2VlcnQsCgpPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCA4OjI24oCvQU0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCAxMjoxOeKAr0FNIExhZCwgUHJhYmhha2FyCj4gPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDMsIDIwMjQg
YXQgMTozNuKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+ID4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPiB3cm90ZToKPiA+ID4gUlovRml2ZSBjYW5ub3QgYmUgc3VwcG9ydGVkIGJ5IHRoZSBzdGFu
ZGFyZCBSSVNDLVYgZGVmY29uZmlnIGR1ZSB0byBpdHMKPiA+ID4gZGVwZW5kZW5jeSBvbiBOT05Q
T1JUQUJMRS4gIEhlbmNlIGFkZCBhIHNlcGFyYXRlIGRlZmNvbmZpZyBmb3IgUmVuZXNhcwo+ID4g
PiBSWi9GaXZlIGJvYXJkcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+ID4gLS0tCj4gPiA+IE5vdCBpbnRl
bmRlZCBmb3IgdXBzdHJlYW0gaW50ZWdyYXRpb24uCj4gPiA+IFRvIGJlIGFwcGxpZWQgdG8gbXkg
dG9waWMvcmVuZXNhcy1kZWZjb25maWcgYnJhbmNoLCB3aGljaCBhbHJlYWR5IGhhcwo+ID4gPiBh
cmNoL2FybTY0L2NvbmZpZ3MvcmVuZXNhc19kZWZjb25maWcuCj4gPiA+Cj4gPiA+IFRlc3RlZCB3
aXRoIE9wZW5FbWJlZGRlZCBub2Rpc3Ryby4wIHNtYXJjLXJ6Zml2ZSAoZU1NQyBhbmQgbmZzcm9v
dCkuCj4gPiA+Cj4gPiA+IEFueSBvdGhlciBvcHRpb25zIHRoYXQgc2hvdWxkIGJlIGVuYWJsZWQv
ZGlzYWJsZWQ/Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvY29uZmlncy9yemZpdmVf
ZGVmY29uZmlnCj4gPiBiL2FyY2gvcmlzY3YvY29uZmlncy9yemZpdmVfZGVmY29uZmlnCj4gPiBp
bmRleCAzMTQ4M2ExZDUyMGMuLjgyNzA5ZGQ3MTJlNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvY29uZmlncy9yemZpdmVfZGVmY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L2NvbmZpZ3Mv
cnpmaXZlX2RlZmNvbmZpZwo+ID4gQEAgLTMsNiArMyw3IEBAIENPTkZJR19QT1NJWF9NUVVFVUU9
eQo+ID4gIENPTkZJR19OT19IWl9JRExFPXkKPiA+ICBDT05GSUdfSElHSF9SRVNfVElNRVJTPXkK
PiA+ICBDT05GSUdfQlBGX1NZU0NBTEw9eQo+ID4gK0NPTkZJR19QUkVFTVBUPXkKPiA+ICBDT05G
SUdfSUtDT05GSUc9eQo+ID4gIENPTkZJR19JS0NPTkZJR19QUk9DPXkKPiA+ICBDT05GSUdfQ0dS
T1VQUz15Cj4gPiBAQCAtNTcsMTEgKzU4LDcgQEAgQ09ORklHX0NBTj15Cj4gPiAgQ09ORklHX05F
VF85UD15Cj4gPiAgQ09ORklHX05FVF85UF9WSVJUSU89eQo+ID4gIENPTkZJR19QQUdFX1BPT0xf
U1RBVFM9eQo+ID4gLUNPTkZJR19QQ0k9eQo+ID4gLUNPTkZJR19QQ0lFUE9SVEJVUz15Cj4gPiAt
Q09ORklHX1BDSV9IT1NUX0dFTkVSSUM9eQo+ID4gLUNPTkZJR19QQ0lFX1hJTElOWD15Cj4gPiAt
Q09ORklHX1BDSUVfTUlDUk9DSElQX0hPU1Q9eQo+ID4gKyMgQ09ORklHX1BDSSBpcyBub3Qgc2V0
Cj4KPiBEaXNhYmxpbmcgQ09ORklHX1BDSSBleHBsaWNpdGx5IGlzIG5vdCBuZWVkZWQuCj4KT2gg
SSBtaXNzZWQgaXQuCgo+ID4gIENPTkZJR19ERVZUTVBGUz15Cj4gPiAgQ09ORklHX0RFVlRNUEZT
X01PVU5UPXkKPiA+ICBDT05GSUdfTVREPXkKPiA+IEBAIC0xMjQsNiArMTIxLDcgQEAgQ09ORklH
X01GRF9EQTkwNjI9eQo+ID4gIENPTkZJR19SWl9NVFUzPXkKPiA+ICBDT05GSUdfUkVHVUxBVE9S
PXkKPiA+ICBDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQo+ID4gK0NPTkZJR19SRUdV
TEFUT1JfR1BJTz15Cj4gPiAgQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJQ0U9eQo+ID4gIENP
TkZJR19TT1VORD15Cj4gPiAgQ09ORklHX1NORD15Cj4gPiBAQCAtMTQxLDggKzEzOSw3IEBAIENP
TkZJR19TTkRfU09DX1dNODk3OD15Cj4gPiAgQ09ORklHX1NORF9TSU1QTEVfQ0FSRD15Cj4gPiAg
Q09ORklHX1VTQj15Cj4gPiAgQ09ORklHX1VTQl9PVEc9eQo+ID4gLUNPTkZJR19VU0JfWEhDSV9I
Q0Q9eQo+ID4gLUNPTkZJR19VU0JfWEhDSV9QTEFURk9STT15Cj4gPiArIyBDT05GSUdfVVNCX1hI
Q0lfSENEIGlzIG5vdCBzZXQKPgo+IERpc2FibGluZyBDT05GSUdfVVNCX1hIQ0lfSENEIGV4cGxp
Y2l0bHkgaXMgbm90IG5lZWRlZC4KPgphaGggSSBtaXNzZWQgaXQuCgo+IERpZCB5b3UgcnVuICJt
YWtlIHNhdmVkZWZjb25maWciPwo+IFNvbWUgbW9yZSBvcHRpb25zIGRpc2FwcGVhcmVkIGFmdGVy
IGRpc2FibGluZyBQQ0kuCj4KSSBkaWRuJ3Qgc2F2ZWRlZmNvbmZpZywgdGhhbmtzIGZvciBmaXhp
bmcuCgo+ID4gIENPTkZJR19VU0JfRUhDSV9IQ0Q9eQo+ID4gIENPTkZJR19VU0JfRUhDSV9IQ0Rf
UExBVEZPUk09eQo+ID4gIENPTkZJR19VU0JfT0hDSV9IQ0Q9eQo+ID4gQEAgLTIxMCw2ICsyMDcs
NyBAQCBDT05GSUdfREVCVUdfTUVNT1JZX0lOSVQ9eQo+ID4gIENPTkZJR19TT0ZUTE9DS1VQX0RF
VEVDVE9SPXkKPiA+ICBDT05GSUdfV1FfV0FUQ0hET0c9eQo+ID4gIENPTkZJR19XUV9DUFVfSU5U
RU5TSVZFX1JFUE9SVD15Cj4gPiArIyBDT05GSUdfU0NIRURfREVCVUcgaXMgbm90IHNldAo+ID4g
IENPTkZJR19ERUJVR19USU1FS0VFUElORz15Cj4gPiAgQ09ORklHX0RFQlVHX1JUX01VVEVYRVM9
eQo+ID4gIENPTkZJR19ERUJVR19TUElOTE9DSz15Cj4gPgo+ID4gRm9yIHNvbWUgcmVhc29uIHdo
ZW4gQ09ORklHX1NDSEVEX0RFQlVHIGlzIGVuYWJsZWQsIHRoZSBVU0IgaG9zdCBvbgo+ID4gQ04x
IGlzbid0IHdvcmtpbmchCj4KPiBTdHJhbmdlLi4uCj4KSW5kZWVkLgoKQ2hlZXJzLApQcmFiaGFr
YXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
