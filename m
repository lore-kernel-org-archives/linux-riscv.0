Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA67C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 04:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tpFLpEFbb+8PUcf76SaIZN+/30/jEhKOr8Y1rCANDf0=; b=r+QRAkEjzytrrhlQVtdENow/k8
	G2uw0oKVmAepghtdocDIWBtt6nFNAfVYglZI8tjhYMH4VcoyJmDQHah9cT5ryolfVipQtyUjwEpUG
	e4LTAifJgB6pjlYAdSaY/zUvU8pm1qK7lJDIcgQuaoAxVpT3gXRN+ci58ZrPL3JREvwycw+x5xWMm
	mccYzBjdnDG3DK69QTO/s+KDOLUPj/1IoHyHBKUkEafsdlAyfdgc53ynxvFJI0fCDu4LMf4A3PCGm
	pF6jjFO/Ixdk/wisSIgcPR1i/Ca/o9P5cJtQU1vvrpll0m/tjPENFlad7EGJagbPz9C9cw+FJ4Zvo
	8Ht5qBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSWuG-00EyGu-Cr; Fri, 11 Mar 2022 04:29:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSWuD-00EyG6-7B
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 04:29:34 +0000
Received: by mail-pl1-x630.google.com with SMTP id 9so6729704pll.6
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 20:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zrOypvYSBV/aO1CQ4KPF0DXRvckOSNU+3tRTfGLgwBc=;
 b=jZOmkQuMI6RuFhKg8NvmaxRDGtTrt81dOEQyqYgjW74rFBLVRanGjb2i0VmOH9c8u0
 oDsFgE/gVtj/2zwlvuY0m7sMnt25p8cZESvHeYZKU6UxlTf3LiXQGvf9y05sQUZy/mcr
 Dr8j3zAT3wY6PzxPiHYPWjvztkeGKv96NtDwPXTKw3ISsyEnKMXvAdQt9sMGbtR0iN6N
 TZvP3DmwgA1Cz8ich7sgblV8Qbrp6EsLHqsjutBsl7gVa9xK44gyoLLNmwE944wRFo+L
 PACWqwc2BT29y68XXByp9nq5NJgFhlF3NR5FHie7p51WEURn/FdO7pEhT4jnszHnxKVm
 pXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zrOypvYSBV/aO1CQ4KPF0DXRvckOSNU+3tRTfGLgwBc=;
 b=0Yvny7so1GHa9bLCXKhA6IBEKuNrwtehfs2Ips/eqlBXy4bx28kBxdOPqf0f9tBZal
 PFlwScBaEUtDs/v/AszTi004HaLpZTtHJsLA5GVMuUe2ZoYAngM6S7wpGovpdF5rA5D3
 Ltntj7j9hRd09w7tQMDbnCYoD90R8BLEekjZsnnH6bYi4l8i8Hlc+nA1BFo9vwEo8pw0
 N8CsIRc92xPzVi7xcrSb1yJoEmEUOhUA49KPF0tKV8TQMM+55a1xFUHKGQzhqh1H870Y
 XEiX3URArovDarzcYxEyfjpRbmaFLP5RDf0g542lPcBhtP2VSBGFpTe7MCLoKJvhCzaa
 aWdQ==
X-Gm-Message-State: AOAM532KGVxGYw/8nCm8Wbg8hV7t0BeZMEWLocMA3BLPoQbTiFc7o3Z0
 Sin8C5pY08j+UO0oOmKXEH0TVA==
X-Google-Smtp-Source: ABdhPJwpxDR3gGioaEv9ojhLroxIx+LBfNQORccewdv7C3h8rx4tg3f/4LAKta2pms042VRbyIeHMQ==
X-Received: by 2002:a17:902:f682:b0:151:a262:ad4a with SMTP id
 l2-20020a170902f68200b00151a262ad4amr8932436plg.84.1646972972298; 
 Thu, 10 Mar 2022 20:29:32 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 o65-20020a17090a0a4700b001bef5cffea7sm11864363pjo.0.2022.03.10.20.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:29:31 -0800 (PST)
Date: Thu, 10 Mar 2022 20:29:31 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 20:28:45 PST (-0800)
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
In-Reply-To: <b10e777c-1511-519b-20bb-a682a6119132@MichaelKloos.com>
CC: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Michael@MichaelKloos.com
Message-ID: <mhng-97bc7422-36da-436a-a326-1705ef6fcace@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_202933_349603_7512B172 
X-CRM114-Status: GOOD (  20.51  )
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

T24gVGh1LCAxMCBNYXIgMjAyMiAwNTozNzoyNyBQU1QgKC0wODAwKSwgTWljaGFlbEBNaWNoYWVs
S2xvb3MuY29tIHdyb3RlOgo+IElzIHRoZXJlIHNvbWV0aGluZyBJIGNhbiBkbyB0aGF0IHdvdWxk
IGhlbHAgYWxsZXZpYXRlIHlvdXIgY29uY2VybnMgb3IKPiBhcHByZWhlbnNpb24/CgpJTU8gdGhp
cyBpcyBvbmUgb2YgdGhvc2UgY2FzZXMgd2hlcmUgaGF2aW5nIGhhcmR3YXJlIGlzIHJlcXVpcmVk
LgoKSSBjYW4gdW5kZXJzdGFuZCB0aGUgZ29hbCBvZiBwcm92aWRpbmcgYSBMaW51eCBwb3J0IGZv
ciB0aGUgbWluaW1hbCAKUklTQy1WIGNvbXBhdGlibGUgc3lzdGVtLCBidXQgSUlVQyB0aGUgbWlu
aW1hbCBSSVNDLVYgY29tcGF0aWJsZSBzeXN0ZW0gCmlzIGFueSBvYmplY3QgYXNzb2NpYXRlZCB3
aXRoIGEgbWVtYmVyIG9mIHRoZSBSSVNDLVYgZm91bmRhdGlvbiB0aGF0IApzYWlkIG1lbWJlciBh
dHRlc3RzIGlzIGEgUklTQy1WIHN5c3RlbS4gIFRoZXJlJ3MgcmVhbGx5IG5vIHdheSB0byAKaW1w
bGVtZW50IExpbnV4IG9uIGFsbCBzdWNoIHN5c3RlbXMgc28gd2UgaGF2ZSB0byBzZXQgdGhlIGJh
ciBzb21ld2hlcmUsIAphbmQgYmFyIGlzIGdlbmVyYWxseSBzZXQgYXQgIm1vcmUgdGltZSB3aWxs
IGJlIHNwZW50IHVzaW5nIHRoaXMgdGhhbiAKbWFpbnRhaW5pbmcgaXQiLiAgU3lzdGVtcyB3aXRo
b3V0IE0gaGF2ZSBnZW5lcmFsbHkgbm90IG1ldCB0aGF0IGJhciwgYW5kIApJIGRvbid0IHNlZSBh
bnl0aGluZyBjaGFuZ2luZyBub3cuCgpJZiB5b3UgaGF2ZSB1c2VycyB0aGVuIEknbSBoYXBweSB0
byByZWNvbnNpZGVyLCB0aGUgZ29hbCBoZXJlIGlzIHRvIG1ha2UgCnJlYWwgc3lzdGVtcyB3b3Jr
LiAgVGhhdCBzYWlkOiB3ZSd2ZSBhbHJlYWR5IGdvdCBlbm91Z2ggdHJvdWJsZSB0cnlpbmcgCnRv
IG1ha2UgYWN0dWFsIHNoaXBwaW5nIGhhcmR3YXJlIGZ1bmN0aW9uIGNvcnJlY3RseSwgd2UncmUg
YWxsIGdvaW5nIHRvIApsb3NlIG91ciBtaW5kcyB0cnlpbmcgdG8gY2hhc2UgYXJvdW5kIGV2ZXJ5
dGhpbmcgdGhhdCBjb3VsZCBpbiB0aGVvcnkgYmUgCmEgUklTQy1WIHN5c3RlbSBidXQgZG9lc24n
dCBhY3R1YWxseSBleGlzdC4KCj4KPiBPbiAzLzEwLzIwMjIgODoyMiBBTSwgTWljaGFlbCBULiBL
bG9vcyB3cm90ZToKPgo+PiBTb21lIG90aGVyIHRob3VnaHRzOgo+PiBJdCBzb3VuZHMgbGlrZSBJ
IGFtIG5vdCB0aGUgZmlyc3QgcGVyc29uIHRvIHdhbnQgdGhpcyBmZWF0dXJlIGFuZCBJCj4+IHBy
b2JhYmx5IHdvbid0IGJlIHRoZSBsYXN0LsKgIEkgY3JlYXRlZCB0aGUgY2hhbmdlIGZvciBteSBv
d24gcmVhc29ucywgdGhlCj4+IHNhbWUgYXMgYW55IG90aGVyIGNvbnRyaWJ1dG9yLsKgIEkgdGhp
bmsgd2UgYWxsIGtub3cgdGhhdCBJIGNhbiBub3QgcHVsbAo+PiBvdXQgc29tZSBjaGFydCBhbmQg
c2F5LCAiVGhpcyBtYW55IHBlb3BsZSB3YW50IHRoaXMgYW5kIGhlcmUgaXMgd2h5LiLCoCBJCj4+
IGxpdmUgaW4gY2VudHJhbCBPaGlvIGFuZCBoYXZlIGJlZW4gZG9pbmcgdGhpcyBhcyBhIGhvYmJ5
LsKgIEkgZG9uJ3QgZXZlbgo+PiBrbm93IGFueW9uZSBlbHNlIHdobyBrbm93cyBhYm91dCBzeXN0
ZW1zIGFuZCBvcGVyYXRpbmcgc3lzdGVtIGRldmVsb3BtZW50Lgo+PiBJZiB0aGUganVzdGlmaWNh
dGlvbiB0aGF0IHlvdSBhcmUgbG9va2luZyBmb3IgaXMgdGhhdCBJIGFzIHNvbWUKPj4gaHlwb3Ro
ZXRpY2FsIGRldmVsb3BlciBhdCBhIG1ham9yIHRlY2ggY29tcGFueSBpcyBhYm91dCB0byByZWxl
YXNlIGEgbmV3Cj4+IFJJU0MtViBjaGlwIHdpdGhvdXQgTSBzdXBwb3J0IGJ1dCB3ZSB3YW50IGl0
IHRvIHJ1biBMaW51eCwgSSBjYW4gbm90Cj4+IHByb3ZpZGUgdGhhdCBhbnN3ZXIuwqAgSXQgc291
bmRzIGEgYml0IGxpa2Ugc29tZSBzb2Z0d2FyZSBvciBoYXJkd2FyZSwKPj4gY2hpY2tlbiBvciB0
aGUgZWdnIGFueXdheS7CoCBUcnlpbmcgdG8gbWFpbnRhaW4gbXkgb3duIGZvcmsgaWYgcGVvcGxl
Cj4+IHN0YXJ0IGNvbnRyaWJ1dGluZyBwYXRjaGVzIHdpdGggaW5jb21wYXRpYmxlIGFzc2VtYmx5
IHNjYXJlcyBtZS4KPj4gIMKgwqDCoMKgTWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
