Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943FEE7719A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 23:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vY94wPqwJpMAZC7fVx8bMGcZ4vFF2dVzRf6IEt3/E8A=; b=L//njMIckVibUL
	tubrmCUdo6d8s0HoIPnzdGoRjZ+btKlH4QJm0THO1NEfLjX5tGxVjavi0gBqIHemtsrQgXQwb8Cfu
	THGdRoEY5Sq9Kynn8NsChkGENqoFA7OuwkBBkCFdSOmbOzC5Oqqe8axl1fjze6rLN1gAAr/k8Ss+T
	oHROb3SrZoqm9fsYfOsVHp0OoBz7U3B3FGXIAiPnb9mb1q/mdtzUufgBUBn6v8Ek2ccUF1osWxK2Y
	UwJLvqqMb6vvNvdmm120IppbocJ5Zsxqup8U8sFkj53aSenp3Q6vU6R5lTCRBnWPkob4ydtxiYj6g
	36SZQrFe2hasnyTD6Qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1WW-0000000DVtl-3GSi;
	Thu, 09 Jan 2025 23:01:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1WS-0000000DVsk-0abV
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 23:01:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-216281bc30fso27970875ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 15:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736463663; x=1737068463; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u1Rto3tQvT3jFN5xuxXHqKLZjGHCEokZTCe6xmBnORw=;
        b=ci8vo2X+hYfooy5zxk/I99alCnqUNMKWVLEgE78IdOZwMk/yd9yCWaPeCcbhJj8oNd
         YIdxmk12A9zrGXpGC0DT1PZb7uvZk5FWt3KRiU1CyNp1FgcdCIdf96FR7H9sHKZVCUtY
         QCBDNQ0Iy3F6jEnpBwwn/XICIUyjoIEa99EwU+v5G62OvHZxFAYu0Q0Q4spkQkCxMJfa
         Suh2IHd8QHILAOIRIL++2tcx83BaQhu+yrtI4wkOeTRet+z4DrvTtTygZIp2HCf0aF0C
         v/qjwvigtwQTssUT9DE+vKcilIJmTQ+rPLp5EF1YSnNjgNw6wd/hq3n6y6l8DNoiid6S
         fBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736463663; x=1737068463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1Rto3tQvT3jFN5xuxXHqKLZjGHCEokZTCe6xmBnORw=;
        b=M1XgdC8Rltd/FnuP0CFFcyOJT7y0C11Y6GwEQX9zd3CaDU8g/29voNQQoBIfkaIzsh
         aXyIfCLnsqi49+hOiatmjiG/KruCnhcr2cVvMtpQzGJZo0YC+DfK1FBx28QG7XOb8Pib
         x1A8/zqxxMLdqp5D8DHtRuScyR3Z4L/DgTSGKTd7CaeKU6clQ593EQ0KdqcEZd07RhKx
         pRlGsCWzsk8ErHvNvmb6Bqgm/SvH1thKidlJ6lY8C+YDoik1ZUPwlqxzIudP7aXIu9Gr
         7FUhY/6TawzchI4H48NFq2CwVD57OkXRqFgkq+4abjFkZKC8LOLods2aI21cxb/2GGGF
         mcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVxNmo7C6PJTJwdN6PIL6nCeiE8n/6YFwbpeHg6M6dnKBZU84LdPEaGZUyCsF/ZZC3rOlbQv3Z7Fb/8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzopZUXG/NhpgFodA/EaJqKy0IgyJcpiu4LdFZ7kNRNOPL6sUAE
	q9OYo/C6fyj0t4udDMj/KVpXmreDg/XjJELc+ybZ5hgf+v2y4AmplM6KwdvqWYc=
X-Gm-Gg: ASbGnctI1/opV9jndw6ERQ0Hsf5rPqaVoA37ZQWaYQ3CdcF2TmX4Xq6v2dekeaqNTnZ
	K36mTalha0V/6Kut0r4KvIZN/djI/qXrge5xjhXoEnRZyCd1CNr2aBDCoJ4GIdNaEU+vnTq0RBo
	13Ld8ANRSth7j+3Cu7SabAy5iB77p09lPiG/AA9IydPG15gOPpSnhSW7GcE2ZZot/XiwODlKlRN
	nFToe0M2/6Zaeage0QfN8FWhn7EE6U1fjD7IN/rVEIJe6Sfx4ka
X-Google-Smtp-Source: AGHT+IHHLbAhu86VzYd6LBFp5j+Q2QinJd1yN68qZ09Yns1ZwY4dgQCRzdIJeqQ19rPDtpnqmFcSKA==
X-Received: by 2002:a17:902:f70f:b0:216:32ea:c84b with SMTP id d9443c01a7336-21a83fc3652mr135133105ad.37.1736463663201;
        Thu, 09 Jan 2025 15:01:03 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f234984sm2890475ad.205.2025.01.09.15.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:01:02 -0800 (PST)
Date: Thu, 9 Jan 2025 15:00:59 -0800
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
Message-ID: <Z4BVK3D7sN-XYg2o@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4BEygdXmofWBr0-@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4BEygdXmofWBr0-@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_150104_407431_D8A063F6 
X-CRM114-Status: GOOD (  26.10  )
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

T24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMDY6NTE6MDZQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDA1OjQ5OjQyUE0gLTAz
MDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+IEJUVyB0aGlzIHNlcmllcyBp
cyBhbHJlYWR5IHB1c2hlZCBvdXQgdG8gcGVyZi10b29scy1uZXh0Ogo+ID4gCj4gPiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMt
bmV4dC5naXQvbG9nLz9oPXBlcmYtdG9vbHMtbmV4dAo+IAo+IEhleSwgbm93IEkgbm90aWNlZCB0
aGF0IHdpdGggdGhpcyBsYXRlc3QgdmVyc2lvbiB3ZSBzZWU6Cj4gCj4g4qyiIFthY21lQHRvb2xi
b3ggcGVyZi10b29scy1uZXh0XSQgbQo+IG1ha2U6IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUv
YWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYnCj4gICBCVUlMRDogICBEb2luZyAn
bWFrZSAtajI4JyBwYXJhbGxlbCBidWlsZAo+IFdhcm5pbmc6IEtlcm5lbCBBQkkgaGVhZGVyIGRp
ZmZlcmVuY2VzOgo+ICAgZGlmZiAtdSB0b29scy9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20v
dW5pc3RkLmggYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oCj4gCj4gQXV0by1k
ZXRlY3Rpbmcgc3lzdGVtIGZlYXR1cmVzOgo+IC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGliZHc6IFsgb24gIF0KPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdsaWJjOiBbIG9uICBdCj4gLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYmJmZDogWyBvbiAgXQo+IC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgbGliYmZk
LWJ1aWxkaWQ6IFsgb24gIF0KPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGliZWxmOiBbIG9uICBdCj4gLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGli
bnVtYTogWyBvbiAgXQo+IC4uLiAgICAgICAgICAgICAgICAgIG51bWFfbnVtX3Bvc3NpYmxlX2Nw
dXM6IFsgb24gIF0KPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJwZXJs
OiBbIG9uICBdCj4gLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnB5dGhvbjog
WyBvbiAgXQo+IC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJjcnlwdG86IFsg
b24gIF0KPiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlidW53aW5kOiBbIG9u
ICBdCj4gLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJjYXBzdG9uZTogWyBvbiAg
XQo+IC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsbHZtLXBlcmY6IFsgb24gIF0K
PiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB6bGliOiBbIG9uICBdCj4g
Li4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbHptYTogWyBvbiAgXQo+IC4u
LiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfY3B1aWQ6IFsgb24gIF0KPiAuLi4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnBmOiBbIG9uICBdCj4gLi4uICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYmFpbzogWyBvbiAgXQo+IC4uLiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnpzdGQ6IFsgb24gIF0KPiAKPiAgICAvaG9t
ZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9zY3JpcHRzL3N5c2NhbGx0Ymwu
c2ggIC0tYWJpcyBjb21tb24sMzIsaTM4NiAvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQv
dG9vbHMvcGVyZi9hcmNoL3g4Ni9lbnRyeS9zeXNjYWxscy9zeXNjYWxsXzMyLnRibCAvdG1wL2J1
aWxkL3BlcmYtdG9vbHMtbmV4dC9hcmNoL3g4Ni9pbmNsdWRlL2dlbmVyYXRlZC9hc20vc3lzY2Fs
bHNfMzIuaAo+ICAgIC9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL3Nj
cmlwdHMvc3lzY2FsbHRibC5zaCAgLS1hYmlzIGNvbW1vbiw2NCAvaG9tZS9hY21lL2dpdC9wZXJm
LXRvb2xzLW5leHQvdG9vbHMvcGVyZi9hcmNoL3g4Ni9lbnRyeS9zeXNjYWxscy9zeXNjYWxsXzY0
LnRibCAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9hcmNoL3g4Ni9pbmNsdWRlL2dlbmVyYXRl
ZC9hc20vc3lzY2FsbHNfNjQuaAo+ICAgR0VOICAgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4
dC9jb21tb24tY21kcy5oCj4gICBHRU4gICAgIC90bXAvYnVpbGQvcGVyZi10b29scy1uZXh0L2Fy
Y2gvYXJtNjQvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3N5c3JlZy1kZWZzLmgKPiAgIFBFUkZfVkVS
U0lPTiA9IDYuMTMucmMyLmdkNzM5ODJjMzkxODMKPiAgIEdFTiAgICAgcGVyZi1hcmNoaXZlCj4g
ICBHRU4gICAgIHBlcmYtaW9zdGF0Cj4gICBNS0RJUiAgIC90bXAvYnVpbGQvcGVyZi10b29scy1u
ZXh0L2p2bXRpLwo+ICAgTUtESVIgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS8K
PiAgIE1LRElSICAgL3RtcC9idWlsZC9wZXJmLXRvb2xzLW5leHQvanZtdGkvCj4gICBNS0RJUiAg
IC90bXAvYnVpbGQvcGVyZi10b29scy1uZXh0L2p2bXRpLwo+IAo+IAo+IFdoaWxlIHdpdGggdGhl
IHByZXZpb3VzIG9uZSB3ZSB3b3VsZCBzZWUgc29tZXRoaW5nIGxpa2UgU1lTQ0FMTFRCTCBhcwo+
IHRoZSBzdGVwIG5hbWUsIGxpa2Ugd2UgaGF2ZSBHRU4sIE1LRElSLCBldGMsIGNhbiB5b3UgdGFr
ZSBhIGxvb2s/CgpPb2ggb2theSBJIHNlZSwgdGhlIHF1aWV0IGNvbW1hbmRzIHdlcmUgYmVpbmcg
aWdub3JlZCBhcy1pcy4gV2UgY291bGQKYWRkIHRoZSBsaW5lcyB0byBoYW5kbGUgdGhpcyB0byBN
YWtlZmlsZS5zeXNjYWxscywgYnV0IEkgdGhpbmsgdGhlCmJldHRlciBzb2x1dGlvbiBpcyB0byBt
b3ZlIHRoZSBsaW5lcyBmcm9tIE1ha2VmaWxlLmJ1aWxkIHRvCk1ha2VmaWxlLnBlcmYgdG8gYmUg
bW9yZSBnZW5lcmljYWxseSBhdmFpbGFibGUuIEhlcmUgaXMgYSBwYXRjaCBmb3IKdGhhdC4gSSBh
bHNvIGFkZGVkIHRoZSBjb21tZW50IGZyb20gdGhlIGtlcm5lbCBNYWtlZmlsZSBkZXNjcmliaW5n
IHdoYXQKdGhpcyBkb2VzLgoKRnJvbSA4ZGNlYzdmNWQ5MzdlZGUzZDMzYzY4NzU3M2RjMmYxNjU0
ZGRjNTllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPgpEYXRlOiBUaHUsIDkgSmFuIDIwMjUgMTQ6MzY6NDAgLTA4MDAK
U3ViamVjdDogW1BBVENIXSBwZXJmIHRvb2xzOiBFeHBvc2UgcXVpZXQvdmVyYm9zZSB2YXJpYWJs
ZXMgaW4gTWFrZWZpbGUucGVyZgoKVGhlIHZhcmlhYmxlcyB0byBtYWtlIGJ1aWxkcyBzaWxlbnQv
dmVyYm9zZSBsaXZlIGluc2lkZQp0b29scy9idWlsZC9NYWtlZmlsZS5idWlsZC4gTW92ZSB0aG9z
ZSB2YXJpYWJsZXMgdG8gdGhlIHRvcC1sZXZlbApNYWtlZmlsZS5wZXJmIHRvIGJlIGdlbmVyYWxs
eSBhdmFpbGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPgotLS0KIHRvb2xzL2J1aWxkL01ha2VmaWxlLmJ1aWxkIHwgMjAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIHRvb2xzL3BlcmYvTWFrZWZpbGUucGVyZiAgIHwgMzcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25z
KCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9idWlsZC9NYWtlZmlsZS5i
dWlsZCBiL3Rvb2xzL2J1aWxkL01ha2VmaWxlLmJ1aWxkCmluZGV4IDVmYjNmYjNkOTdlMC4uZTcx
MGVkNjdhMWI0IDEwMDY0NAotLS0gYS90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZAorKysgYi90
b29scy9idWlsZC9NYWtlZmlsZS5idWlsZApAQCAtMTIsMjYgKzEyLDYgQEAKIFBIT05ZIDo9IF9f
YnVpbGQKIF9fYnVpbGQ6CiAKLWlmZXEgKCQoViksMSkKLSAgcXVpZXQgPQotICBRID0KLWVsc2UK
LSAgcXVpZXQ9cXVpZXRfCi0gIFE9QAotZW5kaWYKLQotIyBJZiB0aGUgdXNlciBpcyBydW5uaW5n
IG1ha2UgLXMgKHNpbGVudCBtb2RlKSwgc3VwcHJlc3MgZWNob2luZyBvZiBjb21tYW5kcwotIyBt
YWtlLTQuMCAoYW5kIGxhdGVyKSBrZWVwIHNpbmdsZSBsZXR0ZXIgb3B0aW9ucyBpbiB0aGUgMXN0
IHdvcmQgb2YgTUFLRUZMQUdTLgotaWZlcSAoJChmaWx0ZXIgMy4lLCQoTUFLRV9WRVJTSU9OKSks
KQotc2hvcnQtb3B0cyA6PSAkKGZpcnN0d29yZCAtJChNQUtFRkxBR1MpKQotZWxzZQotc2hvcnQt
b3B0cyA6PSAkKGZpbHRlci1vdXQgLS0lLCQoTUFLRUZMQUdTKSkKLWVuZGlmCi0KLWlmbmVxICgk
KGZpbmRzdHJpbmcgcywkKHNob3J0LW9wdHMpKSwpCi0gIHF1aWV0PXNpbGVudF8KLWVuZGlmCi0K
IGJ1aWxkLWRpciA6PSAkKHNyY3RyZWUpL3Rvb2xzL2J1aWxkCiAKICMgRGVmaW5lICQoZml4ZGVw
KSBmb3IgZGVwLWNtZCBmdW5jdGlvbgpkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9NYWtlZmlsZS5w
ZXJmIGIvdG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmCmluZGV4IGE0NDlkMDAxNTUzNi4uNTVkNmNl
OWVhNTJmIDEwMDY0NAotLS0gYS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYKKysrIGIvdG9vbHMv
cGVyZi9NYWtlZmlsZS5wZXJmCkBAIC0xNjEsMTIgKzE2MSw0NyBAQCBleHBvcnQgVlBBVEgKIFNP
VVJDRSA6PSAkKHNoZWxsIGxuIC1zZiAkKHNyY3RyZWUpL3Rvb2xzL3BlcmYgJChPVVRQVVQpL3Nv
dXJjZSkKIGVuZGlmCiAKKyMgQmVhdXRpZnkgb3V0cHV0CisjIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IworIyBNb3N0IG9mIGJ1aWxkIGNvbW1hbmRzIGluIEtidWlsZCBzdGFydCB3aXRoICJjbWRfIi4g
WW91IGNhbiBvcHRpb25hbGx5IGRlZmluZQorIyAicXVpZXRfY21kXyoiLiBJZiBkZWZpbmVkLCB0
aGUgc2hvcnQgbG9nIGlzIHByaW50ZWQuIE90aGVyd2lzZSwgbm8gbG9nIGZyb20KKyMgdGhhdCBj
b21tYW5kIGlzIHByaW50ZWQgYnkgZGVmYXVsdC4KKyMKKyMgZS5nLikKKyMgICAgcXVpZXRfY21k
X2RlcG1vZCA9IERFUE1PRCAgJChNT0RMSUIpCisjICAgICAgICAgIGNtZF9kZXBtb2QgPSAkKHNy
Y3RyZWUpL3NjcmlwdHMvZGVwbW9kLnNoICQoREVQTU9EKSAkKEtFUk5FTFJFTEVBU0UpCisjCisj
IEEgc2ltcGxlIHZhcmlhbnQgaXMgdG8gcHJlZml4IGNvbW1hbmRzIHdpdGggJChRKSAtIHRoYXQn
cyB1c2VmdWwKKyMgZm9yIGNvbW1hbmRzIHRoYXQgc2hhbGwgYmUgaGlkZGVuIGluIG5vbi12ZXJi
b3NlIG1vZGUuCisjCisjICAgICQoUSkkKE1BS0UpICQoYnVpbGQpPXNjcmlwdHMvYmFzaWMKKyMK
KyMgVG8gcHV0IG1vcmUgZm9jdXMgb24gd2FybmluZ3MsIGJlIGxlc3MgdmVyYm9zZSBhcyBkZWZh
dWx0CisjIFVzZSAnbWFrZSBWPTEnIHRvIHNlZSB0aGUgZnVsbCBjb21tYW5kcworCiBpZmVxICgk
KFYpLDEpCisgIHF1aWV0ID0KICAgUSA9CiBlbHNlCi0gIFEgPSBACisgIHF1aWV0PXF1aWV0Xwor
ICBRPUAKIGVuZGlmCiAKKyMgSWYgdGhlIHVzZXIgaXMgcnVubmluZyBtYWtlIC1zIChzaWxlbnQg
bW9kZSksIHN1cHByZXNzIGVjaG9pbmcgb2YgY29tbWFuZHMKKyMgbWFrZS00LjAgKGFuZCBsYXRl
cikga2VlcCBzaW5nbGUgbGV0dGVyIG9wdGlvbnMgaW4gdGhlIDFzdCB3b3JkIG9mIE1BS0VGTEFH
Uy4KK2lmZXEgKCQoZmlsdGVyIDMuJSwkKE1BS0VfVkVSU0lPTikpLCkKK3Nob3J0LW9wdHMgOj0g
JChmaXJzdHdvcmQgLSQoTUFLRUZMQUdTKSkKK2Vsc2UKK3Nob3J0LW9wdHMgOj0gJChmaWx0ZXIt
b3V0IC0tJSwkKE1BS0VGTEFHUykpCitlbmRpZgorCitpZm5lcSAoJChmaW5kc3RyaW5nIHMsJChz
aG9ydC1vcHRzKSksKQorICBxdWlldD1zaWxlbnRfCitlbmRpZgorCitleHBvcnQgcXVpZXQgUQor
CiAjIERvIG5vdCB1c2UgbWFrZSdzIGJ1aWx0LWluIHJ1bGVzCiAjICh0aGlzIGltcHJvdmVzIHBl
cmZvcm1hbmNlIGFuZCBhdm9pZHMgaGFyZC10by1kZWJ1ZyBiZWhhdmlvdXIpOwogTUFLRUZMQUdT
ICs9IC1yCi0tIAoyLjM0LjEKCgotIENoYXJsaWUKCj4gCj4gQWxsIGlzIG91dCB0aGVyZSBpbiBw
ZXJmLXRvb2xzLW5leHQuCj4gCj4gLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
