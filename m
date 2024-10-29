Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F2DD5B866
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 03:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yi/3IIGhMkmWgO0+8/OCEUg0pGVckAdBgss0/2f7ol4=; b=mHkOKsL+hS64vu
	OzVboNPWvhU2x1jRfw2MFw+sep2bC/aF/fhiJGe/3JffEyVZ4xuIcdie/Pri0sGaGZPSwLEcavkRS
	n3Pgs+NjtesanGWPuT5sUvsv3gESqJKGT+NfqkVeXrRnhZbLNH7RdhB8UmEMk17jEv0boWURD5h3B
	p0dHhKHLprtI9VNRlUamfogea/f4hMDX9dh82WTbtWWgIpc5Xn+g78H3kAlSPPZrIsdxvZR5ayI7S
	50PH740D96lLoKHzYJtwG+WzNuUmLztp4+2YruJxUTsvLudWEpd9DMjX569w+6OhHOtpDuo7SPHxy
	wlfT6wDOLPZ7tmXZHzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cXd-0000000D2sz-1yit;
	Tue, 29 Oct 2024 03:05:09 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cXa-0000000D2ru-31UO
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 03:05:08 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5ec1ee251b8so1594557eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 20:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730171101; x=1730775901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A2tft79wpE62sdOkLmNApc2SIWGv4sutFtEvIY/+Wg=;
        b=JJI2TF4vtpmoP+nyz1/yDTi+P20930NmpnRoysf9/W0dUirduBOsrE8Moay3i6qkGZ
         1ZzqWTsnyXvZTNgPaXikHhgELsCYC4l7bTU5+XpPOkBe+dJ/2+i0KvxWfN7hZesOr5PB
         Y/i3flo3tAZST+V2ocljzLjONoyczROKzmIh8xJeD8z6frj/o1IwMd7zLKvF8tTbYhyN
         gNTsKrNeEm52w4YRKk5IXQdYNmwkvgmk7wTIRjE9FIJd1t41JLiUONSelv4f8PwYi5UP
         Nw+crP+UEtzQE5aveaUf+QpJKCZgm4divVfkGILi3B3Ftqo6Tjqqve6p3CrV3L3SUuwn
         Q7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730171101; x=1730775901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7A2tft79wpE62sdOkLmNApc2SIWGv4sutFtEvIY/+Wg=;
        b=Jgkjx/8bicXx7MtcDtk6OXe7RyMZIGDThpfeIGccht5SzVUr/oAdDiQr8O30+boXRG
         HsXF4ELEGyjvAbdbGHhM1LBwgEgbo811aVkwzF0i/b0dA7K09Ct/AhKqeBLObH+9PCom
         T03yKMEZKgaYW1NkFKnLpWCUBiJWpF+eK+jQV6IOdAjCZ8UUx2iYj05WKw6mauXTlloK
         XKLDreZRfR0ZEvbJbSc+4UPbwSxcDqhrRiUaEiEw5MTA25zkU+xodVb0JS8Qor8SY5QY
         egCqs82xGU3WOFtEkJVXLsAGmZBgP6eB0pz802bgwSahEGnqKbWdWTJaOp/b9gMkUenw
         NQuw==
X-Forwarded-Encrypted: i=1; AJvYcCVdJsN62xXRv7MKmQup8xvL7n8LeALtu/3Z+zaKIvjvqTZD24KbpGNMO83LiAfBvlGJZ9/g2JxBwzDtfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEFuVbMMv+l2O1I34zdkGE673dMrrEaY7gk/koW81te4vtNlbf
	oIlIDYeqs2awE6ONhCmBjqG1u/hbKAgHe0qNJES+kusE9srMIpMZE0dRaIbHyE8S1PGWDFv/6QC
	zuWaK1Kv061ea0rySvNdPSBF6IMjVwHgfBsT6Fg==
X-Google-Smtp-Source: AGHT+IErtbcsrymXWEaip1yynRYw6vCJBZzHwiX3vSDoI8pgRYDYd6qMS5wZKThDnvKbL0LQFF9TpCf52Zss7vNzT6A=
X-Received: by 2002:a4a:db48:0:b0:5eb:5396:7896 with SMTP id
 006d021491bc7-5ec54ad7388mr399745eaf.4.1730171100497; Mon, 28 Oct 2024
 20:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
 <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr> <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
 <c05e09d0-d996-4712-a6e5-ef77f1f2ff0a@ghiti.fr> <CAEEQ3wmw8B_cOs54H4Z8e2QTGyeE2cAYQwDRyk7KgUUKTFhZ-g@mail.gmail.com>
 <CAHVXubjDhM6NEF6uf981Y2fNA1Dw=Bu_SNtpso6P1=3Np6BUDw@mail.gmail.com>
In-Reply-To: <CAHVXubjDhM6NEF6uf981Y2fNA1Dw=Bu_SNtpso6P1=3Np6BUDw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 29 Oct 2024 11:04:49 +0800
Message-ID: <CAEEQ3wndPwdaNrJZaqqrbyMBeWTVnV3m8KEehdijtTfXWjuYsw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_200506_795845_A6B8E71A 
X-CRM114-Status: GOOD (  39.42  )
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
Cc: aou@eecs.berkeley.edu, haibo1.xu@intel.com, Alexandre Ghiti <alex@ghiti.fr>, jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQWxleCwKCgpPbiBNb24sIE9jdCAyOCwgMjAyNCBhdCA5OjM34oCvUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIFl1bmh1aSwKPgo+IFNv
cnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgSSB3YXMgb24gdmFjYXRpb24gbGFzdCB3ZWVrLgo+Cj4g
T24gTW9uLCBPY3QgMjEsIDIwMjQgYXQgODo0NeKAr0FNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGV4LAo+ID4KPiA+IE9uIE1vbiwgT2N0
IDE0LCAyMDI0IGF0IDk6MDHigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiAxNC8xMC8yMDI0IDE0OjMwLCB5dW5odWkgY3VpIHdyb3RlOgo+
ID4gPiA+IEhpIEFsZXgsCj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCA4
OjEy4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPiA+ID4gPj4g
SGkgWXVuaHVpLAo+ID4gPiA+Pgo+ID4gPiA+PiBPbiAxNC8xMC8yMDI0IDExOjQ3LCBZdW5odWkg
Q3VpIHdyb3RlOgo+ID4gPiA+Pj4gV2hlbiBTVlBCTVQgaXMgZW5hYmxlZCwgX19hY3BpX21hcF90
YWJsZSgpIHdpbGwgZGlyZWN0bHkgYWNjZXNzIHRoZQo+ID4gPiA+Pj4gZGF0YSBpbiBERFIgdGhy
b3VnaCB0aGUgSU8gYXR0cmlidXRlLCByYXRoZXIgdGhhbiB0aHJvdWdoIGhhcmR3YXJlCj4gPiA+
ID4+PiBjYWNoZSBjb25zaXN0ZW5jeSwgcmVzdWx0aW5nIGluIGluY29ycmVjdCBkYXRhIGluIHRo
ZSBvYnRhaW5lZCBBQ1BJCj4gPiA+ID4+PiB0YWJsZS4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBUaGUg
bG9nOiBBQ1BJOiBbQUNQSToweDE4XSBJbnZhbGlkIHplcm8gbGVuZ3RoLgo+ID4gPiA+Pj4KPiA+
ID4gPj4+IFdlIGRvIG5vdCBhc3N1bWUgd2hldGhlciB0aGUgYm9vdGxvYWRlciBmbHVzaGVzIG9y
IG5vdC4gV2Ugc2hvdWxkCj4gPiA+ID4+PiBhY2Nlc3MgaW4gYSBjYWNoZWFibGUgd2F5IGluc3Rl
YWQgb2YgbWFpbnRhaW5pbmcgY2FjaGUgY29uc2lzdGVuY3kKPiA+ID4gPj4+IGJ5IHNvZnR3YXJl
Lgo+ID4gPiA+Pj4KPiA+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1
aUBieXRlZGFuY2UuY29tPgo+ID4gPiA+Pj4gLS0tCj4gPiA+ID4+PiAgICBhcmNoL3Jpc2N2L2tl
cm5lbC9hY3BpLmMgfCAyICstCj4gPiA+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPj4+Cj4gPiA+ID4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvYWNwaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gPiA+ID4+
PiBpbmRleCA2ZTBkMzMzZjU3ZTUuLjMxNzdjOWFmODc2NCAxMDA2NDQKPiA+ID4gPj4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvYWNwaS5jCj4gPiA+ID4+PiBAQCAtMjEwLDcgKzIxMCw3IEBAIHZvaWQgX19pbml0IF9faW9t
ZW0gKl9fYWNwaV9tYXBfdGFibGUodW5zaWduZWQgbG9uZyBwaHlzLCB1bnNpZ25lZCBsb25nIHNp
emUpCj4gPiA+ID4+PiAgICAgICAgaWYgKCFzaXplKQo+ID4gPiA+Pj4gICAgICAgICAgICAgICAg
cmV0dXJuIE5VTEw7Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gLSAgICAgcmV0dXJuIGVhcmx5X2lvcmVt
YXAocGh5cywgc2l6ZSk7Cj4gPiA+ID4+PiArICAgICByZXR1cm4gZWFybHlfbWVtcmVtYXAocGh5
cywgc2l6ZSk7Cj4gPiA+ID4+PiAgICB9Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gICAgdm9pZCBfX2lu
aXQgX19hY3BpX3VubWFwX3RhYmxlKHZvaWQgX19pb21lbSAqbWFwLCB1bnNpZ25lZCBsb25nIHNp
emUpCj4gPiA+ID4+Cj4gPiA+ID4+IEl0IG1ha2VzIHNlbnNlIHRvIG1lIHNpbmNlIHdpdGggdGhp
cywgd2UgZG9uJ3QgaGF2ZSB0byBjYXJlIGFib3V0IGhvdwo+ID4gPiA+PiB0aGUgZmlybXdhcmUg
bWFwcGVkIHRoZSB0YWJsZS4gQW5kIGl0IG1pbWljcyBhbGwgb3RoZXIgYXJjaGl0ZWN0dXJlcwo+
ID4gPiA+PiAoYXJtNjQsIGxvb25nYXJjaCBhbmQgeDg2KS4KPiA+ID4gPj4KPiA+ID4gPj4gSGVy
ZSBpcyB0aGUgY29ycmVzcG9uZGluZyBmaXhlcyB0YWc6Cj4gPiA+ID4+Cj4gPiA+ID4+IEZpeGVz
OiAzYjQyNmQ0YjViMTQgKCJSSVNDLVY6IEFDUEkgOiBGaXggZm9yIHVzYWdlIG9mIHBvaW50ZXJz
IGluCj4gPiA+ID4+IGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlIikKPiA+ID4gPj4KPiA+ID4gPj4g
V2l0aCB0aGUgY29ycmVzcG9uZGluZyBmaXggaW4gX19hY3BpX3VubWFwX3RhYmxlKCkgYXMgcG9p
bnRlZCBieSBTdW5pbCwKPiA+ID4gPj4geW91IGNhbiBhZGQ6Cj4gPiA+ID4+Cj4gPiA+ID4+IFJl
dmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+
ID4+Cj4gPiA+ID4+IEFuZCByZWdhcmRpbmcgdGhlIHNwYXJzZSBlcnJvciwgSSBkb24ndCBzZWUg
YW55IG90aGVyIGFyY2hpdGVjdHVyZQo+ID4gPiA+PiBjYXN0aW5nIHRvIF9faW9tZW0sIHNvIG1h
eWJlIHRoYXQncyBub3QgbmVjZXNzYXJ5IGFueW1vcmU/Cj4gPiA+ID4gT0suIEkgd2lsbCBtYWtl
IHRoZSBjaGFuZ2VzIGluIHYyLiBSZWdhcmRpbmcgdGhlIHNwYXJzZSBlcnJvciwgSSB3aWxsCj4g
PiA+ID4gdXNlIGFub3RoZXIgcGF0Y2ggc3BlY2lmaWNhbGx5IHRvIHNvbHZlIGl0LiBJcyB0aGF0
IG9rYXk/Cj4gPiA+Cj4gPiA+Cj4gPiA+IElmIHRoZSBzZWNvbmQgcGF0Y2ggb25seSBjb25zaXN0
cyBpbiBjYXN0aW5nLCBJIHdvdWxkIG5vdCB1c2UgYW5vdGhlcgo+ID4gPiBwYXRjaCBzaW5jZSB0
aGUgcGF0Y2ggMiB3b3VsZCBmaXggc29tZXRoaW5nIGludHJvZHVjZWQgaW4gcGF0Y2ggMS4KPiA+
ID4KPiA+ID4gQnV0IGlmIHBhdGNoIDIgaXMgbW9yZSBjb21wbGljYXRlZCwgIGl0IG1heSBtYWtl
IHNlbnNlIHRvIGRvIGFzIHlvdQo+ID4gPiBzdWdnZXN0LCB0aGUgZ29hbCBpcyB0byBtZXJnZSBw
YXRjaCAxIGFzYXAuCj4gPgo+ID4gUmVnYXJkaW5nIHBhdGNoIDIsIEkgZXhlY3V0ZWQgIm1ha2Ug
JiBtYWtlIGluc3RhbGwiIGZvciBzcGFyc2Ugb2YgdGhlCj4gPiByaXNjdiBhcmNoLiBJICJnaXQg
Y2xvbmVkIiBmcm9tCj4gPiBodHRwczovL2dpdGh1Yi5jb20vQ29uY2h1T0Qvc3BhcnNlLmdpdC4K
PiA+IFRoZW4gd2hlbiBjb21waWxpbmcgdGhlIGtlcm5lbCwgdGhlIGZvbGxvd2luZyBlcnJvciB3
YXMgcmVwb3J0ZWQ6Cj4gPgo+ID4gY2QgL2RhdGEwMC9jeWgvbGludXgtbmV4dC8KPiA+IG1ha2Ug
ZGVmY29uZmlnCj4gPiBjcCAuY29uZmlnIGJ1aWxkLXJpc2N2NjQvCj4gPgo+ID4gbWFrZSBPPWJ1
aWxkLXJpc2N2NjQvIEM9MSBXPTEgYXJjaC9yaXNjdi9rZXJuZWwvIGRyaXZlcnMvYWNwaS8KPiA+
IGRyaXZlcnMvbWFpbGJveC8gLWoKPiA+IG1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL2Rh
dGEwMC9jeWgvbGludXgtbmV4dC9idWlsZC1yaXNjdjY0Jwo+ID4gICBHRU4gICAgIE1ha2VmaWxl
Cj4gPiAgIENDICAgICAgc2NyaXB0cy9tb2QvZW1wdHkubwo+ID4gICBDQyAgICAgIHNjcmlwdHMv
bW9kL2RldmljZXRhYmxlLW9mZnNldHMucwo+ID4gICBDSEVDSyAgIC4uL3NjcmlwdHMvbW9kL2Vt
cHR5LmMKPiA+IGludmFsaWQgYXJndW1lbnQgdG8gJy1tYXJjaCc6ICdfemljc3JfemlmZW5jZWkn
Cj4gPgo+ID4gbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjIyOTogc2Ny
aXB0cy9tb2QvZW1wdHkub10gRXJyb3IgMQo+ID4gbWFrZVszXTogKioqIERlbGV0aW5nIGZpbGUg
J3NjcmlwdHMvbW9kL2VtcHR5Lm8nCj4gPiBtYWtlWzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5p
c2hlZCBqb2JzLi4uLgo+ID4gbWFrZVsyXTogKioqIFsvZGF0YTAwL2N5aC9saW51eC1uZXh0L01h
a2VmaWxlOjEyMTU6IHByZXBhcmUwXSBFcnJvciAyCj4gPiBtYWtlWzFdOiAqKiogWy9kYXRhMDAv
Y3loL2xpbnV4LW5leHQvTWFrZWZpbGU6MjI0OiBfX3N1Yi1tYWtlXSBFcnJvciAyCj4gPgo+ID4g
RG8geW91IGtub3cgdGhlIHNvbHV0aW9uPwo+Cj4gSW4gY2FzZSB5b3UgZGlkIG5vdCBmaW5kIHRo
ZSBzb2x1dGlvbiB5ZXQsIEkgd291bGQgc2F5IHRoYXQgeW91cgo+IHRvb2xjaGFpbiBpcyB0b28g
b2xkLgo+Cj4gTGV0IG1lIGtub3cgaWYgSSBjYW4gaGVscCwKSXQgbWF5IG5vdCBiZSBhIHByb2Js
ZW0gb2YgYW4gb2xkIGNvbXBpbGVyLiBUaGUgdmVyc2lvbiBvZiB0aGUKY29tcGlsZXIgSSBhbSB1
c2luZyBpcyAxMy4yLgpJdCBpcyBhIHByb2JsZW0gd2l0aCBzcGFyc2UuIFdoZW4gcnVubmluZyAi
c3BhcnNlIC0tYXJjaD1yaXNjdgotbWFyY2g9cnY2NGltYWNfemljc3JfemlmZW5jZWkgc2NyaXB0
cy9tb2QvZW1wdHkuYyIsIHRoZXJlIGlzIGFuCmludmFsaWQgYXJndW1lbnQgZm9yICctbWFyY2gn
OiAnX3ppY3NyX3ppZmVuY2VpJy4KCj4KPiBUaGFua3MsCj4KPiBBbGV4Cj4KPiA+Cj4gPiA+Cj4g
PiA+IFRoYW5rcyEKPiA+ID4KPiA+ID4gQWxleAo+ID4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4+
IFRoYW5rcywKPiA+ID4gPj4KPiA+ID4gPj4gQWxleAo+ID4gPiA+Pgo+ID4gPiA+Pgo+ID4gPiA+
IFRoYW5rcywKPiA+ID4gPiBZdW5odWkKPiA+Cj4gPiBUaGFua3MsCj4gPiBZdW5odWkKClRoYW5r
cywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
