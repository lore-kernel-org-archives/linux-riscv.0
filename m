Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4465DC61D99
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 00:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QB56sh0HUHMMVCuM/GP3B+L8bVYEu1L31fRR4Ysds24=; b=CzwMr2tctPjMv0
	nCTQr25U8Gmmv9yGLtuv9AYxXuG7zySmA1KsOLCnybNDTXT4JsgXiia5ke63Z4OI8PEsjDv4AL2m1
	p1rI/1Rqhxv+4xgqoNSnPg7TfyX9RplmHnDQY64K9vEdxtFETI3UvOzURveYr1tREUxgghI+jzhG3
	oy2/BJXHwOS4UnlqXq1C2E3AMSE1G8xHWpAjz7Qa7Kwm5NWliXHHUtTZcjZvyRrALpoQ833Y9AKDl
	rvL1Bh3F08kRnKvSX2uVlW/uWMhjm4mk71vxNmeUpBGYgsw/Kq4OqoIDxQEAvO3s2c00SBZM3OY+S
	jXDfw0ixYBRrh2schVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xi8-003QNV-1X;
	Thu, 23 Nov 2023 00:36:52 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xi4-003QL2-0k
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 00:36:51 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-41cc56255e3so1651261cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 16:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700699806; x=1701304606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgUFjwg5YKCYWy20zhpg67B3oU7YcI53msCKbkLw97A=;
        b=Fn1jO+JF72N0yXlTCppt4F0oCqgGjOIz4hAOOhUn4UeFKzD4ZL0f5wOOLvjQh1e/5O
         kHGo5wLa7FrYLgN0Qe2OOmWAP35QyUxQoagmrJiHTeRyYEjxf87f6FcjuWS8hoIkR9e3
         khCbxvFvngXFEEDjku526d3w/U1+tS2qRTWMmuNe8xEtdR4O7oZRzhv+4nvbICNsuTbZ
         FGATiuwx2mEh/nLgV5JFDXbfo6VMN2ObPY+KFAObKcREiiULliqy0N0+goc+WPTuAxwE
         s6UpiS7Be+P0hdT3jG/znjGladHHnKRsRvLavqpk/V1CpF0J2RdvMlUwZcdS3TQ196QH
         HpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700699806; x=1701304606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgUFjwg5YKCYWy20zhpg67B3oU7YcI53msCKbkLw97A=;
        b=P1Jzl9Ftda9OGZhmtnYMrmcW2zuZF/Ul9DVEZQ0nzY+wxYWvdmj74HLnXwDsVvJ+j2
         SlWVFcfrhY7QI4l2sfXkSr7AAQStnJ7c09G4owD2GNxp5WyN9Ukwogg/CozR8my870Sv
         bgQugpE/+bcT0pK2+4JJ1IYUlMn3+DnhJZX7AKVoVd5L1T3nad6SxnKgHu+R5FTpLSyt
         8vbfCGfT8PD/xQBgmbCIUV0gMwVqnMUs9qPHPjcJ13D1NMpIof06sXDU1npfdiie4HJx
         MjeFvV7shApIYoW2CD2kbIonYoTAq/Pm4cbO7QJdgrn0uplduRvjKh6UxcBe7cO6N/9U
         59ZQ==
X-Gm-Message-State: AOJu0YyzeM8YuY+TAW+Og7qTmleGLqPAlpV0QPIDxJHq9DhBypzZzGvJ
	CrEL8LG3g4BKHbo3Hej4sMwdCgkIY+prr87k7eTgLA==
X-Google-Smtp-Source: AGHT+IEuKmqdWD3L1dw4SB+jHr8Nyxf+UqLOyocrnvYK0njHkJO9dhhq5iTmWTWi5k2sLSCbhOGjXqrbMw3KHTEwC3g=
X-Received: by 2002:a05:622a:5cd:b0:41e:1a89:2534 with SMTP id
 d13-20020a05622a05cd00b0041e1a892534mr5113240qtb.53.1700699806450; Wed, 22
 Nov 2023 16:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20230711153743.1970625-1-heiko@sntech.de> <20230914001144.GA924@sol.localdomain>
 <ZQJdnCwf99Glggin@ghost> <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com> <20231006194741.GA68531@google.com>
 <AB98E114-A8DE-492E-B078-7394EE4FA83E@sifive.com> <20231102040333.GC1498@sol.localdomain>
 <20231121235109.GE2172@sol.localdomain> <3416A95B-8687-44F6-9F77-D30AD6516094@sifive.com>
 <20231122234259.GB1541@sol.localdomain>
In-Reply-To: <20231122234259.GB1541@sol.localdomain>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 23 Nov 2023 01:36:34 +0100
Message-ID: <CAEg0e7iPGnaMKR9bT01-bGOUUToUG0o3Q7NBS_m8CbZdYWeBXA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jerry Shih <jerry.shih@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, herbert@gondor.apana.org.au, davem@davemloft.net, 
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_163648_291830_5B6E2FAF 
X-CRM114-Status: GOOD (  39.82  )
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

T24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgMTI6NDPigK9BTSBFcmljIEJpZ2dlcnMgPGViaWdnZXJz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMDM6NTg6MTdQ
TSArMDgwMCwgSmVycnkgU2hpaCB3cm90ZToKPiA+IE9uIE5vdiAyMiwgMjAyMywgYXQgMDc6NTEs
IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwg
Tm92IDAxLCAyMDIzIGF0IDA5OjAzOjMzUE0gLTA3MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiA+
ID4+Cj4gPiA+PiBJdCB3b3VsZCBiZSBuaWNlIHRvIHVzZSBhIHJlYWwgYXNzZW1ibGVyLCBzbyB0
aGF0IHBlb3BsZSB3b24ndCBoYXZlIHRvIHdvcnJ5Cj4gPiA+PiBhYm91dCBwb3RlbnRpYWwgbWlz
dGFrZXMgb3IgaW5jb25zaXN0ZW5jaWVzIGluIHRoZSBwZXJsLWJhc2VkICJhc3NlbWJsZXIiLiAg
QWxzbwo+ID4gPj4ga2VlcCBpbiBtaW5kIHRoYXQgaWYgd2UgYWxsb3cgcGVvcGxlIHRvIGNvbXBp
bGUgdGhpcyBjb2RlIHdpdGhvdXQgdGhlIHJlYWwKPiA+ID4+IGFzc2VtYmxlciBzdXBwb3J0IGZy
b20gdGhlIGJlZ2lubmluZywgaXQgbWlnaHQgZW5kIHVwIHN0YXlpbmcgdGhhdCB3YXkgZm9yIHF1
aXRlCj4gPiA+PiBhIHdoaWxlIGluIG9yZGVyIHRvIGF2b2lkIGJyZWFraW5nIHRoZSBidWlsZCBm
b3IgcGVvcGxlLgo+ID4gPj4KPiA+ID4+IFVsdGltYXRlbHkgaXQncyB1cCB0byB5b3UgdGhvdWdo
OyBJIHRoaW5rIHRoYXQgeW91IGFuZCBvdGhlcnMgd2hvIGhhdmUgYmVlbgo+ID4gPj4gd29ya2lu
ZyBvbiBSSVNDLVYgY3J5cHRvIGNhbiBtYWtlIHRoZSBiZXN0IGRlY2lzaW9uIGFib3V0IHdoYXQg
dG8gZG8gaGVyZS4gIEkKPiA+ID4+IGFsc28gZG9uJ3Qgd2FudCB0aGlzIHBhdGNoc2V0IHRvIGJl
IGRlbGF5ZWQgd2FpdGluZyBmb3Igb3RoZXIgcHJvamVjdHMsIHNvIG1heWJlCj4gPiA+PiB0aGF0
IGluZGVlZCBtZWFucyB0aGUgcGVybC1iYXNlZCAiYXNzZW1ibGVyIiBuZWVkcyB0byBiZSB1c2Vk
IGZvciBub3cuCj4gPiA+Cj4gPiA+IEp1c3Qgd2FudGVkIHRvIGJ1bXAgdXAgdGhpcyBkaXNjdXNz
aW9uIGFnYWluLiAgSW4gYmludXRpbHMsIHRoZSB2ZWN0b3IgY3J5cHRvCj4gPiA+IHYxLjAuMCBz
dXBwb3J0IHdhcyByZWxlYXNlZCA0IG1vbnRocyBhZ28gaW4gMi40MS4gIFNlZSB0aGUgTkVXUyBm
aWxlIGF0Cj4gPiA+IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0L2dpdHdlYi5jZ2k/cD1iaW51
dGlscy1nZGIuZ2l0O2E9YmxvYl9wbGFpbjtmPWJpbnV0aWxzL05FV1M7aGI9cmVmcy9oZWFkcy9i
aW51dGlscy0yXzQxLWJyYW5jaAo+ID4gPgo+ID4gPiAgICAqIFRoZSBSSVNDLVYgcG9ydCBub3cg
c3VwcG9ydHMgdGhlIGZvbGxvd2luZyBuZXcgc3RhbmRhcmQgZXh0ZW5zaW9uczoKPiA+ID4gICAg
ICAtIFppY29uZCAoY29uZGl0aW9uYWwgemVybyBpbnN0cnVjdGlvbnMpCj4gPiA+ICAgICAgLSBa
ZmEgKGFkZGl0aW9uYWwgZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zKQo+ID4gPiAgICAgIC0g
WnZiYiwgWnZiYywgWnZrZywgWnZrbmVkLCBadmtuaFthYl0sIFp2a3NlZCwgWnZrc2gsIFp2a24s
IFp2a25jLCBadmtuZywKPiA+ID4gICAgICAgIFp2a3MsIFp2a3NjLCBadmtnLCBadmt0ICh2ZWN0
b3IgY3J5cHRvIGluc3RydWN0aW9ucykKPiA+ID4KPiA+ID4gVGhhdCdzIGV2ZXJ5IGV4dGVuc2lv
biBsaXN0ZWQgaW4gdGhlIHZlY3RvciBjcnlwdG8gdjEuMC4wIHNwZWNpZmljYXRpb24KPiA+ID4g
KGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1jcnlwdG8vcmVsZWFzZXMvZG93bmxvYWQv
djEuMC4wL3Jpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5wZGYpLgo+ID4KPiA+IEl0IGRvZXNuJ3Qg
Zml0IGFsbCB2MS4wIHNwZWMuCj4gPiBUaGUgYFp2a2JgIGlzIG1pc3NlZCBpbiBiaW51dGlscy4g
SXQncyB0aGUgc3Vic2V0IG9mIGBadmJiYC4gV2UgbmVlZHMgc29tZSBleHRyYQo+ID4gd29ya3Mg
aWYgdXNlciBqdXN0IHRyeSB0byB1c2UgYFp2a2JgLgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3Jpc2N2LWNyeXB0by9ibG9iL21haW4vZG9jL3ZlY3Rvci9yaXNjdi1jcnlwdG8tdmVjdG9y
LXp2a2IuYWRvYwo+ID4gU29tZSBjcnlwdG8gYWxnb3JpdGhtcyBhcmUgYWxyZWFkeSBjaGVja2lu
ZyBmb3IgYFp2a2JgIGluc3RlYWQgb2YgYFp2YmJgLgo+Cj4gWWVhaCwgdGhhdCdzIHVuZm9ydHVu
YXRlIHRoYXQgWnZrYiBnb3QgbWlzc2VkIGluIGJpbnV0aWxzLiAgSG93ZXZlciwgc2luY2UgYWxs
Cj4gWnZrYiBpbnN0cnVjdGlvbnMgYXJlIHBhcnQgb2YgWnZiYiwgd2hpY2ggaXMgc3VwcG9ydGVk
LCBhc3NlbWJsaW5nIFp2a2IKPiBpbnN0cnVjdGlvbnMgc2hvdWxkIHN0aWxsIHdvcmsgLS0tIHJp
Z2h0PwoKTm90IGZvcmdvdHRlbiwgYnV0IHRoZSBadmtiIGV4dGVuc2lvbiBkaWQgbm90IGV4aXN0
IHdoZW4gdGhlIHBhdGNoc2V0CndhcyBtZXJnZWQuClJJU0MtViBleHRlbnNpb24gc3VwcG9ydCBp
cyB0eXBpY2FsbHkgbWVyZ2VkIHdoZW4gc3BlY2lmaWNhdGlvbnMgYXJlICJmcm96ZW4iLgpUaGlz
IG1lYW5zIGEgaGlnaCBiYXIgZm9yIGNoYW5nZXMsIGJ1dCB0aGV5IGFyZSBwb3NzaWJsZSB1bnRp
bCB0aGUKc3BlYyBpcyByYXRpZmllZC4KT2Z0ZW4gbm90aGluZyBpcyBjaGFuZ2VkIHVudGlsIHJh
dGlmaWNhdGlvbiwgYnV0IGhlcmUgWnZrYiBoYXMgYmVlbgoocmUtKWludHJvZHVjZWQuCgpJIHdh
cyBub3QgYXdhcmUgb2YgdGhpcyB1bnRpbHMgSSByZWFkIHRoaXMgZW1haWwsIHNvIEkganVzdCB3
cm90ZSBhCnBhdGNoIHRoYXQgZmlsbHMgdGhlIGdhcDoKICBodHRwczovL3NvdXJjZXdhcmUub3Jn
L3BpcGVybWFpbC9iaW51dGlscy8yMDIzLU5vdmVtYmVyLzEzMDc2Mi5odG1sCgpUaGFua3MgZm9y
IHJlcG9ydGluZyEKCkJSCkNocmlzdG9waAoKPgo+ID4gPiBMTFZNIHN0aWxsIGhhcyB0aGUgdmVj
dG9yIGNyeXB0byBleHRlbnNpb25zIG1hcmtlZCBhcyAiZXhwZXJpbWVudGFsIiBleHRlbnNpb25z
Lgo+ID4gPiBIb3dldmVyLCB0aGVyZSBpcyBhbiBvcGVuIHB1bGwgcmVxdWVzdCB0byBtYXJrIHRo
ZW0gbm9uLWV4cGVyaW1lbnRhbDoKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1w
cm9qZWN0L3B1bGwvNjkwMDAKPiA+ID4KPiA+ID4gQ291bGQgd2UganVzdCBnbyBhaGVhZCBhbmQg
cmVtb3ZlIHJpc2N2LnBtLCBkZXZlbG9wIHdpdGggYmludXRpbHMgZm9yIG5vdywgYW5kCj4gPiA+
IHByaW9yaXRpemUgZ2V0dGluZyB0aGUgTExWTSBzdXBwb3J0IGZpbmlzaGVkPwo+ID4KPiA+IFll
cywgd2UgY291bGQuCj4gPiBCdXQgd2UgbmVlZCB0byBoYW5kbGUgdGhlIGV4dGVuc2lvbnMgY2hl
Y2tpbmcgZm9yIHRvb2xjaGFpbnMgbGlrZToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9jb21taXQvYjZmY2RiMTkxZTM2ZjgyMzM2ZjliNWUxMjZkNTFjMDJlNzMyMzQ4MAo+
ID4gSSBjb3VsZCBkbyB0aGF0LCBidXQgSSB0aGluayBJIG5lZWQgc29tZSB0aW1lcyB0byB0ZXN0
IHRoZSBidWlsZHMuIEFuZCBpdCB3aWxsIGludHJvZHVjZQo+ID4gbW9yZSBkZXBlbmRlbmN5IHBh
dGNoIHdoaWNoIGlzIG5vdCByZWxhdGVkIHRvIGFjdHVhbCBjcnlwdG8gYWxnb3JpdGhtcyBhbmQg
dGhlCj4gPiBnbHVpbmcgY29kZSBpbiBrZXJuZWwuIEkgd2lsbCBzZW5kIGFub3RoZXIgcGF0Y2gg
Zm9yIHRvb2xjaGFpbiBwYXJ0IGFmdGVyIHRoZSB2MiBwYXRjaC4KPiA+IEFuZCBJIGFtIHdvcmtp
bmcgZm9yIHYyIHBhdGNoIHdpdGggeW91ciBuZXcgcmV2aWV3IGNvbW1lbnRzLiBUaGUgdjIgd2ls
bCBzdGlsbAo+ID4gdXNlIGBwZXJsYXNtYC4KPgo+IE5vdGUgdGhhdCBwZXJsYXNtICgucGwpIHZz
IGFzc2VtYmx5ICguUyksIGFuZCAiLmluc3QiIHZzIHJlYWwgYXNzZW1ibGVyCj4gaW5zdHJ1Y3Rp
b25zLCBhcmUgYWN0dWFsbHkgc2VwYXJhdGUgY29uY2VybnMuICBXZSBjb3VsZCB1c2UgcmVhbCBh
c3NlbWJsZXIKPiBpbnN0cnVjdGlvbnMgd2hpbGUgc3RpbGwgdXNpbmcgcGVybGFzbS4gIE9yIHdl
IGNvdWxkIHVzZSBhc3NlbWJseSB3aGlsZSBzdGlsbAo+IHVzaW5nIG1hY3JvcyB0aGF0IGdlbmVy
YXRlIHRoZSBpbnN0cnVjdGlvbnMgYXMgLmluc3QuCj4KPiBNeSBwcmVmZXJlbmNlIGlzIGluZGVl
ZCBib3RoOiBhc3NlbWJseSAoLlMpIHdpdGggcmVhbCBhc3NlbWJsZXIgaW5zdHJ1Y3Rpb25zLgo+
IFRoYXQgd291bGQga2VlcCB0aGluZ3MgbW9yZSBzdHJhaWdodGZvcndhcmQuCj4KPiBXZSBkbyBu
b3QgbmVjZXNzYXJpbHkgbmVlZCB0byBkbyBib3RoIGJlZm9yZSBtZXJnaW5nIHRoZSBjb2RlLCB0
aG91Z2guICBJdCB3aWxsCj4gYmUgYmVuZWZpY2lhbCB0byBnZXQgdGhpcyBjb2RlIG1lcmdlZCBz
b29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIsIHNvIHRoYXQgb3RoZXIKPiBwZW9wbGUgY2FuIHdvcmsg
b24gaW1wcm92aW5nIGl0Lgo+Cj4gSSB3b3VsZCBwcmlvcml0aXplIHRoZSBjaGFuZ2UgdG8gdXNl
IHJlYWwgYXNzZW1ibGVyIGluc3RydWN0aW9ucy4gIEkgZG8gdGhpbmsKPiBpdCdzIHdvcnRoIHRo
aW5raW5nIGFib3V0IGdldHRpbmcgdGhhdCBjaGFuZ2UgaW4gZnJvbSB0aGUgYmVnaW5uaW5nLCBz
byB0aGF0IHRoZQo+IHRvb2xjaGFpbiBwcmVyZXF1aXNpdGVzIGFyZSBwcm9wZXJseSBpbiBwbGFj
ZSBmcm9tIHRoZSBiZWdpbm5pbmcgYW5kIHBlb3BsZSBjYW4KPiBwcm9wZXJseSBhY2NvdW50IGZv
ciB0aGVtIGFuZCBwcmlvcml0aXplIHRoZSB0b29sY2hhaW4gd29yayBhcyBuZWVkZWQuCj4KPiAt
IEVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
