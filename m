Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D0DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WfS+e+rsrEym3W4ASSC4rSwsKmGNGyGicwfY+pNfMA=; b=4mLnl2Il6IGxQq
	W5uC2v+Mz2EV2kqCedGZgqgaq7BuW17a6F7JT9zRkR0sx0xu9WM29dr1DYzHQ/T7gDDFpe8+d+TmF
	+YvRqRKykGGoILKlctypxF9sjYYu93f69aDexDP9ux0T8CTnJQleXWz4j3YiY5+0g9XErgA0sOsW/
	BjzejX98KP7xN2Sx/t0eYydiRkJKpAO4LGI3UjSUOjvpmRAOh6wxzCsjqh99rpf+HFAuztG2v/Cho
	bMUZQZxKOQiXOUJAw2m4a1NabhQ8RFp+V/V0iZwt6h6N3QNGuWGAQl95+CVJjn/BcjbRQWX0W3ph8
	FfEg2Ody2JF+DsRJobZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxoJ6-00000005l4E-3vti;
	Fri, 19 Apr 2024 13:29:36 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxoJ3-00000005l3H-3Yb5
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713533374; x=1745069374;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xqswkRP7xC0Owgm1HP3Ch7pzBLg7hHvhZLq55WlfYmA=;
  b=G/YqfsUobzZuKErbVGvkMQL7qWJtwsgCXUFmQ7UZXtROPqJKv8Zj6uHU
   ujR0NB6OT/elaoz5gPk6YSldABNndzP6gtk2OphUfaxDxW5lnL0CvAbUn
   5uStNIHe5vmZf3U/wKhmyKH+qpKjmYEMd0hwbPWn6kGe0jTG1W4JX2xly
   s9jqw2lwWAfYnkDvIjEAcjBQtOjtzAUxUIoD7yQJMgfjQO+6JQ21hZO7Z
   ijIC0fQFhPg9EoZpDK1x36Z9ePpVuCQszTUpjm4IC951NwTikIjS83Uil
   at+ZON89h5KBMJFTmJjj3uHVn6rKp4drDnrBD1LJ0/cfUu/f4IvP4Sq8c
   w==;
X-CSE-ConnectionGUID: nYx/jqA6RkO9yP3jLlEXDA==
X-CSE-MsgGUID: C8HDJiGGT3WrKDNZzvo3Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="34532023"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="34532023"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:29:33 -0700
X-CSE-ConnectionGUID: 0uQgHtY/QgmveFusb3jeJg==
X-CSE-MsgGUID: Tld8xbNRRUC14a6jfp668A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27986170"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:29:33 -0700
Received: from [10.212.13.6] (dojung-mobl.amr.corp.intel.com [10.212.13.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 9E16F206DFDC;
	Fri, 19 Apr 2024 06:29:30 -0700 (PDT)
Message-ID: <7a576651-6780-41a5-ac69-46ce299367b5@linux.intel.com>
Date: Fri, 19 Apr 2024 09:29:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] perf parse-events: Improve error message for bad
 numbers
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
 <20240416061533.921723-12-irogers@google.com>
 <ac8835f8-0ea5-4f28-941c-aa43f0da92fd@linux.intel.com>
 <CAP-5=fXkn-nFTqGEqBYt6NUvoXU7OyLJeSCnWdD3taLHyK-xtQ@mail.gmail.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <CAP-5=fXkn-nFTqGEqBYt6NUvoXU7OyLJeSCnWdD3taLHyK-xtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_062934_046450_8BB83385 
X-CRM114-Status: GOOD (  21.13  )
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

CgpPbiAyMDI0LTA0LTE4IDU6MDcgcC5tLiwgSWFuIFJvZ2VycyB3cm90ZToKPiBPbiBUaHUsIEFw
ciAxOCwgMjAyNCBhdCAxOjI34oCvUE0gTGlhbmcsIEthbiA8a2FuLmxpYW5nQGxpbnV4LmludGVs
LmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDIwMjQtMDQtMTYgMjoxNSBhLm0uLCBJYW4gUm9n
ZXJzIHdyb3RlOgo+Pj4gVXNlIHRoZSBlcnJvciBoYW5kbGVyIGZyb20gdGhlIHBhcnNlX3N0YXRl
IHRvIGdpdmUgYSBtb3JlIGluZm9ybWF0aXZlCj4+PiBlcnJvciBtZXNzYWdlLgo+Pj4KPj4+IEJl
Zm9yZToKPj4+IGBgYAo+Pj4gJCBwZXJmIHN0YXQgLWUgJ2N5Y2xlcy9wZXJpb2Q9OTk5OTk5OTk5
OTk5OTk5OTk5OTkvJyB0cnVlCj4+PiBldmVudCBzeW50YXggZXJyb3I6ICdjeWNsZXMvcGVyaW9k
PTk5OTk5OTk5OTk5OTk5OTk5OTk5LycKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcX19fIHBhcnNlciBlcnJvcgo+Pj4gUnVuICdwZXJmIGxpc3QnIGZvciBhIGxpc3Qgb2Yg
dmFsaWQgZXZlbnRzCj4+Pgo+Pj4gIFVzYWdlOiBwZXJmIHN0YXQgWzxvcHRpb25zPl0gWzxjb21t
YW5kPl0KPj4+Cj4+PiAgICAgLWUsIC0tZXZlbnQgPGV2ZW50PiAgIGV2ZW50IHNlbGVjdG9yLiB1
c2UgJ3BlcmYgbGlzdCcgdG8gbGlzdCBhdmFpbGFibGUgZXZlbnRzCj4+PiBgYGAKPj4+Cj4+PiBB
ZnRlcjoKPj4+IGBgYAo+Pj4gJCBwZXJmIHN0YXQgLWUgJ2N5Y2xlcy9wZXJpb2Q9OTk5OTk5OTk5
OTk5OTk5OTk5OTkvJyB0cnVlCj4+PiBldmVudCBzeW50YXggZXJyb3I6ICdjeWNsZXMvcGVyaW9k
PTk5OTk5OTk5OTk5OTk5OTk5OTk5LycKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcX19fIHBhcnNlciBlcnJvcgo+Pj4KPj4+IGV2ZW50IHN5bnRheCBlcnJvcjogJy4ubGVz
L3BlcmlvZD05OTk5OTk5OTk5OTk5OTk5OTk5OS8nCj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXF9fXyBCYWQgYmFzZSAxMCBudW1iZXIgIjk5OTk5OTk5OTk5OTk5OTk5OTk5
Igo+Pgo+Pgo+PiBJdCBzZWVtcyB0aGUgcGF0Y2ggb25seSB3b3JrcyBmb3IgZGVjaW1hbD8KPj4K
Pj4gLi9wZXJmIHN0YXQgLWUgJ2N5Y2xlcy9wZXJpb2Q9MHhhYWFhYWFhYWFhYWFhYWFhYWFhYWFh
LycgdHJ1ZQo+PiBldmVudCBzeW50YXggZXJyb3I6ICcuLmxlcy9wZXJpb2Q9MHhhYWFhYWFhYWFh
YWFhYWFhYWFhYWFhLycKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcX19f
IHBhcnNlciBlcnJvcgo+PiAgUnVuICdwZXJmIGxpc3QnIGZvciBhIGxpc3Qgb2YgdmFsaWQgZXZl
bnRzCj4+Cj4+ICAgVXNhZ2U6IHBlcmYgc3RhdCBbPG9wdGlvbnM+XSBbPGNvbW1hbmQ+XQo+Pgo+
PiAgICAgIC1lLCAtLWV2ZW50IDxldmVudD4gICBldmVudCBzZWxlY3Rvci4gdXNlICdwZXJmIGxp
c3QnIHRvIGxpc3QKPj4gYXZhaWxhYmxlIGV2ZW50cwo+Pgo+PiBUaGFua3MsCj4+IEthbgo+IAo+
IFJpZ2h0LCBmb3IgaGV4YWRlY2ltYWwgd2Ugc2F5IHRoZSBudW1iZXIgb2YgZGlnaXRzIGlzIGF0
IG1vc3QgMTYsIHNvCj4gd2hlbiB5b3UgZXhjZWVkIHRoaXMgdGhlIHRva2VuIGlzIG5vIGxvbmdl
ciByZWNvZ25pemVkLiBJdCBqdXN0Cj4gYmVjb21lcyBpbnB1dCB0aGF0IGNhbid0IGJlIHBhcnNl
ZCwgaGVuY2UgcGFyc2VyIGVycm9yLiBEb2luZyB0aGlzCj4gbWVhbnMgd2UgY2FuIHNpbXBsaWZ5
IG90aGVyIHN0cnRvdWxsIGNoZWNrcywgYnV0IEkgYWdyZWUgaGF2aW5nIGEKPiBiZXR0ZXIgZXJy
b3IgbWVzc2FnZSBmb3IgaGV4YWRlY2ltYWwgd291bGQgYmUgZ29vZC4gTGV0J3MgZG8gaXQgYXMK
PiBmb2xsb3cgdXAuCgpPSy4gVGhlcmUgaXMgYWxyZWFkeSBhIHdhcm5pbmcuIEl0J3MgZmluZSB0
byBwcm92aWRlIGEgZm9sbG93LXVwIGZvciBhCmJldHRlciBlcnJvciBtZXNzYWdlIGxhdGVyLgoK
VGhhbmtzLApLYW4KCj4gCj4gVGhhbmtzLAo+IElhbgo+IAo+Pj4gUnVuICdwZXJmIGxpc3QnIGZv
ciBhIGxpc3Qgb2YgdmFsaWQgZXZlbnRzCj4+Pgo+Pj4gIFVzYWdlOiBwZXJmIHN0YXQgWzxvcHRp
b25zPl0gWzxjb21tYW5kPl0KPj4+Cj4+PiAgICAgLWUsIC0tZXZlbnQgPGV2ZW50PiAgIGV2ZW50
IHNlbGVjdG9yLiB1c2UgJ3BlcmYgbGlzdCcgdG8gbGlzdCBhdmFpbGFibGUgZXZlbnRzCj4+PiBg
YGAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+
Cj4+PiAtLS0KPj4+ICB0b29scy9wZXJmL3V0aWwvcGFyc2UtZXZlbnRzLmwgfCA0MCArKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS90b29scy9wZXJm
L3V0aWwvcGFyc2UtZXZlbnRzLmwgYi90b29scy9wZXJmL3V0aWwvcGFyc2UtZXZlbnRzLmwKPj4+
IGluZGV4IDZmZTM3MDAzYWI3Yi4uMGNkNjhjOWYwZDRmIDEwMDY0NAo+Pj4gLS0tIGEvdG9vbHMv
cGVyZi91dGlsL3BhcnNlLWV2ZW50cy5sCj4+PiArKysgYi90b29scy9wZXJmL3V0aWwvcGFyc2Ut
ZXZlbnRzLmwKPj4+IEBAIC0xOCwyNiArMTgsMzQgQEAKPj4+Cj4+PiAgY2hhciAqcGFyc2VfZXZl
bnRzX2dldF90ZXh0KHl5c2Nhbl90IHl5c2Nhbm5lcik7Cj4+PiAgWVlTVFlQRSAqcGFyc2VfZXZl
bnRzX2dldF9sdmFsKHl5c2Nhbl90IHl5c2Nhbm5lcik7Cj4+PiAraW50IHBhcnNlX2V2ZW50c19n
ZXRfY29sdW1uKHl5c2Nhbl90IHl5c2Nhbm5lcik7Cj4+PiAraW50IHBhcnNlX2V2ZW50c19nZXRf
bGVuZyh5eXNjYW5fdCB5eXNjYW5uZXIpOwo+Pj4KPj4+IC1zdGF0aWMgaW50IF9fdmFsdWUoWVlT
VFlQRSAqeXlsdmFsLCBjaGFyICpzdHIsIGludCBiYXNlLCBpbnQgdG9rZW4pCj4+PiArc3RhdGlj
IGludCBnZXRfY29sdW1uKHl5c2Nhbl90IHNjYW5uZXIpCj4+PiAgewo+Pj4gLSAgICAgdTY0IG51
bTsKPj4+IC0KPj4+IC0gICAgIGVycm5vID0gMDsKPj4+IC0gICAgIG51bSA9IHN0cnRvdWxsKHN0
ciwgTlVMTCwgYmFzZSk7Cj4+PiAtICAgICBpZiAoZXJybm8pCj4+PiAtICAgICAgICAgICAgIHJl
dHVybiBQRV9FUlJPUjsKPj4+IC0KPj4+IC0gICAgIHl5bHZhbC0+bnVtID0gbnVtOwo+Pj4gLSAg
ICAgcmV0dXJuIHRva2VuOwo+Pj4gKyAgICAgcmV0dXJuIHBhcnNlX2V2ZW50c19nZXRfY29sdW1u
KHNjYW5uZXIpIC0gcGFyc2VfZXZlbnRzX2dldF9sZW5nKHNjYW5uZXIpOwo+Pj4gIH0KPj4+Cj4+
PiAtc3RhdGljIGludCB2YWx1ZSh5eXNjYW5fdCBzY2FubmVyLCBpbnQgYmFzZSkKPj4+ICtzdGF0
aWMgaW50IHZhbHVlKHN0cnVjdCBwYXJzZV9ldmVudHNfc3RhdGUgKnBhcnNlX3N0YXRlLCB5eXNj
YW5fdCBzY2FubmVyLCBpbnQgYmFzZSkKPj4+ICB7Cj4+PiAgICAgICBZWVNUWVBFICp5eWx2YWwg
PSBwYXJzZV9ldmVudHNfZ2V0X2x2YWwoc2Nhbm5lcik7Cj4+PiAgICAgICBjaGFyICp0ZXh0ID0g
cGFyc2VfZXZlbnRzX2dldF90ZXh0KHNjYW5uZXIpOwo+Pj4gKyAgICAgdTY0IG51bTsKPj4+Cj4+
PiAtICAgICByZXR1cm4gX192YWx1ZSh5eWx2YWwsIHRleHQsIGJhc2UsIFBFX1ZBTFVFKTsKPj4+
ICsgICAgIGVycm5vID0gMDsKPj4+ICsgICAgIG51bSA9IHN0cnRvdWxsKHRleHQsIE5VTEwsIGJh
c2UpOwo+Pj4gKyAgICAgaWYgKGVycm5vKSB7Cj4+PiArICAgICAgICAgICAgIHN0cnVjdCBwYXJz
ZV9ldmVudHNfZXJyb3IgKmVycm9yID0gcGFyc2Vfc3RhdGUtPmVycm9yOwo+Pj4gKyAgICAgICAg
ICAgICBjaGFyICpoZWxwID0gTlVMTDsKPj4+ICsKPj4+ICsgICAgICAgICAgICAgaWYgKGFzcHJp
bnRmKCZoZWxwLCAiQmFkIGJhc2UgJWQgbnVtYmVyIFwiJXNcIiIsIGJhc2UsIHRleHQpID4gMCkK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICBwYXJzZV9ldmVudHNfZXJyb3JfX2hhbmRsZShlcnJv
ciwgZ2V0X2NvbHVtbihzY2FubmVyKSwgaGVscCAsIE5VTEwpOwo+Pj4gKwo+Pj4gKyAgICAgICAg
ICAgICByZXR1cm4gUEVfRVJST1I7Cj4+PiArICAgICB9Cj4+PiArCj4+PiArICAgICB5eWx2YWwt
Pm51bSA9IG51bTsKPj4+ICsgICAgIHJldHVybiBQRV9WQUxVRTsKPj4+ICB9Cj4+Pgo+Pj4gIHN0
YXRpYyBpbnQgc3RyKHl5c2Nhbl90IHNjYW5uZXIsIGludCB0b2tlbikKPj4+IEBAIC0yODMsOCAr
MjkxLDggQEAgcjB4e251bV9yYXdfaGV4fSAgeyByZXR1cm4gc3RyKHl5c2Nhbm5lciwgUEVfUkFX
KTsgfQo+Pj4gICAgICAgICovCj4+PiAgIi8iL3tkaWdpdH0gICAgICAgICAgeyByZXR1cm4gUEVf
QlBfU0xBU0g7IH0KPj4+ICAiLyIve25vbl9kaWdpdH0gICAgICAgICAgICAgIHsgQkVHSU4oY29u
ZmlnKTsgcmV0dXJuICcvJzsgfQo+Pj4gLXtudW1fZGVjfSAgICAgICAgICAgIHsgcmV0dXJuIHZh
bHVlKHl5c2Nhbm5lciwgMTApOyB9Cj4+PiAte251bV9oZXh9ICAgICAgICAgICAgeyByZXR1cm4g
dmFsdWUoeXlzY2FubmVyLCAxNik7IH0KPj4+ICt7bnVtX2RlY30gICAgICAgICAgICB7IHJldHVy
biB2YWx1ZShfcGFyc2Vfc3RhdGUsIHl5c2Nhbm5lciwgMTApOyB9Cj4+PiAre251bV9oZXh9ICAg
ICAgICAgICAgeyByZXR1cm4gdmFsdWUoX3BhcnNlX3N0YXRlLCB5eXNjYW5uZXIsIDE2KTsgfQo+
Pj4gICAgICAgLyoKPj4+ICAgICAgICAqIFdlIG5lZWQgdG8gc2VwYXJhdGUgJ21lbTonIHNjYW5u
ZXIgcGFydCwgaW4gb3JkZXIgdG8gZ2V0IHNwZWNpZmljCj4+PiAgICAgICAgKiBtb2RpZmllciBi
aXRzIHBhcnNlZCBvdXQuIE90aGVyd2lzZSB3ZSB3b3VsZCBuZWVkIHRvIGhhbmRsZSBQRV9OQU1F
Cj4+PiBAQCAtMzMwLDggKzMzOCw4IEBAIGNncm91cC1zd2l0Y2hlcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgeyByZXR1cm4gc3ltKHl5c2Nhbm5lciwgUEVSRl9DT1VOVF9TV19D
R1JPVVBfU1dJVENIRVMpOyB9Cj4+PiAge2xjX3R5cGV9LXtsY19vcF9yZXN1bHR9LXtsY19vcF9y
ZXN1bHR9ICAgICAgeyByZXR1cm4gc3RyKHl5c2Nhbm5lciwgUEVfTEVHQUNZX0NBQ0hFKTsgfQo+
Pj4gIG1lbTogICAgICAgICAgICAgICAgIHsgQkVHSU4obWVtKTsgcmV0dXJuIFBFX1BSRUZJWF9N
RU07IH0KPj4+ICBye251bV9yYXdfaGV4fSAgICAgICAgICAgICAgIHsgcmV0dXJuIHN0cih5eXNj
YW5uZXIsIFBFX1JBVyk7IH0KPj4+IC17bnVtX2RlY30gICAgICAgICAgICB7IHJldHVybiB2YWx1
ZSh5eXNjYW5uZXIsIDEwKTsgfQo+Pj4gLXtudW1faGV4fSAgICAgICAgICAgIHsgcmV0dXJuIHZh
bHVlKHl5c2Nhbm5lciwgMTYpOyB9Cj4+PiAre251bV9kZWN9ICAgICAgICAgICAgeyByZXR1cm4g
dmFsdWUoX3BhcnNlX3N0YXRlLCB5eXNjYW5uZXIsIDEwKTsgfQo+Pj4gK3tudW1faGV4fSAgICAg
ICAgICAgIHsgcmV0dXJuIHZhbHVlKF9wYXJzZV9zdGF0ZSwgeXlzY2FubmVyLCAxNik7IH0KPj4+
Cj4+PiAge21vZGlmaWVyX2V2ZW50fSAgICAgeyByZXR1cm4gc3RyKHl5c2Nhbm5lciwgUEVfTU9E
SUZJRVJfRVZFTlQpOyB9Cj4+PiAge25hbWV9ICAgICAgICAgICAgICAgICAgICAgICB7IHJldHVy
biBzdHIoeXlzY2FubmVyLCBQRV9OQU1FKTsgfQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
