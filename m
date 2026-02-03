Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2558E8B37E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 23:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvUiB22y/5185xydM8U+VOBhX5C5xYhJnXaazqCOVcA=; b=nuSU65stvPVe0S
	DmhJpaq9XzxMyr5jf8GWYNDOuzRqS4fUK4YkEfBaqvzV8QlJieR41x4Jl9OhVepZZ8Xw4/X0xrDOv
	nxLNx6JWVm7X/5wSbJC1BwDKbkNcxGlVsg4+IiCm/RIAb5yJoI+bJ5wJwRYDw7KbejNmtajtNSQgP
	jU4+thhATICczlgoI3P2ZzM6ntgq/q079Rb8VcDrWTC66zTZ/aUkuW30k8Kw5U+243jWzcp5nZAYq
	KsTQX1qh3g45aFkQok3y4XMkobrase9qsNj6aj6DATK0x2KA7DH2TQUzvxK1D5ZCO7wCnVVGYS4QJ
	KlR56aVHqxYMINsoTBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPTu-00000007Wna-2NVZ;
	Tue, 03 Feb 2026 23:06:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPTq-00000007Wmp-3eZj
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 23:06:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a76b39587aso13945ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 15:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770160005; cv=none;
        d=google.com; s=arc-20240605;
        b=fnVAO0WWVhxrslkNFKYx1kyvyO36lmOlZkC70bpEInDt3AKxH46O/QdbmzaUPlI4BM
         lvMoOzuetV19DCvMT0t3MOs6/WoCrDOY2GaURKD6SX7QQkLB2UWmZHKxmRJrLNqKXf63
         ZW0vwQ5KWQtbco4f5d6+uzvH838+trrdUT2dYLgkqUCWwWHKOdLOJwKU7YMOYeDjjWfM
         5lcu/qsly1OhnZREf+zFeo7RQ4XKuIkUDF5bwkaZy3+q6/3x4pdsh8pn0bJ0an8BrEBd
         X7jF+RALDf71RFK5BzU/1C96yx+8kXWoWJ5He7L1l+QvqVJkfKPH2c/D6jXPxhJ1qIfh
         SQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        fh=ZnpFh7QIenTCf2KW7ivtPCVmM207rtbp7XCHn8h7VPE=;
        b=T1kAWmikCCQ68VbQO2rIgUgBnK7CTPKK1/pAAGhLm51npb71+93+JXqZMpMyOii3T4
         y+ills0PP9qEnsonWLE5Q3+za1fSQrmX7TQp0MV3gH32PwzYg/mqwjK/SKRwodKQiMHv
         9klAtfaxXzzVt1vi/fALYMEWYarqMNutdX6wgR0Hw485blS2skxXbaoueNrKGJVqHIFh
         ThN1lehA/e4oaVXNKaX3ceyn7l7G8A1uuE3PF+nNCIITBqgTSMmlxl7/xSsoUEAmniKk
         In2OWDYYt+6BFKNgfo4zj0BeUfumfBMwDbYlp/ARY/BZ8B70AKrJZspNg+ICIwx2/K/n
         I84A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770160005; x=1770764805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        b=JGf3T+jUBam5nCmkS3GKWVYHn4UQTmYHqyRmc4oCUCPy6vIE26fBeqMsWaAmerBuL1
         itqwbArzu91Qj1LJXEp/j4xuiGOEMgH6WnRcE2S5vbHCuBwix1ctbRS0x/DhaS2w/WM0
         isT0kfcpiUA0F5vCZt3LN/iD1u92QT7ygqnibw9v6AMuSi2iEN9e1G4cbCOyzVGJmgnd
         AbqfNERNZqkDqPPdgrxFPzLuckhojY0jXvs+MrOnLVA9qVNRf2Dv0WOujZeq4yS6Zje8
         cQ/391VpV2CmIJG79zVnBFROhAJrUFGOLfrLf8Ly5fZnout2N9Kh0TJbLuGA3DreaQHY
         pehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160005; x=1770764805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        b=D7TPK3/WRywIMrIr2u71bIz2gF/zb/QBbhh1StL69FaNAXqHcpY+prcfpr4OPqyNDh
         ITtaerpMUlQW0mYRrE28qCr4cLXCuv0vSRSTQhEQplsqLxkQKrEstSrqGVjubH1e+R2V
         YuemeR2hLY2nOaR5d9dhXfb62GiY5H2z0jKS7popkBGYd2km1QTgaxhTvpCIsy9C0HRB
         r1fc/vVXebpsj/T4fxg4nmpKTaw9DC9sywX8cu4RNdHS1gRSlV/V2BZGqv9l0h6eOl/S
         m/dywqDwzYHq9D0OWO0rIY5BKkuWB8Qs6EVQuuh48bkzKQCh/WwBO1XNbshxKgNvqbr4
         mhVw==
X-Forwarded-Encrypted: i=1; AJvYcCUravjCN0/wazEjEIgxGflmH/n4AQPaxldcE2JUSp6GJ8vWt3q2qasVnSbfvt+U7KkkSOJ+4bIzjuL3+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcTNcLtgmuT15cP1M9a+keB5NmV5jWp/AfeAtcHwKy9BI9fcm9
	Nhjff5vJIkh9nmpDE2xPfY2THHu7qwy166Kid2nR8MweIiOZO2f/iihK1gCQtskLN/3Z+DuYuDQ
	bEou9xgUiav9fFXYOPwl77D/ZxkZYi42BSytCBPfD
X-Gm-Gg: AZuq6aILkhM+a+/Jx/PmZy8dl+GLbPaKEgMECBWfzMN6l9bQLBU59qR3iPdxlbOnX1M
	2Owq3LlSlOkNKp7KceDzhZ+jU8Uro/6EyIkthxZQ1H+dQ4rs5t0Qg3Yr3zt70W7d6ng0ojK93P1
	eteHaavhIt+8tStTZHwCBgfTfK2yBafI/e4Ztvk4CM0Q7oE4RCBImZgnnwBgejfBBTkPKDMWszT
	leAOZEb0VxTAE5rPVtLZcW0C6hD3/vpRt6n9R8148lL/9l5pAiboHj3lATZccMrjHCvdJxnjnHT
	9YqY7Sbjedx8cZj1iSKDBSs1Yw==
X-Received: by 2002:a17:902:e543:b0:2a7:7f07:340e with SMTP id
 d9443c01a7336-2a9344ae075mr1024005ad.4.1770160004714; Tue, 03 Feb 2026
 15:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com> <20260203024356.444942-2-dapeng1.mi@linux.intel.com>
In-Reply-To: <20260203024356.444942-2-dapeng1.mi@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Feb 2026 15:06:33 -0800
X-Gm-Features: AZwV_QgPh6Zuh81ytCB2QhBaLQojIu2yqs-k71pIg-mHSzTgbaREXv2IKP173Cc
Message-ID: <CAP-5=fU7V2KT6Ce+mk5YbyHggxvRfsoiSzZk4g0CYcNK4NGT2A@mail.gmail.com>
Subject: Re: [Patch v3 1/4] perf regs: Fix abort for "-I" or "--user-regs" options
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_150646_918450_C0AFAB63 
X-CRM114-Status: GOOD (  22.02  )
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

T24gTW9uLCBGZWIgMiwgMjAyNiBhdCA2OjQ34oCvUE0gRGFwZW5nIE1pIDxkYXBlbmcxLm1pQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGaXggYW4gaXNzdWUgd2hlcmUgdGhlIGBwZXJmYCB0
b29sIGFib3J0cyB1bmV4cGVjdGVkbHkgd2hlbiBydW5uaW5nIHRoZQo+IGZvbGxvd2luZyBjb21t
YW5kOgo+Cj4gYGBgCj4gcGVyZiByZWNvcmQgLWUgY3ljbGVzIC1JIC0tIHRydWUKPgo+ICBVc2Fn
ZTogcGVyZiByZWNvcmQgWzxvcHRpb25zPl0gWzxjb21tYW5kPl0KPiAgICAgb3I6IHBlcmYgcmVj
b3JkIFs8b3B0aW9ucz5dIC0tIDxjb21tYW5kPiBbPG9wdGlvbnM+XQo+Cj4gICAgIC1JLCAtLWlu
dHItcmVnc1s9PGFueSByZWdpc3Rlcj5dCj4gICAgIHNhbXBsZSBzZWxlY3RlZCBtYWNoaW5lIHJl
Z2lzdGVycyBvbiBpbnRlcnJ1cHQsIHVzZSAnLUk/JyB0byBsaXN0IHJlZ2lzdGVyIG5hbWVzCj4g
YGBgCj4KPiBUaGUgdXNhZ2Ugb2YgdGhlIGAtSWAgb3IgYC0tdXNlci1yZWdzYCBvcHRpb25zIHdp
dGhvdXQgc3BlY2lmeWluZyBhbnkKPiByZWdpc3RlcnMgc2hvdWxkIGRlZmF1bHQgdG8gc2FtcGxp
bmcgYWxsIGdlbmVyYWwtcHVycG9zZSByZWdpc3RlcnMuCj4gSG93ZXZlciwgdGhpcyBjdXJyZW50
bHkgY2F1c2VzIGFuIGFibm9ybWFsIHRlcm1pbmF0aW9uLgo+Cj4gVGhlIGlzc3VlIHdhcyBpbnRy
b2R1Y2VkIGJ5IGNvbW1pdCAzZDA2ZGI5YmFkMWEgKCJwZXJmIHJlZ3M6IFJlZmFjdG9yCj4gIHVz
ZSBvZiBhcmNoX19zYW1wbGVfcmVnX21hc2tzKCkgdG8gcGVyZl9yZWdfbmFtZSgpIikuIFRoaXMg
cGF0Y2gKPiByZXNvbHZlcyB0aGUgcHJvYmxlbSwgZW5zdXJpbmcgdGhhdCB0aGUgYC1JYCBvciBg
LS11c2VyLXJlZ3NgIG9wdGlvbnMKPiB3b3JrIGFzIGludGVuZGVkIHdpdGhvdXQgY2F1c2luZyBh
biBhYm9ydC4KPgo+IEZpeGVzOiAzZDA2ZGI5YmFkMWEgKCJwZXJmIHJlZ3M6IFJlZmFjdG9yIHVz
ZSBvZiBhcmNoX19zYW1wbGVfcmVnX21hc2tzKCkgdG8gcGVyZl9yZWdfbmFtZSgpIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXBlbmcgTWkgPGRhcGVuZzEubWlAbGludXguaW50ZWwuY29tPgoKUmV2aWV3
ZWQtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KClRoYW5rcywKSWFuCgo+IC0t
LQo+ICB0b29scy9wZXJmL3V0aWwvcGFyc2UtcmVncy1vcHRpb25zLmMgfCAxMyArKysrKystLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL3BhcnNlLXJlZ3Mtb3B0aW9ucy5jIGIvdG9v
bHMvcGVyZi91dGlsL3BhcnNlLXJlZ3Mtb3B0aW9ucy5jCj4gaW5kZXggOGRkMzVmNTBmNjQ0Li5i
NDRiNDdkOTA1OWYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL3BhcnNlLXJlZ3Mtb3B0
aW9ucy5jCj4gKysrIGIvdG9vbHMvcGVyZi91dGlsL3BhcnNlLXJlZ3Mtb3B0aW9ucy5jCj4gQEAg
LTY2LDEyICs2NiwxNCBAQCBfX3BhcnNlX3JlZ3MoY29uc3Qgc3RydWN0IG9wdGlvbiAqb3B0LCBj
b25zdCBjaGFyICpzdHIsIGludCB1bnNldCwgYm9vbCBpbnRyKQo+ICAgICAgICAgaWYgKCptb2Rl
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4KPiAtICAgICAgIC8qIHN0ciBtYXkgYmUg
TlVMTCBpbiBjYXNlIG5vIGFyZyBpcyBwYXNzZWQgdG8gLUkgKi8KPiAtICAgICAgIGlmICghc3Ry
KQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4gLQo+ICAgICAgICAgbWFzayA9IGludHIg
PyBhcmNoX19pbnRyX3JlZ19tYXNrKCkgOiBhcmNoX191c2VyX3JlZ19tYXNrKCk7Cj4KPiArICAg
ICAgIC8qIHN0ciBtYXkgYmUgTlVMTCBpbiBjYXNlIG5vIGFyZyBpcyBwYXNzZWQgdG8gLUkgKi8K
PiArICAgICAgIGlmICghc3RyKSB7Cj4gKyAgICAgICAgICAgICAgICptb2RlID0gbWFzazsKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgLyogYmVj
YXVzZSBzdHIgaXMgcmVhZC1vbmx5ICovCj4gICAgICAgICBzID0gb3MgPSBzdHJkdXAoc3RyKTsK
PiAgICAgICAgIGlmICghcykKPiBAQCAtMTA0LDkgKzEwNiw2IEBAIF9fcGFyc2VfcmVncyhjb25z
dCBzdHJ1Y3Qgb3B0aW9uICpvcHQsIGNvbnN0IGNoYXIgKnN0ciwgaW50IHVuc2V0LCBib29sIGlu
dHIpCj4gICAgICAgICB9Cj4gICAgICAgICByZXQgPSAwOwo+Cj4gLSAgICAgICAvKiBkZWZhdWx0
IHRvIGFsbCBwb3NzaWJsZSByZWdzICovCj4gLSAgICAgICBpZiAoKm1vZGUgPT0gMCkKPiAtICAg
ICAgICAgICAgICAgKm1vZGUgPSBtYXNrOwo+ICBlcnJvcjoKPiAgICAgICAgIGZyZWUob3MpOwo+
ICAgICAgICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
