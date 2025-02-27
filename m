Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE55C021B8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 00:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLKyW88j6fb8dbr5R3Ffli5aoL64ED+JGm+M3xCS508=; b=3pLDtYPYXLpk0+
	4F82rIpltwZ3Gs0yAcsNrK8DMqIxhRs3vhpCAHXzceUhld4ivvFrt/8a0Ocs1flEXMpoUxYAuTmGX
	ulHhI02FH5hAnSWSgYrH3rRxEKZdA4tZGkbjsRSXFFqHLlWolsKO23FerNb+JmJK4A4vPgNHec1J5
	C627F96x0Tz0WP4EaWJxv88A864qohjUB9lEpRR3OSVNtxmRdVl6v7Z21krRlYK7NQaOJPTB89LJ9
	lmt43pUSD11XM5W7zH9ARBiF76JpJ2zcmgymH59aNSACPeMma41j03e2NadcDPg++/iAn0075kmoD
	vmWgxCdlaUlV36a8t1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRMI-00000005l99-1LHR;
	Thu, 27 Feb 2025 00:02:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRKl-00000005l1e-1VaQ;
	Thu, 27 Feb 2025 00:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 743DB612B0;
	Thu, 27 Feb 2025 00:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F154EC4CED6;
	Thu, 27 Feb 2025 00:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740614458;
	bh=qd5L09r8BbWtp3sAdRkvQxm/boMlegFYOUTq9AxcaRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJiViAXPMxyzFzf9Hv16zUQzj8/qcVzYFJj7H31yYwopnzVcgJ3IWMgfHJ+14Oawi
	 FH/2zQ38hXIe2aBZp+k+W5gHvA14Ols6fXDb2nobInHVV9tZuM6fyRIVKnpX3rbSE/
	 S19H8+xhIluAVHCe3LrlHXrLWswcBkjjlrOH/VfX/SdIq/8LgFQBU7vIeh06BAMDzV
	 /XKxRxaQP2UfjOsbZKRHTRhCx0Ozbdy0Apq0EMTCr2HEQfQpk1RSjZunhinNdVW28S
	 /sguI1ft/UZy/3f5o7gSzvdrZJWwnBHVbnYDea42DQwCuDW4sMzAxs15CFkGwqajov
	 yLqLq3Dn7PJJQ==
Date: Wed, 26 Feb 2025 16:00:55 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the
 build
Message-ID: <Z7-rN8iGUpPe6b-1@google.com>
References: <20250219185657.280286-1-irogers@google.com>
 <Z702_CQ7nMx9fZQn@google.com>
 <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com>
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

T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDg6MjI6NTBQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCA3OjIw4oCvUE0gTmFtaHl1bmcgS2ltIDxuYW1o
eXVuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEZlYiAxOSwgMjAyNSBhdCAx
MDo1Njo0OUFNIC0wODAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gPiBUaGlzIHdvcmsgYnVpbGRz
IG9uIHRoZSBjbGVhbiB1cCBvZiBzeXN0ZW0gY2FsbCB0YWJsZXMgYW5kIHJlbW92YWwgb2YKPiA+
ID4gbGliYXVkaXQgYnkgQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4uCj4g
PiA+Cj4gPiA+IFRoZSBzeXN0ZW0gY2FsbCB0YWJsZSBpbiBwZXJmIHRyYWNlIGlzIHVzZWQgdG8g
bWFwIHN5c3RlbSBjYWxsIG51bWJlcnMKPiA+ID4gdG8gbmFtZXMgYW5kIHZpY2UgdmVyc2EuIFBy
aW9yIHRvIHRoZXNlIGNoYW5nZXMsIGEgc2luZ2xlIHRhYmxlCj4gPiA+IG1hdGNoaW5nIHRoZSBw
ZXJmIGJpbmFyeSdzIGJ1aWxkIHdhcyBwcmVzZW50LiBUaGUgdGFibGUgd291bGQgYmUKPiA+ID4g
aW5jb3JyZWN0IGlmIHRyYWNpbmcgc2F5IGEgMzItYml0IGJpbmFyeSBmcm9tIGEgNjQtYml0IHZl
cnNpb24gb2YKPiA+ID4gcGVyZiwgdGhlIG5hbWVzIGFuZCBudW1iZXJzIHdvdWxkbid0IG1hdGNo
Lgo+ID4gPgo+ID4gPiBDaGFuZ2UgdGhlIGJ1aWxkIHNvIHRoYXQgYSBzaW5nbGUgc3lzdGVtIGNh
bGwgZmlsZSBpcyBidWlsdCBhbmQgdGhlCj4gPiA+IHBvdGVudGlhbGx5IG11bHRpcGxlIHRhYmxl
cyBhcmUgaWRlbnRpZmlhYmxlIGZyb20gdGhlIEVMRiBtYWNoaW5lIHR5cGUKPiA+ID4gb2YgdGhl
IHByb2Nlc3MgYmVpbmcgZXhhbWluZWQuIFRvIGRldGVybWluZSB0aGUgRUxGIG1hY2hpbmUgdHlw
ZSwgdGhlCj4gPiA+IGV4ZWN1dGFibGUncyBoZWFkZXIgaXMgcmVhZCBmcm9tIC9wcm9jL3BpZC9l
eGUgd2l0aCBmYWxsYmFja3MgdG8gdXNpbmcKPiA+ID4gdGhlIHBlcmYncyBiaW5hcnkgdHlwZSB3
aGVuIHVua25vd24uCj4gPgo+ID4gSG1tLi4gdGhlbiB0aGlzIGlzIGxpbWl0ZWQgdG8gbGl2ZSBt
b2RlIGFuZCBwb3RlbnRpYWxseSBkZXRlY3Qgd3JvbmcKPiA+IG1hY2hpbmUgdHlwZSBpZiBpdCBy
ZWFkcyBhbiBvbGQgZGF0YSwgcmlnaHQ/Cj4gPgo+ID4gQWxzbyBJSVVDIGZhbGxiYWNrIHRvIHRo
ZSBwZXJmIGJpbmFyeSBtZWFucyBpdCBjYW5ub3QgdXNlIGNyb3NzLW1hY2hpbmUKPiA+IHRhYmxl
LiAgRm9yIGV4YW1wbGUsIGl0IGNhbm5vdCBwcm9jZXNzIGRhdGEgZnJvbSBBUk02NCBvbiB4ODYs
IG5vPyAgSXQKPiA+IHNlZW1zIGl0IHNob3VsZCB1c2UgcGVyZl9lbnYuYXJjaC4KPiAKPiBUaGUg
cGVyZiBlbnYgYXJjaCBpcyBraW5kIG9mIGhvcnJpZC4gT24geDg2IGl0IGhhcyB0aGUgdmFsdWUg
eDg2IGFuZAo+IHRoZW4gdGhlcmUgaXMgYW4gZXh0cmEgNjRiaXQgZmxhZywgd2hvIGtub3dzIGhv
dyB4MzIgc2hvdWxkIGJlIGVuY29kZWQKPiAtIGJ1dCB3ZSBiYXJlbHkgc3VwcG9ydCB4MzIgYXMt
aXMuIEknZCByYXRoZXIgd2UgYWRkZWQgYSBuZXcgZmVhdHVyZQo+IGZvciB0aGUgZV9tYWNoaW5l
L2VfZmxhZ3Mgb2YgdGhlIGV4ZWN1dGFibGUgYW5kIHdvcmtlZCB3aXRoIHRob3NlLCBidXQKPiBp
dCBpcyBraW5kIG9mIHdlaXJkIHdpdGggZG9pbmcgc3lzdGVtIHdpZGUgbW9kZS4gSSBkaWRuJ3Qg
d2FudCB0byBkcmFnCj4gdGhhdCBpbnRvIHRoaXMgcGF0Y2ggc2VyaWVzIGFueXdheSBhcyB0aGVy
ZSBpcyBhbHJlYWR5IGVub3VnaCBoZXJlLgoKUmlnaHQsIEkgZG9uJ3Qga25vdyBob3cgdG8gaGFu
ZGxlIHgzMiBwcm9wZXJseS4gIE1heWJlIHdlIGNhbiBqdXN0Cmlnbm9yZSBpdCBmb3Igbm93LgoK
QnV0IGFueXdheSBsb29raW5nIGF0IC9wcm9jL1BJRCBmb3IgcmVjb3JkZWQgZGF0YSBkb2Vzbid0
IHNlZW0gY29ycmVjdC4KQ2FuIHlvdSBwbGVhc2UgYWRkIGEgZmxhZyB0byBkbyB0aGF0IG9ubHkg
ZnJvbSB0cmFjZV9fcnVuKCkgYW5kIGp1c3QgdXNlCkVNX0hPU1QgZm9yIHRyYWNlX19yZXBsYXko
KT8KCkxhdGVyLCB3ZSBtYXkgbmVlZCB0byBhZGQgYSBtaXNjIGZsYWcgb3Igc28gdG8gUEVSRl9S
RUNPUkRfRk9SSyAoYW5kClBFUkZfUkVDT1JEX0NPTU0gd2l0aCBNSVNDX0NPTU1fRVhFQykgdG8g
aW5kaWNhdGUgbm9uLXN0YW5kYXJkIEFCSSBmb3IgYQpuZXcgdGhyZWFkLiAgQnV0IGl0J3Mgbm90
IGNsZWFyIGhvdyB0byBtYWtlIGl0IGFyY2gtaW5kZXBlbmRlbnQuCgo+IAo+ID4gT25lIG1vcmUg
Y29uY2VybiBpcyBCUEYuICBUaGUgQlBGIHNob3VsZCBrbm93IGFib3V0IHRoZSBBQkkgb2YgdGhl
Cj4gPiBjdXJyZW50IHByb2Nlc3Mgc28gdGhhdCBpdCBjYW4gYXVnbWVudCB0aGUgc3lzY2FsbCBh
cmd1bWVudHMgY29ycmVjdGx5Lgo+ID4gQ3VycmVudGx5IGl0IG9ubHkgY2hlY2tzIHRoZSBzeXNj
YWxsIG51bWJlciBidXQgaXQgY2FuIGJlIGRpZmZlcmVudCBvbgo+ID4gMzItYml0IGFuZCA2NC1i
aXQuCj4gCj4gVGhhdCdzIHJpZ2h0LiBUaGlzIGNoYW5nZSBpcyB0cnlpbmcgdG8gY2xlYW4gdXAK
PiB0b29scy9wZXJmL3V0aWwvc3lzY2FsbHRibC5jIGFuZCB0aGUgcGVyZiB0cmFjZSB1c2FnZS4g
SSBkaWRuJ3QgZ28gYXMKPiBmYXIgYXMgbWFraW5nIEJQRiBwcm9ncmFtcyBwYWlyIHN5c3RlbSBj
YWxsIG51bWJlciB3aXRoIGVfbWFjaGluZSBhbmQKPiBlX2ZsYWdzLCB0aGVyZSBpcyBlbm91Z2gg
aGVyZSBhbmQgdGhlIGJlaGF2aW9yIGFmdGVyIHRoZXNlIHBhdGNoZXMKPiBtYXRjaGVzIHRoZSBi
ZWhhdmlvciBiZWZvcmUgLSB0aGF0IGlzIHRvIGFzc3VtZSB0aGUgc3lzdGVtIGNhbGwgQUJJCj4g
bWF0Y2hlcyB0aGF0IG9mIHRoZSBwZXJmIGJpbmFyeS4KClJpZ2h0LCB0aGUgbmV4dCBzdGVwIHdv
dWxkIGJlIGFkZGluZyBhIEJQRiBrZnVuYyB0byBpZGVudGlmeSB0aGUgY3VycmVudApBQkkuCgpU
aGFua3MsCk5hbWh5dW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
