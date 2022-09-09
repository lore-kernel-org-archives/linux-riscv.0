Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9B8ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bA0+2vQZ1LypF/eOAPdHwPHe+tKMk6/VunwTmtJFBE=; b=hGcrLOgmi2I7RG
	vDka8e236o+QrczEZl5bNuzu+vaK61CH78d84UkfwnIwd61VGWbm7ZIuk+ontalQqfJ9lsI32Dr28
	ZXf7kDSI5o5t8/73dx08tvzRvmefeiPsll/vok1vwJzlk5UApPfR74dgzTMRV17sxI3MHoLiLV/XA
	fUuX4Pny1NLYFATotmom+uY8AL1/a5CPxeeWWGHSQdSeMTaxzfYpctYrRRJsS449F3hkVFLAdLyis
	dCY3hy22MNgyr+we4J6MFcicmiKFVlseVePV4fV1C3bYWO4i8rTqKBrO2qa76xl5pQsiHBaiQGWvJ
	ILlLU+Z0I4yPllHT1T8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYGx-00DnDg-2b; Fri, 09 Sep 2022 07:17:55 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYGi-00DmSR-TP
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 07:17:42 +0000
Received: by mail-qk1-f169.google.com with SMTP id g13so564513qkm.4
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 00:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GbISm7ahSLrwT2Au2tPllsLxCWm8oBE76/YUTIUdxx0=;
        b=bF5Oa7QSpw0f46XK6AkXKm3tkZsVdqwRgP5MjVL15DABMAkMnG5xCPQKyyZRp8CL/d
         vp39OvR3bj10skaESyrNDH94aWvexjbHR6rivimFfQhufnbVL/iU+5D2KcuuBXHZy0JC
         jNlPCn8YUCDb1eX67f+++enCAFNPSbZwqYTW3KCf0UZgK0tYzZ29L4NB0o3dZY9adJcF
         0kAwFrQEqH+EwM3iRngevDslUh2QM3YTqU5G1p9Guht5mEVix5/2u0Bskx9thNv1/PyA
         lpvRcArWdn1w4dWUqYADZEVREzutZgAxeeRqJK5eDXyEJUsqSYcg4LqOc6kMspxiMlhR
         C9QQ==
X-Gm-Message-State: ACgBeo10l97afS3RrFh5d5XZfohBv8P+j55LLV04u9kD6nwm1/CAuLml
	hm2GYR/KeQiFlcexxtNB1+Ezt+/HLpN7FA==
X-Google-Smtp-Source: AA6agR5ZhIyZymHrZzFTb6Y9imrmrD954SeiQvKkhKv0ySx2p4iuKRJHJnnO1aTRstP0jVqq9qnPCQ==
X-Received: by 2002:a05:620a:25d0:b0:6bb:f597:1a3 with SMTP id y16-20020a05620a25d000b006bbf59701a3mr8977206qko.43.1662707855410;
        Fri, 09 Sep 2022 00:17:35 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id w16-20020ac87190000000b0034305a91aaesm1012249qto.83.2022.09.09.00.17.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:17:35 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 130so1381401ybw.8
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 00:17:35 -0700 (PDT)
X-Received: by 2002:a25:3851:0:b0:6ad:9cba:9708 with SMTP id
 f78-20020a253851000000b006ad9cba9708mr8823957yba.36.1662707449504; Fri, 09
 Sep 2022 00:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com> <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org> <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
 <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com> <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com> <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
 <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com> <C0B4F750-1C99-408A-A2DA-B72BBF7361B4@jrtc27.com>
 <b3fdb3cc-a8fc-b980-c8f4-f96d4733ce56@sholland.org>
In-Reply-To: <b3fdb3cc-a8fc-b980-c8f4-f96d4733ce56@sholland.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Sep 2022 09:10:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMM9H4jLJ8-zOz9SXoqmK-s4zRWzGCsU8jt_sDgY1h+Q@mail.gmail.com>
Message-ID: <CAMuHMdUMM9H4jLJ8-zOz9SXoqmK-s4zRWzGCsU8jt_sDgY1h+Q@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: Samuel Holland <samuel@sholland.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andre Przywara <andre.przywara@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, devicetree <devicetree@vger.kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_001740_994569_0681A527 
X-CRM114-Status: GOOD (  36.79  )
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

SGkgU2FtdWVsLAoKT24gRnJpLCBTZXAgOSwgMjAyMiBhdCA1OjQyIEFNIFNhbXVlbCBIb2xsYW5k
IDxzYW11ZWxAc2hvbGxhbmQub3JnPiB3cm90ZToKPiBPbiA4LzIyLzIyIDEwOjI5IEFNLCBKZXNz
aWNhIENsYXJrZSB3cm90ZToKPiA+IE9uIDIyIEF1ZyAyMDIyLCBhdCAxNDo1NiwgY29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPj4gT24gMjIvMDgvMjAyMiAxMzozMSwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4+Pj4gRG8geW91IHRoaW5rIHRoaXMgaXMgd29ydGggZG9p
bmc/IE9yIGFyZSB5b3UganVzdCBwcm92aWRpbmcgYW4KPiA+Pj4+IGV4YW1wbGUgb2Ygd2hhdCBj
b3VsZCBiZSBkb25lPwo+ID4+Pgo+ID4+PiBKdXN0IHNvbWUgYnJhaW5zdG9ybWluZy4uLgo+ID4+
Pgo+ID4+Pj4gV2hlcmUgd291bGQgeW91IGVudmlzYWdlIHB1dHRpbmcgdGhlc2UgbWFjcm9zPyBJ
IGZvcmdldCB0aGUgb3JkZXIKPiA+Pj4+IG9mIHRoZSBDUFAgb3BlcmF0aW9ucyB0aGF0IGFyZSBk
b25lLCBjYW4gdGhleSBiZSBwdXQgaW4gdGhlIGR0cz8KPiA+Pj4KPiA+Pj4gVGhlIFNPQ19QRVJJ
UEhFUkFMX0lSUSgpIG1hY3JvIHNob3VsZCBiZSBkZWZpbmVkIGluIHRoZQo+ID4+PiBBUk0tYmFz
ZWQgU29DLmR0c2kgZmlsZSBhbmQgdGhlIFJJU0MtVi1iYXNlZCBTb0MuZHRzaSBmaWxlLgo+ID4+
Cj4gPj4gUmlnaHQsIG9uZSBsZXZlbCB1cCBidXQgfnRoZSBzYW1lIHJlc3VsdC4KPiA+Pgo+ID4+
Pj4+IE5pY2UhIEJ1dCBpdCdzIGdvbm5hIGJlIGEgdmVyeSBsYXJnZSBpbnRlcnJ1cHQtbWFwLgo+
ID4+Pj4KPiA+Pj4+IEkgcXVpdGUgbGlrZSB0aGUgaWRlYSBvZiBub3QgZHVwbGljYXRpbmcgZmls
ZXMgYWNyb3NzIHRoZSBhcmNocwo+ID4+Pj4gaWYgaXQgY2FuIGJlIGhlbHBlZCwgYnV0IG5vdCBh
dCB0aGUgZXhwZW5zZSBvZiBtYWtpbmcgdGhlbSBoYXJkIHRvCj4gPj4+PiB1bmRlcnN0YW5kICYg
SSBmZWVsIGxpa2UgdW5mb3J0dW5hdGVseSB0aGUgbGFyZ2UgaW50ZXJydXB0IG1hcCBpcwo+ID4+
Pj4gaW4gdGhhdCB0ZXJyaXRvcnkuCj4gPj4+Cj4gPj4+IEkgZmVlbCB0aGUgc2FtZS4KPiA+Pj4g
RXZlbiBsaXN0aW5nIGJvdGggaW50ZXJydXB0IG51bWJlcnMgaW4gU09DX1BFUklQSEVSQUxfSVJR
KG5hLCBucikKPiA+Pj4gaXMgYSByaXNrIGZvciBtYWtpbmcgbWlzdGFrZXMuCj4gPj4+Cj4gPj4+
IFNvIHBlcnNvbmFsbHksIEknbSBpbiBmYXZvciBvZiB0ZWFjaGluZyBkdGMgYXJpdGhtZXRpYywg
c28gd2UgY2FuCj4gPj4+IGhhbmRsZSB0aGUgb2Zmc2V0IGluIFNPQ19QRVJJUEhFUkFMX0lSUSgp
Lgo+ID4+Cj4gPj4gWXVwLCBpbiB0aGUgc2FtZSBib2F0IGhlcmUuIG1heWIgSSdsbCBnZXQgYm9y
ZWQgZW5vdWdoIHRvIGJpdGUuLgo+ID4KPiA+IE5vdGUgdGhhdCBHUEzigJllZCBkdGMgaXNu4oCZ
dCB0aGUgb25seSBpbXBsZW1lbnRhdGlvbi4gRnJlZUJTRCB1c2VzIGEKPiA+IEJTRC1saWNlbnNl
ZCBpbXBsZW1lbnRhdGlvblsxXSBhbmQgc28gYWRkaW5nIG5ldyBmZWF0dXJlcyBsaWtlIHRoaXMg
dG8KPiA+IEdQTCBkdGMgdGhhdCBhY3R1YWxseSBnZXQgdXNlZCB3b3VsZCByZXF1aXJlIHVzIHRv
IHJlaW1wbGVtZW50IGl0IHRvby4KPiA+IEkgZG9u4oCZdCBrbm93IGhvdyBtdWNoIGVmZm9ydCBp
dCB3b3VsZCBiZSBidXQgcGxlYXNlIGtlZXAgdGhpcyBpbiBtaW5kLgo+Cj4gSSBwbGFuIHRvIGdv
IHdpdGggdGhlICJTT0NfUEVSSVBIRVJBTF9JUlEobmEsIG5yKSIgaW1wbGVtZW50YXRpb24gZm9y
IHYyLiBJIGxpa2UKPiB0aGF0IGl0IG9ubHkgYWZmZWN0cyB0aGUgRFQgc291cmNlLCBhbmQgZG9l
cyBub3QgbGVhayBpbnRvIHRoZSBEVEIuIFdlIHN0aWxsCj4gaGF2ZSB0aGUgZnJlZWRvbSB0byBz
d2l0Y2ggdG8gdXNpbmcgYXJpdGhtZXRpYyBsYXRlciB3aGVuIGFsbCBvZiB0aGUgdG9vbHMKPiBz
dXBwb3J0IGl0LgoKTWF5IEkgc3VnZ2VzdCBhbiBhbHRlcm5hdGl2ZSBzb2x1dGlvbiwgd2hpY2gg
d291bGQgYmUgbW9yZSBnZW5lcmljLAphbmQgY2FuIGJlIGV4dGVuZGVkIHRvIG90aGVyL21vcmUg
Q1BVIGNvcmVzIGVhc2lseToKClNwZWNpZnkgYm90aCBpbnRlcnJ1cHRzIGluIHRoZSAuZHRzaSwg
YnV0IHdyYXBwZWQgaW5zaWRlIGUuZy4gQVJNKCkKcmVzcC4gUklTQ1YoKSBtYWNyb3M6CgogICAg
QVJNKGludGVycnVwdHMgPSA8R0lDX1NQSSAzODAgSVJRX1RZUEVfTEVWRUxfSElHSD47KQogICAg
UklTQ1YoaW50ZXJydXB0cyA9IDw0MTIgSVJRX1RZUEVfTEVWRUxfSElHSD47KQoKVGhlIHNhbWUg
Y29uc3RydWN0IGNhbiBiZSB1c2VkIGZvciBlLmcuIGludGVycnVwdC1wYXJlbnQuClRoZSBBUk0g
LmR0cyB3b3VsZCBkZWZpbmU6CgogICAgI2RlZmluZSBBUk0oeC4uLikgICAgeAogICAgI2RlZmlu
ZSBSSVNDVih4Li4uLikKCmJlZm9yZSBpbmNsdWRpbmcgdGhlIC5kdHNpLgpUaGUgUklTQy1WIERU
UyB3b3VsZCBkZWZpbmUgaW5zdGVhZDoKCiAgICAjZGVmaW5lIEFSTSh4Li4uKQogICAgI2RlZmlu
ZSBSSVNDVih4Li4uKSAgICB4CgpDZnIuIHRoZSBBUl9DTEFTUygpLCBNX0NMQVNTKCksIEFSTSgp
LCBhbmQgVEhVTUIoKSBtYWNyb3MgaW4KYXJjaC9hcm0vaW5jbHVkZS9hc20vdW5pZmllZC5oLgoK
Tm90ZSB0aGF0IHRoaXMgaXMgbm90IGV4YWN0bHkgYSBuZXcgaXNzdWUuICBJdCdzIGZhaXJseSBj
b21tb24gZm9yClNvQ3MgdG8gaGF2ZSBzZXBhcmF0ZSBhcHBsaWNhdGlvbiBhbmQgcmVhbC10aW1l
IGNvcmVzLCBhbmQgb24tU29DCmRldmljZXMgbWF5IGJlIHdpcmVkIHRvIG11bHRpcGxlIGludGVy
cnVwdCBjb250cm9sbGVycyBzZXJ2aW5nCnRoZSBBUCByZXNwLiBSVCBjb3Jlcy4gSWYgYm90aCBj
b3JlIHNldHMgYXJlIEFSTSwgYm90aCBpbnRlcnJ1cHQKY29udHJvbGxlcnMgbWF5IGJlIEdJQywg
YW5kIHRoZSBwcm9ibGVtIG1heSBiZSBsZXNzIHNldmVyZSBhbmQganVzdApuZWVkIGEgZGlmZmVy
ZW50ICNpbnRlcnJ1cHQtcGFyZW50LgpCdXQgaW4gY2FzZSBvZiBBUk0gdnMuIFJJU0MtViwgb3Ig
ZGlmZmVyZW50IHdpcmluZ3MgZnJvbSBkZXZpY2VzCnRvIGludGVycnVwdCBjb250cm9sbGVycywg
eW91IGRvIG5lZWQgY29tcGxldGVseSBkaWZmZXJlbnQgaW50ZXJydXB0cwpwcm9wZXJ0aWVzLgoK
PiBNeSBvdGhlciBjb25jZXJuIGlzIHRoYXQgdGhlIGJpZyBpbnRlcnJ1cHQtbWFwIHByb3BlcnR5
IHdvdWxkIG1ha2UgRFQgb3ZlcmxheXMKPiBldmVuIG1vcmUgcGFpbmZ1bCB0byBkZWFsIHdpdGgu
IEkgZG9uJ3QgdGhpbmsgb3ZlcmxheXMgY2FuIGFwcGVuZCB0byBhIHByb3BlcnR5LAo+IG9ubHkg
cmVwbGFjZSBpdC4KCkluZGVlZCwgb3ZlcmxheXMgY2FuIG9ubHkgYWRkL3JlcGxhY2UvZGVsZXRl
IHByb3BlcnRpZXMuClNhbWUgZm9yIHBsYWluIERUUyBmaWxlcywgQlRXLgpCdXQgSSBhZ3JlZSBo
YXZpbmcgL2FwcGVuZC1wcm9wZXJ0eS8gd291bGQgYmUgdXNlZnVsIGluIGdlbmVyYWwuCgoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
