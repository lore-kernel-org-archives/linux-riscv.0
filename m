Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24341CD5BC8
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfTMP+wm7iqMj+3VelJoSuaWeJZUHnGKPg3AaXl6jlQ=; b=lllM5LJ1np27aF
	JFgJGEHqr9QoAkNnTzk7wBvzlW6dGI2TcxosZlwQ2dbUKTZMbGIlMdY9YK3IUUoHYUmQr/BfrdCc5
	cBIoSoqiVuIVee5c9pd5MbXIo8xhfJDkGFeYryRVslhgL3bUDJHdvW3ulIKuPUv0Cf7eguv/gjIxd
	YO1KO+Pq60okCbaTw3KVTkYb+B/a3MhYD+m32jMIAZxxl3Gwa99wvH+F0bIbzsU2TrMfq3yccaZ0b
	Z9FYN9JPnUP1O5WihNQwhxM4CTFpaD3qQiWQsdGhRwQzW04XUuEuEDk7DfTIAUCp2a5VGzJ3HdAVD
	qfj1vBO1umymO5LzX3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoet-00000001bWU-1XFV;
	Tue, 26 May 2026 10:05:11 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoeq-00000001bVZ-3lfC
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 10:05:10 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-651c5d525f6so10341986d50.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 03:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789907; cv=none;
        d=google.com; s=arc-20240605;
        b=Itc60GXhm+kz98EBCsijAI347EOBbSdBMqJWzyHfE+KUNlb8XIcnDaorav8iEDSvAh
         wxPBwKMQSKQarmf89qcVJFI0PQbA+RkzNW9CD3r1/4agrlKVDqu5UOLS/c9on/pPEokQ
         O187/Dh/fuBIhtV+bf8OUgY9JkWUTzuuCn/d/REozijz3T/qFdFTmQDsLb/yauocJ9EH
         lXeh+VWsQU645bFPylf73f8cTjlVJbtw+SDHoYkU10gWrh6uRDOOIjdkFvLgRIGRa9qj
         57WgEbLpfujprbq15KZh21ejNE7vk43qjEApUUdu5IFSnlbzytLDneIFYszQrAOqwV9y
         tjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        fh=rLtL7jT9AXxdnjys02a4mEoCjap0+DgToB19vB5cTas=;
        b=Vx37SjG+xG90XAEpuF7pTtUyxN/RXXLJdk+EaLl/0wsrF39EggGMyIQSSrTjsLJ7wV
         0Hsn3jri04jP6vJs/EjnESAuXqCScXVusdf0q5MsL6Gk7EhhdcBQ6jynzB4O6J+ge3SZ
         UV/oFTuu3w1xRZUYegRSuHsNbmJNB5X3fIRzMzbrRHHqxf6zLM95pWKVLIc61BzE/g5f
         IQ4qAux+LcayNJWsLeMItQNchVe4XMSk0YiqeW4l8RJqQpRQbbpgq4ZvQl0M5LbOZYBz
         xFXUFXPvJlhjSAKAmuMB9pwqv8wCsSpvBZKsxsSagtXm7dRqZFLlPsAkqhpbVDRft+MM
         oNsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789907; x=1780394707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        b=RNzUxW6ARI0/kcD3VXfNkS3U4GxY+bGkavMTxyHd+ZGdQBpzJh90rtG6r0S8RN1y1B
         Sh0GFR+YS6AVmsCDAwuBKMwf34k/wApoS25j1s6vbJvr5LDFgpnGMMyGOqZpgTXaCVob
         RTkJzhpOMqG536XKLoiBOgCWhJ8xO9JROCkn5NJk3XrnpJE45evEdX4C8+T2z+QIm4Ro
         OWHwe1rm9Tx6vVOHgD/aUHB3JJ22nbrEWWlT9Sj9X1AR+rdpgjl8g+ixnH9BsUhCqBVH
         h7whI11ggiVrcRxd4uRW6uBTabq3baKM+SCwLOu/etlDAStKsv5c43mJYA4Mc1khLQ/h
         RJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789907; x=1780394707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        b=ZkqX1b3D6iMYdpkmf+8c1jUTMaEbNk3D40n9BMwPqcMsiAEA0SNgQtcy51TRn+IX9J
         eaKLf6zqQO2pNMq6fuiPrIy6s/jTbAYABOqgOAXRt+G1DrQJG5OWxTHMOGPuQ8wpyWtY
         SfKrqd2ci4ij31pclpPZHHEilARcy1ghGwe7VkOFvIf7jzCXjJvTtkxPEuTKKznU4yN8
         xxJN2MAGJZ5pksZGjTOAxWRq4CeXqP3tC7rExe0EsGMKRg218G8xC5CqJbKC7c3Ag5cr
         7eQRnsvIK8PzGklhK0ZZs0JxeMImys4j6utVIhyKQexRxb5liwsFqOhAwafdCc8S0bi/
         /EDw==
X-Forwarded-Encrypted: i=1; AFNElJ/OihNKd+bczD0zAlALfCQFnCHTopL5QyCyHtAfFKjuqznm4Maj7G7eaRxfQxHy2Iq3vrKewLM+1sB53w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOjuHGFyyiqvkyP5Y1vZt1boOWK/ullrMDHJrwET5/Jrvoy9SW
	p0VZ6XfE10225eY3+f5z2XfuA2W8lcFDQyRKqg6jbQxEujEzgiMLfj7H9i9kdvF9E2NV/iqD4gX
	TjZQdp75D6Cd/WP947B/lhoCPOMY4h0w=
X-Gm-Gg: Acq92OFN7u3gc6qFCxGNB3+aehChjjZPohPvkZhVhKMrd/Smmxkua49JzISxRnLWktS
	HF+xl8JWmfqUvXAG0qdF8ln8U+HVsHhjo/FTqSgFhNdNx0LhKXkWHkBqAAsmgvJTu9dJ033c7Is
	4mYTdkMLfNKvkCAxV9Q7qA5WIABtk+ZfyCCOw71KsPDE3HlPrrAqNO50PIGw1TgDyXwlrE5Kw2M
	+7coDXmDE0jX7ehne3wpbeAYvROWz7gHD1XFiVMaq8NM0jeqL/kKvsWP5keix968QdTGZy9GnDc
	bmBtMyU=
X-Received: by 2002:a05:690e:25d0:b0:65c:747b:485b with SMTP id
 956f58d0204a3-65ec99ce8eamr13546771d50.58.1779789907432; Tue, 26 May 2026
 03:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4> <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com> <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
 <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com> <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
In-Reply-To: <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 26 May 2026 12:04:56 +0200
X-Gm-Features: AVHnY4IxXGGNE6MCQzRPM_4hQIgOZYw7rJR2PEvw9EaDz3r-wxcgt_U1xXrcwuc
Message-ID: <CABdCQ=NOvzmzqS5WJG0CQ35Nd+Mh-Px5Z7ELqC_eDSqob0Jbdg@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Andre Heider <a.heider@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_030508_951121_BA295DBA 
X-CRM114-Status: GOOD (  23.96  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Troy Mitchell <troy.mitchell@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Javier Martinez Canillas <javierm@redhat.com>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Margherita Milani <margherita.milani@amarulasolutions.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, Vincent Legoll <legoll@online.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RWwgbHVuLCAyNSBtYXkgMjAyNiBhIGxhcyAxODo0NSwgQW5kcmUgSGVpZGVyICg8YS5oZWlkZXJA
Z21haWwuY29tPikgZXNjcmliacOzOgo+Cj4gSGkgSWtlciwKPgo+IE9uIDI1LjA1LjI2IDExOjM2
IEFNLCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBTb3JyeSwgSSd2ZSBiZWVu
IG9uIHZhY2F0aW9uIGFuZCBJIGhhdmVuJ3QgY2hlY2tlZCBteSBlbWFpbHMuCj4gPgo+ID4gRWwg
bWnDqSwgMjAgbWF5IDIwMjYgYSBsYXMgMTM6MTEsIFRyZXZvciBHYW1ibGluCj4gPiAoPHRnYW1i
bGluQGJheWxpYnJlLmNvbT4pIGVzY3JpYmnDszoKPiA+Pgo+ID4+Cj4gPj4gT24gMjAyNi0wNS0y
MCAwMzo1MywgQW5kcmUgSGVpZGVyIHdyb3RlOgo+ID4+PiBIaSBUcmV2b3IsCj4gPj4+Cj4gPj4+
IE9uIDE2LjA1LjI2IDI6MzUgUE0sIFRyZXZvciBHYW1ibGluIHdyb3RlOgo+ID4+Pj4KPiA+Pj4+
IE9uIDIwMjYtMDUtMTUgMjI6NTcsIFlpeHVuIExhbiB3cm90ZToKPiA+Pj4+PiBPbiBGcmksIDE1
IE1heSAyMDI2IDEyOjQ4OjU4ICswMjAwLCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4gPj4+Pj4+IFRo
aXMgc2VyaWVzIGVuYWJsZXMgY29tcGxldGUgU0QgY2FyZCBzdXBwb3J0IGZvciB0aGUgU3BhY2Vt
aXQgSzEtYmFzZWQKPiA+Pj4+Pj4gT3JhbmdlUGkgUlYyIGJvYXJkLCBpbmNsdWRpbmcgVUhTIChV
bHRyYSBIaWdoIFNwZWVkKSBtb2RlcyBmb3IKPiA+Pj4+Pj4gaGlnaC1wZXJmb3JtYW5jZSBTRCBj
YXJkIG9wZXJhdGlvbi4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gQmFja2dyb3VuZAo+ID4+Pj4+Pgo+ID4+
Pj4+PiBUaGUgU3BhY2VtaXQgSzEgU29DIGluY2x1ZGVzIGFuIFNESENJIGNvbnRyb2xsZXIgY2Fw
YWJsZSBvZiBzdXBwb3J0aW5nCj4gPj4+Pj4+IFNEIGNhcmRzIHVwIHRvIFVIUy1JIHNwZWVkcyAo
U0RSMTA0IGF0IDIwOE1IeikuIEhvd2V2ZXIsIG1haW5saW5lCj4gPj4+Pj4+IGN1cnJlbnRseSBs
YWNrcyBiYXNpYyBTRCBjb250cm9sbGVyIGNvbmZpZ3VyYXRpb24sIFNESENJIGRyaXZlcgo+ID4+
Pj4+PiBlbmhhbmNlbWVudHMgZm9yIHZvbHRhZ2Ugc3dpdGNoaW5nIGFuZCB0dW5pbmcsIGFuZCBw
b3dlciBtYW5hZ2VtZW50Cj4gPj4+Pj4+IGluZnJhc3RydWN0dXJlLgo+ID4+Pj4+Pgo+ID4+Pj4+
PiBbLi4uXQo+ID4+Pj4+IEhpIElrZXIsCj4gPj4+Pj4gSSd2ZSBwaWNrZWQgcGF0Y2ggMS0zLCBm
b3IgWzQvNF0gSSB0aGluayBpdCBzaG91bGQgYmUgbWVyZ2VkIGFmdGVyCj4gPj4+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTEzMDcxOTU4LjI5NTc0LTEtYS5oZWlkZXJAZ21h
aWwuY29tLwo+ID4+Pj4KPiA+Pj4+IEhpIFlpeHVuLAo+ID4+Pj4KPiA+Pj4+IFRoYXQgbWFrZXMg
c2Vuc2UuIEluIHJlc3BvbnNlIHRvIHlvdXIgZWFybGllciBmZWVkYmFjayBJIGhhZCBkcmFmdGVk
Cj4gPj4+PiBhIG1vcmUKPiA+Pj4+IGNvbXBsZXRlIGR0cyBhZnRlciBhbm90aGVyIHNjaGVtYXRp
YyBjb21wYXJpc29uLCBidXQgSWtlciBhbmQgSQo+ID4+Pj4gZGlzY3Vzc2VkIGl0Cj4gPj4+PiBh
bmQgb3B0ZWQgdG8gYXZvaWQgY2hhbmdpbmcgc2NvcGUgdG9vIG11Y2guIEFuZHJlJ3Mgc2VyaWVz
IGluY2x1ZGVzCj4gPj4+PiB0aGUgYml0cyBJCj4gPj4+PiB3YW50ZWQgdG8gYWRkIGFuZCBtb3Jl
LCBzbyB0aGF0IHdvcmtzIG91dC4KPiA+Pj4KPiA+Pj4gSSBoYXZlIDQvNCByZWJhc2VkIG9uIG15
IHNlcmllcyBhbnl3YXksIGRvIHlvdSB3YW50IG1lIHRvIHNlbmQgaXQ/Cj4gPj4KPiA+PiBJZiB5
b3UgaGF2ZSBhbiB1cGRhdGUgdG8gbWFrZSwgcGxlYXNlIGRvIQo+ID4KPiA+IFNvLCBob3cgaGFz
IHRoaXMgdHVybmVkIG91dCBpbiB0aGUgZW5kPyBBbmRyZSwgd2lsbCB5b3UgdGFrZSBjYXJlIG9m
Cj4gPiBzZW5kaW5nIHRoZSBsYXRlc3QgdmVyc2lvbiBmb3IgdGhlIE1VU0UgUGkgUHJvPwo+Cj4g
WWVzLCBpbiBmYWN0IEkgYWxyZWFkeSBzZW50IGl0IGxhc3Qgd2VlazoKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9zcGFjZW1pdC8yMDI2MDUyMDEzMDYyNC4xNzYzNDg3LTEtYS5oZWlkZXJAZ21h
aWwuY29tL1QvI3UKPgo+IFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCB0aGF0ICh1bmxlc3MgSSBt
ZXNzZWQgc29tZXRoaW5nIHVwKSA7KQoKSXQncyB0aGVyZSwgaXQncyBqdXN0IHRoYXQgSSB3YXNu
J3QgbG9va2luZyBmb3IgaXQuIFRoYW5rIHlvdSEKCj4KPiBUaGFua3MhCj4gQW5kcmUKPgo+ID4K
PiA+Pgo+ID4+IFRyZXZvcgo+ID4+Cj4gPj4+Cj4gPj4+IFRoYW5rcywKPiA+Pj4gQW5kcmUKPiA+
Pj4KPiA+Pj4+Cj4gPj4+PiBUaGFua3MhCj4gPj4+Pgo+ID4+Pj4gVHJldm9yCj4gPj4+Pgo+ID4+
Pj4+Cj4gPj4+Pj4gQXBwbGllZCwgdGhhbmtzIQo+ID4+Pj4+Cj4gPj4+Pj4gWzEvNF0gcmlzY3Y6
IGR0czogc3BhY2VtaXQ6IGsxOiBhZGQgU0QgY2FyZCBjb250cm9sbGVyIGFuZCBwaW5jdHJsCj4g
Pj4+Pj4gc3VwcG9ydAo+ID4+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGlu
dXgvY29tbWl0LzJkNzdlNTc3MTA5OTY3ZWY2NWYyNjljMWZjMWQ2YTY1OWQ0MjYwZmIKPiA+Pj4+
PiBbMi80XSByaXNjdjogZHRzOiBzcGFjZW1pdDogazEtb3JhbmdlcGktcnYyOiBhZGQgU0QgY2Fy
ZCBzdXBwb3J0Cj4gPj4+Pj4gd2l0aCBVSFMgbW9kZXMKPiA+Pj4+PiBodHRwczovL2dpdGh1Yi5j
b20vc3BhY2VtaXQtY29tL2xpbnV4L2NvbW1pdC8yNTg1YzYwY2UyZjk3N2IxM2YxNGE2N2QxZTNl
ZDljNzNmZDdmMzgxCj4gPj4+Pj4gWzMvNF0gcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGsxLWJhbmFu
YXBpLWYzOiBhZGQgU0QgY2FyZCBzdXBwb3J0IHdpdGgKPiA+Pj4+PiBVSFMgbW9kZXMKPiA+Pj4+
PiBodHRwczovL2dpdGh1Yi5jb20vc3BhY2VtaXQtY29tL2xpbnV4L2NvbW1pdC9jNzZlMmYwNThj
YmNhYjg0ZTRhNzAzZjI2ODU3YTU4YmRmNmEwMDQyCj4gPj4+Pj4KPiA+Pj4+PiBCZXN0IHJlZ2Fy
ZHMsCj4gPj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
