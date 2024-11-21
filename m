Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C901D75BB2
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 04:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlcjMX1coVoh8Lr/J3SBzLsurtDOsALJwARv6Nah/mo=; b=2KOWibEcORC+Qa
	iae884t0bcTXeCg4rmiLYfCypzVQs5m/zsh5yhbQ0DnRrdN+CxAY5OzFRVWkykpvioCNomUCxudYt
	ZJUJMdqLDPq0OB3sM6neask6nArHuCGxzeiRz3ROGbg0hHl5rr4nRFsja5yHxIIXcB0dtCgZFuiy6
	g5DmYKIwSUaX4V2tox3B/Ij89lg9XmdYikHBnjjaNyvgs0yezWscKwX52XfsF02ehcejYdA2fJg/h
	+h/b+LuD5EIrZudsJO50ZTcdUhq6qsBC6qIQS/dsvpSWPtyyeu7cgY2AaStwvtu7fktB3D2DM4Ezj
	hWfi0HsNoTYrbV88jC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyi7-0000000Gllt-44Fi;
	Thu, 21 Nov 2024 04:22:31 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyi4-0000000Glks-1wwy
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 04:22:30 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6ee6a2ae6ecso3966347b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 20:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732162947; x=1732767747; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cP3Um0hz7Gv16Gtk91dL7DlYT6sIqAVCB2yrXnpMevM=;
        b=Qt+Pohig3fM9/2HYcf7m6nD9Il+Syqf7PoERE56KXA80TRcJHpnhFqfWjJDlGV7F35
         XFFtDxvnrkqhKQrrSJqClrkJ19qfbW/L3lztSwvp0PsXjlMKuc3XigyEwrz8XyLIg95C
         pMDuPyCkK9k6xIx382hWT/Iiy3YjxeaVFSgrKGfsVLeC8bZNtEXSbMaBI/WQvZhc45+7
         ecy2tO62R4g2qfq2gXBRDTPZ/RLep/ZHXPgDDV7WQgSXSEz6ck+M45QaB/VV+8iedeKS
         qDkDk0wyFsCaORvsb4+2KXyziWO612HZK9iHTnAHlDSeCSzVBZHGwX5wKdMH97e6coqQ
         ds6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162947; x=1732767747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP3Um0hz7Gv16Gtk91dL7DlYT6sIqAVCB2yrXnpMevM=;
        b=KYOlM22+Zu5rmGVQDCRX5B5RaZLd2RLxIL+ot6ctuKTa00pFDa37OvEnKEGv7YWt20
         aiA3DPw5qnQieNC/A8jkmalML+OpG5NyZMOJO2sfZiE8C566q/VL0Yg1/A7vwpTRmaX0
         TNt/Sz5bLuaFyIXfE3TgzDKkwo4vBHoRU/MSoseMTeqXkMBM/NukdUn1/xl9VxQ2+LK+
         +9wm7cvMd8JmbPx6EXgr3DVg1OHBHn20b6GoNepnFrswsuDEOj14tIsRFJAKhfQweC9E
         Ff6398NK5PiG2zmlFo6FZ+8Mechg4Qg+fJ4vmL7wPpPiw9wMdZce8p9QbmhC84mlvErq
         ZQhg==
X-Forwarded-Encrypted: i=1; AJvYcCX9Yrexj1slDYTzzjG6rdWXUQPR7SWN1iMEJn8YVZyjKFV11r1tsZgW7RnS3hGT9UN1VXVJOqAqmiLwvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yydjz9Saalz2lagTmsSkx8W4q2RX2c33jXQqfpEVSaBQU7yQlVj
	BLwjzmlauOfgryT6N5iinPUjBR6SXV4wa1IlhRZk7p0QPqhIKmanqW2gRtE5e7Q=
X-Google-Smtp-Source: AGHT+IFG/0lmdLf+PuJVUiUVDthedJQkU+yi8kvRYeLAcyp/RSQ9OGzeQL0b0Fr9yTqYmM0khQUKNg==
X-Received: by 2002:a05:690c:5a15:b0:6ee:5068:7510 with SMTP id 00721157ae682-6eecc57b073mr20304047b3.26.1732162946630;
        Wed, 20 Nov 2024 20:22:26 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee71341e4dsm25749277b3.90.2024.11.20.20.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:22:25 -0800 (PST)
Date: Wed, 20 Nov 2024 20:22:23 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFT 00/16] perf tools: Use generic syscall scripts for
 all archs
Message-ID: <Zz61f02p8s52G6ba@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
 <Zyk9hX8CB_2rbWsi@ghost>
 <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
 <ZylaRaMqEsEjYjs6@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZylaRaMqEsEjYjs6@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_202228_766547_9633EBD6 
X-CRM114-Status: GOOD (  40.02  )
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

T24gTW9uLCBOb3YgMDQsIDIwMjQgYXQgMDM6MzU6MzNQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIE1vbiwgTm92IDA0LCAyMDI0IGF0IDAyOjAzOjI4UE0gLTA4MDAsIElhbiBS
b2dlcnMgd3JvdGU6Cj4gPiBPbiBNb24sIE5vdiA0LCAyMDI0IGF0IDE6MzLigK9QTSBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9u
LCBOb3YgMDQsIDIwMjQgYXQgMTA6MTM6MThQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToK
PiA+ID4gPiBPbiBNb24sIE5vdiA0LCAyMDI0LCBhdCAyMjowNiwgQ2hhcmxpZSBKZW5raW5zIHdy
b3RlOgo+ID4gPiA+ID4gU3RhbmRhcmRpemUgdGhlIGdlbmVyYXRpb24gb2Ygc3lzY2FsbCBoZWFk
ZXJzIGFyb3VuZCBzeXNjYWxsIHRhYmxlcy4KPiA+ID4gPiA+IFByZXZpb3VzbHkgZWFjaCBhcmNo
aXRlY3R1cmUgaW5kZXBlbmRlbnRseSBzZWxlY3RlZCBob3cgc3lzY2FsbCBoZWFkZXJzCj4gPiA+
ID4gPiB3b3VsZCBiZSBnZW5lcmF0ZWQsIG9yIHdvdWxkIG5vdCBkZWZpbmUgYSB3YXkgYW5kIGZh
bGxiYWNrIG9udG8KPiA+ID4gPiA+IGxpYmF1ZGl0LiBDb252ZXJ0IGFsbCBhcmNoaXRlY3R1cmVz
IHRvIHVzZSBhIHN0YW5kYXJkIHN5c2NhbGwgaGVhZGVyCj4gPiA+ID4gPiBnZW5lcmF0aW9uIHNj
cmlwdCBhbmQgYWxsb3cgZWFjaCBhcmNoaXRlY3R1cmUgdG8gb3ZlcnJpZGUgdGhlIHN5c2NhbGwK
PiA+ID4gPiA+IHRhYmxlIHRvIHVzZSBpZiB0aGV5IGRvIG5vdCB1c2UgdGhlIGdlbmVyaWMgdGFi
bGUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQXMgYSByZXN1bHQgb2YgdGhlc2UgY2hhbmdlcywgbm8g
YXJjaGl0ZWN0dXJlIHdpbGwgcmVxdWlyZSBsaWJhdWRpdCwgYW5kCj4gPiA+ID4gPiBzbyB0aGUg
ZmFsbGJhY2sgY2FzZSBvZiB1c2luZyBsaWJhdWRpdCBpcyByZW1vdmVkIGJ5IHRoaXMgc2VyaWVz
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRlc3Rpbmc6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBoYXZl
IHRlc3RlZCB0aGF0IHRoZSBzeXNjYWxsIG1hcHBpbmdzIG9mIGlkIHRvIG5hbWUgZ2VuZXJhdGlv
biB3b3Jrcwo+ID4gPiA+ID4gYXMgZXhwZWN0ZWQgZm9yIGV2ZXJ5IGFyY2hpdGVjdHVyZSwgYnV0
IEkgaGF2ZSBvbmx5IHZhbGlkYXRlZCB0aGF0IHBlcmYKPiA+ID4gPiA+IHRyYWNlIGNvbXBpbGVz
IGFuZCBydW5zIGFzIGV4cGVjdGVkIG9uIHJpc2N2LCBhcm02NCwgYW5kIHg4Nl82NC4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIGZvciBkb2luZyB0aGlzLCBJIGhhZCBw
bGFucyB0byBkbyB0aGlzIG15c2VsZiwgYnV0IGhhZG4ndAo+ID4gPiA+IGNvbXBsZXRlZCB0aGF0
IGJpdCBzbyBmYXIuIEknbSB0cmF2ZWxsaW5nIGF0IHRoZSBtb21lbnQsIHNvIEknbQo+ID4gPiA+
IG5vdCBzdXJlIEkgaGF2ZSB0aW1lIHRvIGxvb2sgYXQgaXQgaW4gZW5vdWdoIGRldGFpbCB0aGlz
IHdlZWsuCj4gPiA+ID4KPiA+ID4gPiBPbmUgcHJvYmxlbSBJIHJhbiBpbnRvIGRvaW5nIHRoaXMg
cHJldmlvdXNseSB3YXMgdGhlIGluY29tcGF0aWJsZQo+ID4gPiA+IGZvcm1hdCBvZiB0aGUgdGFi
bGVzIGZvciB4ODYgYW5kIHMzOTAsIHdoaWNoIGhhdmUgY29uZmxpY3RpbmcKPiA+ID4gPiBpbnRl
cnByZXRhdGlvbnMgb2Ygd2hhdCB0aGUgJy0nIGNoYXJhY3RlciBtZWFucy4gSXQncyBwb3NzaWJs
ZQo+ID4gPiA+IHRoYXQgdGhpcyBpcyBvbmx5IHJlYWxseSByZWxldmFudCBmb3IgdGhlIGluLWtl
cm5lbCB0YWJsZSwKPiA+ID4gPiBub3QgdGhlIHZlcnNpb24gaW4gdG9vbHMuCj4gPiA+ID4KPiA+
ID4KPiA+ID4gSSBkb24ndCB0aGluayB0aGF0IGlzIGFuIGlzc3VlIGZvciB0aGlzIHVzZWNhc2Ug
YmVjYXVzZSB0aGUgb25seQo+ID4gPiBpbmZvcm1hdGlvbiB0aGF0IGlzIHRha2VuIGZyb20gdGhl
IHN5c2NhbGwgdGFibGUgaXMgdGhlIG51bWJlciBhbmQgdGhlCj4gPiA+IG5hbWUgb2YgdGhlIHN5
c2NhbGwuICctJyBkb2Vzbid0IGFwcGVhciBpbiBlaXRoZXIgb2YgdGhlc2UgY29sdW1ucyEKPiA+
IAo+ID4gVGhpcyBpcyBjb29sIHN0dWZmLiBBbiBhcmVhIHRoYXQgbWF5IG5vdCBiZSBpbW1lZGlh
dGVseSBhcHBhcmVudCBmb3IKPiA+IGltcHJvdmVtZW50IGlzIHRoYXQgdGhlIHg4Ni02NCBidWls
ZCBvbmx5IGhhcyBhY2Nlc3MgdG8gdGhlIDY0LWJpdAo+ID4gc3lzY2FsbCB0YWJsZS4gUGVyaGFw
cyBhbGwgdGhlIHN5c2NhbGwgdGFibGVzIHNob3VsZCBhbHdheXMgYmUgYnVpbHQKPiA+IGFuZCB0
aGVuIGF0IHJ1bnRpbWUgdGhlIGFyY2hpdGVjdHVyZSBvZiB0aGUgcGVyZi5kYXRhIGZpbGUsIGV0
Yy4gdXNlZAo+ID4gdG8gY2hvb3NlIHRoZSBhcHByb3ByaWF0ZSBvbmUuIFRoZSBjbGVhbnVwIHRv
IGFkZCBhbiBFTEYgaG9zdCAjZGVmaW5lCj4gPiBjb3VsZCBoZWxwIHdpdGggdGhpczoKPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBlcmYtdXNlcnMvMjAyNDEwMTcwMDI1MjAuNTkx
MjQtMS1pcm9nZXJzQGdvb2dsZS5jb20vCj4gCj4gT2ggdGhhdCdzIGEgZ3JlYXQgaWRlYSEgSSB0
aGluayB0aGVzZSBjaGFuZ2VzIHdpbGwgbWFrZSBpdCBtb3JlIHNlYW1sZXNzCj4gdG8gbWFrZSB0
aGF0IGEgcmVhbGl0eS4KPiAKPiA+IAo+ID4gVWx0aW1hdGVseSBJJ2QgbGlrZSB0byBzZWUgbGVz
cyBhcmNoIGNvZGUgYXMgaXQgaW5oZXJlbnRseSBtYWtlcyBjcm9zcwo+ID4gcGxhdGZvcm0gd29y
a2VyIGhhcmRlci4gVGhhdCBkb2Vzbid0IGltcGFjdCB0aGlzIHdvcmsgd2hpY2ggSSdtIGhhcHB5
Cj4gPiB0byByZXZpZXcuCj4gCj4gWWVhaCBJIGFncmVlLiBSZWR1Y2luZyBhcmNoIGNvZGUgd2Fz
IHRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIGNoYW5nZS4KPiBUaGVyZSB3YXMgdGhlIGlzc3VlIGEg
Y291cGxlIHdlZWtzIGFnbyB0aGF0IGNhdXNlZCBhbGwgYXJjaGl0ZWN0dXJlcwo+IHRoYXQgdXNl
ZCBsaWJhdWRpdCB0byBicmVhayBmcm9tIGNvbW1pdCA3YTJmYjU2MTljYzFmYjUzICgicGVyZiB0
cmFjZToKPiBGaXggaXRlcmF0aW9uIG9mIHN5c2NhbGwgaWRzIGluIHN5c2NhbGx0YmwtPmVudHJp
ZXMiKSwgc28gdGhpcyBjaGFuZ2UKPiB3aWxsIGVsaW1pbmF0ZSB0aGF0IHNvdXJjZSBvZiBkaWZm
ZXJlbmNlIGJldHdlZW4gYXJjaGl0ZWN0dXJlcy4KPiAKPiAtIENoYXJsaWUKPiAKPiA+IAo+ID4g
VGhhbmtzLAo+ID4gSWFuCgpMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgZmVlZGJhY2sgb24g
dGhpcyBzZXJpZXMhCgotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
