Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E605DC83F01
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 03:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nikTQGfkFNjRI9q8VuWwwFDuECaATZRQEzNc/BxYRBs=; b=hLcr0esrxQydH2
	/YHPw3MFi+z1QupgI/wNA/4eAcMw2cPFPqift+VubDn7iE5DxB8tLhXXJzS93eYIdpPHOViUgecpm
	75FQlJJ5KiAkBPYv0g7sJBZnaNPRPCq8TWwwOgzKaNHgT8pUe2TfdP+5ybSpAv2DmWXR+I3HPkSFy
	gojik2Dnv7snhND8OlxHWZioKXOxjSbcAxRrvgfTCIPmzTtc1FP2DOODrF7kdJjJJXCrGkMCsZAha
	tckJJxFemysohv6szV8gCK0zsOxnAMPqvud/dWtVVQApOyheHmrhJJi+b4kYWvuXy8P7rjeQVM43I
	57sZP0lqsnNxERRMGLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaT0t-008nVg-1d;
	Mon, 28 Aug 2023 03:34:03 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaT0q-008nVI-2J
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 03:34:02 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-412178dde5bso9365771cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 20:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1693193638; x=1693798438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HeGPt3+EuEODvgoPgyRNpJ9/0YQFT8QVdMcdHP7F20=;
        b=je5I5dHsumfmTQUca+FnrARei6z4hq+4KcUVtJuO2zzQNpSeeWFGc17j8+0kjBtIgO
         EsoxVkNpvfTX8IBUE4kj/zOilNtfWOo7DEbrDl1tbTF3a1CkYcuP/hUGQ4bZvnGgFz2g
         iWS/mkU1TZNePEh8VdiZHFwMjlBg+xew0kULgQIJmfIQraifmewwhrLCCht5cpsqkBt9
         u4BAYajGJ5n/hGqbI/A/EZ6ZKZU971ZCqAQN/3syX6VrlDKdvMwkVhw60SGyy8Sf5Duk
         0QgIONzkZc+8kryI+2pG9vXSI9xta349phiE4EKam8Xh1BJFxvHShVMNii9a7OdxwtfK
         dgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693193638; x=1693798438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HeGPt3+EuEODvgoPgyRNpJ9/0YQFT8QVdMcdHP7F20=;
        b=j+sCLsgniSfOpexM4zFAI/U7fqixNopxXc2mwt2hXh6rNI3wpWFlz/X334NZKz30Qz
         vVo9LF+NM1ULRwpUMDOIpNh+TNWo0H+fVlDEjdjDK1tZJal4FSQgxMtrghY7nR1Koghi
         /N5l9sIknxkk+XGD6OGH7S1qelx6YGFvsincsM/9vrE8OHc3eP3zxluiypIs1FoyhgvM
         Q491MKSJA84wH7zoGxSqmdd4p7YLHHGoEOVknSv8C7uTAwndvLDOgH2/O2uYMnx6P8yW
         qB4dNJdzMMU7F96Hoc6n9c/OVMdyVlvboITL2SUl9d6znc2DBxgIn/yBRtFsN+ZOtTiZ
         bSTQ==
X-Gm-Message-State: AOJu0YzYT63r07nbNTe/O1dq2yNKwagvo2A32BqUR1hHzd1K4DpugwZa
	rrFEnBQeseTtU0ZoXn6gg3T96dqB0agHIDQAwZ7QJA==
X-Google-Smtp-Source: AGHT+IFaiNEm2e/siz5yB5OiNvdSslRLdCK9embs6Sxsv+3vMVbW3yjPRnybhmIAJEsKE5B+6HkH8ha2NXUECqjtgfo=
X-Received: by 2002:ac8:570d:0:b0:405:3dcf:1182 with SMTP id
 13-20020ac8570d000000b004053dcf1182mr28059185qtw.50.1693193638447; Sun, 27
 Aug 2023 20:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230822054739.33552-1-nick.hu@sifive.com> <CAAhSdy32DYoHpBKS3TF1SapM5fuMF5K00oqRxw8JF05v=DrUuw@mail.gmail.com>
 <CAKddAkDohdZqhjZKSawTg5NLMs0AXkL9SyYQr1q6vM1vm4Csfw@mail.gmail.com>
 <CAAhSdy0Yt-xcDYWz9BJCUgErpC2xM97yMXw4Wto078DKNk1nUg@mail.gmail.com>
 <CAKddAkBqUAwhftCiyoF3=tFM9cGTOnkYzeO=Cvsm3L7HAhiTMQ@mail.gmail.com> <CAAhSdy3+0dReF9mj2aLo725Yc6co3sKNjjRw2QUCe0K_iWipFQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3+0dReF9mj2aLo725Yc6co3sKNjjRw2QUCe0K_iWipFQ@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 28 Aug 2023 11:33:47 +0800
Message-ID: <CAKddAkDPG-XC8jD9Di+qMt9dNyScHoG58Qbe6Dd7BgQCqEXukA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: suspend: Add syscore ops for suspend
To: Anup Patel <anup@brainfault.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Andy Chiu <andy.chiu@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_203400_774072_FD9F62F5 
X-CRM114-Status: GOOD (  43.66  )
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

SGkgQW51cAoKT24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgOTo0NOKAr1BNIEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgODoz
OOKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQW51
cAo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFja3MKPiA+IE9uIFR1ZSwgQXVnIDIyLCAy
MDIzIGF0IDU6MTfigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMToyOOKAr1BNIE5pY2sgSHUgPG5p
Y2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIaSBBbnVwCj4gPiA+ID4K
PiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDI6MTbigK9QTSBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBU
dWUsIEF1ZyAyMiwgMjAyMyBhdCAxMToxN+KAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IElmIGEgdGFzayBpcyB0aGUgb25lIHdo
byBwZXJmb3JtcyB0aGUgc3VzcGVuZCBmbG93IGFuZCBpdCBhbHNvIGRvIHNvbWUKPiA+ID4gPiA+
ID4gZmxvYXRpbmcgb3IgdmVjdG9yIG9wZXJhdGlvbnMgYmVmb3JlIHRoZSBzdXNwZW5kLCB3ZSBt
aWdodCBsb3NlIHRoZSBGUFUKPiA+ID4gPiA+ID4gYW5kIHZlY3RvciBzdGF0ZXMgd2hlbiBpdCBn
b2VzIHRvIHRoZSBub24tcmV0ZW50aW9uIHN5c3RlbSBzdXNwZW5kIHN0YXRlLgo+ID4gPiA+ID4g
PiBBZGQgc3lzY29yZSBvcHMgdG8gc2F2ZSBhbmQgcmVzdG9yZSB0aGUgRlBVIGFuZCB2ZWN0b3Ig
c3RhdGVzIG9mIHRoZQo+ID4gPiA+ID4gPiBjdXJyZW50IHRhc2sgdG8gZml4IHRoZSBpc3N1ZSBh
Ym92ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIG9ubHkgYXBwbGllcyB0byBub24tcmV0ZW50
aXZlIHN5c3RlbSBzdXNwZW5kIHNvIHdoeSBkbyB3ZSBuZWVkCj4gPiA+ID4gPiB0aGlzIGJlZm9y
ZSBTQkkgc3lzdGVtIHN1c3BlbmQgaXMgbWVyZ2VkID8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZWdh
cmRzLAo+ID4gPiA+ID4gQW51cAo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gSG93IGFib3V0
IGhpYmVybmF0aW9uPwo+ID4gPgo+ID4gPiBJZiB0aGlzIGlzIGZvciBoaWJlcm5hdGlvbiB0aGVu
IHRoZSBjb21taXQgZGVzY3JpcHRpb24gc2hvdWxkIHNheSBzby4KPiA+ID4KPiA+IEFjdHVhbGx5
IHRoaXMgY29tbWl0IGlzIGZvciB0aGUgc3VzcGVuZC10by1yYW0uIEkgYXNrIGFib3V0Cj4gPiBo
aWJlcm5hdGlvbiBoZXJlIGJlY2F1c2UgSSB0aGluayBoaWJlcm5hdGlvbiBtYXkgYWxzbyBoYXZl
IHRoZSBzYW1lCj4gPiBpc3N1ZSB0b28uCj4gPiBJZiBoaWJlcm5hdGlvbiBkb2Vzbid0IG5lZWQg
aXQsIEkgY2FuIGRlZmVyIHRoaXMgcGF0Y2ggdW50aWwgd2UgaGF2ZQo+ID4gc3lzdGVtIHN1c3Bl
bmQuCj4gPiBJIHNlbmQgdGhpcyBwYXRjaCBiZWNhdXNlIEkgYmVsaWV2ZSB3ZSB3aWxsIHN1cHBv
cnQgc3lzdGVtIHN1c3BlbmQgaW4KPiA+IHRoZSBrZXJuZWwgc29vbiBvciBsYXRlciBhbmQgdGhl
IGhpYmVybmF0aW9uIG1pZ2h0IG5lZWQgaXQgbm93Lgo+Cj4gT2theSwgdW5kZXJzdG9vZC4KPgo+
ID4KPiA+ID4gQWRkaW5nIHN5c2NvcmVfb3BzIHdvdWxkIG1lYW4gdGhlc2UgY2FsbGJhY2tzIHdp
bGwgYmUgY2FsbGVkIGZvcgo+ID4gPiBib3RoIHN1c3BlbmQtdG8tcmFtIGFuZCBoaWJlcm5hdGUg
Y2FzZXMuIE90aGVyIGFyY2hpdGVjdHVyZXMgZG9uJ3QKPiA+ID4gaGF2ZSB0aGlzIHNhdmUvcmVz
dG9yZSBmb3Igc3VzcGVuZC10by1yYW0gYmVjYXVzZSBpdCBpcyBnZW5lcmFsbHkKPiA+ID4gY2Fs
bGVkIGZyb20gaWRsZSB0YXNrLgo+ID4gPgo+ID4gRG8geW91IHRoaW5rIHdlIGRvbid0IGhhdmUg
dG8gY29uc2lkZXIgdGhlIGNhc2UgaW4gdGhlIHBhdGNoPwo+Cj4gSSB3YXMgY29tcGFyaW5nIG90
aGVyIGFyY2hpdGVjdHVyZXMgYnV0IEkgZGlkIG5vdCBmaW5kIGFueSBleHBsaWNpdAo+IHNhdmlu
ZyBvZiBGUCBzdGF0ZSBmb3Igc3VzcGVuZC10by1yYW0uIEFsdGhvdWdoLCBJIGRpZCBmaW5kIGV4
cGxpY2l0Cj4gRlAgc2F2ZSBmb3IgaGliZXJuYXRlLgo+Cj4gRnVuY3Rpb25hbGx5LCBpdCBpcyBm
aW5lIHRvIGFsd2F5cyBzYXZlIEZQIHN0YXRlIGZvciBzdXNwZW5kLXRvLXJhbQo+IGJ1dCBJIGFt
IHdvbmRlcmluZyBpZiB0aGlzIHJlZHVuZGFudCB3b3JrIGluIHN1c3BlbmQtdG8tcmFtIHBhdGgu
Cj4KUGVyaGFwcyB5b3UgYXJlIHJpZ2h0LiBJZiBubyBvbmUgd291bGQgZG8gdGhlCnN1c3BlbmQt
dG8tcmFtL2hpYmVybmF0aW9uIGR1cmluZyB0aGUgRlBVL1ZFQ1RPUiBjYWxjdWxhdGlvbiBpbiB0
aGUKc2FtZSBwcm9jZXNzLCBpdCBtYXkgbm90IGJlIGEgcHJhY3RpY2FsIGNhc2UuCgpSZWdhcmRz
LApOaWNrCj4gUmVnYXJkcywKPiBBbnVwCj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gTmljawo+ID4g
PiBXaHkgbm90IGRvIHRoZSBzYXZlL3Jlc3RvcmUgaW4gc2F2ZV9wcm9jZXNzb3Jfc3RhdGUoKSBh
bmQKPiA+ID4gcmVzdG9yZV9wcm9jZXNzb3Jfc3RhdGUoKSBqdXN0IGxpa2UgYXJjaC9taXBzL3Bv
d2VyL2NwdS5jID8KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gQW51cAo+ID4gPgo+ID4gPgo+
ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBOaWNrCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IENvLWRldmVsb3BlZC1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4K
PiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+
ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gYSkg
QWRkIENvLWRldmVsb3BlZC1ieSBhbmQgYWRqdXN0IHRoZSBvcmRlciBvZiBzaWduZWQtb2ZmCj4g
PiA+ID4gPiA+IGIpIFJlcGhyYXNlIHRoZSBjb21taXQgbWVzc2FnZQo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jIHwgNDUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGlu
c2VydGlvbnMoKykKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N1c3BlbmQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gPiA+
ID4gPiBpbmRleCAzYzg5YjhlYzY5YzQuLmZmNjlmZjhhMTk3NCAxMDA2NDQKPiA+ID4gPiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4gPiA+ID4gPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gPiA+ID4gPiBAQCAtNCw5ICs0LDE0IEBACj4gPiA+
ID4gPiA+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMjIgVmVudGFuYSBNaWNybyBTeXN0ZW1zIEluYy4K
PiA+ID4gPiA+ID4gICAqLwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4
L2NwdV9wbS5oPgo+ID4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2Z0cmFjZS5oPgo+ID4gPiA+
ID4gPiArI2luY2x1ZGUgPGxpbnV4L3RocmVhZF9pbmZvLmg+Cj4gPiA+ID4gPiA+ICsjaW5jbHVk
ZSA8bGludXgvc3lzY29yZV9vcHMuaD4KPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxhc20vY3NyLmg+
Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL3N1c3BlbmQuaD4KPiA+ID4gPiA+ID4gKyNpbmNs
dWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL3ZlY3Rvci5o
Pgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgdm9pZCBzdXNwZW5kX3NhdmVfY3NycyhzdHJ1Y3Qg
c3VzcGVuZF9jb250ZXh0ICpjb250ZXh0KQo+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiBAQCAt
ODUsMyArOTAsNDMgQEAgaW50IGNwdV9zdXNwZW5kKHVuc2lnbmVkIGxvbmcgYXJnLAo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiAgICAgICAgIHJldHVybiByYzsKPiA+ID4gPiA+ID4gIH0KPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiArc3RhdGljIGludCByaXNjdl9jcHVfc3VzcGVuZCh2b2lkKQo+
ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqY3Vy
X3Rhc2sgPSBnZXRfY3VycmVudCgpOwo+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBwdF9yZWdz
ICpyZWdzID0gdGFza19wdF9yZWdzKGN1cl90YXNrKTsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
PiArICAgICAgIGlmIChoYXNfZnB1KCkpIHsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlm
ICh1bmxpa2VseShyZWdzLT5zdGF0dXMgJiBTUl9TRCkpCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGZzdGF0ZV9zYXZlKGN1cl90YXNrLCByZWdzKTsKPiA+ID4gPiA+ID4gKyAg
ICAgICB9Cj4gPiA+ID4gPiA+ICsgICAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHJlZ3MtPnN0YXR1cyAmIFNSX1NEKSkKPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Zfdl92c3RhdGVfc2F2ZShjdXJf
dGFzaywgcmVncyk7Cj4gPiA+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ID4gPiArCj4gPiA+ID4g
PiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gK3N0YXRpYyB2b2lkIHJpc2N2X2NwdV9yZXN1bWUodm9pZCkKPiA+ID4gPiA+ID4gK3sK
PiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cl90YXNrID0gZ2V0X2N1
cnJlbnQoKTsKPiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IHRhc2tf
cHRfcmVncyhjdXJfdGFzayk7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyAgICAgICBpZiAo
aGFzX2ZwdSgpKQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZnN0YXRlX3Jlc3RvcmUoY3Vy
X3Rhc2ssIHJlZ3MpOwo+ID4gPiA+ID4gPiArICAgICAgIGlmIChoYXNfdmVjdG9yKCkpCj4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICByaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKGN1cl90YXNrLCBy
ZWdzKTsKPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArc3RhdGljIHN0
cnVjdCBzeXNjb3JlX29wcyByaXNjdl9jcHVfc3lzY29yZV9vcHMgPSB7Cj4gPiA+ID4gPiA+ICsg
ICAgICAgLnN1c3BlbmQgICAgICAgID0gcmlzY3ZfY3B1X3N1c3BlbmQsCj4gPiA+ID4gPiA+ICsg
ICAgICAgLnJlc3VtZSAgICAgICAgID0gcmlzY3ZfY3B1X3Jlc3VtZSwKPiA+ID4gPiA+ID4gK307
Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IHJpc2N2X2NwdV9z
dXNwZW5kX2luaXQodm9pZCkKPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gKyAgICAgICByZWdp
c3Rlcl9zeXNjb3JlX29wcygmcmlzY3ZfY3B1X3N5c2NvcmVfb3BzKTsKPiA+ID4gPiA+ID4gKyAg
ICAgICByZXR1cm4gMDsKPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gK2FyY2hfaW5pdGNhbGwo
cmlzY3ZfY3B1X3N1c3BlbmRfaW5pdCk7Cj4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+IDIuMzQu
MQo+ID4gPiA+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
