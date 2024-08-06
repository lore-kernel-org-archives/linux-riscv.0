Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098D9C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 17:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qx4n9aWMDaHKbyRsQprwaLBCWSRS6ZqQP+JonJoddk=; b=gy6/aiqrgtl4r5
	iW0I7SGzgILm/T0yqLtSbXtLzWmLLYG0En+Qvzq9YSuHV2ZOqw72RNJYA/3QwO34EbqNs4HSmt2xz
	NE31TrODL/7GSNF81sGO20HcdmBFFZtPNeoOg2xJLSouw3tbLs7hADBpOo6rnKR+n81XoDuiCcTWD
	V19xceXr2jNLRp3ezN4/o/VYiMRuM0o5B1t6QPBm+ragK6CCvJnDnBAkzt5gqe6I38fogB2u+EobO
	NXPP9A1tu2z/Fx45EA7BLD1zVKg8Pu96VhSDg+iIB1VzfSB3KUgOnK6L3/ao/FEYuR8aAy+ieqANU
	+fvkUPxJlXZ64LUQgS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNcy-00000002RCh-1P2Q;
	Tue, 06 Aug 2024 17:05:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNcP-00000002R7J-3qku;
	Tue, 06 Aug 2024 17:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B787CE0EF2;
	Tue,  6 Aug 2024 17:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7285CC4AF0C;
	Tue,  6 Aug 2024 17:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722963902;
	bh=J89hljmcuXHDqlr6QTmQWGz1fYUSlBmB823jfyPm0RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciRFEKNnEB8G5GUHNKoJYeSGPaKcRyHKOW3nFgp7mdUV6WPk3M/ghy8UeaG8QyVlf
	 jgaIP2g9IDNnBuCWswHyZGp6bc7blRpoDS70Kgif/eNGBqGfNz9xtwm6qT7f6RBk0R
	 Pcj3v9B+9BAoI2yF8k+1WbsVVanH4RNzIzMdNxIMiXi7ezN4b5CQSlCphz+oKzew39
	 aXCuG9wryXyfjhvX2062B7xpXTYwKhAc7T/oQb4+6iOKT268JDyi3pM5vkzT+B++cQ
	 PefPwLKN7EJqWnxNxt5PveUNpFFoZPmbY/Su4gz8hvYs+JW4jpLSeP+y5/PvIr7/u6
	 svQxKvuIhAw9A==
Date: Tue, 6 Aug 2024 14:04:58 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Ci-Jyun Wu <dminus@andestech.com>,
	Locus Wei-Han Chen <locus84@andestech.com>,
	Atish Patra <atishp@rivosinc.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Xu Yang <xu.yang_2@nxp.com>, Sandipan Das <sandipan.das@amd.com>,
	Guilherme Amadio <amadio@gentoo.org>,
	Changbin Du <changbin.du@huawei.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, vincent.chen@sifive.com,
	greentime.hu@sifive.com
Subject: Re: [PATCH v1 4/5] perf pmu-events: Remove duplicated riscv firmware
 event
Message-ID: <ZrJXunNsGiZVVtpE@x1>
References: <20240805194424.597244-1-irogers@google.com>
 <20240805194424.597244-4-irogers@google.com>
 <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
 <CAP-5=fWDmdAkJSoncedZTaSgFwG+p3--jywDj9krnXSfkhh6dQ@mail.gmail.com>
 <ZrInOywRKzRmjtKF@x1>
 <ZrIqR07cYJnhcTq8@x1>
 <CAPqJEFoFfCG0_fqkVqakUK7CWs_8WREpmAd+f3H26UasGRPz2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPqJEFoFfCG0_fqkVqakUK7CWs_8WREpmAd+f3H26UasGRPz2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_100506_164078_95F0D8A4 
X-CRM114-Status: GOOD (  13.35  )
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

T24gVHVlLCBBdWcgMDYsIDIwMjQgYXQgMTE6NTA6MDFQTSArMDgwMCwgRXJpYyBMaW4gd3JvdGU6
Cj4gT24gVHVlLCBBdWcgNiwgMjAyNCBhdCA5OjUx4oCvUE0gQXJuYWxkbyBDYXJ2YWxobyBkZSBN
ZWxvIDxhY21lQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiA+IE9uIFR1ZSwgQXVnIDA2LCAyMDI0IGF0
IDEwOjM4OjA3QU0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+ID4g
T24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMDk6MDU6MjZQTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiA+ID4gPiBPbiBNb24sIEF1ZyA1LCAyMDI0IGF0IDg6NTTigK9QTSBFcmljIExpbiA8ZXJp
Yy5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cgo+ID4gPiA+ID4gSSd2ZSBzZW50IGEgcGF0Y2ggdG8g
Zml4IGl0IGFuZCB0aGUgcGF0Y2ggYWxyZWFkeSBtZXJnZWQuIFRoYW5rcy4KCj4gPiBBbHNvLCBh
bHJlYWR5IG1lcmdlZCB3aGVyZT8gVXBzdHJlYW0/IEluIHRoZSByaXNjdiBrZXJuZWwgdHJlZT8g
d2hlcmU/Cgo+IFRoZSBwYXRjaCBhbHJlYWR5IG1lcmdlZCB0byBMaW51eCB1cHN0cmVhbToKPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvY29tbWl0Lz9pZD02M2JhNWIwZmI0ZjU0ZGIyNTZlYzQzYjMwNjJiMjYwNmIzODMw
NTVkCgpPaywgSSdtIHJlc29sdmluZyB0aGlzIHdpdGggcmVtb3ZpbmcgSWFuJ3MgcGF0Y2ggYW5k
IGRvaW5nIGEgbWVyZ2Ugd2l0aAp1cHN0cmVhbSB0byBwaWNrIHRoaXMgcGF0Y2ggYW5kIGtlZXAg
cGVyZi10b29scy1uZXh0IGJ1aWxkaW5nLgoKLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
