Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD9ACA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxC1DbMwUFhRUBS+LuvEi6Gn0YswsYvaLKKGQzqsPCM=; b=glVORfeZhiJbsw
	j4xNK+EaaOaA/ZtuNsYD6gT1sHyys8f0QWb9/DkYq+2M3CtH6BXaVRM7xKpNZ9TyrjuElguxNgmgm
	1xdnnTqj0F38Cyy9JwUIePpNYcm1lZlAt2n6d2Ic+2apTOo/hCAIKbyhHmffwIJX7UF1XLq8RFjt5
	RGhjUw2ef3jwCAuI6OYpGaYHqiToUcDk1DZJDZF00jExglhfH0lylcW2YtebLvNYRJpvWneRQhI2T
	aXNR/SJINvE2AcfVM6GdvDi/x8hyMr9TXC2dS3Zday2bjv6QFAPnOIqELefSJovwLnOt35lSOni7J
	31mS+iwr7o4KKoKXhN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz1h-0000000Fz9S-3rdd;
	Thu, 21 Aug 2025 06:43:57 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoykt-0000000FxBE-2tfO
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 06:26:37 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-333f8ef379dso5584911fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 23:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755757593; x=1756362393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dvy5yQKV8vAz0HPfmKCuQpd8fq7qI9/IN8Rzy62sQac=;
        b=Eecme8TTfij4HJfIbD/pS4hYrl1i1lHq+V5/g0gVpP2AXstZqDwv95PgC17Wey7Yly
         adFezUnQwXabHtDApjQwBpmj/acHCFlLmHcPRRD4lpB1IuUBD238sTPNh4Hcj3f7+XjH
         Rc1gGhDOH6a96Hbr6RT071jCnWJj31jdHKdjzXpy4nPe+KsZ4g/HWZXxzWeuO92I75NZ
         ofdiqYIX59zqGb35qCy8g+q7Rs9668m27g7Nn80SOD7Ih2/gl95TZCmZxH3TF1Zm0bpl
         pKlMDCDspHqZMWbOF0Dl8uAlBGj/FCwQReRWBj2PEP9oA07iUxcmUzR9/oX0v1cbUxzJ
         Ue1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755757593; x=1756362393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dvy5yQKV8vAz0HPfmKCuQpd8fq7qI9/IN8Rzy62sQac=;
        b=jEEp1hdzWrM/xGm5afCdsdWEQNrNAnPCHs3uuJxIeXCbouJYdfZXSmnSQ9DDblhuQq
         CdJSGH0mTQnV/V/MsSdWdXq/e4sh2LULrN9AN8eoGYFLhfH9RQrY3zTTA/rzbC9r6aEy
         2CvtLO489Kqu2G065znT+IYmlnM1ccKIAWNMr0cXm0YkD1BTH6Miz3cwNCUGPOes+61p
         +AMPi2m/D3RvUiqR5N0xQOX+pbUep8WdrIOTEFHIZa5rboRoay5ZRbMhwHnA1l5xRYDv
         YEaDEOXcZTJN2aWropOWdhwyoeISpE0H9PuZpgPMQ9bhWEJIW8V0KHVnvcw5dME9AXoO
         klaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3akQMei018Og9oHV/eoNfsbFFfecFVNnDsEaTpJXcgE5YuAkJGNgY2g0X8pvYDU7JMNghNzt6exUplQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfUSsHStpkbF/S1NgCtitU3E0xUpVMlUy/sxlKG0NcNk4N6fpn
	c86Ls/hDuqETC9WG1HbtW191vxX72yKsp+o4UsClLvpEl+a+pARBDzk+jDQSjz5m4cf3L2OIup7
	AfT2fEWRH2w9Xh30svWpSEbpv8xmykjXbYxLAADqUyg==
X-Gm-Gg: ASbGnctJcFo6VlP/tPHXrft9NykI0wdc0tRqzySCNUfHwuTigFeCrBjqsP5IpeP7IRF
	n7cNrQ2trGDzolbdrKi/orPp/jg8tTGyi1LDfbHXtkz1eeDHbBLkqFxCm6LA8colWHcy3mDBhTe
	FCpA8bIhYrmn5D3GvSyHBxKapsw6yAa8RAXuti+VE72jjVI8g9UAekL7RoF3N1O18qKrxhJP2Bc
	3cjn1uO
X-Google-Smtp-Source: AGHT+IEmIpMzL2p0sePSaEQtsWGN7GzTW2rQrcL+IxbKSsSK5y/EXzsfv2bar47BDvSltEwnO/2h5O/l0DwBJFe20eA=
X-Received: by 2002:a05:651c:2352:20b0:333:b6b1:a151 with SMTP id
 38308e7fff4ca-33549e43bd1mr2751101fa.7.1755757593442; Wed, 20 Aug 2025
 23:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <DC5HEJRMZ84K.34OPU922A7XBE@ventanamicro.com> <CAK9=C2X8-DBi7qQ87kMA0AiVdiFH0_4L4mzzZzbeCg2eiNm8Qg@mail.gmail.com>
 <DC6DLP13J0LA.XW9J3XFBCM1Y@ventanamicro.com> <CAK9=C2VA2jswYm_yxYsCaGKUkJT46rxUH-6OKdsApMZ8nhkrQw@mail.gmail.com>
 <DC6L3PG5HP48.2J8TC1JZHMJVO@ventanamicro.com>
In-Reply-To: <DC6L3PG5HP48.2J8TC1JZHMJVO@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 21 Aug 2025 11:56:21 +0530
X-Gm-Features: Ac12FXyapBEN33sNaasfC13xpNgk4ysy5dm8Jpk-um4MizahmUqGfRu3V32Rwxw
Message-ID: <CAK9=C2Uk-mL251XUVNtbU52KFuu+=sUR5-_=haAHmTACVDBQhA@mail.gmail.com>
Subject: Re: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_232635_724635_FA2DC6E6 
X-CRM114-Status: GOOD (  41.48  )
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

T24gVHVlLCBBdWcgMTksIDIwMjUgYXQgMTE6MDXigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTA4LTE5VDIxOjIyOjI3KzA1OjMw
LCBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT46Cj4gPiBPbiBUdWUsIEF1ZyAx
OSwgMjAyNSBhdCA1OjEz4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNy
by5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gMjAyNS0wOC0xOVQxMjowMDo0MyswNTozMCwgQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Ogo+ID4+ID4gT24gTW9uLCBBdWcgMTgsIDIw
MjUgYXQgMzo1OeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+PiA+Pgo+ID4+ID4+IDIwMjUtMDgtMTRUMjE6MjU6NDIrMDU6MzAsIEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPiA+PiA+PiA+IFRoaXMgc2VyaWVzIGFk
ZHMgT05FX1JFRyBpbnRlcmZhY2UgZm9yIFNCSSBGV0ZUIGV4dGVuc2lvbiBpbXBsZW1lbnRlZAo+
ID4+ID4+ID4gYnkgS1ZNIFJJU0MtVi4KPiA+PiA+Pgo+ID4+ID4+IEkgdGhpbmsgaXQgd291bGQg
YmUgYmV0dGVyIHRvIE9ORV9SRUcgdGhlIENTUnMgKG1lZGVsZWcvbWVudmNmZyksIG9yIGF0Cj4g
Pj4gPj4gbGVhc3QgZXhwb3NlIHRoZWlyIENTUiBmaWVsZHMgKGVhY2ggc2Vuc2libGUgbWVkZWxl
ZyBiaXQsIFBNTSwgLi4uKQo+ID4+ID4+IHRocm91Z2gga3ZtX3Jpc2N2X2NvbmZpZywgdGhhbiB0
byBjb3VwbGUgdGhpcyB3aXRoIFNCSS9GV0ZULgo+ID4+ID4+Cj4gPj4gPj4gVGhlIGNvbnRyb2xs
ZWQgYmVoYXZpb3IgaXMgZGVmaW5lZCBieSB0aGUgSVNBLCBhbmQgdXNlcnNwYWNlIG1pZ2h0IHdh
bnQKPiA+PiA+PiB0byBjb25maWd1cmUgdGhlIFMtbW9kZSBleGVjdXRpb24gZW52aXJvbm1lbnQg
ZXZlbiB3aGVuIFNCSS9GV0ZUIGlzIG5vdAo+ID4+ID4+IHByZXNlbnQsIHdoaWNoIGlzIG5vdCBw
b3NzaWJsZSB3aXRoIHRoZSBjdXJyZW50IGRlc2lnbi4KPiA+PiA+Pgo+ID4+ID4+IElzIHRoZXJl
IGEgYmVuZWZpdCBpbiBleHByZXNzaW5nIHRoZSBJU0EgbW9kZWwgdGhyb3VnaCBTQkkvRldGVD8K
PiA+PiA+Pgo+ID4+ID4KPiA+PiA+IEV4cG9zaW5nIG1lZGVsZWcvbWVudmNmZyBpcyBub3QgdGhl
IHJpZ2h0IGFwcHJvYWNoIGJlY2F1c2UgYQo+ID4+ID4gR3Vlc3QvVk0gZG9lcyBub3QgaGF2ZSBN
LW1vZGUgaGVuY2UgaXQgaXMgbm90IGFwcHJvcHJpYXRlIHRvCj4gPj4gPiBleHBvc2UgbTx4eXo+
IENTUnMgdmlhIE9ORV9SRUcgaW50ZXJmYWNlLiBUaGlzIGFsc28gYWxpZ25zCj4gPj4gPiB3aXRo
IEgtZXh0ZW5zaW9uIGFyY2hpdGVjdHVyZSB3aGljaCBkb2VzIG5vdCB2aXJ0dWFsaXplIE0tbW9k
ZS4KPiA+Pgo+ID4+IFdlIGFscmVhZHkgaGF2ZSBtdmVuZG9yaWQsIG1hcmNoaWQsIGFuZCBtaXBp
ZCBpbiBrdm1fcmlzY3ZfY29uZmlnLgo+ID4KPiA+IFRoZSBtdmVuZG9yaWQsIG1hcmNoaWQsIGFu
ZCBtaXBpZCBhcmUgYWNjZXNzaWJsZSB2aWEgU0JJIEJBU0UKPiA+IGV4dGVuc2lvbiBidXQgbm90
IGFueSBvdGhlciBNLW1vZGUgQ1NScyBoZW5jZSB0aGVzZSBhcmUgc3BlY2lhbC4KPiA+Cj4gPj4K
PiA+PiBUaGUgdmlydHVhbGl6ZWQgTS1tb2RlIGlzIHVzZXJzcGFjZStLVk0uICAoS1ZNIGRvZXNu
J3QgYWxsb3cgdXNlcnNwYWNlCj4gPj4gdG8gY29uZmlndXJlIG1vc3QgdGhpbmdzIG5vdywgYnV0
IEkgdGhpbmsgd2UnbGwgaGF2ZSB0byBjaGFuZ2UgdGhhdCB3aGVuCj4gPj4gZ2V0dGluZyByZWFk
eSBmb3IgcHJvZHVjdGlvbi4pCj4gPgo+ID4gVGhlIFJJU0MtViBhcmNoaXRlY3R1cmUgaXMgbm90
IGRlc2lnbmVkIHRvIHZpcnR1YWxpemUgTS1tb2RlCj4gPiBhbmQgdGhlcmUgaXMgbm8gcHJhY3Rp
Y2FsIHVzZS1jYXNlIGZvciB2aXJ0dWFsaXplZCBNLW1vZGUgaGVuY2UKPiA+IFdFIFdPTidUIEJF
IFNVUFBPUlRJTkcgSVQgSU4gS1ZNIFJJU0MtVi4KPgo+IE9oLCBzb3JyeSBmb3IgdGhlIG1pc3Vu
ZGVyc3RhbmRpbmcsIEknbGwgYmUgY2xlYXJlciBuZXh0IHRpbWUgYW5kIHRhbGsKPiBhYm91dCBp
bXBsZW1lbnRhdGlvbiBvZiB0aGUgc3VwZXJ2aXNvciBleGVjdXRpb24gZW52aXJvbm1lbnQuCj4g
S1ZNK3VzZXJzcGFjZSBwcm92aWRlcyBTRUUgdG8gdGhlIFZTLW1vZGUsIHdoaWNoIGlzIHRvIFZT
LW1vZGUgYXMgd2hhdAo+IE0tbW9kZSBpcyB0byBTLW1vZGUsIGhlbmNlIEkgY2FsbGVkIEtWTSt1
c2Vyc3BhY2UgYSB2aXJ0dWFsaXplZCBNLW1vZGUuCj4KPiA+IEZZSSwgdGhlIEtWTSBBUk02NCBk
b2VzIG5vdCB2aXJ0dWFsaXplIEVMMyBlaXRoZXIgYW5kIGl0IGlzCj4gPiBhbHJlYWR5IGluIHBy
b2R1Y3Rpb24gc28gcGxlYXNlIHN0b3AgbWFraW5nIHJhbmRvbSBhcmd1bWVudHMKPiA+IGZvciBy
ZXF1aXJpbmcgdmlydHVhbGl6ZWQgTS1tb2RlIGZvciBwcm9kdWN0aW9uLgo+Cj4gWWVhaCwgSSBh
Z3JlZSB0aGF0IHdlIGRvbid0IG5lZWQgaXQsIEkganVzdCBoYWQgdG8gcHJvdmlkZSBzbyBtYW55
Cj4gZXhhbXBsZXMgaW4gdGhlIHByZXZpb3VzIGRpc2N1c3Npb24gdGhhdCBJIHdlbnQgaW50byBx
dWl0ZSBuaWNoZSBjYXNlcy4KPgo+IFRoZSBpbmNyZWFzZWQgZmxleGliaWxpdHkgaXMgc2ltaWxh
cmx5IHVzZWZ1bCBmb3IgbW9yZSBpbXBvcnRhbnQgY2FzZXM6Cj4gd2UgY2FuJ3QgYXZvaWQgInZp
cnR1YWxpemVkIE0tbW9kZSIvU0VFLCBidXQgd2UgZG9uJ3QgaGF2ZSB0byBjb21wbGV0ZWx5Cj4g
aW1wbGVtZW50IGl0IGluIEhTLW1vZGUuCj4KPiA+PiBGb3IgZ2VuZXJhbCB2aXJ0dWFsaXphdGlv
biwgd2Ugd2FudCB0byBiZSBhYmxlIHRvIGNvbmZpZ3VyZSB0aGUKPiA+PiBmb2xsb3dpbmcgYmVo
YXZpb3IgZm9yIGVhY2ggZXhjZXB0aW9uIHRoYXQgd291bGQgZ28gdG8gdGhlIHZpcnR1YWxpemVk
Cj4gPj4gTS1tb2RlOgo+ID4+ICAgMCkgZGVsZWdhdGVkIHRvIHRoZSBndWVzdAo+ID4+ICAgMSkg
aW1wbGVtZW50ZWQgYnkgdXNlcnNwYWNlCj4gPj4gICAyLU4pIGltcGxlbWVudGF0aW9ucyBieSBL
Vk0gKGlkZWFsbHkgemVybyBvciBvbmUpCj4gPj4KPiA+PiBXZSBjYW4gaGF2ZSBtZWRlbGVnLCBh
bmQgYW5vdGhlciBtZXRob2QgdG8gZGVjaWRlIGhvdyB0byBoYW5kbGUgdHJhcHBlZAo+ID4+IGV4
Y2VwdGlvbnMsIGJ1dCBpdCBwcm9iYWJseSBtYWtlcyBtb3JlIHNlbnNlIHRvIGhhdmUgYSBwZXIt
ZXhjZXB0aW9uCj4gPj4gT05FX1JFRyB0aGF0IHNldHMgaG93IGVhY2ggZXhjZXB0aW9uIGJlaGF2
ZXMuCj4gPj4KPiA+Cj4gPiBObyBwb2ludGluZyBpbiBkaXNjdXNzaW5nIHRoaXMgZnVydGhlciBz
aW5jZSB3ZSB3b24ndCBiZSBzdXBwb3J0aW5nCj4gPiB2aXJ0dWFsaXplZCBNLW1vZGUuCj4KPiBJ
IHVuZGVyc3RhbmQsIGJhY2sgdG8gdGhlIGN1cnJlbnQgc2VyaWVzOgo+Cj4gSSB0aGluayB3ZSBu
ZWVkIHRvIHByb3ZpZGUgbWVhbnMgd2l0aCB3aGljaCB1c2Vyc3BhY2UgY2FuIGNvbnRyb2wgd2hp
Y2gKPiBGV0ZUIGZlYXR1cmVzIGFyZSBlbmFibGVkLCBiZWNhdXNlIEtWTSBqdXN0IGV4cG9zZXMg
ZXZlcnl0aGluZyBpdCBrbm93Cj4gYW5kIGhhcmR3YXJlIHN1cHBvcnRzIHJpZ2h0IG5vdzoKPiAg
MSkgTWlncmF0aW9uIGJldHdlZW4gZGlmZmVyZW50IHN5c3RlbXMgd291bGQgYmUgaGluZGVyZWQK
PiAgMikgV2UgY291bGRuJ3QgYWRkIG1vcmUgRldGVCBmZWF0dXJlcyB3aXRob3V0IGJyZWFraW5n
IHRoZSBTRUUKClRoZSBGV0ZUIGZlYXR1cmVzIGFyZSBkZWZpbmVkIHRvIGJlIGJhY2t3YXJkIGNv
bXBhdGlibGUgYnkgU0JJIHNwZWMKYW5kIHRoZXNlIGZlYXR1cmVzIG9ubHkgYWZmZWN0IGFmdGVy
IEd1ZXN0L1ZNIGhhcyBjb25maWd1cmVkIHRoZW0uIFRoaXMKbWVhbnMgaWYgYSBHdWVzdC9WTSBp
cyBub3QgYXdhcmUgb2YgU0JJIEZXRlQgdGhlbiBpdCB3b24ndCBjb25maWd1cmUKRldGVCBmZWF0
dXJlcyBhbmQgR3Vlc3QvVk0gc2hvdWxkIHN0aWxsIHdvcmsgZmluZS4KCj4KPiBUaGUgKDIpIGlz
IHNpbWlsYXIgdG8gaG93IHdlIG11c3Qgc2V0ICIuZGVmYXVsdF9kaXNhYmxlZCA9IHRydWUiIHRv
Cj4gY3VycmVudCBGV0ZULCBiZWNhdXNlIEtWTSBjYW4ndCBiZSBjaGFuZ2luZyB0aGUgU0VFIGZv
ciB1c2Vyc3BhY2UuCgpOb3QgbmVlZGVkLiBXZSBvbmx5IGtlZXAgYW4gU0JJIGV4dGVuc2lvbiBk
aXNhYmxlZCBieSBkZWZhdWx0IGlmCml0IGlzIGJlaW5nIGZvcndhcmRlZCB0byBLVk0gdXNlcnNw
YWNlIChlLmcuIERCQ04sIFNVU1ApIGJlY2F1c2UKS1ZNIHVzZXJzcGFjZSBuZWVkcyB0byBvcHQt
aW4gZm9yIHN1Y2ggU0JJIGV4dGVuc2lvbiBoYW5kbGluZy4gSW4gb3RoZXIKY2FzZXMsIHRoZSBT
QkkgZXh0ZW5zaW9uIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBhbmQgS1ZNIHVzZXJzcGFjZSBjYW4K
ZXhwbGljaXRseSBkaXNhYmxlIGl0IGZvciBHdWVzdC9WTSB1c2luZyBPTkVfUkVHIGludGVyZmFj
ZS4gVGhpcyBpcyB0cnVlCmZvciBJU0EgZXh0ZW5zaW9ucyBhcyB3ZWxsLgoKPgo+IERvIHlvdSB3
YW50IG1lIHRvIHNlbmQgYSBwYXRjaCB0aGF0IGludmVydHMgdGhlIGRlZmF1bHQsIHRvIG1ha2Ug
YWxsCj4gZnV0dXJlIFNCSSBleHRlbnNpb24gc3RhcnQgYXMgZGlzYWJsZWQsIHNvIHdlIGNhbid0
IGVhc2lseSByZXBlYXQgdGhlCj4gbWlzdGFrZSBpbiB0aGUgZnV0dXJlPwoKTm8gbmVlZCB0byBz
ZW5kIGFueSBwYXRjaC4gUGxlYXNlIGZvY3VzIG9uIHlvdXIgY3VycmVudCBhc3NpZ25tZW50cy4K
ClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
