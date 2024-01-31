Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCEDC47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB/n3MBQ2MdsTccyt966yaYP0Wx6eveWge4p824DHNw=; b=z555UDGN80rW+V
	oetddmhIXtxq8u2VDnZwq/2z4efmS/b6MzmFzcE9gFDX9kIerybuu6WcFsQFhxIw/NdPNttdh/H6K
	D4r/KEZcH+ZuqEqSNDsqGGrTGmzZF0ujxyTGhffhb5wNUZBRgZG56iq9G9j+xJWTvrWb/+lm2TvSh
	ezGvV7eB1MJC0Zrc3BuhhDz9RMlITmp5ikkFRXNyAR3ePu04NFAFIEwM+aoofDFhDh+GKX8l2a0Gr
	mp8b9VA4EOTlbsZ131wFittln1vugWZ6tielBVwW2KLxCD4Ggq741lMwkcMFsQeTfKY/93ITwkjQH
	uk30UTBs49QrRjR352PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD6x-00000004PTF-46jQ;
	Wed, 31 Jan 2024 16:06:51 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD6u-00000004PSE-3sL1
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 16:06:50 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7bc32b0fdadso226459239f.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 08:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706717208; x=1707322008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mOJLbseLPsvIbhLzLVD0YPyGdIC7j3P6ckn0xZuSAs=;
        b=JLJl4ztOmiV7sME0VIZ0NMFul8tKjKkImUOv3c81JGNK2D92lFagpguj9m6/SjhlZ4
         dQLM1ACMPUBEvugsA0gB4wA95KhDcoSVPzoxq4L3aah0KR6qTVVpMmzSUg6B3TT2amfb
         MDwlXPtg9SOrj0GswF4wYwrXlJR9bP4Mcyly4XG8ojXLsVtUzmwpVcdkjRGxzU1OX6wz
         wi9xMigNwLaTpB4ILDZjYBXgLfKpVapdrxt6TLkJGNe8EJ0T9385ph/rXpd1fz/Y+d6K
         zj1HnGZPsZEdiNXtQYTqS72eAgDR+bG4Zxov8QWEJDvaPEeQ3giGrcYkhAetupWo6HFw
         LcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706717208; x=1707322008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mOJLbseLPsvIbhLzLVD0YPyGdIC7j3P6ckn0xZuSAs=;
        b=JrWi3FCu6LSsbvF2Nr1SWwJ0GbMW/DnBkjxnS2Q5wj2CGtbM8zFGP2GMJ+73BmGX3x
         vFWZzic8VEUS/2jL5tH0mqvR5I6oGFuxYEEG7wCpl/0m8ZAfWEt/tdX1A5xJxmiExMyM
         9LIgzL37DgTCojyHTfDsq3b0QsN4dsQtaoRSkx/+f5Chw8xgmusqHHuzGuH+CIOhatR0
         wjpDDbgGv0AaP3skd10GwLjNje/ZvZ8sASfkpVfCC9WjcC5h9a4HhjHY0x9RAftjJOO+
         p9E5oA1YowP9EQPKqgOlM+mfieHGcrJ0ljvc+WIryAudPxirqxUsPh/IbegjZfF7473H
         ODjA==
X-Gm-Message-State: AOJu0YxO9bdOq+0CGsXPrB6/O0gsUzC39xHkqdYnE2/breYR+KIXLFdn
	9oSvG6+/llhKsOka0qErxrvgx/jGvK7YeqAs/CDrpfD7LO8vH2MbY1rF4tHSxEfJa9QMH4roAbb
	TiCrv+uBadX+3pwRN9ofm3+brIsJGQF6AcNSNFg==
X-Google-Smtp-Source: AGHT+IEl1wgTaicH/lywZEqksedrylK3qXk0XQIBiRAjl1TMWqSsoPkVo2//eTIJ77dWGhid47jFcTSpFMPuBuGRM80=
X-Received: by 2002:a6b:6513:0:b0:7c0:2579:1a2f with SMTP id
 z19-20020a6b6513000000b007c025791a2fmr1495741iob.11.1706717207711; Wed, 31
 Jan 2024 08:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20231205085959.32177-1-zong.li@sifive.com> <CANXhq0r6A48q+ehayaURLO6snDEjzVJO6Ti+1we-57i0ORT9yg@mail.gmail.com>
 <CANXhq0qqv3MBEt8zsWBT+gkdyt1PD4ZjDSrznEotdFM7M7K+yQ@mail.gmail.com>
 <CANXhq0qNA5JO1xZLbuL6ig1Ddws0m2azMwCyqLFgN3B0VZmvEw@mail.gmail.com>
 <CANXhq0o-MaEQY3m+0CNWK2Jv_pxqsjhhSJWtVR396wgKUzcbQw@mail.gmail.com> <25e2faa5-908c-4391-87db-8540d1f0e904@ghiti.fr>
In-Reply-To: <25e2faa5-908c-4391-87db-8540d1f0e904@ghiti.fr>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 1 Feb 2024 00:06:37 +0800
Message-ID: <CANXhq0qt8R2+zFx5pPiassNjb2JtGcFb5RRcdK+15PxhuSS1Ng@mail.gmail.com>
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_080649_013568_FE0A9DF6 
X-CRM114-Status: GOOD (  35.29  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgMTA6NDbigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+Cj4gSGkgWm9uZywKPgo+IE9uIDMxLzAxLzIwMjQgMTU6MjQsIFpv
bmcgTGkgd3JvdGU6Cj4gPiBPbiBUaHUsIEphbiAxOCwgMjAyNCBhdCA4OjUw4oCvQU0gWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+PiBPbiBXZWQsIEphbiAxMCwgMjAyNCBh
dCAxMTozM+KAr0FNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPj4+IE9u
IEZyaSwgRGVjIDI5LCAyMDIzIGF0IDI6MzTigK9QTSBab25nIExpIDx6b25nLmxpQHNpZml2ZS5j
b20+IHdyb3RlOgo+ID4+Pj4gT24gVHVlLCBEZWMgNSwgMjAyMyBhdCA1OjAw4oCvUE0gWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Pj4+PiBDQUxMRVJfQUREUnggcmV0dXJu
cyBjYWxsZXIncyBhZGRyZXNzIGF0IHNwZWNpZmllZCBsZXZlbCwgdGhleSBhcmUgdXNlZAo+ID4+
Pj4+IGZvciBzZXZlcmFsIHRyYWNlcnMuIFRoZXNlIG1hY3JvcyBldmVudHVhbGx5IHVzZQo+ID4+
Pj4+IF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcyhuKSB0byBnZXQgdGhlIGNhbGxlcidzIGFkZHJl
c3MgaWYgYXJjaCBkb2Vzbid0Cj4gPj4+Pj4gZGVmaW5lIHRoZWlyIG93biBpbXBsZW1lbnRhdGlv
bi4KPiA+Pj4+Pgo+ID4+Pj4+IEluIFJJU0MtViwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKG4p
IG9ubHkgd29ya3Mgd2hlbiBuID09IDAsIHdlIG5lZWQKPiA+Pj4+PiB0byB3YWxrIHRoZSBzdGFj
ayBmcmFtZSB0byBnZXQgdGhlIGNhbGxlcidzIGFkZHJlc3MgYXQgc3BlY2lmaWVkIGxldmVsLgo+
ID4+Pj4+Cj4gPj4+Pj4gZGF0YS5sZXZlbCBzdGFydGVkIGZyb20gJ2xldmVsICsgMycgZHVlIHRv
IHRoZSBjYWxsIGZsb3cgb2YgZ2V0dGluZwo+ID4+Pj4+IGNhbGxlcidzIGFkZHJlc3MgaW4gUklT
Qy1WIGltcGxlbWVudGF0aW9uLiBJZiB3ZSBkb24ndCBoYXZlIGFkZGl0aW9uYWwKPiA+Pj4+PiB0
aHJlZSBpdGVyYXRpb24sIHRoZSBsZXZlbCBpcyBjb3JyZXNwb25kaW5nIHRvIGZvbGxvd3M6Cj4g
Pj4+Pj4KPiA+Pj4+PiBjYWxsc2l0ZSAtPiByZXR1cm5fYWRkcmVzcyAtPiBhcmNoX3N0YWNrX3dh
bGsgLT4gd2Fsa19zdGFja2ZyYW1lCj4gPj4+Pj4gfCAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgIHwKPiA+Pj4+PiBsZXZlbCAzICAgICBsZXZlbCAyICAgICAg
ICAgICBsZXZlbCAxICAgICAgICAgICAgbGV2ZWwgMAo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4+Pj4+IC0tLQo+ID4+Pj4+ICAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCAgICB8ICA1ICsrKysKPiA+Pj4+PiAgIGFy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgfCAgMiArKwo+ID4+Pj4+ICAgYXJjaC9y
aXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYyB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4+Pj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspCj4gPj4+
Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3Mu
Ywo+ID4+Pj4+Cj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRy
YWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPj4+Pj4gaW5kZXggMmIy
ZjVkZjdlZjJjLi40Mjc3N2Y5MWE5YzUgMTAwNjQ0Cj4gPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZnRyYWNlLmgKPiA+Pj4+PiBAQCAtMjUsNiArMjUsMTEgQEAKPiA+Pj4+Pgo+ID4+Pj4+ICAgI2Rl
ZmluZSBBUkNIX1NVUFBPUlRTX0ZUUkFDRV9PUFMgMQo+ID4+Pj4+ICAgI2lmbmRlZiBfX0FTU0VN
QkxZX18KPiA+Pj4+PiArCj4gPj4+Pj4gK2V4dGVybiB2b2lkICpyZXR1cm5fYWRkcmVzcyh1bnNp
Z25lZCBpbnQgbGV2ZWwpOwo+ID4+Pj4+ICsKPiA+Pj4+PiArI2RlZmluZSBmdHJhY2VfcmV0dXJu
X2FkZHJlc3MobikgcmV0dXJuX2FkZHJlc3MobikKPiA+Pj4+PiArCj4gPj4+Pj4gICB2b2lkIE1D
T1VOVF9OQU1FKHZvaWQpOwo+ID4+Pj4+ICAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGZ0
cmFjZV9jYWxsX2FkanVzdCh1bnNpZ25lZCBsb25nIGFkZHIpCj4gPj4+Pj4gICB7Cj4gPj4+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvTWFrZWZpbGUKPiA+Pj4+PiBpbmRleCBmZWUyMmEzZDFiNTMuLjQwZDA1NDkzOWFlMiAxMDA2
NDQKPiA+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+ID4+Pj4+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gPj4+Pj4gQEAgLTcsNiArNyw3IEBAIGlmZGVm
IENPTkZJR19GVFJBQ0UKPiA+Pj4+PiAgIENGTEFHU19SRU1PVkVfZnRyYWNlLm8gPSAkKENDX0ZM
QUdTX0ZUUkFDRSkKPiA+Pj4+PiAgIENGTEFHU19SRU1PVkVfcGF0Y2gubyAgPSAkKENDX0ZMQUdT
X0ZUUkFDRSkKPiA+Pj4+PiAgIENGTEFHU19SRU1PVkVfc2JpLm8gICAgPSAkKENDX0ZMQUdTX0ZU
UkFDRSkKPiA+Pj4+PiArQ0ZMQUdTX1JFTU9WRV9yZXR1cm5fYWRkcmVzcy5vID0gJChDQ19GTEFH
U19GVFJBQ0UpCj4gPj4+Pj4gICBlbmRpZgo+ID4+Pj4+ICAgQ0ZMQUdTX3N5c2NhbGxfdGFibGUu
byArPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCj4gPj4+Pj4gICBDRkxB
R1NfY29tcGF0X3N5c2NhbGxfdGFibGUubyArPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJp
ZGUtaW5pdCwpCj4gPj4+Pj4gQEAgLTQ2LDYgKzQ3LDcgQEAgb2JqLXkgKz0gaXJxLm8KPiA+Pj4+
PiAgIG9iai15ICArPSBwcm9jZXNzLm8KPiA+Pj4+PiAgIG9iai15ICArPSBwdHJhY2Uubwo+ID4+
Pj4+ICAgb2JqLXkgICs9IHJlc2V0Lm8KPiA+Pj4+PiArb2JqLXkgICs9IHJldHVybl9hZGRyZXNz
Lm8KPiA+Pj4+PiAgIG9iai15ICArPSBzZXR1cC5vCj4gPj4+Pj4gICBvYmoteSAgKz0gc2lnbmFs
Lm8KPiA+Pj4+PiAgIG9iai15ICArPSBzeXNjYWxsX3RhYmxlLm8KPiA+Pj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3JldHVybl9hZGRyZXNzLmMKPiA+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+Pj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uYzIwMDhkNGFhNmU1Cj4gPj4+Pj4gLS0tIC9kZXYvbnVsbAo+ID4+
Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNzLmMKPiA+Pj4+PiBAQCAt
MCwwICsxLDQ4IEBACj4gPj4+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKPiA+Pj4+PiArLyoKPiA+Pj4+PiArICogVGhpcyBjb2RlIGNvbWUgZnJvbSBhcmNoL2Fy
bTY0L2tlcm5lbC9yZXR1cm5fYWRkcmVzcy5jCj4gPj4+Pj4gKyAqCj4gPj4+Pj4gKyAqIENvcHly
aWdodCAoQykgMjAyMyBTaUZpdmUuCj4gPj4+Pj4gKyAqLwo+ID4+Pj4+ICsKPiA+Pj4+PiArI2lu
Y2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgo+ID4+Pj4+ICsjaW5jbHVkZSA8bGludXgva3Byb2Jlcy5o
Pgo+ID4+Pj4+ICsjaW5jbHVkZSA8bGludXgvc3RhY2t0cmFjZS5oPgo+ID4+Pj4+ICsKPiA+Pj4+
PiArc3RydWN0IHJldHVybl9hZGRyZXNzX2RhdGEgewo+ID4+Pj4+ICsgICAgICAgdW5zaWduZWQg
aW50IGxldmVsOwo+ID4+Pj4+ICsgICAgICAgdm9pZCAqYWRkcjsKPiA+Pj4+PiArfTsKPiA+Pj4+
PiArCj4gPj4+Pj4gK3N0YXRpYyBib29sIHNhdmVfcmV0dXJuX2FkZHIodm9pZCAqZCwgdW5zaWdu
ZWQgbG9uZyBwYykKPiA+Pj4+PiArewo+ID4+Pj4+ICsgICAgICAgc3RydWN0IHJldHVybl9hZGRy
ZXNzX2RhdGEgKmRhdGEgPSBkOwo+ID4+Pj4+ICsKPiA+Pj4+PiArICAgICAgIGlmICghZGF0YS0+
bGV2ZWwpIHsKPiA+Pj4+PiArICAgICAgICAgICAgICAgZGF0YS0+YWRkciA9ICh2b2lkICopcGM7
Cj4gPj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Pj4+PiArICAgICAgIH0K
PiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgICAtLWRhdGEtPmxldmVsOwo+ID4+Pj4+ICsKPiA+Pj4+
PiArICAgICAgIHJldHVybiB0cnVlOwo+ID4+Pj4+ICt9Cj4gPj4+Pj4gK05PS1BST0JFX1NZTUJP
TChzYXZlX3JldHVybl9hZGRyKTsKPiA+Pj4+PiArCj4gPj4+Pj4gK3ZvaWQgKnJldHVybl9hZGRy
ZXNzKHVuc2lnbmVkIGludCBsZXZlbCkKPiA+Pj4+PiArewo+ID4+Pj4+ICsgICAgICAgc3RydWN0
IHJldHVybl9hZGRyZXNzX2RhdGEgZGF0YTsKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgICBkYXRh
LmxldmVsID0gbGV2ZWwgKyAzOwo+ID4+Pj4+ICsgICAgICAgZGF0YS5hZGRyID0gTlVMTDsKPiA+
Pj4+PiArCj4gPj4+Pj4gKyAgICAgICBhcmNoX3N0YWNrX3dhbGsoc2F2ZV9yZXR1cm5fYWRkciwg
JmRhdGEsIGN1cnJlbnQsIE5VTEwpOwo+ID4+Pj4+ICsKPiA+Pj4+PiArICAgICAgIGlmICghZGF0
YS5sZXZlbCkKPiA+Pj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIGRhdGEuYWRkcjsKPiA+Pj4+
PiArICAgICAgIGVsc2UKPiA+Pj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPj4+
Pj4gKwo+ID4+Pj4+ICt9Cj4gPj4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKHJldHVybl9hZGRyZXNz
KTsKPiA+Pj4+PiArTk9LUFJPQkVfU1lNQk9MKHJldHVybl9hZGRyZXNzKTsKPiA+Pj4+PiAtLQo+
ID4+Pj4+IDIuMTcuMQo+ID4+Pj4+Cj4gPj4+PiBIaSBQYWxtZXIgYW5kIGFsbCwKPiA+Pj4+IEkg
d2FzIHdvbmRlcmluZyB3aGV0aGVyIHRoaXMgcGF0Y2ggaXMgZ29vZCBmb3IgZXZlcnlvbmU/IFRo
YW5rcwo+ID4+PiBIaSBQYWxtZXIsCj4gPj4+IElzIHRoZXJlIGFueSBjaGFuY2UgdG8gaW5jbHVk
ZSB0aGlzIHBhdGNoIGluIDYuOC1yYzE/IFRoYW5rcwo+ID4+IEhpIFBhbG1lciwKPiA+PiBJJ20g
bm90IHN1cmUgaWYgdGhpcyBwYXRjaCBpcyBhIGZlYXR1cmUgb3IgYnVnIGZpeCwgd291bGQgeW91
IGNvbnNpZGVyCj4gPj4gaXQgZm9yIDYuOC1yY1g/IFRoYW5rcwo+ID4gSGkgUGFsbWVyLAo+ID4g
U29ycnkgZm9yIHBpbmdpbmcgeW91IGFnYWluLiBJJ20gbm90IHN1cmUgaWYgeW91IHNhdyB0aGlz
IHBhdGNoLiBUaGUKPiA+IGlycXNvZmYgYW5kIHdha2V1cCB0cmFjZXIgd2lsbCB1c2UgQ0FMTEVS
X0FERFIxIGFuZCBDQUxMRVJfQUREUjIgdG8KPiA+IG9idGFpbiB0aGUgY2FsbGVyJ3MgcmV0dXJu
IGFkZHJlc3MsIGJ1dCB3ZSBhcmUgY3VycmVudGx5IGVuY291bnRlcmluZwo+ID4gYW4gaXNzdWUg
aW4gdGhlIFJJU0MtViBwb3J0IHdoZXJlIHRoZSB3cm9uZyBjYWxsZXIgaXMgaWRlbnRpZmllZC4g
SQo+ID4gZ3Vlc3MgeW91IGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRoZSBzaXR1YXRpb24gdXNpbmcg
ZnRyYWNlLiBDb3VsZCB5b3UKPiA+IHNoYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcyB3aGVuIHlv
dSBoYXZlIHRoZSB0aW1lIHRvIHRha2UgYSBsb29rPwo+ID4gVGhhbmtzCj4KPgo+IEknbSBub3Qg
UGFsbWVyIGJ1dCBJJ2xsIHRha2UgYSBsb29rIGF0IHlvdXIgcGF0Y2ggdG9kYXkgOikKPgoKSGkg
QWxleGFuZHJlLAoKSSBhcHByZWNpYXRlIHlvdXIgYXNzaXN0YW5jZSBpbiByZXZpZXdpbmcgdGhp
cyBwYXRjaCwgVGhhbmtzIGEgbG90LiA6KQoKPiBUaGFua3MsCj4KPiBBbGV4Cj4KPgo+ID4KPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
