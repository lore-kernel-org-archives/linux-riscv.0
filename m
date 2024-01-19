Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49A9C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xXVjWtJplVG+FfVm1EhQqPzihf8vo4wxIiLjPhjQ60=; b=smgFrhcRhMPOig
	vWVeNL86+OneY5cVdsDPW6wmS8WIiXlj0hS1HyPCVVmGd/TyW/NGma+id7Nx8wrE3HfJNbrItg98Q
	QOZrzu64azLF5Q2VDZlYvqpmj05LHI1C+A17cOUqm6WleFwaoozDDeZAYrVfCBtixlEophINJwV5D
	3AUg7cRnndAwy3LLvK0MnM+xl78dagcblSKf2bi5O1D3yUgyJtJzVUodLPydmd8qco6/ROG36Xi7g
	enYZf3IshvZCgfn9zkYaZXPZY6rp3HQ9V+PrFiCgvhfVefDpX8J0HLGiEbT8nHuy7vy65wv6nTwoN
	r4h+yrk89W6+I/VNny9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQl8a-004xf7-1m;
	Fri, 19 Jan 2024 09:26:08 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQl8U-004xaL-0E
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 09:26:06 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-206b77b9f4bso452461fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 01:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705656299; x=1706261099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWKNHQ9eOmzlc6q0VlOOoUK44JMaP07lqPTR3OIl/mc=;
        b=SLfCACul7ZO7+DMd4llQ7dyzEdRXfpMGCTsz9X7mP7xzyG0KBIWf+i0kWatau74c12
         48mwr0EOj4tIsa6htcA8sSJqjrzC85XKLYPVdJiXJUZs9IzIQsLIoT6gCeL/ShG6hpsD
         1QZ4NfP41bcWh0Hh0lPNIvQwKnE+fviapqwp1wEsEE/4vuZFB6Zb5CP1KbUmS5pdV8UD
         RZP6VGaZNBdwIBfKGgg82nk0rKyPGQ2th+x+xLFeh/jU7E0KLbyHSHRDHb5junRjoHJ+
         WiaYTNtVQkxRNEZzUQ18YGa6NpkHrnVUXzYIhgvqXWQKr/gSoNI6qg+w+h0v5j8cZUIf
         1LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705656299; x=1706261099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWKNHQ9eOmzlc6q0VlOOoUK44JMaP07lqPTR3OIl/mc=;
        b=pMjAPhScmgz2njUVaoJ8jnTWlgMOlNZASyTqQ67hDxBMkRZf5q3pHBKZNyXKPfZ0E3
         xDl4WqvphAWwsm1uXVgKPV6aQEawG7L24josI5I+yc+XJXOKxf6XCnzsyUzdwHhMd4k5
         8QAYu59HqD8qIVe0kNnrk0VX98zr/iAhodd9WW06GopZnJ22QHtPu3Ldi2v0usnMFdpK
         zcQP9Vfx1xTEB/sG2/eyvOmMLU7TOAjHnHnZDJWgPefUcimIkfhsScvzT+0Y7WwH+Qsj
         pE4f5Uog/Dh1YUG73qUXL4iDslM3rRhOddm3ZM09g9r8kHabQMzT7tUH3OvtywIa7D9K
         TYgw==
X-Gm-Message-State: AOJu0YwK2hnT2w7VvwmpPpTsy/mFT344PUaYNyKhsNcjEUUiR7/u2P5o
	2GUtdpDdOjmNjjVRiEX2EfnAnbGJ1bv/QZOPDr9+mg+aHBnwzBjD+c0yCgZeUmrYuJkWGnnCOl2
	Ah2NobfShF2HUagih137vjJy9JEqcPDzMma6oNBg9HQI/1GvVuHqgkw==
X-Google-Smtp-Source: AGHT+IGfxnHzf33GKMgDucOuB/2UCR4hePqOzg9xCEo9hl8TKGpoKczHS9WDNibqb1xpoylPMO23tMGwctgpfpmFYNg=
X-Received: by 2002:a05:6870:450f:b0:206:4d0e:c190 with SMTP id
 e15-20020a056870450f00b002064d0ec190mr2694861oao.52.1705656299402; Fri, 19
 Jan 2024 01:24:59 -0800 (PST)
MIME-Version: 1.0
References: <CAEEQ3wn=TkGULh=kqUxxi913_AVrRW1Edb6tTe7CuKS=YkP1BA@mail.gmail.com>
 <20240118-enjoyment-defuse-3b5a2b76afb7@spud> <CAEEQ3w=_SNRVCg9tGU+SjPVO57FhGQW7Pk9BZ-f97Lh5U0LXEA@mail.gmail.com>
 <20240119-majestic-unsheathe-4ff839d416ac@wendy> <CAEEQ3wk9JEMHX59GE5m5n2Tk0fddfXPQ_6tZjQnN_y7DLBAQnw@mail.gmail.com>
In-Reply-To: <CAEEQ3wk9JEMHX59GE5m5n2Tk0fddfXPQ_6tZjQnN_y7DLBAQnw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Jan 2024 17:24:48 +0800
Message-ID: <CAEEQ3wkkLPM5wNhBBYJdy53OzpLY4aGpMMeaPj9s8E5SxnrL0w@mail.gmail.com>
Subject: Re: [External] Re: Current status of RISC-V init_cache_level()
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_012602_444430_5DD004B5 
X-CRM114-Status: GOOD (  27.57  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEphbiAxOSwgMjAyNCBhdCA0OjU54oCvUE0geXVuaHVpIGN1aSA8
Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgQ29ub3LvvIwKPgo+IE9uIEZy
aSwgSmFuIDE5LCAyMDI0IGF0IDQ6MjLigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEphbiAxOSwgMjAyNCBhdCAxMDoz
MjozOEFNICswODAwLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEphbiAxOCwgMjAy
NCBhdCA5OjI14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+
ID4gPiBPbiBUaHUsIEphbiAxOCwgMjAyNCBhdCAwNzo0MDo0MlBNICswODAwLCB5dW5odWkgY3Vp
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gRmlyc3RseSwgcGxlYXNlIGRvbid0IHNlbmQgbWUgb2Zm
LWxpc3QgbWFpbHMgYWJvdXQgc3VjaCB0aGluZ3MKPiA+ID4gPiBhbmQgaW5zdGVhZCwgcGxlYXNl
IHJlcGx5IHRvIHRoZSByZWxldmFudCB0aHJlYWRzIG9uIGxrbWwuCj4gPiA+ID4KPiA+ID4gPiA+
IFRoZXJlIGlzIG5vIGNhY2hlIHN1YmRpcmVjdG9yeSBpbiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUwLywgc28KPiA+ID4gPiA+IGxzY3B1IGNhbm5vdCBzZWUgdGhlIGNhY2hlIGluZm9ybWF0
aW9uLiBJIGZvdW5kIHRoYXQgdGhlIHJlYXNvbiBpcwo+ID4gPiA+ID4gdGhhdCBpbml0X2NhY2hl
X2xldmVsKCkgaXMgbm90IGltcGxlbWVudGVkIG9uIFJJU0MtVi4KPiA+ID4gPgo+ID4gPiA+IFdo
YXQgdmVyc2lvbiBvZiB0aGUga2VybmVsIGFyZSB5b3UgdXNpbmc/IEkgaGFkIGEgYnJpZWYgY2hl
Y2sgdG8gbWFrZQo+ID4gPiA+IHN1cmUgc29tZXRoaW5nIGhhZCBub3QgZ29uZSBhd3J5IHJlY2Vu
dGx5IGFuZCBJIGNvdWxkIHNlZSB0aGVtIG9uIG15Cj4gPiA+ID4gc3lzdGVtLiBXaGF0IGRvIHRo
ZSBjcHUgbm9kZXMgaW4geW91ciBEVCBsb29rIGxpa2UsIGFzc3VtaW5nIHlvdSBhcmUKPiA+ID4g
PiBvbiBhIERUIHN5c3RlbT8KPiA+ID4KPiA+ID4gVGhlIHJlc3VsdHMgb2YgdG9wIGNvbW1pdCB1
c2luZyBsaW51eC1uZXh0IG9uIHFlbXUsIEl0IHNob3VsZCBub3QKPiA+ID4gbWF0dGVyIGlmIGl0
IGlzIGNvbWJpbmVkIHdpdGggRFQsIGJlY2F1c2UgdGhlIGZvbGxvd2luZyBmdW5jdGlvbiBmbG93
Cj4gPiA+IGRpcmVjdGx5IGZhaWxzLgo+ID4KPiA+IE9oIG5vLCBpdCB0b3RhbGx5IGRvZXMgbWF0
dGVyIHdoYXQgdGhlIERUIGxvb2tzIGxpa2UuIFRoZSBkZWZhdWx0IERUIGluCj4gPiBRRU1VJ3Mg
dmlydCBtYWNoaW5lIGRvZXMgbm90IHBvcHVsYXRlIGFueSBjYWNoZSBwcm9wZXJ0aWVzLiBPbiBh
IHN5c3RlbQo+ID4gd2hlcmUgdGhlIERUIHBvcHVsYXRlcyB0aGVzZSB2YWx1ZXMsIGluaXRfb2Zf
Y2FjaGVfbGV2ZWwoKSB3aWxsIGVuc3VyZQo+ID4gdGhhdCB0aGUgY29ycmVjdCBzeXNmcyBlbnRy
aWVzIGFyZSBzZXQgdXAuCj4gPgo+ID4gPiBjYWNoZWluZm9fc3lzZnNfaW5pdCgpLi4uaW5pdF9j
YWNoZV9sZXZlbCgpCj4gPiA+IGludCBfX3dlYWsgaW5pdF9jYWNoZV9sZXZlbCh1bnNpZ25lZCBp
bnQgY3B1KQo+ID4gPiB7Cj4gPiA+IHJldHVybiAtRU5PRU5UOwo+ID4gPiB9Cj4gPiA+IElzIGl0
IG5lY2Vzc2FyeSB0byBpbXBsZW1lbnQgYW4gaW5pdF9jYWNoZV9sZXZlbCgpIG9uIFJJU0MtViBs
aWtlIG90aGVyIGFyY2hlcz8KPiA+Cj4gPiBJbiBvcmRlciB0byBpbXBsZW1lbnQgdGhhdCBmdW5j
dGlvbiwgd2Ugd291bGQgbmVlZCBzb21lIG1lY2hhbmlzbSBmb3IKPiA+IGZpbmRpbmcgdGhhdCBp
bmZvcm1hdGlvbi4gV2hlcmUgZG8geW91IHN1Z2dlc3Qgd2UgZ2V0IGl0IGZyb20sIGlmIGl0IGlz
IG5vdAo+ID4gcHJvdmlkZWQgdG8gdXMgZnJvbSBEVD8KPgo+IEl0J3Mgbm90IHRoYXQgd2UgZG9u
J3QgZ2V0IGNhY2hlIGluZm9ybWF0aW9uIGZyb20gRFQuIFdoYXQgSSB3YW50IHRvCj4gZXhwcmVz
cyBpcyB0aGF0IHdlIG5lZWQgdG8gaW1wbGVtZW50IGluaXRfY2FjaGVfbGV2ZWwoKSBvbiBSSVND
LVYsCj4gb3RoZXJ3aXNlIGNhY2hlaW5mb19jcHVfb25saW5lKCkgd2lsbCByZXR1cm4gZnJvbQo+
IGRldGVjdF9jYWNoZV9hdHRyaWJ1dGVzKCkgYW5kIHdpbGwgbm90IGV4ZWN1dGUgY2FjaGVfYWRk
X2RldigpLCBzbyBpdAo+IHdpbGwgbm90IGJlIGluLyBzeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dXgvIGNyZWF0ZXMgYSAiY2FjaGUiIG5vZGUuCgpXaGF0IGRvIHlvdSB0aGluaz8gSWYgc28sIEkg
d2lsbCBwb3N0IGEgcGF0Y2ggdG8gZml4IGl0LgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
