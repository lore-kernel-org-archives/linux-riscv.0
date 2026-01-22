Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAC8D3EE89
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBnnaMLf6yVuEmuHR/GTjUeF3YhLkpO1k6Fn/1Q34Zo=; b=ARos6NHqkY+zaI
	f9Sk5qpcY6B72LjvdQJN3Z4vsa4xJ6uEVTeJixu0k1qEMBSNrN8sTwP0ISOiUEPp9z8bGXZaviHhZ
	38rl/eiT5CrnkfQHMKr10Yi6rGyy0GPJvYXOvce7E1Iuni77UNjzdDn5VLGrYZP99AG/Vx0zMGrCj
	87GbO/7FhdNT0MElvOATgfqWHSvKPfB0bEkPa8eOH0AvJFNDmSmLvzcLUqsQ1QcjvmbCZpjdFnM5M
	mYnTW0E4n6xSjuicUIFVTo4b8JwHGKNbZhKqPJc8a9IAW0GRbhnjapTg6W52Uu4Qfv91C2MGSC0Y5
	08ap4UcaQ0lzq6MYdmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixCI-00000007Nwo-3pLs;
	Thu, 22 Jan 2026 16:06:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixCG-00000007Nw9-0pnN
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:06:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a35ae38bdfso77565ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 08:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769097971; cv=none;
        d=google.com; s=arc-20240605;
        b=FVYSmo02YVWEHxpleOgdvJxQLm5IZRTnkRp/g6aqW3/sdecZCCgqBHmKFcSxvph02A
         6g9N8uuYxq8mDShzEnWA866dLL4DDoM4cEADElww23bCd4KneO0KJbhTp1KZ55CNjQln
         351DiJfQ4oVvW2TwZr5aUTPU4vFGLBBAzx92Cqy9nWoTbyfNTIow8/ywJax1EsQcQqjX
         UAW9ELCTj7pR7uKEWeg99v+5nyavhdZuR5vZ+Bdegk/B0+iFe4F20Sg3f/ziYTIEc6XS
         ZrgK+wP0YRtFJAXS/pLw11Wb2dinazBXojVeqbLt7VvPS6FbdPdaw08RExEsEMlLzHyX
         um2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        fh=h0EjNyrKzFuq6ixaMqLhH7ixIOYANT+C4QjDpwRoFxU=;
        b=e8bW5MJrnZL+c5PASrRMoEYT/Cc16dNp0Z+/NVjFrsjPkprE8U1Zeld57wgNR2uZ74
         qepkli5DbzbOj9u0aNcfhv6wpQlLEoP3hrEXUvwHbklqpbfK5H8jzDdEDqOpao/64Ie2
         GKue/41/+2Y34bS+Su36a8zdpGIumKlGj68D8VyKO+O2v4Lq0ohhfTYzJ+R+TKA/Q+sK
         vOc1X/59r3tFzoUKkqA9YmVGXLh6gm+bP1sU//rrZnW8NvrhajmHhQTgA9fEzismmUTo
         UycDbMS4uYorfGrQYi/y5Fwc5xHCxP5Yqv1npH/FeomEVCeDogVK983+nmgdysapaUMO
         CnNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769097971; x=1769702771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        b=Bi7OMwADVfZA17I+/9oJyeMpKwNiAR0bPopJjm0pjY69UpyM89eEtvPA8BJGQkJJa0
         DJkpwjznYZuaARLz7BdgSlW4nnGzTL6xs+7SrD6QKzBI0Hx8sVYpgb7oue07ETRN/iYW
         tWKmCLsd/9If07X5ouPCrGBE0mbmefddfvBwRgNbPzjeYILFOBHiwhQNN5V3VWS2Pv/Y
         jAAJodRVTtEUuvKxeeoUEwHcDpw4bJSRimZ2lMD7g185DPZDEsoaAYIai67Vti9bUtUs
         nYIik7DN7xmpImotJUXwZRzMYrXqK4HYq0pniWlgevwzDnyL5pj3Iv9Dad0p990oCrRM
         9C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097971; x=1769702771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        b=FDkecCwAr7rxLerc2fSqdipHWLTeC/RyLTM09e/W5159mR8YxkZkT14G5NAUKxiFTB
         OFU0qzCo9EwJAbhqMBgnLFMNpfVdC8c6SkkDoM5WrIFVt+u+bKMhEhbYQlQ5EsnTkRYf
         tXo5TNacTafidYXYf7V8s913z/CTTCkEF50NNeIK8mwIrYbsPQ/p2r2cqNr4Xcv7qZPN
         yht1fyfHYfydYwZTzFeBb2af5aXBB7kSL417clAK9e0S9S+MWfKq1hs+Xs/Rr7n2duSL
         mMgXT6tZVqT0IZLbMi91Cj1XrrcOlTNUUgeXYO+y+yLE8gw56zpLaJ4sOqkRupgcW1Q1
         WCzg==
X-Forwarded-Encrypted: i=1; AJvYcCU01TQ053TsxNBLnUjstPUTiLT6BYHMYEvLUv8hKoJ9Z/zQPpo6vcJ2OLprKKsTurfnQDygsTszeVYyoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ7zc4bhFbhx0FLjHg7owSWu0b/H8R/FymgV30BX0hLiI292zp
	gD/JMoptdD9wVV1Yah5j5dg1nqcQ4HX5ju2mnFKk+UwWsuyjVNnEcQRGuCK++muGD1XUsOXqp1S
	JYXpXcYD+wYIfo2TNYJ8S4W47sLjASD41C9igYJ0s
X-Gm-Gg: AZuq6aKPnOUNrqmpsRDDdMHFGt3KpCNKkFBYiUwQhouML285pSpyuGkFra0oE33mjms
	N5Q4zJfMeNT8bHU8BoDyEebCYqLNJbJyTm0oPxebT08lktjXmOsu1bszNaVpBgzY8B7Ny1K32ra
	kHey/DoquhzyF+nrky9Epuv5PYNRgXcp56hHQ/X8ch4C3bQdR3NBbOf0d+zMAqNOXbxZUufTZfU
	vUOW3mH6ggcoqVrMvjjzStmAozltUe2jvxmM/8h9/ciGwTORz4uOoqPbcjZu2EpiRDj/iHmmDrO
	ijTV2wpJfUUYTIBl3pVdg7o6xw==
X-Received: by 2002:a17:903:2b06:b0:29f:2563:7772 with SMTP id
 d9443c01a7336-2a7d417846bmr3095405ad.8.1769097970607; Thu, 22 Jan 2026
 08:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com> <20260122073127.375139-3-irogers@google.com>
 <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
In-Reply-To: <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Jan 2026 08:05:58 -0800
X-Gm-Features: AZwV_QheLkTE1KRcO3TYQKQs82VaNUxHiDT9G3Jcm0FUvq93zpwYWIu1qRjGJAw
Message-ID: <CAP-5=fUg=Gna1=HyugczBijYE07SnFHOO9OPutYQa+s8QcXBmw@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] perf annotate: Fix args leak of map_symbol
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_080612_267464_E54E8746 
X-CRM114-Status: GOOD (  14.02  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMzo0N+KAr0FNIFN1Y2hpdCBLYXJ1bmFrYXJhbgo8c3Vj
aGl0a2FydW5ha2FyYW5AZ21haWwuY29tPiB3cm90ZToKPgo+ID4gQEAgLTExMTksNyArMTEyMSw3
IEBAIHN0YXRpYyBpbnQgc3ltYm9sX19wYXJzZV9vYmpkdW1wX2xpbmUoc3RydWN0IHN5bWJvbCAq
c3ltLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYW5u
b3RhdGVfYXJncyAqYXJncywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY2hhciAqcGFyc2VkX2xpbmUsIGludCAqbGluZV9uciwgY2hhciAqKmZpbGVsb2MpCj4gPiAg
ewo+ID4gLSAgICAgICBzdHJ1Y3QgbWFwICptYXAgPSBhcmdzLT5tcy5tYXA7Cj4gPiArICAgICAg
IHN0cnVjdCBtYXAgKm1hcCA9IGFyZ3MtPm1zLT5tYXA7Cj4gPiAgICAgICAgIHN0cnVjdCBhbm5v
dGF0aW9uICpub3RlcyA9IHN5bWJvbF9fYW5ub3RhdGlvbihzeW0pOwo+ID4gICAgICAgICBzdHJ1
Y3QgZGlzYXNtX2xpbmUgKmRsOwo+ID4gICAgICAgICBjaGFyICp0bXA7Cj4gPiBAQCAtMTE1MSw3
ICsxMTUzLDcgQEAgc3RhdGljIGludCBzeW1ib2xfX3BhcnNlX29iamR1bXBfbGluZShzdHJ1Y3Qg
c3ltYm9sICpzeW0sCj4gPiAgICAgICAgIGFyZ3MtPmxpbmUgICAgPSBwYXJzZWRfbGluZTsKPiA+
ICAgICAgICAgYXJncy0+bGluZV9uciA9ICpsaW5lX25yOwo+ID4gICAgICAgICBhcmdzLT5maWxl
bG9jID0gKmZpbGVsb2M7Cj4gPiAtICAgICAgIGFyZ3MtPm1zLnN5bSAgPSBzeW07Cj4gPiArICAg
ICAgIGFyZ3MtPm1zLT5zeW0gID0gc3ltOwo+ID4KPiA+ICAgICAgICAgZGwgPSBkaXNhc21fbGlu
ZV9fbmV3KGFyZ3MpOwo+ID4gICAgICAgICAoKmxpbmVfbnIpKys7Cj4gPiBAQCAtMTE3Miw3ICsx
MTc0LDcgQEAgc3RhdGljIGludCBzeW1ib2xfX3BhcnNlX29iamR1bXBfbGluZShzdHJ1Y3Qgc3lt
Ym9sICpzeW0sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAubXMgPSB7IC5tYXAgPSBtYXAs
IH0sCj4gPiAgICAgICAgICAgICAgICAgfTsKPiA+Cj4gPiAtICAgICAgICAgICAgICAgaWYgKCFt
YXBzX19maW5kX2FtcyhhcmdzLT5tcy5tYXBzLCAmdGFyZ2V0KSAmJgo+ID4gKyAgICAgICAgICAg
ICAgIGlmICghbWFwc19fZmluZF9hbXMoYXJncy0+bXMtPm1hcHMsICZ0YXJnZXQpICYmCj4gPiAg
ICAgICAgICAgICAgICAgICAgIHRhcmdldC5tcy5zeW0tPnN0YXJ0ID09IHRhcmdldC5hbF9hZGRy
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZGwtPm9wcy50YXJnZXQuc3ltID0gdGFyZ2V0
Lm1zLnN5bTsKPiA+ICAgICAgICAgfQo+Cj4gSGksIGEgbm9vYiBoZXJlIHNvIHBsZWFzZSBjb3Jy
ZWN0IG1lIGlmIEknbSB3cm9uZy4KPiBMb29raW5nIGF0IHN5bWJvbF9fcGFyc2Vfb2JqZHVtcF9s
aW5lKCksIHNob3VsZG4ndCB3ZSBiZSBjYWxsaW5nCj4gbWFwX19nZXQoKSB3aGVuIGluaXRpYWxp
emluZyB0aGUgdGFyZ2V0IHN0cnVjdD8gU2luY2UgbWFwc19fZmluZF9hbXMoKQo+IG5vdyBjYWxs
cyBtYXBfX3B1dCgpIChhZnRlciBwYXRjaCAxKS4KPiBzdHJ1Y3QgYWRkcl9tYXBfc3ltYm9sIHRh
cmdldCA9IHsKPiAgICAgLmFkZHIgPSBkbC0+b3BzLnRhcmdldC5hZGRyLAo+ICAgICAubXMgPSB7
IC5tYXAgPSBtYXBfX2dldChtYXApLCB9LAo+IH07Cj4gVGhpcyB3b3VsZCBtYXRjaCB0aGUgcGF0
dGVybiB1c2VkIGluIGNhbGxfX3BhcnNlKCkgYW5kIGp1bXBfX3BhcnNlKCkKPiB0aGF0IHdlcmUg
Zml4ZWQgaW4gcGF0Y2ggMi4KCkFncmVlZCB0aGlzIGlzIGFub3RoZXIgcHJvYmxlbS4gSSdsbCBh
ZGQgdGhlIG1pc3NpbmcgcHV0IGFuZAphZGRyX21hcF9zeW1ib2xfX2V4aXQgbWlzc2luZyBoZXJl
LgoKVGhhbmtzLApJYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
