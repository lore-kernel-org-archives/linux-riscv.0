Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D2BCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 18:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3F33Je9NFhhY4XthlmPuowZhL92yGO0sBWUO+BnCtc=; b=HBd12hX5sg+kgs
	M699x78gZar+cZyIg+7RDz3ptaaphtbwrqZB1Rgxc8N+eIgVYi6YfBq0XfvdalkrSZt5GT+/wBUTK
	IMwhKCG9ChFq8rHi+UaRDH9WYD7GAc6C50Pdl+6ebB/dc0xdcb0cVK5LY4WCjS/koCz10naLZffJ+
	/TcHC903GbPeaYTJL5d00GLgkRp2FXKWP1b0f1WS0D0byWEI3O/FHJBq0tDb0mQSq3KzO2mFPmsWa
	XWZOi7NCH2oaYNUbZhswNaQXwDdbhyyXAh+bXrRCfj7wJfHql5154xTyhHOWewoJ6tyDwJintFj3q
	6k4zN5KzBrhl5sMYFwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs562-0000000HKOf-0XzJ;
	Wed, 03 Apr 2024 18:12:26 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs55y-0000000HKNp-3LdG;
	Wed, 03 Apr 2024 18:12:24 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4d4404fbdf5so44865e0c.0;
        Wed, 03 Apr 2024 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712167940; x=1712772740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LPRUCfO8vLA+VTuxeAjc+lg7ZeBV4TKM1NgQNqaX4o=;
        b=a6xrAi69c1Tj1GKhQZmxnYS+avhb6fnJwGmokiflMVZrGfHRlWCdfz90O+SqLH9nJ1
         T/VrWtyuqwjq8dhuEFNXJC2NRA5gz6ADA/el8nPPjt1ERPX0XEwXkO1ndLpvsb9ktKLg
         QvFTNVJdEjK0ZPiUhdc9mpv21GkVQCArEvNSKQYKQw8kophoDHx1TGybZqwBdHJ0MZav
         2EZTctfEjdMhQCtJA1rNgLfSaKYktkkODyKnvVMwMWIQ9d6syS79s6WlGUHyt15LL5Qa
         /dWhAqcufMcOuGcEl/5ggXAvC/OHAJ3X/2CPfrQhy6wi8eZZE9kbdei2PLxLMB9x0pO7
         PyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167940; x=1712772740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LPRUCfO8vLA+VTuxeAjc+lg7ZeBV4TKM1NgQNqaX4o=;
        b=ekxxLnKdbvCBPb6ZjCL8zPWhDVwFx2QJRimj5rTFSZSGW7h52c5f2R605fhjt+j87l
         xDvaoTtlmWTs6xEgveewtrm7HeFUjbe7hs5whKRjUHfCkbUhO5lplxD+/z7aAC7J4ufr
         HYTOg7Bw0ReO5ufhtcCoiyj3kGms9x/A1ZqAPi5abYCKcUU166LXA4ioRCjG2PobuWMh
         aLps+Fb118ZPoaxU1uHLjdm2Nzb3v4iyiBulMp23I38/MBDdW14UCIeF9IK4L9ITK9KI
         vItuVypbwsvld6liX8qAtkwYJFj2OQy4beONtKEuNPh6f1/W92CfUIV32ovHDXZN+zzX
         Q5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt7aLXxVmAirAUT7g9OOLZe/WXTS65fPyD3cwJRxkXbw+GHQAuyZDYUwtswEjPsJpUkk+inkg40hdLQtiFUC8M/f4rN/Doz6QCuMLlyyrrXXDKLNgUwqq6KHSKYYpWjT9LVR54B59Qy9Cg3k6FyCr2678H78U=
X-Gm-Message-State: AOJu0YzDMDUV1tbuQ0nIuM3EPgr4Z+0hlnLcVWo8SJ7XYMswDHqDZsBW
	itM+KYxMBYIx6kkH/asXHLj5lQKHzCyxjUsO8ihmjg13ydRJMZU3wPqOACJ7fHDZD2XR3Vxb6X7
	bStifTbIyetLojtXWAeBU4ihmixU=
X-Google-Smtp-Source: AGHT+IHrrkiSOm6wLnFKQHKdrarP92qhgfwfDo/mPb5qCUU7DxYQE24BY/ERiXN9pre31elgG8R8MxOj8He3tkMs4Vk=
X-Received: by 2002:a05:6122:189c:b0:4ca:80c5:753d with SMTP id
 bi28-20020a056122189c00b004ca80c5753dmr40719vkb.4.1712167940470; Wed, 03 Apr
 2024 11:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CA+V-a8tGucbJ87hsMQDEgcor5BzDmB_WnRsEn6c9F_HzucWLXQ@mail.gmail.com>
 <CAK9=C2VgiRcQjBEPmZjdcMf221omKS8ntdcenSE7G__4xYcCUA@mail.gmail.com>
 <CA+V-a8ser=hDmst6+XSeOWaEoOd+iY3Ys6bYBWDa5UYPfT+Pug@mail.gmail.com> <4dbd5daf-d100-4ae2-8bda-c657e23a809e@sifive.com>
In-Reply-To: <4dbd5daf-d100-4ae2-8bda-c657e23a809e@sifive.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Apr 2024 19:10:31 +0100
Message-ID: <CA+V-a8uLjEb==sTXa3WePqTWn4ejVNJfMu+qTXSNZz1Uw+U5oA@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111222_866573_76C56242 
X-CRM114-Status: GOOD (  27.79  )
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

SGkgU2FtdWVsIGFuZCBBbnVwLAoKT24gV2VkLCBBcHIgMywgMjAyNCBhdCA1OjI44oCvUE0gU2Ft
dWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgUHJh
Ymhha2FyLAo+Cj4gT24gMjAyNC0wNC0wMyAxMDo0OSBBTSwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6
Cj4gPiBPbiBXZWQsIEFwciAzLCAyMDI0IGF0IDM6MTfigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBXZWQsIEFwciAzLCAyMDI0IGF0
IDI6MDHigK9QTSBMYWQsIFByYWJoYWthcgo+ID4+IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IEhpIEFudXAsCj4gPj4+Cj4gPj4+IE9uIFRodSwgRmViIDIy
LCAyMDI0IGF0IDk6NDHigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4g
d3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gVGhlIFBMSUMgZHJpdmVyIGRvZXMgbm90IHJlcXVpcmUgdmVy
eSBlYXJseSBpbml0aWFsaXphdGlvbiBzbyBjb252ZXJ0Cj4gPj4+PiBpdCBpbnRvIGEgcGxhdGZv
cm0gZHJpdmVyLgo+ID4+Pj4KPiA+Pj4+IEFmdGVyIGNvbnZlcnNpb24sIHRoZSBQTElDIGRyaXZl
ciBpcyBwcm9iZWQgYWZ0ZXIgQ1BVcyBhcmUgYnJvdWdodC11cAo+ID4+Pj4gc28gc2V0dXAgY3B1
aHAgc3RhdGUgYWZ0ZXIgY29udGV4dCBoYW5kbGVyIG9mIGFsbCBvbmxpbmUgQ1BVcyBhcmUKPiA+
Pj4+IGluaXRpYWxpemVkIG90aGVyd2lzZSBQTElDIGRyaXZlciBjcmFzaGVzIGZvciBwbGF0Zm9y
bXMgd2l0aCBtdWx0aXBsZQo+ID4+Pj4gUExJQyBpbnN0YW5jZXMuCj4gPj4+Pgo+ID4+Pj4gU2ln
bmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPj4+PiAt
LS0KPiA+Pj4+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMgfCAxMDEgKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2Vy
dGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4gVGhpcyBwYXRjaCBzZWVtcyB0
byBoYXZlIGJyb2tlbiB0aGluZ3Mgb24gUlovRml2ZSBTb0MsIGFmdGVyIHJldmVydGluZwo+ID4+
PiB0aGlzIHBhdGNoIEkgZ2V0IHRvIGJvb3QgaXQgYmFjayBhZ2FpbiBvbiB2Ni45LXJjMi4gTG9v
a3MgbGlrZSB0aGVyZQo+ID4+PiBpcyBzb21lIHByb2JlIG9yZGVyIGlzc3VlIGFmdGVyIHN3aXRj
aGluZyB0byBwbGF0Zm9ybSBkcml2ZXI/Cj4gPj4KPiA+PiBZZXMsIHRoaXMgaXMgbW9zdCBsaWtl
bHkgcmVsYXRlZCB0byBwcm9iZSBvcmRlcmluZyBiYXNlZCBvbiB5b3VyIERULgo+ID4+Cj4gPj4g
Q2FuIHlvdSBzaGFyZSB0aGUgZmFpbGluZyBib290IGxvZyBhbmQgRFQgPwo+ID4KPiA+IG5vbiB3
b3JraW5nIGNhc2UsIGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMzEyOTQ3Lwo+Cj4gTG9va3Mg
bGlrZSB5b3UgbmVlZCB0byBhZGQgImtlZXBfYm9vdGNvbiIgdG8geW91ciBrZXJuZWwgY29tbWFu
ZCBsaW5lIHRvIGdldCBhCj4gZnVsbCBsb2cgaGVyZS4KPgpUaGFua3MgZm9yIHRoZSBwb2ludGVy
LCB0aGF0IGhlbHBlZCBtZSB0byBnZXQgdG8gdGhlIHJvb3QgY2F1c2UuCgo+ID4gYWZ0ZXIgcmV2
ZXJ0aW5nLCBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTMxMjk0OC8KPiA+IChhdHRhY2hlZCBp
cyB0aGUgRFRCKQo+Cj4gSSBkb24ndCBzZWUgYW55dGhpbmcgc3VzcGljaW91cyBiZXR3ZWVuIHRo
ZSAicmlzY3YtaW50YyIgbGluZXMgYW5kIHRoZSAiRml4ZWQKPiBkZXBlbmRlbmN5IGN5Y2xlKHMp
IiBsaW5lcyB0aGF0IGxvb2tzIGxpa2UgaXQgd291bGQgZGVwZW5kIG9uIHRoZSBQTElDIElSUQo+
IGRvbWFpbi4gTWF5YmUgdGhlcmUgaXMgc29tZSBkcml2ZXIgdGhhdCBkb2VzIG5vdCBoYW5kbGUg
LUVQUk9CRV9ERUZFUj8gSXQncyBoYXJkCj4gdG8gdGVsbCB3aXRob3V0IHRoZSBmdWxsIGxvZyBm
cm9tIHRoZSBmYWlsdXJlIGNhc2UuCj4KVGhlIGNsb2NrIHJlcXVpcmVkIGZvciB0aGUgUExJQyB3
YXNudCBhdmFpbGFibGUgZHVyaW5nIHRoZSBwcm9iZSBvZgp0aGlzIGRyaXZlci4gVGhpcyBidWcg
Z290IGhpZGRlbiB3aGVuIHRoZSBQTElDIGRyaXZlciB3YXMgcHJvYmVkCmVhcmxpZXIgIGluIGJv
b3Qgd2hlcmUgaXQgdXNlZCBhbiBpbmNvcnJlY3QgY2xvY2sgc291cmNlLiBJdmUgY3JlYXRlZAph
IHBhdGNoIHdoaWNoIGFkZHMgYSBtaXNzaW5nIGNsb2NrIGZvciB0aGUgUExJQy4KClNvcnJ5IGZv
ciB0aGUgbm9pc2UhCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
