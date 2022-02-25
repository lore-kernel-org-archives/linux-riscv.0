Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274C3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiGnwASY1rhrp9uJydU1qDmn+GslcJUAfiE9K+QzFLk=; b=uorvskye/iQGuS
	jcckI+EHZq/P4VPsRH7OBAVz9oIsU/zcdtdjtdDPHJzdixedh/i0a6PI3ZVkoM9MEuKQ/HYLaBiPv
	yVitbYcwVnZ2eJxvK2/M59MQ9bu55PcLXfPORiFtufPOzAkx/bNpsKcTUJVvoyfDaBnJfzn02RYsb
	NAng2ANuLD0bRSDLYt495E+YRglS0DYUpJEwLdl/2zS/aW6WhA7j9VgDid3IyJiVSLX9hTd3f9hyK
	DCu0D0sQFpWFu6YvC93dFZDAM5MLiMv6kpBib/9ydFQLkhPn/J957q9DP44IbTls04XVMWZBPun/0
	Pz5ABuZovl/9moHeoLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNbNr-005M0y-Ok; Fri, 25 Feb 2022 14:15:47 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNbNm-005LzP-Ei
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 14:15:44 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1698A3FCA2
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645798541;
 bh=BHkRiN2+iHrNe9IyAVbFKEoIknvTuRWbCd0yRYKLYmo=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=e4P+lAWaA8rtn5Za6kdGg3qydEPb0e6qA6dcBMKRJIbNzMinYoPJKJxZnBYQmBHV8
 /NDB4Sf2dBY59KkS3qyCV4gKe3OEO/DISDAwHIG+yOysIu01mhryxeq5qlG/WJLF1n
 WUR2fzxaAzVl7n+H3FDSC6Pg4TPDjZVGKV7gsO9JCPCsaT0cZsShv8882ciiBXqYRU
 mA7cudtD3PPLCxL53A9g5u1q0uKpssgEua7s1/36Q/hhisLVMdymhf86wWHPTeHrL6
 zYQNqvICSKYWDjZn7lg75566pNnGpDxlhEIfBDnTD+LE7kXfwL2YdX13MZaH6OsoIg
 SSfPS5s5dY6kA==
Received: by mail-ej1-f72.google.com with SMTP id
 o22-20020a1709061d5600b006d1aa593787so2739556ejh.0
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 06:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BHkRiN2+iHrNe9IyAVbFKEoIknvTuRWbCd0yRYKLYmo=;
 b=bEqNJNUfixjrUUEThDKnp2FAdpVwpSBjeorSYkU2m0HnF/X1PC/NxZbQCJvNnbQkHm
 2SBs5Qu0UAkpy15VTTxJruAGAbsEuMdEfMMZ0zbjwADkKfRszEe7UjK5t3o1YY2VlFRa
 vItefVQgsBAUYkyV5o6ByUvTQ9i4Na8Va0n/ABbQUG7p4BaHfO0a6gwrH82dU0kX9oJJ
 hoAQJiQJ7DCTzgN0LWWG2RgkmC65pEV8IbJmMVKbk4SI8OLicdYFpdNP+FPFPYK2O69H
 i/CGIPmIoV/fOspCkLvVxgBucf95SBHhYG71Xel3CipFJPjTYC0z/jqpnwYlZpaGlXIG
 iCFA==
X-Gm-Message-State: AOAM532FpFOGFJW+qEzBlS/z/cuCZdKOe4A+Gmhj8t7BTgaIrXfL20gM
 ryv0EP3oiFu5kWrIsJkJ4cCMHvp2vDwJeZBubCFvUQaYS0zrspGN6dgqqLoOLeQA/rYhDDFTDW3
 PRzD+pYV31W0b/SeU/v3t4pYDxR5z6KLwuv3FjiNJyxeeSw8MLojqU1UnPcsBWw==
X-Received: by 2002:a17:906:d9db:b0:6ce:8bfb:53c9 with SMTP id
 qk27-20020a170906d9db00b006ce8bfb53c9mr6213779ejb.10.1645798540435; 
 Fri, 25 Feb 2022 06:15:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymJbl8jCEi+Pf3yaoLS65OCZyC1VufCGOWEPB5OWn9bDdSBu6B+8GVapqE9Us3WHEqglHOBn9EhFSQ0IofhjI=
X-Received: by 2002:a17:906:d9db:b0:6ce:8bfb:53c9 with SMTP id
 qk27-20020a170906d9db00b006ce8bfb53c9mr6213767ejb.10.1645798540184; Fri, 25
 Feb 2022 06:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
 <CANpmjNN304EZfFN2zobxKGXbXWXAfr92nP1KvtR7j-YqSFShvQ@mail.gmail.com>
 <CA+zEjCtuwnKdi8EuyGWaYNFa7KsYcH9B1mYke6YALo+C1Nq+Dw@mail.gmail.com>
 <CAG_fn=WYmkqPX_qCVmxv1dx87JkXHGF1-a6_8K0jwWuBWzRJfA@mail.gmail.com>
In-Reply-To: <CAG_fn=WYmkqPX_qCVmxv1dx87JkXHGF1-a6_8K0jwWuBWzRJfA@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 25 Feb 2022 15:15:29 +0100
Message-ID: <CA+zEjCsQPVYSV7CdhKnvjujXkMXuRQd=VPok1awb20xifYmidw@mail.gmail.com>
Subject: Re: [PATCH -fixes v3 0/6] Fixes KASAN and other along the way
To: Alexander Potapenko <glider@google.com>
Cc: Marco Elver <elver@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Aleksandr Nogikh <nogikh@google.com>,
 Nick Hu <nickhu@andestech.com>, 
 linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_061542_741871_A6A31384 
X-CRM114-Status: GOOD (  27.73  )
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

T24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgMzoxMCBQTSBBbGV4YW5kZXIgUG90YXBlbmtvIDxnbGlk
ZXJAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgMzow
NCBQTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhhbmRyZS5naGl0aUBjYW5vbmljYWwuY29tPiB3cm90
ZToKPj4KPj4gT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgMjowNiBQTSBNYXJjbyBFbHZlciA8ZWx2
ZXJAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBPbiBGcmksIDI1IEZlYiAyMDIyIGF0IDEz
OjQwLCBBbGV4YW5kcmUgR2hpdGkKPj4gPiA8YWxleGFuZHJlLmdoaXRpQGNhbm9uaWNhbC5jb20+
IHdyb3RlOgo+PiA+ID4KPj4gPiA+IEFzIHJlcG9ydGVkIGJ5IEFsZWtzYW5kciwgc3l6Ym90IHJp
c2N2IGlzIGJyb2tlbiBzaW5jZSBjb21taXQKPj4gPiA+IDU0YzU2MzlkOGY1MCAoInJpc2N2OiBG
aXggYXNhbi1zdGFjayBjbGFuZyBidWlsZCIpLiBUaGlzIGNvbW1pdCBhY3R1YWxseQo+PiA+ID4g
YnJlYWtzIEtBU0FOX0lOTElORSB3aGljaCBpcyBub3QgZml4ZWQgaW4gdGhpcyBzZXJpZXMsIHRo
YXQgd2lsbCBjb21lIGxhdGVyCj4+ID4gPiB3aGVuIGZvdW5kLgo+PiA+ID4KPj4gPiA+IE5ldmVy
dGhlbGVzcywgdGhpcyBzZXJpZXMgZml4ZXMgc21hbGwgdGhpbmdzIHRoYXQgbWFkZSB0aGUgc3l6
Ym90Cj4+ID4gPiBjb25maWd1cmF0aW9uICsgS0FTQU5fT1VUTElORSBmYWlsIHRvIGJvb3QuCj4+
ID4gPgo+PiA+ID4gTm90ZSB0aGF0IGV2ZW4gdGhvdWdoIHRoZSBjb25maWcgYXQgWzFdIGJvb3Rz
IGZpbmUgd2l0aCB0aGlzIHNlcmllcywgSQo+PiA+ID4gd2FzIG5vdCBhYmxlIHRvIGJvb3QgdGhl
IHNtYWxsIGNvbmZpZyBhdCBbMl0gd2hpY2ggZmFpbHMgYmVjYXVzZQo+PiA+ID4ga2FzYW5fcG9p
c29uIHJlY2VpdmVzIGEgcmVhbGx5IHdlaXJkIGFkZHJlc3MgMHg0MDc1NzA2MzAxMDAwMDAwICht
YXliZSBhCj4+ID4gPiBrYXNhbiBwZXJzb24gY291bGQgcHJvdmlkZSBzb21lIGhpbnQgYWJvdXQg
d2hhdCBoYXBwZW5zIGJlbG93IGluCj4+ID4gPiBkb19jdG9ycyAtPiBfX2FzYW5fcmVnaXN0ZXJf
Z2xvYmFscyk6Cj4+ID4KPj4gPiBhc2FuX3JlZ2lzdGVyX2dsb2JhbHMgaXMgcmVzcG9uc2libGUg
Zm9yIHBvaXNvbmluZyByZWR6b25lcyBhcm91bmQKPj4gPiBnbG9iYWxzLiBBcyBoaW50ZWQgYnkg
J2RvX2N0b3JzJywgaXQgY2FsbHMgY29uc3RydWN0b3JzLCBhbmQgaW4gdGhpcwo+PiA+IGNhc2Ug
YSBjb21waWxlci1nZW5lcmF0ZWQgY29uc3RydWN0b3IgdGhhdCBjYWxscwo+PiA+IF9fYXNhbl9y
ZWdpc3Rlcl9nbG9iYWxzIHdpdGggbWV0YWRhdGEgZ2VuZXJhdGVkIGJ5IHRoZSBjb21waWxlci4g
VGhhdAo+PiA+IG1ldGFkYXRhIGNvbnRhaW5zIGluZm9ybWF0aW9uIGFib3V0IGdsb2JhbCB2YXJp
YWJsZXMuIE5vdGUsIHRoZXNlCj4+ID4gY29uc3RydWN0b3JzIGFyZSBjYWxsZWQgb24gaW5pdGlh
bCBib290LCBidXQgYWxzbyBldmVyeSB0aW1lIGEga2VybmVsCj4+ID4gbW9kdWxlICh0aGF0IGhh
cyBnbG9iYWxzKSBpcyBsb2FkZWQuCj4+ID4KPj4gPiBJdCBtYXkgYWxzbyBiZSBhIHRvb2xjaGFp
biBpc3N1ZSwgYnV0IGl0J3MgaGFyZCB0byBzYXkuIElmIHlvdSdyZQo+PiA+IHVzaW5nIEdDQyB0
byB0ZXN0LCB0cnkgQ2xhbmcgKDExIG9yIGxhdGVyKSwgYW5kIHZpY2UtdmVyc2EuCj4+Cj4+IEkg
dHJpZWQgMyBkaWZmZXJlbnQgZ2NjIHRvb2xjaGFpbnMgYWxyZWFkeSwgYnV0IHRoYXQgZGlkIG5v
dCBmaXggdGhlCj4+IGlzc3VlLiBUaGUgb25seSB0aGluZyB0aGF0IHdvcmtlZCB3YXMgc2V0dGlu
ZyBhc2FuLWdsb2JhbHM9MCBpbgo+PiBzY3JpcHRzL01ha2VmaWxlLmthc2FuLCBidXQgb2ssIHRo
YXQncyBub3QgYSBmaXguCj4+IEkgdHJpZWQgdG8gYmlzZWN0IHRoaXMgaXNzdWUgYnV0IG91ciBr
YXNhbiBpbXBsZW1lbnRhdGlvbiBoYXMgYmVlbgo+PiBicm9rZW4gcXVpdGUgYSBmZXcgdGltZXMs
IHNvIGl0IGZhaWxlZC4KPj4KPj4gSSBrZWVwIGRpZ2dpbmchCj4+Cj4KPiBUaGUgcHJvYmxlbSBk
b2VzIG5vdCByZXByb2R1Y2UgZm9yIG1lIHdpdGggR0NDIDExLjIuMDoga2VybmVscyBidWlsdCB3
aXRoIGJvdGggWzFdIGFuZCBbMl0gYXJlIGJvb3RhYmxlLgoKRG8geW91IG1lYW4geW91IHJlYWNo
IHVzZXJzcGFjZT8gQmVjYXVzZSBteSBpbWFnZSBib290cyB0b28sIGFuZCBmYWlscwphdCBzb21l
IHBvaW50OgoKWyAgICAwLjAwMDE1MF0gc2NoZWRfY2xvY2s6IDY0IGJpdHMgYXQgMTBNSHosIHJl
c29sdXRpb24gMTAwbnMsIHdyYXBzCmV2ZXJ5IDQzOTgwNDY1MTExMDBucwpbICAgIDAuMDE1ODQ3
XSBDb25zb2xlOiBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDI1ClsgICAgMC4wMTY4OTldIHByaW50
azogY29uc29sZSBbdHR5MF0gZW5hYmxlZApbICAgIDAuMDIwMzI2XSBwcmludGs6IGJvb3Rjb25z
b2xlIFtuczE2NTUwYTBdIGRpc2FibGVkCgpJdCB0cmFwcyBoZXJlLgoKPiBGV0lXIGhlcmUgaXMg
aG93IEkgcnVuIHRoZW06Cj4KPiBxZW11LXN5c3RlbS1yaXNjdjY0IC1tIDIwNDggLXNtcCAxIC1u
b2dyYXBoaWMgLW5vLXJlYm9vdCBcCj4gICAtZGV2aWNlIHZpcnRpby1ybmctcGNpIC1tYWNoaW5l
IHZpcnQgLWRldmljZSBcCj4gICB2aXJ0aW8tbmV0LXBjaSxuZXRkZXY9bmV0MCAtbmV0ZGV2IFwK
PiAgIHVzZXIsaWQ9bmV0MCxyZXN0cmljdD1vbixob3N0ZndkPXRjcDoxMjcuMC4wLjE6MTI1Mjkt
OjIyIC1kZXZpY2UgXAo+ICAgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1kcml2ZSBcCj4g
ICBmaWxlPSR7SU1BR0V9LGlmPW5vbmUsZm9ybWF0PXJhdyxpZD1oZDAgLXNuYXBzaG90IFwKPiAg
IC1rZXJuZWwgJHtLRVJORUxfU1JDX0RJUn0vYXJjaC9yaXNjdi9ib290L0ltYWdlIC1hcHBlbmQg
InJvb3Q9L2Rldi92ZGEKPiAgIGNvbnNvbGU9dHR5UzAgZWFybHlwcmludGs9c2VyaWFsIgo+Cj4K
Pj4KPj4gVGhhbmtzIGZvciB0aGUgdGlwcywKPj4KPj4gQWxleAo+Cj4KPgo+IC0tCj4gQWxleGFu
ZGVyIFBvdGFwZW5rbwo+IFNvZnR3YXJlIEVuZ2luZWVyCj4KPiBHb29nbGUgR2VybWFueSBHbWJI
Cj4gRXJpa2EtTWFubi1TdHJhw59lLCAzMwo+IDgwNjM2IE3DvG5jaGVuCj4KPiBHZXNjaMOkZnRz
ZsO8aHJlcjogUGF1bCBNYW5pY2xlLCBMaWFuYSBTZWJhc3RpYW4KPiBSZWdpc3RlcmdlcmljaHQg
dW5kIC1udW1tZXI6IEhhbWJ1cmcsIEhSQiA4Njg5MQo+IFNpdHogZGVyIEdlc2VsbHNjaGFmdDog
SGFtYnVyZwo+Cj4gRGllc2UgRS1NYWlsIGlzdCB2ZXJ0cmF1bGljaC4gRmFsbHMgU2llIGRpZXNl
IGbDpGxzY2hsaWNoZXJ3ZWlzZSBlcmhhbHRlbiBoYWJlbiBzb2xsdGVuLCBsZWl0ZW4gU2llIGRp
ZXNlIGJpdHRlIG5pY2h0IGFuIGplbWFuZCBhbmRlcmVzIHdlaXRlciwgbMO2c2NoZW4gU2llIGFs
bGUgS29waWVuIHVuZCBBbmjDpG5nZSBkYXZvbiB1bmQgbGFzc2VuIFNpZSBtaWNoIGJpdHRlIHdp
c3NlbiwgZGFzcyBkaWUgRS1NYWlsIGFuIGRpZSBmYWxzY2hlIFBlcnNvbiBnZXNlbmRldCB3dXJk
ZS4KPgo+Cj4KPiBUaGlzIGUtbWFpbCBpcyBjb25maWRlbnRpYWwuIElmIHlvdSByZWNlaXZlZCB0
aGlzIGNvbW11bmljYXRpb24gYnkgbWlzdGFrZSwgcGxlYXNlIGRvbid0IGZvcndhcmQgaXQgdG8g
YW55b25lIGVsc2UsIHBsZWFzZSBlcmFzZSBhbGwgY29waWVzIGFuZCBhdHRhY2htZW50cywgYW5k
IHBsZWFzZSBsZXQgbWUga25vdyB0aGF0IGl0IGhhcyBnb25lIHRvIHRoZSB3cm9uZyBwZXJzb24u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
