Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41333C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JAaD5b96iFV6BD3Vj8mVqO2r3wz4lP+8u7jg9misCHI=; b=n3GyF/PuXuBDf63nLCb8UoyUvC
	40Bl9bBD3+2U0Zq4hNkOpYhYmPMSnwYWR8yX9Q4jw5tvNf2j34hLOrsFQeGecgaormt+ywXZLO7qy
	yHVL73ajC7huvvWM3wuBEztalorqcQRs+16lQ1k3rw3YukCZDZo44xlbejPZycZz8YxvpbB6yOJg0
	vvGg3ccZtrdXBqOk0JtiwFGHwsYRbU7qwa2GZyAwDo16tiFLW2fUNar68rk7NCh5Gr30M9QSkaPUc
	PQFy76zCPuhlZ5WbxSvZsy5HQNY/94soKHXO06JuatiMBtp9EAxEsPWVxLZLmrVepMz26MuOCQdJV
	450OkVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPfu-00000009AyL-32un;
	Mon, 15 Apr 2024 16:59:22 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPfr-00000009AxS-3JSq
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 16:59:21 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-36a0c8c5f18so5145ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713200355; x=1713805155; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEib3GfoMjSsGAGLxyonIryZVPQ97O3Yy2s2kSrwbjg=;
        b=DMky5NhKXZSQwcoY9cyi1+OV/zlqb6yEfFTWkl5azF4GQIDw894bNIeeBbIF9U0OKX
         ZJiqX6WalaVhr8YO+hAkliASPZkRO0vSwNhHKfkpSqI3d2cCpSGBDknPMnI+zEW8hsmq
         fByG5TCfttosA6YSuRCo64TQKvBj/Mf+xp2zrN+XMo9be58jo5jd0x3eixyQlQdNm4Y5
         gvDGK1q03kNCaHuw4je0KfrRxErKge9UDd1Ebi4KM2h3fNvQVTdhqzTRgtsyRhtfOY5F
         wHl1kP7gyLiqAkSK8yB6FevjlOOJu3NqqAvc73hJz8fqVs52O8R2HNtqa18LRXEEMXpV
         8m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200355; x=1713805155;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEib3GfoMjSsGAGLxyonIryZVPQ97O3Yy2s2kSrwbjg=;
        b=faF2gF9g8JIVviEfK0zuie1ODKwSKVoT7SwzgzThxfxP64KTDDJg7Gy/jIl/1R+wDe
         yQcoiDBhSbbycfX0Omf5AKyFmdkCQagtbODowefeU86DisElu5seacEkS+CRtr0Dw6hj
         ZZAn+43JsU1TTLSxv+UsN5SRpf9YJdDFjnD87b3BJH2ZjNHaPu5B6eFQPOWJwUFZgbOd
         +aejG6pTwP+VdoLj8nP7Elk3Bcr8vus4ntbDkArk/X0I3XfWk0FymC7UChH4lzc2Khys
         g0dsKNmDd1j682VpFposhDVGjPrwQo5Hufsb4R+eik5ZvzFA92XheqJsyENAWtq/ygJB
         g83w==
X-Forwarded-Encrypted: i=1; AJvYcCWznVDrpKvk/ngsPLS6E2ms5/TlQZjRX///QMX4WWB2XRBASfhTaktDQ25oTp+qDpoQgGwrWb2PRfaCpLBrZKGyXn62KlgDkDq5WMmiduOA
X-Gm-Message-State: AOJu0YyG684wjOcsX4id5vjC6qlsPopfzUXqgr4bM+BDkRTNsOloVpn7
	RenG8u4AAPyBlpVZfOHXZsWiPd2mj2jAhHSynmcKM6KDD9VssiztMGcWkCu8NqDlOTly0SyClXa
	kvQz17AucVP0iecOffJWBQx1k3bzpc21oHtz1
X-Google-Smtp-Source: AGHT+IHk3Q1DJ27BgyWaA1tZ68jUswiQUBjNiPkdLY2pHmnY2/6xbO2ks9X9CrEfiHqM0rpPNqR4Dkwl29fBB23MtN8=
X-Received: by 2002:a05:6e02:591:b0:36a:fcc9:64eb with SMTP id
 c17-20020a056e02059100b0036afcc964ebmr425184ils.5.1713200354212; Mon, 15 Apr
 2024 09:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 15 Apr 2024 09:59:00 -0700
Message-ID: <CAP-5=fWhPTWiRjiUW7vRCetm26fYgOWfHzV4Qig3rSfe-x5VLQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Consistently prefer sysfs/json events
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Beeman Strong <beeman@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_095919_852807_BB83D629 
X-CRM114-Status: GOOD (  13.39  )
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

T24gU3VuLCBBcHIgMTQsIDIwMjQgYXQgMTE6MzbigK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gQXMgZGlzY3Vzc2VkIGluOgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyNDAyMTcwMDU3MzguMzc0NDEyMS0xLWF0aXNocEByaXZvc2luYy5jb20v
Cj4gcHJlZmVycmluZyBzeXNmcy9qc29uIGV2ZW50cyBjb25zaXN0ZW50bHkgKHdpdGggb3Igd2l0
aG91dCBhIGdpdmVuCj4gUE1VKSB3aWxsIGVuYWJsZSBSSVNDLVYncyBob3BlIHRvIGN1c3RvbWl6
ZSBsZWdhY3kgZXZlbnRzIGluIHRoZSBwZXJmCj4gdG9vbC4KPgo+IFNvbWUgbWlub3IgY2xlYW4t
dXAgaXMgcGVyZm9ybWVkIG9uIHRoZSB3YXkuCgpBIHNpZGUtZWZmZWN0IG9mIHByaW9yaXRpemlu
ZyBzeXNmcy9qc29uIGV2ZW50cyBvdmVyIGxlZ2FjeSBoYXJkd2FyZQpldmVudHMgaXMgdGhhdCB0
aGUgaGFyZCBjb2RlZCBtZXRyaWMgbG9naWMgaW4gc3RhdC1zaGFkb3cgZmFpbHM6Cmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1u
ZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9zdGF0LXNoYWRvdy5jP2g9cGVyZi10b29scy1u
ZXh0I24xMDAKVGhpcyBpcyBiZWNhdXNlIHRoZSBoYXJkIGNvZGVkIG1ldHJpY3MgYXNzdW1lIHRo
YXQgbGVnYWN5IGV2ZW50cyB3aWxsCmJlIHVzZWQuIFJhdGhlciB0aGFuIG1ha2UgdGhlIGhhcmQg
Y29kZWQgbWV0cmljcyBtYXRjaCBzeXNmcy9qc29uIEkKdGhpbmsgaXQgaXMgYmV0dGVyIHRvIHJl
bW92ZSB0aGUgaGFyZCBjb2RlZCBtZXRyaWNzLiBUaGlzIGlzIGJlY2F1c2UKdGhlIGhhcmQgY29k
ZWQgbWV0cmljcyBsYWNrIGNoZWNrcyBvbiB0aGluZ3MgbGlrZSBncm91cGluZyB0aGF0IHJhdGhl
cgp0aGFuIGZpeCBzaG91bGQgYmUgdHJhbnNpdGlvbmVkIHRvIGpzb24gbWV0cmljcy4gTXkgcHJl
ZmVyZW5jZSBmb3IgdGhlCmpzb24gbWV0cmljcyBpcyB0byBnZW5lcmF0ZSB0aGVtIHVzaW5nIHRo
ZSBweXRob24gZ2VuZXJhdGlvbiBzY3JpcHRzCnRoYXQgYXJlIG91dCBmb3IgcmV2aWV3LgoKVGhh
bmtzLApJYW4KCj4gSWFuIFJvZ2VycyAoOSk6Cj4gICBwZXJmIHBhcnNlLWV2ZW50czogRmFjdG9y
IG91dCAnPGV2ZW50X29yX3BtdT4vLi4uLycgcGFyc2luZwo+ICAgcGVyZiBwYXJzZS1ldmVudHM6
IERpcmVjdGx5IHBhc3MgUE1VIHRvIHBhcnNlX2V2ZW50c19hZGRfcG11Cj4gICBwZXJmIHBhcnNl
LWV2ZW50czogQXZvaWQgY29weWluZyBhbiBlbXB0eSBsaXN0Cj4gICBwZXJmIHBtdTogUmVmYWN0
b3IgcGVyZl9wbXVfX21hdGNoCj4gICBwZXJmIHRlc3RzIHBhcnNlLWV2ZW50czogVXNlIGJyYW5j
aGVzIHJhdGhlciB0aGFuIGNhY2hlLXJlZmVyZW5jZXMKPiAgIHBlcmYgcGFyc2UtZXZlbnRzOiBM
ZWdhY3kgY2FjaGUgbmFtZXMgb24gYWxsIFBNVXMgYW5kIGxvd2VyIHByaW9yaXR5Cj4gICBwZXJm
IHBhcnNlLWV2ZW50czogSGFuZGxlIFBFX1RFUk1fSFcgaW4gbmFtZV9vcl9yYXcKPiAgIHBlcmYg
cGFyc2UtZXZlbnRzOiBDb25zdGlmeSBwYXJzZV9ldmVudHNfYWRkX251bWVyaWMKPiAgIHBlcmYg
cGFyc2UtZXZlbnRzOiBQcmVmZXIgc3lzZnMvanNvbiBoYXJkd2FyZSBldmVudHMgb3ZlciBsZWdh
Y3kKPgo+ICB0b29scy9wZXJmL3Rlc3RzL3BhcnNlLWV2ZW50cy5jIHwgICA2ICstCj4gIHRvb2xz
L3BlcmYvdXRpbC9wYXJzZS1ldmVudHMuYyAgfCAyMDEgKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0KPiAgdG9vbHMvcGVyZi91dGlsL3BhcnNlLWV2ZW50cy5oICB8ICAxNiArLS0KPiAg
dG9vbHMvcGVyZi91dGlsL3BhcnNlLWV2ZW50cy5sICB8ICA3NiArKysrKystLS0tLS0KPiAgdG9v
bHMvcGVyZi91dGlsL3BhcnNlLWV2ZW50cy55ICB8IDE2NiArKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQo+ICB0b29scy9wZXJmL3V0aWwvcG11LmMgICAgICAgICAgIHwgIDI3ICsrKy0tCj4gIHRv
b2xzL3BlcmYvdXRpbC9wbXUuaCAgICAgICAgICAgfCAgIDIgKy0KPiAgNyBmaWxlcyBjaGFuZ2Vk
LCAyNjIgaW5zZXJ0aW9ucygrKSwgMjMyIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQ0LjAuNjgz
Lmc3OTYxYzgzOGFjLWdvb2cKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
