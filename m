Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B573C49EA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xn9b53b/7ZvMIJnSv9FdN92W0ZJcaJ4L82rXh7jl73c=; b=V0BSR6oAlrqnLr
	LPnt19u66JB9XamKZjF2DhzVWTUXLSrEp9STfoFyQ0otdmbbS/6dZ78RbYwhmD8TIEBNmsV4G3RRp
	+vhZZAboJ5OssfecRkVxSt1Ikhxpo0PqNH1XJs7RCN6CuZNxXL71x2u6l/NGCRxsS+BiHDJbVjDNo
	A2bqbt/LEjz0lvtewjEXe7uAGk8qvxJXkPAWKxgywSMdaFrjfiwW5YZBwLIujYlUW8zYgkVpkJfhR
	e+EKgIkYjBBsqHTKIo4iwh1LmTDTO4amJ+KUf2awN3arHnuNltI+lmMqqHloodwNiWSkEq7YTuYgc
	DPQwpyWQslJl7QNYYNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKOh-00000001obS-2H2k;
	Tue, 06 Aug 2024 13:38:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKOA-00000001oVy-0MgY;
	Tue, 06 Aug 2024 13:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7744CCE0E90;
	Tue,  6 Aug 2024 13:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E662C32786;
	Tue,  6 Aug 2024 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722951486;
	bh=IUsHVXl6vrsJ/SUxWscVy8OdmVYWDM4EQy6CniwnHGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geHgLlkoLGrO2ZUWFg05OEtEDyB4uNMJ4wMqysDLl151UJhQmIuAm068k2FGIE5yd
	 +weB892ZbWIUlisCrCuFezAXqBlQom2L16mZGKinKxkwuwTOSGlNhp1GETWvQWEwN0
	 qnLxRPDns8KAegY6ZhrFVX7h8A+ARbeXnDEu/MRw9NEZ/2nMsOheiKGAepPKsZmsFL
	 lv0HsEh4ixkYoc6CcU5CUgipRCwr1m1mv5jPPiK5Ptk7nZIlUggp+vE4A7c//aSvyL
	 YNB9drvTD9kpg1PGa7INUZxiseEnwQqkAgMxX3rysZ3K6A/kwOhsd6uCUvEyWUICcW
	 qraS2ibJdCoBg==
Date: Tue, 6 Aug 2024 10:38:03 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Eric Lin <eric.lin@sifive.com>, Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <ZrInOywRKzRmjtKF@x1>
References: <20240805194424.597244-1-irogers@google.com>
 <20240805194424.597244-4-irogers@google.com>
 <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
 <CAP-5=fWDmdAkJSoncedZTaSgFwG+p3--jywDj9krnXSfkhh6dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fWDmdAkJSoncedZTaSgFwG+p3--jywDj9krnXSfkhh6dQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_063810_331644_DD76B741 
X-CRM114-Status: GOOD (  12.84  )
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

T24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMDk6MDU6MjZQTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIEF1ZyA1LCAyMDI0IGF0IDg6NTTigK9QTSBFcmljIExpbiA8ZXJpYy5saW5A
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgSWFuLAo+ID4KPiA+IEkndmUgc2VudCBhIHBh
dGNoIHRvIGZpeCBpdCBhbmQgdGhlIHBhdGNoIGFscmVhZHkgbWVyZ2VkLiBUaGFua3MuCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA3MTkxMTUwMTguMjczNTYtMS1lcmljLmxp
bkBzaWZpdmUuY29tLwo+IAo+IEhpIEVyaWMvQXJuYWxkbywKPiAKPiBSaWdodCwgSSBhbHJlYWR5
IGNvbW1lbnRlZCB0aGlzIHNob3VsZCBoYXZlIGdvbmUgdGhyb3VnaCB0aGUKPiBwZXJmLXRvb2xz
LW5leHQgdHJlZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FQLTU9ZlYzTlhrS3ND
UDFXSDBfcUxSTnBMK1d1UDhTM2gxPWNIYVVNSDVNRmtWSFFnQG1haWwuZ21haWwuY29tLwo+IEFy
bmFsZG8sIHBsZWFzZSB0YWtlIEVyaWMncyBwYXRjaCBpbiBwcmVmZXJlbmNlIHRvIHRoaXMgb25l
LgoKU28gSSByZW1vdmVkIHlvdXIgdmVyc2lvbiBmcm9tIHBlcmYtdG9vbHMtbmV4dCwgZXZlbnR1
YWxseSB3ZSdsbCBnZXQKdGhpcyBtZXJnZWQgdXBzdHJlYW0sIEknbSBqdXN0IGNoZWNraW5nIHRo
aXMgaXNuJ3QgZ29pbmcgdG8gZ2V0IGluIG91cgp3YXkgb2YgdGVzdGluZyB3aGF0IHdlIGhhdmUg
aW4gcGVyZi10b29scy1uZXh0Li4uCgoKLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
