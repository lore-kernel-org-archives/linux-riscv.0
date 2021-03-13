Return-Path: <SRS0=xwO/=IL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24766C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 08:24:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6918864EF6
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 08:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6918864EF6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pLAHds5bFVNlXdhW/Zya1cAJfemgd6kq9sm7BZLoAWM=; b=Ls6laemnf0BLRrC6V+SL42Nnh
	w+HMHb+5FPgTlkhlH7UO4vKOrxjKb1sbrHl7+qU9gpROleT438oFn3QZCmG3Za+jLuyIgUp4OojPg
	cRpmYUJC3Dfm6i5NAGYqpQaBBUCHA4JyOC6Lqgo/+hJo50YBRuFH7Vdhgm3WO+iTSzXGZA18Dnz5K
	Fsc5KIv7ZB4os+WZTGlBpjCBckjx5xRVyyiQOgkxKKT2QlD08yPT6eRjrioS0xI2hH91fSWXfzeJa
	1XN79SE5rj54apWh2I7XMGn6qW/c5lQMGGcWy5fjIBvjl43m3ZEMe+3XRXgCe1nEFDs0l52/6IHXs
	o5DvWIIKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKzZF-00D0WQ-NZ; Sat, 13 Mar 2021 08:24:13 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKzYt-00D0Tx-2l
 for linux-riscv@lists.infradead.org; Sat, 13 Mar 2021 08:24:01 +0000
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 24807200003;
 Sat, 13 Mar 2021 08:23:44 +0000 (UTC)
Subject: Re: [PATCH 2/3] Documentation: riscv: Add documentation that
 describes the VM layout
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Hildenbrand <david@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20210225080453.1314-1-alex@ghiti.fr>
 <20210225080453.1314-3-alex@ghiti.fr>
 <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
 <7d9036d9-488b-47cc-4673-1b10c11baad0@ghiti.fr>
 <CAK8P3a3mVDwJG6k7PZEKkteszujP06cJf8Zqhq43F0rNsU=h4g@mail.gmail.com>
 <236a9788-8093-9876-a024-b0ad0d672c72@ghiti.fr>
 <CAK8P3a1+vSoEBqHPzj9S07B7h-Xuwvccpsh1pnn+1xJmS3UdbA@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <50109729-9a86-6b49-b608-dd5c8eb2d88e@ghiti.fr>
Date: Sat, 13 Mar 2021 03:23:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1+vSoEBqHPzj9S07B7h-Xuwvccpsh1pnn+1xJmS3UdbA@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_082359_701419_556F180A 
X-CRM114-Status: GOOD (  26.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCkxlIDMvMTEvMjEgw6AgMzo0MiBBTSwgQXJuZCBCZXJnbWFubiBhIMOpY3JpdMKg
Ogo+IE9uIFdlZCwgTWFyIDEwLCAyMDIxIGF0IDg6MTIgUE0gQWxleCBHaGl0aSA8YWxleEBnaGl0
aS5mcj4gd3JvdGU6Cj4+IExlIDMvMTAvMjEgw6AgNjo0MiBBTSwgQXJuZCBCZXJnbWFubiBhIMOp
Y3JpdCA6Cj4+PiBPbiBUaHUsIEZlYiAyNSwgMjAyMSBhdCAxMjo1NiBQTSBBbGV4IEdoaXRpIDxh
bGV4QGdoaXRpLmZyPiB3cm90ZToKPj4+Pgo+Pj4+IExlIDIvMjUvMjEgw6AgNTozNCBBTSwgRGF2
aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXQgOgo+Pj4+PiAgICAgICAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgfCAgICAgICAgIHw+ICsKPj4+Pj4gZmZmZmZmYzAw
MDAwMDAwMCB8IC0yNTYgICAgR0IgfCBmZmZmZmZjN2ZmZmZmZmZmIHwgICAzMiBHQiB8IGthc2Fu
Cj4+Pj4+PiArICAgZmZmZmZmY2VmZWUwMDAwMCB8IC0xOTYgICAgR0IgfCBmZmZmZmZjZWZlZmZm
ZmZmIHwgICAgMiBNQiB8IGZpeG1hcAo+Pj4+Pj4gKyAgIGZmZmZmZmNlZmYwMDAwMDAgfCAtMTk2
ICAgIEdCIHwgZmZmZmZmY2VmZmZmZmZmZiB8ICAgMTYgTUIgfCBQQ0kgaW8KPj4+Pj4+ICsgICBm
ZmZmZmZjZjAwMDAwMDAwIHwgLTE5NiAgICBHQiB8IGZmZmZmZmNmZmZmZmZmZmYgfCAgICA0IEdC
IHwgdm1lbW1hcAo+Pj4+Pj4gKyAgIGZmZmZmZmQwMDAwMDAwMDAgfCAtMTkyICAgIEdCIHwgZmZm
ZmZmZGZmZmZmZmZmZiB8ICAgNjQgR0IgfAo+Pj4+Pj4gdm1hbGxvYy9pb3JlbWFwIHNwYWNlCj4+
Pj4+PiArICAgZmZmZmZmZTAwMDAwMDAwMCB8IC0xMjggICAgR0IgfCBmZmZmZmZmZjdmZmZmZmZm
IHwgIDEyNiBHQiB8Cj4+Pj4+PiBkaXJlY3QgbWFwcGluZyBvZiBhbGwgcGh5c2ljYWwgbWVtb3J5
Cj4+Pj4+Cj4+Pj4+IF4gU28geW91IGNvdWxkIG5ldmVyIGV2ZXIgaGF2ZSBtb3JlIHRoYW4gMTI2
IEdCLCBjb3JyZWN0Pwo+Pj4+Pgo+Pj4+PiBJIGFzc3VtZSB0aGF0J3Mgbm90aGluZyBuZXcuCj4+
Pj4+Cj4+Pj4KPj4+PiBCZWZvcmUgdGhpcyBwYXRjaCwgdGhlIGxpbWl0IHdhcyAxMjhHQiwgc28g
aW4gbXkgc2Vuc2UsIHRoZXJlIGlzIG5vdGhpbmcKPj4+PiBuZXcuIElmIGV2ZXIgd2Ugd2FudCB0
byBpbmNyZWFzZSB0aGF0IGxpbWl0LCB3ZSdsbCBqdXN0IGhhdmUgdG8gbG93ZXIKPj4+PiBQQUdF
X09GRlNFVCwgdGhlcmUgaXMgc3RpbGwgc29tZSB1bnVzZWQgdmlydHVhbCBhZGRyZXNzZXMgYWZ0
ZXIga2FzYW4KPj4+PiBmb3IgZXhhbXBsZS4KPj4+Cj4+PiBMaW51cyBXYWxsZWlqIGlzIGxvb2tp
bmcgaW50byBjaGFuZ2luZyB0aGUgYXJtMzIgY29kZSB0byBoYXZlIHRoZSBrZXJuZWwKPj4+IGRp
cmVjdCBtYXAgaW5zaWRlIG9mIHRoZSB2bWFsbG9jIGFyZWEsIHdoaWNoIHdvdWxkIGJlIGFub3Ro
ZXIgcGxhY2UKPj4+IHRoYXQgeW91IGNvdWxkIHVzZSBoZXJlLiBJdCB3b3VsZCBiZSBuaWNlIHRv
IG5vdCBoYXZlIHRvbyBtYW55IGRpZmZlcmVudAo+Pj4gd2F5cyBvZiBkb2luZyB0aGlzLCBidXQg
SSdtIG5vdCBzdXJlIGhvdyBoYXJkIGl0IHdvdWxkIGJlIHRvIHJld29yayB5b3VyCj4+PiBjb2Rl
LCBvciBpZiB0aGVyZSBhcmUgYW55IGRvd25zaWRlcyBvZiBkb2luZyB0aGlzLgo+Pgo+PiBUaGlz
IHdhcyB3aGF0IG15IHByZXZpb3VzIHZlcnNpb24gZGlkOiBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAyMC82LzcvMjguCj4+Cj4+IFRoaXMgYXBwcm9hY2ggd2FzIG5vdCB3ZWxjb21lZCB2ZXJ5IHdl
bGwgYW5kIGl0IGZpeGVkIG9ubHkgdGhlIHByb2JsZW0KPj4gb2YgdGhlIGltcGxlbWVudGF0aW9u
IG9mIHJlbG9jYXRhYmxlIGtlcm5lbC4gVGhlIHNlY29uZCBpc3N1ZSBJJ20gdHJ5aW5nCj4+IHRv
IHJlc29sdmUgaGVyZSBpcyB0byBzdXBwb3J0IGJvdGggMyBhbmQgNCBsZXZlbCBwYWdlIHRhYmxl
cyB1c2luZyB0aGUKPj4gc2FtZSBrZXJuZWwgd2l0aG91dCBiZWluZyByZWxvY2F0YWJsZSAod2hp
Y2ggd291bGQgaW50cm9kdWNlIHBlcmZvcm1hbmNlCj4+IHBlbmFsdHkpLiBJIGNhbid0IGRvIGl0
IHdoZW4gdGhlIGtlcm5lbCBtYXBwaW5nIGlzIGluIHRoZSB2bWFsbG9jIHJlZ2lvbgo+PiBzaW5j
ZSB2bWFsbG9jIHJlZ2lvbiByZWxpZXMgb24gUEFHRV9PRkZTRVQgd2hpY2ggaXMgZGlmZmVyZW50
IG9uIGJvdGggMwo+PiBhbmQgNCBsZXZlbCBwYWdlIHRhYmxlIGFuZCB0aGF0IHdvdWxkIHRoZW4g
cmVxdWlyZSB0aGUga2VybmVsIHRvIGJlCj4+IHJlbG9jYXRhYmxlLgo+IAo+IE9rLCBJIHNlZS4K
PiAKPiBJIHN1cHBvc2UgaXQgbWlnaHQgd29yayBpZiB5b3UgbW92ZWQgdGhlIGRpcmVjdC1tYXAg
dG8gdGhlIGxvd2VzdAo+IGFkZHJlc3MgYW5kIHRoZSB2bWFsbG9jIGFyZWEgKGluY29ycG9yYXRp
bmcgdGhlIGtlcm5lbCBtYXBwaW5nLAo+IG1vZHVsZXMsIHBpbywgYW5kIGZpeG1hcCBhdCBmaXhl
ZCBhZGRyZXNzZXMpIHRvIHRoZSB2ZXJ5IHRvcCBvZiB0aGUKPiBhZGRyZXNzIHNwYWNlLCBidXQg
eW91IHByb2JhYmx5IGFscmVhZHkgY29uc2lkZXJlZCBhbmQgcmVqZWN0ZWQKPiB0aGF0IGZvciBv
dGhlciByZWFzb25zLgo+IAoKWWVzIEkgY29uc2lkZXJlZCBpdC4uLndoZW4geW91IHJlLXByb3Bv
c2VkIGl0IDopIEknbSBub3Qgb3Bwb3NlZCB0byB5b3VyIApzb2x1dGlvbiBpbiB0aGUgdm1hbGxv
YyByZWdpb24gYnV0IEkgY2FuJ3QgZmluZCBhbnkgYWR2YW50YWdlIG92ZXIgdGhlIApjdXJyZW50
IHNvbHV0aW9uLCBhcmUgdGhlcmUgPyBUaGF0IHdvdWxkIGhhcm1vbml6ZSB3aXRoIExpbnVzJ3Mg
d29yaywgCmJ1dCB0aGVuIHdlJ2QgYmUgcXVpdGUgZGlmZmVyZW50IGZyb20geDg2IGFkZHJlc3Mg
c3BhY2UuCgpBbmQgYnkgdGhlIHdheSwgdGhhbmtzIGZvciBoYXZpbmcgc3VnZ2VzdGVkIHRoZSBj
dXJyZW50IHNvbHV0aW9uIGluIGEgCnByZXZpb3VzIGNvbnZlcnNhdGlvbiA6KQoKVGhhbmtzIGFn
YWluLAoKQWxleAoKPiAgICAgICAgICAgQXJuZAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
