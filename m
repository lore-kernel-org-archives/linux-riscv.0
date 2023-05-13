Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC1C77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3sYUly4AUS5KVV5jfKBcdoXKLcmMQWqUF9t11+PBOA=; b=vDHuPRWPxnEzko
	+0IQKVxAKDdRfTW36KiGMRUJJXwQlaSW+D8OuPvl/+niGwdiV45JYwye7B8l+mnOftwaQf1mVqbLw
	8rqPURYceLSpUXkI3Ib+/scs4xoKECYRx0/jVpQMCrfZAgKxxICQFkn+/9eAaRpVk5P3d0oxWzo1x
	JVCAg92ptO89S9RecBm4D5SbXDqH4MLr0RVRhFhhk0Hg+DQSRa0hSEt24Cs0bWLKevUM3W7Mw99jB
	osuFNlt6yR4y6YDmUzY3u+cmuYdn1HKeZN9HmvBQnahK9UFXtn9HrOUjEeZmTUw6rX40ShR0XvAl8
	cc//+gHIqG8NpPe9I+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxjyK-00Dzpq-0l;
	Sat, 13 May 2023 07:47:20 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxjyG-00Dzp3-2F
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 07:47:18 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ba71cd7ce7fso2088976276.1
        for <linux-riscv@lists.infradead.org>; Sat, 13 May 2023 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683964034; x=1686556034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Du5txBgXPaY4l9wXwu8h1eWyOo8+VHL+14eNIwOHuZY=;
        b=eBGlGQesjhuFxczyZSm0ycELKKu8rq+6NNoDDFHIOh2XzZUhq/bo2U57GZl/9Mo5jB
         k+4EW+f3CVnagbt82WrePsBb8uZ7rtlaxmmcaXdmyJGbNrO5sHzwNQJ820FaXCPIaXXC
         l19ODE8K034wsj7SffW2Jj98ojpl51vR24z4oC64Rngy1HrjZjwb5JhphpVLPMgJdHIp
         umv+CAbiDeRhVlFRLfVt4C+UUW+ZWGIax1OsR5Nd57qQ9WvTnz3a/aG39/fm4Q4gET2+
         YWv/If8L/5flDciCiN491dqvx1PGsrLPePG+mZFej4A2/pT+SDPvKn+UVPgacSzFuRgL
         CIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683964034; x=1686556034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Du5txBgXPaY4l9wXwu8h1eWyOo8+VHL+14eNIwOHuZY=;
        b=JygdQ0QdIqJh2YGhcfkXZHDEGs51frA64l05RjLW2pWPMCkAKDlDaK4KahOJa01Hmm
         Ub8Tma6Ybyvv9GO2LmKJsGF5Dhmt3hp2/ODhKx/5W9XzKh0PJj1Cab2+mmSkgSJ/ueJx
         nCHQEo8Ztn1HD2idUDxuaSTRKZ8a9WDFNA27gkb0WiIZZ3I0EeCfeJSs+xjXZq9l27ZR
         W+hJjq2xw9Dk6dYaiS3rBiNKNiYMhmO+K1P/Sh5iyF9CIpduH0agOeeRG/ULEXZLZ4la
         lFNDy8C9NaMeuUNLCfl6c4PPhnotI924HXXwwkSuLfRm2b2n86hoUy6rqM0OaKQClc+U
         qx1w==
X-Gm-Message-State: AC+VfDy+ex5rhcWf0UxQemunXZSHevOtk543ZvNsiDzsoTKv22qKmLj+
	ghTeUhlwzWKETjmNfotmBChE1jPMqqfDwEMb0nAR3A==
X-Google-Smtp-Source: ACHHUZ7UeK9nJxVy+YqTMODqpw6+x+6wa2kJMrj461CO30wNanBeTK4N1GrGjvU9+HGi8Ij97qWdTFKPCtg+fME7BqM=
X-Received: by 2002:a05:6902:1545:b0:b96:5fd4:c967 with SMTP id
 r5-20020a056902154500b00b965fd4c967mr32885432ybu.57.1683964034429; Sat, 13
 May 2023 00:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230511-occupancy-cleat-06e532e3ea11@spud> <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
 <20230512-streak-camper-08a68afb5897@spud> <20230512-exhume-unfold-f104dd4c4cbf@spud>
In-Reply-To: <20230512-exhume-unfold-f104dd4c4cbf@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 13 May 2023 13:17:03 +0530
Message-ID: <CAK9=C2XJDDYKN_HO8Q2OShQs=crQUhx4aUi5Xx4=YiAA9OYSqQ@mail.gmail.com>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_004716_743215_2429DC3B 
X-CRM114-Status: GOOD (  30.82  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>, Greg Favor <gfavor@ventanamicro.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Waterman <andrew@sifive.com>, cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, krzysztof.kozlowski+dt@linaro.org, atishp@atishpatra.org, Krste Asanovic <krste@sifive.com>, linux-riscv@lists.infradead.org, Mark Himelstein <markhimelstein@riscv.org>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBNYXkgMTMsIDIwMjMgYXQgMzozNeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiArQ0MgR3JlZywgTWFyaywgS3JzdGUsIFBoaWxpcHAsIEFuZHJl
dywKPgo+ICh0aGlzIGlzIExLTUwgbm93LCBubyB0b3AgcG9zdGluZyBvciBodG1sIHJlcGxpZXMp
Cj4KPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAwODo0MDoxMFBNICswMTAwLCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAxMTowMTowOUFNIC0wNzAwLCBQ
YWxtZXIgRGFiYmVsdCB3cm90ZToKPiA+ID4gT24gVGh1LCAxMSBNYXkgMjAyMyAxNTozODoxMCBQ
RFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgTWF5IDExLCAy
MDIzIGF0IDAzOjM0OjI0UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+ID4gT24g
VGh1LCBNYXkgMTEsIDIwMjMgYXQgMjo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDAyOjI3OjQ0
UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYXQncyBt
b3JlIHRoYW4gbGFzdCB5ZWFyIGF0IHRoaXMgcG9pbnQsIGFuZCBub3RoaW5nIGhhcyBjaGFuZ2Vk
IGluIHRoZQo+ID4gPiA+ID4gPiBkb2N1bWVudGF0aW9uISBUYWxrJ3MgY2hlYXAsIGVoaD8KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZdXAuIEkgd2lsbCBwb2tlIFJWSSBmb2xrcyB0
byBjaGVjayBpZiBpdCBzdGlsbCBpcyB0aGUgcGxhbiBvciBjaGFuZ2VkICEhCj4gPiA+ID4KPiA+
ID4gPiBTb3VuZHMgZ29vZCwgdGhhbmtzIQo+ID4KPiA+IFRoZXJlIGhhcyBiZWVuIHNvbWUgbW92
ZW1lbnQgb24gdGhhdCBmcm9udCwgc2hhbGwgc2VlIHdoZXJlIGl0IGdvZXMKPiA+IDp1cHNpZGVk
b3duX3NtaWxlOgo+Cj4gVGhlcmUncyBiZWVuIHNvbWUgb2ZmLWxpc3QgZGlzY3Vzc2lvbiBwcm9t
cHRlZCBieSBBdGlzaCB3aXRoIHNvbWUgb2YgdGhlCj4gUlZJIHNwZWMgZm9saywgZnJvbSB3aGlj
aCB0aGUgdXBzaG90IF9fYXBwZWFyc19fIHRvIGJlIGFuIHVuZGVyc3RhbmRpbmcKPiB0aGF0IHVz
aW5nIHZlcnNpb24gbnVtYmVyaW5nIHRvIGluZGljYXRlIHJlbW92YWwgb2YgSVNBIGZlYXR1cmVz
IGlzIGEgYmFkCj4gaWRlYS4KPiBJJ20gaG9waW5nIHRoYXQgdGhpcyByZXN1bHRzIGluIHRoZSBl
bnNocmluZW1lbnQgb2YgdGhpcyBpbiB0aGUgSVNBCj4gc3BlY3MsIHNvIHRoYXQgd2UgaGF2ZSBz
b21ldGhpbmcgY29uY3JldGUgdG8gcG9pbnQgdG8gYXMgdGhlIGJhc2lzIGZvcgo+IG5vdCBuZWVk
aW5nIHRvIGhhbmRsZSB2ZXJzaW9uIG51bWJlcmluZy4KPiBDZXJ0YWlubHkgdGhhdCdkIGJlIGdy
ZWF0IGZvciBBQ1BJIGFuZCByZW1vdmUgY29uY2VybnMgdGhlcmUuCj4KPiA+ID4gPiA+IFdlIHdp
bGwgbGlrZWx5IGhhdmUgYSB2ZW5kb3Igc3BlY2lmaWMgc3RyaW5nIHBhcnNpbmcgbG9naWMuCj4g
PiA+ID4KPiA+ID4gPiBDb21wbGljYXRpbmcgdGhlIHBhcnNpbmcgbG9naWMgaXMgdGhlIGV4YWN0
IHNvcnQgb2YgY3JhcCB0aGF0IEkgd2FudAo+ID4gPiA+IHRvIGF2b2lkLgo+ID4gPgo+ID4gPiBZ
YSwgSSB0aGluayB3ZSdyZSByZWFsbGx5IG92ZXJjb21wbGljYXRpbmcgdGhpbmdzIHdpdGggdGhl
IElTQSBzdHJpbmdzLgo+ID4gPiBMZXQncyBqdXN0IGRlcHJlY2F0ZSB0aGVtIGFuZCBtb3ZlIHRv
IHNvbWV0aGluZyB0aGF0IGRvZXNuJ3QgbmVlZCBhbGwgdGhlCj4gPiA+IGJlc3Bva2Ugc3RyaW5n
IHBhcnNpbmcuCj4gPgo+ID4gVmVyc2lvbmluZyBhc2lkZSwgYWx0aG91Z2ggdGhhdCByZW1vdmVz
IGEgbGFyZ2UgcGFydCBvZiB0aGUgbW90aXZhdGlvbiwKPiA+IHRoZSBpbnRlcmZhY2UgYmVjb21l
cyBxdWl0ZSBuaWNlOgo+ID4gb2ZfcHJvcGVydHlfcHJlc2VudChub2RlLCAicmlzY3YsaXNhLWV4
dGVuc2lvbi16aWNib20iKQo+Cj4gTXkgY3VycmVudCBmZWVsaW5nIGlzIHRoYXQsIHJhdGhlciB0
aGFuIGludHJvZHVjaW5nIGEga2V5LXZhbHVlIHR5cGUgb2YKPiBwcm9wZXJ0eSwgYWRkaW5nIGJv
b2xlYW4gcHJvcGVydGllcyBmb3IgZXh0ZW5zaW9ucyBpcyB0aGUgd2F5IHRvIGdvCj4gaGVyZS4g
VGhlICJyaXNjdixpc2EiIHBhcnQgb2YgdGhlIERUIEFCSSBwcmUtZGF0ZXMgZXZlbiB0aGUgcmF0
aWZpY2F0aW9uCj4gb2YgdGhlIGJhc2UgZXh0ZW5zaW9ucyAoYW5kIHRodXMgdGhlIHJlbW92YWwg
b2Ygc29tZSBmZWF0dXJlcy4uLikuCj4gU3RhcnRpbmcgYWdhaW4gd2l0aCBhIG5ldyBwcm9wZXJ0
eSB3b3VsZCBhbGxvdyB1cyB0byBkZWZpbmUgZXh0ZW5zaW9ucwo+IGFzIHBlciB0aGVpciByYXRp
ZmllZCBzdGF0ZSwgcmF0aGVyIHRoYW4gdGhlIGludGVybWVkaWF0ZSAmIGluY29tcGF0aWJsZQo+
IHN0YXRlcyB0aGF0IHdlIGhhdmUgY3VycmVudGx5IGdvdCB3aXRoICJyaXNjdixpc2EiLgo+IFN1
Y2ggYSBtb2RlbCBkb2VzIHJlbHkgb24gdGhlIHN0cmVuZ3RoZW5pbmcgb2YgdGhlIHdvcmRpbmcg
aW4gdGhlCj4gc3BlY2lmaWNhdGlvbi4KCklTQSBzdHJpbmcgcGFyc2VkIGZvciBib3RoIERUIGFu
ZCBBQ1BJLgoKRm9yIEFDUEksIG1vdmluZyB0byBhIHBlci1leHRlbnNpb24gYml0IGluIGEgYml0
bWFwIGFuZCBkZWZpbmluZwphIG5ldyBiaXQgd2l0aCBldmVyeSBJU0EgZXh0ZW5zaW9uIHdpbGwg
YmUgdmVyeSB2ZXJ5IGluY29udmVuaWVudApmb3IgdXBkYXRpbmcgdGhlIEFDUEkgc3BlY3MuIFdl
IHNob3VsZCBjb250aW51ZSB0aGUgSVNBIHN0cmluZwpwYXJzaW5nIGF0IGxlYXN0IGZvciBBQ1BJ
LgoKRm9yIERULCB1c2VycyBjYW4gZWl0aGVyIHVzZSAicmlzY3YsaXNhIiBEVCBwcm9wZXJ0eSBv
ciB1c2UgYm9vbGVhbgpEVCBwcm9wZXJ0aWVzLgoKPgo+IFRoaXMgaGFkIHRoZSBhZHZhbnRhZ2Ug
b2YgYmVpbmcsIGFzIEkgbWVudGlvbiBhYm92ZSwgZXZlbiBlYXNpZXIgdG8KPiBwYXJzZSBpbiBz
b2Z0d2FyZSB0aGFuIHRoZSBrZXktdmFsdWUgcGFpciBidXNpbmVzcyAtIGJ1dCBhbHNvIGlzCj4g
dHJpdmlhbGx5IGltcGxlbWVudGVkIGluIGEgZHQtYmluZGluZy4gV2hhdCBJIGhhdmUgYmVlbiB0
cnlpbmcgdG8gZG8KPiB3aXRoIHRoZSB2YWxpZGF0aW9uIG9mIHRoZSBrZXktdmFsdWUgc3R1ZmYg
ZG9lcyBub3QgYXBwZWFyIHRvIGJlIHJlYWRpbHkKPiBkb2FibGUhCj4KPiAoQW5vdGhlciBkcmF3
YmFjayB0aGF0IGhhcyBjb21lIHRvIG1pbmQgaXMgdGhhdCB3ZSBoYXZlIG5vIHdheSB0bwo+IHZh
bGlkYXRlIHdoZXRoZXIgbXV0dWFsbHkgZXhjbHVzaXZlIGV4dGVuc2lvbnMgaGF2ZSBiZWVuIGFk
ZGVkIHdpdGgKPiAicmlzY3YsaXNhIikKPgo+ID4gVGhhdCBhbHNvIGdpdmVzIHVzIHRoZSBhYmls
aXR5IHRvIGRlZmluZSB3aGF0IHN1cHBvcnRlZCB2ZW5kb3IKPiA+IGV4dGVuc2lvbnMgYWN0dWFs
bHkgbWVhbiBpbiBhIGR0LWJpbmRpbmcsIHdoaWNoIHRvIG1lIGlzIGEgYmlnIHdpbiBpbgo+ID4g
dGVybXMgb2YgdGhlIGFmb3JlbWVudGlvbmVkICJ3aWxkIHdlc3QiLgo+Cj4gVmVuZG9yIGV4dGVu
c2lvbnMgZXRjIGFyZSBvZnQgcXVvdGVkIGFzIG9uZSBvZiB0aGUgc3RyZW5ndGhzIG9mIFJJU0Mt
ViwKPiBhbmQgbXkgZmVlbGluZyBpcyB0aGF0ICJyaXNjdixpc2EiIGlzIG5vdCBhIG1lY2hhbmlz
bSB3aGVyZSB3ZSBjYW4KPiBlYXNpbHkgaGFuZGxlIG1lYW5pbmdzIC0gZXNwZWNpYWxseSBmb3Ig
dmVuZG9yIHN0dWZmIHdoZXJlIHRoZXJlIGlzCj4gb3RoZXJ3aXNlIG5vIGNlbnRyYWxpc2VkIGxv
Y2F0aW9uIGZvciBfeGZvbyAtPiBmZWF0dXJlIG1hcHBpbmdzLgo+Cj4gQ2hlZXJzLAo+IENvbm9y
LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
