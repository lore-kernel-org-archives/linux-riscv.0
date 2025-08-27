Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C677CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suSmG+DgjdKX2mwIMM0ofwEw9h45aKZDML2Oa2vcwBQ=; b=iX4h2jO6G21qFb
	qXPGtPVkL4k0NRGMRrAh97NyhGASw3Cj143ikf7DfAQRq0EaEfDecTtGRf9P3TTUKrIbwo2mqDZSo
	X2pIHRsu3fdlWraoReV1ScRlRhEUPY9O6uRaB2Dbmh3w343nC9QbkDdcQZPMyo8kPC6IsmQi27Col
	RpT9csxNkYL/plHtxzIwvLab2K0WNbQWesU4vQ/r9jMtK9YPhNPjhrjGs1IJ3qbIDwsWsF9OGk87Y
	ffEEBwmjAbOr3PD0ILHgkuiLzMabIB+U3HdS6H45z7lYkiojs2tWq6VM1V/3wpYDko4xoO6G3r+C/
	sNkpSAIPPN/8Ye+5ounA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKIb-0000000GMki-1Yn9;
	Wed, 27 Aug 2025 17:51:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHsH-0000000Fsuq-276N
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 15:15:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-24611734e50so164575ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756307744; x=1756912544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=V9X9qsxjyxEgU+s095f8lLyBcJkNf+UksyYjpwVCIgEFsskUAtKamvLVfm/u7CtiAn
         SogDGquoILFchTEqXO6vHTPmU95nDKxfdBhmMeeaR5HbOR+H6ZibwL88QmppKRLqLW3+
         17UkZqvq3g3Grux3ulbuhamBsveIeLp6PMtOX9zwV0ZFg7sq0Nd0OmAW3Crku9DfFPt3
         Bh4oUFDW9ZjTc4fanvMe84rR/XbmncbkIvrITtKxuQ112PY9BFaCaZLxnda5s+ws2Sx6
         KxKa0sWDUNhm46Jk+f2IlnrY//iOg7og9h4qAlJ/UnQ6E6u/gp+OQ1oHAV/Ks04ZEGe2
         ZIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307744; x=1756912544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=bKOAlVclh1iIEQgsSBLCig7i85uEFjvTXH25OFjzqfuYam2wNyj3ZuQnm1pTgfkDYj
         y/MMzvUKq7v/EPS0ZwTOCHdNrUSyPGVkEiVxX/hjGXdV8rkvWD2l8Hg5nqvNphZCTotB
         DbBNCwVnBzYFYyb6kDsORVNwq6wDmOz0Igmt4Hs6lRIZhVrl/d76SB235VlwWmW9wdt4
         QxXtVxUs0DCl+LD6oUiHZkWeMaEvwTxo+8ljpD5bYVk85wWz4byAa43ljKKQ5NaxAirx
         1SiwWkewT/LIX/eY0VJPspwyXsAtW2RL5E+y5Pag4QEqE2K0ieBvuTk/hqeUMxJcHf/M
         zUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcomAOo1A+jkApAoibr8bE0ztmU7kqUEq6b7l+wjUhB1JW+EnEbUqnO6W5Ow4dRd/XdIR//PnldOLzVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz3UNDcQ6l/wnSvoA/kaqx1anL4M6y4EN4C5P5V0ZMWGE5frOR
	7VzB/G3ejC81/Y00pZWyL10eKwIN37xsfOlAgt+Z1jGMBWyYQXGaLxl3938HrFgFXdK/Kb+yXEV
	dq+/jJzbchsTnZ0hqB0FzWTv+jf/aRbN0fi6rfQqY
X-Gm-Gg: ASbGncvQ7Q+oqi4Kz34sUxem6SU0RyC+F40B7ezNub0ENi0x9aw5CxNOFwR+FyyK41F
	TyODneNwRzlFAehQX7vop8UUxfOrFAU2vgzul4xWEUyw7Pam2xIxeXdEi/ZIM/DYuZRbInbd3kj
	NrynTg+lKDTqp2Ix5KAomWylQPYhLX9r0fJR6t3bhoWlH2b7UOnAYxoRTKvHO17Aa5GDtgkXUar
	eb4FMRpzFVuvckZbfy//2xnfpU51S/OzF9zk0GxQCA=
X-Google-Smtp-Source: AGHT+IExi0QgPJP/5AblrVahQdACSVklatzIIhzDoM8PROF9H/mRXxhxpv9GhjknP28Wz6ljzGsei6gbP7f3oTXJLVM=
X-Received: by 2002:a17:902:ec87:b0:246:a8ac:1a36 with SMTP id
 d9443c01a7336-2485ba5311amr9397575ad.2.1756307741849; Wed, 27 Aug 2025
 08:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com> <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
 <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
In-Reply-To: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
From: Ian Rogers <irogers@google.com>
Date: Wed, 27 Aug 2025 08:15:29 -0700
X-Gm-Features: Ac12FXwUZ4TrRSXyzgr8XTQRkesJ87wwMtoKHvx086ZRlV4GbvgOq2WSyedNfZ4
Message-ID: <CAP-5=fU0-QDMP-VG3O1qBvJ8uzHHYCQ8j1Vrzy9a0YUk=UMvHw@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, 
	will@kernel.org, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081545_558002_05150ABA 
X-CRM114-Status: GOOD (  32.10  )
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

T24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgMToxOOKAr0FNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRs
YW5kQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgMTE6NDg6NDhB
TSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDI2LCAyMDI1IGF0IDg6
MzLigK9BTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gMjAyNS0wOC0yNiAyOjAzIHBtLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+ID4g
PiBPbiBXZWQsIEF1ZyAxMywgMjAyNSBhdCAwNjowMTowNFBNICswMTAwLCBSb2JpbiBNdXJwaHkg
d3JvdGU6Cj4gPiA+ID4+IEl0IG1heSBoYXZlIGJlZW4gZGlmZmVyZW50IGxvbmcgYWdvLCBidXQg
dG9kYXkgaXQgc2VlbXMgd3JvbmcgZm9yIHRoZXNlCj4gPiA+ID4+IGRyaXZlcnMgdG8gc2tpcCBj
b3VudGluZyBkaXNhYmxlZCBzaWJsaW5nIGV2ZW50cyBpbiBncm91cCB2YWxpZGF0aW9uLAo+ID4g
PiA+PiBnaXZlbiB0aGF0IHBlcmZfZXZlbnRfZW5hYmxlKCkgY291bGQgbWFrZSB0aGVtIHNjaGVk
dWxhYmxlIGFnYWluLCBhbmQKPiA+ID4gPj4gdGh1cyBpbmNyZWFzZSB0aGUgZWZmZWN0aXZlIHNp
emUgb2YgdGhlIGdyb3VwIGxhdGVyLiBDb252ZXJzZWx5LCBpZiBhCj4gPiA+ID4+IHNpYmxpbmcg
ZXZlbnQgaXMgdHJ1bHkgZGVhZCB0aGVuIGl0IHN0YW5kcyB0byByZWFzb24gdGhhdCB0aGUgd2hv
bGUKPiA+ID4gPj4gZ3JvdXAgaXMgZGVhZCwgc28gaXQncyBub3Qgd29ydGggZ29pbmcgdG8gYW55
IHNwZWNpYWwgZWZmb3J0IHRvIHRyeSB0bwo+ID4gPiA+PiBzcXVlZXplIGluIGEgbmV3IGV2ZW50
IHRoYXQncyBuZXZlciBnb2luZyB0byBydW4gYW55d2F5LiBUaHVzLCB3ZSBjYW4KPiA+ID4gPj4g
c2ltcGx5IHJlbW92ZSBhbGwgdGhlc2UgY2hlY2tzLgo+ID4gPiA+Cj4gPiA+ID4gU28gY3VycmVu
dGx5IHlvdSBjYW4gZG8gc29ydCBvZiBhIG1hbnVhbCBldmVudCByb3RhdGlvbiBpbnNpZGUgYW4K
PiA+ID4gPiBvdmVyLXNpemVkIGdyb3VwIGFuZCBoYXZlIGl0IHdvcmsuCj4gPiA+ID4KPiA+ID4g
PiBJJ20gbm90IHN1cmUgaWYgYW55Ym9keSBhY3R1YWxseSBkb2VzIHRoaXMsIGJ1dCBpdHMgcG9z
c2libGUuCj4gPiA+ID4KPiA+ID4gPiBFZy4gb24gYSBQTVUgdGhhdCBzdXBwb3J0cyBvbmx5IDQg
Y291bnRlcnMsIGNyZWF0ZSBhIGdyb3VwIG9mIDUgYW5kCj4gPiA+ID4gcGVyaW9kaWNhbGx5IGN5
Y2xlIHdoaWNoIG9mIHRoZSA1IGV2ZW50cyBpcyBvZmYuCj4gPgo+ID4gSSdtIG5vdCBzdXJlIHRo
aXMgaXMgdHJ1ZSwgSSB0aG91Z2h0IHRoaXMgd291bGQgZmFpbCBpbiB0aGUKPiA+IHBlcmZfZXZl
bnRfb3BlbiB3aGVuIGFkZGluZyB0aGUgNXRoIGV2ZW50IGFuZCB0aGVyZSBiZWluZyBpbnN1ZmZp
Y2llbnQKPiA+IGNvdW50ZXJzIGZvciB0aGUgZ3JvdXAuCj4KPiBXZSdyZSB0YWxraW5nIHNwZWNp
ZmljYWxseSBhYm91dCBjYXNlcyB3aGVyZSB0aGUgbG9naWMgaW4gYSBwbXUncwo+IHBtdTo6ZXZl
bnRfaW5pdCgpIGNhbGxiYWNrIGRvZXNuJ3QgY291bnQgZXZlbnRzIGluIHNwZWNpZmljIHN0YXRl
cywgYW5kCj4gaGVuY2UgdGhlIDV0aCBldmVuIGRvZXNuJ3QgZ2V0IHJlamVjdGVkIHdoZW4gaXQg
aXMgaW5pdGlhbGlzZWQuCj4KPiBGb3IgZXhhbXBsZSwgaW4gYXJjaC94ODYvZXZlbnRzL2NvcmUu
YywgdmFsaWRhdGVfZ3JvdXAoKSB1c2VzCj4gY29sbGVjdF9ldmVudHMoKSwgd2hpY2ggaGFzOgo+
Cj4gICAgICAgICBmb3JfZWFjaF9zaWJsaW5nX2V2ZW50KGV2ZW50LCBsZWFkZXIpIHsKPiAgICAg
ICAgICAgICAgICAgaWYgKCFpc194ODZfZXZlbnQoZXZlbnQpIHx8IGV2ZW50LT5zdGF0ZSA8PSBQ
RVJGX0VWRU5UX1NUQVRFX09GRikKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
Pgo+ICAgICAgICAgICAgICAgICBpZiAoY29sbGVjdF9ldmVudChjcHVjLCBldmVudCwgbWF4X2Nv
dW50LCBuKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICAg
ICAgICAgICAgICAgICBuKys7Cj4gICAgICAgICB9Cj4KPiAuLi4gYW5kIHNvIHdoZXJlIGFuIGV2
ZW50J3Mgc3RhdGUgaXMgPD0gUEVSRl9FVkVOVF9TVEFURV9PRkYgYXQgaW5pdAo+IHRpbWUsIHRo
YXQgZXZlbnQgaXMgbm90IGNvdW50ZWQgdG8gc2VlIGlmIGl0IGZpdHMgaW50byBIVyBjb3VudGVy
cy4KCkhtbS4uIFRoaW5raW5nIG91dCBsb3VkLiBTbyBpdCBsb29rZWQgbGlrZSBwZXJmIHdpdGgg
d2VhayBncm91cHMgY291bGQKYmUgYnJva2VuIHRoZW46CmBgYAokIHN1ZG8gcGVyZiBzdGF0IC12
diAtZSAne2luc3RydWN0aW9ucyxjeWNsZXN9OlcnIHRydWUKLi4uCnBlcmZfZXZlbnRfYXR0cjoK
IHR5cGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAgKFBFUkZfVFlQRV9IQVJEV0FSRSkK
IHNpemUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEzNgogY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHg0MDAwMDAwMDEKKGNwdV9jb3JlL1BFUkZfQ09VTlRfSFdfSU5TVFJV
Q1RJT05TLykKIHNhbXBsZV90eXBlICAgICAgICAgICAgICAgICAgICAgIElERU5USUZJRVIKIHJl
YWRfZm9ybWF0ICAgICAgICAgICAgICAgICAgICAgIFRPVEFMX1RJTUVfRU5BQkxFRHxUT1RBTF9U
SU1FX1JVTk5JTkd8SUR8R1JPVVAKIGRpc2FibGVkICAgICAgICAgICAgICAgICAgICAgICAgIDEK
IGluaGVyaXQgICAgICAgICAgICAgICAgICAgICAgICAgIDEKIGVuYWJsZV9vbl9leGVjICAgICAg
ICAgICAgICAgICAgIDEKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCnN5c19wZXJmX2V2ZW50X29wZW46IHBpZCAzMzM3NzY0ICBjcHUg
LTEgIGdyb3VwX2ZkIC0xICBmbGFncyAweDggPSA1Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpwZXJmX2V2ZW50X2F0dHI6CiB0eXBl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwIChQRVJGX1RZUEVfSEFSRFdBUkUpCiBzaXpl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMzYKIGNvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDB4NDAwMDAwMDAwCihjcHVfY29yZS9QRVJGX0NPVU5UX0hXX0NQVV9DWUNMRVMv
KQogc2FtcGxlX3R5cGUgICAgICAgICAgICAgICAgICAgICAgSURFTlRJRklFUgogcmVhZF9mb3Jt
YXQgICAgICAgICAgICAgICAgICAgICAgVE9UQUxfVElNRV9FTkFCTEVEfFRPVEFMX1RJTUVfUlVO
TklOR3xJRHxHUk9VUAogaW5oZXJpdCAgICAgICAgICAgICAgICAgICAgICAgICAgMQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc3lz
X3BlcmZfZXZlbnRfb3BlbjogcGlkIDMzMzc3NjQgIGNwdSAtMSAgZ3JvdXBfZmQgNSAgZmxhZ3Mg
MHg4ID0gNwouLi4KYGBgCk5vdGUsIHRoZSBncm91cCBsZWFkZXIgKGluc3RydWN0aW9ucykgaXMg
ZGlzYWJsZWQgYmVjYXVzZSBvZjoKaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYv
dXRpbC9zdGF0LmM/aD1wZXJmLXRvb2xzLW5leHQjbjc2MQpgYGAKLyoKKiBEaXNhYmxpbmcgYWxs
IGNvdW50ZXJzIGluaXRpYWxseSwgdGhleSB3aWxsIGJlIGVuYWJsZWQKKiBlaXRoZXIgbWFudWFs
bHkgYnkgdXMgb3IgYnkga2VybmVsIHZpYSBlbmFibGVfb25fZXhlYwoqIHNldCBsYXRlci4KKi8K
aWYgKGV2c2VsX19pc19ncm91cF9sZWFkZXIoZXZzZWwpKSB7CiAgICAgICAgYXR0ci0+ZGlzYWJs
ZWQgPSAxOwpgYGAKYnV0IHRoZSBjaGVja2luZyBvZiBiZWluZyBkaXNhYmxlZCAoUEVSRl9FVkVO
VF9TVEFURV9PRkYpIGlzIG9ubHkgZG9uZQpvbiBzaWJsaW5ncyBpbiB0aGUgY29kZSB5b3Ugc2hv
dyBhYm92ZS4gU28geWVzLCB5b3UgY2FuIGRpc2FibGUgdGhlCmdyb3VwIGV2ZW50cyB0byBhbGxv
dyB0aGUgcGVyZl9ldmVudF9vcGVuIHRvIHN1Y2NlZWQgYnV0IG5vdCBvbiB0aGUKbGVhZGVyIHdo
aWNoIGlzIGFsd2F5cyBjaGVja2VkIChubyBQRVJGX0VWRU5UX1NUQVRFX09GRiBjaGVjayk6Cmh0
dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3Bl
cmYtdG9vbHMtbmV4dC5naXQvdHJlZS9hcmNoL3g4Ni9ldmVudHMvY29yZS5jP2g9cGVyZi10b29s
cy1uZXh0I24xMjA0CmBgYAppZiAoaXNfeDg2X2V2ZW50KGxlYWRlcikpIHsKICAgICAgICBpZiAo
Y29sbGVjdF9ldmVudChjcHVjLCBsZWFkZXIsIG1heF9jb3VudCwgbikpCiAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKYGBgCgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
