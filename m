Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D65C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1TOVDHSPeLupUKlS7EvXDk9Vvo5QldZ0wW3FJmC7Lk=; b=oAU5Vtt+y60ULP
	WT5V273i89anEZJR8b8sXCH0hc8RSsPzgk6CwZu3RbGmO7gRTI/gl4StqChbZGvaJFEiYxZwix+TY
	/FfjQ8zOf8unbbU9nKv3I6d2QL9nt3aq/GWXv/YMjiH/xZX7pIJ5R243FTphwqFBz6mtKHSArcdc9
	Ug2o3kNJPkhZJ+vOr3PJOFurfRXsArfUXr5VZcOnQfrS9doYJ1WgD5V1u5xDr8qz9HMv6e5x/JsLn
	DDI0Nd+W1wFoAxXzSxrdFZSJmx7subGk5vZZS8tIFOXpgEMe25+UxUVp6xiLDfRQJB/bYZQLR+uEx
	WS1dawF5O1ynpFlMVhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qycN2-00A4wh-2K;
	Thu, 02 Nov 2023 18:24:44 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qycMz-00A4vp-0O
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 18:24:42 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so1764a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 11:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698949478; x=1699554278; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGrFkmhMC1oEo20BN+P9RczALkt6AOOD+e7AfvLCPzc=;
        b=2SbGdlKJsFQzM42BNB7xZerRZ94OqZRdMwLGnrArxXKUSENuG7W9bM2Bv80YMiO67L
         o7V4ELHRXYFjj1QaHvmxOQeYgcfVbqOV7XlIM2S/tw0kLwubSKCCzqvTWxvDujOv27bS
         B39+FPGwPLJf49zMKS8ZVbj+rIU9sX9NHepEQGyN55UqAtX2KJF9upy5qxt2mmQADgyQ
         28fJZSpkN+RkCn2FGu6MZWK2cjElqCblzTM/IoiahEAJejfHo/1JnmZhhnwVFKkh5nuf
         7/kb5+6gJbUw1aUpJpa+IsblJxNKWZ4T1n00yg0f3vWzzMQK8mbhWTPuD8dwIh55omFD
         CWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698949478; x=1699554278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGrFkmhMC1oEo20BN+P9RczALkt6AOOD+e7AfvLCPzc=;
        b=Zb1D9OHYRRZ4lHVdVJtoaAK/qT/mYC6chqKEUC2gqkcw543waPgVUwCCbBbVjPOeGq
         dV3Rl01PsNWaiVyu99g9a9B3ZLPHxmPHvvGM3qgvCI7KX0sjHzQfZpblaNtnx4XBmgiw
         rQQoA8FpLMbKeQBseAVJ5HG2pQy7i0gj7eIlY3kavsht6cjeISoBlp5hUX04Zx0hENtx
         GnqadPd1HfYcks5Xmhu87GmEjL5JRSXQlhAsSAPSMHrZCcH953Gml+phmvQ4p9fgiG+o
         0ZrZXLAQdJqvGT95+PXGBl9G+WrLq5UQoyOeshALm829mp3dbvOZE0CEZ/TI4+6/GL4R
         GioA==
X-Gm-Message-State: AOJu0Yzv3hZeOud4BP+ej1Shoq1nkGCuQDYGAaXcw6U8kNq/bDQnXPqu
	CN0JZcp1W4vbDZ9llzZ+W5pL8YfUxRQvRnnLNljjgw==
X-Google-Smtp-Source: AGHT+IEKx/oi2mHPllRTvhZgICUybvLALbVxPiHdX6jP8Fk42YYckF246DXO1aG6m3T9FlE22dHuiU117WNQri5yrHM=
X-Received: by 2002:a05:6402:3228:b0:543:fbf7:c70e with SMTP id
 g40-20020a056402322800b00543fbf7c70emr104719eda.5.1698949477935; Thu, 02 Nov
 2023 11:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231102015447.2526572-1-jisheng.teoh@starfivetech.com>
In-Reply-To: <20231102015447.2526572-1-jisheng.teoh@starfivetech.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 2 Nov 2023 11:24:24 -0700
Message-ID: <CAP-5=fW6Qeu8Q_mQ7zUBsHn+BiMmDJvjn0nT1YAZaLH6EaBjnA@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events riscv: add StarFive Dubhe-80 JSON file
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Beeman Strong <beeman@rivosinc.com>, linux-riscv@lists.infradead.org, n.shubin@yadro.com, 
	kconsul@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_112441_203988_75E36AB9 
X-CRM114-Status: GOOD (  12.68  )
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

T24gV2VkLCBOb3YgMSwgMjAyMyBhdCA2OjU14oCvUE0gSmkgU2hlbmcgVGVvaAo8amlzaGVuZy50
ZW9oQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gU3RhckZpdmUncyBEdWJoZS04MCBzdXBw
b3J0cyByYXcgZXZlbnQgaWQgMHgwMCAtIDB4MjIuCj4gVGhlIHJhdyBldmVudHMgYXJlIGVuYWJs
ZWQgdGhyb3VnaCBQTVUgbm9kZSBvZiBEVCBiaW5kaW5nLgo+Cj4gRXhhbXBsZSBvZiBQTVUgRFQg
bm9kZToKPiBwbXUgewo+ICAgICAgICAgY29tcGF0aWJsZSA9ICJyaXNjdixwbXUiOwo+ICAgICAg
ICAgcmlzY3YscmF3LWV2ZW50LXRvLW1ocG1jb3VudGVycyA9Cj4gICAgICAgICAgICAgICAgIC8q
IEV2ZW50IElEIDEtMzEgKi8KPiAgICAgICAgICAgICAgICAgPDB4MDAgMHgwMCAweEZGRkZGRkZG
IDB4RkZGRkZGRTAgMHgwMDAwN0ZGOD4sCj4gICAgICAgICAgICAgICAgIC8qIEV2ZW50IElEIDMy
LTMzICovCj4gICAgICAgICAgICAgICAgIDwweDAwIDB4MjAgMHhGRkZGRkZGRiAweEZGRkZGRkZF
IDB4MDAwMDdGRjg+LAo+ICAgICAgICAgICAgICAgICAvKiBFdmVudCBJRCAzNCAqLwo+ICAgICAg
ICAgICAgICAgICA8MHgwMCAweDIyIDB4RkZGRkZGRkYgMHhGRkZGRkYyMiAweDAwMDA3RkY4PjsK
PiB9Owo+Cj4gRXhhbXBsZSBvZiBQZXJmIHN0YXQgb3V0cHV0Ogo+IFtyb290QHVzZXJdIyBwZXJm
IHN0YXQgLWEgXAo+ICAgICAgICAgLWUgYWNjZXNzX21tdV9zdGxiIFwKPiAgICAgICAgIC1lIG1p
c3NfbW11X3N0bGIgXAo+ICAgICAgICAgLWUgYWNjZXNzX21tdV9wdGVfYyBcCj4gICAgICAgICAt
ZSByb2JfZmx1c2ggXAo+ICAgICAgICAgLWUgYnRiX3ByZWRpY3Rpb25fbWlzcyBcCj4gICAgICAg
ICAtZSBpdGxiX21pc3MgXAo+ICAgICAgICAgLWUgc3luY19kZWxfZmV0Y2hfZyBcCj4gICAgICAg
ICAtZSBpY2FjaGVfbWlzcyBcCj4gICAgICAgICAtZSBicHVfYnJfcmV0aXJlIFwKPiAgICAgICAg
IC1lIGJwdV9icl9taXNzIFwKPiAgICAgICAgIC1lIHJldF9pbnNfcmV0aXJlIFwKPiAgICAgICAg
IC1lIHJldF9pbnNfbWlzcyBcCj4gICAgICAgICAtLSBvcGVuc3NsIHNwZWVkIHJzYTIwNDgKPgo+
IERvaW5nIDIwNDggYml0cyBwcml2YXRlIHJzYSdzIGZvciAxMHM6IDM5IDIwNDggYml0cyBwcml2
YXRlIFJTQSdzIGluCj4gMTAuMTRzCj4gRG9pbmcgMjA0OCBiaXRzIHB1YmxpYyByc2EncyBmb3Ig
MTBzOiAxNTYzIDIwNDggYml0cyBwdWJsaWMgUlNBJ3MgaW4KPiAxMC4wMHMKPiB2ZXJzaW9uOiAz
LjAuMTEKPiBidWlsdCBvbjogVHVlIFNlcCAxOSAxMzowMjozMSAyMDIzIFVUQwo+IG9wdGlvbnM6
IGJuKDY0LDY0KQo+IENQVUlORk86IE4vQQo+ICAgICAgICAgICAgICAgICAgIHNpZ24gICAgdmVy
aWZ5ICAgIHNpZ24vcyB2ZXJpZnkvcwo+IHJzYSAyMDQ4IGJpdHMgMC4yNjAwMDBzIDAuMDA2Mzk4
cyAgICAgIDMuOCAgICAxNTYuMwo+Cj4gIFBlcmZvcm1hbmNlIGNvdW50ZXIgc3RhdHMgZm9yICdz
eXN0ZW0gd2lkZSc6Cj4KPiAgICAgICAgICAgIDEzMzgzNTAgICAgICBhY2Nlc3NfbW11X3N0bGIK
PiAgICAgICAgICAgIDExNTQwMjUgICAgICBtaXNzX21tdV9zdGxiCj4gICAgICAgICAgICAxMTYy
NjkxICAgICAgYWNjZXNzX21tdV9wdGVfYwo+ICAgICAgICAgICAgICAzNDA2NyAgICAgIHJvYl9m
bHVzaAo+ICAgICAgICAgICAxMTIxMjM4NCAgICAgIGJ0Yl9wcmVkaWN0aW9uX21pc3MKPiAgICAg
ICAgICAgIDEyNTYyNDIgICAgICBpdGxiX21pc3MKPiAgICAgICAgICA2NTI1MjM0OTEgICAgICBz
eW5jX2RlbF9mZXRjaF9nCj4gICAgICAgICAgICAgMzg0NDY1ICAgICAgaWNhY2hlX21pc3MKPiAg
ICAgICAgICAgNjQ2MzU3ODkgICAgICBicHVfYnJfcmV0aXJlCj4gICAgICAgICAgICAgMzIzNDQw
ICAgICAgYnB1X2JyX21pc3MKPiAgICAgICAgICAgIDg3ODUxNDMgICAgICByZXRfaW5zX3JldGly
ZQo+ICAgICAgICAgICAgICAzMTIzNiAgICAgIHJldF9pbnNfbWlzcwo+Cj4gICAgICAgMjAuNzYw
ODIyNDgwIHNlY29uZHMgdGltZSBlbGFwc2VkCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaSBTaGVuZyBU
ZW9oIDxqaXNoZW5nLnRlb2hAc3RhcmZpdmV0ZWNoLmNvbT4KClRoYW5rcyBKaSBTaGVuZywKCmlu
IGFkZGluZyB0aGVzZSBldmVudHMgZm9yIHRoaXMgbmV3IGFyY2hpdGVjdHVyZSBpcyB0aGVyZSBh
IHJlYXNvbiBub3QKdG8gYWRkIHRoZSBhcmNoaXRlY3R1cmUgc3RhbmRhcmQgZXZlbnRzIGluCnRv
b2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LXNiaS1maXJtd2FyZS5qc29uID8K
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGVyZi9wZXJm
LXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3Yvcmlz
Y3Ytc2JpLWZpcm13YXJlLmpzb24/aD1wZXJmLXRvb2xzLW5leHQKClBlcmhhcHMgaXQgaXMgd29y
dGggY29tbWVudGluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hldGhlciBvciBub3QKdGhlc2Ug
ZXZlbnRzIGFyZSBzdXBwb3J0ZWQuCgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
