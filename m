Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C9CC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeWLBB6CvQPsfsIVpjZSQTbmwErT1FwFerHyafcKY7Y=; b=tVb/ed0zlvIWgI
	SclHHJTf+l0Qn8rg5XAG3MtMCY5znDalTrqv+rdUFK0CEkQfa2pSywLAza12fxPcguV9nnwJN2ARE
	i3JBd+tQHlDVyH6mo7WwB3Iv1Ic4AN4zGKgvMTkvpHBOUFdWZGrb76201RctEeiqnr6Be4SrJQDY3
	iIRmQ6oxcLsvVEKk4/3kUTLSj4uftRQcbnNT3cEjF2o/QrdFmbdl1VkiFpYBUVMbnkDC2w1d5WLC7
	Kibedug4N0wg3SNOG3PR0jSkmuiZlQaUKLR/BH08JGcaUHZnSY7YWVQhk5+uCjv3oNQtgVB1Q6OM3
	fy32yPxrU2mD3zYfuMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqXw-00BGwU-2y;
	Mon, 22 Jan 2024 09:24:48 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqXr-00BGv7-2B
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 09:24:47 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e0eed0427cso450764a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 01:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705915421; x=1706520221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=An//1jmJkagxoPM0+8oyaFGToL9WWNmj+iNkfY5Xwm0=;
        b=K53FifqRcKB3Yi6GWZF4jAT68EEzmtA1M9br065KwnQCVoU7UsZLgxRlEM+fcqsdVl
         mVD3PLiX9LSnepSjHBe1Pb6imJ3sHZRFRs+XcBbskWtBkDVAt9+S5ttauhrxzwmhBWFy
         o0vEt1WvrQUGAJpwXX9TYWTZ2ACGpi4Y3oQHdDaYkOwLnZnv7A5Ke18bZJ0ZsLuWJPt3
         vwIZPspvq/xdpr90Uk/NIcz50Y/+1yr20pO+i4qtJTNRBZQ7fuWEPE1t98cNTEFSHMTU
         kSG9Y5Q8Qzi9YGRrJiLuA/bIq0jMrOB5B/MDmTwKr9FGJWSVTqCdJY1+2sz3shhkz+VI
         f3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705915421; x=1706520221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=An//1jmJkagxoPM0+8oyaFGToL9WWNmj+iNkfY5Xwm0=;
        b=gWg7O3PgD6tjzUaXtIUujrrEu5chhqkwKPNyA0kI7dxqSxGtb/LcgEh7nSg0Lj0JFm
         PK0DhdjdAHrhyMoeyg1PTyctwramM5rDLvdYXlvt5LoEESUXiXChQtJu1aaH5y6iO1gO
         1zA4hMuw9Au3p8wewX2lj6Oek1UratvsfcmWeWOt6pRfcKSNfm1tpvPPy7k2OAuO5U24
         pCCzwLtOvDYoOth+ygfYFjY37L3+iSuCfKgf4aEg2sE5RT9FbeUo/psOrTXowhmsohx5
         D3LReK5hIJAQxqMK/ZFIKmuRd+0n7hQwSuf8pGP/g+0fKA6puHHsQA05HAQ6GB11o8V7
         9rzw==
X-Gm-Message-State: AOJu0YzRrEcAMIUG/d/XamTPPdTJxY9swjOKXRf+vcbey0nYnU4IHqPS
	Pr1D0Kg6Eo8+jHFW/2ixOyY3L4ahm/SSbwrC4ONP0qorvtr+siEjGYRq3DzPZnciifqCcPfSDoU
	USF0N6H7J/yhScFG7BBwPIM6cvI8=
X-Google-Smtp-Source: AGHT+IFBYRPl1ryahxuI8r5+ViUmrqkH8rztXRFhCsnMTpg9NzQJdrag3MCpRtAvV5rdD6ReR16lH3SbseV5iIBy8jk=
X-Received: by 2002:a05:6870:c14a:b0:204:c37:85bf with SMTP id
 g10-20020a056870c14a00b002040c3785bfmr3196999oad.74.1705915421104; Mon, 22
 Jan 2024 01:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
 <20240122081722868bdda5@mail.local> <CAJRtX8QU8iHY1oQJ1uDN3YOmCeN7SH+vPC8nD29WS5+2DT1oKQ@mail.gmail.com>
 <2024012209151130867663@mail.local>
In-Reply-To: <2024012209151130867663@mail.local>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Mon, 22 Jan 2024 17:23:30 +0800
Message-ID: <CAJRtX8RZZb1Rq1y-QSheimWgJf0W_bnhe=dGmAeqGNYy+jx6KQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	chao.wei@sophgo.com, unicorn_wang@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dlan@gentoo.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_012443_712690_06435F65 
X-CRM114-Status: GOOD (  25.00  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNToxNeKAr1BNIEFsZXhhbmRyZSBCZWxsb25pCjxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMi8wMS8yMDI0IDE2OjM0
OjAwKzA4MDAsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQg
NDoxN+KAr1BNIEFsZXhhbmRyZSBCZWxsb25pCj4gPiA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxp
bi5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAyMi8wMS8yMDI0IDE2OjA2OjMwKzA4MDAsIEpp
bmdiYW8gUWl1IHdyb3RlOgo+ID4gPiA+IEltcGxlbWVudCB0aGUgUlRDIGRyaXZlciBmb3IgQ1Yx
ODAwLCB3aGljaCBhYmxlIHRvIHByb3ZpZGUgdGltZSBhbGFybQo+ID4gPiA+IGFuZCBjYWxpYnJh
dGUgZnVuY3Rpb25hbGl0eS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEppbmdiYW8g
UWl1IDxxaXVqaW5nYmFvLmRsbXVAZ21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+
ID4gRGVwZW5kcyBvbiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1M0M3
NzRENDFFREYxRUFEQjZFQzE4QkI2RDJASUExUFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxv
b2suY29tLwo+ID4gPgo+ID4gPiBXaGF0IGlzIHRoZSBkZXBlbmRlbmN5Pwo+ID4gPgo+ID4KPiA+
IFRoYW5rIHlvdSwgdGhpcyBkcml2ZXIgcmVxdWlyZXMgc3VwcG9ydCBmcm9tIHRoZSBDTEsgZHJp
dmVyLgo+ID4gSSB3aWxsIGFkZCBhbiBleHBsYW5hdGlvbiBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+
ID4KPiA+ID4KPiA+ID4gQWxzbywgcGxlYXNlIGZpeCB0aGUgY2hlY2twYXRjaC5wbCAtLXN0cmlj
dCB3YXJuaW5ncwo+ID4KPiA+IEkgd2lsbCB1c2UgdGhlIC0tIHN0cmljdCBvcHRpb24gZm9yIHRl
c3RpbmcuCj4gPgo+ID4gPgo+ID4gPiA+ICsvKioKPiA+ID4gPiArICogY3YxODAwX3J0Y18zMmtf
Y29hcnNlX3ZhbF9jYWxpYigpIC0gVXNpbmcgYW4gZXh0ZXJuYWwKPiA+ID4gPiArICogY2xvY2sg
dG8gY29hcnNlIGNhbGlicmF0ZSB0aGUgY3J5c3RhbCBvc2NpbGxhdG9yCj4gPiA+ID4gKyAqIEBp
bmZvOiB0aGUgZGV2aWNlIG9mIGNhbGlicmF0ZWQKPiA+ID4gPiArICoKPiA+ID4gPiArICogQHJl
dHVybiAwIG9uIHN1Y2Nlc3MsIG9yIC0xIG9uIGZhaWwKPiA+ID4gPiArICoKPiA+ID4gPiArICog
VGhpcyBSVEMgaGFzIGFuIGluZGVwZW5kZW50IDMyS0h6IG9zY2lsbGF0b3IuIEhvd2V2ZXIsCj4g
PiA+ID4gKyAqIHRoZSBhY2N1cmFjeSBvZiB0aGlzIG9zY2lsbGF0b3IgaXMgZWFzaWx5IGFmZmVj
dGVkIGJ5Cj4gPiA+ID4gKyAqIGV4dGVybmFsIGVudmlyb25tZW50YWwgaW50ZXJmZXJlbmNlLHJl
c3VsdGluZyBpbiBsb3dlcgo+ID4gPiA+ICsgKiBhY2N1cmFjeSB0aGFuIHRoZSBpbnRlcm5hbCBv
c2NpbGxhdG9yLlRoZXJlZm9yZSwgYSAyNU0KPiA+ID4gPiArICogY3J5c3RhbCBvc2NpbGxhdG9y
IGlzIHVzZWQgYXMgYSByZWZlcmVuY2Ugc291cmNlIHRvCj4gPiA+ID4gKyAqIGNhbGlicmF0ZSB0
aGUgUlRDIGFuZCBpbXByb3ZlIGl0cyBhY2N1cmFjeS5DYWxpYnJhdGlvbgo+ID4gPiA+ICsgKiBp
cyBjb21wbGV0ZWQgdGhyb3VnaCB0d28gc3RlcHMsIG5hbWVseSByb3VnaCBjYWxpYnJhdGlvbgo+
ID4gPiA+ICsgKiBhbmQgZmluZSBjYWxpYnJhdGlvbi4KPiA+ID4gPiArICovCj4gPiA+ID4gK3N0
YXRpYyBpbnQgY3YxODAwX3J0Y18zMmtfY29hcnNlX3ZhbF9jYWxpYihzdHJ1Y3QgY3YxODAwX3J0
Y19wcml2ICppbmZvKQo+ID4gPgo+ID4gPiBUaGlzIGlzIHN0aWxsIG5vdCB3b3JraW5nIGFzIHdl
bGwgYXMgeW91IHRoaW5rIGl0IGlzLiBZb3Ugc2hvdWxkCj4gPiA+IEltcGxlbWVudCB0aGUgb2Zm
c2V0IGNhbGxiYWNrcyBpbnN0ZWFkLgo+ID4gPgo+ID4gSSdtIHNvcnJ5LCBJIGRvbid0IHF1aXRl
IHVuZGVyc3RhbmQgb2Zmc2V0IGNhbGxiYWNrcy4KPiA+IERvIHlvdSBtZWFuIHRoYXQgdGhpcyBm
dW5jdGlvbiBuZWVkcyB0byBiZSBleGVjdXRlZCBwZXJpb2RpY2FsbHkuCj4KPiBJIG1lYW4gaW1w
bGVtZW50IHJlYWRfb2Zmc2V0IGFuZCBzZXRfb2Zmc2V0IGhlcmU6Cj4gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuNy9zb3VyY2UvaW5jbHVkZS9saW51eC9ydGMuaCNMNjcKPgoK
VGhhbmsgeW91IGZvciB5b3VyIHBhdGllbnQgcmVwbHkuCkkgd2lsbCBkbyB0aGF0LgoKQmVzdCBy
ZWdhcmRzLApKaW5nYmFvIFFpdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
