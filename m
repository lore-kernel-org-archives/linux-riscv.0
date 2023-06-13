Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9DCEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fwyp4rJUmxrijkv8vv0DCtrHCTJMBOZLiM97EEXvt0o=; b=TOCUalKZqjUsg0
	FcaR52pt2dUI8q44G0SLMqd9QiaZmixU1YhoVr6lZdmjwFEBBLfBNUBvS2j4w+A08XA9NcV5HdhXZ
	RKJVKfAzI2nlbt8W3hvStCe3JrESngvIGHQlyrsqjE2EO3CpoLigdnE9MmGxIapAQ5XRlM0XiLDVz
	9vL1iHMkQzIlQR/BqGYo3Z3dfXRPQn2DToYwRff1XayhxpmH54X+eZ4+1qTuLEZb9obah/PbKQZJf
	TNsIkWNNHB+xXnuNB9wSMArsIUM6yL2QQbNBAHaSWnLCpP0adWBo3xknRiim/OUMCkqkyvK5CvNFN
	mbAvHmTEFXF0Dg8VQwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q95qb-008SXT-0A;
	Tue, 13 Jun 2023 15:22:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q95qW-008SWx-2b
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 15:22:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5919463798
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 15:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8ACC4332F
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686669731;
	bh=A//ADTpJNEvj5sg5K/oNCTDrlTuwFx3q2DsloGFiOhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JhbB4c1XT5azVk1QDRETMtpcAshUJGmCBa0jLgc29MOBWoZSdAe6g/KwPt9MAeZl2
	 x2tXkatNcYYbkN8oGbfXCLejrQIR6un1w/r7YtbFTKhDiJubIL/+MMUZo+S4GkGUVB
	 dNgZLoM8cyA/ACEbVfENqpElTZ2V8kZBZyXUwlsfaQlGcCGvxQMojxOqwJGhK5cTlE
	 2sfqBtsQJ4oQDW2V6plElkq0mj2tO0QhqcxbLBqAT6tMQ7+M738X4T+2h+hcgHM7X8
	 EGWMp3nSjflU8bwiVrB7EXo1OXiFM5ewysMB2lhx7KsPbuD47R4t6NLFjJ1GThBhRL
	 73egeATN3Z5jQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51879487e18so1082201a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 08:22:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDwcQebB7Fv5ECxXH9nsmM9C454+2TW9N+w7ucY49FGMtTxMN0C2
	r9SJy3/yNuiWjFNYKGAtvoBpX9pGNlifhFHO0Jg=
X-Google-Smtp-Source: ACHHUZ6pWZ9l8QvxWkq83acuLujK7zG98RAohbsGYZcecDJOhHoddCHqgHxiXOUIlVkssS/hyomFuVwNQC+uKY09KBI=
X-Received: by 2002:aa7:c50e:0:b0:516:7f02:92c0 with SMTP id
 o14-20020aa7c50e000000b005167f0292c0mr8125021edq.39.1686669729363; Tue, 13
 Jun 2023 08:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230529084600.2878130-1-guoren@kernel.org> <20230529084600.2878130-2-guoren@kernel.org>
 <f686f36b-4c09-5099-3ba4-90f87f914654@rivosinc.com>
In-Reply-To: <f686f36b-4c09-5099-3ba4-90f87f914654@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 13 Jun 2023 23:21:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQmLvCFhFL6eaNMcz__7Rv4TBBuoDQs288RycFvjMJrjQ@mail.gmail.com>
Message-ID: <CAJF2gTQmLvCFhFL6eaNMcz__7Rv4TBBuoDQs288RycFvjMJrjQ@mail.gmail.com>
Subject: Re: [PATCH -next V12 1/3] riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, bjorn@kernel.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, andy.chiu@sifive.com, 
	paul.walmsley@sifive.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_082212_931253_FF2DB454 
X-CRM114-Status: GOOD (  26.04  )
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

T24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgOTowMeKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjkvMDUvMjAyMyAxMDo0NSwgZ3VvcmVu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPgo+ID4gQWRkIGluZGVwZW5kZW50IGlycSBzdGFja3MgZm9yIHBlcmNwdSB0byBw
cmV2ZW50IGtlcm5lbCBzdGFjayBvdmVyZmxvd3MuCj4gPiBJdCBpcyBhbHNvIGNvbXBhdGlibGUg
d2l0aCBWTUFQX1NUQUNLIGJ5IGFyY2hfYWxsb2Nfdm1hcF9zdGFjay4KPiA+Cj4gPiBUZXN0ZWQt
Ynk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
ICAgICAgICAgICAgIHwgIDcgKysrKysrCj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJx
X3N0YWNrLmggICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIHwgIDIgKysKPiA+ICAgYXJjaC9yaXNjdi9rZXJu
ZWwvaXJxLmMgICAgICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKystLQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9pcnFfc3RhY2suaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25m
aWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGZhMjU2ZjJlMjNjMS4uNDRiNGM5Njkw
Zjk0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiA+IEBAIC01ODgsNiArNTg4LDEzIEBAIGNvbmZpZyBGUFUKPiA+Cj4gPiAg
ICAgICAgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gPgo+ID4g
K2NvbmZpZyBJUlFfU1RBQ0tTCj4gPiArICAgICBib29sICJJbmRlcGVuZGVudCBpcnEgc3RhY2tz
IiBpZiBFWFBFUlQKPiA+ICsgICAgIGRlZmF1bHQgeQo+ID4gKyAgICAgc2VsZWN0IEhBVkVfSVJR
X0VYSVRfT05fSVJRX1NUQUNLCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEFkZCBpbmRlcGVu
ZGVudCBpcnEgc3RhY2tzIGZvciBwZXJjcHUgdG8gcHJldmVudCBrZXJuZWwgc3RhY2sgb3ZlcmZs
b3dzLgo+ID4gKwo+ID4gICBlbmRtZW51ICMgIlBsYXRmb3JtIHR5cGUiCj4gPgo+ID4gICBtZW51
ICJLZXJuZWwgZmVhdHVyZXMiCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9pcnFfc3RhY2suaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxX3N0YWNrLmgKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIwZGNlZTlhM2ZhMgo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFfc3Rh
Y2suaAo+ID4gQEAgLTAsMCArMSwzMiBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wICovCj4gPiArCj4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0lSUV9TVEFDS19ICj4g
PiArI2RlZmluZSBfQVNNX1JJU0NWX0lSUV9TVEFDS19ICj4gPiArCj4gPiArI2luY2x1ZGUgPGxp
bnV4L2J1Zy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9nZnAuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgva2NvbmZpZy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gPiArI2luY2x1
ZGUgPGxpbnV4L3BndGFibGUuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL3RocmVhZF9pbmZvLmg+Cj4g
PiArCj4gPiArREVDTEFSRV9QRVJfQ1BVKHVsb25nICosIGlycV9zdGFja19wdHIpOwo+ID4gKwo+
ID4gKyNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSwo+ID4gKy8qCj4gPiArICogVG8gZW5zdXJlIHRo
YXQgVk1BUCdkIHN0YWNrIG92ZXJmbG93IGRldGVjdGlvbiB3b3JrcyBjb3JyZWN0bHksIGFsbCBW
TUFQJ2QKPiA+ICsgKiBzdGFja3MgbmVlZCB0byBoYXZlIHRoZSBzYW1lIGFsaWdubWVudC4KPiA+
ICsgKi8KPiA+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgKmFyY2hfYWxsb2Nfdm1hcF9z
dGFjayhzaXplX3Qgc3RhY2tfc2l6ZSwgaW50IG5vZGUpCj4gPiArewo+ID4gKyAgICAgdm9pZCAq
cDsKPiA+ICsKPiA+ICsgICAgIEJVSUxEX0JVR19PTighSVNfRU5BQkxFRChDT05GSUdfVk1BUF9T
VEFDSykpOwo+Cj4gSGkgR3VvLAo+Cj4gU2luY2UgdGhpcyBmdW5jdGlvbiBpcyBhbHJlYWR5IGd1
YXJkZWQgd2l0aCAjaWZkZWYgQ09ORklHX1ZNQVBfU1RBQ0ssIEkKPiBndWVzcyB0aGlzIEJVSUxE
X0JVR19PTigpIGlzIHVubmVjZXNzYXJ5KS4KWWVzLCBteSBjYXJlbGVzc25lc3MuIEkgd291bGQg
cmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+Cj4gQ2zDqW1lbnQKCgoKCi0tCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
