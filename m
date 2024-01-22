Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F71C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBjKQjXa9Zsfwd9SV8pChVX5vCwTNV6dRC4O2BW2Vg0=; b=abuQ4Q5gj/96f0
	JMjaunrSdrLzdvMGTwChpeA+co6gY6ie1XZKzEX5rWSOfjZTKbT9qkmqApAPhRo9s+1V+gnLVyAh6
	5ISFwlxwtBf2nMuy17KZBpBov5LClm4Y19J0mctE9F8blkVOFcpb7w0BSlD4CDil2kBY7r2n6hfp8
	W2HU48B2WG9vBJxbmX6uadyZ5d2i+gidzd/0qm0MYmu7KgwdC3QD2/2SU/R3mi+MTZ9RXu5bZVDRL
	Y8np29ah6/bR1VyuqJQhiNQSocLyh+eBJ8kTvNqSd9iCmymsbGKn4i8nUXAmcWkIPetR93ztslgI0
	nHL7b9tzpjoyA0i+9VZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRx4h-00Cw5L-1v;
	Mon, 22 Jan 2024 16:23:03 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRx4e-00Cw4B-0c;
	Mon, 22 Jan 2024 16:23:01 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-20475bf35a2so107838fac.1;
        Mon, 22 Jan 2024 08:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705940578; x=1706545378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeqYwsAig8OM8+vknifuJYP2AzBgf+u+iQafy2tdxVA=;
        b=Y+yhXjo/6rw+n305E0Ly2/Bu0yBSoViN2Ph8R+a0lQxIeVWfovRgFyIXFOiEbt/AJn
         1ZQMfvje1dz59J5U2mdc/SnVc/OzGOhBUDe617ZJJQCjJW0Dw5ylmhjbHFH1x7Vc8Mbi
         AqrY6RAavFB84Iqm9k0KHnd2dRF20h0KWyTqN/2CIxpvIBiI3p5ns06GUbIncYcTXdjr
         qBvg+JHyENR9aHbCtbAhZTaurZhzIEWxW07AECNhYUOUsJKgNo5F8kiY9/tPN6W5IhhO
         4Y06x97jYLwwTkwZWGTVqOaKz1xawJVX3SB3J2u+cycTqriJGCgygY2k2Xz+Gd/ZpzgW
         9pzQ==
X-Gm-Message-State: AOJu0YxCMce5EsQMhMJ8AR28b67EW2XEOCVvnR435vEMhxUuoQIEfXCa
	UgnjEC3fWaH4h0bwXlnnHfU0+bscEK4q6HABYJw0smaZacAbgUXsC8xubhJG9aniKeBsvVr0ui0
	P6dBDbA7g/XMynMUYYp2g4Sbdgy4=
X-Google-Smtp-Source: AGHT+IFuHJXu5mAxkwobVQKGd/S4EJuqPyP21RbRV5V/lpmKFOP7N2htShcxq/NrWRpDaEz7nw7KbFO1kuk4zNCgfuM=
X-Received: by 2002:a05:6870:7009:b0:213:7249:3fb0 with SMTP id
 u9-20020a056870700900b0021372493fb0mr6379169oae.5.1705940577897; Mon, 22 Jan
 2024 08:22:57 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
 <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
 <ZaURtUvWQyjYfiiO@shell.armlinux.org.uk> <20240122160227.00002d83@Huawei.com>
In-Reply-To: <20240122160227.00002d83@Huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 22 Jan 2024 17:22:46 +0100
Message-ID: <CAJZ5v0hamuXJ_w-TSmVb=5jGide=Lb7sCjbzzNb_rFuPrvkgxQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_082300_228575_8D1C5A3E 
X-CRM114-Status: GOOD (  32.67  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNTowMuKAr1BNIEpvbmF0aGFuIENhbWVyb24KPEpvbmF0
aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDE1IEphbiAyMDI0IDEx
OjA2OjI5ICswMDAwCj4gIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4Lm9y
Zy51az4gd3JvdGU6Cj4KPiA+IE9uIE1vbiwgRGVjIDE4LCAyMDIzIGF0IDA5OjIyOjAzUE0gKzAx
MDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiBPbiBXZWQsIERlYyAxMywgMjAyMyBh
dCAxOjQ54oCvUE0gUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNv
bT4KPiA+ID4gPgo+ID4gPiA+IEFDUEkgaGFzIHR3byBkZXNjcmlwdGlvbnMgb2YgQ1BVcywgb25l
IGluIHRoZSBNQURUL0FQSUMgdGFibGUsIHRoZSBvdGhlcgo+ID4gPiA+IGluIHRoZSBEU0RULiBC
b3RoIGFyZSByZXF1aXJlZC4gKEFDUEkgNi41J3MgOC40ICJEZWNsYXJpbmcgUHJvY2Vzc29ycyIK
PiA+ID4gPiBzYXlzICJFYWNoIHByb2Nlc3NvciBpbiB0aGUgc3lzdGVtIG11c3QgYmUgZGVjbGFy
ZWQgaW4gdGhlIEFDUEkKPiA+ID4gPiBuYW1lc3BhY2UiKS4gSGF2aW5nIHR3byBkZXNjcmlwdGlv
bnMgYWxsb3dzIGZpcm13YXJlIGF1dGhvcnMgdG8gZ2V0Cj4gPiA+ID4gdGhpcyB3cm9uZy4KPiA+
ID4gPgo+ID4gPiA+IElmIENQVXMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgTUFEVC9BUElDLCB0aGV5
IHdpbGwgYmUgYnJvdWdodCBvbmxpbmUKPiA+ID4gPiBlYXJseSBkdXJpbmcgYm9vdC4gT25jZSB0
aGUgcmVnaXN0ZXJfY3B1KCkgY2FsbHMgYXJlIG1vdmVkIHRvIEFDUEksCj4gPiA+ID4gdGhleSB3
aWxsIGJlIGJhc2VkIG9uIHRoZSBEU0RUIGRlc2NyaXB0aW9uIG9mIHRoZSBDUFVzLiBXaGVuIENQ
VXMgYXJlCj4gPiA+ID4gbWlzc2luZyBmcm9tIHRoZSBEU0RUIGRlc2NyaXB0aW9uLCB0aGV5IHdp
bGwgZW5kIHVwIG9ubGluZSwgYnV0IG5vdAo+ID4gPiA+IHJlZ2lzdGVyZWQuCj4gPiA+ID4KPiA+
ID4gPiBBZGQgYSBoZWxwZXIgdGhhdCBydW5zIGFmdGVyIGFjcGlfaW5pdCgpIGhhcyBjb21wbGV0
ZWQgdG8gcmVnaXN0ZXIKPiA+ID4gPiBDUFVzIHRoYXQgYXJlIG9ubGluZSwgYnV0IHdlcmVuJ3Qg
Zm91bmQgaW4gdGhlIERTRFQuIEFueSBDUFUgdGhhdAo+ID4gPiA+IGlzIHJlZ2lzdGVyZWQgYnkg
dGhpcyBjb2RlIHRyaWdnZXJzIGEgZmlybXdhcmUtYnVnIHdhcm5pbmcgYW5kIGtlcm5lbAo+ID4g
PiA+IHRhaW50Lgo+ID4gPiA+Cj4gPiA+ID4gUWVtdSBUQ0cgb25seSBkZXNjcmliZXMgdGhlIGZp
cnN0IENQVSBpbiB0aGUgRFNEVCwgdW5sZXNzIGNwdS1ob3RwbHVnCj4gPiA+ID4gaXMgY29uZmln
dXJlZC4KPiA+ID4KPiA+ID4gU28gd2h5IGlzIHRoaXMgYSBrZXJuZWwgcHJvYmxlbT8KPiA+Cj4g
PiBTbyB3aGF0IGFyZSB5b3UgcHJvcG9zaW5nIHNob3VsZCBiZSB0aGUgYmVoYXZpb3VyIGhlcmU/
IFdoYXQgdGhpcwo+ID4gc3RhdGVtZW50IHNlZW1zIHRvIGJlIHNheWluZyBpcyB0aGF0IFFFTVUg
YXMgaXQgZXhpc3RzIHRvZGF5IG9ubHkKPiA+IGRlc2NyaWJlcyB0aGUgZmlyc3QgQ1BVIGluIERT
RFQuCj4KPiBUaGlzIGNvbmZ1c2VzIG1lIHNvbWV3aGF0LCBiZWNhdXNlIEknbSBmYXIgZnJvbSBz
dXJlIHdoaWNoIG1hY2hpbmVzIHRoaXMKPiBpcyB0cnVlIGZvciBpbiBRRU1VLiAgSSdtIGd1ZXNz
aW5nIGl0J3MgYSBsZWdhY3kgdGhpbmcgd2l0aAo+IHNvbWUgb2xkIGRpc3RybyB2ZXJzaW9uIG9m
IFFFTVUgLSBzbyB3ZSdsbCBoYXZlIHRvIHBhcGVyIG92ZXIgaXQgYW55d2F5Cj4gYnV0IGZvciBj
dXJyZW50IFFFTVUgSSdtIG5vdCBzdXJlIGl0J3MgdHJ1ZS4KPgo+IEhlbHBmdWxseSB0aGVyZSBh
cmUgYSBidW5jaCBvZiBBQ1BJIHRhYmxlIHRlc3RzIHNvIEkndmUgYmVlbiBjaGVja2luZwo+IHRo
cm91Z2ggYWxsIHRoZSBtdWx0aSBDUFUgY2FzZXMuCj4KPiBDUFUgaG90cGx1ZyBub3QgZW5hYmxl
ZC4KPiBwYy9EU0RULmRpbW1weG0gIC0gNHggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDQKPiBw
Yy9EU0RULmFjcGlobWF0IC0gMnggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDIKPiBxMzUvRFNE
VC5hY3BpaG1hdCAtIDJ4IFByb2Nlc3NvciBlbnRyaWVzLiAtc21wIDIKPiB2aXJ0L0RTRFQuYWNw
aWhtYXR2aXJ0IC0gNHggQUNQSTAwMDcgZW50cmllcyAtc21wIDQKPiBxMzUvRFNEVC5hY3BpaG1h
dC1ub2luaXRpYXRvciAtIDQgeCBQcm9jZXNzb3IgKCkgZW50cmllcyAtc21wIDQKPiB2aXJ0L0RT
RFQudG9wb2xvZ3kgLSA4eCBBQ1BJMDAwNyBlbnRyaWVzCj4KPiBJJ3ZlIGFsc28gbG9va2VkIGF0
IHRoZSBjb2RlIGFuZCB3ZSBoYXZlIHZhcmlvdXMgdHlwZXMgb2YKPiBDUFUgaG90cGx1ZyBvbiB4
ODYgYnV0IHRoZXkgYWxsIGJ1aWxkIGFwcHJvcHJpYXRlIG51bWJlcnMgb2YKPiBQcm9jZXNzb3Io
KSBlbnRyaWVzIGluIERTRFQuCj4gQXJtIGxpa2V3aXNlIHNlZW1zIHRvIGJ1aWxkIHRoZSByaWdo
dCBudW1iZXIgb2YgQUNQSTAwMDcgZW50cmllcwo+IChhbmQgZG9lc24ndCB5ZXQgaGF2ZSBDUFUg
SFAgc3VwcG9ydCkuCj4KPiBJZiBhbnlvbmUgY2FuIGFkZCBhIHJlZmVyZW5jZSBvbiB3aHkgdGhp
cyBpcyBuZWVkZWQgdGhhdCB3b3VsZCBiZSB2ZXJ5Cj4gaGVscGZ1bC4KClllcywgaXQgd291bGQu
CgpQZXJzb25hbGx5LCBJIHdvdWxkIHByZWZlciB0byBhc3N1bWUgdGhhdCBpdCBpcyBub3QgbmVj
ZXNzYXJ5IHVudGlsIGl0CnR1cm5zIG91dCB0aGF0ICgxKSB0aGVyZSBpcyBmaXJtd2FyZSB3aXRo
IHRoaXMgaXNzdWUgYWN0dWFsbHkgaW4gdXNlCmFuZCAoMikgdXBkYXRpbmcgdGhlIGZpcm13YXJl
IGluIHF1ZXN0aW9uIHRvIGZvbGxvdyB0aGUgc3BlY2lmaWNhdGlvbgppcyBub3QgcHJhY3RpY2Fs
LgoKT3RoZXJ3aXNlLCB3ZSdkIG1ha2UgaXQgZWFzaWVyIHRvIHNoaXAgbm9uLWNvbXBsaWFudCBm
aXJtd2FyZSBmb3Igbm8KZ29vZCByZWFzb24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
