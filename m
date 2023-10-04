Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB99AE7C4CE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nq6IyxWji1vOeg44+ET65ZZw3IjTxNTWUzY4OWVndg=; b=APnHTyd1XJ+rDU
	zenkcjWJHHri4tOaq5Nhrj9MT0HTlv8NCMcLcbdBQhUMvXetZ04ZKSKlVIiiTX1x+IQmue1EqHC9V
	PeHtid9x4W+yWOSfKW6pILOEWdX53t8cTFICCMmayAw1jQCmB306EVodKitv4fsJDJ0A1ESoee7jR
	2zg87lNA7T4OWsFLhPmzONn70ANIHZmzNFsJ871H0NzopmFQWroXxmywTWTauZKWGdfoX58bFTRXc
	rs5gMi3/alQ8c9+VrfkhxfywUfUpBrP2RYeJquU881osozdLwRvjG0yFoIYT36xAb8XdpGEPndfUa
	UrGFtqTfSXMccPOmmeUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3ma-000LvF-23;
	Wed, 04 Oct 2023 15:27:28 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3mU-000Ltk-0C
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:27:26 +0000
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d8168d08bebso2322076276.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696433240; x=1697038040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+vH9ZjDJZ1+GqxJ7pOb8CHx+0pluQ1FP46Flmdef0g=;
        b=k2DlUpCEhVXCNV99UIWNieS/OPC4PKCBP4W/dCNwreLDfGX1BxsYiQG9nOFDjH3+Uf
         KzxM7LL849i0JSA9PHDXZZWgkUNEiKOenToE03kZMdVLCwWL+eB5zk6lfW1YBLDV0Dim
         ufwf87vXwi0evdvUAbXNhH2HP0vdsR1b9V8hZ1NHmIDdGuAhLpHDa4JvHmUB78SSsGKB
         33KosZ1WnwZHjp7QSVUzYER7H2MaxQp8sWbBblUdFcm9nD8LrqFFov5z9S3H9b1Z9ubj
         4TUtLofuw+y6WL28eu1xbRbNWIMKcvxbGFpO2txweVPZOtLCt0NC4ILMLwgWMPaP2Tr4
         AD5w==
X-Gm-Message-State: AOJu0Yxlba39RHDW9eZLx4B84c0HHFQLl86HieifiR/JIm0qVNAYbd73
	jbGf7dKIJUmRqfhpbRMYiSzCKf9GwnpTrA==
X-Google-Smtp-Source: AGHT+IGJ2yWnw4yqFdXpSuCKxoUd393DUwJmuI99DyIQuOCTncqVyVH95d1KjZHAAQEaQWk9H6n/aQ==
X-Received: by 2002:a5b:48e:0:b0:d86:5a8d:6e34 with SMTP id n14-20020a5b048e000000b00d865a8d6e34mr2053001ybp.29.1696433240207;
        Wed, 04 Oct 2023 08:27:20 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id g17-20020a05690203d100b00d7465a90f0csm1081660ybs.22.2023.10.04.08.27.19
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 08:27:19 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f1dff5298so27455337b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:27:19 -0700 (PDT)
X-Received: by 2002:a0d:d7cc:0:b0:584:4bbb:963b with SMTP id
 z195-20020a0dd7cc000000b005844bbb963bmr2800485ywd.15.1696433239582; Wed, 04
 Oct 2023 08:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker> <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com> <ZR1xSw47Z1/SEIwz@xhacker>
In-Reply-To: <ZR1xSw47Z1/SEIwz@xhacker>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Oct 2023 17:27:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt9+XuUEF2j=osAVFFaPkYF4UntPdcqYydu8QzyyuMfw@mail.gmail.com>
Message-ID: <CAMuHMdXt9+XuUEF2j=osAVFFaPkYF4UntPdcqYydu8QzyyuMfw@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
To: Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_082724_504103_A23F8FC4 
X-CRM114-Status: GOOD (  52.39  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Drew Fustini <dfustini@baylibre.com>, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Han Gao <gaohan@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Robin Murphy <robin.murphy@arm.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSmlzaGVuZywKCk9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgNDoxOOKAr1BNIEppc2hlbmcgWmhh
bmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMDQsIDIwMjMgYXQg
MDI6NDk6NTZQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+ID4gT24gMDQvMTAvMjAyMyAy
OjAyIHBtLCBMYWQsIFByYWJoYWthciB3cm90ZToKPiA+ID4gKyBDQyBsaW51eC1tbSBhbmQgUm9i
aW4gTXVycGh5Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgMTI6NDLigK9QTSBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgogPiA+ID4KPiA+ID4gPiBP
biBNb24sIE9jdCAwMiwgMjAyMyBhdCAwOTozNzo0NFBNIC0wNzAwLCBEcmV3IEZ1c3Rpbmkgd3Jv
dGU6Cj4gPiA+ID4gPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAwNTo0ODoyMVBNIC0wNTAwLCBS
b2JlcnQgTmVsc29uIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAy
OjA44oCvUE0gUm9iZXJ0IE5lbHNvbiA8cm9iZXJ0Y25lbHNvbkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgODo1MeKA
r1BNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBl
TU1DIG9uIHRoZSBCZWFnbGVWIEFoZWFkIGFuZCB0aGUKPiA+ID4gPiA+ID4gPiA+IFNpcGVlZCBM
aWNoZWVQaSA0QS4gVGhpcyBhbGxvd3MgdGhlIGtlcm5lbCB0byBib290IHdpdGggdGhlIHJvb3Rm
cyBvbgo+ID4gPiA+ID4gPiA+ID4gZU1NQy4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
PiBJIHRlc3RlZCBvbiB0b3Agb2YgdjYuNi1yYzIgd2l0aCB0aGlzIGNvbmZpZyBbMV0uIEkgd2Fz
IGFibGUgdG8gYm9vdAo+ID4gPiA+ID4gPiA+ID4gYm90aCB0aGUgQWhlYWQgWzJdIGFuZCBMUGk0
YSBbM10gZnJvbSBlTU1DLiBUaGUgZm9sbG93aW5nIHByZXJlcXVpc2l0ZXMKPiA+ID4gPiA+ID4g
PiA+IGFyZSByZXF1aXJlZDoKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgICBbUEFU
Q0ggdjJdIHJpc2N2OiBkdHM6IHRoZWFkOiBzZXQgZG1hLW5vbmNvaGVyZW50IHRvIHNvYyBidXMg
WzRdCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSSBwdXNoZWQgYSBicmFuY2ggWzVd
IHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgYW5kIHRoZSBhYm92ZSBwYXRjaCBmb3IKPiA+ID4gPiA+
ID4gPiA+IHRob3NlIHRoYXQgZmluZCBhIGdpdCBicmFuY2ggZWFzaWVyIHRvIHRlc3QuCj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gUGxlYXNlIG5vdGUgdGhhdCBvbmx5IHRoZSBNTUMg
Y29udHJvbGxlciBjb25uZWN0ZWQgdG8gdGhlIGVNTUMgZGV2aWNlCj4gPiA+ID4gPiA+ID4gPiBp
cyBlbmFibGVkIGluIHRoZSBkZXZpY2UgdHJlZXMgZm9yIHRoZXNlIHR3byBib2FyZHMuIEkgZGlk
IG5vdCB5ZXQKPiA+ID4gPiA+ID4gPiA+IGF0dGVtcHQgdG8gY29uZmlndXJlIGFuZCB1c2UgdGhl
IG1pY3JvU0QgY2FyZCBzbG90LiBNeSBwcmVmZXJlbmNlIGlzIHRvCj4gPiA+ID4gPiA+ID4gPiBh
ZGRyZXNzIHRoYXQgaW4gYSBmdXR1cmUgcGF0Y2ggc2VyaWVzLgo+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+IFJlZmVyZW5jZXM6Cj4gPiA+ID4gPiA+ID4gPiBbMV0gaHR0cHM6Ly9naXN0
LmdpdGh1Yi5jb20vcGRwNy81ZmJkY2YyYTY1ZWIxYWJkZDNhMjlkNTE5YzE5Y2RkMgo+ID4gPiA+
ID4gPiA+ID4gWzJdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvOTFhODAxYTVmOGQxMDcw
YzUzNTA5ZWRhOTgwMGFkNzgKPiA+ID4gPiA+ID4gPiA+IFszXSBodHRwczovL2dpc3QuZ2l0aHVi
LmNvbS9wZHA3LzE0NDVjM2M5OTFlODhmZDY5YzYwMTY1Y2VmNjU3MjZhCj4gPiA+ID4gPiA+ID4g
PiBbNF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTIwNzIyMzIu
MjQ1NS0xLWpzemhhbmdAa2VybmVsLm9yZy8KPiA+ID4gPiA+ID4gPiA+IFs1XSBodHRwczovL2dp
dGh1Yi5jb20vcGRwNy9saW51eC90cmVlL2I0L3RoMTUyMC1tbWMKPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+IFRoaXMgcGF0Y2hzZXQgY2FtZSBvdXQgdmVyeSBuaWNlIQo+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gdjYuNi1yYzIgd2l0aCBMYXN0IFJGQyB2MjoKPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IFsgICAgNC4wNjY2MzBdIG1tYzA6IFNESENJIGNvbnRyb2xsZXIgb24gZmZl
NzA4MDAwMC5tbWMKPiA+ID4gPiA+ID4gPiBbZmZlNzA4MDAwMC5tbWNdIHVzaW5nIFBJTwo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gZGViaWFuQEJlYWdsZVY6fiQgc3VkbyBoZHBhcm0gLXRU
IC9kZXYvbW1jYmxrMAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gL2Rldi9tbWNibGswOgo+
ID4gPiA+ID4gPiA+ICAgVGltaW5nIGNhY2hlZCByZWFkczogICAxNTE2IE1CIGluICAyLjAwIHNl
Y29uZHMgPSA3NTguMDkgTUIvc2VjCj4gPiA+ID4gPiA+ID4gICBUaW1pbmcgYnVmZmVyZWQgZGlz
ayByZWFkczogIDg0IE1CIGluICAzLjAxIHNlY29uZHMgPSAgMjcuOTQgTUIvc2VjCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiB2cyB2Ni42LXJjMiB3aXRoIHRoaXMgcGF0Y2hzZXQ6Cj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgIFsgICAgNC4wOTY4MzddIG1tYzA6IFNESENJIGNvbnRy
b2xsZXIgb24gZmZlNzA4MDAwMC5tbWMKPiA+ID4gPiA+ID4gPiBbZmZlNzA4MDAwMC5tbWNdIHVz
aW5nIERNQQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gZGViaWFuQEJlYWdsZVY6fiQgc3Vk
byBoZHBhcm0gLXRUIC9kZXYvbW1jYmxrMAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gL2Rl
di9tbWNibGswOgo+ID4gPiA+ID4gPiA+ICAgVGltaW5nIGNhY2hlZCByZWFkczogICAxNTgwIE1C
IGluICAyLjAwIHNlY29uZHMgPSA3OTAuOTcgTUIvc2VjCj4gPiA+ID4gPiA+ID4gICBUaW1pbmcg
YnVmZmVyZWQgZGlzayByZWFkczogNDE4IE1CIGluICAzLjAwIHNlY29uZHMgPSAxMzkuMTEgTUIv
c2VjCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IERyZXcgcG9pbnRlZCBvdXQgb24gU2xhY2ssIHRo
aXMgd2FzIG5vdCBxdWl0ZSByaWdodC4uIEFmdGVyIG1vcmUKPiA+ID4gPiA+ID4gZGlnZ2luZyBi
eSBEcmV3LCBDT05GSUdfRE1BX0dMT0JBTF9QT09MIGlzIGNhdXNpbmcgYSBETUEgbGltaXRhdGlv
bgo+ID4gPiA+ID4gPiB3aXRoIHRoZSBtdWx0aXBsYXRmb3JtIGRlZmNvbmZpZy4gc28gd2l0aCwK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gLi9zY3JpcHRzL2NvbmZpZyAtLWRpc2FibGUgQ09ORklH
X0FSQ0hfUjlBMDdHMDQzCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICh0byByZW1vdmUgQ09ORklH
X0RNQV9HTE9CQUxfUE9PTCkuLi4gYW5vdGhlciAyeCBpbiBidWZmZXJlZCByZWFkcy4uCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IFsgICAgNC4wNTkyNDJdIG1tYzA6IFNESENJIGNvbnRyb2xsZXIg
b24gZmZlNzA4MDAwMC5tbWMKPiA+ID4gPiA+ID4gW2ZmZTcwODAwMDAubW1jXSB1c2luZyBBRE1B
IDY0LWJpdAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBkZWJpYW5AQmVhZ2xlVjp+JCBzdWRvIGhk
cGFybSAtdFQgL2Rldi9tbWNibGswCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IC9kZXYvbW1jYmxr
MDoKPiA+ID4gPiA+ID4gICBUaW1pbmcgY2FjaGVkIHJlYWRzOiAgIDE2MDAgTUIgaW4gIDIuMDAg
c2Vjb25kcyA9IDgwMC45MyBNQi9zZWMKPiA+ID4gPiA+ID4gICBUaW1pbmcgYnVmZmVyZWQgZGlz
ayByZWFkczogODkyIE1CIGluICAzLjAwIHNlY29uZHMgPSAyOTcuMDYgTUIvc2VjCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gSXQgc2VlbXMgQ09ORklHX0RNQV9HTE9CQUxfUE9PTD15IGNhdXNlcyBBRE1B
IGJ1ZmZlciBhbGxvYyB0byBmYWlsIFsxXToKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICBtbWMwOiBV
bmFibGUgdG8gYWxsb2NhdGUgQURNQSBidWZmZXJzIC0gZmFsbGluZyBiYWNrIHRvIHN0YW5kYXJk
IERNQQo+ID4gPiA+ID4KPiA+ID4gPiA+IFByYWJoYWthcidzIEFYNDVNUCBub24tY29oZXJlbnQg
RE1BIHN1cHBvcnQgWzJdIHNlcmllcyBpbnRyb2R1Y2VkIHRoZQo+ID4gPiA+ID4gc2VsZWN0aW9u
IG9mIERNQV9HTE9CQUxfUE9PTCBmb3IgQVJDSF9SOUEwN0cwNDMgYW5kIHRoZSByaXNjdiBkZWZj
b25maWcKPiA+ID4gPiA+IHNlbGVjdHMgQVJDSF9SOUEwN0cwNDMuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gUGF0Y2ggNSBpbiB0aGUgc2VyaWVzIFszXSBzdGF0ZXMgdGhhdDoKPiA+ID4gPiA+Cj4gPiA+
ID4gPiAgICBXaXRoIERNQV9HTE9CQUxfUE9PTCBlbmFibGVkIGFsbCBETUEgYWxsb2NhdGlvbnMg
aGFwcGVuIGZyb20gdGhpcwo+ID4gPiA+ID4gICAgcmVnaW9uIGFuZCBzeW5jaHJvbml6YXRpb24g
Y2FsbGJhY2tzIGFyZSBpbXBsZW1lbnRlZCB0byBzeW5jaHJvbml6ZQo+ID4gPiA+ID4gICAgd2hl
biBkb2luZyBETUEgdHJhbnNhY3Rpb25zLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgZXhhbXBs
ZSBvZiBhICJzaGFyZWQtZG1hLXBvb2wiIG5vZGUgd2FzIGdpdmVuOgo+ID4gPiA+ID4KPiA+ID4g
PiA+ICAgICAgICAgIHBtYV9yZXN2MEA1ODAwMDAwMCB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+ID4gPiA+ID4gICAgICAgICAgICAgIHJl
ZyA9IDwweDAgMHg1ODAwMDAwMCAweDAgMHgwODAwMDAwMD47Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgbm8tbWFwOwo+ID4gPiA+ID4gICAgICAgICAgICAgIGxpbnV4LGRtYS1kZWZhdWx0Owo+ID4g
PiA+ID4gICAgICAgICAgfTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJJ3ZlIGNvcGllZCB0aGF0IHRv
IHRoMTUyMC1iZWFnbGV2LWFoZWFkLmR0cy4gVGhlIGFkZHJlc3Mgb2YgMHg1ODAwMDAwMAo+ID4g
PiA+ID4gaGFzIG5vIHNpZ25pZmljYW5jZSBvbiB0aDE1MjAsIGJ1dCB0aGUgZXhpc3RlbmNlIG9m
IHNoYXJlZC1kbWEtcG9vbAo+ID4gPiA+ID4gc2VlbXMgdG8gZml4IHRoZSBwcm9ibGVtLiBBRE1B
IG1vZGUgWzRdIGlzIG5vdyB3b3JraW5nIGV2ZW4gdGhvdWdoCj4gPiA+ID4gPiBDT05GSUdfRE1B
X0dMT0JBTF9QT09MPXkuCj4gPiA+ID4KPiA+ID4gPiArIENocmlzdG9waCwgTGFkCj4gPiA+ID4K
PiA+ID4gPiBJTUhPLCB0aGlzIGlzIG5vdCBUSDE1MjAgc3BlY2lmaWMgYnV0IGEgZ2VuZXJpYyBp
c3N1ZS4KPiA+ID4gPgo+ID4gPiA+IEkgYmVsaWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgic29j
OiByZW5lc2FzOiBLY29uZmlnOiBTZWxlY3QgdGhlCj4gPiA+ID4gcmVxdWlyZWQgY29uZmlncyBm
b3IgUlovRml2ZSBTb0MiKSBjYW4gY2F1c2UgcmVncmVzc2lvbiBvbiBhbGwKPiA+ID4gPiBub24t
ZG1hLWNvaGVyZW50IHJpc2N2IHBsYXRmb3JtcyB3aXRoIGdlbmVyaWMgZGVmY29uZmlnLiBUaGlz
IGlzCj4gPiA+ID4gYSBjb21tb24gaXNzdWUuIFRoZSBsb2dpYyBoZXJlIGlzOiBnZW5lcmljIHJp
c2N2IGRlZmNvbmZpZyBzZWxlY3RzCj4gPiA+ID4gQVJDSF9SOUEwN0cwNDMgd2hpY2ggc2VsZWN0
cyBETUFfR0xPQkFMX1BPT0wsIHdoaWNoIGFzc3VtZXMgYWxsCj4gPiA+ID4gbm9uLWRtYS1jb2hl
cmVudCByaXNjdiBwbGF0Zm9ybXMgaGF2ZSBhIGRtYSBnbG9iYWwgcG9vbCwgdGhpcyBhc3N1bXB0
aW9uCj4gPiA+ID4gc2VlbXMgbm90IGNvcnJlY3QuIEFuZCBJIGJlbGlldmUgRE1BX0dMT0JBTF9Q
T09MIHNob3VsZCBub3QgYmUKPiA+ID4gPiBzZWxlY3RlZCBieSBBUkNIX1NPQ0ZBTUlMSVksIGlu
c3RlYWQsIG9ubHkgQVJDSCB1bmRlciBzb21lIHNwZWNpZmljCj4gPiA+ID4gY29uZGl0aW9ucyBj
YW4gc2VsZWN0IGl0IGdsb2JhbHksIGZvciBleGFtcGxlIE5PTU1VIEFSTSBhbmQgc28gb24uCj4g
PiA+ID4KPiA+ID4gPiBTaW5jZSB0aGlzIGlzIGEgcmVncmVzc2lvbiwgd2hhdCdzIHByb3BlciBm
aXg/IGFueSBzdWdnZXN0aW9uIGlzCj4gPiA+ID4gYXBwcmVjaWF0ZWQuCj4gPgo+ID4gSSB0aGlu
ayB0aGUgYW5zd2VyIGlzIHRvIG5vdCBzZWxlY3QgRE1BX0dMT0JBTF9QT09MLCBzaW5jZSB0aGF0
IGlzIG9ubHkKPiA+IGRlc2lnbmVkIGZvciBub21tdSBjYXNlcyB3aGVyZSBub24tY2FjaGVhYmxl
IG1lbW9yeSBsaXZlcyBpbiBhIGZpeGVkIHBsYWNlCj4gPiBpbiB0aGUgcGh5c2ljYWwgYWRkcmVz
cyBtYXAsIGFuZCByZWd1bGFyIGtlcm5lbCBwYWdlcyBjYW4ndCBiZSByZW1hcHBlZC4gQXMKPiA+
IGZhciBhcyBJJ20gYXdhcmUsIFJJU0NWX0RNQV9OT05DT0hFUkVOVCBpcyB0aGUgdGhpbmcgeW91
IHdhbnQsIHN1Y2ggdGhhdAo+ID4gRE1BX0RJUkVDVF9SRU1BUCBjYW4gZHluYW1pY2FsbHkgcHJv
dmlkZSBub24tY2FjaGVhYmxlIGNvaGVyZW50IGJ1ZmZlcnMgZm9yCj4gPiBub24taGFyZHdhcmUt
Y29oZXJlbnQgZGV2aWNlcy4KPgo+IFRoYW5rIFJvYmluIQo+IEFGQUlLLCBBUkNIX1I5QTA3RzA0
MyBuZWVkcyB0aGUgZG1hIGdsb2JhbCBwb29sIHRvIGhhbmRsZSBpdHMgQ01PLiBTbwo+IGl0IGxv
b2tzIGxpa2UgQVJDSF9SOUEwN0cwNDMgY2FuJ3QgYmUgZW5hYmxlZCBpbiByaXNjdiBnZW5lcmlj
Cj4gZGVmY29uZmlnLiBBbmQgd2UgYWxzbyBuZWVkIGEgc3BlY2lhbCBzb2x1dGlvbiB0byBwcmV2
ZW50IHJhbmRvbSBjb25maWcKPiBmcm9tIHNlbGVjdGluZyBBUkNIX1I5QTA3RzA0MyBieSBjaGFu
Y2UgZm9yIG90aGVyIHBsYXRmb3JtcwoKVGhlcmUgd2lsbCBiZSBhIHNpbWlsYXIgaXNzdWUgd2l0
aCBlLmcuIFN0YXJsaWdodCwgYXMgRVJSQVRBX1NUQVJGSVZFX0pINzEwMAoobm90IHlldCB1cHN0
cmVhbSwgYnV0IGluIGVzbWlsL3Zpc2lvbmZpdmUpIGFsc28gc2VsZWN0cyBETUFfR0xPQkFMX1BP
T0wuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
