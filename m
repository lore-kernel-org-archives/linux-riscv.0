Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6690FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jM99BS7bmjDYhQPAPzE5M9Ojg3hSnhzA2yjqGxKPh3M=; b=4zRRn+NP5itzF+
	ZAp80r759gj55MRnfvtGJyHbHEV/kBTDRnTY85m97qQ9vejEyLWU3S23TkZ0WGr21Qs3ucNvL7E2T
	3Wr5ZKD4VgP77bJFMXTHPp5jJiFMAqHYJmBfjyChOwUNzBhXnSN/70YoypipLqw9qVrHwgl3xD6Rl
	8GucBxyIN3bWkwS6/HYgC/M9SIIxF1RRK43jrGdGQ8kKra3jgaZ82vsPyreJO5I+DmYnFWfM2sWIw
	YaAjkSpheVPJmFvBElPQZj6LSeK4f9otkMDKCcVX2i8HR+4XGw21mT3n0U3fGGSBVzYpkROjy0yKF
	xgZZcC0roctEQRW+uiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8oWB-00BwAr-0L;
	Thu, 30 Nov 2023 21:24:19 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8oW8-00BwAK-0A
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 21:24:17 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4b282c52967so802347e0c.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 13:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701379451; x=1701984251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8JZnxtGhUgcqZXchpT8KEI8gZ0vZ5N3V0y7FOr1aZU=;
        b=N7L7VrKjeNdx8d5dUAmNsqMalfKKF4vpGFTHlJXJSt1LF340GHkYGoHWVGWhaDaMKU
         IQrxzD0MxKID3dgNcExG5hICv/xJx2NDuvoxb0cSTDZsfHPr0/Lf2jfttnC4RH0By/up
         pncNSEb+kTrXdX3yI/Ird+87MlcDVlw83h5t6Crnxp5Bb/fKX4REN8JpVHVKTIahM+z7
         EEntk4Q68x26tTYgpIWCPGQw4u3v/Ijkrd8taQJ6CS6j9dDTVXpdY980+Aiq5egY0h2O
         Atz+ThvA5MQiKcugKTz7Q83BcsKsy6uWXXuNpYuVbVl2nzkR1GMGPDVetoc17+Gq+ONw
         +wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701379451; x=1701984251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8JZnxtGhUgcqZXchpT8KEI8gZ0vZ5N3V0y7FOr1aZU=;
        b=T1RrDmHnjqWL2XKGaZfnKnyxTseqzUMhJXU1ZqB/xrS3ezS9p/7mGfBxu1B+/czw4D
         Z/+26uy4/4U5jZLUpV/8d2lZBJ5EHeoie4TNXVDKKTwoO0kgpN9uG6i5A7hbF3/bCic1
         YUewwrcibuC9caYmMZN+CT5Wrrk8va6rGXwRuwuqFAlnnAdgpRNMdOSjhHpQDpsU4+TF
         xeeYeUkXGlS8/mdlWgivi2v7Awvj9v6dyFgxH9wnD8MfWWPqG6NI/ajgYv0FbUV9wEjE
         FhsAbWh9AoK8ykg2WdeLAbxVuK6JANz3WEmfCM+jjhQACBRwGm6NFp/kMq5JAaKf3AsR
         LPuQ==
X-Gm-Message-State: AOJu0YwIWPORvNVaoc7Avc83HyJxutgItSmQrX3uXfz5v2N88i/m+uN/
	Yy2kMaAuqPmxafSJZrIrl0RnZoUkBjeLiWqec6o=
X-Google-Smtp-Source: AGHT+IFA4NAnhZNSaJxq/EBtHlJp86UKaD1522eJ2sJfY6qTfYfp+iPbpXWB2KeS4DUciRCUdZhTlgo1Ti2vYAmDN+k=
X-Received: by 2002:a05:6122:d8f:b0:4ab:d9a7:3d13 with SMTP id
 bc15-20020a0561220d8f00b004abd9a73d13mr27659422vkb.7.1701379451372; Thu, 30
 Nov 2023 13:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com>
 <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com>
 <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com>
 <CA+V-a8shubctjQrg4DP-4RVAPg-TOn-twWeg5bL+M2JDsMGBbw@mail.gmail.com> <CAMuHMdVaybxXhPu0Od=A8YLR4JpgN4fV=Win==Etg1N8c+r4jA@mail.gmail.com>
In-Reply-To: <CAMuHMdVaybxXhPu0Od=A8YLR4JpgN4fV=Win==Etg1N8c+r4jA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Nov 2023 21:23:21 +0000
Message-ID: <CA+V-a8tZLihfMP_y-YTRdzrNL1ZdACvs07wq_-zeBpzyzbap4g@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_132416_138638_FF5830D5 
X-CRM114-Status: GOOD (  32.09  )
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

SGkgR2VlcnQsCgpPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCA0OjU04oCvUE0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCA1OjUw4oCvUE0gTGFkLCBQcmFiaGFrYXIKPiA8cHJh
Ymhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMg
YXQgNDoyNuKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdy
b3RlOgo+ID4gPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCA1OjIz4oCvUE0gTGFkLCBQcmFiaGFr
YXIKPiA+ID4gPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiBPbiBU
aHUsIE5vdiAzMCwgMjAyMyBhdCAyOjM04oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAx
OjU24oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
PiA+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBi
cC5yZW5lc2FzLmNvbT4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2UgbmVlZCB0byBwcm9iZSBm
b3IgSU9DUCBvbmx5IG9uY2UgZHVyaW5nIGJvb3Qgc3RhZ2UsIGFzIHdlIHdlcmUgcHJvYmluZwo+
ID4gPiA+ID4gPiBmb3IgSU9DUCBmb3IgYWxsIHRoZSBzdGFnZXMgdGhpcyBjYXVzZWQgdGhlIGJl
bG93IGlzc3VlIGR1cmluZyBtb2R1bGUtaW5pdAo+ID4gPiA+ID4gPiBzdGFnZSwKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gWzkuMDE5MTA0XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcg
cmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZmZmZmZmY4MTAwZDNhMAo+ID4gPiA+ID4gPiBb
OS4wMjcxNTNdIE9vcHMgWyMxXQo+ID4gPiA+ID4gPiBbOS4wMjk0MjFdIE1vZHVsZXMgbGlua2Vk
IGluOiByY2FyX2NhbmZkIHJlbmVzYXNfdXNiaHMgaTJjX3JpaWMgY2FuX2RldiBzcGlfcnNwaSBp
MmNfY29yZQo+ID4gPiA+ID4gPiBbOS4wMzc2ODZdIENQVTogMCBQSUQ6IDkwIENvbW06IHVkZXZk
IE5vdCB0YWludGVkIDYuNy4wLXJjMSsgIzU3Cj4gPiA+ID4gPiA+IFs5LjA0Mzc1Nl0gSGFyZHdh
cmUgbmFtZTogUmVuZXNhcyBTTUFSQyBFVksgYmFzZWQgb24gcjlhMDdnMDQzZjAxIChEVCkKPiA+
ID4gPiA+ID4gWzkuMDUwMzM5XSBlcGMgOiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQrMHgx
MC8weDNlCj4gPiA+ID4gPiA+IFs5LjA1NTU1OF0gIHJhIDogYW5kZXNfZXJyYXRhX3BhdGNoX2Z1
bmMrMHg0YS8weDUyCj4gPiA+ID4gPiA+IFs5LjA2MDQxOF0gZXBjIDogZmZmZmZmZmY4MDAwZDhj
MiByYSA6IGZmZmZmZmZmODAwMGQ5NWMgc3AgOiBmZmZmZmZjODAwM2FiYjAwCj4gPiA+ID4gPiA+
IFs5LjA2NzYwN10gIGdwIDogZmZmZmZmZmY4MTRlMjVhMCB0cCA6IGZmZmZmZmQ4MDM2MWU1NDAg
dDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+ID4gPiA+IFs5LjA3NDc5NV0gIHQxIDogMDAwMDAw
MDAwOTAwMDMxZSB0MiA6IDAwMDAwMDAwMDAwMDAwMDEgczAgOiBmZmZmZmZjODAwM2FiYjIwCj4g
PiA+ID4gPiA+IFs5LjA4MTk4NF0gIHMxIDogZmZmZmZmZmYwMTViNTdjNyBhMCA6IDAwMDAwMDAw
MDAwMDAwMDAgYTEgOiAwMDAwMDAwMDAwMDAwMDAxCj4gPiA+ID4gPiA+IFs5LjA4OTE3Ml0gIGEy
IDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDAgYTQgOiBmZmZmZmZmZjgx
MDBkOGJlCj4gPiA+ID4gPiA+IFs5LjA5NjM2MF0gIGE1IDogMDAwMDAwMDAwMDAwMDAwMSBhNiA6
IDAwMDAwMDAwMDAwMDAwMDEgYTcgOiAwMDAwMDAwMDA5MDAwMzFlCj4gPiA+ID4gPiA+IFs5LjEw
MzU0OF0gIHMyIDogZmZmZmZmZmYwMTViNTdkNyBzMyA6IDAwMDAwMDAwMDAwMDAwMDEgczQgOiAw
MDAwMDAwMDAwMDAwMzFlCj4gPiA+ID4gPiA+IFs5LjExMDczNl0gIHM1IDogODAwMDAwMDAwMDAw
OGE0NSBzNiA6IDAwMDAwMDAwMDAwMDA1MDAgczcgOiAwMDAwMDAwMDAwMDAwMDNmCj4gPiA+ID4g
PiA+IFs5LjExNzkyNF0gIHM4IDogZmZmZmZmYzgwMDNhYmQ0OCBzOSA6IGZmZmZmZmZmMDE1YjEx
NDAgczEwOiBmZmZmZmZmZjgxNTFhMWIwCj4gPiA+ID4gPiA+IFs5LjEyNTExM10gIHMxMTogZmZm
ZmZmZmYwMTViMTAwMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDEgdDQgOiBmZWZlZmVmZWZlZmVmZWZm
Cj4gPiA+ID4gPiA+IFs5LjEzMjMwMV0gIHQ1IDogZmZmZmZmZmYwMTViNTdjNyB0NiA6IGZmZmZm
ZmQ4YjYzYTYwMDAKPiA+ID4gPiA+ID4gWzkuMTM3NTg3XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAx
MjAgYmFkYWRkcjogZmZmZmZmZmY4MTAwZDNhMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgo+ID4g
PiA+ID4gPiBbOS4xNDU0NjhdIFs8ZmZmZmZmZmY4MDAwZDhjMj5dIHJpc2N2X25vbmNvaGVyZW50
X3N1cHBvcnRlZCsweDEwLzB4M2UKPiA+ID4gPiA+ID4gWzkuMTUxOTcyXSBbPGZmZmZmZmZmODAw
MDI3ZTg+XSBfYXBwbHlfYWx0ZXJuYXRpdmVzKzB4ODQvMHg4Ngo+ID4gPiA+ID4gPiBbOS4xNTc3
ODRdIFs8ZmZmZmZmZmY4MDAwMjliZT5dIGFwcGx5X21vZHVsZV9hbHRlcm5hdGl2ZXMrMHgxMC8w
eDFhCj4gPiA+ID4gPiA+IFs5LjE2NDExM10gWzxmZmZmZmZmZjgwMDA4ZmNjPl0gbW9kdWxlX2Zp
bmFsaXplKzB4NWUvMHg3YQo+ID4gPiA+ID4gPiBbOS4xNjk1ODNdIFs8ZmZmZmZmZmY4MDA4NWNk
Nj5dIGxvYWRfbW9kdWxlKzB4ZmQ4LzB4MTc5Ywo+ID4gPiA+ID4gPiBbOS4xNzQ5NjVdIFs8ZmZm
ZmZmZmY4MDA4NjYzMD5dIGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDc2LzB4YWEKPiA+ID4gPiA+
ID4gWzkuMTgwOTQ4XSBbPGZmZmZmZmZmODAwODY3ZjY+XSBfX3Jpc2N2X3N5c19maW5pdF9tb2R1
bGUrMHgxNzYvMHgyYTgKPiA+ID4gPiA+ID4gWzkuMTg3MzY1XSBbPGZmZmZmZmZmODA4ODk4NjI+
XSBkb190cmFwX2VjYWxsX3UrMHhiZS8weDEzMAo+ID4gPiA+ID4gPiBbOS4xOTI5MjJdIFs8ZmZm
ZmZmZmY4MDg5MjBiYz5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHg2NAo+ID4gPiA+ID4gPiBb
OS4xOTg1NzNdIENvZGU6IDAwMDkgYjdlOSA2Nzk3IDAxNGQgYTc4MyA4NWE3IGM3OTkgNDc4NSAw
NzE3IDAxMDAgKDAxMjMpIGFlZjcKPiA+ID4gPiA+ID4gWzkuMjA1OTk0XSAtLS1bIGVuZCB0cmFj
ZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBpcyBi
ZWNhdXNlIHdlIGNhbGxlZCByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKSBmb3IgYWxsIHRo
ZSBzdGFnZXMKPiA+ID4gPiA+ID4gZHVyaW5nIElPQ1AgcHJvYmUuIHJpc2N2X25vbmNvaGVyZW50
X3N1cHBvcnRlZCgpIGZ1bmN0aW9uIHNldHMKPiA+ID4gPiA+ID4gbm9uY29oZXJlbnRfc3VwcG9y
dGVkIHZhcmlhYmxlIHRvIHRydWUgd2hpY2ggaGFzIGFuIGFubm90YXRpb24gc2V0IHRvCj4gPiA+
ID4gPiA+ICJfX3JvX2FmdGVyX2luaXQiIGR1ZSB0byB3aGljaCB3ZSB3ZXJlIHNlZWluZyB0aGUg
YWJvdmUgc3BsYXQuIEZpeCB0aGlzIGJ5Cj4gPiA+ID4gPiA+IHByb2JpbmcgZm9yIElPQ1Agb25s
eSBvbmNlIGluIGJvb3Qgc3RhZ2UgYnkgaGF2aW5nIGEgYm9vbGVhbiB2YXJpYWJsZQo+ID4gPiA+
ID4gPiBpc19pb2NwX3Byb2JlX2RvbmUgd2hpY2ggd2lsbCBiZSBzZXQgdG8gdHJ1ZSB1cG9uIElP
Q1AgcHJvYmUgaW4KPiA+ID4gPiA+ID4gZXJyYXRhX3Byb2JlX2lvY3AoKSBhbmQgd2UgYmFpbCBv
dXQgZWFybHkgaWYgaXNfaW9jcF9wcm9iZV9kb25lIGlzIHNldC4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gV2hpbGUgYXQgaXQgbWFrZSByZXR1cm4gdHlwZSBvZiBlcnJhdGFfcHJvYmVfaW9jcCgp
IHRvIHZvaWQgYXMgd2Ugd2VyZQo+ID4gPiA+ID4gPiBub3QgY2hlY2tpbmcgdGhlIHJldHVybiB2
YWx1ZSBpbiBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYygpLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBGaXhlczogZTAyMWFlN2Y1MTQ1ICgicmlzY3Y6IGVycmF0YTogQWRkIEFuZGVzIGFsdGVybmF0
aXZlIHBvcnRzIikKPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gPiA+ID4gPiAtLS0KPiA+
ID4gPiA+ID4gdjEtPnYyCj4gPiA+ID4gPiA+ICogQXMgUklTQ1ZfQUxURVJOQVRJVkVTX0JPT1Qg
c3RhZ2UgY2FuIGhhcHBlbiB0d2ljZSBhZGQgYSBpc19pb2NwX3Byb2JlX2RvbmUKPiA+ID4gPiA+
ID4gICB2YXJpYWJsZSB0byBwcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UuCj4gPiA+ID4gPiA+ICog
VXBkYXRlZCBjb21taXQgbWVzc2FnZQo+ID4gPiA+ID4gPiAqIE1ha2UgcmV0dXJuIHZhbHVlIG9m
IGVycmF0YV9wcm9iZV9pb2NwKCkgdG8gdm9pZAo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcyBm
b3IgdGhlIHVwZGF0ZSEKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvZXJy
YXRhL2FuZGVzL2VycmF0YS5jCj4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL2Fu
ZGVzL2VycmF0YS5jCj4gPiA+ID4gPiA+IEBAIC0zOCwyOSArMzgsMzYgQEAgc3RhdGljIGxvbmcg
YXg0NW1wX2lvY3Bfc3dfd29ya2Fyb3VuZCh2b2lkKQo+ID4gPiA+ID4gPiAgICAgICAgIHJldHVy
biByZXQuZXJyb3IgPyAwIDogcmV0LnZhbHVlOwo+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiAtc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX2lvY3AodW5zaWduZWQgaW50IHN0
YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCj4gPiA+ID4g
PiA+ICtzdGF0aWMgdm9pZCBlcnJhdGFfcHJvYmVfaW9jcCh1bnNpZ25lZCBpbnQgc3RhZ2UsIHVu
c2lnbmVkIGxvbmcgYXJjaF9pZCwgdW5zaWduZWQgbG9uZyBpbXBpZCkKPiA+ID4gPiA+ID4gIHsK
PiA+ID4gPiA+ID4gKyAgICAgICBzdGF0aWMgYm9vbCBpc19pb2NwX3Byb2JlX2RvbmU7Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gZG9uZT8KPiA+ID4gPiA+Cj4gPiA+ID4gT0sgSSdsbCByZW5hbWUgaXQg
dG8gImRvbmUiLgo+ID4gPiA+Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gICAgICAgICBpZiAo
IUlTX0VOQUJMRUQoQ09ORklHX0VSUkFUQV9BTkRFU19DTU8pKQo+ID4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJu
Owo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICAgICAgaWYgKGlzX2lvY3BfcHJvYmVfZG9u
ZSkKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBXaHkgbm90IGtlZXAgaXQgc2ltcGxlLCBhbmQganVzdCBkbwo+ID4gPiA+
ID4KPiA+ID4gPiA+ICAgICBkb25lID0gdHJ1ZTsKPiA+ID4gPiA+Cj4gPiA+ID4gT0suCj4gPiA+
ID4KPiA+ID4gPiA+IGhlcmU/Cj4gPiA+ID4gPiBDYW4gYXJjaF9pZCBvciBpbXBpZCBzdWRkZW5s
eSBjaGFuZ2UsIHNvIHlvdSBoYXZlIHRvIHJlY2hlY2s/Cj4gPiA+ID4gSSBvbmx5IGNoZWNrIGFy
Y2hfaWQgYW5kIGltcGlkIGhlcmUuIEFyZSB5b3Ugc3VnZ2VzdGluZyBJIGRyb3AgaXQ/Cj4gPiA+
Cj4gPiA+IE5vLCBJIGRvIG5vdCBzdWdnZXN0IHRvIGRyb3AgaXQuCj4gPiA+IEkgc3VnZ2VzdGVk
IG1vdmluZyB0aGUgImRvbmUgPSB0cnVlIiB1cCwgc28gdGhlIGNoZWNrIGlzIGRvbmUgb25seSBv
bmNlLgo+ID4gPgo+ID4gT0ssIEknbGwgaGF2ZSBzb21ldGhpbmcgbGlrZSBiZWxvdzoKPiA+Cj4g
PiBzdGF0aWMgdm9pZCBlcnJhdGFfcHJvYmVfaW9jcCh1bnNpZ25lZCBpbnQgc3RhZ2UsIHVuc2ln
bmVkIGxvbmcKPiA+IGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCj4gPiB7Cj4gPiAgICAg
c3RhdGljIGJvb2wgZG9uZTsKPiA+Cj4gPiAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19FUlJB
VEFfQU5ERVNfQ01PKSkKPiA+ICAgICAgICAgcmV0dXJuOwo+ID4KPiA+ICAgICBpZiAoZG9uZSkK
PiA+ICAgICAgICAgcmV0dXJuOwo+ID4KPiA+ICAgICBpZiAoYXJjaF9pZCAhPSBBTkRFU19BWDQ1
TVBfTUFSQ0hJRCB8fCBpbXBpZCAhPSBBTkRFU19BWDQ1TVBfTUlNUElEKQo+ID4gICAgICAgICBy
ZXR1cm47Cj4KPiBQbGVhc2UgbW92ZSB0aGlzIGNoZWNrIGJlbG93ICJkb25lID0gdHJ1ZSIsIGFz
IHRoZXJlIGlzIG5vIG5lZWQgdG8KPiBleGVjdXRlIHRoaXMgY2hlY2sgbXVsdGlwbGUgdGltZXMu
Cj4KT0ssIHdpbGwgZG8uCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
