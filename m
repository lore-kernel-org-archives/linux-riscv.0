Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60797C48260
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUmWSL7NyYWPK4tXYbZzclaTfsv+Rj8F+OGIOviZS/0=; b=G8PXXXlDgd+UEX
	iW6QVEXDpG/h++ntzkUnVzdRz/FGJY0u9aQQPZRX5HcFMKV8C1dgQPsHg2gjZPCpSO258vG2ykLiK
	67/PP5PDpTUlvdmhyEN2XfZL9NvA2p92Iq/vI3YeBB8UXcobvxhCZ0pFnvH/Aj0HGV+e7JhRim2Yp
	/g+OfwB4VKHsPtD9Lz+RGO/+NeuWb3OAWbZUtFNFckaqV6rPovy2/9ECo7xmzu0yaQ2Tzm0JoeKCn
	HnZW0Va4gzzWgDyVaGdZUxwjS1rOFSM8uD/lHofk4U0UErJAA9AHzNK+0GakDcxfUlatyoEQKTK/7
	/BIajLAoVoDZ9xxZD8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzKt-00000009f69-1TxS;
	Mon, 19 Feb 2024 08:49:15 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzKr-00000009f4p-02CA
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 08:49:14 +0000
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so3422517276.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 00:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332547; x=1708937347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTdtRAbjyGCzCQegMpo3kd+/+HCaaACEQW/D0yb7/D4=;
        b=QbneDfX6MLxF6EFgXhMUJ9K0f7jj2bnJFFKLZ/O+mqg9Rc0a8V9+llKfrBEs3LS9zB
         oIOhHZrgIWDdCm44lQKdO4lItH3NqR5/u8fnVDI6yR1IcBQk4sguYzXsZXnvV5ETkPYx
         okQapzZl2+Gh9PlNKPAMjb+0zIvLtchOTAEGBsplDR5IXk6EXXRMXQsCzCxQ8WeA1109
         ZiNJBkKd7+4fv3Dj7vhZCEitPdIORh4n4H4QKUj+sXYLs+PoLorQwKdD6ZL8msXiBQpG
         tht6hcvzv8qvWkjBmMn5jiTuEFXih/eu62orfjcmJQbVZcad4k4ZSB7RIDTzPAm32BKU
         1FoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCC7u0myG0qFmLYddoe54MSltFD4ed8PRuY1THAm05V/CnVERI5KEQGVpxOypnQZ8gLfWxmYQHKtrbByvhrnDqw4kNwSX0X0nkpYxNje8U
X-Gm-Message-State: AOJu0YzmMAEbYr7QUGwGlHzJGp5JkbXP3fnqiebhYo/UGXjOkHbryE0x
	6AW1qxqdcmDBJffgv/E4nabbUEEFKOuxomj//zRFPYO2scRwozKLvg8D0hPe8+o=
X-Google-Smtp-Source: AGHT+IE8JJCr7urPj6LOi2nq94oDzwdsLOi1M9kGbHeV5tBNdxrUC6jec3HXylFNdZKoZMS0yM0XgQ==
X-Received: by 2002:a5b:549:0:b0:dc6:df24:4e36 with SMTP id r9-20020a5b0549000000b00dc6df244e36mr9742717ybp.11.1708332547193;
        Mon, 19 Feb 2024 00:49:07 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id r204-20020a2544d5000000b00dcdb7d232f9sm1456125yba.4.2024.02.19.00.49.06
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:49:06 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607f8482b88so24603107b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 00:49:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQTJX2XWfmzsak9VTQEXwVZnLGwE8Zv9zBA/HebPTn3GoWcx0b5MTW5wibxA9BXfTM+Be6eyHo8l61ZUOs4irLxqDupi7/cLNxM6Fsh0FS
X-Received: by 2002:a05:690c:a16:b0:608:28a9:5cfb with SMTP id
 cg22-20020a05690c0a1600b0060828a95cfbmr2721260ywb.16.1708332545819; Mon, 19
 Feb 2024 00:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-8-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWdJ9jN9-cko2zSoqSS0acbwYB77aBWvenJHMrFTXhdWg@mail.gmail.com> <4098873b-a7e7-4c88-9af2-01f3c76424ab@tuxon.dev>
In-Reply-To: <4098873b-a7e7-4c88-9af2-01f3c76424ab@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2024 09:48:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0HDK2w1N-k_R9ud_CVotRgAd2CjOoHTsWkSE_Rb7zyQ@mail.gmail.com>
Message-ID: <CAMuHMdX0HDK2w1N-k_R9ud_CVotRgAd2CjOoHTsWkSE_Rb7zyQ@mail.gmail.com>
Subject: Re: [PATCH 07/17] clk: renesas: rzg2l: Extend power domain support
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_004913_073355_BD8F9FB4 
X-CRM114-Status: GOOD (  35.42  )
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

SGkgQ2xhdWRpdSwKCk9uIE1vbiwgRmViIDE5LCAyMDI0IGF0IDk6MjTigK9BTSBjbGF1ZGl1IGJl
em5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PiB3cm90ZToKPiBPbiAxNi4wMi4yMDI0IDE2
OjA4LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiA4LCAyMDI0IGF0
IDE6NDTigK9QTSBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+ID4+
IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4K
PiA+Pgo+ID4+IFJaL3tHMkwsIFYyTCwgRzNTfS1iYXNlZCBDUEcgdmVyc2lvbnMgaGF2ZSBzdXBw
b3J0IGZvciBzYXZpbmcgZXh0cmEKPiA+PiBwb3dlciB3aGVuIGNsb2NrcyBhcmUgZGlzYWJsZWQg
YnkgYWN0aXZhdGluZyBtb2R1bGUgc3RhbmRieS4gVGhpcyBpcyBkb25lCj4gPj4gdGhyb3VnaCBN
U1RPUC1zcGVjaWZpYyByZWdpc3RlcnMgdGhhdCBhcmUgcGFydCBvZiBDUEcuIEVhY2ggaW5kaXZp
ZHVhbAo+ID4+IG1vZHVsZSBoYXMgb25lIG9yIG1vcmUgYml0cyBhc3NvY2lhdGVkIHdpdGggb25l
IE1TVE9QIHJlZ2lzdGVyIChzZWUgdGFibGUKPiA+PiAiUmVnaXN0ZXJzIGZvciBNb2R1bGUgU3Rh
bmRieSBNb2RlIiBmcm9tIEhXIG1hbnVhbHMpLiBIYXJkd2FyZSBtYW51YWwKPiA+PiBhc3NvY2lh
dGVzIG1vZHVsZXMnIGNsb2NrcyB3aXRoIG9uZSBvciBtb3JlIE1TVE9QIGJpdHMuIFRoZXJlIGFy
ZSAzIG1hcHBpbmdzCj4gPj4gYXZhaWxhYmxlIChpZGVudGlmaWVkIGJ5IHJlc2VhcmNoaW5nIFJa
L0cyTCwgUlovRzNTLCBSWi9WMkwgSFcgbWFudWFscyk6Cj4gPj4KPiA+PiBjYXNlIDE6IE4gY2xv
Y2tzIG1hcHBlZCB0byBOIE1TVE9QIGJpdHMgKHdpdGggTj17MCwgLi4uLCBYfSkKPiA+PiBjYXNl
IDI6IE4gY2xvY2tzIG1hcHBlZCB0byAxIE1TVE9QIGJpdCAgKHdpdGggTj17MCwgLi4uLCBYfSkK
PiA+PiBjYXNlIDM6IE4gY2xvY2tzIG1hcHBlZCB0byBNIE1TVE9QIGJpdHMgKHdpdGggTj17MCwg
Li4uLCBYfSwgTT17MCwgLi4uLCBZfSkKPiA+Pgo+ID4+IENhc2UgMyBoYXMgYmVlbiBjdXJyZW50
bHkgaWRlbnRpZmllZCBvbiBSWi9WMkwgZm9yIHRoZSBWQ1BMNCBtb2R1bGUuCj4gPj4KPiA+PiBU
byBjb3ZlciBhbGwgdGhyZWUgY2FzZXMsIHRoZSBpbmRpdmlkdWFsIHBsYXRmb3JtIGRyaXZlcnMg
d2lsbCBwcm92aWRlIHRvCj4gPj4gY2xvY2sgZHJpdmVyIE1TVE9QIHJlZ2lzdGVyIG9mZnNldCBh
bmQgYXNzb2NpYXRlZCBiaXRzIGluIHRoaXMgcmVnaXN0ZXIKPiA+PiBhcyBhIGJpdG1hc2sgYW5k
IHRoZSBjbG9jayBkcml2ZXIgd2lsbCBhcHBseSB0aGlzIGJpdG1hc2sgdG8gcHJvcGVyCj4gPj4g
TVNUT1AgcmVnaXN0ZXIuCj4gPj4KPiA+PiBBcGFydCBmcm9tIE1TVE9QIHN1cHBvcnQsIFJaL0cz
UyBjYW4gc2F2ZSBtb3JlIHBvd2VyIGJ5IHBvd2VyaW5nIGRvd24gdGhlCj4gPj4gaW5kaXZpZHVh
bCBJUHMgKGFmdGVyIE1TVE9QIGhhcyBiZWVuIHNldCkgaWYgcHJvcGVyIGJpdHMgaW4KPiA+PiBD
UEdfUFdSRE5fSVB7MSwyfSByZWdpc3RlcnMgYXJlIHNldC4KPiA+Pgo+ID4+IFRoZSBNU1RPUCBh
bmQgSVAgcG93ZXIgZG93biBzdXBwb3J0IHdlcmUgaW1wbGVtZW50ZWQgdGhyb3VnaCBwb3dlcgo+
ID4+IGRvbWFpbnMuIFBsYXRmb3JtLXNwZWNpZmljIGNsb2NrIGRyaXZlcnMgd2lsbCByZWdpc3Rl
ciBhbiBhcnJheSBvZgo+ID4+IHR5cGUgc3RydWN0IHJ6ZzJsX2NwZ19wbV9kb21haW5faW5pdF9k
YXRhLCB3aGljaCB3aWxsIGJlIHVzZWQgdG8KPiA+PiBpbnN0YW50aWF0ZSBwcm9wZXJseSB0aGUg
cG93ZXIgZG9tYWlucy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxj
bGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghCj4gPgo+ID4+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMKPiA+
PiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jCj4gPj4gQEAgLTE1NTksOSAr
MTU1NiwzNCBAQCBzdGF0aWMgYm9vbCByemcybF9jcGdfaXNfcG1fY2xrKHN0cnVjdCByemcybF9j
cGdfcHJpdiAqcHJpdiwKPiA+PiAgICAgICAgIHJldHVybiB0cnVlOwo+ID4+ICB9Cj4gWyAuLi4g
XQo+Cj4gPgo+ID4+IEBAIC0yMzQsNiArMjQ2LDU0IEBAIHN0cnVjdCByemcybF9yZXNldCB7Cj4g
Pj4gICNkZWZpbmUgREVGX1JTVChfaWQsIF9vZmYsIF9iaXQpICAgICAgIFwKPiA+PiAgICAgICAg
IERFRl9SU1RfTU9OKF9pZCwgX29mZiwgX2JpdCwgLTEpCj4gPj4KPiA+PiArLyoqCj4gPj4gKyAq
IHN0cnVjdCByemcybF9jcGdfcG1fZG9tYWluX2NvbmYgLSBQTSBkb21haW4gY29uZmlndXJhdGlv
biBkYXRhIHN0cnVjdHVyZQo+ID4+ICsgKiBAbXN0b3A6IE1TVE9QIGNvbmZpZ3VyYXRpb24gKE1T
QiA9IHJlZ2lzdGVyIG9mZnNldCwgTFNCID0gYml0bWFzaykKPiA+PiArICogQHB3cmRuOiBQV1JE
TiBjb25maWd1cmF0aW9uIChNU0IgPSByZWdpc3RlciBvZmZzZXQsIExTQiA9IHJlZ2lzdGVyIGJp
dCkKPiA+PiArICovCj4gPj4gK3N0cnVjdCByemcybF9jcGdfcG1fZG9tYWluX2NvbmYgewo+ID4+
ICsgICAgICAgdTMyIG1zdG9wOwo+ID4+ICsgICAgICAgdTMyIHB3cmRuOwo+ID4KPiA+IFdoeSBu
b3QKPiA+Cj4gPiAgICAgdTE2IG1zdG9wX29mZjsKPiA+ICAgICB1MTYgbXN0b3BfbWFzazsKPiA+
ICAgICB1MTYgcHdyZG5fb2ZmOwo+ID4gICAgIHUxNiBwd3Jkbl9tYXNrOwo+ID4KPiA+IHNvIHlv
dSBjYW4gZHJvcCB0aGUgTVNUT1AqKCkgYW5kIFBXUkROKigpIG1hY3JvcyBiZWxvdz8KPgo+IEkg
ZGlkIGl0IGxpa2UgdGhpcyB0byBhbGlnbiB3aXRoIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGFwcHJv
YWNoIGZvciB0aGlzCj4ga2luZCBvZiB0aGluZ3MgYXZhaWxhYmxlIGluIHRoaXMgZHJpdmVyLiBJ
IGNhbiBkbyBpdCBhcyB5b3UgcHJvcG9zZWQuCgpUaGUgb3RoZXIgZmllbGRzIGRvIG5vdCBhbGln
biBuaWNlbHkgd2l0aCBieXRlIG9yIHdvcmQgYm91bmRhcmllcy4KCkkgY2FuIHNlZSB0aGUgdmFs
dWUgb2YgdGhlIE1TVE9QKG5hbWUsIGJpdG1hc2spIGFuZApQV1JETihuYW1lLCBiaXRtYXNrKSBt
YWNyb3MsIGJ1dCBJJ2QgcmF0aGVyIGdldCByaWQgb2YgdGhlICpfTUFTSygpCmFuZCAqX09GRigp
IHZhcmlhbnRzLgoKPiBGb3IgdGhlIHJlc3Qgb2YgeW91ciBjb21tZW50cyBvbiB0aGlzIHBhdGNo
OiBJIGFncmVlIGFuZCB3aWxsIGFkanVzdCB0aGUKPiBwYXRjaCBpbiB0aGUgbmV4dCB2ZXJzaW9u
LgoKVGhhbmtzIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
