Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B542DC07E8E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlZcnTCoFGnjQ5V3kYYDSQgFTNeRaB71NA32yR//FGI=; b=gHtLyMyuIjgof7
	VG22Mw9970OTVZzcNKMMfT/ZfEe8SdozjKVP6+u+02gYDh1NJ+oVHH6zXmFrRQRcDUdqhHXKLIwvi
	8AUp5uP2Tz1Ic9f7RUg5n4AybYP6kJ5jAjU2gTUPpUNVaOB0aDi/Xm2rHqp5eJq9rFvolLHi3GoEY
	Xpj1VTANs1gz/JqF2X8E4E3NuTNFWBcr/ZOZqYid/YIRyJ17cGXz/y93GPBaKHJRvsBhDdQuH201b
	wiNyISR8Q4bxF0dE0zClEL0q32NY0RPbPirRHlc6CJnOn41irO5lzIQ+UY11GbXCAjDqj0ZAPO03f
	5+fuAw51v/s4LaVV7Njg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeZl-00000004ikE-0F8i;
	Wed, 24 Apr 2024 15:30:25 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeZi-00000004ihz-1DjD
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 15:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713972622; x=1745508622;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wbLuhw/WYXCcv7kdW+LHH5poNfQY/brJKzckpRJupaE=;
  b=f4Y22PJhhdvFB2Ve9WaABMXv+/7Ta8lINs8XLcGZ0Kfvop8WSXyAiVLS
   YBe7ac78SR6DBQA6GAOVOwI5tRJMxjyZmt6qUeD9Y56L8uJHk8h5fufnR
   1q60efhj//Csm4BoF2Gp3ZKTF+D1HBZdsQL8Uumvo5H2y1Txt3JZ6bfY6
   ZFEZ6/FEp6vzSROWQ5qmD4GK0I8AaRyxB2Cabe9F1/TxJwnjp+62qOQ3P
   yVRn7IrASX5/hLam/TkTvexJFlmv4pW+mR8J6xs1/M1r8/1RwSS0dVhgK
   6mb5ojIHHMFmpkjEgxYLmjgVfHSdkgk9GUn9b1htC/NQ75ExjBOitxDG4
   Q==;
X-CSE-ConnectionGUID: 50CDqE4tQveACSfVYMV7Yg==
X-CSE-MsgGUID: plupjD99Q1iQn+7EysQI9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9540553"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9540553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:30:18 -0700
X-CSE-ConnectionGUID: 8VHd22DdTmO/lLu1mNIrQA==
X-CSE-MsgGUID: D1ZemLcCQiKus60QrdcssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="24631769"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:30:18 -0700
Received: from [10.212.107.188] (kliang2-mobl1.ccr.corp.intel.com [10.212.107.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 422D8206D89D;
	Wed, 24 Apr 2024 08:30:16 -0700 (PDT)
Message-ID: <7f1014fc-eb0a-4989-8efa-245d5b6937cd@linux.intel.com>
Date: Wed, 24 Apr 2024 11:30:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] perf parse-events: Improvements to modifier
 parsing
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 Beeman Strong <beeman@rivosinc.com>
References: <20240416061533.921723-1-irogers@google.com>
 <20240416061533.921723-14-irogers@google.com>
 <e8147f53-1930-44d8-abb8-fee460ec355f@linux.intel.com>
 <CAP-5=fVXv_gsoq5L08gaEJvU1E8xoihc3-L4taA+bPHyOJfgqw@mail.gmail.com>
 <7df3ff63-a421-42cc-bcaa-b0254ff6a0e8@linux.intel.com>
 <CAP-5=fUi8DPNrbp=978K92Mopa71ag1sukttX3KcztD2ac0ADg@mail.gmail.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <CAP-5=fUi8DPNrbp=978K92Mopa71ag1sukttX3KcztD2ac0ADg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_083022_507815_6E8471D8 
X-CRM114-Status: GOOD (  18.63  )
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

CgpPbiAyMDI0LTA0LTI0IDExOjE4IGEubS4sIElhbiBSb2dlcnMgd3JvdGU6Cj4gT24gRnJpLCBB
cHIgMTksIDIwMjQgYXQgNjoyMOKAr0FNIExpYW5nLCBLYW4gPGthbi5saWFuZ0BsaW51eC5pbnRl
bC5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiAyMDI0LTA0LTE5IDI6MjIgYS5tLiwgSWFuIFJv
Z2VycyB3cm90ZToKPj4+Pj4gKyAgICAgICAgICAgICAvKiBTaW1wbGUgbW9kaWZpZXJzIGNvcGll
ZCB0byB0aGUgZXZzZWwuICovCj4+Pj4+ICsgICAgICAgICAgICAgaWYgKG1vZC5wcmVjaXNlKSB7
Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICB1OCBwcmVjaXNlID0gZXZzZWwtPmNvcmUuYXR0
ci5wcmVjaXNlX2lwICsgbW9kLnByZWNpc2U7Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAv
Kgo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICogcHJlY2lzZSBpcDoKPj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAqCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgKiAgMCAtIFNB
TVBMRV9JUCBjYW4gaGF2ZSBhcmJpdHJhcnkgc2tpZAo+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICogIDEgLSBTQU1QTEVfSVAgbXVzdCBoYXZlIGNvbnN0YW50IHNraWQKPj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAqICAyIC0gU0FNUExFX0lQIHJlcXVlc3RlZCB0byBoYXZlIDAgc2tp
ZAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICogIDMgLSBTQU1QTEVfSVAgbXVzdCBoYXZl
IDAgc2tpZAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICoKPj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAqICBTZWUgYWxzbyBQRVJGX1JFQ09SRF9NSVNDX0VYQUNUX0lQCj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgKi8KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChw
cmVjaXNlID4gMykgewo+Pj4+IFRoZSBwbXVfbWF4X3ByZWNpc2UoKSBzaG91bGQgcmV0dXJuIHRo
ZSBtYXggcHJlY2lzZSB0aGUgY3VycmVudCBrZXJuZWwKPj4+PiBzdXBwb3J0cy4gSXQgY2hlY2tz
IHRoZSAvc3lzL2RldmljZXMvY3B1L2NhcHMvbWF4X3ByZWNpc2UuCj4+Pj4KPj4+PiBJIHRoaW5r
IHdlIHNob3VsZCB1c2UgdGhhdCB2YWx1ZSByYXRoZXIgdGhhbiBoYXJkIGNvZGUgaXQgdG8gMy4K
Pj4+IEknbGwgYWRkIGFuIGV4dHJhIHBhdGNoIHRvIGRvIHRoYXQuIEknbSBhIGJpdCBjb25jZXJu
ZWQgaXQgbWF5IGJyZWFrCj4+PiBldmVudCBwYXJzaW5nIG9uIHBsYXRmb3JtcyBub3Qgc3VwcG9y
dGluZyBtYXhfcHJlY2lzZSBvZiAzLgo+Pgo+PiBUaGUga2VybmVsIGFscmVhZHkgcmVqZWN0cyB0
aGUgcHJlY2lzZV9pcCA+IG1heF9wcmVjaXNlICh1c2luZyB0aGUgc2FtZQo+PiB4ODZfcG11X21h
eF9wcmVjaXNlKCkpLiBJdCBzaG91bGQgYmUgZmluZSB0byBhcHBseSB0aGUgc2FtZSBsb2dpYyBp
biB0aGUKPj4gdG9vbC4KPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC94ODYvZXZlbnRzL2NvcmUuYyNu
NTY2Cj4+Cj4+IFdpbGwgdGhlIGV4dHJhIHBhdGNoIGJlIHNlbnQgc2VwYXJhdGVseT8KPiAKPiBM
ZXQncyBkbyBpdCBzZXBhcmF0ZWx5LiBJJ20gY29uY2VybmVkIGFib3V0IHRoZSBiZWhhdmlvciBv
biBBTUQgKGFuZAo+IHBvc3NpYmx5IHNpbWlsYXIgYXJjaGl0ZWN0dXJlcykgd2hlcmUgY2VydGFp
biBldmVudHMgc3VwcG9ydCBwcmVjaXNpb24KPiBsaWtlIGN5Y2xlcywgYXMgdGhleSBkZXRvdXIg
dG8gdGhlIElCUyBQTVUsIGJ1dCBub3QgYWxsIGV2ZW50cyBzdXBwb3J0Cj4gaXQuIFRoZSBtYXhf
cHJlY2lzZSBzaG91bGQgcmVmbGVjdCB0aGF0IEFNRCdzIFplbiBjb3JlIFBNVSBkb2VzCj4gc3Vw
cG9ydCBwcmVjaXNpb24gYXMgYSBjb25zZXF1ZW5jZSBvZiBkZXRvdXJpbmcgdG8gSUJTLCBidXQg
bWF5YmUKPiB0aGluZ3MgaW4gc3lzZnMgYXJlbid0IHNldCB1cCBjb3JyZWN0bHkuCj4gCgpUaGUg
eDg2X3BtdV9tYXhfcHJlY2lzZSgpIGlzIGEgZ2VuZXJpYyBmdW5jdGlvbiBmb3IgWDg2LiBJdCBz
aG91bGQgYXBwbHkKdG8gQU1EIGFzIHdlbGwuCgpBIHNlcGFyYXRlIHBhdGNoIGxvb2tzIGdvb2Qg
dG8gbWUuCgpUaGFua3MsCkthbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
