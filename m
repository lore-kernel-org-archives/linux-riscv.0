Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DB6C71144
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWKR2/Kg6kjDUOOqzqglr2dhVpSS+GEKJVU/3XMoym8=; b=SXV83Clug6u9qb
	Syr9IJWBUqQG92K6HrKECMkgjZ/ScPL26ygPefHlzW59TD0DQGyRZ9dbf97Dm2HjSxL1G8dwPeTAL
	T7hJBR0JoAg8Q3PUvaQwpuH/nXbfG5GlPxnAM8XcxAEkyrMHNkQ0b/xVlMEKTN0GnwDOn+5Q3mLMl
	BHY/zVvQyihAm/uwwgmVRBjsG2xwgmpg7t/mfm/Fv+XrptcohOp3gDXxOGqK1jt8wG+njMpC5pdZO
	mnPBKpa//jTkt6SiG3Bt0Ncy5jfzx95/HgeMfl0jChTGUrvO0OJIMAAZPRWPHIy+zFaO5VZCRqFVT
	0qQYdaYqIaHFXNvmarbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY0T-0000000C16u-04go;
	Thu, 12 Jun 2025 02:49:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWzf-0000000Btpj-1CCf
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 01:44:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so1026593a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 18:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749692678; x=1750297478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWcAfXUk5P+0YJPyZ9SkX3gkuCc87P45hLw4l1DcQZA=;
        b=KTJymCxVDtH1NfH9+6i4zpVau1yJiKDDPBwTL7+c+BErr0+sBrREiz1cVK8bVS4YGH
         /y6KXVA9B+GiBlHAPw6G9NaS9mTrDyYnsuZLzXUX/GLf2T0tNX4WxRtMC010Um4ISSga
         4bOVO/3ivLeRpy+/+GzH9AFgKgt4troqsI6d39+vLmYuUthwnfHKerypXVXv4024V4ow
         Iw/4FAt2+m2LS1JdDox7LwXiKek68XnTUrngqU1+wglHOuKFvEYI3ZHwCX0ULkgNWx4v
         +VzE3RbFP8kqLN7KUJ2Jnkca3KMkxYewG14be386A2TDuOZmoztEkI/xQ97eM1Tjn3xB
         iSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692678; x=1750297478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWcAfXUk5P+0YJPyZ9SkX3gkuCc87P45hLw4l1DcQZA=;
        b=KIKwGSs88mZ+WorkAnSwjO2fsNuBw2e6KPn7EezA8dU0QzXGzTBkvhS4OY7QznYiYA
         ZVyw/BqL2mEAmjhaiXu2Ar07DZVY7462wGPcx0Z5DAFuImLT2s75XCClM0WWzJMjxFKP
         3/6v88N0f9woQaiN4JECmeRUr+AJ/b5vEFcNU/HB6Kh+qxnvlgUQm6O+hJrNkJjSDfjN
         VZZ5VHsBXiGztQ6PkMYE0gaiNEQXjpoowVlfiPG5NinzuLJdhSfWcQgh894Ii20jgdep
         gdLuMNLaePaKYJVetIWbzvciAwMbGnsmNXDbxakuF8iKqzenRTfEUqBzWihEHkFYcaom
         i2qg==
X-Forwarded-Encrypted: i=1; AJvYcCWQWL1RodvQnElNIgoXkoB9ZsduoiJVfxf0cgeWEdRUnLMjcGD076wVp9JcFdYIPNqikdwkMJ2/DtoQVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQzCt+Ab+3YsqamOlgXTkb7DY1IhpDzqhmS76EjvTCJDFsxGJ5
	u+MNJP5lwyy/H5C95JpNOQgEuRy1nil083XgkNayWuITSDJHX97uWq83iuoLOkZTNAYO2GrJAiu
	OAQi+wn+nd6iwBv9D3fyLF4k/mdYUJm4abNXS0Yz3Og==
X-Gm-Gg: ASbGnctffUtzhYqg4/4Wo+2YsmTPChwgMnCH/RPhojPG1RR797QEoiP89EvZVr3fXgO
	bkKs8ZnTngj7Lie7fIDTh3BxZjVu3VqagMi7D8iZDAL7FBoNFYBuElmFKZQ8bKDhLc/lsms5SMV
	/sYGsZmrbW5bpRpPHLozJV21bMFigd0Ajth74QmWd2rvg58jo0kWJ5b60=
X-Google-Smtp-Source: AGHT+IF6ozO6AyxwG4za9A7i83BSzRL3SEEnwk5MfwoXwPW6m7AZDLNJEhC2j3KTRCG2+36HHH9N7IUrHjCnjqIf3Hs=
X-Received: by 2002:a17:907:7fa9:b0:ade:3a7a:26cb with SMTP id
 a640c23a62f3a-adea9a5a8f2mr111569866b.58.1749692677584; Wed, 11 Jun 2025
 18:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-2-guodong@riscstar.com>
 <20250611-kabob-unmindful-3b1e9728e77d@spud>
In-Reply-To: <20250611-kabob-unmindful-3b1e9728e77d@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 09:44:25 +0800
X-Gm-Features: AX0GCFsy-sakH0jotNRCx536oNAS4R_g03uEq1Dp3TLhuOr7_lBJgrQdKtIkepA
Message-ID: <CAH1PCMYBPOerGKhMGUi_4AD-abF9wce2PgFMSfzi056FJvRJgQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
To: Conor Dooley <conor@kernel.org>, duje.mihanovic@skole.hr
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, elder@riscstar.com, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_184439_566229_D1CD77C5 
X-CRM114-Status: GOOD (  25.82  )
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

T24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgMTI6MjfigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDg6NTc6MTZQTSAr
MDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEFkZCAic3BhY2VtaXQscGRtYS0xLjAiIGNvbXBh
dGlibGUgc3RyaW5nIHRvIHN1cHBvcnQgU3BhY2VtaVQgUERNQQo+ID4gY29udHJvbGxlciBpbiB0
aGUgTWFydmVsbCBNTVAgRE1BIGRldmljZSB0cmVlIGJpbmRpbmdzLiBUaGlzIGVuYWJsZXM6Cj4g
Pgo+ID4gLSBTdXBwb3J0IGZvciBTcGFjZW1pVCBQRE1BIGNvbnRyb2xsZXIgY29uZmlndXJhdGlv
bgo+ID4gLSBOZXcgb3B0aW9uYWwgcHJvcGVydGllcyBmb3IgcGxhdGZvcm0tc3BlY2lmaWMgaW50
ZWdyYXRpb246Cj4gPiAgICogY2xvY2tzOiBDbG9jayBjb250cm9sbGVyIGZvciB0aGUgRE1BCj4g
PiAgICogcmVzZXRzOiBSZXNldCBjb250cm9sbGVyIGZvciB0aGUgRE1BCj4gPgo+ID4gQWxzbywg
YWRkIGV4cGxpY2l0ICNkbWEtY2VsbHMgcHJvcGVydHkgZGVmaW5pdGlvbiB0byBhdm9pZAo+ID4g
Im1ha2UgZHRic19jaGVjayBXPTMiIHdhcm5pbmdzIGFib3V0IHVuZXZhbHVhdGVkIHByb3BlcnRp
ZXMuCj4gPgo+ID4gVGhlICNkbWEtY2VsbHMgcHJvcGVydHkgaXMgZGVmaW5lZCBhcyAyIGNlbGxz
IHRvIG1haW50YWluIGNvbXBhdGliaWxpdHkKPiA+IHdpdGggZXhpc3RpbmcgQVJNIGRldmljZSB0
cmVlcy4gVGhlIGZpcnN0IGNlbGwgc3BlY2lmaWVzIHRoZSBETUEgcmVxdWVzdAo+ID4gbGluZSBu
dW1iZXIsIHdoaWxlIHRoZSBzZWNvbmQgY2VsbCBpcyBjdXJyZW50bHkgdW51c2VkIGJ5IHRoZSBk
cml2ZXIgYnV0Cj4gPiByZXF1aXJlZCBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aXRoIFBY
QSBkZXZpY2UgdHJlZSBmaWxlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxn
dW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9kbWEvbWFydmVs
bCxtbXAtZG1hLnlhbWwgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL21hcnZlbGwsbW1wLWRtYS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9tYXJ2ZWxsLG1tcC1kbWEueWFtbAo+
ID4gaW5kZXggZDQ0N2Q1MjA3YmUwLi5lMTE3YTgxNDE0YmQgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL21hcnZlbGwsbW1wLWRtYS55YW1sCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL21hcnZlbGwsbW1w
LWRtYS55YW1sCj4gPiBAQCAtMTgsNiArMTgsNyBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgIC0g
bWFydmVsbCxwZG1hLTEuMAo+ID4gICAgICAgIC0gbWFydmVsbCxhZG1hLTEuMAo+ID4gICAgICAg
IC0gbWFydmVsbCxweGE5MTAtc3F1Cj4gPiArICAgICAgLSBzcGFjZW1pdCxwZG1hLTEuMAo+Cj4g
WW91IG5lZWQgYSBzb2Mtc3BlY2lmaWMgY29tcGF0aWJsZSBoZXJlLgo+Cj4gPgo+ID4gICAgcmVn
Ogo+ID4gICAgICBtYXhJdGVtczogMQo+ID4gQEAgLTMyLDYgKzMzLDIxIEBAIHByb3BlcnRpZXM6
Cj4gPiAgICAgICAgQSBwaGFuZGxlIHRvIHRoZSBTUkFNIHBvb2wKPiA+ICAgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ID4KPiA+ICsgIGNsb2NrczoK
PiA+ICsgICAgZGVzY3JpcHRpb246IENsb2NrIGZvciB0aGUgY29udHJvbGxlcgo+ID4gKyAgICBt
YXhJdGVtczogMQo+ID4gKwo+ID4gKyAgcmVzZXRzOgo+ID4gKyAgICBkZXNjcmlwdGlvbjogUmVz
ZXQgY29udHJvbGxlciBmb3IgdGhlIERNQSBjb250cm9sbGVyCj4gPiArICAgIG1heEl0ZW1zOiAx
Cj4gPiArCj4gPiArICAnI2RtYS1jZWxscyc6Cj4gPiArICAgIGNvbnN0OiAyCj4gPiArICAgIGRl
c2NyaXB0aW9uOgo+ID4gKyAgICAgIFRoZSBmaXJzdCBjZWxsIGNvbnRhaW5zIHRoZSBETUEgcmVx
dWVzdCBudW1iZXIgZm9yIHRoZSBwZXJpcGhlcmFsCj4gPiArICAgICAgZGV2aWNlLiBUaGUgc2Vj
b25kIGNlbGwgaXMgY3VycmVudGx5IHVudXNlZCBidXQgbXVzdCBiZSBwcmVzZW50IGZvcgo+ID4g
KyAgICAgIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuCj4KPiBUaGVzZSBwcm9wZXJ0aWVzIGFyZSBv
bmx5IHZhbGlkIGZvciB5b3VyIG5ldyBkZXZpY2UsIHJpZ2h0Pwo+IElmIHNvLCBwbGVhc2UgcmVz
dHJpY3QgdGhlbSB0byBvbmx5IHRoZSBzcGFjZW1pdCBwbGF0Zm9ybS4KPgoKRm9yIGNsb2NrcyBh
bmQgcmVzZXRzLCB5ZXMgdGhhdCdzIGNvcnJlY3QsIG9ubHkgZm9yIHNwYWNlbWl0IGsxLiBJJ2xs
IGFkZApjb25kaXRpb25hbCBjb25zdHJhaW50cyB0byByZXN0cmljdCB0aGVtIHRvIHRoZSBzcGFj
ZW1pdCBwbGF0Zm9ybS4KClJlZ2FyZGluZyAjZG1hLWNlbGxzLCBpdCdzIHVzZWQgYnkgb3RoZXIg
cGxhdGZvcm1zIHRvby4gWW91IGFyZSByaWdodCB0aGF0Cml0IHJlcXVpcmVzIGNsYXJpZmljYXRp
b24uIEkgc2hvdWxkIGhhdmUgYmVlbiBtb3JlIGNhcmVmdWwgaW4gbXkgaW5pdGlhbAphbmFseXNp
cy4KCkFmdGVyIHJldmlld2luZyB0aGUgaW4tdHJlZSBkZXZpY2UgdHJlZXMgYW5kIGRyaXZlciBj
b2RlLCBoZXJlJ3Mgd2hhdCBJIGZvdW5kOgoKRm9yIFBETUEgY29udHJvbGxlcnM6CkJvdGggIm1h
cnZlbGwscGRtYS0xLjAiIGFuZCB0aGUgc3BhY2VtaXQgcGRtYSB1c2UgI2RtYS1jZWxscyA9IDwy
PjsKSGFuZGxlZCBieSBkcml2ZXJzL2RtYS9tbXBfcGRtYS5jIHdpdGggX3hsYXRlKCkgY2FsbGJh
Y2sKCkZvciBBRE1BL2F1ZGlvIGNvbnRyb2xsZXJzOgoibWFydmVsbCxhZG1hLTEuMCIgdXNlcyAj
ZG1hLWNlbGxzID0gPDE+CgoibWFydmVsbCxweGE5MTAtc3F1IiBpcyBub3QgZm91bmQgaW4gYW55
IGluLXRyZWUgZGV2aWNlIHRyZWVzLCBidXQgYmFzZWQKb24gdGhlIG9yaWdpbmFsIFRYVCBiaW5k
aW5nIFsxXSwgYm90aCBhZG1hIGFuZCBweGE5MTAtc3F1IGFyZSAiTWFydmVsbApUd28gQ2hhbm5l
bCBETUEgQ29udHJvbGxlciB1c2VkIHNwZWNpZmljYWxseSBmb3IgYXVkaW8iLCBhbmQgdGhlIHNo
YXJlZApkcml2ZXIgY29kZSAoZHJpdmVycy9kbWEvbW1wX3RkbWEuYykgYWxzbyBzaG93cyBpdCBz
aG91bGQgdXNlCiNkbWEtY2VsbHMgPSA8MT4uCgpTbywgSSdsbCBhZGQgY29uZGl0aW9uYWwgY29u
c3RyYWludHMgaW4gdGhlIGFsbE9mIHNlY3Rpb24uCkZvciAibWFydmVsbCxwZG1hLTEuMCIgYW5k
IHNwYWNlbWl0IHBkbWEsICNkbWEtY2VsbHMgbXVzdCBiZSAyOwpGb3IgIm1hcnZlbGwsYWRtYS0x
LjAiIGFuZCAibWFydmVsbCxweGE5MTAtc3F1IiwgI2RtYS1jZWxscyBtdXN0IGJlIDEuCkFsc28s
IGFzIHNhaWQsIEkgd2lsbCByZXN0cmljdCBjbG9ja3MgYW5kIHJlc2V0cyB0byBzcGFjZW1pdCBv
bmx5LgoKVGhhbmsgeW91IGFnYWluIGZvciBjYXRjaGluZyB0aGlzLiBMZXQgbWUga25vdyB3aGF0
IHlvdSB0aGluay4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDEzMS1w
eGEtZG1hLXlhbWwtdjItMi05NjExZDBhZjBlZGNAc2tvbGUuaHIvClsxXQoKLUd1b2RvbmcKCgo+
ID4gKwo+ID4gICAgJyNkbWEtY2hhbm5lbHMnOgo+ID4gICAgICBkZXByZWNhdGVkOiB0cnVlCj4g
Pgo+ID4gQEAgLTUyLDYgKzY4LDcgQEAgYWxsT2Y6Cj4gPiAgICAgICAgICAgIGNvbnRhaW5zOgo+
ID4gICAgICAgICAgICAgIGVudW06Cj4gPiAgICAgICAgICAgICAgICAtIG1hcnZlbGwscGRtYS0x
LjAKPiA+ICsgICAgICAgICAgICAgIC0gc3BhY2VtaXQscGRtYS0xLjAKPiA+ICAgICAgdGhlbjoK
PiA+ICAgICAgICBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgYXNyYW06IGZhbHNlCj4gPiAtLQo+
ID4gMi40My4wCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
