Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EB9D2E9D6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUqwPnc3riO8jHdn6IormN8eRadVHu6arxMCyqk//QY=; b=392/9kRL3A7JmK
	Q0NLPA7mDJ9SK7h5xKavv23h9EOoB1llbuw/n0D3igr9da6yb7CB2nHWV3sw/E/FipW0iID600oHE
	n5VCrJJ86iYM/JPxexPvTjpI2DsdWZ/cx75c/+E3rkmviSPRAEVKF7X7H5LGM8JV15QCsc07QreTo
	KLC27iiruwOrQLZmDWyWRPUWd4KJlaRW3Q43xIdV6Yb08+4f/uhPLTMwGDbV5nyhwUdEtioGEbS8V
	qVzImX5XhMASm6dVMrtHdR5S5Kx9VW6x28E+6ShlBRny2OlknFu4J1KGO0UQ7/DOPpAy48fVbofmz
	MEikrB2ztThe3pClb+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARv7-0000000HLHi-2eDE;
	Mon, 11 Nov 2024 10:45:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARv5-0000000HLGK-1xVG
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 10:45:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43152b79d25so35318265e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 02:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731321917; x=1731926717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkcwa4qxyt5fJEDceQ9OcHMtoLSfOU/SlGySwxlpX90=;
        b=X4boxzF1Dnx6zxRF6Col43L9n4XSsQoGr5pgi40ZgBiWH6DSvtmDS4kOKn5cMaaSKw
         ibXtqVTBUmxe8UMwvoVsyp256huKriqsplbSph3aVUqUrCoECZ8kK4yYAa+6J5Gj4T2q
         mihlwWIdPEF0+jjq/evtzQivoN04KNL7+ttLblu0qPcE2zWUMQ5zefbclmqNPohy8jaq
         /24b2j2qaTvrFn1HpWGrLUM5EsVeWLk5LcKzTD/JLJM3QYkY4qzgoYa8ZwTGaX7L5GI/
         CuMp930uDVwy/UYH/mCWZBNAJgrDyn3If9nbHNQ/vllXFtOKXJqteHDy9zGa3DQ7oBbM
         Wu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731321917; x=1731926717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkcwa4qxyt5fJEDceQ9OcHMtoLSfOU/SlGySwxlpX90=;
        b=fTpIau8WiUpgNAlumdqxQ9K+QyuUsoCjBGlNzff4IF9X68luJg8nnBdyDi7mLIYWFo
         6/3qkHUGt15uHr7+tCvAzyVD12Jj12TU/U0xxQ0YISrqytBV+0Gtf78UDOLwlIdG8ZwX
         ugfua77+Rm39vi2oqHIv+o++WBZzJdPw4AbU2m/M7bu9SY+YtMcN7K2fqg9L61rfxJoN
         X7gMKTVNuLWJPoW4Sy5Syk/5KN+2k2w5iT56D64UFbaaK70GB8ll9m1GiRJPyk7WdGmx
         vZ7ddCZ2nijN1pGM4Ve4PGEd9P3ZtNZzb3j1e3TwMiprpdsx9nmkDu0PQKPNe2LqQ+Wr
         4hXg==
X-Forwarded-Encrypted: i=1; AJvYcCWp1loKS23VTG8u9LZQVo/P/LS32pI23mC6RO1OtTTRUZyRIQvVWDDe0EAP/R4UvalaUqQibCNfTucg6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbjAW5s8gj6pAzwTRqwPiXnTuPGgpbDoQs/oJSNpNZEYGyrTe6
	/0wgkxYkc/kJsTB2WRj6JV1GLgZe0v/qDJU/RZKSIdFpmZ8KGho85UQ2DeP/CdnIrj4lkKrbAAx
	vbUY=
X-Google-Smtp-Source: AGHT+IEb5YEM4IHTW47uj3GCrDsg6lFCD+yW156W1Y2eOGScCTJOLJ+vRIrE7CeEoirSjK/dQhpA8g==
X-Received: by 2002:a05:600c:a04:b0:431:40ca:ce5d with SMTP id 5b1f17b1804b1-432b75172d6mr94146055e9.23.1731321917388;
        Mon, 11 Nov 2024 02:45:17 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a1f8sm213572885e9.30.2024.11.11.02.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 02:45:17 -0800 (PST)
Message-ID: <d9bfd75a-003a-4f65-abba-b8bcaad13682@linaro.org>
Date: Mon, 11 Nov 2024 10:45:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is
 provided
To: Atish Kumar Patra <atishp@rivosinc.com>, Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Gainey <ben.gainey@arm.com>, Junhao He <hejunhao3@huawei.com>,
 linux-riscv@lists.infradead.org, beeman@rivosinc.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Ze Gao <zegao2021@gmail.com>,
 Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>
References: <20241026121758.143259-1-irogers@google.com>
 <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
 <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org>
 <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_024519_544668_7FB58262 
X-CRM114-Status: GOOD (  36.10  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAwOC8xMS8yMDI0IDY6MzcgcG0sIEF0aXNoIEt1bWFyIFBhdHJhIHdyb3RlOgo+IE9uIEZy
aSwgTm92IDgsIDIwMjQgYXQgNDoxNuKAr0FNIEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5h
cm8ub3JnPiB3cm90ZToKPj4KPj4KPj4KPj4gT24gMDcvMTEvMjAyNCAxODo1MSwgSWFuIFJvZ2Vy
cyB3cm90ZToKPj4+IE9uIFNhdCwgT2N0IDI2LCAyMDI0IGF0IDU6MTjigK9BTSBJYW4gUm9nZXJz
IDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gQXQgdGhlIFJJU0MtViBzdW1t
aXQgdGhlIHRvcGljIG9mIGF2b2lkaW5nIGV2ZW50IGRhdGEgYmVpbmcgaW4gdGhlCj4+Pj4gUklT
Qy1WIFBNVSBrZXJuZWwgZHJpdmVyIGNhbWUgdXAuIFRoZXJlIGlzIGEgcHJlZmVyZW5jZSBmb3Ig
c3lzZnMvSlNPTgo+Pj4+IGV2ZW50cyBiZWluZyB0aGUgcHJpb3JpdHkgd2hlbiBubyBQTVUgaXMg
cHJvdmlkZWQgc28gdGhhdCBsZWdhY3kKPj4+PiBldmVudHMgbWF5YmUgc3VwcG9ydGVkIHZpYSBq
c29uLiBPcmlnaW5hbGx5IE1hcmsgUnV0bGFuZCBhbHNvCj4+Pj4gZXhwcmVzc2VkIGF0IExQQyAy
MDIzIHRoYXQgZG9pbmcgdGhpcyB3b3VsZCByZXNvbHZlIGJ1Z3Mgb24gQVJNIEFwcGxlCj4+Pj4g
TT8gcHJvY2Vzc29ycywgYnV0IEphbWVzIENsYXJrIG1vcmUgcmVjZW50bHkgdGVzdGVkIHRoaXMg
YW5kIGJlbGlldmVzCj4+Pj4gdGhlIGRyaXZlciBpc3N1ZXMgdGhlcmUgbWF5IG5vdCBoYXZlIGV4
aXN0ZWQgb3IgaGF2ZSBiZWVuIHJlc29sdmVkLiBJbgo+Pj4+IGFueSBjYXNlLCBpdCBpcyBpbmNv
bnNpc3RlbnQgdGhhdCB3aXRoIGEgUE1VIGV2ZW50IG5hbWVzIGF2b2lkIGxlZ2FjeQo+Pj4+IGVu
Y29kaW5ncywgYnV0IHdoZW4gd2lsZGNhcmRpbmcgUE1VcyAoaWUgd2l0aG91dCBhIFBNVSB3aXRo
IHRoZSBldmVudAo+Pj4+IG5hbWUpIHRoZSBsZWdhY3kgZW5jb2RpbmdzIGhhdmUgcHJpb3JpdHku
Cj4+Pj4KPj4+PiBUaGUgcGF0Y2ggZG9pbmcgdGhpcyB3b3JrIHdhcyByZXZlcnRlZCBpbiBhIHY2
LjEwIHJlbGVhc2UgY2FuZGlkYXRlCj4+Pj4gYXMsIGV2ZW4gdGhvdWdoIHRoZSBwYXRjaCB3YXMg
cG9zdGVkIGZvciB3ZWVrcyBhbmQgaGFkIGJlZW4gb24KPj4+PiBsaW51eC1uZXh0IGZvciB3ZWVr
cyB3aXRob3V0IGlzc3VlLCBMaW51cyB3YXMgaW4gdGhlIGhhYml0IG9mIHVzaW5nCj4+Pj4gZXhw
bGljaXQgbGVnYWN5IGV2ZW50cyB3aXRoIHVuc3VwcG9ydGVkIHByZWNpc2lvbiBvcHRpb25zIG9u
IGhpcwo+Pj4+IE5lb3ZlcnNlLU4xLiBUaGlzIG1hY2hpbmUgaGFzIFNMQyBQTVUgZXZlbnRzIGZv
ciBidXMgYW5kIENQVSBjeWNsZXMKPj4+PiB3aGVyZSBBUk0gZGVjaWRlZCB0byBjYWxsIHRoZSBl
dmVudHMgYnVzX2N5Y2xlcyBhbmQgY3ljbGVzLCB0aGUgbGF0dGVyCj4+Pj4gYmVpbmcgYWxzbyBh
IGxlZ2FjeSBldmVudCBuYW1lLiBBUk0gaGF2ZW4ndCByZW5hbWVkIHRoZSBjeWNsZXMgZXZlbnQK
Pj4+PiB0byBhIG1vcmUgY29uc2lzdGVudCBjcHVfY3ljbGVzIGFuZCBhdm9pZGVkIHRoZSBwcm9i
bGVtLiBXaXRoIHRoZXNlCj4+Pj4gY2hhbmdlcyB0aGUgcHJvYmxlbWF0aWMgZXZlbnQgd2lsbCBu
b3cgYmUgc2tpcHBlZCwgYSBsYXJnZSB3YXJuaW5nCj4+Pj4gcHJvZHVjZWQsIGFuZCBwZXJmIHJl
Y29yZCB3aWxsIGNvbnRpbnVlIGZvciB0aGUgb3RoZXIgUE1VIGV2ZW50cy4gVGhpcwo+Pj4+IHNv
bHV0aW9uIHdhcyBwcm9wb3NlZCBieSBBcm5hbGRvLgo+Pj4+Cj4+Pj4gVHdvIG1pbm9yIGNoYW5n
ZXMgaGF2ZSBiZWVuIGFkZGVkIHRvIGhlbHAgd2l0aCB0aGUgZXJyb3IgbWVzc2FnZSBhbmQKPj4+
PiB0byB3b3JrIGFyb3VuZCBpc3N1ZXMgb2NjdXJyaW5nIHdpdGggInBlcmYgc3RhdCBtZXRyaWNz
IChzaGFkb3cgc3RhdCkKPj4+PiB0ZXN0Ii4KPj4+Pgo+Pj4+IFRoZSBwYXRjaGVzIGhhdmUgb25s
eSBiZWVuIHRlc3RlZCBvbiBteSB4ODYgbm9uLWh5YnJpZCBsYXB0b3AuCj4+Pgo+Pj4gSGkgQXRp
c2ggYW5kIEphbWVzLAo+Pj4KPj4+IENvdWxkIEkgZ2V0IHlvdXIgdGFncyBmb3IgdGhpcyBzZXJp
ZXM/Cj4+Pgo+IAo+IEhpIElhbiwKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2hlcy4gSXQgZGVmaW5p
dGVseSBoZWxwcyB0byBoYXZlIGEgY2xlYW4gc2xhdGUKPiBpbXBsZW1lbnRhdGlvbgo+IGZvciB0
aGUgcGVyZiB0b29sLiBIb3dldmVyLCBJIGhhdmUgc29tZSBvcGVuIHF1ZXN0aW9ucyBhYm91dCBv
dGhlciB1c2UgY2FzZXMKPiB0aGF0IHdlIGRpc2N1c3NlZCBkdXJpbmcgdGhlIFJWSSBTdW1taXQu
Cj4gCj4+PiBUaGUgcGF0Y2hlcyB3ZXJlIG9yaWdpbmFsbHkgbW90aXZhdGVkIGJ5IHdhbnRpbmcg
dG8gbWFrZSB0aGUgYmVoYXZpb3IKPj4+IG9mIGV2ZW50cyBwYXJzZWQgbGlrZSAiY3ljbGVzIiBt
YXRjaCB0aGF0IG9mICJjcHUvY3ljbGVzLyIsIHRoZSBQTVUgaXMKPj4+IHdpbGRjYXJkZWQgdG8g
ImNwdSIgaW4gdGhlIGZpcnN0IGNhc2UuIFRoaXMgd2FzIGRpdmVyZ2VudCBiZWNhdXNlIG9mCj4+
PiBBUk0gd2Ugc3dpdGNoZWQgZnJvbSBwcmVmZXJyaW5nIGxlZ2FjeSAodHlwZSA9IFBFUkZfVFlQ
RV9IQVJEV0FSRSwKPj4+IGNvbmZpZyA9IFBFUkZfQ09VTlRfSFdfQ1BVX0NZQ0xFUykgdG8gc3lz
ZnMvanNvbiAodHlwZT08Y29yZSBQTVUncwo+Pj4gdHlwZT4sIGNvbmZpZz08ZW5jb2RpbmcgZnJv
bSBldmVudD4pIHdoZW4gYSBQTVUgbmFtZSB3YXMgZ2l2ZW4uIFRoaXMKPj4+IGFsaWducyB3aXRo
IFJJU0MtViB3YW50aW5nIHRvIHVzZSBqc29uIGVuY29kaW5ncyB0byBhdm9pZCBjb21wbGV4aXR5
Cj4+PiBpbiB0aGUgUE1VIGRyaXZlci4KPj4+Cj4+Cj4+IEkgY291bGRuJ3QgZmluZCB0aGUgdGhy
ZWFkLCBidXQgSSByZW1lbWJlciBmYWlybHkgcmVjZW50bHkgaXQgd2FzCj4+IG1lbnRpb25lZCB0
aGF0IFJJU0MtViB3b3VsZCBiZSBzdXBwb3J0aW5nIHRoZSBsZWdhY3kgZXZlbnRzIGFmdGVyIGFs
bCwKPj4gbWF5YmUgaXQgd2FzIGEgY29tbWVudCBmcm9tIEF0aXNoPyBJJ20gbm90IHN1cmUgaWYg
dGhhdCBjaGFuZ2VzIHRoZQo+PiByZXF1aXJlbWVudHMgZm9yIHRoaXMgb3Igbm90Pwo+Pgo+PiBJ
IHN0aWxsIGNhbid0IHJlYWxseSBpbWFnaW5lIGhvdyB0b29saW5nIHdvdWxkIHdvcmsgaWYgZXZl
cnkgdG9vbCBoYXMgdG8KPj4gbWFpbnRhaW4gdGhlIG1hcHBpbmdzIG9mIGJhc2ljIGV2ZW50cyBs
aWtlIGluc3RydWN0aW9ucyBhbmQgYnJhbmNoZXMuCj4+IEZvciBleGFtcGxlIGFsbCB0aGUgcGVy
Zl9ldmVudF9vcGVuIHRlc3RzIGluIGx0cCB1c2UgdGhlIGxlZ2FjeSBldmVudHMuCj4+Cj4gCj4g
Tm8gaXQgaGFzIG5vdCBjaGFuZ2VkLiBXaGlsZSB0aGlzIHNlcmllcyBoZWxwcyB0byBhdm9pZCBj
bHVua3kgdmVuZG9yCj4gc3BlY2lmaWMgZW5jb2RpbmdzCj4gaW4gdGhlIGRyaXZlciBmb3IgcGVy
ZiB0b29sLCBJIGFtIHN0aWxsIHVuc3VyZSBob3cgd2Ugd2lsbCBtYW5hZ2UKPiBvdGhlciBhcHBs
aWNhdGlvbnMKPiAoZGlyZWN0bHkgcGFzc2luZyBsZWdhY3kgZXZlbnRzIHRocm91Z2ggcGVyZl9l
dmVudF9vcGVuIG9yCj4gcGVyZl9ldmxpc3RfX29wZW4pIHdpbGwgd29yay4KPiAKPiBJIGhhdmUg
b25seSBhbmVjZG90YWwgZGF0YSBhYm91dCBmb2xrcyByZWx5aW5nIHBlcmYgbGVnYWN5IGV2ZW50
cwo+IGRpcmVjdGx5IHRvIHByb2ZpbGUKPiB0aGVpciBhcHBsaWNhdGlvbi4gQWxsIG9mIHRoZW0g
dXNlIG1vc3RseSBjeWNsZS9pbnN0cnVjdGlvbiBldmVudHMgdGhvdWdoLgo+IEFyZSB0aGVyZSBh
bnkgdXNlcnMgd2hvIHVzZSBvdGhlciBsZWdhY3kgZXZlbnRzIGRpcmVjdGx5IHdpdGhvdXQgcGVy
ZiB0b29sID8KPiAKPiBJZiBub3QsIHdlIG1heSBoYXZlIG9ubHkgY3ljbGUvaW5zdHJ1Y3Rpb24g
bWFwcGluZyBpbiB0aGUgZHJpdmVyIGFuZAo+IHJlbHkgb24ganNvbiBmb3IgZXZlcnl0aGluZyBl
bHNlLgo+IFRoZSBvdGhlciB1c2UgY2FzZSBpcyB2aXJ0dWFsaXphdGlvbi4gSSBoYXZlIGJlZW4g
cGxheWluZyB3aXRoIHRoZXNlCj4gcGF0Y2hlcyB0byBmaW5kIGEgY2xlYW4gc29sdXRpb24gdG8K
PiBlbmFibGUgYWxsIHRoZSB1c2UgY2FzZXMuIElmIHlvdSBoYXZlIGFueSBvdGhlciBpZGVhcywg
cGxlYXNlIGxldCBtZSBrbm93Lgo+IAoKWWVhaCBJIHdvdWxkIGV4cGVjdCBpdCdzIG1vc3RseSBj
eWNsZXMgYW5kIGluc3RydWN0aW9ucy4gSSBzZWFyY2hlZCBhIApiaXQgZm9yIFBFUkZfQ09VTlRf
SFdfQlJBTkNIX01JU1NFUyBhbmQgb25seSBmb3VuZCB0b29sL2RldmVsb3BlciB0eXBlIAp1c2Fn
ZXMsIHdoaWNoIEkgc3VwcG9zZSB3ZSBjb3VsZCBleHBlY3QgdG8gaGF2ZSB0byBoYW5kbGUgdGhl
IG1hcHBpbmdzIApsaWtlIHBlcmYuIEFsdGhvdWdoIGl0J3Mgbm90IHRoZSBlYXNpZXN0IHRoaW5n
IHRvIHNlYXJjaCBmb3IgYW5kIApvYnZpb3VzbHkgdGhhdCBvbmx5IGluY2x1ZGVzIG9wZW4gc291
cmNlLgoKVXNhZ2VzIGRvIGV4aXN0IHRob3VnaCwgdGhlcmUgYXJlIHBlb3BsZSBwb3N0aW5nIG9u
IHN0YWNrIG92ZXJmbG93IHVzaW5nIAppdCwgYW5kIG90aGVyIHZhcmlvdXMgYnVnIHRyYWNrZXIg
bGlzdGluZ3MuIFNvIHlvdSB3b3VsZCBleHBlY3QgdGhvc2UgCnNhbWUgdXNlcnMgdG8gaGF2ZSB0
byB1c2UgcmF3IGV2ZW50IGNvZGVzIGFuZCBzb21lIHN3aXRjaCBzdGF0ZW1lbnQgdG8gCnBpY2sg
dGhlIHJpZ2h0IG9uZSBmb3IgdGhlaXIgaGFyZHdhcmUsIG9yIHVzZSBQZXJmLgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
