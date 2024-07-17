Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EF1C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSFaCZNKm9aXA5omKzcFWnZMEDgT/adKxLRXU7MTc54=; b=M36XvktSsBRRec
	c25ewuUIdacTEs+Rm+T8iDorTTwAdgotShPMWfx/c+b4ofh9uMMduBqktKGh40XMsfTktKv8gYy5m
	2gsU9z7ILZVz5D7vJNapsXgjAOIX/KVWDkGcVWcyIfwZh8HdVRR4xsEjoQu7Ckoz63HpL/4mAOV2H
	DiZf0nfgr1NRvyCE/KxiMiYVj9DocMkZxVlEARmb27/uXSpx1CNtz7lUhYoupJFeIvquOqAqxUfpN
	AYIhBiG48ruSb7Ovl4d3Kx1uLKFtZQS+J68PWKeQhn55KbdAVJODr7E7l2AoGYpMKWoAiEp58sPPW
	6DLYV11XWJzPC8CeFEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy16-0000000CnLz-2qa0;
	Wed, 17 Jul 2024 06:19:56 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy13-0000000CnKU-1hTb
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:19:55 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a77c080b521so657866366b.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197192; x=1721801992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=731iNxkRio1CVh7O96GIueitOfVCcVF5gDjduzXxip0=;
        b=HENlsejnEXkk3ISAkboch6GYWSh0ErhFwOzNLSbDrtSykcVJE6V/h2MdInkySNHp+U
         SlHGJcPXTofCTjmgNkkylTQ7Pz7GZ0EJm4ovldEPWvWD5kGbU0suzW4h4Hir2O3UKSa1
         lbvqScFriaMwA2ry3Uxe1tlijr7E+xdl5Bpshv1m8XxlsqzyyUpU/A9v9OnNGhbzPG0f
         Lv3sAj+JDzMZzFqk68YRA2jbPeHEd5EV9jM2/ZbZGKWh3W2NvYwTHPEiK2ZNyJG/9aNc
         ksFh+/7A57pipMbpgZDCyXcLYjjL0bGFsP/U9tse6w1PTEBA1JT/4fSCS/01RlLF/tYO
         Xhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197192; x=1721801992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=731iNxkRio1CVh7O96GIueitOfVCcVF5gDjduzXxip0=;
        b=Nkw7Ex+wAm0xGYj55Rpqp2tISHOehDb9Qr4/DD1Pv4UTLR1w9j7bmhHtlUi0jeHmZJ
         7LPFcqAJR57D1P1rSotqfu0G2ZIaEyB+YxRqmYAZKpS52/9qlvtrk2VvHh6wYx+/Dvgp
         leSqDVOTyaq7ogA9UEifRaUzrfMU3BzOJjrw/vLMtulASjMLJs/XmbN3d1oYaeKsyDgP
         BZxwYL6MVvclJ7MbMgU5jgdf1zlxrnlzcoTVYzhSxrijU51nNvsWCu2sfaGdPX1X4oRm
         +gWhqgbOhDTH+i7d7AiHAOrqxfCsl1mBgEuOzO761S5svF8cpC58kNBToAg003tX/WyX
         mrow==
X-Forwarded-Encrypted: i=1; AJvYcCVCN4mE1MPWRNSYPE9ccmiKcw8Ymohf5t7wNfyZ6QBwYdM4bU8WOPtMJBIj+T7gAyR0ImgnhBUL3076fE+bAKo/i5UYmkXueyhDwbS5Lod2
X-Gm-Message-State: AOJu0Yx680I45cCSINQwt5YS5DgUJtn44m5Rbhw7DcYMMIHU7/pOJBLi
	mSGcVNU7cRBvhcErQZ5WFF9XmOazr6u0TiK+wIUklcXfJSkAeWeI0WG1GI2pm+BOcysv3mTSYXT
	yip97Ih3fSLSfp62Mk24doxDUaaOPOfnM/+41YA==
X-Google-Smtp-Source: AGHT+IGmCAjPv7zwB8K75fubJVOq5OlXEphacZcFqc1Ig0qaFbGDPSRSsM3ncZkf/6nf74oTzNfnAo1WxpGDhcAy0Fs=
X-Received: by 2002:a17:906:d297:b0:a77:9d57:97ad with SMTP id
 a640c23a62f3a-a7a011cbfa5mr48554866b.40.1721197191549; Tue, 16 Jul 2024
 23:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-11-alexghiti@rivosinc.com> <CAJF2gTSG7HzV7mgZpkWLbSBNn2dRv_NaSmCimd+kRdU=EZrmmg@mail.gmail.com>
 <CAHVXubizLq=qZgVQ2vBFe5zVuLRP0DGw=UN4U_Wkx2P2xsP3Mw@mail.gmail.com>
 <a096151c-c349-455f-8939-3b739d73f016@redhat.com> <CAJF2gTRrZwVk2xyhF_PsJGKCfkvun-rifG8MjDBcGDt3YBuhPg@mail.gmail.com>
 <CAHVXubh00OyazGP2C6sg0N2=kWqV-HXpzEiZCDdex8hcmLEM2g@mail.gmail.com> <CAJF2gTRpXBS-YotgEO=cPGnwjYiUyda_wk_fQfA6j_QqdYHoQw@mail.gmail.com>
In-Reply-To: <CAJF2gTRpXBS-YotgEO=cPGnwjYiUyda_wk_fQfA6j_QqdYHoQw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 17 Jul 2024 08:19:40 +0200
Message-ID: <CAHVXubia24OTad=NGAjcvYpPqJFutyZCy7KCH09R_=R3PAEanA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha extension
To: Guo Ren <guoren@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_231953_465512_627C37E5 
X-CRM114-Status: GOOD (  40.55  )
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

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMTA6MzHigK9BTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCAyOjQz4oCvUE0gQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBHdW8s
IFdhaW1hbiwKPiA+Cj4gPiBPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCAzOjA14oCvQU0gR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIEp1bCAxNiwg
MjAyNCBhdCAzOjMw4oCvQU0gV2FpbWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBPbiA3LzE1LzI0IDAzOjI3LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6
Cj4gPiA+ID4gPiBIaSBHdW8sCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gU3VuLCBKdWwgNywgMjAy
NCBhdCA0OjIw4oCvQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+
ID4+IE9uIFdlZCwgSnVuIDI2LCAyMDI0IGF0IDk6MTTigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4+PiBJbiBvcmRlciB0byBwcm9k
dWNlIGEgZ2VuZXJpYyBrZXJuZWwsIGEgdXNlciBjYW4gc2VsZWN0Cj4gPiA+ID4gPj4+IENPTkZJ
R19DT01CT19TUElOTE9DS1Mgd2hpY2ggd2lsbCBmYWxsYmFjayBhdCBydW50aW1lIHRvIHRoZSB0
aWNrZXQKPiA+ID4gPiA+Pj4gc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gaWYgWmFiaGEgaXMgbm90
IHByZXNlbnQuCj4gPiA+ID4gPj4+Cj4gPiA+ID4gPj4+IE5vdGUgdGhhdCB3ZSBjYW4ndCB1c2Ug
YWx0ZXJuYXRpdmVzIGhlcmUgYmVjYXVzZSB0aGUgZGlzY292ZXJ5IG9mCj4gPiA+ID4gPj4+IGV4
dGVuc2lvbnMgaXMgZG9uZSB0b28gbGF0ZSBhbmQgd2UgbmVlZCB0byBzdGFydCB3aXRoIHRoZSBx
c3BpbmxvY2sKPiA+ID4gPiA+PiBUaGF0J3Mgbm90IHRydWU7IHdlIHRyZWF0IHNwaW5sb2NrIGFz
IHFzcGlubG9jayBhdCBmaXJzdC4KPiA+ID4gPiA+IFRoYXQncyB3aGF0IEkgc2FpZDogd2UgaGF2
ZSB0byB1c2UgdGhlIHFzcGlubG9jayBpbXBsZW1lbnRhdGlvbiBhdAo+ID4gPiA+ID4gZmlyc3Qg
KmJlY2F1c2UqIHdlIGNhbid0IGRpc2NvdmVyIHRoZSBleHRlbnNpb25zIHNvb24gZW5vdWdoIHRv
IHVzZQo+ID4gPiA+ID4gdGhlIHJpZ2h0IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIGJlZm9yZSB0
aGUga2VybmVsIHVzZXMgYSBzcGlubG9jay4KPiA+ID4gPiA+IEFuZCBzaW5jZSB0aGUgc3Bpbmxv
Y2tzIGFyZSB1c2VkICpiZWZvcmUqIHRoZSBkaXNjb3Zlcnkgb2YgdGhlCj4gPiA+ID4gPiBleHRl
bnNpb25zLCB3ZSBjYW5ub3QgdXNlIHRoZSBjdXJyZW50IGFsdGVybmF0aXZlIG1lY2hhbmlzbSBv
ciB3ZSdkCj4gPiA+ID4gPiBuZWVkIHRvIGV4dGVuZCBpdCB0byBhZGQgYW4gImluaXRpYWwiIHZh
bHVlIHdoaWNoIGRvZXMgbm90IGRlcGVuZCBvbgo+ID4gPiA+ID4gdGhlIGF2YWlsYWJsZSBleHRl
bnNpb25zLgo+ID4gPiA+Cj4gPiA+ID4gV2l0aCBxc3BpbmxvY2ssIHRoZSBsb2NrIHJlbWFpbnMg
emVybyBhZnRlciBhIGxvY2svdW5sb2NrIHNlcXVlbmNlLiBUaGF0Cj4gPiA+ID4gaXMgbm90IHRo
ZSBjYXNlIHdpdGggdGlja2V0IGxvY2suIEFzc3VtaW5nIHRoYXQgYWxsIHRoZSBkaXNjb3Zlcnkg
d2lsbAo+ID4gPiA+IGJlIGRvbmUgYmVmb3JlIFNNUCBib290LCB0aGUgcXNwaW5sb2NrIHNsb3dw
YXRoIHdvbid0IGJlIGFjdGl2YXRlZCBhbmQKPiA+ID4gPiBzbyB3ZSBkb24ndCBuZWVkIHRoZSBw
cmVzZW5jZSBvZiBhbnkgZXh0ZW5zaW9uLiBJIGJlbGlldmUgdGhhdCBpcyB0aGUKPiA+ID4gPiBt
YWluIHJlYXNvbiB3aHkgcXNwaW5sb2NrIGlzIHVzZWQgYXMgdGhlIGluaXRpYWwgZGVmYXVsdCBh
bmQgbm90IHRpY2tldAo+ID4gPiA+IGxvY2suCj4gPiA+IFRoeCBXYWltYW4sCj4gPiA+IFllcywg
cXNwaW5sb2NrIGlzIGEgY2xlYW4gZ3V5LCBidXQgdGlja2V0IGxvY2sgaXMgYSBkaXJ0eSBvbmUu
Cj4gPgo+ID4gR3V5cywgd2UgYWxsIGFncmVlIG9uIHRoYXQsIHRoYXQncyB3aHkgSSBrZXB0IHRo
aXMgYmVoYXZpb3VyIGluIHRoaXMgcGF0Y2hzZXQuCj4gPgo+ID4gPgo+ID4gPiBIaSBBbGV4YW5k
cmUsCj4gPiA+IFRoZXJlZm9yZSwgdGhlIHN3aXRjaCBwb2ludChiZWZvcmUgcmVzZXRfaW5pdCgp
KSBpcyBsYXRlIGVub3VnaCB0bwo+ID4gPiBjaGFuZ2UgdGhlIGxvY2sgbWVjaGFuaXNtLCBhbmQg
dGhpcyBzYXRpc2ZpZXMgdGhlIHJlcXVpcmVtZW50cyBvZgo+ID4gPiBhcHBseV9ib290X2FsdGVy
bmF0aXZlcygpLCBhcHBseV9lYXJseV9ib290X2FsdGVybmF0aXZlcygpLCBhbmQKPiA+ID4gYXBw
bHlfbW9kdWxlX2FsdGVybmF0aXZlcygpLgo+ID4KPiA+IEkgY2FuJ3QgZmluZCByZXNldF9pbml0
KCkuCj4gU29ycnkgZm9yIHRoZSB0eXBvLCByZXN0X2luaXQoKQo+ID4KPiA+IFRoZSBkaXNjb3Zl
cnkgb2YgdGhlIGV4dGVuc2lvbnMgaXMgZG9uZSBpbiByaXNjdl9maWxsX2h3Y2FwKCkgY2FsbGVk
Cj4gPiBmcm9tIHNldHVwX2FyY2goKQo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jI0wyODguCj4gPiBTbyAq
YmVmb3JlKiB0aGlzIHBvaW50LCB3ZSBoYXZlIG5vIGtub3dsZWRnZSBvZiB0aGUgYXZhaWxhYmxl
Cj4gPiBleHRlbnNpb25zIG9uIHRoZSBwbGF0Zm9ybS4gIExldCdzIGltYWdpbmUgbm93IHRoYXQg
d2UgdXNlIGFuCj4gPiBhbHRlcm5hdGl2ZSBmb3IgdGhlIHFzcGlubG9jayBpbXBsZW1lbnRhdGlv
biwgaXQgd2lsbCBsb29rIGxpa2UgdGhpcwo+ID4gKEkgdXNlIG9ubHkgemFiaGEgaGVyZSwgdGhh
dCdzIGFuIGV4YW1wbGUpOgo+ID4KPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3Bp
bmxvY2suaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGlubG9jay5oCj4gPiBA
QCAtMTYsOCArMTYsMTIgQEAgREVDTEFSRV9TVEFUSUNfS0VZX1RSVUUocXNwaW5sb2NrX2tleSk7
Cj4gPiAgI2RlZmluZSBTUElOTE9DS19CQVNFX0RFQ0xBUkUob3AsIHR5cGUsIHR5cGVfbG9jaykg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB0eXBlIGFy
Y2hfc3Bpbl8jI29wKHR5cGVfbG9jayBsb2NrKSAgICAgICAgICAgICBcCj4gPiAgeyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiAtICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZxc3BpbmxvY2tf
a2V5KSkgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIHF1
ZXVlZF9zcGluXyMjb3AobG9jayk7ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAg
ICAgIGFzbSBnb3RvKEFMVEVSTkFUSVZFKCJqICVbbm9femFiaGFdIiwgIm5vcCIsIDAsICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJJ
U0NWX0lTQV9FWFRfWkFCSEEsIDEpICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICA6IDogOiA6IG5vX3phYmhhKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICByZXR1cm4gcXVldWVkX3NwaW5fIyNvcChs
b2NrKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gK25vX3phYmhhOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgICByZXR1cm4gdGlja2V0X3NwaW5fIyNvcChsb2NrKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gIH0KPiA+Cj4gPiBhcHBseV9lYXJseV9ib290
X2FsdGVybmF0aXZlcygpIGNhbid0IGJlIHVzZWQgdG8gcGF0Y2ggdGhlIGFib3ZlCj4gPiBhbHRl
cm5hdGl2ZSBzaW5jZSBpdCBpcyBjYWxsZWQgZnJvbSBzZXR1cF92bSgpLCB3YXkgYmVmb3JlIHdl
IGtub3cgdGhlCj4gPiBhdmFpbGFibGUgZXh0ZW5zaW9ucy4KPiA+IGFwcGx5X2Jvb3RfYWx0ZXJu
YXRpdmVzKCksIGluc3RlYWQsIGlzIGNhbGxlZCBhZnRlciByaXNjdl9maWxsX2h3Y2FwKCkKPiA+
IGFuZCB0aGVuIHdpbGwgYmUgYWJsZSB0byBwYXRjaCB0aGUgYWx0ZXJuYXRpdmVzIGNvcnJlY3Rs
eQo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNo
L3Jpc2N2L2tlcm5lbC9zZXR1cC5jI0wyOTAuCj4gPgo+ID4gQnV0IHRoZW4sIGJlZm9yZSBhcHBs
eV9ib290X2FsdGVybmF0aXZlcygpLCBhbnkgdXNlIG9mIGEgc3BpbmxvY2sKPiA+IChwcmludGsg
ZG9lcyBzbykgd2lsbCB1c2UgYSB0aWNrZXQgc3BpbmxvY2sgaW1wbGVtZW50YXRpb24sIGFuZCBu
b3QKPiA+IHRoZSBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24uIEhvdyBkbyB5b3UgZml4IHRoYXQ/
Cj4gV2h5ICJiZWZvcmUgYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMoKSwgYW55IHVzZSBvZiBhIHNw
aW5sb2NrIChwcmludGsKPiBkb2VzIHNvKSB3aWxsIHVzZSBhIHRpY2tldCBzcGlubG9jayBpbXBs
ZW1lbnRhdGlvbiIgPwo+IFdlIHRyZWF0IHFzcGlubG9jayBhcyB0aGUgaW5pdGlhbCBzcGlubG9j
ayBmb3JldmVyLCBzbyB0aGVyZSBpcyBvbmx5Cj4gcXNwaW5sb2NrIC0+IHRpY2tldF9sb2NrIGRp
cmVjdGlvbiBhbmQgbm8gcmV2ZXJzZS4KCkNhbiB5b3UgcGxlYXNlIHByb3ZpZGUgYW4gaW1wbGVt
ZW50YXRpb24gb2Ygd2hhdCB5b3Ugc3VnZ2VzdCB1c2luZyB0aGUKY3VycmVudCBhbHRlcm5hdGl2
ZXMgdG9vbHM/IEknbSBhYm91dCB0byBzZW5kIHRoZSB2MyBvZiB0aGlzIHNlcmllcywKeW91IGNh
biB1c2UgdGhpcyBhcyBhIGJhc2UuCgpUaGFua3MsCgpBbGV4Cgo+Cj4gPgo+ID4gPgo+ID4gPiA+
Cj4gPiA+ID4gQ2hlZXJzLAo+ID4gPiA+IExvbmdtYW4KPiA+ID4gPgo+ID4gPgo+ID4gPgo+ID4g
PiAtLQo+ID4gPiBCZXN0IFJlZ2FyZHMKPiA+ID4gIEd1byBSZW4KPgo+Cj4KPiAtLQo+IEJlc3Qg
UmVnYXJkcwo+ICBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
