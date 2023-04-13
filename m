Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48149C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7/xSTZpdAU7OOG8DeSmqUDxBlMmEKH5vZWA1zv8ipU=; b=Mgqm/DCRYDVXK0
	zKOiVcNsE1uZkPgGAt3hkd144laoOyhaEYqSJAJCwFryYqAXnucCX7mgRLb8A0QbpiiCpTnSa8aht
	QrBPB6udAhBb87KaDYIkMksInkT0rnY76pK33Wb0Ec7A+ayjuylkf4A8YMiI7DrIAVn937nAPJDk2
	u7TEWyNupndwbsYj2uFOOTc6Id+7+aVYOtlgS7di6huGd9nJmxE4qYzHNeq5eKMO6DjOtYzFWBuXG
	Uu4OKOM2PlaaJgPegZpnQgk8QGqF9OfhfQCxGEDxDv6+RcqDasseY+ER20zno5eUH66kUNeIv5LDj
	vbYHkHH1pzPTKYArWzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn2SV-006zN2-2a;
	Thu, 13 Apr 2023 19:18:15 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn2SS-006zLM-2J
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 19:18:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-514156b4976so1240191a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1681413487; x=1684005487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8W8ucWRVnyg0FZIx99vKIcNt/oJO/XN1VRJ9eKQAS0=;
        b=ZxYcvj4mgxHEh2k4eyG7rDgq81XaIFxIPZwF1CNwFKsnRNpSJZw+7kJwHzSw5Rerxg
         CssT5oqe+UjzgcEwZvXxNyKQn0/GZ4F58sSMiEoWUuegeBhMohMF3Un9Q7ojGWs+cDtR
         w822ZznJii3RTd7ULjAmuDpwhubxc1//sSz5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681413487; x=1684005487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8W8ucWRVnyg0FZIx99vKIcNt/oJO/XN1VRJ9eKQAS0=;
        b=l/AZR58JYW/Jn/YaoSsXGkCRkG/dkXOMFc7q87sfpSGvMF8McPhLC18YRqWTTwfdlf
         CtNa/QhfrdIx6DCWfo7E0S3q3o5uPULahvk71wF5fFQGoeB007r5GcUCfwqpUv/TpGrv
         uNG42OzrY0Zg7AuNrXLJP61CcY9eqIq6B7UtOJ133GpBFgiTg0PK9GZKqB6Z/fgjxgNi
         N79SsR7xEcB7jhQoVcU4P5j0xa/QsOlp6OM0c2BrLZ4jdOTfSCJ9RQHl71OGKuoODWpx
         6xtS02a4frFFoMYim1b/lEuBpl7EtYFDdobBp/wUeCbu5ejixr+O8nDyDR6hgLf3uM6r
         KOdQ==
X-Gm-Message-State: AAQBX9eGv0xz/BszSVlqeozvU6IPkaUnfOE9Acm5H+QkkxzTrq1c6Mbn
	tX+ld1725TbBXUWdrNcGLc5ARTaJPAqbFsvXXA+P
X-Google-Smtp-Source: AKy350bfGkRro00QQY4rqb+45vxFoI70kxyGbgpxd+11xoM2ikmW0Dhiadp9GZxwnHzh96oxN11shsrGP1raJr0DPsM=
X-Received: by 2002:a05:6a00:140b:b0:63b:1a20:5ea2 with SMTP id
 l11-20020a056a00140b00b0063b1a205ea2mr1782885pfu.1.1681413486955; Thu, 13 Apr
 2023 12:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Apr 2023 00:47:55 +0530
Message-ID: <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_121812_755365_050FB001 
X-CRM114-Status: GOOD (  17.18  )
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

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgOTo0N+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiByaXNjdiB1c2VkIHRvIGFsbG93IGRpcmVjdCBh
Y2Nlc3MgdG8gY3ljbGUvdGltZS9pbnN0cmV0IGNvdW50ZXJzLAo+IGJ5cGFzc2luZyB0aGUgcGVy
ZiBmcmFtZXdvcmssIHRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBhbGxvdyB0aGUgdXNlciB0bwo+
IG1tYXAgYW55IGNvdW50ZXIgd2hlbiBhY2Nlc3NlZCB0aHJvdWdoIHBlcmYuIEJ1dCB3ZSBjYW4n
dCBicmVhayB0aGUKPiBleGlzdGluZyBiZWhhdmlvdXIgc28gd2UgaW50cm9kdWNlIGEgc3lzY3Rs
IHBlcmZfdXNlcl9hY2Nlc3MgbGlrZSBhcm02NAo+IGRvZXMsIHdoaWNoIGRlZmF1bHRzIHRvIHRo
ZSBsZWdhY3kgbW9kZSBkZXNjcmliZWQgYWJvdmUuCj4KCkl0IHdvdWxkIGJlIGdvb2QgcHJvdmlk
ZSBhZGRpdGlvbmFsIGRpcmVjdGlvbiBmb3IgdXNlciBzcGFjZSBwYWNrYWdlczoKClRoZSBsZWdh
Y3kgYmVoYXZpb3IgaXMgc3VwcG9ydGVkIGZvciBub3cgaW4gb3JkZXIgdG8gYXZvaWQgYnJlYWtp
bmcKZXhpc3Rpbmcgc29mdHdhcmUuCkhvd2V2ZXIsIHJlYWRpbmcgY291bnRlcnMgZGlyZWN0bHkg
d2l0aG91dCBwZXJmIGludGVyYWN0aW9uIG1heQpwcm92aWRlIGluY29ycmVjdCB2YWx1ZXMgd2hp
Y2gKdGhlIHVzZXJzcGFjZSBzb2Z0d2FyZSBtdXN0IGF2b2lkLiBXZSBhcmUgaG9waW5nIHRoYXQg
dGhlIHVzZXIgc3BhY2UKcGFja2FnZXMgd2hpY2gKcmVhZCB0aGUgY3ljbGUvaW5zdHJldCBkaXJl
Y3RseSwgd2lsbCBtb3ZlIHRvIHRoZSBwcm9wZXIgaW50ZXJmYWNlCmV2ZW50dWFsbHkgaWYgdGhl
eSBhY3R1YWxseSBuZWVkIGl0LgpNb3N0IG9mIHRoZSB1c2VycyBhcmUgc3VwcG9zZWQgdG8gcmVh
ZCAidGltZSIgaW5zdGVhZCBvZiAiY3ljbGUiIGlmCnRoZXkgaW50ZW5kIHRvIHJlYWQgdGltZXN0
YW1wcy4KClRoZSBsZWdhY3kgc3lzY3RsIG9wdGlvbiB3aWxsIGJlIHJlbW92ZWQgaW4gdGhlIGZ1
dHVyZS4gVGhlIHBsYW4gaXMKdGhhdCB0aGUgZGlzdHJvcyB3aWxsCnNldCB0aGUgZGVmYXVsdCBv
cHRpb24gdG8gU1lTQ1RMX1VTRVJfQUNDRVNTIHdoaWNoIGVuYWJsZXMgdXNlcgpjb3VudGVycyBv
bmx5IHRocm91Z2ggcGVyZgpzb29uZXIgKGFzIHNvb24gYXMgdGhleSBtYWtlIHN1cmUgdGhlIHBh
Y2thZ2VzIGJ1aWx0IGZvciB0aGF0IGRpc3Rybwpkb24ndCByZWFkIGN5Y2xlL2luc3RyZXQpIGRp
cmVjdGx5LgoKPiBUaGUgY29yZSBvZiB0aGlzIHBhdGNoc2V0IGxpZXMgaW4gcGF0Y2ggNCwgdGhl
IGZpcnN0IDMgcGF0Y2hlcyBhcmUKPiBzaW1wbGUgZml4ZXMuCj4KPiBiYXNlLWNvbW1pdC10YWc6
IHY2LjMtcmMxCj4KPiBBbGV4YW5kcmUgR2hpdGkgKDQpOgo+ICAgcGVyZjogRml4IHdyb25nIGNv
bW1lbnQgYWJvdXQgZGVmYXVsdCBldmVudF9pZHgKPiAgIGluY2x1ZGU6IHJpc2N2OiBGaXggd3Jv
bmcgaW5jbHVkZSBndWFyZCBpbiByaXNjdl9wbXUuaAo+ICAgcmlzY3Y6IE1ha2UgbGVnYWN5IGNv
dW50ZXIgZW51bSBtYXRjaCB0aGUgSFcgbnVtYmVyaW5nCj4gICByaXNjdjogRW5hYmxlIHBlcmYg
Y291bnRlcnMgdXNlciBhY2Nlc3Mgb25seSB0aHJvdWdoIHBlcmYKPgo+ICBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IHwgIDIzICsrKy0KPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZXJmX2V2ZW50LmggICAgICAgICB8ICAgMyArCj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvcGVyZl9ldmVudC5jICAgICAgICAgICAgICB8ICA2NSArKysrKysrKysrKwo+ICBkcml2ZXJz
L3BlcmYvcmlzY3ZfcG11LmMgICAgICAgICAgICAgICAgICAgIHwgIDQyICsrKysrKysrCj4gIGRy
aXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgICAgICAgICAgICAgfCAgMjQgKysrKy0KPiAg
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgICAgICAgICAgICAgICB8IDExMyArKysrKysr
KysrKysrKysrKystLQo+ICBpbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmggICAgICAgICAg
ICAgIHwgICA5ICstCj4gIGluY2x1ZGUvbGludXgvcGVyZl9ldmVudC5oICAgICAgICAgICAgICAg
ICAgfCAgIDMgKy0KPiAgdG9vbHMvbGliL3BlcmYvbW1hcC5jICAgICAgICAgICAgICAgICAgICAg
ICB8ICA2NSArKysrKysrKysrKwo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAzMzIgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5l
bC9wZXJmX2V2ZW50LmMKPgo+IC0tCj4gMi4zNy4yCj4KCgotLSAKUmVnYXJkcywKQXRpc2gKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
