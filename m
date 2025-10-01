Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B1BCCA472
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gV/8m+/Uxr6t50cqKyCRKdg8h/r3z94KJJJ+4hrvfug=; b=yOxPonuEuHtaRg
	P5WrmHzkBV4V0HERrRMhD+3/UCjf696q3Y66+ghINZo5uZ6vZcfeugMeqxgaWTNpBL3mGDFXhfnWQ
	tQluUjvAKCDV8V5yMb6m+amgLj2ewgvb2LShRO+f8WkmjK8YuBPK3WU/DV9tuWODu6O2M5d4OdTfD
	NH9I9eT2D49zgH/d+IuCe4lRdWY8ufl/f3xqZ+cBDjTJEG+5pRu8i6PimiMxlwaNq6GwkiaCCwZnA
	liW1eKyXJeF/NNjCA9CLLDJFwozoiSaKnKSxMh1dnJ4NojQ5aPWSvCeFV8hT+AozTWEJlGFgPFeU1
	Jn0/PaTG+wN4ZSdePajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x9L-000000084b7-3Yt9;
	Wed, 01 Oct 2025 13:45:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x9K-000000084af-25C2
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 13:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E442A601A6;
	Wed,  1 Oct 2025 13:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BADC116C6;
	Wed,  1 Oct 2025 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759326341;
	bh=X3hm9ss/SXCZSvIwShr72ovUiAR+OHYiSbSTP2qjzCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMswArJpZ2ezk3pXV7PL2vbdMCSZMqRybljaqOG5JHPfyZd0qfWvhvegFlyZup6cO
	 RccnvOha1DIgjRim0XBcJV+5HNTTG3C+kuLeHP2/rnbp2peUKJPQbRBMmnKHAx/NCz
	 Xox8GEzVSc8ddGmcKGCUXTA2qQAd8eC+AR7/Aif4qAFnS3Qp+jo+5RDYo6NpQWHeLs
	 3HQoPzQEh2og89gDXmaMRAZJuYh/7osk6e4C9AcrHvLmOGf/qTyIO6yflNIW3x0tsZ
	 aB7rIr08HxhUlCOVw+Bubn2g+M6Q+OlXciHnG12nevCDoovY/OndAqPXz4Qfy15qpl
	 Ofkn+K1jFYlOg==
Date: Wed, 1 Oct 2025 10:45:38 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@arm.com>, Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/8] perf build: Support building with Clang
Message-ID: <aN0wgvAsKh0n4sL4@x1>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
 <CAP-5=fUdk-EEDz2p__UJAcmkO=bA143dOUpGRcnW7_5FhZT71Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUdk-EEDz2p__UJAcmkO=bA143dOUpGRcnW7_5FhZT71Q@mail.gmail.com>
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

T24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgMTE6MTQ6MzBBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBUdWUsIFNlcCAzMCwgMjAyNSBhdCA5OjU14oCvQU0gTGVvIFlhbiA8bGVvLnlhbkBh
cm0uY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGJ1aWxk
aW5nIHBlcmYgd2l0aCBDbGFuZywgZm9sbG93aW5nIHRoZQo+ID4gZGlzY3Vzc2lvbiBpbiBbMV0u
IEJlY2F1c2UgdGhlIEFuZHJvaWQgTkRLIHVzZXMgQ2xhbmcgYnkgZGVmYXVsdCwKPiA+IGVuYWJs
aW5nIENsYW5nIGJ1aWxkcyBuYXR1cmFsbHkgY292ZXJzIEFuZHJvaWQgYXMgd2VsbC4KPiA+Cj4g
PiBUaGUgc2VyaWVzIGlzIG9yZ2FuaXplZCBhcyBmb2xsb3dzOgo+ID4KPiA+ICAgLSBQYXRjaGVz
IDHigJMyOiBGaXggdHdvIGJ1Z3MgZm91bmQgd2l0aCBDbGFuZy4KPiA+ICAgLSBQYXRjaGVzIDPi
gJM2OiBDb3JyZWN0IENST1NTX0FSQ0ggYW5kIGRpc21pc3MgQ2xhbmcgYnVpbGQgd2FybmluZ3Mu
Cj4gPiAgIC0gUGF0Y2hlcyA34oCTODogRW5hYmxlIENsYW5nIGluIHRoZSBNYWtlZmlsZSBhbmQg
dXBkYXRlIHRoZQo+ID4gICAgIGRvY3VtZW50YXRpb24uCj4gPgo+ID4gVGVzdGluZzoKPiA+Cj4g
PiAgIC0gQ2xhbmcgMTUuMC43IG9uIFVidW50dSAyMi4wNC41OiBuYXRpdmUgYW5kIGNyb3NzLWNv
bXBpbGluZyAoYWFyY2g2NCkKPiA+ICAgLSBDbGFuZyAxOC4xLjMgb24gVWJ1bnR1IDI0LjA0LjI6
IG5hdGl2ZSBhbmQgY3Jvc3MtY29tcGlsaW5nIChhYXJjaDY0KQo+ID4gICAtIEFuZHJvaWQgTkRL
IHIyN2QgKGxhdGVzdCBMVFMpOiBjcm9zcy1jb21waWxpbmcgKGFhcmNoNjQpCj4gPgo+ID4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBlcmYtdXNlcnMvMjAyNDA3MTUxNDMzNDIu
NTIyMzYtMS1sZW8ueWFuQGFybS5jb20vCj4gPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+
ID4gLSBEcm9wcGVkIHRoZSBwYXRjaCBmb3IgZGlzbWlzc2luZyB3YXJuaW5nIGluIGJwZnRvb2wu
Cj4gPiAtIFJlZmluZWQgdGhlIGRvY3VtZW50LiAoSWFuKQo+ID4gLSBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwOTI1LXBlcmZfYnVpbGRfYW5kcm9pZF9uZGstdjEt
MC04YjM1YWFkZGUzZGNAYXJtLmNvbQo+IAo+IFJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9n
ZXJzQGdvb2dsZS5jb20+CgpUaGFua3MsIGFwcGxpZWQgdG8gcGVyZi10b29scy1uZXh0LAoKLSBB
cm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
