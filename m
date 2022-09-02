Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A921C6FA81
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJPD9w37TOFrEXrNxjnNyogxARYOSjCSpAGI1bobPQo=; b=jzxG7jlF4V+SOc
	sBwidmFannn8bwcXXH7TvkxBtGIjI2rmbgbwn+294k8MvW2fj77pS0mItita+q7Sv7y5uHVbqaDeG
	TdoZ6UkhDv19qtZI+19rOMBNnXOI9R0MS1UHwu6LZ08UD1xjQKGFqY90pyECC9wf++biOiQhtnKOY
	Nx25aSFBLTkdig6nB8s5F5L6bXcfbL9RWZueSQFKEWBOmZ265dUVnvNYMJdaUdZ+fiZGPVJxyH9KZ
	B/WsTTIt6bsbrRk0Tm7LZhRcUuybrsFBdjNNo9SpmcFqaWYtqwRJvEnModshcMOlDRT6sX9ngqyRC
	fZwtbC1pLbiPIpRxkpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1UG-001T00-3h; Fri, 02 Sep 2022 07:53:12 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1UC-001Su6-Uu
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 07:53:10 +0000
Received: by mail-wm1-f42.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so2835655wmk.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 00:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=N2e0PFxbqLGoRPN9oOly8vEly9sK5Vs0KaPX3Gs9hTQ=;
        b=ZHeXvTsyxnmEICv2xVtYsuVJlzdmOyIhRjeGPUG9Di08YUFCXUEUO6eLW2hgsugFv3
         YbZsN6ctV3HHyMtP7PQMwb22QolNko3CuxI7KbW7a2H1J1TQgiiU2IbBHGl1gRk629dP
         qiBBCDnX0BPD48R2CG2KovRj0HyfIySdIEPLBTiEl9PYrqXVQJzhxGxCg+g8/vTaAN5F
         1vzUuuqcEHvBZJiPyy/1X4awPrOJMRiczxYrlU9Lveb65kah1BTqSAfzQZM7HBZveLqN
         SR6qjFPgrLCdLMhfr6WMBaSX9ZE9uhbRoZZ4BT48u1pVyqOA1EL3fgqSCGx6teTD+J9P
         z+Zg==
X-Gm-Message-State: ACgBeo2pn51lmxx7V5JS/Hd3jnZZM+7B50IxGldnLNJ/rOePZEHoEhnv
	KLBCa/aIlmLxkY/POXM5Fi/CE95fqk4sr/98OPs=
X-Google-Smtp-Source: AA6agR4hAgIt8ZxFVpQWVzMhz7xDf/TNzxxqJleXrjt7XwjQE073z3tvMyfHoPftsjhxaZwVrmG1Lw84QLHN3rcsC14=
X-Received: by 2002:a05:600c:4f45:b0:3a6:9d3c:47c9 with SMTP id
 m5-20020a05600c4f4500b003a69d3c47c9mr1912995wmq.80.1662105185548; Fri, 02 Sep
 2022 00:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <YxEhC/mDW1lFt36J@aurel32.net> <CAOnJCUJ-E-VyQOyh+psbJP4mDO9F+ShvnxDYjoCUUkH4rddJtw@mail.gmail.com>
 <CAOnJCUKDQfCD7mh-RWrq0E8a3Fmp4Xz348THrS+SmJ71GX8=PA@mail.gmail.com>
In-Reply-To: <CAOnJCUKDQfCD7mh-RWrq0E8a3Fmp4Xz348THrS+SmJ71GX8=PA@mail.gmail.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Fri, 2 Sep 2022 09:52:54 +0200
Message-ID: <CA+7wUsww-CGmyNOHJw2bVfcDamq3_XD8mVDJ6pfk0UsxreEjOw@mail.gmail.com>
Subject: Re: rdcycle from userland with RISCV_PMU_SBI=y
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, Aurelien Jarno <aurelien@aurel32.net>, 
	Anup Patel <apatel@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jan Wassenberg <janwas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_005309_011706_AD5C1004 
X-CRM114-Status: GOOD (  32.96  )
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

QXRpc2gsCgpPbiBGcmksIFNlcCAyLCAyMDIyIGF0IDk6MTIgQU0gQXRpc2ggUGF0cmEgPGF0aXNo
cEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gVGh1LCBTZXAgMSwgMjAyMiBhdCAz
OjM0IFBNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+Pgo+Pgo+
Pgo+PiBPbiBUaHUsIFNlcCAxLCAyMDIyIGF0IDI6MTUgUE0gQXVyZWxpZW4gSmFybm8gPGF1cmVs
aWVuQGF1cmVsMzIubmV0PiB3cm90ZToKPj4+Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4gTWF0aGlldSBN
YWxhdGVycmUgcmVwb3J0ZWQgYW4gaXNzdWUgaW4gRGViaWFuIHdpdGggdGhlIGhpZ2h3YXkgcGFj
a2FnZSwKPj4+IHdoaWNoIHVzZXMgdGhlIHJkY3ljbGUgcHNldWRvIGluc3RydWN0aW9uLCBhbmQg
c3RhcnRlZCB0byBmYWlsIHJlY2VudGx5Lgo+Pj4KPj4+IFdlIHRyYWNrZWQgZG93biBhbiBpc3N1
ZSB0byB0aGUgInBlcmYgcGxhdGZvcm0gZHJpdmVyIGJhc2VkIG9uIFNCSSBQTVUKPj4+IGV4dGVu
c2lvbiIgcmVjZW50bHkgYWRkZWQgaW4gTGludXggNS4xOCBbMV0uIE9uIGEgYm9hcmQgd2hpY2gg
cnVucyBhbgo+Pj4gU0JJIHdpdGggdGhlIFBNVSBleHRlbnNpb24sIHRoaXMgY2F1c2VzIHRoZSBy
ZGN5Y2xlIHBzZXVkbyBpbnN0cnVjdGlvbgo+Pj4gdG8gZ2VuZXJhdGUgYSBTSUdJTEwuIFRoaXMg
aXMgYmVjYXVzZSB0aGUgZHJpdmVyIGV4cGxpY2l0bHkgc2V0Cj4+PiBDU1JfU0NPVU5URVJFTiB0
byAweDAyLCBnaXZpbmcgYWNjZXNzIGZyb20gdXNlcmxhbmQgdG8gcmR0aW1lIGJ1dCBub3QKPj4+
IHJkY3ljbGUuCj4+Pgo+Pj4gSSB3b25kZXIgaWYgdGhpcyBjaGFuZ2UgaXMgaW50ZW50aW9uYWws
IGFuZCBpZiB0aGVyZSBpcyBhIHJlYXNvbiB0bwo+Pj4gZm9yYmlkIHVzaW5nIHRoZSByZGN5Y2xl
IHBzZXVkbyBpbnN0cnVjdGlvbiBmcm9tIHVzZXJsYW5kLiBJZiBpdCBpcyB0aGUKPj4+IGNhc2Us
IHRoaXMgc2hvdWxkIHByb2JhYmx5IGJlIGNoYW5nZWQgc28gdGhhdCB0aGUgYmVoYXZpb3VyIGRv
ZXMgbm90Cj4+PiBkaWZmZXIgZnJvbSBib2FyZCB0byBib2FyZCBkZXBlbmRpbmcgb24gdGhlIGF2
YWlsYWJsZSBQTVUgZXh0ZW5zaW9uLgo+Pj4KPj4KPj4gWWVzLiBUaGUgY2hhbmdlIHdhcyBpbnRl
bnRpb25hbCBkdWUgdG8gc2VjdXJpdHkgcmVhc29ucy4gT25lIHJvZ3VlIHByb2Nlc3MgY2FuIGhh
dmUgYWNjZXNzIHRvIGN5Y2xlICYKPj4gaW5zdHJ1Y3Rpb25zIG9mIHRoZSBlbnRpcmUga2VybmVs
IGFsd2F5cyB3aGljaCBjYW4gbGVhZCB0byBzb21lIHNvcnQgb2Ygc2lkZSBjaGFubmVsIGF0dGFj
a3MuCj4+Cj4+IEhvd2V2ZXIsIEkgYWdyZWUgdGhhdCB3ZSBjYW4ndCBicmVhayB1c2Vyc3BhY2Uu
IEkgd2FzIG5vdCBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IHRoZXJlIGFyZSBhbHJlYWR5IHVzZXJz
IG9mIHJkY3ljbGUKPj4gaW4gdGhlIHVzZXJzcGFjZS4gSSB3aWxsIHNlbmQgYSBwYXRjaCB0byBy
ZXN0b3JlIHRoZSBvcmlnaW5hbCBiZWhhdmlvciBieSBlbmFibGluZyBDWSwgSVIgYml0cyBpbiBz
Y291bnRlcmVuLgo+Pgo+Cj4gTWVyZ2luZyB0aGUgdGhyZWFkIGZyb20gc3ctZGV2Ogo+Cj4gIgo+
ID4gPiBPbiBUaHUsIFNlcCAxLCAyMDIyIGF0IDc6MzYgUE0gUGF1bCBXYWxtc2xleSA8cGF1bC53
YWxtc2xleUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBJZiBJIHJlY2FsbCBjb3Jy
ZWN0bHksICBvdGhlciBhcmNoaXRlY3R1cmVzIGRvbid0IGFsbG93IGRpcmVjdCBhY2Nlc3MgdG8g
dGhlaXIgY3ljbGUgY291bnRlcnMgZnJvbSB1c2Vyc3BhY2UgZm9yIHNlY3VyaXR5IHJlYXNvbnMu
ICAgQW55IHJlYXNvbiB3aHkgUklTQy1WIHNob3VsZG4ndCBmb2xsb3cgdGhlIHNhbWUgYXBwcm9h
Y2g/Cj4gPiA+Cj4gPiA+Cj4gPiA+IFRoYXQgd2FzIHRoZSBpbnRlbnRpb24gYmVoaW5kIGRpc2Fi
bGluZyB0aGUgYWNjZXNzIGluIHRoZSBQTVUgZHJpdmVyLiBBdCB0aGF0IHRpbWUsIEkgZGlkbuKA
mXQgZmluZCBhbnkgdXNlcnMuIE9idmlvdXNseSBJIHdhcyB3cm9uZyDwn5iCLiBCdXQgaXMgdGhh
dCBhIHN1ZmZpY2llbnQgcmVhc29uIHRvIGV4aXN0aW5nIGJyZWFrIHVzZXIgc3BhY2UgPwo+ID4K
PiA+IEFzIGFscmVhZHkgcG9pbnRlZCBvdXQsIHdlIGNhbid0IGNvbXByb21pc2Ugc2VjdXJpdHkg
YnkgaGF2aW5nIGFsbAo+ID4gYXBwcyB1bnJlc3RyaWN0ZWQgYWNjZXNzIHRvIHRoZSBjeWNsZSBj
b3VudGVyLiBXZSBhbHJlYWR5IGhhdmUgdGhlCj4gPiBMaW51eCBwZXJmIHN1YnN5c3RlbSBmb3Ig
bWFuYWdpbmcgY291bnRlcnMgc28gYXBwcyBzaG91bGQgYWx3YXlzIHVzZQo+ID4gTGludXggcGVy
ZiBzeXNjYWxscy4KPiA+Cj4gPiBJTU8sIHRoZSBwYWNrYWdlICJoaWdod2F5IiBkaXJlY3RseSBh
Y2Nlc3NpbmcgdGhlIGN5Y2xlIGNvdW50ZXIgc2hvdWxkCj4gPiBiZSBmaXhlZCBpbnN0ZWFkIG9m
IGZpeGluZyB0aGUgTGludXggU0JJIFBNVSBkcml2ZXIuCj4gPgo+ID4gRnVydGhlciBpbnZlc3Rp
Z2F0aW5nIHRoZSBoaWdod2F5IHByb2plY3QKPiA+IChodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xl
L2hpZ2h3YXkpLCBpdCBzZWVtcyB0aGlzIHByb2plY3QgaXMgdXNpbmcKPiA+ICJyZGN5Y2xlIiB0
byB0cmFjayB0aW1lciB0aWNrcyB3aGljaCBpcyB0b3RhbGx5IHdyb25nLiBJbnN0ZWFkIHRoZSB1
c2UKPiA+IG9mICJyZGN5Y2xlIiBzaG91bGQgYmUgcmVwbGFjZWQgd2l0aCAicmR0aW1lIiBpbiB0
aGlzIHByb2plY3QuCj4gPiAoUmVmZXIsIGxpbmUgMTU2IG9mCj4gPiBodHRwczovL2dpdGh1Yi5j
b20vZ29vZ2xlL2hpZ2h3YXkvYmxvYi9tYXN0ZXIvaHd5L25hbm9iZW5jaG1hcmsuY2MpCj4KPiBQ
YXkgYXR0ZW50aW9uIHRoYXQgcXVpdGUgYSBmZXcgcHJvamVjdHMgYXJlIHVzaW5nIHJkY3ljbGUg
aW4gdXNlci1zcGFjZSBhbHJlYWR5Ogo+Cj4gKiBodHRwczovL2NvZGVzZWFyY2guZGViaWFuLm5l
dC9zZWFyY2g/cT0lMjJyZGN5Y2xlKyUyNTAlMjIKPgo+IEFueXdheSBpZiB5b3UgYmVsaWV2ZSBy
ZHRpbWUgaXMgdGhlIHJpZ2h0IGZpeCwgd2UgY2FuIGZpeCBvbmUgcHJvamVjdAo+IGF0IGEgdGlt
ZS4uLiIKPgo+IFRoYW5rcyBmb3Igc2hhcmluZyB0aGUgbGlzdC4gSSB0b29rIGEgcXVpY2sgbG9v
ay4gVGhlIGZpcnN0IGZldyBvbmVzIGF0IGxlYXN0ICAoZmlyZWZveCwgbGx2bSwgY2hyb21lKQo+
IHNlZW1zIHRvIHVzZSByZGN5Y2xlIGZvciB0aW1lc3RhbXAuIEFsbCBvZiB0aGUgcGFja2FnZXMg
dXNlICJyZHRzYyIgZm9yIHg4Ni4KPiBUaGUgZXF1aXZhbGVudCBpbnN0cnVjdGlvbiBpbiBSSVND
LVYgc2hvdWxkIGJlIHJkdGltZSBub3QgcmRjeWNsZS4KCltDQy1pbmcgaGlnaHdheSBtYWluIGRl
dl0KCkhlcmUgaXMgaGlzIGNvbW1lbnQgb24gdGhlIHJkdGltZSBwYXRjaCBwcm9wb3NhbDoKCj4g
Rm9yIGJlbmNobWFya2luZyB3ZSByZWFsbHkgd291bGQgcHJlZmVyIGEgY3ljbGUgY291bnQsIHJh
dGhlciB0aGFuICJyZWFsIHRpbWUgY2xvY2sgdGlja3MiLCBmb3Igd2hpY2ggdGhlIHNwZWMgbWFr
ZXMgbm8gZ3VhcmFudGVlcy4gSWYvd2hlbiB0aG9zZSB0dXJuIG91dCB0byBiZSBtaWxsaXNlY29u
ZC1yZXNvbHV0aW9uLCB0aGV5IGFyZSBub3QgdmVyeSB1c2VmdWwuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
