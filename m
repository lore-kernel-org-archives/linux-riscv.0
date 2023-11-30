Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50ACC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3StCG3csqT3gX5q9R3PJ2nAcpZZUEOUUcqwLPQDJIoA=; b=3Oiy2VbZP56KRI
	liWX0NQmdkVZiHrwe4CJfv6AupU5JN8vLurTiF5+J81u6aQ+VoYpCXP97red/lLOM+pKF81iOfK/m
	03UB4k4eovvgzPlRrO5dlldnyHK50zj93NauMdt+uRRBCjBjm2b1vllvgFK76mW08iGOUpCkbcsxk
	ZS19Vt837KEjjvJ7X8ARyEo0dHv2GIDnhLk258qUx/q7LZMO4frxf9Ji0iyBtthFr7gO4ucqkQUAg
	xU3mMufZVG7yQcqFE+I9bck0e7iYqRNpTQPNRgep5n9aQOj+zxfIIxa5ieZmmJWsJaY0JHubihiqA
	bUFfA1v+aN0yAtPbLxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kFA-00BOv5-2U;
	Thu, 30 Nov 2023 16:50:28 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kF7-00BOs1-1l
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:50:27 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4b2919d78d6so403009e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701363022; x=1701967822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wr04NBHQv8NfEkXPvwegZkjN2M6ocLDH+/1oF32cCE=;
        b=SFloVbz/ld19Tm2b1cucdusy/Y5STqO1Gchvy5umRgi27xChBdWtYsvZIR1gjYkHkh
         AOwA/OsshhIOyBdOngDiA+NMAqRMmKhbLfBklKwf3bD2aWCH0iQ99uH/yG06fBZV+/of
         amw9AJA3f7wXpreCI0ONhdEnSZUz+6KvRdFid3h1GiE+wrgMFZZ3Y1YKgAes8WnWFRL3
         Hh6B0ictGF72FxOc+3mp2ygi2CoQwQulazXc1JI5m+dr4nQ3PZkLIrx+PGQH1vTNs0Ww
         lYmjV59rh/1S8VYtTefPAEksD9mNGoLUnXmpS2/xaVkovEKgCWhm/kSOn36Fkjp0XIST
         vLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701363022; x=1701967822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wr04NBHQv8NfEkXPvwegZkjN2M6ocLDH+/1oF32cCE=;
        b=HeNvKtpJlyt9hlRLdXfB2dMQm9BRixucf5KpTEkeE2LRtAw/rufcZAAnBe7GR5QoUR
         YnmBYpcYrqeWBu2n0npJSiZA7o3zfrHtZIpc+WLz5r1lY0vjC70Z/j/+/+jw5DhOV6Qj
         Nr5maaR6Qw9Tl+15VKTA6ajTTT/RiZiSj83mEMMJtarQZwUj61zvlLEhhcekAPZrdpMH
         KpljVtaJynssjgkAiHN1rg5jR2mBhUQQr2oelSaDP0iyEuwzl45a4MR7UhNvmerB0jRm
         IVIl480vApYXb6lgxYs4AVnxVOzqsJBfFMw/XGlhvhPVFXaFTfA7J6UVQjv7AT3HimF6
         xe3w==
X-Gm-Message-State: AOJu0Yz4G73HFstlv1dyKF+CNVRzzQvon7UaqFjlSjJ2ZyXp25+2q0ij
	83rmPzkF0fx4F1cpIMLIOErwIICJnwqolMVMvtg=
X-Google-Smtp-Source: AGHT+IHbKcsz5nt4ng19JOcE7vM4hQMbiy5gb4eiPUe1IlCAsC++XCLKLl4e79pRremO2E+EgiLkQpzVMhjg/0NHoeM=
X-Received: by 2002:a1f:c502:0:b0:4b2:87d3:4936 with SMTP id
 v2-20020a1fc502000000b004b287d34936mr6356645vkf.6.1701363022148; Thu, 30 Nov
 2023 08:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com>
 <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com> <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com>
In-Reply-To: <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Nov 2023 16:49:31 +0000
Message-ID: <CA+V-a8shubctjQrg4DP-4RVAPg-TOn-twWeg5bL+M2JDsMGBbw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Yu Chien Peter Lin <peterlin@andestech.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_085025_603339_B6BBE9BB 
X-CRM114-Status: GOOD (  29.63  )
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

SGkgR2VlcnQsCgpPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCA0OjI24oCvUE0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCA1OjIz4oCvUE0gTGFkLCBQcmFiaGFrYXIKPiA8cHJh
Ymhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMg
YXQgMjozNOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdy
b3RlOgo+ID4gPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAxOjU24oCvUE0gUHJhYmhha2FyIDxw
cmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gRnJvbTogTGFkIFByYWJo
YWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gPiA+Cj4g
PiA+ID4gV2UgbmVlZCB0byBwcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UgZHVyaW5nIGJvb3Qgc3Rh
Z2UsIGFzIHdlIHdlcmUgcHJvYmluZwo+ID4gPiA+IGZvciBJT0NQIGZvciBhbGwgdGhlIHN0YWdl
cyB0aGlzIGNhdXNlZCB0aGUgYmVsb3cgaXNzdWUgZHVyaW5nIG1vZHVsZS1pbml0Cj4gPiA+ID4g
c3RhZ2UsCj4gPiA+ID4KPiA+ID4gPiBbOS4wMTkxMDRdIFVuYWJsZSB0byBoYW5kbGUga2VybmVs
IHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZmZmZmZjgxMDBkM2EwCj4gPiA+
ID4gWzkuMDI3MTUzXSBPb3BzIFsjMV0KPiA+ID4gPiBbOS4wMjk0MjFdIE1vZHVsZXMgbGlua2Vk
IGluOiByY2FyX2NhbmZkIHJlbmVzYXNfdXNiaHMgaTJjX3JpaWMgY2FuX2RldiBzcGlfcnNwaSBp
MmNfY29yZQo+ID4gPiA+IFs5LjAzNzY4Nl0gQ1BVOiAwIFBJRDogOTAgQ29tbTogdWRldmQgTm90
IHRhaW50ZWQgNi43LjAtcmMxKyAjNTcKPiA+ID4gPiBbOS4wNDM3NTZdIEhhcmR3YXJlIG5hbWU6
IFJlbmVzYXMgU01BUkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA0M2YwMSAoRFQpCj4gPiA+ID4gWzku
MDUwMzM5XSBlcGMgOiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gPiA+
ID4gWzkuMDU1NTU4XSAgcmEgOiBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYysweDRhLzB4NTIKPiA+
ID4gPiBbOS4wNjA0MThdIGVwYyA6IGZmZmZmZmZmODAwMGQ4YzIgcmEgOiBmZmZmZmZmZjgwMDBk
OTVjIHNwIDogZmZmZmZmYzgwMDNhYmIwMAo+ID4gPiA+IFs5LjA2NzYwN10gIGdwIDogZmZmZmZm
ZmY4MTRlMjVhMCB0cCA6IGZmZmZmZmQ4MDM2MWU1NDAgdDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4g
PiA+ID4gWzkuMDc0Nzk1XSAgdDEgOiAwMDAwMDAwMDA5MDAwMzFlIHQyIDogMDAwMDAwMDAwMDAw
MDAwMSBzMCA6IGZmZmZmZmM4MDAzYWJiMjAKPiA+ID4gPiBbOS4wODE5ODRdICBzMSA6IGZmZmZm
ZmZmMDE1YjU3YzcgYTAgOiAwMDAwMDAwMDAwMDAwMDAwIGExIDogMDAwMDAwMDAwMDAwMDAwMQo+
ID4gPiA+IFs5LjA4OTE3Ml0gIGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAw
MDAwMDAgYTQgOiBmZmZmZmZmZjgxMDBkOGJlCj4gPiA+ID4gWzkuMDk2MzYwXSAgYTUgOiAwMDAw
MDAwMDAwMDAwMDAxIGE2IDogMDAwMDAwMDAwMDAwMDAwMSBhNyA6IDAwMDAwMDAwMDkwMDAzMWUK
PiA+ID4gPiBbOS4xMDM1NDhdICBzMiA6IGZmZmZmZmZmMDE1YjU3ZDcgczMgOiAwMDAwMDAwMDAw
MDAwMDAxIHM0IDogMDAwMDAwMDAwMDAwMDMxZQo+ID4gPiA+IFs5LjExMDczNl0gIHM1IDogODAw
MDAwMDAwMDAwOGE0NSBzNiA6IDAwMDAwMDAwMDAwMDA1MDAgczcgOiAwMDAwMDAwMDAwMDAwMDNm
Cj4gPiA+ID4gWzkuMTE3OTI0XSAgczggOiBmZmZmZmZjODAwM2FiZDQ4IHM5IDogZmZmZmZmZmYw
MTViMTE0MCBzMTA6IGZmZmZmZmZmODE1MWExYjAKPiA+ID4gPiBbOS4xMjUxMTNdICBzMTE6IGZm
ZmZmZmZmMDE1YjEwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAxIHQ0IDogZmVmZWZlZmVmZWZlZmVm
Zgo+ID4gPiA+IFs5LjEzMjMwMV0gIHQ1IDogZmZmZmZmZmYwMTViNTdjNyB0NiA6IGZmZmZmZmQ4
YjYzYTYwMDAKPiA+ID4gPiBbOS4xMzc1ODddIHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRh
ZGRyOiBmZmZmZmZmZjgxMDBkM2EwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBmCj4gPiA+ID4gWzku
MTQ1NDY4XSBbPGZmZmZmZmZmODAwMGQ4YzI+XSByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQr
MHgxMC8weDNlCj4gPiA+ID4gWzkuMTUxOTcyXSBbPGZmZmZmZmZmODAwMDI3ZTg+XSBfYXBwbHlf
YWx0ZXJuYXRpdmVzKzB4ODQvMHg4Ngo+ID4gPiA+IFs5LjE1Nzc4NF0gWzxmZmZmZmZmZjgwMDAy
OWJlPl0gYXBwbHlfbW9kdWxlX2FsdGVybmF0aXZlcysweDEwLzB4MWEKPiA+ID4gPiBbOS4xNjQx
MTNdIFs8ZmZmZmZmZmY4MDAwOGZjYz5dIG1vZHVsZV9maW5hbGl6ZSsweDVlLzB4N2EKPiA+ID4g
PiBbOS4xNjk1ODNdIFs8ZmZmZmZmZmY4MDA4NWNkNj5dIGxvYWRfbW9kdWxlKzB4ZmQ4LzB4MTc5
Ywo+ID4gPiA+IFs5LjE3NDk2NV0gWzxmZmZmZmZmZjgwMDg2NjMwPl0gaW5pdF9tb2R1bGVfZnJv
bV9maWxlKzB4NzYvMHhhYQo+ID4gPiA+IFs5LjE4MDk0OF0gWzxmZmZmZmZmZjgwMDg2N2Y2Pl0g
X19yaXNjdl9zeXNfZmluaXRfbW9kdWxlKzB4MTc2LzB4MmE4Cj4gPiA+ID4gWzkuMTg3MzY1XSBb
PGZmZmZmZmZmODA4ODk4NjI+XSBkb190cmFwX2VjYWxsX3UrMHhiZS8weDEzMAo+ID4gPiA+IFs5
LjE5MjkyMl0gWzxmZmZmZmZmZjgwODkyMGJjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDY0
Cj4gPiA+ID4gWzkuMTk4NTczXSBDb2RlOiAwMDA5IGI3ZTkgNjc5NyAwMTRkIGE3ODMgODVhNyBj
Nzk5IDQ3ODUgMDcxNyAwMTAwICgwMTIzKSBhZWY3Cj4gPiA+ID4gWzkuMjA1OTk0XSAtLS1bIGVu
ZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMgYmVj
YXVzZSB3ZSBjYWxsZWQgcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgZm9yIGFsbCB0aGUg
c3RhZ2VzCj4gPiA+ID4gZHVyaW5nIElPQ1AgcHJvYmUuIHJpc2N2X25vbmNvaGVyZW50X3N1cHBv
cnRlZCgpIGZ1bmN0aW9uIHNldHMKPiA+ID4gPiBub25jb2hlcmVudF9zdXBwb3J0ZWQgdmFyaWFi
bGUgdG8gdHJ1ZSB3aGljaCBoYXMgYW4gYW5ub3RhdGlvbiBzZXQgdG8KPiA+ID4gPiAiX19yb19h
ZnRlcl9pbml0IiBkdWUgdG8gd2hpY2ggd2Ugd2VyZSBzZWVpbmcgdGhlIGFib3ZlIHNwbGF0LiBG
aXggdGhpcyBieQo+ID4gPiA+IHByb2JpbmcgZm9yIElPQ1Agb25seSBvbmNlIGluIGJvb3Qgc3Rh
Z2UgYnkgaGF2aW5nIGEgYm9vbGVhbiB2YXJpYWJsZQo+ID4gPiA+IGlzX2lvY3BfcHJvYmVfZG9u
ZSB3aGljaCB3aWxsIGJlIHNldCB0byB0cnVlIHVwb24gSU9DUCBwcm9iZSBpbgo+ID4gPiA+IGVy
cmF0YV9wcm9iZV9pb2NwKCkgYW5kIHdlIGJhaWwgb3V0IGVhcmx5IGlmIGlzX2lvY3BfcHJvYmVf
ZG9uZSBpcyBzZXQuCj4gPiA+ID4KPiA+ID4gPiBXaGlsZSBhdCBpdCBtYWtlIHJldHVybiB0eXBl
IG9mIGVycmF0YV9wcm9iZV9pb2NwKCkgdG8gdm9pZCBhcyB3ZSB3ZXJlCj4gPiA+ID4gbm90IGNo
ZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgaW4gYW5kZXNfZXJyYXRhX3BhdGNoX2Z1bmMoKS4KPiA+
ID4gPgo+ID4gPiA+IEZpeGVzOiBlMDIxYWU3ZjUxNDUgKCJyaXNjdjogZXJyYXRhOiBBZGQgQW5k
ZXMgYWx0ZXJuYXRpdmUgcG9ydHMiKQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4gPiAtLS0K
PiA+ID4gPiB2MS0+djIKPiA+ID4gPiAqIEFzIFJJU0NWX0FMVEVSTkFUSVZFU19CT09UIHN0YWdl
IGNhbiBoYXBwZW4gdHdpY2UgYWRkIGEgaXNfaW9jcF9wcm9iZV9kb25lCj4gPiA+ID4gICB2YXJp
YWJsZSB0byBwcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UuCj4gPiA+ID4gKiBVcGRhdGVkIGNvbW1p
dCBtZXNzYWdlCj4gPiA+ID4gKiBNYWtlIHJldHVybiB2YWx1ZSBvZiBlcnJhdGFfcHJvYmVfaW9j
cCgpIHRvIHZvaWQKPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQo+ID4gPgo+ID4g
PiA+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCj4gPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMKPiA+ID4gPiBAQCAtMzgsMjkgKzM4LDM2
IEBAIHN0YXRpYyBsb25nIGF4NDVtcF9pb2NwX3N3X3dvcmthcm91bmQodm9pZCkKPiA+ID4gPiAg
ICAgICAgIHJldHVybiByZXQuZXJyb3IgPyAwIDogcmV0LnZhbHVlOwo+ID4gPiA+ICB9Cj4gPiA+
ID4KPiA+ID4gPiAtc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX2lvY3AodW5zaWduZWQgaW50IHN0
YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCj4gPiA+ID4g
K3N0YXRpYyB2b2lkIGVycmF0YV9wcm9iZV9pb2NwKHVuc2lnbmVkIGludCBzdGFnZSwgdW5zaWdu
ZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQo+ID4gPiA+ICB7Cj4gPiA+ID4g
KyAgICAgICBzdGF0aWMgYm9vbCBpc19pb2NwX3Byb2JlX2RvbmU7Cj4gPiA+Cj4gPiA+IGRvbmU/
Cj4gPiA+Cj4gPiBPSyBJJ2xsIHJlbmFtZSBpdCB0byAiZG9uZSIuCj4gPgo+ID4gPiA+ICsKPiA+
ID4gPiAgICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRBX0FOREVTX0NNTykpCj4g
PiA+ID4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGlmIChpc19pb2NwX3Byb2JlX2Rv
bmUpCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPgo+ID4gPgo+ID4gPiBX
aHkgbm90IGtlZXAgaXQgc2ltcGxlLCBhbmQganVzdCBkbwo+ID4gPgo+ID4gPiAgICAgZG9uZSA9
IHRydWU7Cj4gPiA+Cj4gPiBPSy4KPiA+Cj4gPiA+IGhlcmU/Cj4gPiA+IENhbiBhcmNoX2lkIG9y
IGltcGlkIHN1ZGRlbmx5IGNoYW5nZSwgc28geW91IGhhdmUgdG8gcmVjaGVjaz8KPiA+IEkgb25s
eSBjaGVjayBhcmNoX2lkIGFuZCBpbXBpZCBoZXJlLiBBcmUgeW91IHN1Z2dlc3RpbmcgSSBkcm9w
IGl0Pwo+Cj4gTm8sIEkgZG8gbm90IHN1Z2dlc3QgdG8gZHJvcCBpdC4KPiBJIHN1Z2dlc3RlZCBt
b3ZpbmcgdGhlICJkb25lID0gdHJ1ZSIgdXAsIHNvIHRoZSBjaGVjayBpcyBkb25lIG9ubHkgb25j
ZS4KPgpPSywgSSdsbCBoYXZlIHNvbWV0aGluZyBsaWtlIGJlbG93OgoKc3RhdGljIHZvaWQgZXJy
YXRhX3Byb2JlX2lvY3AodW5zaWduZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25nCmFyY2hfaWQs
IHVuc2lnbmVkIGxvbmcgaW1waWQpCnsKICAgIHN0YXRpYyBib29sIGRvbmU7CgogICAgaWYgKCFJ
U19FTkFCTEVEKENPTkZJR19FUlJBVEFfQU5ERVNfQ01PKSkKICAgICAgICByZXR1cm47CgogICAg
aWYgKGRvbmUpCiAgICAgICAgcmV0dXJuOwoKICAgIGlmIChhcmNoX2lkICE9IEFOREVTX0FYNDVN
UF9NQVJDSElEIHx8IGltcGlkICE9IEFOREVTX0FYNDVNUF9NSU1QSUQpCiAgICAgICAgcmV0dXJu
OwoKICAgIGRvbmUgPSB0cnVlOwoKICAgIGlmICghYXg0NW1wX2lvY3Bfc3dfd29ya2Fyb3VuZCgp
KQogICAgICAgIHJldHVybjsKCiAgICAvKiBTZXQgdGhpcyBqdXN0IHRvIG1ha2UgY29yZSBjYm8g
Y29kZSBoYXBweSAqLwogICAgcmlzY3ZfY2JvbV9ibG9ja19zaXplID0gMTsKICAgIHJpc2N2X25v
bmNvaGVyZW50X3N1cHBvcnRlZCgpOwp9CgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
