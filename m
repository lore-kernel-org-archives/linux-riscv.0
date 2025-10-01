Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878E2CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wP21FxqhsM0SCRZg1d/3jQZPRkCO5rCTqEHQelAnSgE=; b=NzC5FWATNrWBwB
	fpguG12e25ShtAkDihW1sI9ZzOOLHnhH/bHS4Gufh2+6vKn3lfqS7UpGQvjuX2YbfDQOg80vIjWeZ
	DPHaiF1/rG1W9xHNyQbpTembatcQ1tD7WzI+TZNUITR5d9wo7G71RINIyBKNdtJd6pImFYRI2r/Kr
	TD59jt9bThDRaZLCYfsSZjGqpfmoYPALjgGpPVUN7YQ+fmJF7V9LypziGvJwjyO+qYI4nni2/ga3d
	CPRKhvaBw3EFk/Mg7WI1/OcBEUy3RHBarluBNBv19bSiYL8wNH5XBJDerT8Z4b27I47Tu3EH+WUWC
	pRl3eSc/duDL1Q/gpi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yes-00000008NXY-3jGK;
	Wed, 01 Oct 2025 15:22:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yeq-00000008NXB-0H17
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 15:22:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34E5A1424;
	Wed,  1 Oct 2025 08:22:11 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D688B3F59E;
	Wed,  1 Oct 2025 08:22:18 -0700 (PDT)
Date: Wed, 1 Oct 2025 16:22:17 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
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
Message-ID: <20251001152217.GQ7985@e132581.arm.com>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
 <aN044EY-Ds9-E6iz@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aN044EY-Ds9-E6iz@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_082220_141283_1FC0E574 
X-CRM114-Status: GOOD (  20.01  )
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

T24gV2VkLCBPY3QgMDEsIDIwMjUgYXQgMTE6MjE6MjBBTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDMwLCAyMDI1IGF0IDA1OjU0OjQ4UE0gKzAx
MDAsIExlbyBZYW4gd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGJ1aWxk
aW5nIHBlcmYgd2l0aCBDbGFuZywgZm9sbG93aW5nIHRoZQo+ID4gZGlzY3Vzc2lvbiBpbiBbMV0u
IEJlY2F1c2UgdGhlIEFuZHJvaWQgTkRLIHVzZXMgQ2xhbmcgYnkgZGVmYXVsdCwKPiA+IGVuYWJs
aW5nIENsYW5nIGJ1aWxkcyBuYXR1cmFsbHkgY292ZXJzIEFuZHJvaWQgYXMgd2VsbC4KPiA+IAo+
ID4gVGhlIHNlcmllcyBpcyBvcmdhbml6ZWQgYXMgZm9sbG93czoKPiA+IAo+ID4gICAtIFBhdGNo
ZXMgMeKAkzI6IEZpeCB0d28gYnVncyBmb3VuZCB3aXRoIENsYW5nLgo+ID4gICAtIFBhdGNoZXMg
M+KAkzY6IENvcnJlY3QgQ1JPU1NfQVJDSCBhbmQgZGlzbWlzcyBDbGFuZyBidWlsZCB3YXJuaW5n
cy4KPiA+ICAgLSBQYXRjaGVzIDfigJM4OiBFbmFibGUgQ2xhbmcgaW4gdGhlIE1ha2VmaWxlIGFu
ZCB1cGRhdGUgdGhlCj4gPiAgICAgZG9jdW1lbnRhdGlvbi4KPiA+IAo+ID4gVGVzdGluZzoKPiA+
IAo+ID4gICAtIENsYW5nIDE1LjAuNyBvbiBVYnVudHUgMjIuMDQuNTogbmF0aXZlIGFuZCBjcm9z
cy1jb21waWxpbmcgKGFhcmNoNjQpCj4gPiAgIC0gQ2xhbmcgMTguMS4zIG9uIFVidW50dSAyNC4w
NC4yOiBuYXRpdmUgYW5kIGNyb3NzLWNvbXBpbGluZyAoYWFyY2g2NCkKPiA+ICAgLSBBbmRyb2lk
IE5ESyByMjdkIChsYXRlc3QgTFRTKTogY3Jvc3MtY29tcGlsaW5nIChhYXJjaDY0KQo+IAo+ICAg
TEQgICAgICAvdG1wL2J1aWxkL3BlcmYvdXRpbC9wZXJmLXV0aWwtaW4ubwo+ICAgTEQgICAgICAv
dG1wL2J1aWxkL3BlcmYvcGVyZi11dGlsLWluLm8KPiAgIEFSICAgICAgL3RtcC9idWlsZC9wZXJm
L2xpYnBlcmYtdXRpbC5hCj4gICBDQyAgICAgIC90bXAvYnVpbGQvcGVyZi9wbXUtZXZlbnRzL3Bt
dS1ldmVudHMubwo+ICAgTEQgICAgICAvdG1wL2J1aWxkL3BlcmYvcG11LWV2ZW50cy9wbXUtZXZl
bnRzLWluLm8KPiAgIEFSICAgICAgL3RtcC9idWlsZC9wZXJmL2xpYnBtdS1ldmVudHMuYQo+ICAg
TElOSyAgICAvdG1wL2J1aWxkL3BlcmYvcGVyZgo+IG1ha2U6IExlYXZpbmcgZGlyZWN0b3J5ICcv
Z2l0L3BlcmYtNi4xNy4wLXJjNi90b29scy9wZXJmJwo+ICsgcm0gLXJmIC90bXAvYnVpbGQvcGVy
Zgo+ICsgbWtkaXIgL3RtcC9idWlsZC9wZXJmCj4gKyBtYWtlICdBUkNIPScgJ0NST1NTX0NPTVBJ
TEU9JyAnRVhUUkFfQ0ZMQUdTPScgLUMgdG9vbHMvcGVyZiAnTz0vdG1wL2J1aWxkL3BlcmYnICdD
Qz1jbGFuZycKPiBtYWtlOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9naXQvcGVyZi02LjE3LjAtcmM2
L3Rvb2xzL3BlcmYnCj4gICBCVUlMRDogICBEb2luZyAnbWFrZSAtajI4JyBwYXJhbGxlbCBidWls
ZAo+IE1ha2VmaWxlLmNvbmZpZzo0OTQ6ICoqKiBObyBnbnUvbGliYy12ZXJzaW9uLmggZm91bmQs
IHBsZWFzZSBpbnN0YWxsIGdsaWJjLWRldltlbF0uICBTdG9wLgo+IG1ha2VbMV06ICoqKiBbTWFr
ZWZpbGUucGVyZjoyODk6IHN1Yi1tYWtlXSBFcnJvciAyCj4gbWFrZTogKioqIFtNYWtlZmlsZTo3
NjogYWxsXSBFcnJvciAyCj4gbWFrZTogTGVhdmluZyBkaXJlY3RvcnkgJy9naXQvcGVyZi02LjE3
LjAtcmM2L3Rvb2xzL3BlcmYnCj4gKyBleGl0IDEKPiB0b29sc2J1aWxkZXJAZml2ZTp+JCBjYXQg
ZG0ubG9nL2FscGluZVw6My4yMgoKQSBxdWljayBsb29rOiB0aGUgYnVpbGQgY2Fubm90IGZpbmQg
Ym90aCBsaWJlbGYgKGZlYXR1cmUtbGliZWxmPTApIGFuZApnbGliYyAoZmVhdHVyZS1nbGliYz0w
KSwgdGh1cyBsZWFkIHRvIGJ1aWxkIGZhaWx1cmUuIEl0IGlzIGdvb2QgdG8Ka25vdyB3aGF0IHRo
ZSByZWFzb24gZm9yIHRoZSBmZWF0dXJlIGJ1aWxkaW5nIGZhaWx1cmVzOgoKICB0b29scy9wZXJm
L2ZlYXR1cmUvdGVzdC1saWJlbGYubWFrZS5vdXRwdXQKICB0b29scy9wZXJmL2ZlYXR1cmUvdGVz
dC1nbGliYy5tYWtlLm91dHB1dAoKSSBhbSBub3Qgc3VycHJpc2VkIGZvciB0aGUgZmFpbHVyZSBv
ZiBsaWJlbGYgKHRoaXMgaXMgY29tbW9uIGNhc2UKdGhhdCB0aGUgcGFja2FnZSBpcyBub3QgaW5z
dGFsbGVkIGJ5IGRlZmF1bHQgaW4gYSBkaXN0cm8pLCBidXQgaXQgaXMgYQpiaXQgY29uZnVzZWQg
Zm9yIHRoZSBnbGliYyBmZWF0dXJlIGZhaWx1cmUuCgpJdCBzZWVtcyB0aGUgaXNzdWUgb2NjdXJz
IG9uIEFscGluZSAzLjIyLCBidXQgdGhlIGhpZ2hlc3QgdmVyc2lvbgpzdXBwb3J0ZWQgaW4gY29u
dGFpbmVyLWJ1aWxkIGlzIDMuMjEgWzFdLiBDb3VsZCB5b3UgY29uZmlybSB3aGV0aGVyCnRoZSBp
c3N1ZSByZXByb2R1Y2VzIG9uIG90aGVyIGRpc3Ryb3Mgb3IgdmVyc2lvbnM/CgpUaGFua3MsCkxl
bwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9hY21lbC9saW51eC10b29scy1jb250YWluZXItYnVp
bGRzL3RyZWUvbWFpbi9hbHBpbmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
