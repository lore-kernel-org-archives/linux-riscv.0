Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1733D1CA09
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 23:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsfBNyluW3pMQvTvU9guczH4/5exEE3RXcHTu5yCGRU=; b=N0U0YyFPxJVxHj
	xWpz2t+3Anx0k8W8aq0D1+4R/GifeJnL70stHkavQi77BttOUCbFXoUaXRQqc5hd2ijCn1Ysl6jW1
	xIO9VbrlpUjvwef1bXIdjLJKob+Q9Uqglbgv5NmHeo+hbpry4VfiMKbqqg1dspRkwVq7VQrCYuv/J
	EN3oB3NLdPosPJ/s42sYkowfCBaW+H1giT3YssXHBxf7SHNXmK/1PKKsB0mEcsdE0wGn63EDkbAhj
	UHr6NYWHLzGCkNDU1YFf2zgJctY2V2b6Wf0MAz0eHr4soP0ueJWGYqZKl3r445n+DFNHa+AbwDFrr
	nXsHFHmjbTTmw1fo6KmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t86bm-0000000FOt0-2drI;
	Mon, 04 Nov 2024 23:35:42 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t86bi-0000000FOpo-0dSe
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 23:35:41 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7f12ba78072so1358084a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 15:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730763337; x=1731368137; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=31BGTQSdIkP/4Zu0IN+x2yZh6+VSpCdF3MI1H4dhuNY=;
        b=Imk9Lry9nHJxqt0tPBLxLrzA49VR8RXM+XYEXFbdQUEY/dOTUe20Wb2zZAOvetle2D
         dt5uO1U0kRYZRmoOP9o5eHanB/zSotrF+LIXuuOZBQa2M0lUpTNgaqo/q9X23de9erqD
         GME2wykUxdxAXuAx/Ud7OAyf4W1apAYz62QeeqLx/ta7GVSLll3SGsU7Cf4PaXvAC7U3
         CDmnmXky/c3m6UmDJqpSjSTXoSZp/DnmSLcr2vCOmkfNBxn+XpcIuFrbSwt2y6qRRLrf
         d3j7d/lA1up7UDh69tCQSBXJ7GRoQihEAdz6jnAYKVjaDGsxD+wJJ3raSaJq1ek9VFsI
         N3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730763337; x=1731368137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31BGTQSdIkP/4Zu0IN+x2yZh6+VSpCdF3MI1H4dhuNY=;
        b=QLBFJ7vs9pyVczLExOfB/4X3zA8cLrw57VGBsXBiAC3HCRJQ8uGuiTec9fTF7PCFbn
         Ue+HXRx1svDFkf2ZzjKlvqB0XzJa7f6LWAL4oCy68Ay6hylfYFBpEayo09rQ0STFS7G5
         KtSPhluybMQlUNwvyQ7q0Xj2xecYzJDq2mG/FL+8oFF2Tv72p+qKKjySwuzQXco5UBgU
         6fvmacHrBbPa9dKg36WTJM7u4hI+Qw1v2YyVN5VnYM1aIbvZ4WP/Z1lAmC579s6DnPAH
         UNggdGE7IKMTOYB4xu3Q07sMJWArzJUgJCtOIoVUfyn0nT5L49QJJcDIbeeT7Hvla5Vx
         kapg==
X-Forwarded-Encrypted: i=1; AJvYcCX4RFbwhXQQWPpp3/l4QvUFQt0y58gwcXL70edocEexIh9Vf+XVlF/CIXOvnEwKBK/ufDYzm91oDJ+xGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0Y55FN959oeV3/D++NmPgcELINTlCUz5Clx9kvDOEh3fz61I
	BK3CH1RMwr405FjJeb7dLOWnAddp9WWH/1zcC5+2PQVz0Hq7VN6B2VwNkdAwf/w=
X-Google-Smtp-Source: AGHT+IHUkdei85jsd4jEJe1dv8cR5cqR+1/XIGSXNDsrFT+G8g62SWEwp7GVusVEZsJaOrWKuYtEtQ==
X-Received: by 2002:a17:903:40ca:b0:20c:a19d:e73e with SMTP id d9443c01a7336-210c6cf2237mr433175125ad.57.1730763336945;
        Mon, 04 Nov 2024 15:35:36 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c7560sm66579565ad.237.2024.11.04.15.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 15:35:36 -0800 (PST)
Date: Mon, 4 Nov 2024 15:35:33 -0800
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
Message-ID: <ZylaRaMqEsEjYjs6@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
 <Zyk9hX8CB_2rbWsi@ghost>
 <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_153538_681713_FD73183A 
X-CRM114-Status: GOOD (  36.89  )
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

T24gTW9uLCBOb3YgMDQsIDIwMjQgYXQgMDI6MDM6MjhQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIE5vdiA0LCAyMDI0IGF0IDE6MzLigK9QTSBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE5vdiAwNCwgMjAyNCBh
dCAxMDoxMzoxOFBNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiBPbiBNb24sIE5v
diA0LCAyMDI0LCBhdCAyMjowNiwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiA+IFN0YW5k
YXJkaXplIHRoZSBnZW5lcmF0aW9uIG9mIHN5c2NhbGwgaGVhZGVycyBhcm91bmQgc3lzY2FsbCB0
YWJsZXMuCj4gPiA+ID4gUHJldmlvdXNseSBlYWNoIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudGx5
IHNlbGVjdGVkIGhvdyBzeXNjYWxsIGhlYWRlcnMKPiA+ID4gPiB3b3VsZCBiZSBnZW5lcmF0ZWQs
IG9yIHdvdWxkIG5vdCBkZWZpbmUgYSB3YXkgYW5kIGZhbGxiYWNrIG9udG8KPiA+ID4gPiBsaWJh
dWRpdC4gQ29udmVydCBhbGwgYXJjaGl0ZWN0dXJlcyB0byB1c2UgYSBzdGFuZGFyZCBzeXNjYWxs
IGhlYWRlcgo+ID4gPiA+IGdlbmVyYXRpb24gc2NyaXB0IGFuZCBhbGxvdyBlYWNoIGFyY2hpdGVj
dHVyZSB0byBvdmVycmlkZSB0aGUgc3lzY2FsbAo+ID4gPiA+IHRhYmxlIHRvIHVzZSBpZiB0aGV5
IGRvIG5vdCB1c2UgdGhlIGdlbmVyaWMgdGFibGUuCj4gPiA+ID4KPiA+ID4gPiBBcyBhIHJlc3Vs
dCBvZiB0aGVzZSBjaGFuZ2VzLCBubyBhcmNoaXRlY3R1cmUgd2lsbCByZXF1aXJlIGxpYmF1ZGl0
LCBhbmQKPiA+ID4gPiBzbyB0aGUgZmFsbGJhY2sgY2FzZSBvZiB1c2luZyBsaWJhdWRpdCBpcyBy
ZW1vdmVkIGJ5IHRoaXMgc2VyaWVzLgo+ID4gPiA+Cj4gPiA+ID4gVGVzdGluZzoKPiA+ID4gPgo+
ID4gPiA+IEkgaGF2ZSB0ZXN0ZWQgdGhhdCB0aGUgc3lzY2FsbCBtYXBwaW5ncyBvZiBpZCB0byBu
YW1lIGdlbmVyYXRpb24gd29ya3MKPiA+ID4gPiBhcyBleHBlY3RlZCBmb3IgZXZlcnkgYXJjaGl0
ZWN0dXJlLCBidXQgSSBoYXZlIG9ubHkgdmFsaWRhdGVkIHRoYXQgcGVyZgo+ID4gPiA+IHRyYWNl
IGNvbXBpbGVzIGFuZCBydW5zIGFzIGV4cGVjdGVkIG9uIHJpc2N2LCBhcm02NCwgYW5kIHg4Nl82
NC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+Cj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcywgSSBoYWQg
cGxhbnMgdG8gZG8gdGhpcyBteXNlbGYsIGJ1dCBoYWRuJ3QKPiA+ID4gY29tcGxldGVkIHRoYXQg
Yml0IHNvIGZhci4gSSdtIHRyYXZlbGxpbmcgYXQgdGhlIG1vbWVudCwgc28gSSdtCj4gPiA+IG5v
dCBzdXJlIEkgaGF2ZSB0aW1lIHRvIGxvb2sgYXQgaXQgaW4gZW5vdWdoIGRldGFpbCB0aGlzIHdl
ZWsuCj4gPiA+Cj4gPiA+IE9uZSBwcm9ibGVtIEkgcmFuIGludG8gZG9pbmcgdGhpcyBwcmV2aW91
c2x5IHdhcyB0aGUgaW5jb21wYXRpYmxlCj4gPiA+IGZvcm1hdCBvZiB0aGUgdGFibGVzIGZvciB4
ODYgYW5kIHMzOTAsIHdoaWNoIGhhdmUgY29uZmxpY3RpbmcKPiA+ID4gaW50ZXJwcmV0YXRpb25z
IG9mIHdoYXQgdGhlICctJyBjaGFyYWN0ZXIgbWVhbnMuIEl0J3MgcG9zc2libGUKPiA+ID4gdGhh
dCB0aGlzIGlzIG9ubHkgcmVhbGx5IHJlbGV2YW50IGZvciB0aGUgaW4ta2VybmVsIHRhYmxlLAo+
ID4gPiBub3QgdGhlIHZlcnNpb24gaW4gdG9vbHMuCj4gPiA+Cj4gPgo+ID4gSSBkb24ndCB0aGlu
ayB0aGF0IGlzIGFuIGlzc3VlIGZvciB0aGlzIHVzZWNhc2UgYmVjYXVzZSB0aGUgb25seQo+ID4g
aW5mb3JtYXRpb24gdGhhdCBpcyB0YWtlbiBmcm9tIHRoZSBzeXNjYWxsIHRhYmxlIGlzIHRoZSBu
dW1iZXIgYW5kIHRoZQo+ID4gbmFtZSBvZiB0aGUgc3lzY2FsbC4gJy0nIGRvZXNuJ3QgYXBwZWFy
IGluIGVpdGhlciBvZiB0aGVzZSBjb2x1bW5zIQo+IAo+IFRoaXMgaXMgY29vbCBzdHVmZi4gQW4g
YXJlYSB0aGF0IG1heSBub3QgYmUgaW1tZWRpYXRlbHkgYXBwYXJlbnQgZm9yCj4gaW1wcm92ZW1l
bnQgaXMgdGhhdCB0aGUgeDg2LTY0IGJ1aWxkIG9ubHkgaGFzIGFjY2VzcyB0byB0aGUgNjQtYml0
Cj4gc3lzY2FsbCB0YWJsZS4gUGVyaGFwcyBhbGwgdGhlIHN5c2NhbGwgdGFibGVzIHNob3VsZCBh
bHdheXMgYmUgYnVpbHQKPiBhbmQgdGhlbiBhdCBydW50aW1lIHRoZSBhcmNoaXRlY3R1cmUgb2Yg
dGhlIHBlcmYuZGF0YSBmaWxlLCBldGMuIHVzZWQKPiB0byBjaG9vc2UgdGhlIGFwcHJvcHJpYXRl
IG9uZS4gVGhlIGNsZWFudXAgdG8gYWRkIGFuIEVMRiBob3N0ICNkZWZpbmUKPiBjb3VsZCBoZWxw
IHdpdGggdGhpczoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wZXJmLXVzZXJzLzIw
MjQxMDE3MDAyNTIwLjU5MTI0LTEtaXJvZ2Vyc0Bnb29nbGUuY29tLwoKT2ggdGhhdCdzIGEgZ3Jl
YXQgaWRlYSEgSSB0aGluayB0aGVzZSBjaGFuZ2VzIHdpbGwgbWFrZSBpdCBtb3JlIHNlYW1sZXNz
CnRvIG1ha2UgdGhhdCBhIHJlYWxpdHkuCgo+IAo+IFVsdGltYXRlbHkgSSdkIGxpa2UgdG8gc2Vl
IGxlc3MgYXJjaCBjb2RlIGFzIGl0IGluaGVyZW50bHkgbWFrZXMgY3Jvc3MKPiBwbGF0Zm9ybSB3
b3JrZXIgaGFyZGVyLiBUaGF0IGRvZXNuJ3QgaW1wYWN0IHRoaXMgd29yayB3aGljaCBJJ20gaGFw
cHkKPiB0byByZXZpZXcuCgpZZWFoIEkgYWdyZWUuIFJlZHVjaW5nIGFyY2ggY29kZSB3YXMgdGhl
IG1vdGl2YXRpb24gZm9yIHRoaXMgY2hhbmdlLgpUaGVyZSB3YXMgdGhlIGlzc3VlIGEgY291cGxl
IHdlZWtzIGFnbyB0aGF0IGNhdXNlZCBhbGwgYXJjaGl0ZWN0dXJlcwp0aGF0IHVzZWQgbGliYXVk
aXQgdG8gYnJlYWsgZnJvbSBjb21taXQgN2EyZmI1NjE5Y2MxZmI1MyAoInBlcmYgdHJhY2U6CkZp
eCBpdGVyYXRpb24gb2Ygc3lzY2FsbCBpZHMgaW4gc3lzY2FsbHRibC0+ZW50cmllcyIpLCBzbyB0
aGlzIGNoYW5nZQp3aWxsIGVsaW1pbmF0ZSB0aGF0IHNvdXJjZSBvZiBkaWZmZXJlbmNlIGJldHdl
ZW4gYXJjaGl0ZWN0dXJlcy4KCi0gQ2hhcmxpZQoKPiAKPiBUaGFua3MsCj4gSWFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
