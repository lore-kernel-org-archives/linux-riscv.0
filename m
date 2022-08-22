Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D92EC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HVQx9LDIGco/PHpogcB1I6dwsNyYycFp14slztI9uQ=; b=Kdt3/qBGc3PMZy
	QgH/KFxZCOe3ZXb1MNar0PYSobgCIMVTUIz1lapldGtnL9/PIh/kscexWjv0SoxTTu9bHdaZcJGEo
	5HDC7tsuLD2w3T2cGr3h12jfXXc0i8E11GrqZvj1NZiavK0XhzZ3GYwTVdHAg/XpCj0K/T5HHpRBi
	RwUlqlkF1NICJJd5HiY+Op0YL7oHY2ds7cGXah9gx8rHLN7pgsR4SClFrbDxfwFLzuytG9JLEC1SI
	73WmtsyMgxfZ1tdeSlLt96loMHjvCRjOLWNlwKoNSk0II2EAKbIiO8BHXVeeCLS4J/GVKWX62MyPz
	Rg4NK4y63w+PmxMyNQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ6b3-0096Mn-NY; Mon, 22 Aug 2022 12:32:01 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ6ay-0096Hi-7R
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 12:32:00 +0000
Received: by mail-qv1-f41.google.com with SMTP id j1so7949713qvv.8
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 05:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=JCvE0tIGIUKI4T1pwdPJfxx9bq80QkcidAq/OURkvig=;
        b=okVzvsKnDqmMnA7j4YMY4MJS+6iUoM1R4/4uZhm9OCeuF7WhmRltKj64q5qlDUZj5D
         kQ0a/oA9Fvsu1S9yH+66lu9eRIA+vQI9pa7ohD2gl+awlCu2TMH3bcutrao5DEZ9LuER
         J1xlCMmNJ4h1AcMPn6roDlQPbNu96a324DkLoFHJ0+tLc+qE3QMTyDFRfWxa8WMofkTE
         O8ro73pt+cyJuImsLXwXn+9XULRrOaaX/t1HJ0EoucYrQeVtMigbk6DsyaUtBWBArl/Q
         NdRRAojOjhuJ0+XA9e4udFf6nsajsiN9HKwtgkMHIyics8F8JAD4CIeL1mekUpOp5Oj4
         qkpw==
X-Gm-Message-State: ACgBeo1dvveK5eb8NAC5/ilhpAXWkxvucW9jM+fwwYIiqe7xzalekbUN
	T52mVVA9ibVVr/AcseACCeju0TH0BgDbKg==
X-Google-Smtp-Source: AA6agR5XE6wpllT4PHGcTE7Y145aYL9rOfror7r+I4WEaw3zJQmJyHt5flfyWXS+IsdfFbN8z63PDg==
X-Received: by 2002:a05:6214:5091:b0:496:dad0:6350 with SMTP id kk17-20020a056214509100b00496dad06350mr6039490qvb.88.1661171514385;
        Mon, 22 Aug 2022 05:31:54 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id br38-20020a05620a462600b006bbc09af9f5sm10390363qkb.101.2022.08.22.05.31.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 05:31:54 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-33365a01f29so288661177b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 05:31:53 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr18348478ybq.543.1661171513514; Mon, 22
 Aug 2022 05:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com> <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org> <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
 <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com> <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
In-Reply-To: <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 14:31:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
Message-ID: <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_053156_351368_3BADEF26 
X-CRM114-Status: GOOD (  34.90  )
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

SGkgQ29ub3IsCgpPbiBNb24sIEF1ZyAyMiwgMjAyMiBhdCAyOjEzIFBNIDxDb25vci5Eb29sZXlA
bWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gT24gMjIvMDgvMjAyMiAxMjo0NiwgR2VlcnQgVXl0dGVy
aG9ldmVuIHdyb3RlOgo+ID4gT24gU3VuLCBBdWcgMjEsIDIwMjIgYXQgMTI6MDcgUE0gPENvbm9y
LkRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+PiBPbiAyMS8wOC8yMDIyIDA3OjQ1LCBJ
Y2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4+PiDlnKggMjAyMi0wOC0yMOaYn+acn+WFreeahCAxNzoy
OSArMDAwMO+8jENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29t5YaZ6YGT77yaCj4gPj4+PiBPbiAy
MC8wOC8yMDIyIDE4OjI0LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPgo+ID4+Pj4+IFRoaXMgaXMg
bm90IGZlYXNpYmxlLCBkdWUgdG8gdGhlIGRpZmZlcmVudCAjaW50ZXJydXB0LWNlbGxzLiBTZWUK
PiA+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9DQU11SE1kWEhTTWNy
Vk9IK3ZjcmRSUkYraTJUa01jRmlzR3hITUJQVUVhOG5UTUZwendAbWFpbC5nbWFpbC5jb20vCj4g
Pj4+Pj4KPiA+Pj4+PiBFdmVuIGlmIHdlIHNoYXJlIHNvbWUgZmlsZSBhY3Jvc3MgYXJjaGl0ZWN0
dXJlcywgeW91IHN0aWxsIGhhdmUgdG8KPiA+Pj4+PiB1cGRhdGUgZmlsZXMKPiA+Pj4+PiBpbiBi
b3RoIHBsYWNlcyB0byBnZXQgdGhlIGludGVycnVwdHMgcHJvcGVydGllcyBjb3JyZWN0Lgo+ID4+
Pj4+Cj4gPj4+Pj4gSSBnZXQgdGhlIGRlc2lyZSB0byBkZWR1cGxpY2F0ZSB0aGluZ3MsIGJ1dCB3
ZSBhbHJlYWR5IGRlYWwgd2l0aAo+ID4+Pj4+IHVwZGF0aW5nIHRoZQo+ID4+Pj4+IHNhbWUvc2lt
aWxhciBub2RlcyBhY3Jvc3Mgc2V2ZXJhbCBTb0NzLCBzbyB0aGF0IGlzIG5vdGhpbmcgbmV3LiBJ
Cj4gPj4+Pj4gdGhpbmsgaXQgd291bGQKPiA+Pj4+PiBiZSBtb3JlIGNvbmZ1c2luZy9jb21wbGlj
YXRlZCB0byBoYXZlIGFsbCBvZiB0aGUgaW50ZXJydXB0cwo+ID4+Pj4+IHByb3BlcnRpZXMKPiA+
Pj4+PiBvdmVycmlkZGVuIGluIGEgc2VwYXJhdGUgZmlsZS4KPiA+Pj4+Cj4gPj4+PiBZZWFoLCBz
aG91bGQgbWF5YmUgaGF2ZSBjaXJjbGVkIGJhY2sgYWZ0ZXIgdGhhdCBjb252ZXJzYXRpb24sIHdv
dWxkCj4gPj4+PiBoYXZlIGJlZW4KPiA+Pj4+IG5pY2UgYnV0IGlmIHRoZSBEVEMgY2FuJ3QgZG8g
aXQgbmljZWx5IHRoZW4gdy9lLgo+ID4+Pgo+ID4+PiBXZWxsLCBtYXliZSB3ZSBjYW4gb3ZlcnVz
ZSB0aGUgZmFjaWxpdHkgb2YgQyBwcmVwcm9jZXNzb3I/Cj4gPj4+Cj4gPj4+IGUuZy4KPiA+Pj4K
PiA+Pj4gYGBgCj4gPj4+IC8vIEZvciBBUk0KPiA+Pj4gI2RlZmluZSBTT0NfUEVSSVBIRVJBTF9J
UlEobikgR0lDX1NQSSBuCj4gPj4+IC8vIEZvciBSSVNDLVYKPiA+Pj4gI2RlZmluZSBTT0NfUEVS
SVBIRVJBTF9JUlEobikgbgo+ID4+PiBgYGAKPiA+Pj4KPiA+Pgo+ID4+IEdlZXJ0IHBvaW50ZWQg
b3V0IHRoYXQgdGhpcyBpcyBub3QgcG9zc2libGUgKGF0IGxlYXN0IG9uIHRoZSBSZW5lc2FzCj4g
Pj4gc3R1ZmYpIGJlY2F1c2UgdGhlIEdJQyBpbnRlcnJ1cHQgbnVtYmVycyBhcmUgbm90IHRoZSBz
YW1lIGFzIHRoZQo+ID4+IFBMSUMncyAmIHRoZSBEVEMgaXMgbm90IGFibGUgdG8gaGFuZGxlIHRo
ZSBhZGRpdGlvbjoKPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9DQU11
SE1kWEhTTWNyVk9IK3ZjcmRSUkYraTJUa01jRmlzR3hITUJQVUVhOG5UTUZwendAbWFpbC5nbWFp
bC5jb20vCj4gPgo+ID4gV2l0aG91dCB0aGUgYWJpbGl0eSB0byBkbyBhZGRpdGlvbnMgaW4gRFRD
LCB3ZSBjb3VsZCBlLmcuIGxpc3QgYm90aAo+ID4gaW50ZXJydXB0cyBpbiB0aGUgbWFjcm8sIGxp
a2U6Cj4gPgo+ID4gICAgICAvLyBGb3IgQVJNCj4gPiAgICAgICNkZWZpbmUgU09DX1BFUklQSEVS
QUxfSVJRKG5hLCBucikgR0lDX1NQSSBuYQo+ID4gICAgICAvLyBGb3IgUklTQy1WCj4gPiAgICAg
ICNkZWZpbmUgU09DX1BFUklQSEVSQUxfSVJRKG5hLCBucikgbnIKPgo+IERvIHlvdSB0aGluayB0
aGlzIGlzIHdvcnRoIGRvaW5nPyBPciBhcmUgeW91IGp1c3QgcHJvdmlkaW5nIGFuCj4gZXhhbXBs
ZSBvZiB3aGF0IGNvdWxkIGJlIGRvbmU/CgpKdXN0IHNvbWUgYnJhaW5zdG9ybWluZy4uLgoKPiBX
aGVyZSB3b3VsZCB5b3UgZW52aXNhZ2UgcHV0dGluZyB0aGVzZSBtYWNyb3M/IEkgZm9yZ2V0IHRo
ZSBvcmRlcgo+IG9mIHRoZSBDUFAgb3BlcmF0aW9ucyB0aGF0IGFyZSBkb25lLCBjYW4gdGhleSBi
ZSBwdXQgaW4gdGhlIGR0cz8KClRoZSBTT0NfUEVSSVBIRVJBTF9JUlEoKSBtYWNybyBzaG91bGQg
YmUgZGVmaW5lZCBpbiB0aGUKQVJNLWJhc2VkIFNvQy5kdHNpIGZpbGUgYW5kIHRoZSBSSVNDLVYt
YmFzZWQgU29DLmR0c2kgZmlsZS4KCj4gPiBPbiBNb24sIEF1ZyAyMiwgMjAyMiBhdCAxMjo1MiBQ
TSBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4gd3JvdGU6Cj4gPj4gVGhl
cmUgYXJlIGludGVycnVwdC1tYXBzIGZvciB0aGF0Ogo+ID4+IHN1bjhpLXI1MjguZHRzaToKPiA+
PiAgICAgICAgICBzb2Mgewo+ID4+ICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9
IDwxPjsKPiA+PiAgICAgICAgICAgICAgICAgIGludGVycnVwdC1tYXAgPSA8MCAgMTggJmdpYyBH
SUNfU1BJICAyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwwICAxOSAmZ2ljIEdJQ19TUEkgIDMgSVJRX1RZUEVfTEVWRUxfSElHSD4s
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+ID4+Cj4gPj4gc3Vu
MjBpLWQxLmR0c2k6Cj4gPj4gICAgICAgICAgc29jIHsKPiA+PiAgICAgICAgICAgICAgICAgICNp
bnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gPj4gICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbWFw
ID0gPDAgIDE4ICZwbGljICAxOCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8MCAgMTkgJnBsaWMgIDE5IElSUV9UWVBFX0xFVkVMX0hJ
R0g+LAo+ID4+Cj4gPj4gdGhlbiwgaW4gdGhlIHNoYXJlZCAuZHRzaToKPiA+PiAgICAgICAgICAg
ICAgICAgIHVhcnQwOiBzZXJpYWxAMjUwMDAwMCB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7Cj4gPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIC4uLgo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0g
PDE4PjsKPiA+Cj4gPiBOaWNlISBCdXQgaXQncyBnb25uYSBiZSBhIHZlcnkgbGFyZ2UgaW50ZXJy
dXB0LW1hcC4KPgo+IEkgcXVpdGUgbGlrZSB0aGUgaWRlYSBvZiBub3QgZHVwbGljYXRpbmcgZmls
ZXMgYWNyb3NzIHRoZSBhcmNocwo+IGlmIGl0IGNhbiBiZSBoZWxwZWQsIGJ1dCBub3QgYXQgdGhl
IGV4cGVuc2Ugb2YgbWFraW5nIHRoZW0gaGFyZCB0bwo+IHVuZGVyc3RhbmQgJiBJIGZlZWwgbGlr
ZSB1bmZvcnR1bmF0ZWx5IHRoZSBsYXJnZSBpbnRlcnJ1cHQgbWFwIGlzCj4gaW4gdGhhdCB0ZXJy
aXRvcnkuCgpJIGZlZWwgdGhlIHNhbWUuCkV2ZW4gbGlzdGluZyBib3RoIGludGVycnVwdCBudW1i
ZXJzIGluIFNPQ19QRVJJUEhFUkFMX0lSUShuYSwgbnIpCmlzIGEgcmlzayBmb3IgbWFraW5nIG1p
c3Rha2VzLgoKU28gcGVyc29uYWxseSwgSSdtIGluIGZhdm9yIG9mIHRlYWNoaW5nIGR0YyBhcml0
aG1ldGljLCBzbyB3ZSBjYW4KaGFuZGxlIHRoZSBvZmZzZXQgaW4gU09DX1BFUklQSEVSQUxfSVJR
KCkuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
