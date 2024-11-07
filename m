Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E03D5D683
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFjHfYVSszshOcbQy0Cv14IEqw7Z1XOMxsbCV7K38bQ=; b=i/PQIsbMzPjMo9
	yBbjcrjJ0L4RlmkkWrT8pYc/DCvSBUkHFkjN9xKoP5c/RJYLIaUvvqWOP44q0oOdbfKTWhkuv3ioK
	3AGB8gxUeLPgKZRjyNqjeTtonFUSHw2rHdw7O11uoQx/EluRG4J2ISuuiGBtaH8S/oNHdbCzDhotW
	kr+T79T7yL1SUR5VlCcVTGNFzbch73Lr/U2hnKuW08OfQzduJIIbxGHa66ZjWcUuPbpQFOiJapPxD
	X9ZazNvhDNeqJYrdQmmCNZmyVtQSxtpJmloOwc2qZwLezioFFCTMiZeqQ8Zot+YAtqqwYF3CWmzGR
	a2BzxCfFb7vAsXm+ccAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98Yb-000000089UW-1CRT;
	Thu, 07 Nov 2024 19:52:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t987s-000000084Wr-18g8;
	Thu, 07 Nov 2024 19:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12946A44A4F;
	Thu,  7 Nov 2024 19:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A98C4CECC;
	Thu,  7 Nov 2024 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731007502;
	bh=6q3di7FCObUiv+8Jph+EMw//u0ETdnwSd7iOqeptPbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GG73QAevx0zlzfcdWAvXpV28VzlJoMdMbX0AMjUcQI5vRN+7+pMfRGgqU0cDfptSb
	 zL2MQbJ6cjAH3Kg5SzBu7m7j14xnl/Pw+YVlvNdqS2jOHNCUnnBLn/bw/GEN8Al1Vm
	 h79qPml7pCyhy1l6XdwW6rHsctM7ryhCv2NTyRg8wXWMHsRBW8Jduz4Oi/v+MfUUaP
	 4wTFJIdKoIbBBEjHQAgG0A4oRVx5kYPCGe67ZROg3W+7wYMcljYzILh4wU7dN7t6kE
	 mR473WoU0J7nZIGUw0BdXT67ZoZLu/6e1QiZVvH0drnfh+vRUNdfkjYTbJSFflSC7h
	 Lddp+3GFnvwWg==
Date: Thu, 7 Nov 2024 11:24:59 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Guilherme Amadio <amadio@gentoo.org>,
	Changbin Du <changbin.du@huawei.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Daniel Wagner <dwagner@suse.de>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Shenlin Liang <liangshenlin@eswincomputing.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Steinar H. Gunderson" <sesse@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Dima Kogan <dima@secretsauce.net>,
	Yury Norov <yury.norov@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 17/31] perf dwarf-regs: Pass ELF flags to
 get_dwarf_regstr
Message-ID: <Zy0UCxKmD3_mQmNh@google.com>
References: <20241005195541.380070-1-irogers@google.com>
 <20241005195541.380070-18-irogers@google.com>
 <20241007170927.f30fced63c5e777628bea311@kernel.org>
 <CAP-5=fVmD-M-ZOinkWZ7AOtfRHqo89gFtDeeatwufq0TcBiZUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fVmD-M-ZOinkWZ7AOtfRHqo89gFtDeeatwufq0TcBiZUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_112504_451005_3E594D80 
X-CRM114-Status: GOOD (  14.38  )
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

T24gTW9uLCBPY3QgMDcsIDIwMjQgYXQgMDg6MDU6MjNBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIE9jdCA3LCAyMDI0IGF0IDE6MDnigK9BTSBNYXNhbWkgSGlyYW1hdHN1IDxt
aGlyYW1hdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsICA1IE9jdCAyMDI0IDEy
OjU1OjI3IC0wNzAwCj4gPiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+
ID4KPiA+ID4gUGFzcyBhIGZsYWdzIHZhbHVlIGFzIGFyY2hpdGVjdHVyZXMgbGlrZSBjc2t5IG5l
ZWQgdGhlIGZsYWdzIHRvCj4gPiA+IGRldGVybWluZSB0aGUgQUJJIHZhcmlhbnQuCj4gPiA+Cj4g
Pgo+ID4gU2FtZSBoZXJlLiBJIG5lZWQgc29tZSBleGFtcGxlcyBvZiB0aGlzIGNoYW5lZy4KPiAK
PiBUaGUgY29kZSBoZXJlIHdhcyBhbHJlYWR5IHVzaW5nIHRoZSBFTEYgbWFjaGluZSwgc28gZHdh
cmYtcmVncy5jCj4gZnVuY3Rpb25zIHdvdWxkIGFscmVhZHkgc3VwcG9ydCBjcm9zcyBidWlsZGlu
Zy4gVGhlcmUgaXMgdGhlIGFkZGl0aW9uCj4gb2YgRUxGIGZsYWdzIGFzIG9uIGNza3kgdGhlIHJl
Z2lzdGVycyBjaGFuZ2UgZGVwZW5kaW5nIG9uIHRoZSBBQkkKPiB2ZXJzaW9uIGluIHRoZSBFTEYg
ZmxhZ3MuCgpJIHRoaW5rIGl0J3MgdXNlZCBieSB0aGUgcHJvYmUtZmluZGVyIG9ubHkgd2hpY2gg
d29uJ3Qgc3VwcG9ydApjcm9zcy1hcmNoIGVudmlyb25tZW50LiAgU28gcHJvYmFibHkgbm8gY2hh
bmdlcyB0byB1c2VycyBhdCB0aGlzIHBvaW50LgoKVGhhbmtzLApOYW1oeXVuZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
