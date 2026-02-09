Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAC8EF06FB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYcoAtNpA8pUEK2zIh3lX+DYuSMdJGTu5bd3bCWijJs=; b=hhNSkByjLy3dyS
	X15JCpbZlBx4Qe9kYry62pTPMyhCu65w1ivLlq9hEN+MfegvuDHfN0FBHw1sA6ECTiT7bb9Jm5g++
	0ufTAC7fi1jOHACmUjjE9/AKOFbbR7LOY+QCN3H6B/INRDZKzl0ti8SmHTrIKsNQQdWMUY2/Yt0BG
	I/VVIAEvNzf5sim9/3nJ/bVwDLDWHlELzM/tLYJwozgAUEsyGEh5uP6zcLoJJ5OaO5rn7XGwq3tEK
	lMM3IakV6QGKoSUTQXyD7D2OBhxrUujsSl8HTySGOcRAzETNj2AOsYQZvyDs9JHA2y5TV73xfKHt5
	UrcutETVsW2PTkENXJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpFQ0-0000000EcCr-1y9l;
	Mon, 09 Feb 2026 00:46:24 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpFPx-0000000EcCL-1fnV;
	Mon, 09 Feb 2026 00:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770597981; x=1802133981;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WiDvGdY9/hMNal5D7v3aKwx1iH+Txlyos/k45ceIkMs=;
  b=mrNeixg56yPxOB1Gh0aHzto5mjzlBrY22U4IzwUMOFMI97rZVj2IHHLB
   KCxE2waWt6Tnbx9rady9NKQe0O1qBQ5YAmS2JeCtis3ALflD490DzNDUF
   977fOEFcyGor39ACVZaBRHRr1Op7PGhTqKfpcGsB7NXjt+PSRE89qQyFL
   riYdJBkGRVnO6m89r1PLP/L2Rl/MNM8k0y/f5qR7sLU657esmEgfb0dos
   kpnl9XoC3FEoikH7t30aQjg4fPbSTmMopDov1p8x3t5ermQroJKqCRjdb
   9+HXvaxAEJO9UZQ0m8W7MiApStc9jO5I6U0qPviUA52kxz0JLMWkVrEbf
   A==;
X-CSE-ConnectionGUID: StNmmc40R6q4tE2lskWdeQ==
X-CSE-MsgGUID: fVMkmU5MTmSli0vo9q4mLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71773838"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="71773838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 16:46:20 -0800
X-CSE-ConnectionGUID: JaHt4qN4Tm2qb/1Ezcgd0Q==
X-CSE-MsgGUID: h53wmeBVTmqur7ngxWel6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="242064508"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.14]) ([10.124.240.14])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 16:46:13 -0800
Message-ID: <d406166d-27ff-413f-9b35-fa7aaec1b886@linux.intel.com>
Date: Mon, 9 Feb 2026 08:46:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 0/4] Perf tools: perf-regs bug fix and optimization
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
 <aYYGA_Mo1ppwdTH0@x1>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aYYGA_Mo1ppwdTH0@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_164621_455182_9CAAF717 
X-CRM114-Status: GOOD (  15.01  )
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

Ck9uIDIvNi8yMDI2IDExOjE3IFBNLCBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gd3JvdGU6Cj4g
T24gVHVlLCBGZWIgMDMsIDIwMjYgYXQgMTA6NDM6NTJBTSArMDgwMCwgRGFwZW5nIE1pIHdyb3Rl
Ogo+PiBDaGFuZ2VzOgo+PiAgdjIgLT4gdjM6Cj4+ICAgKiBGaXggdGhlIGFib3J0IGlzc3VlIGZv
ciAiLUkiIG9yICItLXVzZXItcmVncyIgb3B0aW9ucy4gKFBhdGNoIDEvNCkKPj4gICAqIEFkZHJl
c3MgSWFuJ3MgY29tbWVudHMuCj4gRml4ZWQgdXAgc29tbWUgZnV6eiB3aXRoIHBvd2VycGMsIHg4
NiwgcmlzY3YgYW5kIHMzOTAgIEJ1aWxkIGZpbGVzIHdydAo+IHJlbW92aW5nIHBlcmZfcmVncy5v
CgpUaGFua3MuwqAKCj4KPiBUaGFua3MsIGFwcGxpZWQgdG8gcGVyZi10b29scy1uZXh0LAo+Cj4g
LSBBcm5hbGRvCj4gIAo+PiAgdjEgLT4gdjI6Cj4+ICAgKiBGaXhpbmcgIlBFUkZfUkVHX0VYVEVO
REVEX01BU0siIHJlZGVmaW5pdGlvbiBidWlsZGluZyBlcnJvciBieQo+PiAgICAgY2hhbmdpbmcg
dGhlICJhc20vcGVyZl9yZWdzLmgiIGhlYWRlciBwYXRoIHRvIHJlbGF0aXZlIFVBUEkgcGF0aC4K
Pj4gICAgIChQYXRjaCAxLzMpCj4+ICAgKiBTcGxpdGluZyB4eHhfcmVnX21hc2soKSBhbmQgeHh4
X3NkdF9hcmdfcGFyc2Vfb3AoKSBjb252ZXJzaW9uIGludG8gMgo+PiAgICAgcGF0Y2hlcy4KPj4K
Pj4gVGhpcyBwYXRjaC1zZXQgcmVtb3ZlIHRoZSBiZWxvdyB0aHJlZSBhcmNoaXRlY3R1cmUgc3Bl
Y2lmaWMgX193ZWFrCj4+IGZ1bmN0aW9ucyBhbmQgY29udmVydGVkIHRoZW0gaW50byB0aGUgZ2Vu
ZXJhbCBhcmNoaXRlY3R1cmUgc3BlY2lmaWMKPj4gZnVuY3Rpb25zIHdoaWNoIGFyZSBkaXNwYXRj
aGVkIGJhc2Ugb24gImVtX21hY2hpbmUiLgo+Pgo+PiB1aW50NjRfdCBhcmNoX19pbnRyX3JlZ19t
YXNrKHZvaWQpOwo+PiB1aW50NjRfdCBhcmNoX191c2VyX3JlZ19tYXNrKHZvaWQpOwo+PiBpbnQg
YXJjaF9zZHRfYXJnX3BhcnNlX29wKGNoYXIgKm9sZF9vcCwgY2hhciAqKm5ld19vcCk7Cj4+Cj4+
IFRoZSBhZHZhbnRhZ2Ugb2YgdGhpcyBjb252ZXJzaW9uIGlzIHRoYXQgdGhlc2UgYXJjaGl0ZWN0
dXJhbCBmdW5jdGlvbnMKPj4gY2FuIGJlIGNhbGxlZCBldmVuIGZvciBhIGRpZmZlcmVudCBhcmNo
aXRlY3R1cmUgd2l0aCBob3N0IGluc3RlYWQgb2YKPj4gb25seSBjYWxsZWQgb24gdGhlIGhvc3Qg
YXJjaGl0ZWN0dXJlLgo+Pgo+PiBBbHRob3VnaCB0aGUgY29udmVydGVkIGZ1bmN0aW9ucyBzaG93
biBiZWxvdyBjYW4gYmUgY2FsbGVkIG9uIGFueQo+PiBhcmNoaXRlY3R1cmUsIGN1cnJlbnRseSB0
aGV5IGFyZSBzdGlsbCBvbmx5IGNhbGxlZCBmb3IgdGhlIGhvc3QKPj4gYXJjaGl0ZWN0dXJlIChF
TV9IT1NUKS4KPj4KPj4gaW50IHBlcmZfc2R0X2FyZ19wYXJzZV9vcCh1aW50MTZfdCBlX21hY2hp
bmUsIGNoYXIgKm9sZF9vcCwgY2hhciAqKm5ld19vcCk7Cj4+IHVpbnQ2NF90IHBlcmZfaW50cl9y
ZWdfbWFzayh1aW50MTZfdCBlX21hY2hpbmUpOwo+PiB1aW50NjRfdCBwZXJmX3VzZXJfcmVnX21h
c2sodWludDE2X3QgZV9tYWNoaW5lKTsKPj4KPj4gVGVzdHM6Cj4+ICAgKiBUaGlzIHBhdGNoLXNl
dCBpcyBvbmx5IHRlc3RlZCBvbiB4ODYgcGxhdGZvcm1zLiBObyBpc3N1ZXMgYXJlIGZvdW5kCj4+
ICAgICBmb3IgYm90aCBpbnRyLXJlZ3MgYW5kIHVzZXItcmVncyBvcHRpb25zLgo+PiAgICogVGVz
dHMgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcyBhcmUgd2VsY29tZWQgYW5kIGFwcHJlY2lhdGVkLgo+
Pgo+PiBIaXN0b3J5Ogo+PiAgIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAx
MjMwOTA5MzguMjIyMjk2MC0xLWRhcGVuZzEubWlAbGludXguaW50ZWwuY29tLwo+PiAgIHYyOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAxMjcwNzAyNTkuMjcyMDQ2OC0xLWRhcGVu
ZzEubWlAbGludXguaW50ZWwuY29tLwo+Pgo+PiBEYXBlbmcgTWkgKDQpOgo+PiAgIHBlcmYgcmVn
czogRml4IGFib3J0IGZvciAiLUkiIG9yICItLXVzZXItcmVncyIgb3B0aW9ucwo+PiAgIHBlcmYg
YXJjaDogVXBkYXRlIGFyY2ggaGVhZGVycyB0byB1c2UgcmVsYXRpdmUgVUFQSSBwYXRocwo+PiAg
IHBlcmYgcmVnczogUmVtb3ZlIF9fd2VhayBhdHRyaWJ1dGl2ZSBhcmNoX194eHhfcmVnX21hc2so
KSBmdW5jdGlvbnMKPj4gICBwZXJmIHJlZ3M6IFJlbW92ZSBfX3dlYWsgYXR0cmlidXRpdmUgYXJj
aF9zZHRfYXJnX3BhcnNlX29wKCkgZnVuY3Rpb24KPj4KPj4gIHRvb2xzL3BlcmYvYXJjaC9hcm0v
aW5jbHVkZS9wZXJmX3JlZ3MuaCAgICAgICB8ICAgMiArLQo+PiAgdG9vbHMvcGVyZi9hcmNoL2Fy
bS91dGlsL0J1aWxkICAgICAgICAgICAgICAgIHwgICAyIC0KPj4gIHRvb2xzL3BlcmYvYXJjaC9h
cm0vdXRpbC9wZXJmX3JlZ3MuYyAgICAgICAgICB8ICAxMyAtCj4+ICB0b29scy9wZXJmL2FyY2gv
YXJtNjQvaW5jbHVkZS9wZXJmX3JlZ3MuaCAgICAgfCAgIDIgKy0KPj4gIHRvb2xzL3BlcmYvYXJj
aC9hcm02NC91dGlsL0J1aWxkICAgICAgICAgICAgICB8ICAgMSAtCj4+ICB0b29scy9wZXJmL2Fy
Y2gvYXJtNjQvdXRpbC9wZXJmX3JlZ3MuYyAgICAgICAgfCAxNDEgLS0tLS0tLS0tCj4+ICB0b29s
cy9wZXJmL2FyY2gvY3NreS9CdWlsZCAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQo+PiAgdG9v
bHMvcGVyZi9hcmNoL2Nza3kvaW5jbHVkZS9wZXJmX3JlZ3MuaCAgICAgIHwgICAyICstCj4+ICB0
b29scy9wZXJmL2FyY2gvY3NreS91dGlsL0J1aWxkICAgICAgICAgICAgICAgfCAgIDEgLQo+PiAg
dG9vbHMvcGVyZi9hcmNoL2Nza3kvdXRpbC9wZXJmX3JlZ3MuYyAgICAgICAgIHwgIDEzIC0KPj4g
IHRvb2xzL3BlcmYvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9wZXJmX3JlZ3MuaCB8ICAgMiArLQo+
PiAgdG9vbHMvcGVyZi9hcmNoL2xvb25nYXJjaC91dGlsL0J1aWxkICAgICAgICAgIHwgICAxIC0K
Pj4gIHRvb2xzL3BlcmYvYXJjaC9sb29uZ2FyY2gvdXRpbC9wZXJmX3JlZ3MuYyAgICB8ICAxMyAt
Cj4+ICB0b29scy9wZXJmL2FyY2gvbWlwcy9pbmNsdWRlL3BlcmZfcmVncy5oICAgICAgfCAgIDIg
Ky0KPj4gIHRvb2xzL3BlcmYvYXJjaC9taXBzL3V0aWwvQnVpbGQgICAgICAgICAgICAgICB8ICAg
MSAtCj4+ICB0b29scy9wZXJmL2FyY2gvbWlwcy91dGlsL3BlcmZfcmVncy5jICAgICAgICAgfCAg
MTMgLQo+PiAgdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9wZXJmX3JlZ3MuaCAgIHwg
ICAyICstCj4+ICB0b29scy9wZXJmL2FyY2gvcG93ZXJwYy91dGlsL0J1aWxkICAgICAgICAgICAg
fCAgIDEgLQo+PiAgdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvdXRpbC9wZXJmX3JlZ3MuYyAgICAg
IHwgMTcyIC0tLS0tLS0tLS0tCj4+ICB0b29scy9wZXJmL2FyY2gvcmlzY3YvaW5jbHVkZS9wZXJm
X3JlZ3MuaCAgICAgfCAgIDkgKy0KPj4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxk
ICAgICAgICAgICAgICB8ICAgMSAtCj4+ICB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9wZXJm
X3JlZ3MuYyAgICAgICAgfCAgMTMgLQo+PiAgdG9vbHMvcGVyZi9hcmNoL3MzOTAvaW5jbHVkZS9w
ZXJmX3JlZ3MuaCAgICAgIHwgICAyICstCj4+ICB0b29scy9wZXJmL2FyY2gvczM5MC91dGlsL0J1
aWxkICAgICAgICAgICAgICAgfCAgIDEgLQo+PiAgdG9vbHMvcGVyZi9hcmNoL3MzOTAvdXRpbC9w
ZXJmX3JlZ3MuYyAgICAgICAgIHwgIDEzIC0KPj4gIHRvb2xzL3BlcmYvYXJjaC94ODYvaW5jbHVk
ZS9wZXJmX3JlZ3MuaCAgICAgICB8ICAgMiArLQo+PiAgdG9vbHMvcGVyZi9hcmNoL3g4Ni91dGls
L0J1aWxkICAgICAgICAgICAgICAgIHwgICAxIC0KPj4gIHRvb2xzL3BlcmYvYXJjaC94ODYvdXRp
bC9wZXJmX3JlZ3MuYyAgICAgICAgICB8IDI4MyAtLS0tLS0tLS0tLS0tLS0tLS0KPj4gIHRvb2xz
L3BlcmYvdXRpbC9ldnNlbC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+PiAgdG9v
bHMvcGVyZi91dGlsL3BhcnNlLXJlZ3Mtb3B0aW9ucy5jICAgICAgICAgIHwgIDEzICstCj4+ICAu
Li4vdXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfYWFyY2g2NC5jICAgfCAxMzkgKysrKysr
KystCj4+ICAuLi4vcGVyZi91dGlsL3BlcmYtcmVncy1hcmNoL3BlcmZfcmVnc19hcm0uYyAgfCAg
IDcgKy0KPj4gIC4uLi9wZXJmL3V0aWwvcGVyZi1yZWdzLWFyY2gvcGVyZl9yZWdzX2Nza3kuYyB8
ICAgNyArLQo+PiAgLi4uL3V0aWwvcGVyZi1yZWdzLWFyY2gvcGVyZl9yZWdzX2xvb25nYXJjaC5j
IHwgICA3ICstCj4+ICAuLi4vcGVyZi91dGlsL3BlcmYtcmVncy1hcmNoL3BlcmZfcmVnc19taXBz
LmMgfCAgIDcgKy0KPj4gIC4uLi91dGlsL3BlcmYtcmVncy1hcmNoL3BlcmZfcmVnc19wb3dlcnBj
LmMgICB8IDE4MyArKysrKysrKysrLQo+PiAgLi4uL3V0aWwvcGVyZi1yZWdzLWFyY2gvcGVyZl9y
ZWdzX3Jpc2N2LmMgICAgIHwgICA3ICstCj4+ICAuLi4vcGVyZi91dGlsL3BlcmYtcmVncy1hcmNo
L3BlcmZfcmVnc19zMzkwLmMgfCAgIDcgKy0KPj4gIC4uLi9wZXJmL3V0aWwvcGVyZi1yZWdzLWFy
Y2gvcGVyZl9yZWdzX3g4Ni5jICB8IDI4MSArKysrKysrKysrKysrKysrLQo+PiAgdG9vbHMvcGVy
Zi91dGlsL3BlcmZfcmVncy5jICAgICAgICAgICAgICAgICAgIHwgMTA5ICsrKysrKy0KPj4gIHRv
b2xzL3BlcmYvdXRpbC9wZXJmX3JlZ3MuaCAgICAgICAgICAgICAgICAgICB8ICAyNyArLQo+PiAg
dG9vbHMvcGVyZi91dGlsL3Byb2JlLWZpbGUuYyAgICAgICAgICAgICAgICAgIHwgICAzICstCj4+
ICA0MiBmaWxlcyBjaGFuZ2VkLCA3ODcgaW5zZXJ0aW9ucygrKSwgNzI0IGRlbGV0aW9ucygtKQo+
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9hcm0vdXRpbC9wZXJmX3JlZ3Mu
Ywo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9hcm02NC91dGlsL3BlcmZf
cmVncy5jCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL2Nza3kvQnVpbGQK
Pj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvY3NreS91dGlsL0J1aWxkCj4+
ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL2Nza3kvdXRpbC9wZXJmX3JlZ3Mu
Ywo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9sb29uZ2FyY2gvdXRpbC9w
ZXJmX3JlZ3MuYwo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9taXBzL3V0
aWwvcGVyZl9yZWdzLmMKPj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcG93
ZXJwYy91dGlsL3BlcmZfcmVncy5jCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9h
cmNoL3Jpc2N2L3V0aWwvcGVyZl9yZWdzLmMKPj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9w
ZXJmL2FyY2gvczM5MC91dGlsL3BlcmZfcmVncy5jCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9v
bHMvcGVyZi9hcmNoL3g4Ni91dGlsL3BlcmZfcmVncy5jCj4+Cj4+IC0tIAo+PiAyLjM0LjEKPj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
