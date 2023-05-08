Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AA8C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOgt+oa/vT0lACn8NIlwKzTzqXXp+z591CkNUgG+cG4=; b=b0msR/hZIL3ihA
	mhJ5kDmXkNvPw8Djt8a54zVoajzOPfxLqB52xmdnXxfFXMLKaiWj/M38gHy+JRx+VT3TSLPKWANcP
	i8cxI0pT6GasnLuE/xrL8kSQhVVrLgvdEOvaIstfYAxvIpdU2anrs0t/exe4mngbOvlGD5v0OuDej
	lS6IEBAfqvKJtDbtqoi/LmJGm94o3VV+XrqptvZVkcc8oBeDGKvZRsX5nNUzdmal5a0j5JtOCJZYm
	KcyhAv4tr+fdCbitZHqXxSvMhTQZ9buAL9ubZF/BY/pUeKO7hLxACtgbQ2RnmTAv0dasNGhgxM44G
	9pKDROpxwNiUBtm/x10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4km-0013sP-2A;
	Mon, 08 May 2023 17:34:28 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4kf-0013rI-0j
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 17:34:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso9117044a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1683567259; x=1686159259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0ACKyHbkTPD2yxeJB4ltSLZhmTYJ+ogPwt0nvA0/JA=;
        b=UsXO3z6T3+GWoAddjvibd65Ykan490NBq2LAUn1cOHoRrcJLoVmWV1qJHPlVfvbGWf
         xmaUeAnawFB+DBFV8UqgNkuXuxWn/M7Atu9iXvbHAH/GtNVVT8W3bj1PWFmQNHq2y3oJ
         IH+qpybYJ5jHnxyRNpSEqt7NbeMlcd8ghl6KUtFTXaCC+dPFMeclfHzXeEcGK+9xnIPa
         UAMcuzHZUbyGXMiJgtHfXblDXlK9cddv7Sqq77VZj6wrwaSDIgoZJwrBJZQ7n7T+4ABT
         RFq1vLu4HRX5qBL+bqKOgIVD2zu9m+64hqf8YT476AHQoTAumjWKViVu/6qJurugo2vi
         Fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683567259; x=1686159259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0ACKyHbkTPD2yxeJB4ltSLZhmTYJ+ogPwt0nvA0/JA=;
        b=CWGtT0rDOs+unWnK+nnV20UBJ889zrVebFDxbwbao14XKoGO0sCRez9VQuSaXLSubD
         qCy+JK9/krcGp/l9Pc9Qq4mMkFiSlJmMkc1jiRAD0v4Ap9PzMXhGgZgcDYpIHMlQm8XY
         Ne9zfzVP0ET6F1YGPJhxWUkg4QUVUb8+NjlUbLzttL258A6qPmLbIuEh9F1QOkpCFc2V
         4m9E4Yr9rppzYFb1VV/6OkuB1IUGGXyv1I0Y6A54TWFwu7U/FMAw3vtEtv6OVLmkO59v
         YVgtCeYHMat+EtfolmR/J2jxbFJV92lNVi7MO1/JQS4/BZ1U63/dP1chPK8VWVkorxEx
         bQ0w==
X-Gm-Message-State: AC+VfDymxVIOewZh5r4+TyyrgZZy1erhOnSksXTGKhR9I1CetuNCPwZT
	9Ne0kfaR5zWBB0srF/DgCXN3T/s8W4hBD5i1X5Jllg==
X-Google-Smtp-Source: ACHHUZ7Sj+FKYsLDQ+HT4UqYHWe1Nzo+KBmAhf3tyHszfqS7HJSoV5ULTPKwxW3jHadvOOCcAfm23BxLYQG+tQeoZcM=
X-Received: by 2002:a17:907:26c2:b0:8b1:3467:d71b with SMTP id
 bp2-20020a17090726c200b008b13467d71bmr9594258ejc.48.1683567258828; Mon, 08
 May 2023 10:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-4b9e3d86-2f0b-47da-8a5d-bd383a0171d6@palmer-ri-x1c9>
 <4830085.8hb0ThOEGa@diego> <CALs-HsveK-uUuSAOkUUPuUYK6_ChG95_YWtdwYvGsTfKYSWUpg@mail.gmail.com>
 <CAAeLtUDgWwT0wxhFANagBX4ExA_HkyqM-ZdPn==+_atGV3vTww@mail.gmail.com>
In-Reply-To: <CAAeLtUDgWwT0wxhFANagBX4ExA_HkyqM-ZdPn==+_atGV3vTww@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 8 May 2023 19:34:07 +0200
Message-ID: <CAAeLtUCUNV36JQNQ1REzbe8Wwk-JvEOqpOZp2udYxfNPOqq3hQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux vector
To: Evan Green <evan@rivosinc.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, bjorn@kernel.org, jrtc27@jrtc27.com, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	kito.cheng@sifive.com, Conor Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, 
	heinrich.schuchardt@canonical.com, greentime.hu@sifive.com, 
	nick.knight@sifive.com, christoph.muellner@vrull.eu, 
	Richard Henderson <richard.henderson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_103421_289201_C9AA5388 
X-CRM114-Status: GOOD (  45.40  )
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

W1Jlc2VuZCwgYXMgbXkgbWFpbCBjbGllbnQgaGFkbid0IHBpY2tlZCB1cCB0aGF0IGl0IHNob3Vs
ZCByZXNwb25kIGFzCnBsYWluLXRleHQuXQoKT24gTW9uLCA4IE1heSAyMDIzIGF0IDE5OjMyLCBQ
aGlsaXBwIFRvbXNpY2ggPHBoaWxpcHAudG9tc2ljaEB2cnVsbC5ldT4gd3JvdGU6Cj4KPiBFdmFu
LAo+Cj4gT24gTW9uLCA4IE1heSAyMDIzIGF0IDE4OjUwLCBFdmFuIEdyZWVuIDxldmFuQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFdlZCwgTWF5IDMsIDIwMjMgYXQgMzozMeKAr0FNIEhl
aWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+PiA+Cj4+ID4gSGksCj4+ID4K
Pj4gPiBBbSBEaWVuc3RhZywgMi4gTWFpIDIwMjMsIDE5OjE1OjI5IENFU1Qgc2NocmllYiBQYWxt
ZXIgRGFiYmVsdDoKPj4gPiA+IE9uIFR1ZSwgMDIgTWF5IDIwMjMgMDI6MTM6MTAgUERUICgtMDcw
MCksIHBoaWxpcHAudG9tc2ljaEB2cnVsbC5ldSB3cm90ZToKPj4gPiA+ID4gT24gVHVlLCAyIE1h
eSAyMDIzIGF0IDA5OjU4LCBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToK
Pj4gPiA+ID4+Cj4+ID4gPiA+PiBQaGlsaXBwIFRvbXNpY2ggPHBoaWxpcHAudG9tc2ljaEB2cnVs
bC5ldT4gd3JpdGVzOgo+PiA+ID4gPj4KPj4gPiA+ID4+ID4gSXQgaXMgYSBwaXR5IHRoYXQgdGhl
IGN1cnJlbnQgaW50ZXJmYWNlIHdhcyBkZXNpZ25lZCB3aXRob3V0IGludm9sdmluZwo+PiA+ID4g
Pj4gPiBSVkkgKGFuZCB0aGF0IEkgaGFkIHRvIGFzayBteSB0ZWFtIHRvIHB1dCB0b2dldGhlciBh
IHBhdGNoIHNldCBmb3IKPj4gPiA+ID4+ID4gZnVydGhlciBkaXNjdXNzaW9uLCBnaXZlbiB0aGF0
IG5vbmUgb2YgdGhlIG90aGVyIG1ham9yIHZlbmRvcnMgaW4gUlZJCj4+ID4gPiA+PiA+IHN0ZXBw
ZWQgZm9yd2FyZCkuICBJIGd1YXJhbnRlZSB0aGF0IHBsZW50eSBvZiByZXZpZXdlcnMgd291bGQg
aGF2ZQo+PiA+ID4gPj4gPiBoaWdobGlnaHRlZCB0aGF0IGEgY2VudHJhbCByZWdpc3RyeSAoZXZl
biBpZiBpdCBpcyBqdXN0IGEga2VybmVsCj4+ID4gPiA+PiA+IGhlYWRlcikgc2hvdWxkIGJlIGF2
b2lkZWQuCj4+ID4gPiA+Pgo+PiA+ID4gPj4gQXJlIHlvdSBjbGFpbWluZyB0aGF0IHRoZSBod3By
b2JlIHdvcmsgd2FzIG5vdCBkb25lIGluIHRoZSBvcGVuLCBidXQKPj4gPiA+ID4+IHNlY3JldGx5
IG1lcmdlZD8gVGhhdCBpcyBub3Qgb25seSBpbmNvcnJlY3QsIGJ1dCBydWRlIHRvIHVwc3RyZWFt
IFJJU0MtVgo+PiA+ID4gPj4gTGludXggZGV2ZWxvcGVycy4gSSBzdWdnZXN0IHlvdSByZXZpZXcg
aG93IHlvdSBpbnRlcmFjdCB3aXRoIHVwc3RyZWFtCj4+ID4gPiA+PiBrZXJuZWwgd29yay4KPj4g
PiA+ID4KPj4gPiA+ID4gUGxlYXNlIGRvbid0IHB1dCB3b3JkcyBpbnRvIG15IG1vdXRoLi4uCj4+
ID4gPiA+Cj4+ID4gPiA+IEkgd2FzIG1lcmVseSBwb2ludGluZyBvdXQgdGhhdCB0aGVyZSB3YXMg
bm8gZW5nYWdlbWVudCBieSB0aGUgUlZJCj4+ID4gPiA+IG1lbWJlciBjb21wYW5pZXMgKGluIHJl
Z2FyZCB0byB0aGlzIG1lY2hhbmlzbSkgd2l0aGluIFJWSSwgd2hpY2ggd291bGQKPj4gPiA+ID4g
aGF2ZSBwcmV2ZW50ZWQgSmVzc2ljYSdzIGlzc3VlLgo+PiA+ID4gPiBUaGlzIHdvdWxkIGhhdmUg
YWxzbyBoZWxwZWQgdG8gYWRkcmVzcyB0aGUgY29uY2VybnMgb24gdmVuZG9yLWRlZmluZWQKPj4g
PiA+ID4gZXh0ZW5zaW9ucy4KPj4gPiA+ID4KPj4gPiA+ID4gQWxzbyB3aG8gZG8geW91IHJlZmVy
IHRvIHdoZW4geW91IHNheSAiaG93IF95b3VfIGludGVyYWN0Ij8gIElmIGl0IGlzCj4+ID4gPiA+
IFJWSSB0aGF0IHlvdSByZWZlciB0bzogaXQgZG9lc24ndCBpbnRlcmFjdCB3aXRoIHVwc3RyZWFt
IHdvcmsKPj4gPiA+ID4gZGlyZWN0bHksIGFzIGl0IGRvZXNuJ3Qgb3duIGFueSBlbmdpbmVlcmlu
ZyByZXNvdXJjZXMuCj4+ID4gPiA+IFJWSSBwcm92aWRlcyBhIGZvcnVtIGZvciBtZW1iZXIgY29t
cGFuaWVzIHRvIGNvbWUgdG8gYW4KPj4gPiA+ID4gdW5kZXJzdGFuZGluZy9kZXNpZ24gYW5kIHRo
ZW4gaGF2ZSB0aGUgbWVtYmVyIGNvbXBhbmllcyBwZXJmb3JtIHRoZQo+PiA+ID4gPiB3b3JrIGFu
ZCB0YWtlIGl0IHVwc3RyZWFtLgo+PiA+ID4KPj4gPiA+IEknbSBub3QgZXZlbiBzdXJlIHdoYXQg
eW91J3JlIGxvb2tpbmcgZm9yIGhlcmU6IGlmIFJWSSBkb2Vzbid0IHdhbnQgdG8KPj4gPiA+IHdv
cmsgdXBzdHJlYW0sIHRoZW4gY29tcGxhaW5pbmcgdGhhdCBSVkkgaXNuJ3QgcGFydCBvZiB1cHN0
cmVhbQo+PiA+ID4gZGlzY3Vzc2lvbnMgaXMgcHJldHR5IHBvaW50bGVzcy4KPj4gPiA+Cj4+ID4g
PiA+PiBXaHkgZGlkbid0IFJWSSBnZXQgaW52b2x2ZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgc2Vy
aWVzPyBUaGUgZXhwZWN0YXRpb24KPj4gPiA+ID4+IGNhbm5vdCBiZSB0aGF0IGFsbCBvcGVuIHNv
dXJjZSBwcm9qZWN0cyBnbyB0byBSVkksIGJ1dCByYXRoZXIgdGhlIG90aGVyCj4+ID4gPiA+PiB3
YXkgYXJvdW5kLgo+PiA+ID4gPgo+PiA+ID4gPiBUaGF0IGlzIGV4YWN0bHkgdGhlIHBvaW50IEkg
d2FzIG1ha2luZyBhbmQgd2hpY2ggeW91IHNlZW0gdG8gbWlzczogUlZJCj4+ID4gPiA+IGRvZXMg
bm90IG93biBhbnkgZW5naW5lZXJpbmcgcmVzb3VyY2VzIGFuZCBkZXBlbmRzIHNvbGVseSBvbiBp
dHMKPj4gPiA+ID4gbWVtYmVyIGNvbXBhbmllcyB0byBwcm9qZWN0IGludG8gb3BlbiBzb3VyY2Ug
cHJvamVjdHMuCj4+ID4gPiA+Cj4+ID4gPiA+PiBUYWtlIGEgbG9vayBhdCBjb21taXQgZWEzZGU5
Y2U4YWEyICgiUklTQy1WOiBBZGQgYSBzeXNjYWxsIGZvciBIVwo+PiA+ID4gPj4gcHJvYmluZyIp
LiBZb3VyIHRlYW0gd2FzIHZlcnkgbXVjaCBpbnZvbHZlZCBpbiB0aGUgcmV2aWV3Lgo+PiA+ID4g
Pgo+PiA+ID4gPiBJIGFtIGF3YXJlLCBhcyBJIGhhZCByZXZpZXdlZCBhbmQgY29tbWVudGVkIG9u
IHRoZXNlIGFyZSB3ZWxsLgo+PiA+ID4gPiBBbmQgbXkgb25seSByZXF1ZXN0ICh3YXMgYW5kKSBp
cyB0aGF0IHdlIG5lZWQgdG8gZmlndXJlIG91dCBhIHdheSB0bwo+PiA+ID4gPiBlZmZpY2llbnRs
eSBkZWFsIHdpdGggdmVuZG9yLWRlZmluZWQgZXh0ZW5zaW9ucy4KPj4gPiA+Cj4+ID4gPiBNYXli
ZSB5b3Ugc2hvdWxkIGdvIHRhbGsgdG8geW91IHRlYW0sIHRoZW4/ICBIYW5kbGluZyB2ZW5kb3Ig
ZXh0ZW5zaW9ucwo+PiA+ID4gdmlhIGh3cHJvYmUgaGFzIGJlZW4gZGlzY3Vzc2VkLCBzb3VuZHMg
bGlrZSB5b3UncmUgY29uZnVzZWQgYWdhaW4uCj4+ID4KPj4gPiBJIHRvbyBoYXZlIHRoaXMgdmFn
dWUgbWVtb3J5IG9mIHVzIHRhbGtpbmcgYWJvdXQgdmVuZG9yIGV4dGVuc2lvbnMsCj4+ID4gYnV0
IG15IG1lbW9yeSBpcyByZWFsbHkgYmFkIGZvciBzdHVmZiBsaWtlIHRoaXMsIHNvIEkgc3BlbnQg
dGhlIG1vcm5pbmcKPj4gPiBjb21iaW5nIHRocm91Z2ggYWxsIHRoZSBod3Byb2JlIGl0ZXJhdGlv
bnMgbG9va2luZyBmb3IgaXQsIGJ1dCBzbyBmYXIKPj4gPiBoYXZlIG9ubHkgZm91bmQKPj4gPgo+
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FMcy1Ic3RvZW9UV2pURVpyTFdvdUNn
d3EwdDN0REI2dUw9dEI2OFJKRHMxdWI0RnJ3QG1haWwuZ21haWwuY29tLwo+PiA+Cj4+ID4gSSdt
IG1vc3QgbGlrZWx5IGp1c3QgYmxpbmQsIGJ1dCBkb2VzIHNvbWVvbmUgaGF2ZSBhbm90aGVyIHBv
aW50ZXI/Cj4+Cj4+IEhlbGxvISBUaGF0J3MgcHJvYmFibHkgdGhlIG9ubHkgcG9pbnRlci4KPgo+
Cj4gVGhhbmtzIGZvciBmb2xsb3dpbmcgdXAsIGFzIHdlIHdlcmUgZGViYXRpbmcgaW50ZXJuYWxs
eSBpZiBhbmQgd2hhdCBkaXNjdXNzaW9ucyB3ZSBoYWQgbWlzc2VkLgo+Cj4+Cj4+IENvdWxkbid0
IGhhbmRsaW5nIHZlbmRvciBleHRlbnNpb25zIHdpdGhpbiB0aGUgaHdwcm9iZSBmcmFtZXdvcmsg
YmUgYXMKPj4gc3RyYWlnaHRmb3J3YXJkIGFzIGV4cGxpY2l0bHkgY2FydmluZyBvdXQgYSByZWdp
b24gZm9yIHRoZW0/IFNheQo+PiAweDgwMDAwMDAwMDAwMDAwMDArIGJlbG9uZ3MgdG8gdGhlIHZl
bmRvcj8gVGhlIGxheW91dCBvZiBrZXlzIHdpdGhpbgo+PiB0aGUgdmVuZG9yIGh3cHJvYmUgcmVn
aW9uIHRoZW4gZGVwZW5kcyBvbiB0aGUgdmFsdWUgaW4gbXZlbmRvcmlkIChhbmQKPj4gaWYgdGhl
IHZlbmRvciBzbyBjaG9vc2VzLCBhcmNoaWQgYW5kIGltcGlkIGFzIHdlbGwpLiBUaGVuIHZlbmRv
cnMgY2FuCj4+IGV4cG9zZSBrZXlzIHRvIHRoZWlyIGhlYXJ0cyAoYXZvaWRpbmcgdGhlIGR1bWIg
cHVuIHRoZXJlKSBjb250ZW50Lgo+Pgo+PiBXZSBjYW4gcHJvYmFibHkgc2tpcCBjYWNoaW5nIHRo
ZSB2ZW5kb3Iga2V5cyBpbiB0aGUgdkRTTyBmb3Igbm93LiBJZgo+PiBpdCByZWFsbHkgbmVlZHMg
dG8gYmUgZG9uZSB3ZSBjYW4gYWRkIGl0IGxhdGVyLgo+Pgo+PiBUaGlzIHdvdWxkIGVuZm9yY2Ug
dGhhdCB0aGVyZSdzIG9ubHkgb25lICJ2ZW5kb3IiIGF0IGEgdGltZSBmb3IgYQo+PiBnaXZlbiBo
YXJ0LCBidXQgSSB0aGluayB0aGF0J3MgcmVhc29uYWJsZS4gTGV0IG1lIGtub3cgd2hhdCB5b3Ug
dGhpbmsuCj4KPgo+IFdlIGdlbmVyYWxseSB0cnkgdG8gdHJlYXQgdmVuZG9yLWV4dGVuc2lvbnMg
YXMgInZlbmRvci1kZWZpbmVkIiBhbmQgbm90ICJ2ZW5kb3Itc3BlY2lmaWMiLiAgSW4gb3RoZXIg
d29yZHMsIGFuIGltcGxlbWVudG9yIHdvdWxkIGJlIGZyZWUgdG8gaW1wbGVtZW50IFhWZW50YW5h
Q29uZE9wIGFuZCBYVEhlYWRWRG90LiAgV2hpbGUgd2UgY291bGQgc2ltcGx5IGFsaWFzIHRoaW5n
cyBpbnRvIHRoZSBpbXBsZW1lbnRvcidzICJ2ZW5kb3IiLXNwYWNlLCBJIHNlZSBzb21lIGJlbmVm
aXRzIHRvIGhhdmluZyBhIHVuaXF1ZSBpZCBmb3IgZXZlcnkgdmVuZG9yLWRlZmluZWQgcHJvcGVy
dHnigKYKPgo+IENvdWxkIHdlIHVzZSAoIDB4ODAwMDAwMDAwMDAwMDAwMCB8IHZlbmRvci1pZCA8
PCBWRU5ET1JfU0hJRlQgfCBrZXktaW4tdmVuZG9yLXNwYWNlICk/Cj4gSWYgc28sIGRvIHdlIGhh
dmUgdmVuZG9yLWlkcyBhbGxvY2F0ZWQgdG9kYXkgdGhhdCB3ZSBjb3VsZCB1c2UgZm9yIHRoaXMg
cHVycG9zZT8KPgo+IFRoYW5rcywKPiBQaGlsaXBwLgo+Cj4+Cj4+Cj4+IC1FdmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
