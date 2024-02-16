Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5CEC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcfXufABXFXay6heDrANUyCYCm8uOg5Pf2Sg9PFECbA=; b=jGU1qStUoYA2Qt
	zEc+9ZLdhk8VbReac5JtVGnBbjIh64NrM1XGxTrUyDUT/Dp3p82TX46tghMJbwCoxPlok/Sb9BG8e
	fXFSMHykvmJSPLHd2jc4vs286ZxVvppGZGtCUybqZVOfMSQioD+Im+ZnllA6UPLh/MLWdJ8K0zxqw
	pEAC5c9p2wsfGIk9uJIrfi06u25Y348yN3n2NOYWn6zDVZvRMcISEGG3jYboVBaLbK81FF1aa0xm9
	C8Pkb7v/7QdZkfhGLrpUlAELrhhGYbe3/AqlsqcTIpr8tWb9t/iYIpGpaaWstKlmuuXBJZRCBIa3m
	LmaokbQoS+x4rO0BJJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayqI-00000002XJo-00h3;
	Fri, 16 Feb 2024 14:05:30 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raypu-00000002Wyw-1fc3
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:05:07 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1998410276.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092304; x=1708697104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssDcYGlo0XYIPkaIe9oJbg8yYcN5gJ/6X+ClgyE2yKE=;
        b=ev3z3RGBy8DCtHQ1ARsG9NrO7Jr0BmRo70LcwWvXAaGzwDezMbNE5z580KY5J6o6XP
         A2CmFZsNa7J79EgO7xQpkjb4O0YAxBuVWxlKZXqNUQx33FYPhxHcbl6JoCClpRnYQ26s
         yCaLr0vi7xwYSQ6Cud7n9SgegVnX1muQYIOGvJ4nojwBm7mLtZkvWVBbr5sc93AGe8He
         1MRcE0OkQj93RLPNfpNzSKjbxR67OoSZq40Wt073IjAKRuuljggzcOvsu97OTX2bI0s7
         e6/FmJKhzFq1WPcBVSVYNXtU/laChg84YrPFck84X3zxIeioT7JS0zAQce0RtrcG0x22
         ldbA==
X-Forwarded-Encrypted: i=1; AJvYcCXD5fKRrX6FhZbBTWY+evMd7yAxIjoP5EN3xgksRc19hmsPP+zBBSeL5vTmfNEaw2Cmtv/X/dWte7NNdXMywFEVRWZiBE6VVhNdgbxDps/r
X-Gm-Message-State: AOJu0YyAgbnwyu3IV7WquToicWzoC38Hxh1HkDYQ8KXzaeFE8pWybNK7
	0ONDjxRRWF+irs7zzyi3flH1HouYhtZiBsNrjtrxIXGbZAwyfySg133f6+cyaC8=
X-Google-Smtp-Source: AGHT+IGAHycLU6bia6b7Ma4XyPjhRbwv1FugBMFucHvgkCAuyU/bUBSUdhFWMWgpUz9Eh9vVxoTF1Q==
X-Received: by 2002:a0d:d5d7:0:b0:607:76c6:4ed9 with SMTP id x206-20020a0dd5d7000000b0060776c64ed9mr5688086ywd.41.1708092304516;
        Fri, 16 Feb 2024 06:05:04 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id c67-20020a0dda46000000b006042345d3e2sm346689ywe.141.2024.02.16.06.05.04
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:05:04 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso2070575276.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:05:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUARj6DQTRhQ3SOn3QH3N35x+LLY0+EQm3jWlHAK6ifsMh3hik5x5vRZCBshsjUUx1fvlgAtWSrmqNTJSQxGh7iU1mWBCJaBy4nVj70z+10
X-Received: by 2002:a25:b78d:0:b0:dc6:c510:df6b with SMTP id
 n13-20020a25b78d000000b00dc6c510df6bmr5663068ybh.55.1708092304106; Fri, 16
 Feb 2024 06:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:04:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2AsXJk_crdeiMjMHzBKq91UO1d=ukwjW0hkCK4DRvTw@mail.gmail.com>
Message-ID: <CAMuHMdW2AsXJk_crdeiMjMHzBKq91UO1d=ukwjW0hkCK4DRvTw@mail.gmail.com>
Subject: Re: [PATCH 06/17] dt-bindings: clock: renesas,rzg2l-cpg: Update
 #power-domain-cells = <1>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060506_508867_6F1B5859 
X-CRM114-Status: GOOD (  19.89  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0M+KAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVGhlIGRyaXZlciB3aWxsIGJlIG1v
ZGlmaWVkIChpbiB0aGUgbmV4dCBjb21taXRzKSB0byBiZSBhYmxlIHRvIHNwZWNpZnkKPiBpbmRp
dmlkdWFsIHBvd2VyIGRvbWFpbiBJRCBmb3IgZWFjaCBJUC4gVXBkYXRlIHRoZSBkb2N1bWVudGF0
aW9uIHRvIGNvcGUKPiB3aXRoIHRoaXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5l
YSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghCgo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5l
c2FzLHJ6ZzJsLWNwZy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3JlbmVzYXMscnpnMmwtY3BnLnlhbWwKPiBAQCAtNTcsNyArNTcsNyBAQCBwcm9w
ZXJ0aWVzOgo+ICAgICAgICBjYW4gYmUgcG93ZXItbWFuYWdlZCB0aHJvdWdoIE1vZHVsZSBTdGFu
ZGJ5IHNob3VsZCByZWZlciB0byB0aGUgQ1BHIGRldmljZQo+ICAgICAgICBub2RlIGluIHRoZWly
ICJwb3dlci1kb21haW5zIiBwcm9wZXJ0eSwgYXMgZG9jdW1lbnRlZCBieSB0aGUgZ2VuZXJpYyBQ
TQo+ICAgICAgICBEb21haW4gYmluZGluZ3MgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Bvd2VyL3Bvd2VyLWRvbWFpbi55YW1sLgo+IC0gICAgY29uc3Q6IDAKPiArICAgIGNv
bnN0OiAxCgpXaGlsZSB0aGUgZHJpdmVyIHdpbGwgc29vbiBzdXBwb3J0IGJvdGggMCBhbmQgMSwg
d2UgbWF5IG5lZWQgdG8ga2VlcCAwCmZvciBSWi9WMk0gZm9yIG5vdz8gIFJaL1YyTSBkb2VzIG5v
dCBoYXZlIENQR19CVVNfKl9NU1RPUCByZWdpc3RlcnMsCmJ1dCB1c2VzIHRoZSBJbnRlcm5hbCBQ
b3dlciBEb21haW4gQ29udHJvbGxlciAoUE1DKS4KClBsZWFzZSBhZGQgYSBsaW5rIHRvIHRoZSBw
b3dlciBkb21haW4gbnVtYmVycyBpbgo8ZHQtYmluZGluZ3MvY2xvY2svcjlhMCotY3BnLmg+LAps
aWtlIGlzIGRvbmUgZm9yICNjbG9jay1jZWxscy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
