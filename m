Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B476C3DA64
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfGzZp4BzA2sBGM9QJZE4ZE46O04TTnCoEGecMbr5Sg=; b=2PAecYDSi6QNdk
	PI2Mg5IKmp9pWnhVfuzOubYa7NvO9P8jaXduQTjSkj3o0hwZRdghvn9xSA2moEgidzas7uoKTMwVX
	n71eSG18+tsme/Vy56APViy73clHGj/7O/p2fv3OVqSq3/G5E3Omqtzj9N/sQI9z6x6cedBqqfGPo
	3vrO6dHD3j6FNiY340TeKfqe8hDvfd0Nk5HGujpNqYe71gm7S8TRifpj8Ppc4xhioubGOxCQzBAjG
	j0APPuRMossMTviPV4AykUV36FFRTcuX6VBrlD5RFwb/qdLmvYQF4mIVVMTi5at/NwIaf9DJFnYMu
	ugHTiSYLelO0/yz9/ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKbI-00000001rbq-1WVi;
	Tue, 06 Aug 2024 13:51:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKah-00000001rNN-3FoU;
	Tue, 06 Aug 2024 13:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CD9A60C5C;
	Tue,  6 Aug 2024 13:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2640FC32786;
	Tue,  6 Aug 2024 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722952266;
	bh=sxqHtM+CyWkUmqLteE86O3EkmvSjV44rljgaOCj5Ows=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLYHdoOpk4wX1H1OL+EQG+3MfxDrT69ZaLgLvEmODNlNIeR19UkqbebYmbbU7gUA3
	 S6R2PS2ALSWVVIpR96O3h0qEgDFxoNuE1SmgIGIrwe/0R9A7fPg/lPadgTH38YUGKz
	 oZDPZAOxf8zGpc9Vm2CGTXIlxVSzYpNf9xClMr7cEa1AhjPjOVHzcjR0GSNCjmtqd4
	 pvir5lZA+In9c86wMBRmT5rmrwOtKpH+jDJcqRb8xnMKiavOVHrY0s513oMzWjH8CO
	 D43cUh9/eYoJ80LCt8SbPtHBddCn5okbivNy68l8V09RO2IqeIUeZ5IrU2TMjkeDa1
	 fSnvhD23yTKAA==
Date: Tue, 6 Aug 2024 10:51:03 -0300
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
Message-ID: <ZrIqR07cYJnhcTq8@x1>
References: <20240805194424.597244-1-irogers@google.com>
 <20240805194424.597244-4-irogers@google.com>
 <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
 <CAP-5=fWDmdAkJSoncedZTaSgFwG+p3--jywDj9krnXSfkhh6dQ@mail.gmail.com>
 <ZrInOywRKzRmjtKF@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrInOywRKzRmjtKF@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_065107_923970_8A6B0D84 
X-CRM114-Status: GOOD (  15.51  )
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

T24gVHVlLCBBdWcgMDYsIDIwMjQgYXQgMTA6Mzg6MDdBTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDA1LCAyMDI0IGF0IDA5OjA1OjI2UE0gLTA3
MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyA1LCAyMDI0IGF0IDg6NTTigK9Q
TSBFcmljIExpbiA8ZXJpYy5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIElh
biwKPiA+ID4KPiA+ID4gSSd2ZSBzZW50IGEgcGF0Y2ggdG8gZml4IGl0IGFuZCB0aGUgcGF0Y2gg
YWxyZWFkeSBtZXJnZWQuIFRoYW5rcy4KCkFsc28sIGFscmVhZHkgbWVyZ2VkIHdoZXJlPyBVcHN0
cmVhbT8gSW4gdGhlIHJpc2N2IGtlcm5lbCB0cmVlPyB3aGVyZT8KCi0gQXJuYWxkbwoKPiA+ID4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNzE5MTE1MDE4LjI3MzU2LTEtZXJpYy5s
aW5Ac2lmaXZlLmNvbS8KPiA+IAo+ID4gSGkgRXJpYy9Bcm5hbGRvLAo+ID4gCj4gPiBSaWdodCwg
SSBhbHJlYWR5IGNvbW1lbnRlZCB0aGlzIHNob3VsZCBoYXZlIGdvbmUgdGhyb3VnaCB0aGUKPiA+
IHBlcmYtdG9vbHMtbmV4dCB0cmVlOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NB
UC01PWZWM05Ya0tzQ1AxV0gwX3FMUk5wTCtXdVA4UzNoMT1jSGFVTUg1TUZrVkhRZ0BtYWlsLmdt
YWlsLmNvbS8KPiA+IEFybmFsZG8sIHBsZWFzZSB0YWtlIEVyaWMncyBwYXRjaCBpbiBwcmVmZXJl
bmNlIHRvIHRoaXMgb25lLgo+IAo+IFNvIEkgcmVtb3ZlZCB5b3VyIHZlcnNpb24gZnJvbSBwZXJm
LXRvb2xzLW5leHQsIGV2ZW50dWFsbHkgd2UnbGwgZ2V0Cj4gdGhpcyBtZXJnZWQgdXBzdHJlYW0s
IEknbSBqdXN0IGNoZWNraW5nIHRoaXMgaXNuJ3QgZ29pbmcgdG8gZ2V0IGluIG91cgo+IHdheSBv
ZiB0ZXN0aW5nIHdoYXQgd2UgaGF2ZSBpbiBwZXJmLXRvb2xzLW5leHQuLi4KPiAKPiAKPiAtIEFy
bmFsZG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
