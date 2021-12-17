Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63D4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hF9/yW4QlbC1HPDWD75VIRk9juYFiWZ2GDjUo/muOI=; b=fQvubyehoqgMVq
	yhjKHg1f/JzgrQ0bt/uETIilfNbvU8/VxKSkdh3qYySO8B+vdU1LdcXdupsvcXGEdD344tACP5q8U
	IuSWMdIDf+18waEfqmz9GgULGHsnNnFflS99skz75KX8qGYLTlTQhaTFnBsynrMl3xLQj+eX4FAKM
	xyMl0IqMve862JWnGYAroodaZ7SrIOb7/klpCwk5OZUzRZ0tzfgiBDOHHWUggPAROeQfxHJ9dX34o
	FVuev6BUBq5IvQxhiGi4w9sCYThHSlhLJ6tY7u0z3r7L0qVP2dPwX7GgA0iGjEX7vOhl48oaaCVtw
	t4QgNPnJtrl6JRyP1Ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myC3O-00A1b4-Tf; Fri, 17 Dec 2021 12:09:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myC3M-00A1Zk-8e
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:09:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t18so3582202wrg.11
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 04:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TpogRltD/BPLIa5iBku/o4kEHCjlMgOzFRWSLg+D5DY=;
 b=Zr3oTIIiE4UtFg8dXb7VIOhTOza5J9sI7QJcI9iYvlfQaNZR/7ItD/cJO71lrpmhph
 zb1jW31FT7jS8Li+1LGmaazUZjXZAYs7oKIGZSHjh/jv1UzgXtiQ99ga9ev+c9nSG4zT
 T+GvTp/CJLXr1oErK8HA20LE7aAQxcDRMqQ5YS0mDt0okmuLh3yYIdcQKxdjm1gGCm5o
 vdF28fy2+sp6eswLq5nQnnncKiz8HdmUTnFxlOO/rUIKF6BOdiUdvivlyAQ+gDzOcwO0
 x1Es8C6Ir9P7GVJRPEQD7PUOhNCqaLzGbrz83CZsFz0fuTYkfay1qf73A514yEMnhV2E
 466Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TpogRltD/BPLIa5iBku/o4kEHCjlMgOzFRWSLg+D5DY=;
 b=Ioi/M9yttfzH4A8frRCo9OK+ptSAup6QYgkLBlWZkOmCkyEOhF5wewt3QQGyzxcLRj
 75CtJ4cq1Zhvhi5q/GalfTvLPha0ljMUDxbk19W0tLAyGuVxQGlROPgNkhqaPqHu83gE
 6X+YO15CSsHq6hyydaY8bqn1S7jXtjBFcxh1x+hapxikLqOIywDKF36qFwsIxJpYU6cn
 DRxC515V/4Z9Uj8NWiZqdCU746NkmNF52rOdZWAXv10zW06mas6vM1uZATdnuJSqkeAL
 78xBXOIoUkLFpEueJF/8mdac7F8OjRdCVfWELk3VvcH96JyYszP6znFZGcdyEcTg1kA7
 qOXA==
X-Gm-Message-State: AOAM5318DnI9S96BwmoZRtBKVATK3juNxtPvdI7DFWy7ZlL8c0f2Tn17
 RtZ3eiIFayWc/mokYYx47q0g6+Y893JlMRUI83rhyg==
X-Google-Smtp-Source: ABdhPJynCWaK+LT9ICjcxzHwwuwQCjPpQl3/7JBL1kclfNriHwhwbMSzSqkJP8t42glvYDUaOq9tt7Xwqq3UMuuij9I=
X-Received: by 2002:a5d:4d91:: with SMTP id b17mr2434038wru.214.1639742974266; 
 Fri, 17 Dec 2021 04:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
 <BC1B38E7-1170-4C05-948A-D18E80AC49E7@jrtc27.com>
 <fd40010f-f2ec-b32a-6850-1e054af43725@canonical.com>
 <150C4E84-2C69-45DB-AF27-1E0C223D8D7A@jrtc27.com>
 <611d4055-c50c-55c1-0e02-43ffda66dbce@canonical.com>
In-Reply-To: <611d4055-c50c-55c1-0e02-43ffda66dbce@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Dec 2021 17:39:22 +0530
Message-ID: <CAAhSdy3CXJAieR3toyhQtk07CiCkUkmK7hB1DiQ5Wrd7JCqcmA@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_040936_375734_C84E25C1 
X-CRM114-Status: GOOD (  18.04  )
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

K0F0aXNoCgpPbiBGcmksIERlYyAxNywgMjAyMSBhdCA0OjEyIFBNIEhlaW5yaWNoIFNjaHVjaGFy
ZHQKPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24g
MTIvMTYvMjEgMTc6NTEsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+ID4gT24gMTYgRGVjIDIwMjEs
IGF0IDE0OjE3LCBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9u
aWNhbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTIvMTYvMjEgMTQ6NDksIEplc3NpY2EgQ2xh
cmtlIHdyb3RlOgo+ID4+PiBPbiAxNiBEZWMgMjAyMSwgYXQgMTI6MzUsIEhlaW5yaWNoIFNjaHVj
aGFyZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPj4+Pgo+
ID4+Pj4gVGhlIFNCSSAwLjEgc3BlY2lmaWNhdGlvbiBpcyBvYnNvbGV0ZS4gVGhlIGN1cnJlbnQg
dmVyc2lvbiBpcyAwLjMuCj4gPj4+PiBIZW5jZSB3ZSBzaG91bGQgbm90IHJlbHkgYnkgZGVmYXVs
dCBvbiBTQkkgMC4xIGJlaW5nIGltcGxlbWVudGVkLgo+ID4+PiBJdOKAmXMgd2hhdCBCQkwgaW1w
bGVtZW50cywgYW5kIHNvbWUgcGVvcGxlIGFyZSBzdGlsbCB1c2luZyBpdCwKPiA+Pj4gZXNwZWNp
YWxseSBnaXZlbiBlYXJseSBoYXJkd2FyZSBzaGlwcGVkIGJlZm9yZSBPcGVuU0JJIGdyZXcgaW4K
PiA+Pj4gcG9wdWxhcml0eS4KPiA+Pj4gSmVzcwo+ID4+Cj4gPj4gRG8geW91IG1lYW4gQkJMIGlz
IG5vdCBkZXZlbG9wZWQgYW55bW9yZT8KPiA+Pgo+ID4+IFNvbWUgcGVvcGxlIG1heSBzdGlsbCBi
ZSB1c2luZyBhIDAuMSBTQkkuIEJ1dCB0aGF0IG1pbm9yaXR5IHN0dWNrIG9uIGFuIG91dGRhdGVk
IHNvZnR3YXJlIHN0YWNrIGRvZXMgbm90IGp1c3RpZnkgZGVmYXVsdGluZyB0byBkZXByZWNhdGVk
IHNldHRpbmdzIGluIGZ1dHVyZSBMaW51eCByZWxlYXNlcy4KPiA+Cj4gPiBCQkwgaXMgc3RpbGwg
YWN0aXZlbHkgbWFpbnRhaW5lZDsgaXRzIG1vc3QgcmVjZW50IGNvbW1pdCB3YXMgMjQgZGF5cwo+
ID4gYWdvLiBBbHNvLCB0aGUgYW1vdW50IG9mIGNvZGUgQ09ORklHX1JJU0NWX1NCSV9WMDEgYWZm
ZWN0cyBpcyB0aW55LCBzbwo+ID4gSSBzZWUgbm8gdGFuZ2libGUgYmVuZWZpdCBmcm9tIG1ha2lu
ZyB0aGlzIGNoYW5nZSwganVzdCB1bm5lY2Vzc2FyeQo+ID4gYnJlYWthZ2Ugb2YgcGVyZmVjdGx5
IGZ1bmN0aW9uYWwgc3lzdGVtcy4KPgo+IE9ubHkgdGhlIGRlZmF1bHQgaXMgY2hhbmdlZC4gSG93
IGNvdWxkIHRoaXMgYnJlYWsgYW55IGV4aXN0aW5nIHN5c3RlbT8KPiBZb3UgY2FuIHN0aWxsIGNv
bXBpbGUgd2l0aCB0aGUgZGVwcmVjYXRlZCBzZXR0aW5nLgo+Cj4gSSBjYW4gbm90IHNlZSB3aHkg
d2Ugc2hvdWxkIGtlZXAgYSBkZWZhdWx0IHRoYXQgd2lsbCBjYXVzZSBpc3N1ZXMgb24KPiBzeXN0
ZW1zIGNvbXBseWluZyB0byB0aGUgY3VycmVudCBTQkkgc3BlY2lmaWNhdGlvbi4KCkkgYWdyZWUg
d2l0aCBIZWlucmljaC4KCkFsbW9zdCBhbGwgU0JJIGltcGxlbWVudGF0aW9ucyAoT3BlblNCSSwg
RURLMiwgS1ZNLCBYdmlzb3IsIGV0YykgYXJlCnByb3ZpZGluZyBhdCBsZWFzdCBTQkkgdjAuMiBh
bmQgd2UgY2FuJ3QgZW5kbGVzc2x5IHdhaXQgZm9yIEJCTCB0byBtb3ZlCmF3YXkgZnJvbSBTQkkg
djAuMS4gV2UgY2FuJ3QgdG90YWxseSByZW1vdmUgU0JJIHYwLjEgYnV0IHdlIHNob3VsZAphdCBs
ZWFzdCBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQuCgpTYW1lIHJhdGlvbmFsZSBhcHBsaWVzIHRvIHRo
ZSBzcGlud2FpdCBDUFUgb3BlcmF0aW9ucyB3aGljaCBhcmUgb25seQpyZXF1aXJlZCBmb3Igc3lz
dGVtcyB1c2luZyBCQkwuIFRoZSBzcGFyc2UgSEFSVCBpZCBzZXJpZXMgZnJvbSBBdGlzaApjYW4g
aW5jbHVkZSBhIHBhdGNoIHRvIGhhdmUgc3BpbndhaXQgQ1BVIG9wZXJhdGlvbnMgZGlzYWJsZWQg
YnkKZGVmYXVsdC4KCkBBdGlzaC9QYWxtZXIsIHdoYXQgZG8geW91IHRoaW5rID8KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
