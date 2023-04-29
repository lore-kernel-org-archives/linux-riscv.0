Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078E1C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 06:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aH5Fe8pan/CTmZnF4MHZxltoUmGfb0j2XRfvCbXBR0=; b=PKzbsxIHtMRy8R
	kCR1nuF5OdYFinZxJ9Gz/PsEPw1nQwLbRgn9mw6htSEPPyKuASwn7lllbLRk0rgHfigSuGiZONrKw
	74rxyQW1nYecQjUNNQB/NStYWxg4T5lKU28UzeXJuQqsPa0X2yQh0hmqd10fmK03yDH9Fkx2GZiT9
	WejRZIuL+a56tJPwWqmF4plRdc0BgG/1rGmzHm/zWzHQxLkfN/aZb8D1mFElhPFVT5xvNXtZztOpS
	+X1+f/8JeN8SZWBR+XYqXk0rKOFqU6P/tI6HlIE7CT2jKWIn1Lh3mlXZjtviEAxMIZXVcRSACfTZG
	mL4rj3ODQJ0EU/Od+y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psdvy-00CJHq-2p;
	Sat, 29 Apr 2023 06:19:50 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psdvu-00CJGr-2D
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 06:19:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-246fa478d45so692931a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1682749185; x=1685341185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTMjDk3SOgiCPjxuLxhArxtC95/xlU4WSt6SJxU0e7Y=;
        b=XyLmSLRRw5vhwFunIep9bCU9Ptv8zJooq6+MLDBGrovDSvagRv6kBI6twD+YR78KiG
         BeEetk1c26wanqo2urmTL/brQ9DSTPDvQi403y65gx4fJSSvfG/Xk14q2glr2oRKHS/T
         h2ievV6hgV6lbgRlb6Vj2FQy/RghnjYGNW+f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682749185; x=1685341185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTMjDk3SOgiCPjxuLxhArxtC95/xlU4WSt6SJxU0e7Y=;
        b=NtPYYGzvPTuZXzSbpQkghtdOCOVhHjMpMdb2e/Au+/R/7OQwutmo/dclMIPLe0V7LU
         z1mg5ZJ9XPgjwIgR8C99o7wuY1+OrLHYjD4/oBw/o00SQ6xnq6nN6wdoF8bpzuFHx3K8
         o4M23dRYzHyzVGJrgGq/xKlOeC7N/gOJ/ldaaQQJ5ZGfleCPuTigGaMC+oFAHjS7o/DB
         a6JAvMGwuz+f/8RXNGyuCee92MI+a/lu4yFM2QKcBBaL70cRq8HWQNsyGf+LSqIqyUEL
         LiJ2G3qMkSQO6zXgWlWCEvZX4FiHnLFidO9tub0Yiip7MrBrvlkRUECn10nYTReZpsYR
         1EzQ==
X-Gm-Message-State: AC+VfDy6wFKvFlr70zWhVYWA9Inh1PmyJf7266+/chiGolMbs9X59/2v
	Euy4X8qE81LWpKvY8WFGVnrZJQUJjt0dNISNwJKz
X-Google-Smtp-Source: ACHHUZ4LhwwR0e1B330AbEkd5AimnCzdBqVUhs/POzba4tZ0rYglv0TK7U3GChiM2m5G/Kut356agp6Sgo1hYtHMuJk=
X-Received: by 2002:a17:90b:1b03:b0:246:681c:71fd with SMTP id
 nu3-20020a17090b1b0300b00246681c71fdmr7622447pjb.6.1682749184993; Fri, 28 Apr
 2023 23:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <20230413161725.195417-5-alexghiti@rivosinc.com> <kwvrls2m6swp443brn27jwcsdhovtc4kxrkqustxpqgf7zqltw@xlhsrndkf4om>
 <CAHVXubh_y9Uw2xsgsQrVZEcb9bCLBLUCo74GOm-czsSawHxk4g@mail.gmail.com> <3bwxedsrovutzhlmlnozeuvz4zqnr32kuef2mdzmnbniajh6vb@we6jzlwkfuof>
In-Reply-To: <3bwxedsrovutzhlmlnozeuvz4zqnr32kuef2mdzmnbniajh6vb@we6jzlwkfuof>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 29 Apr 2023 11:49:33 +0530
Message-ID: <CAOnJCU+xL1qP0zj9rD0d9nix-tSd-yfQnToDXCdHveTKQN_rUA@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: Enable perf counters user access only through perf
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	David Abdurachmanov <davidlt@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Andreas Schwab <schwab@suse.de>, mafm@debian.org, 
	aurel32@debian.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_231947_013697_318C695F 
X-CRM114-Status: GOOD (  35.04  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgNjo1NeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMDM6MTc6
MDFQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMjYsIDIw
MjMgYXQgMjo1N+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIEFwciAxMywgMjAyMyBhdCAwNjoxNzoyNVBNICswMjAw
LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+ID4gV2UgdXNlZCB0byB1bmNvbmRpdGlvbm5h
bGx5IGV4cG9zZSB0aGUgY3ljbGUgYW5kIGluc3RyZXQgY3NycyB0bwo+ID4gPiA+IHVzZXJzcGFj
ZSwgd2hpY2ggZ2l2ZXMgcmlzZSB0byBzZWN1cml0eSBjb25jZXJucy4KPiA+ID4gPgo+ID4gPiA+
IFNvIG9ubHkgYWxsb3cgYWNjZXNzIHRvIGh3IGNvdW50ZXJzIGZyb20gdXNlcnNwYWNlIHRocm91
Z2ggdGhlIHBlcmYKPiA+ID4gPiBmcmFtZXdvcmsgd2hpY2ggd2lsbCBoYW5kbGUgY29udGV4dCBz
d2l0Y2hzLCBwZXItdGFzayBldmVudHMuLi5ldGMuIEJ1dAo+ID4gPiA+IGFzIHdlIGNhbm5vdCBi
cmVhayB1c2Vyc3BhY2UsIHdlIGdpdmUgdGhlIHVzZXIgdGhlIGNob2ljZSB0byBnbyBiYWNrIHRv
Cj4gPiA+ID4gdGhlIHByZXZpb3VzIGJlaGF2aW91ciBieSBzZXR0aW5nIHRoZSBzeXNjdGwgcGVy
Zl91c2VyX2FjY2Vzcy4KPiA+ID4gPgo+ID4gPiA+IFdlIGFsc28gaW50cm9kdWNlIGEgbWVhbnMg
dG8gZGlyZWN0bHkgbWFwIHRoZSBoYXJkd2FyZSBjb3VudGVycyB0bwo+ID4gPiA+IHVzZXJzcGFj
ZSwgdGh1cyBhdm9pZGluZyB0aGUgbmVlZCBmb3Igc3lzY2FsbHMgd2hlbmV2ZXIgYW4gYXBwbGlj
YXRpb24KPiA+ID4gPiB3YW50cyB0byBhY2Nlc3MgY291bnRlcnMgdmFsdWVzLgo+ID4gPiA+Cj4g
PiA+ID4gTm90ZSB0aGF0IGFyY2hfcGVyZl91cGRhdGVfdXNlcnBhZ2UgaXMgYSBjb3B5IG9mIGFy
bTY0IGNvZGUuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIERvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QgfCAgMjMgKysrLQo+ID4gPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmZfZXZlbnQuaCAgICAgICAgIHwgICAzICsKPiA+ID4gPiAg
YXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ID4g
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2V2ZW50LmMgICAgICAgICAgICAgIHwgIDY1ICsr
KysrKysrKysrCj4gPiA+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyAgICAgICAgICAgICAg
ICAgICAgfCAgNDIgKysrKysrKysKPiA+ID4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdh
Y3kuYyAgICAgICAgICAgICB8ICAxNyArKysKPiA+ID4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9zYmkuYyAgICAgICAgICAgICAgICB8IDExMyArKysrKysrKysrKysrKysrKystLQo+ID4gPiA+
ICBpbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmggICAgICAgICAgICAgIHwgICAzICsKPiA+
ID4gPiAgdG9vbHMvbGliL3BlcmYvbW1hcC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2NSAr
KysrKysrKysrKwo+ID4gPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDMyMiBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2Vy
bmVsL3BlcmZfZXZlbnQuYwo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL3N5c2N0bC9rZXJuZWwucnN0Cj4gPiA+ID4gaW5kZXggNGI3YmZlYTI4Y2Q3Li4wMmIyYTQw
YTM2NDcgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNj
dGwva2VybmVsLnJzdAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lz
Y3RsL2tlcm5lbC5yc3QKPiA+ID4gPiBAQCAtOTQxLDE2ICs5NDEsMzEgQEAgZW5hYmxlZCwgb3Ro
ZXJ3aXNlIHdyaXRpbmcgdG8gdGhpcyBmaWxlIHdpbGwgcmV0dXJuIGBgLUVCVVNZYGAuCj4gPiA+
ID4gIFRoZSBkZWZhdWx0IHZhbHVlIGlzIDguCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IC1wZXJm
X3VzZXJfYWNjZXNzIChhcm02NCBvbmx5KQo+ID4gPiA+IC09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KPiA+ID4gPiArcGVyZl91c2VyX2FjY2VzcyAoYXJtNjQgYW5kIHJpc2N2IG9u
bHkpCj4gPiA+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4g
PiA+ICsKPiA+ID4gPiArQ29udHJvbHMgdXNlciBzcGFjZSBhY2Nlc3MgZm9yIHJlYWRpbmcgcGVy
ZiBldmVudCBjb3VudGVycy4KPiA+ID4gPgo+ID4gPiA+IC1Db250cm9scyB1c2VyIHNwYWNlIGFj
Y2VzcyBmb3IgcmVhZGluZyBwZXJmIGV2ZW50IGNvdW50ZXJzLiBXaGVuIHNldCB0byAxLAo+ID4g
PiA+IC11c2VyIHNwYWNlIGNhbiByZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgY291bnRlciByZWdp
c3RlcnMgZGlyZWN0bHkuCj4gPiA+ID4gK2FybTY0Cj4gPiA+ID4gKz09PT09Cj4gPiA+ID4KPiA+
ID4gPiAgVGhlIGRlZmF1bHQgdmFsdWUgaXMgMCAoYWNjZXNzIGRpc2FibGVkKS4KPiA+ID4gPiAr
V2hlbiBzZXQgdG8gMSwgdXNlciBzcGFjZSBjYW4gcmVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGNv
dW50ZXIgcmVnaXN0ZXJzCj4gPiA+ID4gK2RpcmVjdGx5Lgo+ID4gPiA+Cj4gPiA+ID4gIFNlZSBE
b2N1bWVudGF0aW9uL2FybTY0L3BlcmYucnN0IGZvciBtb3JlIGluZm9ybWF0aW9uLgo+ID4gPiA+
Cj4gPiA+ID4gK3Jpc2N2Cj4gPiA+ID4gKz09PT09Cj4gPiA+ID4gKwo+ID4gPiA+ICtXaGVuIHNl
dCB0byAwLCB1c2VyIGFjY2VzcyBpcyBkaXNhYmxlZC4KPiA+ID4gPiArCj4gPiA+ID4gK1doZW4g
c2V0IHRvIDEsIHVzZXIgc3BhY2UgY2FuIHJlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBjb3VudGVy
IHJlZ2lzdGVycwo+ID4gPiA+ICtkaXJlY3RseSBvbmx5IHRocm91Z2ggcGVyZiwgYW55IGRpcmVj
dCBhY2Nlc3Mgd2l0aG91dCBwZXJmIGludGVydmVudGlvbiB3aWxsCj4gPiA+ID4gK3RyaWdnZXIg
YW4gaWxsZWdhbCBpbnN0cnVjdGlvbi4KPiA+ID4gPiArCj4gPiA+ID4gK1RoZSBkZWZhdWx0IHZh
bHVlIGlzIDIsIGl0IGVuYWJsZXMgdGhlIGxlZ2FjeSBtb2RlLCB0aGF0IGlzIHVzZXIgc3BhY2Ug
aGFzCj4gPiA+ID4gK2RpcmVjdCBhY2Nlc3MgdG8gY3ljbGUsIHRpbWUgYW5kIGluc3JldCBDU1Jz
IG9ubHkuCj4gPiA+Cj4gPiA+IEkgdGhpbmsgdGhpcyBkZWZhdWx0IHZhbHVlIHNob3VsZCBiZSBh
IEtjb25maWcgc3ltYm9sLCBhbGxvd2luZyBrZXJuZWxzIHRvCj4gPiA+IGJlIGJ1aWx0IHdpdGgg
YSBzZWN1cmUgZGVmYXVsdC4KPiA+Cj4gPiBBY3R1YWxseSBJIHdhcyBtb3JlIGluIGZhdm9yIG9m
IGhhdmluZyB0aGUgZGVmYXVsdCB0byAxIChpZSB0aGUgc2VjdXJlCj4gPiBvcHRpb24pIGFuZCBs
ZXQgdGhlIGRpc3Ryb3MgZGVhbCB3aXRoIHRoZSBsZWdhY3kgbW9kZSAodmlhIGEgc3lzY3RsCj4g
PiBwYXJhbWV0ZXIgb24gdGhlIGNvbW1hbmQgbGluZSkgYXMgbG9uZyBhcyB1c2VyLXNwYWNlIGhh
cyBub3QgYmVlbgo+ID4gZml4ZWQ6IGRvZXMgdGhhdCBtYWtlIHNlbnNlPwo+Cj4gWWVzLCBJJ2Qg
cHJlZmVyIHRoYXQgdG9vLiBJIGFzc3VtZWQgdGhlIGRlZmF1bHQgd2FzIDIgaW4gdGhpcyBwYXRj
aAo+IGJlY2F1c2Ugd2UgY291bGRuJ3Qgc2V0IGl0IHRvIDEgZm9yIHNvbWUgcmVhc29uLgo+CgpJ
IHdvdWxkIHByZWZlciB0aGF0IHRvby4gSG93ZXZlciwgaXQgd2FzIHNldCB0byAyIGJlY2F1c2Ug
aXQgd291bGQgYnJlYWsKdGhlIHVzZXIgc3BhY2UgYXBwbGljYXRpb24gZGVwZW5kaW5nIG9uIHRo
ZSBsZWdhY3kgYmVoYXZpb3IgYXMgc29vbiBhcyB0aGUKcGF0Y2hlcyBhcmUgdXBzdHJlYW0uIFRo
YXQgaXMgdGhlIHJlYXNvbgpwYWxtZXIgc3VnZ2VzdGVkIGtlZXBpbmcgdGhlIGRlZmF1bHQgdmFs
dWUgdG8gMiBpbiBvcmRlciB0byBhdm9pZCB0aGF0LgoKK2Rpc3RybyBmb2xrcyAoY2MnZCkKSWYg
dGhlIGRpc3RybyBtYWludGFpbmVyIGNhbiBjb25maXJtIHRoYXQgdGhpcyB3b3VsZCBiZSBhIG5v
bi1pc3N1ZSwgSSBhbSBva2F5CndpdGggc2V0dGluZyB0aGUgZGVmYXVsdCB0byAxLgoKCj4gVGhh
bmtzLAo+IGRyZXcKCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
