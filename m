Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2768CFA74C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3F9PUZan3CENspc12uvoswP4Y16fX6TtUbfDtbiL6k=; b=tu4sR5vUfEryLM
	9gIqz74ePKURQrd6QcjnI7umjfxxmxzIYSjby6yKap0pSINMdFLU2ibbEN4ejz/zqBXh7VZ7M+Ki9
	LVsrlLIKa+ik0iC1pSSNlRwXNc0gnYokj50LB2x9CrXaqLCw1nrkOhz+vKf2WgXtyTfCG7OWP4faH
	fQ1Gi6k0umDvdHdKQrbFLCBg84wUUjKicF3hYnaD/kKaMLUxxajrZHHtqUi+P0etOHXYHMtOmfK5c
	TxMLOrCTyx1RXty1XYUlhnln+v059T1X4AxWcGa3e3EylnZHAK/C46RmmFF2hWc6URC2zKq1Vhts2
	6x0sWB0exKmVG7GLEXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swcVk-0000000BCYQ-1ZkR;
	Fri, 04 Oct 2024 07:14:00 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swcVh-0000000BCXc-0Anu
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 07:13:58 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6db836c6bd7so17288757b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 00:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728026035; x=1728630835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V05yuwVEk8dY8sey195NO+tBeukEkXixf9PFgWfdFzU=;
        b=tk/T3pYt9t26VnEvmdPhMwkneKlRYeJI14uK1fMco9ucnZG40rh4gMI5zxMuThGnYD
         QyeV+VyPf+P++bHGN99+mcJOkhiXplnY02SqiVFFbFfcFh74azCdMJZVc5Ep7vkX4e94
         rPKFGRdFrYsRlT/2g0kqPsJYpeioF2SBio7PIdN4mQ0Mdp2hxKK5BKmP7tSle3OnLvDa
         0kXSGgdRAgdRhaxQHLICy0PJkIUTooiYpYQ+1uLx5+Wfo0OEAwzNAlJIaoTx6Q2xmHvK
         JA2IZFpSw/MQF/e5OuEQUSb1RZmDk+J2GnwqQVDmB9AVccc+SP0beqMX24Ajhve5PHog
         4IeA==
X-Forwarded-Encrypted: i=1; AJvYcCUAcE/OdJ3GiRNzsJ54Wg1EwzD+kA/C7iz38gJOo+LbDVlQrqnP4aVH39AzMBmIFIU+j/uQhKzuqK1Pqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjDxLDQBsIWJLv5E/nbXZXG6ktLH3kiV1gd/c/JjdVK2auwfy0
	9a4aDnhz6GeTeSUcQ4EyHuFqUcL49aIoWP2h3OuXlk/ttRZVcprqHYFiX1pl4Pk=
X-Google-Smtp-Source: AGHT+IF2nQz3e6/+ueQLGUZk1lDCnFCEuR3JhsOGFqR/paWz1otjg1cNiqDnNniscXkWZSNw+sKJog==
X-Received: by 2002:a05:690c:dd2:b0:6e0:44a:257c with SMTP id 00721157ae682-6e2c6fc3420mr18461507b3.8.1728026035035;
        Fri, 04 Oct 2024 00:13:55 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcfb8adesm5287427b3.130.2024.10.04.00.13.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 00:13:54 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6dbb24ee34dso15578707b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 00:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsJeRAktHrc6rZSZmu02tjxDSqLuaOff4RgVTR/x0GPJY8XzpRbDaruJxYfDXrWZQla3ZT4W3A6ut2fg==@lists.infradead.org
X-Received: by 2002:a05:690c:94:b0:6db:db27:24a3 with SMTP id
 00721157ae682-6e2c72833eamr19404947b3.31.1728026034217; Fri, 04 Oct 2024
 00:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240901183422.31600-1-biju.das.jz@bp.renesas.com> <20240901183422.31600-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240901183422.31600-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 09:13:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcZ-pxVkv+phjFv8CvsBpbABVA6_8=OpxQWECuHHS_oQ@mail.gmail.com>
Message-ID: <CAMuHMdWcZ-pxVkv+phjFv8CvsBpbABVA6_8=OpxQWECuHHS_oQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_001357_102982_FE94A92F 
X-CRM114-Status: GOOD (  19.85  )
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

SGkgQmlqdSwKCk9uIFN1biwgU2VwIDEsIDIwMjQgYXQgODozNOKAr1BNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4gRW5hYmxlIFJlbmVzYXMgYXQyNXFsMTI4
YSBmbGFzaCBjb25uZWN0ZWQgdG8gUVNQSTAuIEFsc28gZGlzYWJsZQo+IHRoZSBub2RlIGZyb20g
cnpmaXZlLXNtYXJjLXNvbSBhcyBpdCBpcyB1bnRlc3RlZC4KPgo+IFRlc3RlZCB0aGUgZmxhc2gg
YnkgZmxhc2hpbmcgYm9vdGxvYWRlcnM6Cj4gZmxhc2hfZXJhc2UgL2Rldi9tdGQwICAwIDAKPiBm
bGFzaF9lcmFzZSAvZGV2L210ZDEgIDAgMAo+IG10ZF9kZWJ1ZyB3cml0ZSAvZGV2L210ZDAgMCAk
e0JMMl9GSUxFX1NJWkV9ICR7QkwyX0lNQUdFfQo+IG10ZF9kZWJ1ZyB3cml0ZSAvZGV2L210ZDEg
NTEyICR7RklQX0ZJTEVfU0laRX0gJHtGSVBfSU1BR0V9Cj4KPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gdjMtPnY0Ogo+ICAqIFVw
ZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uLgo+ICAqIFVwZGF0ZWQgcGFydGl0aW9uIHRhYmxlLgoK
VGhhbmtzIGZvciB0aGUgdXBkYXRlIQoKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcnpnMnVsLXNtYXJjLXNvbS5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzJ1bC1zbWFyYy1zb20uZHRzaQo+IEBAIC0yMDEsNiArMjAxLDEyIEBAIGlycSB7Cj4g
ICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICB9Owo+Cj4gKyAgICAgICBxc3BpMF9waW5zOiBx
c3BpMCB7Cj4gKyAgICAgICAgICAgICAgIHBpbnMgPSAiUVNQSTBfSU8wIiwgIlFTUEkwX0lPMSIs
ICJRU1BJMF9JTzIiLCAiUVNQSTBfSU8zIiwKPiArICAgICAgICAgICAgICAgICAgICAgICJRU1BJ
MF9TUENMSyIsICJRU1BJMF9TU0wiOwo+ICsgICAgICAgICAgICAgICBwb3dlci1zb3VyY2UgPSA8
MTgwMD47Cj4gKyAgICAgICB9Owo+ICsKPiAgICAgICAgIHNkaGkwX2VtbWNfcGluczogc2QwZW1t
YyB7Cj4gICAgICAgICAgICAgICAgIHNkMF9lbW1jX2RhdGEgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHBpbnMgPSAiU0QwX0RBVEEwIiwgIlNEMF9EQVRBMSIsICJTRDBfREFUQTIiLCAiU0Qw
X0RBVEEzIiwKPiBAQCAtMjUyLDYgKzI1OCw0NSBAQCBzZDBfbXV4X3VocyB7Cj4gICAgICAgICB9
Owo+ICB9Owo+Cj4gKyZzYmMgewo+ICsgICAgICAgcGluY3RybC0wID0gPCZxc3BpMF9waW5zPjsK
PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKyAgICAgICBzdGF0dXMgPSAi
b2theSI7Cj4gKwo+ICsgICAgICAgZmxhc2hAMCB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiamVkZWMsc3BpLW5vciI7Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiArICAg
ICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owo+ICsgICAgICAgICAg
ICAgICBzcGktdHgtYnVzLXdpZHRoID0gPDQ+Owo+ICsgICAgICAgICAgICAgICBzcGktcngtYnVz
LXdpZHRoID0gPDQ+Owo+ICsKPiArICAgICAgICAgICAgICAgc3BpLWNwb2w7Cj4gKyAgICAgICAg
ICAgICAgIHNwaS1jcGhhOwo+ICsgICAgICAgICAgICAgICBtMjVwLGZhc3QtcmVhZDsKPiArCj4g
KyAgICAgICAgICAgICAgIHBhcnRpdGlvbnMgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MT47Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBhcnRpdGlvbkAwIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gImJsMiI7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAwMDFjMDAwPjsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBw
YXJ0aXRpb25AMWQwMDAgeyAvKiBmaXAgaXMgYXQgb2Zmc2V0IDB4MjAwICovCgpJcyB0aGlzIDQg
S2lCIGdhcCBiZXR3ZWVuIHRoZSB0d28gcGFydGl0aW9ucyBpbnRlbnRpb25hbD8KSWYgeWVzLCBJ
IHRoaW5rIGl0IGRlc2VydmVzIGEgY29tbWVudC4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsYWJlbCA9ICJmaXAiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MDAwMWQwMDAgMHg3ZTMwMDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07
Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBhcnRpdGlvbkA4MDAwMDAgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAidXNlciI7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg4MDAwMDAgMHg4MDAwMDA+Owo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+ICt9
OwoKVGhlIHJlc3QgTEdUTS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
