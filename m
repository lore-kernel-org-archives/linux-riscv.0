Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0CEECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MymlBM5M7HGv7O+xXAdntODOQ4CUmmaqOLylWdrXUpk=; b=yNqiMA4Y89GFQj
	AwNJYpEFZB+/Ngvne4cyHdI5ZcvD+fMFQ2fYyIQurV3YCHoRXStzD+KgrUGXtPP7EApMa/mOn4s57
	ErVuV7MgYOjv/HSENvMuYmIqtUCHmmzCksLI6nFrmfjGp/st4HekfX01mqrHZYE4FM8Zxju/a57W5
	HZavO1/+KB81I6tphU+7C+WBNCC9+3BI+9/XZ4o4noXfW+2ULGYDc+9aBk8efxH6U91Aa7GFOLSYE
	QfMJRtti/ucroUz1OugRz0HL+mDx4BDHAutpunDQbMqYeViGWP1WM77pKxbOz7OayUqp+CHeQJYv3
	4Nd1zL7TtNYm0wqCxmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauUv-009hgj-Db; Wed, 21 Sep 2022 07:50:21 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauUr-009hcp-Ef
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 07:50:19 +0000
Received: by mail-qk1-f180.google.com with SMTP id d15so3403699qka.9
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 00:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PAJBhuT5HKP0LRGiFEK7TtSMq0xYtERZFgLWgla/nls=;
        b=Y1jVj7Gn/54cMykm9exQ2J7HTnFUw4QNz83Jv3PQ0dGJr2WuM1fmG4ecS4wlxCLCzE
         2nBjv8h9rmCSyKrn3KDul2IGCIwTh/9++5gDcOSN2U0ZVQz43kkvkX6CbYuzIeVNA3P8
         gE5TO2lfpEFzKit8oMzofo7PlvT6Le52V+0uqBphjVnFQtjUEn0IsKwHQBjwfLY5XXUd
         MPqNF50UH6KQfhY/Ul4cdG/RQMQv3iraIdvm8Ox8Fr8+qkGxc998tG2fp3qL076iec4L
         ZAdpELsz8WqPf5VwXIxeDerBKLr9U47TsbPG/3RB+dxfNEwzyTocrmROrNmj88aDw/O1
         ZB3A==
X-Gm-Message-State: ACrzQf2MO8EXSQztdoaSv9bD052sTAHKq567TKG6MlmDEd0i/7lS6/m7
	wdeWouRijPC1dBrFh8HHiDU2Yaf6aoXSZg==
X-Google-Smtp-Source: AMsMyM6B1sQKptorv/3U7uqx1XqUwCYV67aZT+GupkIdUKEjMqT+4Di7pXeuJLQXyzHg+WKFd3tvUA==
X-Received: by 2002:a05:620a:1987:b0:6ce:54bf:3fe3 with SMTP id bm7-20020a05620a198700b006ce54bf3fe3mr19303884qkb.394.1663746613540;
        Wed, 21 Sep 2022 00:50:13 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id bm17-20020a05620a199100b006c73c3d288esm1405811qkb.131.2022.09.21.00.50.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:50:12 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3450a7358baso54389817b3.13
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 00:50:11 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr22453571ywe.283.1663746611002; Wed, 21
 Sep 2022 00:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com> <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org> <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
 <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com> <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com> <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
 <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com> <C0B4F750-1C99-408A-A2DA-B72BBF7361B4@jrtc27.com>
 <b3fdb3cc-a8fc-b980-c8f4-f96d4733ce56@sholland.org> <CAMuHMdUMM9H4jLJ8-zOz9SXoqmK-s4zRWzGCsU8jt_sDgY1h+Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUMM9H4jLJ8-zOz9SXoqmK-s4zRWzGCsU8jt_sDgY1h+Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Sep 2022 09:49:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1n00JNR7SuUXY5pVHcnG_1PHne95cUdsW+ZHgqvZW=A@mail.gmail.com>
Message-ID: <CAMuHMdV1n00JNR7SuUXY5pVHcnG_1PHne95cUdsW+ZHgqvZW=A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220921_005017_556243_9E9B98CA 
X-CRM114-Status: GOOD (  39.84  )
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

T24gRnJpLCBTZXAgOSwgMjAyMiBhdCA5OjEwIEFNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIEZyaSwgU2VwIDksIDIwMjIgYXQgNTo0MiBBTSBT
YW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4gd3JvdGU6Cj4gPiBPbiA4LzIyLzIy
IDEwOjI5IEFNLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiA+ID4gT24gMjIgQXVnIDIwMjIsIGF0
IDE0OjU2LCBjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToKPiA+ID4+IE9uIDIyLzA4
LzIwMjIgMTM6MzEsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4+Pj4gRG8geW91IHRo
aW5rIHRoaXMgaXMgd29ydGggZG9pbmc/IE9yIGFyZSB5b3UganVzdCBwcm92aWRpbmcgYW4KPiA+
ID4+Pj4gZXhhbXBsZSBvZiB3aGF0IGNvdWxkIGJlIGRvbmU/Cj4gPiA+Pj4KPiA+ID4+PiBKdXN0
IHNvbWUgYnJhaW5zdG9ybWluZy4uLgo+ID4gPj4+Cj4gPiA+Pj4+IFdoZXJlIHdvdWxkIHlvdSBl
bnZpc2FnZSBwdXR0aW5nIHRoZXNlIG1hY3Jvcz8gSSBmb3JnZXQgdGhlIG9yZGVyCj4gPiA+Pj4+
IG9mIHRoZSBDUFAgb3BlcmF0aW9ucyB0aGF0IGFyZSBkb25lLCBjYW4gdGhleSBiZSBwdXQgaW4g
dGhlIGR0cz8KPiA+ID4+Pgo+ID4gPj4+IFRoZSBTT0NfUEVSSVBIRVJBTF9JUlEoKSBtYWNybyBz
aG91bGQgYmUgZGVmaW5lZCBpbiB0aGUKPiA+ID4+PiBBUk0tYmFzZWQgU29DLmR0c2kgZmlsZSBh
bmQgdGhlIFJJU0MtVi1iYXNlZCBTb0MuZHRzaSBmaWxlLgo+ID4gPj4KPiA+ID4+IFJpZ2h0LCBv
bmUgbGV2ZWwgdXAgYnV0IH50aGUgc2FtZSByZXN1bHQuCj4gPiA+Pgo+ID4gPj4+Pj4gTmljZSEg
QnV0IGl0J3MgZ29ubmEgYmUgYSB2ZXJ5IGxhcmdlIGludGVycnVwdC1tYXAuCj4gPiA+Pj4+Cj4g
PiA+Pj4+IEkgcXVpdGUgbGlrZSB0aGUgaWRlYSBvZiBub3QgZHVwbGljYXRpbmcgZmlsZXMgYWNy
b3NzIHRoZSBhcmNocwo+ID4gPj4+PiBpZiBpdCBjYW4gYmUgaGVscGVkLCBidXQgbm90IGF0IHRo
ZSBleHBlbnNlIG9mIG1ha2luZyB0aGVtIGhhcmQgdG8KPiA+ID4+Pj4gdW5kZXJzdGFuZCAmIEkg
ZmVlbCBsaWtlIHVuZm9ydHVuYXRlbHkgdGhlIGxhcmdlIGludGVycnVwdCBtYXAgaXMKPiA+ID4+
Pj4gaW4gdGhhdCB0ZXJyaXRvcnkuCj4gPiA+Pj4KPiA+ID4+PiBJIGZlZWwgdGhlIHNhbWUuCj4g
PiA+Pj4gRXZlbiBsaXN0aW5nIGJvdGggaW50ZXJydXB0IG51bWJlcnMgaW4gU09DX1BFUklQSEVS
QUxfSVJRKG5hLCBucikKPiA+ID4+PiBpcyBhIHJpc2sgZm9yIG1ha2luZyBtaXN0YWtlcy4KPiA+
ID4+Pgo+ID4gPj4+IFNvIHBlcnNvbmFsbHksIEknbSBpbiBmYXZvciBvZiB0ZWFjaGluZyBkdGMg
YXJpdGhtZXRpYywgc28gd2UgY2FuCj4gPiA+Pj4gaGFuZGxlIHRoZSBvZmZzZXQgaW4gU09DX1BF
UklQSEVSQUxfSVJRKCkuCj4gPiA+Pgo+ID4gPj4gWXVwLCBpbiB0aGUgc2FtZSBib2F0IGhlcmUu
IG1heWIgSSdsbCBnZXQgYm9yZWQgZW5vdWdoIHRvIGJpdGUuLgo+ID4gPgo+ID4gPiBOb3RlIHRo
YXQgR1BM4oCZZWQgZHRjIGlzbuKAmXQgdGhlIG9ubHkgaW1wbGVtZW50YXRpb24uIEZyZWVCU0Qg
dXNlcyBhCj4gPiA+IEJTRC1saWNlbnNlZCBpbXBsZW1lbnRhdGlvblsxXSBhbmQgc28gYWRkaW5n
IG5ldyBmZWF0dXJlcyBsaWtlIHRoaXMgdG8KPiA+ID4gR1BMIGR0YyB0aGF0IGFjdHVhbGx5IGdl
dCB1c2VkIHdvdWxkIHJlcXVpcmUgdXMgdG8gcmVpbXBsZW1lbnQgaXQgdG9vLgo+ID4gPiBJIGRv
buKAmXQga25vdyBob3cgbXVjaCBlZmZvcnQgaXQgd291bGQgYmUgYnV0IHBsZWFzZSBrZWVwIHRo
aXMgaW4gbWluZC4KPiA+Cj4gPiBJIHBsYW4gdG8gZ28gd2l0aCB0aGUgIlNPQ19QRVJJUEhFUkFM
X0lSUShuYSwgbnIpIiBpbXBsZW1lbnRhdGlvbiBmb3IgdjIuIEkgbGlrZQo+ID4gdGhhdCBpdCBv
bmx5IGFmZmVjdHMgdGhlIERUIHNvdXJjZSwgYW5kIGRvZXMgbm90IGxlYWsgaW50byB0aGUgRFRC
LiBXZSBzdGlsbAo+ID4gaGF2ZSB0aGUgZnJlZWRvbSB0byBzd2l0Y2ggdG8gdXNpbmcgYXJpdGht
ZXRpYyBsYXRlciB3aGVuIGFsbCBvZiB0aGUgdG9vbHMKPiA+IHN1cHBvcnQgaXQuCj4KPiBNYXkg
SSBzdWdnZXN0IGFuIGFsdGVybmF0aXZlIHNvbHV0aW9uLCB3aGljaCB3b3VsZCBiZSBtb3JlIGdl
bmVyaWMsCj4gYW5kIGNhbiBiZSBleHRlbmRlZCB0byBvdGhlci9tb3JlIENQVSBjb3JlcyBlYXNp
bHk6Cj4KPiBTcGVjaWZ5IGJvdGggaW50ZXJydXB0cyBpbiB0aGUgLmR0c2ksIGJ1dCB3cmFwcGVk
IGluc2lkZSBlLmcuIEFSTSgpCj4gcmVzcC4gUklTQ1YoKSBtYWNyb3M6Cj4KPiAgICAgQVJNKGlu
dGVycnVwdHMgPSA8R0lDX1NQSSAzODAgSVJRX1RZUEVfTEVWRUxfSElHSD47KQo+ICAgICBSSVND
VihpbnRlcnJ1cHRzID0gPDQxMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjspCj4KPiBUaGUgc2FtZSBj
b25zdHJ1Y3QgY2FuIGJlIHVzZWQgZm9yIGUuZy4gaW50ZXJydXB0LXBhcmVudC4KPiBUaGUgQVJN
IC5kdHMgd291bGQgZGVmaW5lOgo+Cj4gICAgICNkZWZpbmUgQVJNKHguLi4pICAgIHgKPiAgICAg
I2RlZmluZSBSSVNDVih4Li4uLikKPgo+IGJlZm9yZSBpbmNsdWRpbmcgdGhlIC5kdHNpLgo+IFRo
ZSBSSVNDLVYgRFRTIHdvdWxkIGRlZmluZSBpbnN0ZWFkOgo+Cj4gICAgICNkZWZpbmUgQVJNKHgu
Li4pCj4gICAgICNkZWZpbmUgUklTQ1YoeC4uLikgICAgeAo+Cj4gQ2ZyLiB0aGUgQVJfQ0xBU1Mo
KSwgTV9DTEFTUygpLCBBUk0oKSwgYW5kIFRIVU1CKCkgbWFjcm9zIGluCj4gYXJjaC9hcm0vaW5j
bHVkZS9hc20vdW5pZmllZC5oLgoKSSBicm91Z2h0IGl0IHVwIHdpdGggdGhlIERUIHBlb3BsZSBp
biBhIHNlcGFyYXRlIHRocmVhZFsxXS4KUGxlYXNlIGNvbnRpbnVlIHRoZSBkaXNjdXNzaW9uIHRo
ZXJlLgpUaGFua3MhCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9DQU11SE1kVVBtMzZS
c3hIZFZ3c3BSM05DQVIzQzUwN0F5QjZSNjVXNDJOMmdYV3EwYWdAbWFpbC5nbWFpbC5jb20KCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
