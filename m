Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E5C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4KRGvnjYXe/SuhAi0dDUBoG/KzFypWJ4kgbxtrXyFI=; b=WDyNKaui5eS0/4
	WWkZbNfGPLnWDXbCas/ihZepDqf3Oc/1G+f+U8NzXQE68RYihRXS0RnGiPYBrSmrGJURk6U61urSV
	AV3mGAzJxJy/w4AIkkz/AR/u6DpY0LgoHartP1eRzzQbYdXckrxGvVi1bOoM5ufhV7JfsDrKBaiMC
	4iRRcUar0qlko36xMciePQ2+EJmvARrxyy0fdMuTptS0lPUuKaO4MmXB/QIkJ7QsASHxR9dSnVX4N
	YSTuDVN9XNhdXN6vvcLQ6bdspBu5Phm0Qq6XaKporA3W9U1udfeNZKqLP+rxfUK+oGD9F74YqcHB0
	7XjTDKJ3IJfnI/nDphAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywMr-00BiHu-23;
	Fri, 03 Nov 2023 15:45:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywMn-00BiGz-1u
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 15:45:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so14863a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699026345; x=1699631145; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjRwo1IGVBygAppKkGTjsepd5un/ZpXB7p4VbVCjoI8=;
        b=c9G3OmYLG7FhqNa06BiaFd+6QtOnd7K6T8f7kQMOcNRg189Ga+2E+Mobl0UHKdenFN
         DF7pQKavT4hRCkrnu6ikn+JSSfo4WAuGhLL9SZYK7BA4QooStkKRBZw0ppCWIueO+548
         KHCBEQZ5dFDYuKG63fZyDdVCxGe5suuE213PxHEKJlfDjCNTqhr2+zOfNsRukgDqPjWH
         AlgoK2ol2oC5G4pMmzlJAzXeb41pD7If2I1EE0R+hLRfzpDI+/TNphDVqUN45uXLREPx
         PCrcNEEWOoYgK6VxuHy4sBvJBVgFUs7OqkxX9K50vHzakr7LtE59Sc/nPMJFUazSSXQP
         XOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699026345; x=1699631145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjRwo1IGVBygAppKkGTjsepd5un/ZpXB7p4VbVCjoI8=;
        b=m+06lSMVG25v+y5ATpzNWmCTBzq1HQ5iMRyOFKY2JQOvOK7pzfhWgwSRRhWf1HxjkU
         GISbo22uSB+RZXgHR0QzlXF28QBkQTRNRQ2CMhxiUNMa1LZkW8Uf75kvm0XQYtWN2W8t
         XdinfK4Q9ordKz84YwBAQcK+sjJys/FkMajecGzE/gcb4ni7dcdxl0twF7YE3JoIOQ3y
         rvhpbnB98lYUVmD3G144zNooD/zJpIMYTWG6EqTkWoFNOxarCVYrENXU00Y06JOZdLIG
         GFcnTZH9N9J2MwV1lOAc0BNKAnoeu1F8yMZd0x+/4r+LCOFMaFGa8eoHimCW6qHkjZS7
         HUKA==
X-Gm-Message-State: AOJu0Ywh8cp2Aoj9NyyWET37cvl/os9MLGAr2hUu1TpAbYahJRCYjv6A
	89Ly3Yy9io7MUFpfGsxbbjKbp9gUE9M5pWV9yR1g7g==
X-Google-Smtp-Source: AGHT+IHkqI6reqbvYFSR1zZzyPUAt09vCldvmbNvBfqW7ZhzxrLZuWblZNw6SMoFfLURSlI4Q0L7glx/y9ttQADPMr0=
X-Received: by 2002:a50:a68b:0:b0:542:d6e7:1e09 with SMTP id
 e11-20020a50a68b000000b00542d6e71e09mr230479edc.0.1699026345421; Fri, 03 Nov
 2023 08:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231103082441.1389842-1-jisheng.teoh@starfivetech.com>
In-Reply-To: <20231103082441.1389842-1-jisheng.teoh@starfivetech.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 3 Nov 2023 08:45:33 -0700
Message-ID: <CAP-5=fW4T_j02RLghg=_OB1TkRWFuHKOR59xFyEsdEH5gGnUPA@mail.gmail.com>
Subject: Re: [PATCH v2] perf vendor events riscv: add StarFive Dubhe-80 JSON file
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nikita Shubin <n.shubin@yadro.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_084549_652385_43E748CD 
X-CRM114-Status: GOOD (  10.34  )
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

T24gRnJpLCBOb3YgMywgMjAyMyBhdCAxOjI34oCvQU0gSmkgU2hlbmcgVGVvaAo8amlzaGVuZy50
ZW9oQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gU3RhckZpdmUncyBEdWJoZS04MCBzdXBw
b3J0cyByYXcgZXZlbnQgaWQgMHgwMCAtIDB4MjIuCj4gVGhlIHJhdyBldmVudHMgYXJlIGVuYWJs
ZWQgdGhyb3VnaCBQTVUgbm9kZSBvZiBEVCBiaW5kaW5nLgo+IEJlc2lkZXMgcmF3IGV2ZW50LCBh
ZGQgc3RhbmRhcmQgUklTQy1WIGZpcm13YXJlIGV2ZW50cyB0bwo+IHN1cHBvcnQgbW9uaXRvcmlu
ZyBvZiBmaXJtd2FyZSBldmVudC4KPgo+IEV4YW1wbGUgb2YgUE1VIERUIG5vZGU6Cj4gcG11IHsK
PiAgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscG11IjsKPiAgICAgICAgIHJpc2N2LHJhdy1l
dmVudC10by1taHBtY291bnRlcnMgPQo+ICAgICAgICAgICAgICAgICAvKiBFdmVudCBJRCAxLTMx
ICovCj4gICAgICAgICAgICAgICAgIDwweDAwIDB4MDAgMHhGRkZGRkZGRiAweEZGRkZGRkUwIDB4
MDAwMDdGRjg+LAo+ICAgICAgICAgICAgICAgICAvKiBFdmVudCBJRCAzMi0zMyAqLwo+ICAgICAg
ICAgICAgICAgICA8MHgwMCAweDIwIDB4RkZGRkZGRkYgMHhGRkZGRkZGRSAweDAwMDA3RkY4PiwK
PiAgICAgICAgICAgICAgICAgLyogRXZlbnQgSUQgMzQgKi8KPiAgICAgICAgICAgICAgICAgPDB4
MDAgMHgyMiAweEZGRkZGRkZGIDB4RkZGRkZGMjIgMHgwMDAwN0ZGOD47Cj4gfTsKPgo+IEV4YW1w
bGUgb2YgUGVyZiBzdGF0IG91dHB1dDoKPiBbcm9vdEB1c2VyXSMgcGVyZiBzdGF0IC1hIFwKPiAg
ICAgICAgIC1lIGFjY2Vzc19tbXVfc3RsYiBcCj4gICAgICAgICAtZSBtaXNzX21tdV9zdGxiIFwK
PiAgICAgICAgIC1lIGFjY2Vzc19tbXVfcHRlX2MgXAo+ICAgICAgICAgLWUgcm9iX2ZsdXNoIFwK
PiAgICAgICAgIC1lIGJ0Yl9wcmVkaWN0aW9uX21pc3MgXAo+ICAgICAgICAgLWUgaXRsYl9taXNz
IFwKPiAgICAgICAgIC1lIHN5bmNfZGVsX2ZldGNoX2cgXAo+ICAgICAgICAgLWUgaWNhY2hlX21p
c3MgXAo+ICAgICAgICAgLWUgYnB1X2JyX3JldGlyZSBcCj4gICAgICAgICAtZSBicHVfYnJfbWlz
cyBcCj4gICAgICAgICAtZSByZXRfaW5zX3JldGlyZSBcCj4gICAgICAgICAtZSByZXRfaW5zX21p
c3MgXAo+ICAgICAgICAgLS0gb3BlbnNzbCBzcGVlZCByc2EyMDQ4Cj4KPiBEb2luZyAyMDQ4IGJp
dHMgcHJpdmF0ZSByc2EncyBmb3IgMTBzOiAzOSAyMDQ4IGJpdHMgcHJpdmF0ZSBSU0EncyBpbgo+
IDEwLjE0cwo+IERvaW5nIDIwNDggYml0cyBwdWJsaWMgcnNhJ3MgZm9yIDEwczogMTU2MyAyMDQ4
IGJpdHMgcHVibGljIFJTQSdzIGluCj4gMTAuMDBzCj4gdmVyc2lvbjogMy4wLjExCj4gYnVpbHQg
b246IFR1ZSBTZXAgMTkgMTM6MDI6MzEgMjAyMyBVVEMKPiBvcHRpb25zOiBibig2NCw2NCkKPiBD
UFVJTkZPOiBOL0EKPiAgICAgICAgICAgICAgICAgICBzaWduICAgIHZlcmlmeSAgICBzaWduL3Mg
dmVyaWZ5L3MKPiByc2EgMjA0OCBiaXRzIDAuMjYwMDAwcyAwLjAwNjM5OHMgICAgICAzLjggICAg
MTU2LjMKPgo+ICBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnc3lzdGVtIHdpZGUnOgo+
Cj4gICAgICAgICAgICAxMzM4MzUwICAgICAgYWNjZXNzX21tdV9zdGxiCj4gICAgICAgICAgICAx
MTU0MDI1ICAgICAgbWlzc19tbXVfc3RsYgo+ICAgICAgICAgICAgMTE2MjY5MSAgICAgIGFjY2Vz
c19tbXVfcHRlX2MKPiAgICAgICAgICAgICAgMzQwNjcgICAgICByb2JfZmx1c2gKPiAgICAgICAg
ICAgMTEyMTIzODQgICAgICBidGJfcHJlZGljdGlvbl9taXNzCj4gICAgICAgICAgICAxMjU2MjQy
ICAgICAgaXRsYl9taXNzCj4gICAgICAgICAgNjUyNTIzNDkxICAgICAgc3luY19kZWxfZmV0Y2hf
Zwo+ICAgICAgICAgICAgIDM4NDQ2NSAgICAgIGljYWNoZV9taXNzCj4gICAgICAgICAgIDY0NjM1
Nzg5ICAgICAgYnB1X2JyX3JldGlyZQo+ICAgICAgICAgICAgIDMyMzQ0MCAgICAgIGJwdV9icl9t
aXNzCj4gICAgICAgICAgICA4Nzg1MTQzICAgICAgcmV0X2luc19yZXRpcmUKPiAgICAgICAgICAg
ICAgMzEyMzYgICAgICByZXRfaW5zX21pc3MKPgo+ICAgICAgIDIwLjc2MDgyMjQ4MCBzZWNvbmRz
IHRpbWUgZWxhcHNlZAo+Cj4gU2lnbmVkLW9mZi1ieTogSmkgU2hlbmcgVGVvaCA8amlzaGVuZy50
ZW9oQHN0YXJmaXZldGVjaC5jb20+CgpSZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bn
b29nbGUuY29tPgoKVGhhbmtzIEppIFNoZW5nLCBnbWFpbCBtYWRlIGEgbWVzcyBvZiB0aGUgcGF0
Y2hlcyBmb3IgbWUsIGJ1dCBkb2luZzoKCmI0IGFtIDIwMjMxMTAzMDgyNDQxLjEzODk4NDItMS1q
aXNoZW5nLnRlb2hAc3RhcmZpdmV0ZWNoLmNvbQoKdGhlIGNvbnRlbnRzIGxvb2tlZCBjb3JyZWN0
LgoKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
