Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F9CD1CA03
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 22:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pr5Ft32x0pGd22lYaFBCKo0Gj9v+jWR8d1leKjHLqyU=; b=QtV03n5flwBW2f
	7sZCPTvmXsRW5AXqJDKUo41nlNCXXAWNti1X3MT6Vh2okFnitN2B6mP1m3OrVlPdpJM3iQpiDHWNZ
	7JAdKxs8eqOADVzS3k8IEUkTVfdF18fcmK2lKlJnjM9l64No9N9qSuyH+ozCxsAZpbojBDBd1GRlI
	V0ZfMJ2u9W8SojKURqhDmz4XEhmUE2B0Bj5HvEu5+n/nnLDNhs+HTXEK927Yeq2FXplQQ+frX8u1V
	7Z7Cdc2dq4U8qNp0LlnRhRx7cSFT1S9rCIyPNb/ZrrBNUWLNnITfy9rfJDTSUQRlPwDMvDtP+fOP6
	3m6Gf2xr17COKGR86m0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t85CS-0000000FFtx-3lFM;
	Mon, 04 Nov 2024 22:05:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t85Ai-0000000FFZb-49km
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 22:03:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c87b0332cso27235ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 14:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730757820; x=1731362620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=;
        b=x64tpt009F04nas/6MK3THiBaAsJ/nv8fz9wd4/5xEPKHidnLOiaDxFxiAG6h0WDXJ
         7JMKIf3EbLRIQ+GPS9wH2r457YwAKQQuPXuhf4QDnnL+1m1AV8wK+tbydBJm3DzRkKCV
         UFuRNj6225A3nuoBI7kjlnz2ujqqRoD1lzpdIphdLBWRLXn6LowJ+Mkl+atiRzCuQhQ9
         I0zaiqSwNyMfa85TRqDSLdLzCeG0CwFP19c5gtCYereS0uUtjM5eHSq9sCnpEmlYUC0G
         k4prkYZ4Q+HpsvixsBG9zxUXrWYem771mk/+VR64xWfzovV/JmuCSHDQ7N4ZOyr38qv9
         mgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730757820; x=1731362620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=;
        b=huWZNki/hh9uOiH96AJK+c6iSIbgquiBddLCsVtcvisJYwzU19jHT6z5mNvRHziX+3
         x76FfbRDxh75vVw3qVdi1iUyGyjZCrshk+Vf/mCE1UP7s1P+jiufTTPiE4n+64n2dmua
         /oGpnqNkihoU/MrHJX3ZahUE5oy4jtE3rvGf3OPkUEA+afJrEbrK5VMXFE7rX1/3mc47
         VcmRu6HVfGNBcRtjxs/WTbFLdCTY2SVFoDS0oMIluy7IE1OwSWDetxTj1MJhGsfiB8VL
         rXJQg4t3ohBBLn0kmkdVUgJIv7hmJ6g/JLMEw+eZTdW+OdE3e71877PTJySVZOsIdqoe
         nzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU1appSGooTw4RS/Bhf+WN6rnX8zi7YpP8LgjgYtHkc4N6UOBZm7zsY+mgMepJ4kWHnT8+PUsJcz68SA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwotPLMNrkcihu4PD+0df3Vv3hzpg9BeYVPxL7RAupm9p4zSYI/
	UGv/7M1EgH/CubdzBHr6eCnKyzQsXAy/6rTqE3YV+uD6bCPvE9Wr9FH2sR+nimA2s6FWiKlH+b/
	Zp06tQ6Ntu5dVgdmjpSP4uKU8E1Ima3/xhn4S
X-Gm-Gg: ASbGncub+KUO3/NGjGkdp0Og9Ty5wcpcP0Y4uGXfdgoUPhHkWkmuYw7dcRJqzoqcNEx
	pk95twHl5KetiwnEiZHFxMzedheQjy8J5RCdnDhlRpVwRIeD+JLu3lVzPMSR2/kA=
X-Google-Smtp-Source: AGHT+IEti60SDL7RHxI+cAhb1vGKCJSZIYIvkK03gIl3UEiSV24cOOJW04C/9MY0z0qdxUSpneeeMi3ERfOoxdjdYyo=
X-Received: by 2002:a17:902:c401:b0:206:b7b2:4876 with SMTP id
 d9443c01a7336-2115e2cb7c5mr1245345ad.20.1730757819913; Mon, 04 Nov 2024
 14:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com> <Zyk9hX8CB_2rbWsi@ghost>
In-Reply-To: <Zyk9hX8CB_2rbWsi@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 Nov 2024 14:03:28 -0800
Message-ID: <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
Subject: Re: [PATCH RFT 00/16] perf tools: Use generic syscall scripts for all archs
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_140341_061308_B481C3CD 
X-CRM114-Status: GOOD (  29.98  )
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

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAxOjMy4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE5vdiAwNCwgMjAyNCBhdCAxMDoxMzox
OFBNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gT24gTW9uLCBOb3YgNCwgMjAyNCwg
YXQgMjI6MDYsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gU3RhbmRhcmRpemUgdGhlIGdl
bmVyYXRpb24gb2Ygc3lzY2FsbCBoZWFkZXJzIGFyb3VuZCBzeXNjYWxsIHRhYmxlcy4KPiA+ID4g
UHJldmlvdXNseSBlYWNoIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudGx5IHNlbGVjdGVkIGhvdyBz
eXNjYWxsIGhlYWRlcnMKPiA+ID4gd291bGQgYmUgZ2VuZXJhdGVkLCBvciB3b3VsZCBub3QgZGVm
aW5lIGEgd2F5IGFuZCBmYWxsYmFjayBvbnRvCj4gPiA+IGxpYmF1ZGl0LiBDb252ZXJ0IGFsbCBh
cmNoaXRlY3R1cmVzIHRvIHVzZSBhIHN0YW5kYXJkIHN5c2NhbGwgaGVhZGVyCj4gPiA+IGdlbmVy
YXRpb24gc2NyaXB0IGFuZCBhbGxvdyBlYWNoIGFyY2hpdGVjdHVyZSB0byBvdmVycmlkZSB0aGUg
c3lzY2FsbAo+ID4gPiB0YWJsZSB0byB1c2UgaWYgdGhleSBkbyBub3QgdXNlIHRoZSBnZW5lcmlj
IHRhYmxlLgo+ID4gPgo+ID4gPiBBcyBhIHJlc3VsdCBvZiB0aGVzZSBjaGFuZ2VzLCBubyBhcmNo
aXRlY3R1cmUgd2lsbCByZXF1aXJlIGxpYmF1ZGl0LCBhbmQKPiA+ID4gc28gdGhlIGZhbGxiYWNr
IGNhc2Ugb2YgdXNpbmcgbGliYXVkaXQgaXMgcmVtb3ZlZCBieSB0aGlzIHNlcmllcy4KPiA+ID4K
PiA+ID4gVGVzdGluZzoKPiA+ID4KPiA+ID4gSSBoYXZlIHRlc3RlZCB0aGF0IHRoZSBzeXNjYWxs
IG1hcHBpbmdzIG9mIGlkIHRvIG5hbWUgZ2VuZXJhdGlvbiB3b3Jrcwo+ID4gPiBhcyBleHBlY3Rl
ZCBmb3IgZXZlcnkgYXJjaGl0ZWN0dXJlLCBidXQgSSBoYXZlIG9ubHkgdmFsaWRhdGVkIHRoYXQg
cGVyZgo+ID4gPiB0cmFjZSBjb21waWxlcyBhbmQgcnVucyBhcyBleHBlY3RlZCBvbiByaXNjdiwg
YXJtNjQsIGFuZCB4ODZfNjQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVu
a2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gPgo+ID4gVGhhbmtzIGZvciBkb2luZyB0aGlz
LCBJIGhhZCBwbGFucyB0byBkbyB0aGlzIG15c2VsZiwgYnV0IGhhZG4ndAo+ID4gY29tcGxldGVk
IHRoYXQgYml0IHNvIGZhci4gSSdtIHRyYXZlbGxpbmcgYXQgdGhlIG1vbWVudCwgc28gSSdtCj4g
PiBub3Qgc3VyZSBJIGhhdmUgdGltZSB0byBsb29rIGF0IGl0IGluIGVub3VnaCBkZXRhaWwgdGhp
cyB3ZWVrLgo+ID4KPiA+IE9uZSBwcm9ibGVtIEkgcmFuIGludG8gZG9pbmcgdGhpcyBwcmV2aW91
c2x5IHdhcyB0aGUgaW5jb21wYXRpYmxlCj4gPiBmb3JtYXQgb2YgdGhlIHRhYmxlcyBmb3IgeDg2
IGFuZCBzMzkwLCB3aGljaCBoYXZlIGNvbmZsaWN0aW5nCj4gPiBpbnRlcnByZXRhdGlvbnMgb2Yg
d2hhdCB0aGUgJy0nIGNoYXJhY3RlciBtZWFucy4gSXQncyBwb3NzaWJsZQo+ID4gdGhhdCB0aGlz
IGlzIG9ubHkgcmVhbGx5IHJlbGV2YW50IGZvciB0aGUgaW4ta2VybmVsIHRhYmxlLAo+ID4gbm90
IHRoZSB2ZXJzaW9uIGluIHRvb2xzLgo+ID4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyBhbiBp
c3N1ZSBmb3IgdGhpcyB1c2VjYXNlIGJlY2F1c2UgdGhlIG9ubHkKPiBpbmZvcm1hdGlvbiB0aGF0
IGlzIHRha2VuIGZyb20gdGhlIHN5c2NhbGwgdGFibGUgaXMgdGhlIG51bWJlciBhbmQgdGhlCj4g
bmFtZSBvZiB0aGUgc3lzY2FsbC4gJy0nIGRvZXNuJ3QgYXBwZWFyIGluIGVpdGhlciBvZiB0aGVz
ZSBjb2x1bW5zIQoKVGhpcyBpcyBjb29sIHN0dWZmLiBBbiBhcmVhIHRoYXQgbWF5IG5vdCBiZSBp
bW1lZGlhdGVseSBhcHBhcmVudCBmb3IKaW1wcm92ZW1lbnQgaXMgdGhhdCB0aGUgeDg2LTY0IGJ1
aWxkIG9ubHkgaGFzIGFjY2VzcyB0byB0aGUgNjQtYml0CnN5c2NhbGwgdGFibGUuIFBlcmhhcHMg
YWxsIHRoZSBzeXNjYWxsIHRhYmxlcyBzaG91bGQgYWx3YXlzIGJlIGJ1aWx0CmFuZCB0aGVuIGF0
IHJ1bnRpbWUgdGhlIGFyY2hpdGVjdHVyZSBvZiB0aGUgcGVyZi5kYXRhIGZpbGUsIGV0Yy4gdXNl
ZAp0byBjaG9vc2UgdGhlIGFwcHJvcHJpYXRlIG9uZS4gVGhlIGNsZWFudXAgdG8gYWRkIGFuIEVM
RiBob3N0ICNkZWZpbmUKY291bGQgaGVscCB3aXRoIHRoaXM6Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXBlcmYtdXNlcnMvMjAyNDEwMTcwMDI1MjAuNTkxMjQtMS1pcm9nZXJzQGdvb2ds
ZS5jb20vCgpVbHRpbWF0ZWx5IEknZCBsaWtlIHRvIHNlZSBsZXNzIGFyY2ggY29kZSBhcyBpdCBp
bmhlcmVudGx5IG1ha2VzIGNyb3NzCnBsYXRmb3JtIHdvcmtlciBoYXJkZXIuIFRoYXQgZG9lc24n
dCBpbXBhY3QgdGhpcyB3b3JrIHdoaWNoIEknbSBoYXBweQp0byByZXZpZXcuCgpUaGFua3MsCklh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
