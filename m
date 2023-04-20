Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF35CC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 00:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Er7Pjzfxd36L9iMHtMaOa7Z4v6NAHzCuCEjSR50GBc=; b=1BINndqAs9zKTv
	zoXFBMq+NGH+DEBneBTo2n1qRr3i/hgwwU1iSVcKiGYn5OWFUlRRpllxAlJWNpHoyue5egJ6iNuHM
	69f4k/AzkyALRGc6fCxRXcS1Mz8dxcZW34RlhBSsRGY2G6L0IapZtgu7i3eruryYOPBSUvpaa1DOu
	CMVVwtzKILC8UQHwpyflWcz2/XpciwuGMU5mzVp3HqQQglUSGNCJTTpoWhtViZsZ1ub1RRCHLHQvK
	KxTGVAR+K/TbUR1erPiJsh7n66+h53+irmOUwdlADVJja+Cvpa7OU2IkTmdXGv1g8nVVFZ0RXxCWU
	06Op3OLNECZ61HpIB5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppIDf-006jTJ-2d;
	Thu, 20 Apr 2023 00:32:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppIDb-006jQu-1q
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 00:32:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f048b144eeso171405e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 17:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681950727; x=1684542727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpHsbQZOI2szya5getePPbZFizdtNLAvh8GmFlwAN1M=;
        b=ysPLUsQMbedXCyQYZr6Zc+fSt8NWoLdVDcqcVZDHhCrCDaB2sk6rhO14ftB7Jzggai
         cVizcqRRor6XZZATBcC+Q5hAviYJW6j84oNJYMS9tlWqa54/Pl+veZlWD37xLZk3abmk
         gpO4AFFVZuCznXvk946oY0x/ygmv4NsGux2cbs+vd0xuZ8EljM6IzQUd37HOvFZcJ2i0
         5S3EnekxS0JmeXrrTdh0WIw/79II6znLakNv9k9n/OvrhR9O18k2UGFvYZ4gT9wZDVhW
         StRsYpOeMeYj+Yv0Th1ngB3fz+qDAknM0kw1O7NtNRq99eyDTfj4vP12sDUbhJl+foEI
         ep0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681950727; x=1684542727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpHsbQZOI2szya5getePPbZFizdtNLAvh8GmFlwAN1M=;
        b=b8soeKOvI4gqEIxIGfrc4GasYKMsjFN1Er0x877PCMcGaBaPMrMsBbu+a4kE7ocRy1
         3/vncoLVVUfOjRe2dWOlMZQcbGLTLiCMaQ0GPolzVYH4afXjGtxEEH6lk9HXIA1sKe12
         BSgRqELr6JB161wuDMbi+ERHmYwCSKcVJNeKkEV++ARDG8/xNSr/aDw7R6K1CjTxsqSk
         +hbIn2PUm72rZlLNcqnOlXQpcX3TgTuQvBI2DGduzjDY+j54btPBGLpVZqD6P4deLMxH
         s5wMX8tJlJDgXlWS3OtPughJTBVW1uXymeYnsPn2x55AyqG/W0gqOV5kSqbyYsbUxqF4
         geDg==
X-Gm-Message-State: AAQBX9dt8/GGZzf067zM9Mskjx8RdmFiFEzsEY8oZWfhfWwp69Cg523o
	CZkSWoJ5UYXMKaWB6Na+Tcxq4Gf4iES2SlESCRAwkA==
X-Google-Smtp-Source: AKy350aBel/7MtmlYCMSjJPTLJNrhcBDWM1l1EErpsirii/9U3cgHvYfQURMqtj3yNFdf/eUjBr+4QIODnFlFBR70+I=
X-Received: by 2002:a05:600c:314c:b0:3f1:7490:e5a4 with SMTP id
 h12-20020a05600c314c00b003f17490e5a4mr90071wmo.6.1681950726866; Wed, 19 Apr
 2023 17:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
 <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com> <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
 <CAP-5=fUYJEecmhQVuvbM4ZoDP_Hj=2RKOgR4cKepU072Uy3xyw@mail.gmail.com>
 <CAOnJCULJfSN79MzAwhCrbVzG1rYyrPB3OraFmoZFBxuRCwq01w@mail.gmail.com>
 <CAHVXubjhORBEDok_Zhq5p_Yv4Ty4Hct84dWJZXzo48+40N=CGg@mail.gmail.com>
 <CAP-5=fX6kaZt68UbMMZzW-zs0RyRWoOS-Tq5NwekWj8k9Shx6g@mail.gmail.com> <CAOnJCU+5EQp-AqrwJpBo6ZPWfybwaGyD3zcC0YrCAsSY4=fqdw@mail.gmail.com>
In-Reply-To: <CAOnJCU+5EQp-AqrwJpBo6ZPWfybwaGyD3zcC0YrCAsSY4=fqdw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 19 Apr 2023 17:31:50 -0700
Message-ID: <CAP-5=fUrTSXZwR2rV34AXbNCYcV1wnFyfzhNuRgBLXofsjnE_g@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Atish Patra <atishp@atishpatra.org>
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
X-CRM114-CacheID: sfid-20230419_173211_618411_CE77A974 
X-CRM114-Status: GOOD (  59.16  )
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

T24gV2VkLCBBcHIgMTksIDIwMjMgYXQgNDoyMuKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRp
c2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMTE6MTPigK9Q
TSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
QXByIDE5LCAyMDIzIGF0IDI6MjHigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBJYW4sCj4gPiA+Cj4gPiA+IE9uIFR1ZSwg
QXByIDE4LCAyMDIzIGF0IDEwOjMw4oCvUE0gQXRpc2ggUGF0cmEgPGF0aXNocEBhdGlzaHBhdHJh
Lm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIEFwciAxOCwgMjAyMyBhdCAxMTo0
NuKAr1BNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gT24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgOTo0M+KAr0FNIEF0aXNoIFBhdHJhIDxh
dGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBG
cmksIEFwciAxNCwgMjAyMyBhdCAyOjQw4oCvQU0gRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRA
YWN1bGFiLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBGcm9tOiBBdGlz
aCBQYXRyYQo+ID4gPiA+ID4gPiA+ID4gU2VudDogMTMgQXByaWwgMjAyMyAyMDoxOAo+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9uIFRodSwgQXByIDEzLCAyMDIzIGF0IDk6NDfigK9Q
TSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiByaXNjdiB1c2VkIHRvIGFsbG93IGRpcmVjdCBh
Y2Nlc3MgdG8gY3ljbGUvdGltZS9pbnN0cmV0IGNvdW50ZXJzLAo+ID4gPiA+ID4gPiA+ID4gPiBi
eXBhc3NpbmcgdGhlIHBlcmYgZnJhbWV3b3JrLCB0aGlzIHBhdGNoc2V0IGludGVuZHMgdG8gYWxs
b3cgdGhlIHVzZXIgdG8KPiA+ID4gPiA+ID4gPiA+ID4gbW1hcCBhbnkgY291bnRlciB3aGVuIGFj
Y2Vzc2VkIHRocm91Z2ggcGVyZi4gQnV0IHdlIGNhbid0IGJyZWFrIHRoZQo+ID4gPiA+ID4gPiA+
ID4gPiBleGlzdGluZyBiZWhhdmlvdXIgc28gd2UgaW50cm9kdWNlIGEgc3lzY3RsIHBlcmZfdXNl
cl9hY2Nlc3MgbGlrZSBhcm02NAo+ID4gPiA+ID4gPiA+ID4gPiBkb2VzLCB3aGljaCBkZWZhdWx0
cyB0byB0aGUgbGVnYWN5IG1vZGUgZGVzY3JpYmVkIGFib3ZlLgo+ID4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEl0IHdvdWxkIGJlIGdvb2QgcHJvdmlkZSBh
ZGRpdGlvbmFsIGRpcmVjdGlvbiBmb3IgdXNlciBzcGFjZSBwYWNrYWdlczoKPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGUgbGVnYWN5IGJlaGF2aW9yIGlzIHN1cHBvcnRlZCBmb3Ig
bm93IGluIG9yZGVyIHRvIGF2b2lkIGJyZWFraW5nCj4gPiA+ID4gPiA+ID4gPiBleGlzdGluZyBz
b2Z0d2FyZS4KPiA+ID4gPiA+ID4gPiA+IEhvd2V2ZXIsIHJlYWRpbmcgY291bnRlcnMgZGlyZWN0
bHkgd2l0aG91dCBwZXJmIGludGVyYWN0aW9uIG1heQo+ID4gPiA+ID4gPiA+ID4gcHJvdmlkZSBp
bmNvcnJlY3QgdmFsdWVzIHdoaWNoCj4gPiA+ID4gPiA+ID4gPiB0aGUgdXNlcnNwYWNlIHNvZnR3
YXJlIG11c3QgYXZvaWQuIFdlIGFyZSBob3BpbmcgdGhhdCB0aGUgdXNlciBzcGFjZQo+ID4gPiA+
ID4gPiA+ID4gcGFja2FnZXMgd2hpY2gKPiA+ID4gPiA+ID4gPiA+IHJlYWQgdGhlIGN5Y2xlL2lu
c3RyZXQgZGlyZWN0bHksIHdpbGwgbW92ZSB0byB0aGUgcHJvcGVyIGludGVyZmFjZQo+ID4gPiA+
ID4gPiA+ID4gZXZlbnR1YWxseSBpZiB0aGV5IGFjdHVhbGx5IG5lZWQgaXQuCj4gPiA+ID4gPiA+
ID4gPiBNb3N0IG9mIHRoZSB1c2VycyBhcmUgc3VwcG9zZWQgdG8gcmVhZCAidGltZSIgaW5zdGVh
ZCBvZiAiY3ljbGUiIGlmCj4gPiA+ID4gPiA+ID4gPiB0aGV5IGludGVuZCB0byByZWFkIHRpbWVz
dGFtcHMuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJZiB5b3UgYXJlIHRyeWluZyB0byBt
ZWFzdXJlIHRoZSBwZXJmb3JtYW5jZSBvZiBzaG9ydCBjb2RlCj4gPiA+ID4gPiA+ID4gZnJhZ21l
bnRzIHRoZW4geW91IG5lZWQgcHJldHR5IG11Y2ggcmF3IGFjY2VzcyBkaXJlY3RseSB0bwo+ID4g
PiA+ID4gPiA+IHRoZSBjeWNsZS9jbG9jayBjb3VudCByZWdpc3Rlci4KPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IEkndmUgZG9uZSB0aGlzIG9uIHg4NiB0byBjb21wYXJlIHRoZSBhY3R1YWwg
Y3ljbGUgdGltZXMKPiA+ID4gPiA+ID4gPiBvZiBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25zIG9m
IHRoZSBJUCBjaGVja3N1bSBsb29wCj4gPiA+ID4gPiA+ID4gKGFuZCBjb21wYXJlIHRoZW0gdG8g
dGhlIHRoZW9yZXRpY2FsIGxpbWl0KS4KPiA+ID4gPiA+ID4gPiBUaGUgcGVyZiBmcmFtZXdvcmsg
anVzdCBhZGRlZCBmYXIgdG9vIG11Y2ggbGF0ZW5jeSwKPiA+ID4gPiA+ID4gPiBvbmx5IGRpcmVj
dGx5IHJlYWRpbmcgdGhlIGNwdSByZWdpc3RlcnMgZ2F2ZSBhbnl0aGluZwo+ID4gPiA+ID4gPiA+
IGxpa2UgcmVsaWFibGUgKGFuZCBjb25zaXN0ZW50KSBhbnN3ZXJzLgo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgc2VyaWVzIGFsbG93cyBkaXJlY3QgYWNjZXNzIHRv
IHRoZSBjb3VudGVycyBvbmNlIGNvbmZpZ3VyZWQKPiA+ID4gPiA+ID4gdGhyb3VnaCB0aGUgcGVy
Zi4KPiA+ID4gPiA+ID4gRWFybGllciB0aGUgY3ljbGUvaW5zdHJldCBjb3VudGVycyBhcmUgZGly
ZWN0bHkgZXhwb3NlZCB0byB0aGUKPiA+ID4gPiA+ID4gdXNlcnNwYWNlIHdpdGhvdXQga2VybmVs
L3BlcmYgZnJhbWV3b3JraW5nIGtub3dpbmcKPiA+ID4gPiA+ID4gd2hlbi93aGljaCB1c2VyIHNw
YWNlIGFwcGxpY2F0aW9uIGlzIHJlYWRpbmcgaXQuIFRoYXQgaGFzIHNlY3VyaXR5IGltcGxpY2F0
aW9ucy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkLCB0
aGUgdXNlciBzcGFjZSBhcHBsaWNhdGlvbiBqdXN0IG5lZWRzIHRvCj4gPiA+ID4gPiA+IGNvbmZp
Z3VyZSB0aGUgZXZlbnQgKGN5Y2xlL2luc3RyZXQpIHRocm91Z2ggcGVyZiBzeXNjYWxsLgo+ID4g
PiA+ID4gPiBPbmNlIGNvbmZpZ3VyZWQsIHRoZSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gY2FuIGZp
bmQgb3V0IHRoZSBjb3VudGVyCj4gPiA+ID4gPiA+IGluZm9ybWF0aW9uIGZyb20gdGhlIG1tYXAg
JiBkaXJlY3RseQo+ID4gPiA+ID4gPiByZWFkIHRoZSBjb3VudGVyLiBUaGVyZSBpcyBubyBsYXRl
bmN5IHdoaWxlIHJlYWRpbmcgdGhlIGNvdW50ZXJzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBU
aGlzIG1lY2hhbmlzbSBhbGxvd3Mgc3RvcC9jbGVhciB0aGUgY291bnRlcnMgd2hlbiB0aGUgcmVx
dWVzdGluZyB0YXNrCj4gPiA+ID4gPiA+IGlzIG5vdCBydW5uaW5nLiBJdCBhbHNvIHRha2VzIGNh
cmUgb2YgY29udGV4dCBzd2l0Y2hpbmcKPiA+ID4gPiA+ID4gd2hpY2ggbWF5IHJlc3VsdCBpbiBp
bnZhbGlkIHZhbHVlcyBhcyB5b3UgbWVudGlvbmVkIGJlbG93LiBUaGlzIGlzCj4gPiA+ID4gPiA+
IG5vdGhpbmcgbmV3IGFuZCBhbGwgb3RoZXIgYXJjaCAoeDg2LCBBUk02NCkgYWxsb3cgdXNlciBz
cGFjZQo+ID4gPiA+ID4gPiBjb3VudGVyIHJlYWQgdGhyb3VnaCB0aGUgc2FtZSBtZWNoYW5pc20u
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhlcmUgaXMgdGhlIHJlbGV2YW50IHVwc3RyZWFtIGRp
c2N1c3Npb246Cj4gPiA+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWTd3TGE3
STJobHozckt3JTJGQGhpcmV6LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvVC8KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gQVJNNjQ6Cj4gPiA+ID4gPiA+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3Jn
L2FybTY0L3BlcmYuaHRtbD9oaWdobGlnaHQ9cGVyZl91c2VyX2FjY2VzcyNwZXJmLXVzZXJzcGFj
ZS1wbXUtaGFyZHdhcmUtY291bnRlci1hY2Nlc3MKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZXhh
bXBsZSB1c2FnZSBpbiB4ODY6Cj4gPiA+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbmRpa2xl
ZW4vcG11LXRvb2xzL2Jsb2IvbWFzdGVyL2pldmVudHMvcmRwbWMuYwo+ID4gPiA+ID4KPiA+ID4g
PiA+IFRoZSBjYW5vbmljYWwgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBzaG91bGQgYmU6Cj4gPiA+
ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS90b29scy9saWIvcGVyZi9tbWFwLmMjbjQwMAo+ID4gPiA+Cj4g
PiA+ID4gVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBsaWJwZXJmIGltcGxlbWVudGF0aW9uLgo+ID4g
PiA+Cj4gPiA+ID4gPiB3aGljaCBpcyB1cGRhdGVkIGluIHRoZXNlIHBhdGNoZXMgYnV0IHRoZSB0
ZXN0cyBhcmUgbm90Ogo+ID4gPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvdG9vbHMvcGVyZi90ZXN0cy9t
bWFwLWJhc2ljLmMjbjI4Nwo+ID4gPiA+ID4gV2hpY2ggYXBwZWFycyB0byBiZSBhbiBvdmVyc2ln
aHQuIFRoZSB0ZXN0cyBkaXNwbGF5IHNvbWUgZGlmZmVyZW5jZXMKPiA+ID4gPgo+ID4gPiA+IFll
cy4gSXQncyBhbiBvdmVyc2lnaHQuIFdlIHNob3VsZCBtYWtlIHN1cmUgdGhhdCBwZXJmIG1tYXAg
dGVzdHMgcGFzcwo+ID4gPiA+IGZvciBSSVNDLVYgYXMgd2VsbC4KPiA+ID4KPiA+ID4gWWVzLCB0
aGF0J3MgYW4gb3ZlcnNpZ2h0LCBJIGhhZCBhIGxvY2FsIHRlc3QgYWRhcHRlZCBmcm9tIHRoaXMg
b25lIGJ1dAo+ID4gPiBmb3Jnb3QgdG8gdXBkYXRlIGl0IGFmdGVyd2FyZHMsIEknbGwgZG8gdGhh
dCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcXVpY2sg
ZmVlZGJhY2tzIGFuZCBzb3JyeSBmb3IgYmVpbmcgbGF0ZSwKPiA+ID4KPiA+ID4gQWxleAo+ID4K
PiA+IFRoYW5rcyBBbGV4LCB0aGVyZSB3YXMgYW4gZXF1YWxseSBsaWtlbHkgY2hhbmNlIHRoYXQg
SSB3YXNuJ3QKPiA+IHVuZGVyc3RhbmRpbmcgdGhpbmdzIDotKSBJcyB0aGVyZSBhbnkgaW5mb3Jt
YXRpb24gb24gUklTQy1WIFBNVQo+ID4gdGVzdGluZz8gSSBrbm93IFBhcmFuTGVlIGlzIGludGVy
ZXN0ZWQuIEl0J2QgYmUgYXdlc29tZSB0byBoYXZlCj4KPiBBcmUgeW91IGxvb2tpbmcgZm9yIHNv
bWV0aGluZyBzcGVjaWZpYyB0byBSSVNDLVYgZ2VuZXJhbCBvciBwZXJmIG9uIFJJU0MtVj8KPiBB
bGwgdGhlIFJJU0MtViBQTVUgcGF0Y2hlcyBoYXZlIGJlZW4gdXBzdHJlYW0gZm9yIGEgd2hpbGUg
KGJvdGggaW4gdGhlCj4gUWVtdSAmIExpbnV4IGtlcm5lbCkuCj4gUGVyZiBzaG91bGQgd29yayBv
dXQtb2YtdGhlIGJveCB3aGVuIHlvdSBib290IHRoZSBsYXRlc3Qga2VybmVsIGluIHRoZQo+IGxh
dGVzdCB2ZXJzaW9uIG9mIHRoZSBRZW11Lgo+Cj4gSW5pdGlhbCBLVk1bMV0gcGF0Y2hlcyBzdXBw
b3J0IGdvdCBtZXJnZWQgZHVyaW5nIHRoZSBsYXN0IG1lcmdlCj4gd2luZG93LiBJdCBkb2Vzbid0
IHN1cHBvcnQKPiBldmVudCBzYW1wbGluZyB5ZXQuIFdlIGFyZSB3b3JraW5nIG9uIHRoYXQuCj4K
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDIwNzA5NTUyOS4xNzg3MjYw
LTEtYXRpc2hwQHJpdm9zaW5jLmNvbS8KCkNvb2wsIGl0J2QgYmUgbmljZSB0byBoYXZlIGEgcmVj
aXBlIGZvciB0aGlzIGZyb20geDg2IExpbnV4IDotKQoKPiA+IHNvbWV0aGluZyBzYXkgb246Cj4g
PiBodHRwczovL3BlcmYud2lraS5rZXJuZWwub3JnL2luZGV4LnBocC9NYWluX1BhZ2UKPiA+IG9u
IGhvdyB0byBydW4gdGVzdHMsIHBlcmhhcHMgb24gUUVNVSBvciBrbm93biB0byB3b3JrIGJvYXJk
cy4gV2UgY2FuCj4gPiBhbHNvIGp1c3QgZHJvcCBhIGxpbmsgb24gdGhlcmUgaWYgdGhlcmUgaXMg
aW5mb3JtYXRpb24uIFdlIGNhbiBhbHNvCj4gPiBhZGQgdGhlIFJJU0MtViBQTVUgaW5mb3JtYXRp
b24gdG8gdGhlIGxpbmtzIGhlcmU6Cj4gPiBodHRwczovL3BlcmYud2lraS5rZXJuZWwub3JnL2lu
ZGV4LnBocC9Vc2VmdWxfTGlua3MKPiA+Cj4KPiBJIGRpZCBub3Qgc2VlIGFueSBhcmNoIHNwZWNp
ZmljIGluZm9ybWF0aW9uIHRoZXJlLiBMZXQgdXMga25vdyB3aGF0Cj4gd291bGQgYmUgZ29vZCB0
bwo+IGFkZCB0aGVyZSBhbmQgd2Ugd291bGQgYmUgaGFwcHkgdG8gYWRkLgoKSSB3YXMgc3BlY2lm
aWNhbGx5IHRoaW5raW5nIHVuZGVyIE1hbnVhbHMgd2hlcmUgdGhlIEludGVsLCBBTUQgYW5kIEFS
TQptYW51YWxzIGFyZSwgbGlua3MgdG8gdGhlIFJJU0MtViBkb2N1bWVudGF0aW9uIGNvdWxkIGJl
IGFkZGVkLgoKVGhhbmtzLApJYW4KCj4gPiBUaGFua3MsCj4gPiBJYW4KPiA+Cj4gPiA+Cj4gPiA+
ID4KPiA+ID4gPgo+ID4gPiA+ID4gYmV0d2VlbiB4ODYgYW5kIGFhcmNoNjQgdGhhdCBoYXZlIGFz
c3VtZWQgdXNlcnNwYWNlIGhhcmR3YXJlIGNvdW50ZXIKPiA+ID4gPiA+IGFjY2VzcywgYW5kIGV2
ZXJ5dGhpbmcgZWxzZSB0aGF0IGl0IGlzIGFzc3VtZWQgZG9uJ3QuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhhbmtzLAo+ID4gPiA+ID4gSWFuCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IENsZWFybHkg
cHJvY2VzcyBzd2l0Y2hlcyAoZXNwZWNpYWxseSBjcHUgbWlncmF0aW9ucykgY2F1c2UKPiA+ID4g
PiA+ID4gPiBwcm9ibGVtcywgYnV0IHRoZXkgYXJlIG9idmlvdXNseSBpbnZhbGlkIHZhbHVlcyBh
bmQgY2FuCj4gPiA+ID4gPiA+ID4gYmUgaWdub3JlZC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IFNvIHdoaWxlIGEgbG90IG9mIHVzZXMgbWF5IGJlICdoYXBweScgd2l0aCB0aGUgdmFsdWVz
IHRoZQo+ID4gPiA+ID4gPiA+IHBlcmYgZnJhbWV3b3JrIGdpdmVzLCBzb21ldGltZXMgeW91IGRv
IG5lZWQgdG8gZGlyZWN0bHkKPiA+ID4gPiA+ID4gPiByZWFkIHRoZSByZWxldmFudCByZWdpc3Rl
cnMuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICAgIERhdmlkCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiAtCj4gPiA+ID4gPiA+ID4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
Cj4gPiA+ID4gPiA+ID4gUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gLS0KPiA+ID4gPiA+ID4gUmVn
YXJkcywKPiA+ID4gPiA+ID4gQXRpc2gKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAt
LQo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4gQXRpc2gKPgo+Cj4KPiAtLQo+IFJlZ2FyZHMsCj4g
QXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
