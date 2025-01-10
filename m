Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B14E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tg6VeamgJ1+uRfu12ZLn8DT/zAH2fsiMH61aXO0SM+U=; b=SyqM+r/Ta4sisU
	biZeQb0lqZyavSRvRIQuHHoMVPC05sjfXbBTUvIqLQBXIwvafHiHaOaTd1WnNN0jEKxPX0VQZwflC
	5QTxz3jIy+Dc0IYRZ5D1Vq0HxSFDbFJA0kvmxTGn9C6rsfmxT3fFGaWItfX99VE8JPNdfgPE3pWFJ
	+3CnSOvTOship6T1nJXNAVtTHMf6/J22o/bTjnf1gQkRwLFEdBfhvw5zzfHql/vgFUJuzHXA/q/vu
	aymwdomWBNS1JrL06bSsfXJkzwnxbVzcBuoKGUNhGdiWWDXUEEx2jxo5s+1aiIqReFrjJhL25/69p
	RuzBvbb5pFHKBdgnlhew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKnt-0000000GmhK-13jG;
	Fri, 10 Jan 2025 19:36:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKin-0000000Gltc-3BTe
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 19:31:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21661be2c2dso39722285ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 11:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736537465; x=1737142265; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T624wPcrhS1JgwTBcPosmdXx4gdcuulJGOQvqM6CtCw=;
        b=idtxv0qwXo/b/FNXTjyUMtg8iawi4pWGv+6gP7PobdLDqagh7tAW31K28ANFb2NA4x
         ujQteAQ1bNwqy3qs4uL6S5dxA+TJni3M7bHKZarHFY8u8Dl/QPiIrsFopRCzvQeay4oE
         bBw2xeXz3qwp5Pvjo2yrfMiiBwdyU0eYQ+IFQpCS8LUc11BP2RPBNccYw5Ws3b0BuwRY
         4N3mQ8TCU9971CKHsk6h/Z2kTTeIZHfYezAmNnSQeBWT0c8qAgVWkCU3jjHVxIw/3S/2
         muYMuXd0xtKvSH4N7VaL7+VNoorDn7mm4FWJf+ukFFpqBBr7xqkBvzOg6vCXpqSuzWyP
         Bndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736537465; x=1737142265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T624wPcrhS1JgwTBcPosmdXx4gdcuulJGOQvqM6CtCw=;
        b=l+9ua07LiE33BzsEGm7de10rLvs+pKXxwblHLoro+pFkzsVAn0I/Nwp94jq3A9wCRu
         9Xn6UkqGXw5i+7PYnOWz8IxsyvothPe3C1LF1Qf5Zn8FU/dA2pmGTJ/uZPFaOQtBIllm
         7QWbAneyoYo4EbUC8jLBkB76TB8hALh/YWsRwGwD9ca21FnCU0v6ZHJGq9BMaHj0Tp+9
         26RB4NcnNFaHQDAtKmnObrKuL4S56CQlUuZOqYbzIawHRckTN7Df1+pOLIfMvW13t3lp
         XtIDTFIy9pigjU/DURj/SggxigJ5rbN6DtI8iKZXm9d1vdF8NzPbB0asVce1fAGnrm70
         CKEw==
X-Forwarded-Encrypted: i=1; AJvYcCU47jAAObbaP0CP7MmTt8B6xNlK76JyO2VNgcgQaKIcSX/waugGBfneMtQIDe2eAooSjicIbWBgQvzaXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN4YE0i7rnCbbaGKBGcAYt2605CKGCoJFS2g3j26Ba1o5FJYlk
	AhguC7SGEvoVj45Sj+1WR5wZcMNrBU2A2ZmuVQCmAC9e0oGej2C0sf+78c3g/Fc=
X-Gm-Gg: ASbGnctc4dhcvppWJD7mNNFAQ/NelZT80ncTUuBKQ/k8D6zAJ1qUu9uA2JePMuzsSmA
	Xf70IkVOVowbnF4Gm2+CyMATFS3YNQdRTJ8lr5lmgkBVhiSN8TrSYCxGqMm9yt/ijI5ka6r6RL4
	QAOoMu2+J7vJPLrSZZiFl4inG3wsPmqckpsxo/MRytsE+FOr72nrhEQ19wu01sXa+1t9ejlJcNp
	C5UGkK7QJEKKJwB/0hPb71YRVJxjiSnOP6/uArd+kxm5tU3RDYd
X-Google-Smtp-Source: AGHT+IEre0AsdJDUsGl4k/O1aF6vQLIHA3Knu3Spyy4azSMvw1UNUQEJLtptbRCNfCZV9aZHSRvhEg==
X-Received: by 2002:a17:903:124f:b0:215:83e1:99ff with SMTP id d9443c01a7336-21a83f63f68mr150756545ad.27.1736537464834;
        Fri, 10 Jan 2025 11:31:04 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4bc7:d274:c14b:fde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219a94sm16883985ad.129.2025.01.10.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:31:04 -0800 (PST)
Date: Fri, 10 Jan 2025 11:31:01 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4F1dXQLPGZ3JFI5@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4BEygdXmofWBr0-@x1>
 <Z4BVK3D7sN-XYg2o@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4BVK3D7sN-XYg2o@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_113105_809732_CF9B07D1 
X-CRM114-Status: GOOD (  35.86  )
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

T24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMDM6MDA6NTlQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDA2OjUxOjA2UE0gLTAzMDAsIEFybmFs
ZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+IE9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDA1
OjQ5OjQyUE0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+ID4gQlRX
IHRoaXMgc2VyaWVzIGlzIGFscmVhZHkgcHVzaGVkIG91dCB0byBwZXJmLXRvb2xzLW5leHQ6Cj4g
PiA+IAo+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvbG9nLz9oPXBlcmYtdG9vbHMtbmV4dAo+ID4gCj4g
PiBIZXksIG5vdyBJIG5vdGljZWQgdGhhdCB3aXRoIHRoaXMgbGF0ZXN0IHZlcnNpb24gd2Ugc2Vl
Ogo+ID4gCj4gPiDirKIgW2FjbWVAdG9vbGJveCBwZXJmLXRvb2xzLW5leHRdJCBtCj4gPiBtYWtl
OiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29s
cy9wZXJmJwo+ID4gICBCVUlMRDogICBEb2luZyAnbWFrZSAtajI4JyBwYXJhbGxlbCBidWlsZAo+
ID4gV2FybmluZzogS2VybmVsIEFCSSBoZWFkZXIgZGlmZmVyZW5jZXM6Cj4gPiAgIGRpZmYgLXUg
dG9vbHMvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oIGFyY2gvYXJtNjQvaW5j
bHVkZS91YXBpL2FzbS91bmlzdGQuaAo+ID4gCj4gPiBBdXRvLWRldGVjdGluZyBzeXN0ZW0gZmVh
dHVyZXM6Cj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYmR3OiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdsaWJjOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGliYmZkOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgIGxpYmJmZC1idWlsZGlkOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGliZWxmOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJudW1hOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICBudW1hX251bV9wb3NzaWJsZV9jcHVzOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJwZXJsOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlicHl0aG9uOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGliY3J5cHRvOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlidW53aW5kOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYmNhcHN0b25lOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGx2bS1wZXJmOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB6bGliOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsem1hOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X2NwdWlkOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnBmOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGliYWlvOiBb
IG9uICBdCj4gPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ6c3RkOiBb
IG9uICBdCj4gPiAKPiA+ICAgIC9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9w
ZXJmL3NjcmlwdHMvc3lzY2FsbHRibC5zaCAgLS1hYmlzIGNvbW1vbiwzMixpMzg2IC9ob21lL2Fj
bWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL2FyY2gveDg2L2VudHJ5L3N5c2NhbGxz
L3N5c2NhbGxfMzIudGJsIC90bXAvYnVpbGQvcGVyZi10b29scy1uZXh0L2FyY2gveDg2L2luY2x1
ZGUvZ2VuZXJhdGVkL2FzbS9zeXNjYWxsc18zMi5oCj4gPiAgICAvaG9tZS9hY21lL2dpdC9wZXJm
LXRvb2xzLW5leHQvdG9vbHMvcGVyZi9zY3JpcHRzL3N5c2NhbGx0Ymwuc2ggIC0tYWJpcyBjb21t
b24sNjQgL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvYXJjaC94ODYv
ZW50cnkvc3lzY2FsbHMvc3lzY2FsbF82NC50YmwgL3RtcC9idWlsZC9wZXJmLXRvb2xzLW5leHQv
YXJjaC94ODYvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3N5c2NhbGxzXzY0LmgKPiA+ICAgR0VOICAg
ICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9jb21tb24tY21kcy5oCj4gPiAgIEdFTiAgICAg
L3RtcC9idWlsZC9wZXJmLXRvb2xzLW5leHQvYXJjaC9hcm02NC9pbmNsdWRlL2dlbmVyYXRlZC9h
c20vc3lzcmVnLWRlZnMuaAo+ID4gICBQRVJGX1ZFUlNJT04gPSA2LjEzLnJjMi5nZDczOTgyYzM5
MTgzCj4gPiAgIEdFTiAgICAgcGVyZi1hcmNoaXZlCj4gPiAgIEdFTiAgICAgcGVyZi1pb3N0YXQK
PiA+ICAgTUtESVIgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS8KPiA+ICAgTUtE
SVIgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS8KPiA+ICAgTUtESVIgICAvdG1w
L2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS8KPiA+ICAgTUtESVIgICAvdG1wL2J1aWxkL3Bl
cmYtdG9vbHMtbmV4dC9qdm10aS8KPiA+IAo+ID4gCj4gPiBXaGlsZSB3aXRoIHRoZSBwcmV2aW91
cyBvbmUgd2Ugd291bGQgc2VlIHNvbWV0aGluZyBsaWtlIFNZU0NBTExUQkwgYXMKPiA+IHRoZSBz
dGVwIG5hbWUsIGxpa2Ugd2UgaGF2ZSBHRU4sIE1LRElSLCBldGMsIGNhbiB5b3UgdGFrZSBhIGxv
b2s/Cj4gCj4gT29oIG9rYXkgSSBzZWUsIHRoZSBxdWlldCBjb21tYW5kcyB3ZXJlIGJlaW5nIGln
bm9yZWQgYXMtaXMuIFdlIGNvdWxkCj4gYWRkIHRoZSBsaW5lcyB0byBoYW5kbGUgdGhpcyB0byBN
YWtlZmlsZS5zeXNjYWxscywgYnV0IEkgdGhpbmsgdGhlCj4gYmV0dGVyIHNvbHV0aW9uIGlzIHRv
IG1vdmUgdGhlIGxpbmVzIGZyb20gTWFrZWZpbGUuYnVpbGQgdG8KPiBNYWtlZmlsZS5wZXJmIHRv
IGJlIG1vcmUgZ2VuZXJpY2FsbHkgYXZhaWxhYmxlLiBIZXJlIGlzIGEgcGF0Y2ggZm9yCj4gdGhh
dC4gSSBhbHNvIGFkZGVkIHRoZSBjb21tZW50IGZyb20gdGhlIGtlcm5lbCBNYWtlZmlsZSBkZXNj
cmliaW5nIHdoYXQKPiB0aGlzIGRvZXMuCj4gCj4gRnJvbSA4ZGNlYzdmNWQ5MzdlZGUzZDMzYzY4
NzU3M2RjMmYxNjU0ZGRjNTllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IENoYXJs
aWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gRGF0ZTogVGh1LCA5IEphbiAyMDI1
IDE0OjM2OjQwIC0wODAwCj4gU3ViamVjdDogW1BBVENIXSBwZXJmIHRvb2xzOiBFeHBvc2UgcXVp
ZXQvdmVyYm9zZSB2YXJpYWJsZXMgaW4gTWFrZWZpbGUucGVyZgo+IAo+IFRoZSB2YXJpYWJsZXMg
dG8gbWFrZSBidWlsZHMgc2lsZW50L3ZlcmJvc2UgbGl2ZSBpbnNpZGUKPiB0b29scy9idWlsZC9N
YWtlZmlsZS5idWlsZC4gTW92ZSB0aG9zZSB2YXJpYWJsZXMgdG8gdGhlIHRvcC1sZXZlbAo+IE1h
a2VmaWxlLnBlcmYgdG8gYmUgZ2VuZXJhbGx5IGF2YWlsYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+ICB0b29scy9i
dWlsZC9NYWtlZmlsZS5idWlsZCB8IDIwIC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL3Bl
cmYvTWFrZWZpbGUucGVyZiAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZCBiL3Rvb2xzL2J1
aWxkL01ha2VmaWxlLmJ1aWxkCj4gaW5kZXggNWZiM2ZiM2Q5N2UwLi5lNzEwZWQ2N2ExYjQgMTAw
NjQ0Cj4gLS0tIGEvdG9vbHMvYnVpbGQvTWFrZWZpbGUuYnVpbGQKPiArKysgYi90b29scy9idWls
ZC9NYWtlZmlsZS5idWlsZAo+IEBAIC0xMiwyNiArMTIsNiBAQAo+ICBQSE9OWSA6PSBfX2J1aWxk
Cj4gIF9fYnVpbGQ6Cj4gIAo+IC1pZmVxICgkKFYpLDEpCj4gLSAgcXVpZXQgPQo+IC0gIFEgPQo+
IC1lbHNlCj4gLSAgcXVpZXQ9cXVpZXRfCj4gLSAgUT1ACj4gLWVuZGlmCj4gLQo+IC0jIElmIHRo
ZSB1c2VyIGlzIHJ1bm5pbmcgbWFrZSAtcyAoc2lsZW50IG1vZGUpLCBzdXBwcmVzcyBlY2hvaW5n
IG9mIGNvbW1hbmRzCj4gLSMgbWFrZS00LjAgKGFuZCBsYXRlcikga2VlcCBzaW5nbGUgbGV0dGVy
IG9wdGlvbnMgaW4gdGhlIDFzdCB3b3JkIG9mIE1BS0VGTEFHUy4KPiAtaWZlcSAoJChmaWx0ZXIg
My4lLCQoTUFLRV9WRVJTSU9OKSksKQo+IC1zaG9ydC1vcHRzIDo9ICQoZmlyc3R3b3JkIC0kKE1B
S0VGTEFHUykpCj4gLWVsc2UKPiAtc2hvcnQtb3B0cyA6PSAkKGZpbHRlci1vdXQgLS0lLCQoTUFL
RUZMQUdTKSkKPiAtZW5kaWYKPiAtCj4gLWlmbmVxICgkKGZpbmRzdHJpbmcgcywkKHNob3J0LW9w
dHMpKSwpCj4gLSAgcXVpZXQ9c2lsZW50Xwo+IC1lbmRpZgo+IC0KPiAgYnVpbGQtZGlyIDo9ICQo
c3JjdHJlZSkvdG9vbHMvYnVpbGQKPiAgCj4gICMgRGVmaW5lICQoZml4ZGVwKSBmb3IgZGVwLWNt
ZCBmdW5jdGlvbgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYgYi90b29s
cy9wZXJmL01ha2VmaWxlLnBlcmYKPiBpbmRleCBhNDQ5ZDAwMTU1MzYuLjU1ZDZjZTllYTUyZiAx
MDA2NDQKPiAtLS0gYS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYKPiArKysgYi90b29scy9wZXJm
L01ha2VmaWxlLnBlcmYKPiBAQCAtMTYxLDEyICsxNjEsNDcgQEAgZXhwb3J0IFZQQVRICj4gIFNP
VVJDRSA6PSAkKHNoZWxsIGxuIC1zZiAkKHNyY3RyZWUpL3Rvb2xzL3BlcmYgJChPVVRQVVQpL3Nv
dXJjZSkKPiAgZW5kaWYKPiAgCj4gKyMgQmVhdXRpZnkgb3V0cHV0Cj4gKyMgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gKyMKPiArIyBNb3N0IG9mIGJ1aWxkIGNvbW1hbmRzIGluIEtidWlsZCBzdGFydCB3
aXRoICJjbWRfIi4gWW91IGNhbiBvcHRpb25hbGx5IGRlZmluZQo+ICsjICJxdWlldF9jbWRfKiIu
IElmIGRlZmluZWQsIHRoZSBzaG9ydCBsb2cgaXMgcHJpbnRlZC4gT3RoZXJ3aXNlLCBubyBsb2cg
ZnJvbQo+ICsjIHRoYXQgY29tbWFuZCBpcyBwcmludGVkIGJ5IGRlZmF1bHQuCj4gKyMKPiArIyBl
LmcuKQo+ICsjICAgIHF1aWV0X2NtZF9kZXBtb2QgPSBERVBNT0QgICQoTU9ETElCKQo+ICsjICAg
ICAgICAgIGNtZF9kZXBtb2QgPSAkKHNyY3RyZWUpL3NjcmlwdHMvZGVwbW9kLnNoICQoREVQTU9E
KSAkKEtFUk5FTFJFTEVBU0UpCj4gKyMKPiArIyBBIHNpbXBsZSB2YXJpYW50IGlzIHRvIHByZWZp
eCBjb21tYW5kcyB3aXRoICQoUSkgLSB0aGF0J3MgdXNlZnVsCj4gKyMgZm9yIGNvbW1hbmRzIHRo
YXQgc2hhbGwgYmUgaGlkZGVuIGluIG5vbi12ZXJib3NlIG1vZGUuCj4gKyMKPiArIyAgICAkKFEp
JChNQUtFKSAkKGJ1aWxkKT1zY3JpcHRzL2Jhc2ljCj4gKyMKPiArIyBUbyBwdXQgbW9yZSBmb2N1
cyBvbiB3YXJuaW5ncywgYmUgbGVzcyB2ZXJib3NlIGFzIGRlZmF1bHQKPiArIyBVc2UgJ21ha2Ug
Vj0xJyB0byBzZWUgdGhlIGZ1bGwgY29tbWFuZHMKPiArCj4gIGlmZXEgKCQoViksMSkKPiArICBx
dWlldCA9Cj4gICAgUSA9Cj4gIGVsc2UKPiAtICBRID0gQAo+ICsgIHF1aWV0PXF1aWV0Xwo+ICsg
IFE9QAo+ICBlbmRpZgo+ICAKPiArIyBJZiB0aGUgdXNlciBpcyBydW5uaW5nIG1ha2UgLXMgKHNp
bGVudCBtb2RlKSwgc3VwcHJlc3MgZWNob2luZyBvZiBjb21tYW5kcwo+ICsjIG1ha2UtNC4wIChh
bmQgbGF0ZXIpIGtlZXAgc2luZ2xlIGxldHRlciBvcHRpb25zIGluIHRoZSAxc3Qgd29yZCBvZiBN
QUtFRkxBR1MuCj4gK2lmZXEgKCQoZmlsdGVyIDMuJSwkKE1BS0VfVkVSU0lPTikpLCkKPiArc2hv
cnQtb3B0cyA6PSAkKGZpcnN0d29yZCAtJChNQUtFRkxBR1MpKQo+ICtlbHNlCj4gK3Nob3J0LW9w
dHMgOj0gJChmaWx0ZXItb3V0IC0tJSwkKE1BS0VGTEFHUykpCj4gK2VuZGlmCj4gKwo+ICtpZm5l
cSAoJChmaW5kc3RyaW5nIHMsJChzaG9ydC1vcHRzKSksKQo+ICsgIHF1aWV0PXNpbGVudF8KPiAr
ZW5kaWYKPiArCj4gK2V4cG9ydCBxdWlldCBRCj4gKwo+ICAjIERvIG5vdCB1c2UgbWFrZSdzIGJ1
aWx0LWluIHJ1bGVzCj4gICMgKHRoaXMgaW1wcm92ZXMgcGVyZm9ybWFuY2UgYW5kIGF2b2lkcyBo
YXJkLXRvLWRlYnVnIGJlaGF2aW91cik7Cj4gIE1BS0VGTEFHUyArPSAtcgo+IC0tIAo+IDIuMzQu
MQo+IAo+IAo+IC0gQ2hhcmxpZQoKTGV0IG1lIGtub3cgaG93IHlvdSB3YW50IHRvIGhhbmRsZSB0
aGlzLCBJIGNhbiBzZW5kIHRoaXMgb3V0IGFzIGEKc2VwYXJhdGUgcGF0Y2ggaWYgdGhhdCdzIGJl
dHRlci4KCi0gQ2hhcmxpZQoKPiAKPiA+IAo+ID4gQWxsIGlzIG91dCB0aGVyZSBpbiBwZXJmLXRv
b2xzLW5leHQuCj4gPiAKPiA+IC0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
