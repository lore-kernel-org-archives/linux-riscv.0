Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A055CCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHBf5ek5FiHP1ZlOOfnVi6gt/FQsBYZ95joGzDqxwV8=; b=BtJqmE7iKdMkCC
	hp6X1gEDWk7aeoAXoMZhJZw2v8b6rVdOviw67hQoMEjts+dBTmuAcEUUoOBjHx6bPueO16chMGEgo
	DNh9FmPIQZs+NqxWfPsUiLtyOMF+GD28d1OPpGuxBOCUBq0PhqrqmEy3/gfO0ig4uGh3jVa08IlXj
	1/cwUo1jslB5hhQOoTD46ZLaYIqvvUM8ciZRuA/kGmB9IVULHxVxBqhGmrSJwclzc7JEIcRDguGRH
	s0RUArXQL2v9ElqKcYkkgLb4PvKEtsWiXxVTlkpf3+K0coR3G7/6QdhdTrJy4n+wpa8EeBLawZO0O
	K6X0f1KvTYCAxVxqCpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddJ-00000005oVh-0jQP;
	Tue, 30 Sep 2025 16:55:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddF-00000005oUR-3vHx
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:55:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48AC9106F;
	Tue, 30 Sep 2025 09:55:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C83283F59E;
	Tue, 30 Sep 2025 09:55:11 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/8] perf build: Support building with Clang
Date: Tue, 30 Sep 2025 17:54:48 +0100
Message-Id: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFgL3GgC/3WNQQ6CMBBFr0JmbU0paQKuvIchpGUGmSgtmSrRE
 O5uJW5dvpf891dIJEwJTsUKQgsnjiGDORTQjy5cSTFmBqON1U1p1UwydP7Jd+xcQImMXcCbslp
 7W3lydWMhj2ehgV97+NJmHjk9orz3n6X82l/S/E0updKq9pV1DpEq7M9OpmMfJ2i3bfsAMmNGW
 boAAAA=
X-Change-ID: 20250915-perf_build_android_ndk-500b53bea895
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759251311; l=2242;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=DG99HF4Lne9RqdlvTT1l9WWDXFii+MEmJGhK5urOu34=;
 b=SzjrvsCzykN6+u62532Hnbo0JlFkPjxkoqgejd67nbrkmjwphzWlZC5C/EYLaAIZAUUMn/YrQ
 +jKctUmlXEsCi+gBra8alvZCQjLe4NPgx/o3F58YKpFdhXlWZjPqcqJ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_095518_090475_51538120 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBidWlsZGluZyBwZXJmIHdpdGggQ2xhbmcsIGZv
bGxvd2luZyB0aGUKZGlzY3Vzc2lvbiBpbiBbMV0uIEJlY2F1c2UgdGhlIEFuZHJvaWQgTkRLIHVz
ZXMgQ2xhbmcgYnkgZGVmYXVsdCwKZW5hYmxpbmcgQ2xhbmcgYnVpbGRzIG5hdHVyYWxseSBjb3Zl
cnMgQW5kcm9pZCBhcyB3ZWxsLgoKVGhlIHNlcmllcyBpcyBvcmdhbml6ZWQgYXMgZm9sbG93czoK
CiAgLSBQYXRjaGVzIDHigJMyOiBGaXggdHdvIGJ1Z3MgZm91bmQgd2l0aCBDbGFuZy4KICAtIFBh
dGNoZXMgM+KAkzY6IENvcnJlY3QgQ1JPU1NfQVJDSCBhbmQgZGlzbWlzcyBDbGFuZyBidWlsZCB3
YXJuaW5ncy4KICAtIFBhdGNoZXMgN+KAkzg6IEVuYWJsZSBDbGFuZyBpbiB0aGUgTWFrZWZpbGUg
YW5kIHVwZGF0ZSB0aGUKICAgIGRvY3VtZW50YXRpb24uCgpUZXN0aW5nOgoKICAtIENsYW5nIDE1
LjAuNyBvbiBVYnVudHUgMjIuMDQuNTogbmF0aXZlIGFuZCBjcm9zcy1jb21waWxpbmcgKGFhcmNo
NjQpCiAgLSBDbGFuZyAxOC4xLjMgb24gVWJ1bnR1IDI0LjA0LjI6IG5hdGl2ZSBhbmQgY3Jvc3Mt
Y29tcGlsaW5nIChhYXJjaDY0KQogIC0gQW5kcm9pZCBOREsgcjI3ZCAobGF0ZXN0IExUUyk6IGNy
b3NzLWNvbXBpbGluZyAoYWFyY2g2NCkKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1wZXJmLXVzZXJzLzIwMjQwNzE1MTQzMzQyLjUyMjM2LTEtbGVvLnlhbkBhcm0uY29tLwoKLS0t
CkNoYW5nZXMgaW4gdjI6Ci0gRHJvcHBlZCB0aGUgcGF0Y2ggZm9yIGRpc21pc3Npbmcgd2Fybmlu
ZyBpbiBicGZ0b29sLgotIFJlZmluZWQgdGhlIGRvY3VtZW50LiAoSWFuKQotIExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MjUtcGVyZl9idWlsZF9hbmRyb2lkX25k
ay12MS0wLThiMzVhYWRkZTNkY0Bhcm0uY29tCgotLS0KTGVvIFlhbiAoOCk6CiAgICAgIHRvb2xz
IGJ1aWxkOiBBbGlnbiB3YXJuaW5nIG9wdGlvbnMgd2l0aCBwZXJmCiAgICAgIHBlcmYgcHl0aG9u
OiBzcGxpdCBDbGFuZyBvcHRpb25zIHdoZW4gaW52b2tpbmcgUG9wZW4KICAgICAgcGVyZjogYnVp
bGQ6IENvcnJlY3QgQ1JPU1NfQVJDSCBmb3IgY2xhbmcKICAgICAgcGVyZiB0ZXN0IGNvcmVzaWdo
dDogRGlzbWlzcyBjbGFuZyB3YXJuaW5nIGZvciBtZW1jcHkgdGhyZWFkCiAgICAgIHBlcmYgdGVz
dCBjb3Jlc2lnaHQ6IERpc21pc3MgY2xhbmcgd2FybmluZyBmb3IgdGhyZWFkIGxvb3AKICAgICAg
cGVyZiB0ZXN0IGNvcmVzaWdodDogRGlzbWlzcyBjbGFuZyB3YXJuaW5nIGZvciB1bnJvbGwgbG9v
cCB0aHJlYWQKICAgICAgcGVyZiBidWlsZDogU3VwcG9ydCBidWlsZCB3aXRoIGNsYW5nCiAgICAg
IHBlcmYgZG9jczogRG9jdW1lbnQgYnVpbGRpbmcgd2l0aCBDbGFuZwoKIHRvb2xzL2J1aWxkL2Zl
YXR1cmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KIHRvb2xzL3BlcmYv
RG9jdW1lbnRhdGlvbi9CdWlsZC50eHQgICAgICAgICAgICAgICAgIHwgMTUgKysrKwogdG9vbHMv
cGVyZi9Eb2N1bWVudGF0aW9uL2FuZHJvaWQudHh0ICAgICAgICAgICAgICAgfCA4MCArKy0tLS0t
LS0tLS0tLS0tLS0tLS0tCiB0b29scy9wZXJmL01ha2VmaWxlLmNvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDMyICsrKysrKysrLQogdG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogLi4uL3NoZWxsL2NvcmVzaWdodC9tZW1jcHlf
dGhyZWFkL21lbWNweV90aHJlYWQuYyAgfCAgMiArCiAuLi4vc2hlbGwvY29yZXNpZ2h0L3RocmVh
ZF9sb29wL3RocmVhZF9sb29wLmMgICAgICB8ICA0ICstCiAuLi4vdW5yb2xsX2xvb3BfdGhyZWFk
L3Vucm9sbF9sb29wX3RocmVhZC5jICAgICAgICB8ICA0ICstCiB0b29scy9wZXJmL3V0aWwvc2V0
dXAucHkgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICstCiA5IGZpbGVzIGNoYW5nZWQs
IDY3IGluc2VydGlvbnMoKyksIDgzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGMxN2Rk
YTgwMTM0OTVkODEzMmM5NzZjYmYzNDliZTk5NDlkMGZiZDEKY2hhbmdlLWlkOiAyMDI1MDkxNS1w
ZXJmX2J1aWxkX2FuZHJvaWRfbmRrLTUwMGI1M2JlYTg5NQoKQmVzdCByZWdhcmRzLAotLSAKTGVv
IFlhbiA8bGVvLnlhbkBhcm0uY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
