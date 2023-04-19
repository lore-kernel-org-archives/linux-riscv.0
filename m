Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C5AC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F678Gk4sBWsgAZi5phK1Al6UJb0lymvci1ynP8dsLU8=; b=mVePbVzwN0ik+M
	flnyl4Z2a2B4sXC1509ZLofYhRsLmQOIBEuXWT8aSGxRqkz47gtbxrwawrbf47PwZCi8cr4ReOdcl
	ks9A/hLxMRh8JhEVEos+PL2QbsHOr+uz+acy8pwq0vug0H1VNebYGUDV0ko0jf5TgP1dwHfVJ2K54
	ouVq4Off1I/YlqlYGqOMSSGWvCM1zwvS0uaahc755Kd1zmc6Jg3bDEjgOvxBC9BZkeBw2WV0nRU4U
	ONbSBkDZ5H8Xha2a3gxDAf/24uSDsynjLGpuLt7Je+Uegx1AVIYRcmihftNke8lPo1mtKRS36DVzm
	6khwh0Hq7Z1zKY554vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppH7u-006dRq-2b;
	Wed, 19 Apr 2023 23:22:14 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppH7r-006dQL-2B
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 23:22:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-247122e9845so230857a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 16:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1681946531; x=1684538531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En09xFPrxukQPGMrtSxoWS7NIY2dUf28Hw9SmizN5E8=;
        b=gS2MMLbFXaic3E2igi5ue9CWwyEXnWQRGzKJ5oiJ2o2NNz/2gbNDIkxOI4YfEhZ0sV
         +Wi7JatdplmXdoabzjUOh2fazYKcndAZgN+dlrK95xWPAaotKWUHY9ehrqMgTIA0Wh1t
         ByBEmI0ASVpSTgXq8dXOaktN4gtTDYkpn2gmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681946531; x=1684538531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En09xFPrxukQPGMrtSxoWS7NIY2dUf28Hw9SmizN5E8=;
        b=MFcbO0NCooPZwOATHAe+nR74A2tpux/L+vjVJ3U/fL+KORGx7dj18Z79o4KPuBESJS
         x4o8d/RDalEMHMd5oKLTe6R7YZ5Su5HsGwdIMUYgkkkwUSso6+JILgOemRstnhe0vmqG
         WzSkbr+Mc8PtCSgnCeHUsvAi9mATp7+m4gyD6nrIrL/JpdVcCTU/GupFmMxKzhWEbFMx
         Gy8+FxBASG+NP2N2gGwIBbPv7pAFeMLlNLifRY4ZIO+oIP6tDkUQsPu/3k6jjCoauBZ4
         Q8/luKACrtIuWb8F9QgRflLO5TXhRnJKXXZPUu37qyf7ooaND9kIruw5CVEzp9X6jPyy
         rOCw==
X-Gm-Message-State: AAQBX9f6YGMKn7Vs3eTKtAzdbk954y9SUfQIVYL488kQXNTYb/KdtVTV
	4Ik1q45dzdQvcxcKGdhslH0rsUEtlm3diKCLsB1Q
X-Google-Smtp-Source: AKy350aChvSnivLcUF7wRVT9Tts2Lp5tgA2pMNS5kQFeqIKwNTpjWzEMnaCkhSSO++g8H5/BvYo3D96AB1h1z09XTJw=
X-Received: by 2002:a17:90b:4c8e:b0:23f:9448:89c2 with SMTP id
 my14-20020a17090b4c8e00b0023f944889c2mr4380591pjb.7.1681946530740; Wed, 19
 Apr 2023 16:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
 <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com> <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
 <CAP-5=fUYJEecmhQVuvbM4ZoDP_Hj=2RKOgR4cKepU072Uy3xyw@mail.gmail.com>
 <CAOnJCULJfSN79MzAwhCrbVzG1rYyrPB3OraFmoZFBxuRCwq01w@mail.gmail.com>
 <CAHVXubjhORBEDok_Zhq5p_Yv4Ty4Hct84dWJZXzo48+40N=CGg@mail.gmail.com> <CAP-5=fX6kaZt68UbMMZzW-zs0RyRWoOS-Tq5NwekWj8k9Shx6g@mail.gmail.com>
In-Reply-To: <CAP-5=fX6kaZt68UbMMZzW-zs0RyRWoOS-Tq5NwekWj8k9Shx6g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 20 Apr 2023 04:51:58 +0530
Message-ID: <CAOnJCU+5EQp-AqrwJpBo6ZPWfybwaGyD3zcC0YrCAsSY4=fqdw@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, paranlee <p4ranlee@gmail.com>, 
	David Laight <David.Laight@aculab.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_162211_722019_2B98B269 
X-CRM114-Status: GOOD (  54.44  )
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

T24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMTE6MTPigK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMjoyMeKAr0FNIEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkg
SWFuLAo+ID4KPiA+IE9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0IDEwOjMw4oCvUE0gQXRpc2ggUGF0
cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFR1ZSwgQXBy
IDE4LCAyMDIzIGF0IDExOjQ24oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3
cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0IDk6NDPigK9BTSBB
dGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBPbiBGcmksIEFwciAxNCwgMjAyMyBhdCAyOjQw4oCvQU0gRGF2aWQgTGFpZ2h0IDxEYXZp
ZC5MYWlnaHRAYWN1bGFiLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEZyb206
IEF0aXNoIFBhdHJhCj4gPiA+ID4gPiA+ID4gU2VudDogMTMgQXByaWwgMjAyMyAyMDoxOAo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgOTo0N+KAr1BN
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gcmlzY3YgdXNlZCB0byBhbGxvdyBkaXJlY3QgYWNjZXNz
IHRvIGN5Y2xlL3RpbWUvaW5zdHJldCBjb3VudGVycywKPiA+ID4gPiA+ID4gPiA+IGJ5cGFzc2lu
ZyB0aGUgcGVyZiBmcmFtZXdvcmssIHRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBhbGxvdyB0aGUg
dXNlciB0bwo+ID4gPiA+ID4gPiA+ID4gbW1hcCBhbnkgY291bnRlciB3aGVuIGFjY2Vzc2VkIHRo
cm91Z2ggcGVyZi4gQnV0IHdlIGNhbid0IGJyZWFrIHRoZQo+ID4gPiA+ID4gPiA+ID4gZXhpc3Rp
bmcgYmVoYXZpb3VyIHNvIHdlIGludHJvZHVjZSBhIHN5c2N0bCBwZXJmX3VzZXJfYWNjZXNzIGxp
a2UgYXJtNjQKPiA+ID4gPiA+ID4gPiA+IGRvZXMsIHdoaWNoIGRlZmF1bHRzIHRvIHRoZSBsZWdh
Y3kgbW9kZSBkZXNjcmliZWQgYWJvdmUuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gSXQgd291bGQgYmUgZ29vZCBwcm92aWRlIGFkZGl0aW9uYWwgZGlyZWN0aW9u
IGZvciB1c2VyIHNwYWNlIHBhY2thZ2VzOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhl
IGxlZ2FjeSBiZWhhdmlvciBpcyBzdXBwb3J0ZWQgZm9yIG5vdyBpbiBvcmRlciB0byBhdm9pZCBi
cmVha2luZwo+ID4gPiA+ID4gPiA+IGV4aXN0aW5nIHNvZnR3YXJlLgo+ID4gPiA+ID4gPiA+IEhv
d2V2ZXIsIHJlYWRpbmcgY291bnRlcnMgZGlyZWN0bHkgd2l0aG91dCBwZXJmIGludGVyYWN0aW9u
IG1heQo+ID4gPiA+ID4gPiA+IHByb3ZpZGUgaW5jb3JyZWN0IHZhbHVlcyB3aGljaAo+ID4gPiA+
ID4gPiA+IHRoZSB1c2Vyc3BhY2Ugc29mdHdhcmUgbXVzdCBhdm9pZC4gV2UgYXJlIGhvcGluZyB0
aGF0IHRoZSB1c2VyIHNwYWNlCj4gPiA+ID4gPiA+ID4gcGFja2FnZXMgd2hpY2gKPiA+ID4gPiA+
ID4gPiByZWFkIHRoZSBjeWNsZS9pbnN0cmV0IGRpcmVjdGx5LCB3aWxsIG1vdmUgdG8gdGhlIHBy
b3BlciBpbnRlcmZhY2UKPiA+ID4gPiA+ID4gPiBldmVudHVhbGx5IGlmIHRoZXkgYWN0dWFsbHkg
bmVlZCBpdC4KPiA+ID4gPiA+ID4gPiBNb3N0IG9mIHRoZSB1c2VycyBhcmUgc3VwcG9zZWQgdG8g
cmVhZCAidGltZSIgaW5zdGVhZCBvZiAiY3ljbGUiIGlmCj4gPiA+ID4gPiA+ID4gdGhleSBpbnRl
bmQgdG8gcmVhZCB0aW1lc3RhbXBzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJZiB5b3UgYXJl
IHRyeWluZyB0byBtZWFzdXJlIHRoZSBwZXJmb3JtYW5jZSBvZiBzaG9ydCBjb2RlCj4gPiA+ID4g
PiA+IGZyYWdtZW50cyB0aGVuIHlvdSBuZWVkIHByZXR0eSBtdWNoIHJhdyBhY2Nlc3MgZGlyZWN0
bHkgdG8KPiA+ID4gPiA+ID4gdGhlIGN5Y2xlL2Nsb2NrIGNvdW50IHJlZ2lzdGVyLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBJJ3ZlIGRvbmUgdGhpcyBvbiB4ODYgdG8gY29tcGFyZSB0aGUgYWN0
dWFsIGN5Y2xlIHRpbWVzCj4gPiA+ID4gPiA+IG9mIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMg
b2YgdGhlIElQIGNoZWNrc3VtIGxvb3AKPiA+ID4gPiA+ID4gKGFuZCBjb21wYXJlIHRoZW0gdG8g
dGhlIHRoZW9yZXRpY2FsIGxpbWl0KS4KPiA+ID4gPiA+ID4gVGhlIHBlcmYgZnJhbWV3b3JrIGp1
c3QgYWRkZWQgZmFyIHRvbyBtdWNoIGxhdGVuY3ksCj4gPiA+ID4gPiA+IG9ubHkgZGlyZWN0bHkg
cmVhZGluZyB0aGUgY3B1IHJlZ2lzdGVycyBnYXZlIGFueXRoaW5nCj4gPiA+ID4gPiA+IGxpa2Ug
cmVsaWFibGUgKGFuZCBjb25zaXN0ZW50KSBhbnN3ZXJzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRoaXMgc2VyaWVzIGFsbG93cyBkaXJlY3QgYWNjZXNzIHRvIHRoZSBjb3VudGVy
cyBvbmNlIGNvbmZpZ3VyZWQKPiA+ID4gPiA+IHRocm91Z2ggdGhlIHBlcmYuCj4gPiA+ID4gPiBF
YXJsaWVyIHRoZSBjeWNsZS9pbnN0cmV0IGNvdW50ZXJzIGFyZSBkaXJlY3RseSBleHBvc2VkIHRv
IHRoZQo+ID4gPiA+ID4gdXNlcnNwYWNlIHdpdGhvdXQga2VybmVsL3BlcmYgZnJhbWV3b3JraW5n
IGtub3dpbmcKPiA+ID4gPiA+IHdoZW4vd2hpY2ggdXNlciBzcGFjZSBhcHBsaWNhdGlvbiBpcyBy
ZWFkaW5nIGl0LiBUaGF0IGhhcyBzZWN1cml0eSBpbXBsaWNhdGlvbnMuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gV2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkLCB0aGUgdXNlciBzcGFjZSBhcHBsaWNhdGlv
biBqdXN0IG5lZWRzIHRvCj4gPiA+ID4gPiBjb25maWd1cmUgdGhlIGV2ZW50IChjeWNsZS9pbnN0
cmV0KSB0aHJvdWdoIHBlcmYgc3lzY2FsbC4KPiA+ID4gPiA+IE9uY2UgY29uZmlndXJlZCwgdGhl
IHVzZXJzcGFjZSBhcHBsaWNhdGlvbiBjYW4gZmluZCBvdXQgdGhlIGNvdW50ZXIKPiA+ID4gPiA+
IGluZm9ybWF0aW9uIGZyb20gdGhlIG1tYXAgJiBkaXJlY3RseQo+ID4gPiA+ID4gcmVhZCB0aGUg
Y291bnRlci4gVGhlcmUgaXMgbm8gbGF0ZW5jeSB3aGlsZSByZWFkaW5nIHRoZSBjb3VudGVycy4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIG1lY2hhbmlzbSBhbGxvd3Mgc3RvcC9jbGVhciB0aGUg
Y291bnRlcnMgd2hlbiB0aGUgcmVxdWVzdGluZyB0YXNrCj4gPiA+ID4gPiBpcyBub3QgcnVubmlu
Zy4gSXQgYWxzbyB0YWtlcyBjYXJlIG9mIGNvbnRleHQgc3dpdGNoaW5nCj4gPiA+ID4gPiB3aGlj
aCBtYXkgcmVzdWx0IGluIGludmFsaWQgdmFsdWVzIGFzIHlvdSBtZW50aW9uZWQgYmVsb3cuIFRo
aXMgaXMKPiA+ID4gPiA+IG5vdGhpbmcgbmV3IGFuZCBhbGwgb3RoZXIgYXJjaCAoeDg2LCBBUk02
NCkgYWxsb3cgdXNlciBzcGFjZQo+ID4gPiA+ID4gY291bnRlciByZWFkIHRocm91Z2ggdGhlIHNh
bWUgbWVjaGFuaXNtLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhlcmUgaXMgdGhlIHJlbGV2YW50IHVw
c3RyZWFtIGRpc2N1c3Npb246Cj4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
L1k3d0xhN0kyaGx6M3JLdyUyRkBoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0L1QvCj4g
PiA+ID4gPgo+ID4gPiA+ID4gQVJNNjQ6Cj4gPiA+ID4gPiBodHRwczovL2RvY3Mua2VybmVsLm9y
Zy9hcm02NC9wZXJmLmh0bWw/aGlnaGxpZ2h0PXBlcmZfdXNlcl9hY2Nlc3MjcGVyZi11c2Vyc3Bh
Y2UtcG11LWhhcmR3YXJlLWNvdW50ZXItYWNjZXNzCj4gPiA+ID4gPgo+ID4gPiA+ID4gZXhhbXBs
ZSB1c2FnZSBpbiB4ODY6Cj4gPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vYW5kaWtsZWVuL3Bt
dS10b29scy9ibG9iL21hc3Rlci9qZXZlbnRzL3JkcG1jLmMKPiA+ID4gPgo+ID4gPiA+IFRoZSBj
YW5vbmljYWwgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBzaG91bGQgYmU6Cj4gPiA+ID4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L3RyZWUvdG9vbHMvbGliL3BlcmYvbW1hcC5jI240MDAKPiA+ID4KPiA+ID4gVGhhbmtzIGZv
ciBzaGFyaW5nIHRoZSBsaWJwZXJmIGltcGxlbWVudGF0aW9uLgo+ID4gPgo+ID4gPiA+IHdoaWNo
IGlzIHVwZGF0ZWQgaW4gdGhlc2UgcGF0Y2hlcyBidXQgdGhlIHRlc3RzIGFyZSBub3Q6Cj4gPiA+
ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMjbjI4Nwo+ID4g
PiA+IFdoaWNoIGFwcGVhcnMgdG8gYmUgYW4gb3ZlcnNpZ2h0LiBUaGUgdGVzdHMgZGlzcGxheSBz
b21lIGRpZmZlcmVuY2VzCj4gPiA+Cj4gPiA+IFllcy4gSXQncyBhbiBvdmVyc2lnaHQuIFdlIHNo
b3VsZCBtYWtlIHN1cmUgdGhhdCBwZXJmIG1tYXAgdGVzdHMgcGFzcwo+ID4gPiBmb3IgUklTQy1W
IGFzIHdlbGwuCj4gPgo+ID4gWWVzLCB0aGF0J3MgYW4gb3ZlcnNpZ2h0LCBJIGhhZCBhIGxvY2Fs
IHRlc3QgYWRhcHRlZCBmcm9tIHRoaXMgb25lIGJ1dAo+ID4gZm9yZ290IHRvIHVwZGF0ZSBpdCBh
ZnRlcndhcmRzLCBJJ2xsIGRvIHRoYXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KPiA+Cj4gPiBUaGFu
a3MgZm9yIHlvdXIgcXVpY2sgZmVlZGJhY2tzIGFuZCBzb3JyeSBmb3IgYmVpbmcgbGF0ZSwKPiA+
Cj4gPiBBbGV4Cj4KPiBUaGFua3MgQWxleCwgdGhlcmUgd2FzIGFuIGVxdWFsbHkgbGlrZWx5IGNo
YW5jZSB0aGF0IEkgd2Fzbid0Cj4gdW5kZXJzdGFuZGluZyB0aGluZ3MgOi0pIElzIHRoZXJlIGFu
eSBpbmZvcm1hdGlvbiBvbiBSSVNDLVYgUE1VCj4gdGVzdGluZz8gSSBrbm93IFBhcmFuTGVlIGlz
IGludGVyZXN0ZWQuIEl0J2QgYmUgYXdlc29tZSB0byBoYXZlCgpBcmUgeW91IGxvb2tpbmcgZm9y
IHNvbWV0aGluZyBzcGVjaWZpYyB0byBSSVNDLVYgZ2VuZXJhbCBvciBwZXJmIG9uIFJJU0MtVj8K
QWxsIHRoZSBSSVNDLVYgUE1VIHBhdGNoZXMgaGF2ZSBiZWVuIHVwc3RyZWFtIGZvciBhIHdoaWxl
IChib3RoIGluIHRoZQpRZW11ICYgTGludXgga2VybmVsKS4KUGVyZiBzaG91bGQgd29yayBvdXQt
b2YtdGhlIGJveCB3aGVuIHlvdSBib290IHRoZSBsYXRlc3Qga2VybmVsIGluIHRoZQpsYXRlc3Qg
dmVyc2lvbiBvZiB0aGUgUWVtdS4KCkluaXRpYWwgS1ZNWzFdIHBhdGNoZXMgc3VwcG9ydCBnb3Qg
bWVyZ2VkIGR1cmluZyB0aGUgbGFzdCBtZXJnZQp3aW5kb3cuIEl0IGRvZXNuJ3Qgc3VwcG9ydApl
dmVudCBzYW1wbGluZyB5ZXQuIFdlIGFyZSB3b3JraW5nIG9uIHRoYXQuCgpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDIwNzA5NTUyOS4xNzg3MjYwLTEtYXRpc2hwQHJpdm9z
aW5jLmNvbS8KCj4gc29tZXRoaW5nIHNheSBvbjoKPiBodHRwczovL3BlcmYud2lraS5rZXJuZWwu
b3JnL2luZGV4LnBocC9NYWluX1BhZ2UKPiBvbiBob3cgdG8gcnVuIHRlc3RzLCBwZXJoYXBzIG9u
IFFFTVUgb3Iga25vd24gdG8gd29yayBib2FyZHMuIFdlIGNhbgo+IGFsc28ganVzdCBkcm9wIGEg
bGluayBvbiB0aGVyZSBpZiB0aGVyZSBpcyBpbmZvcm1hdGlvbi4gV2UgY2FuIGFsc28KPiBhZGQg
dGhlIFJJU0MtViBQTVUgaW5mb3JtYXRpb24gdG8gdGhlIGxpbmtzIGhlcmU6Cj4gaHR0cHM6Ly9w
ZXJmLndpa2kua2VybmVsLm9yZy9pbmRleC5waHAvVXNlZnVsX0xpbmtzCj4KCkkgZGlkIG5vdCBz
ZWUgYW55IGFyY2ggc3BlY2lmaWMgaW5mb3JtYXRpb24gdGhlcmUuIExldCB1cyBrbm93IHdoYXQK
d291bGQgYmUgZ29vZCB0bwphZGQgdGhlcmUgYW5kIHdlIHdvdWxkIGJlIGhhcHB5IHRvIGFkZC4K
Cj4gVGhhbmtzLAo+IElhbgo+Cj4gPgo+ID4gPgo+ID4gPgo+ID4gPiA+IGJldHdlZW4geDg2IGFu
ZCBhYXJjaDY0IHRoYXQgaGF2ZSBhc3N1bWVkIHVzZXJzcGFjZSBoYXJkd2FyZSBjb3VudGVyCj4g
PiA+ID4gYWNjZXNzLCBhbmQgZXZlcnl0aGluZyBlbHNlIHRoYXQgaXQgaXMgYXNzdW1lZCBkb24n
dC4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiBJYW4KPiA+ID4gPgo+ID4gPiA+ID4g
PiBDbGVhcmx5IHByb2Nlc3Mgc3dpdGNoZXMgKGVzcGVjaWFsbHkgY3B1IG1pZ3JhdGlvbnMpIGNh
dXNlCj4gPiA+ID4gPiA+IHByb2JsZW1zLCBidXQgdGhleSBhcmUgb2J2aW91c2x5IGludmFsaWQg
dmFsdWVzIGFuZCBjYW4KPiA+ID4gPiA+ID4gYmUgaWdub3JlZC4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gU28gd2hpbGUgYSBsb3Qgb2YgdXNlcyBtYXkgYmUgJ2hhcHB5JyB3aXRoIHRoZSB2YWx1
ZXMgdGhlCj4gPiA+ID4gPiA+IHBlcmYgZnJhbWV3b3JrIGdpdmVzLCBzb21ldGltZXMgeW91IGRv
IG5lZWQgdG8gZGlyZWN0bHkKPiA+ID4gPiA+ID4gcmVhZCB0aGUgcmVsZXZhbnQgcmVnaXN0ZXJz
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgICAgICAgIERhdmlkCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IC0KPiA+ID4gPiA+ID4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLCj4gPiA+ID4gPiA+
IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiA+IEF0aXNoCj4g
PiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IFJlZ2FyZHMsCj4gPiA+IEF0aXNoCgoKCi0t
IApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
