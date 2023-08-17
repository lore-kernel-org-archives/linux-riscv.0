Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253E1C2FC0E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haRaUYsWiBCqXqNTWDB+yOMnphdkfw6PnK1CIXUjOps=; b=fg7i87xoshk8Rj
	VDFencHUNJfeanhFxbsXLGoEHp6xrntP9J/LYi9e8WSNgLJLurSfO+gHgJDvOABKLG9nPe1wPKIam
	8FETCqfgTuDdxuX4glZFf2ll2VxuN/+RWq2oUjyZoGLODmIxvd9bYej+l0XhcbPjqEU6QBsYfKRvd
	g6R1HqEhZJSPKn7bu1ORSr3d8U5Tuel/ckv73bjKPgoYGEXVMIP+SMwqaSyJyCN9bfORyFn4V0fBx
	WD/TrdMuDdgFZOv4YKLlFzyj0dRJBW8jBxY5dg6q8274HTCbQ3Vl41iPLQvh9HjDuqcGaUDmuOJj9
	cDL0PnOulCJYgUFDImpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZ40-005txX-1q;
	Thu, 17 Aug 2023 09:13:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZ3x-005tvq-2r
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 09:13:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68872cadc7cso1902982b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692263583; x=1692868383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K91jE8EwBVM4Sp8konKF5372FTO4dIFG97TRQaKzO0E=;
        b=xQHA384K0ZO0OrkqcjlZ6MKQ35pNbmw9PsSE4SF6cz2yKQ3DvFVOMQ4vWLngH8n3Zs
         fXMdjr7lAbZajSWjm05I7a3lCsRNAN+Kp1Hk6y3ybWbpRnIPvZNzHngJggX1uKF3yQ5v
         3nRKEF3MzfvDS1s5QwUjp05Z5euKAQ9TKU11o9wNgMddyQjbG+MskSZMHMcfQ3I959QT
         0SSIkbPU0hxUBI8au0kBoaH3BoAEinsMkJTUNMvHnZkHve+ZSdreLauiStkkmDd1wfu9
         YjJKb8dlZY4a8Gs1yZDci9Xh2D2U89tlo8115a6S1ppGfok08LT2gWwagiy32jv1zFOA
         pAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692263583; x=1692868383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K91jE8EwBVM4Sp8konKF5372FTO4dIFG97TRQaKzO0E=;
        b=iDKS0XjXg5fe/5cCgTjsxJZCB1RpEp8+IBdTuUmUf5ix7GCjU1M52Ni78e//Du4QHG
         nS1dcahmrOZ4CObRCty68fk0GTIKDL4/GzUanbL5GozqGRaLkC29t/Y1hmpbEq+vUBjM
         xDC1k6bfsCfcGehDuvI1RwHsKY1yYe9iI0S9G0TWZVqpJz+FARFPNC1kmVzGxZLEaf8V
         f4GpSsoXCimBKyTUEzKMRBA3DIJHFUxU9ArKsPz/USFKetfrX3lEHzYJ7KOAUMQaSQfM
         eCX3jkh7o/W2HSG8CMLY5vB83fJ2XVnPeLSpraDwYV038NCOSSMMzgpaeQABeMvo+J9k
         zL2Q==
X-Gm-Message-State: AOJu0Yw93wJQqJEF6sGqT8V4Wwqk77JOA4roaukMAtloZudAaow9hWvQ
	jAoVWnnhwGeI0LOZHdVypPCnGA==
X-Google-Smtp-Source: AGHT+IEIqqs40KIfRVtyjO6BfEq3bmiOt6WXaiauiTs9IDaui+L8JnWcsz+icvL898LfGWIQpaV3xg==
X-Received: by 2002:a05:6a20:3251:b0:130:b19d:ec1f with SMTP id hm17-20020a056a20325100b00130b19dec1fmr4423496pzc.11.1692263582886;
        Thu, 17 Aug 2023 02:13:02 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-204.hinet-ip.hinet.net. [211.75.219.204])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b001bbfa86ca3bsm14709012plg.78.2023.08.17.02.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 02:13:02 -0700 (PDT)
Date: Thu, 17 Aug 2023 17:12:54 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf parse-regs: Refactor architecture functions
Message-ID: <20230817091254.GA176609@leoy-huanghe.lan>
References: <20230606014559.21783-1-leo.yan@linaro.org>
 <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
 <ZNvCxM/ULdUfzHtR@kernel.org>
 <ZNvHx+KxIL6JzEl/@kernel.org>
 <ZNvJdsVmmAWLmfH6@kernel.org>
 <ZNvKjeFkXY8ezf9e@kernel.org>
 <20230816020715.GA135657@leoy-huanghe.lan>
 <ZNy3D6DV3Q9YjxKd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNy3D6DV3Q9YjxKd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_021305_926227_9362663B 
X-CRM114-Status: GOOD (  34.27  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMDg6NDY6MjNBTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IEVtIFdlZCwgQXVnIDE2LCAyMDIzIGF0IDEwOjA3OjE1QU0gKzA4
MDAsIExlbyBZYW4gZXNjcmV2ZXU6Cj4gPiBPbiBUdWUsIEF1ZyAxNSwgMjAyMyBhdCAwMzo1Nzox
N1BNIC0wMzAwLCBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gd3JvdGU6Cj4gPiA+IEVtIFR1ZSwg
QXVnIDE1LCAyMDIzIGF0IDAzOjUyOjM4UE0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVs
byBlc2NyZXZldToKPiA+ID4gPiBFbSBUdWUsIEF1ZyAxNSwgMjAyMyBhdCAwMzo0NToyN1BNIC0w
MzAwLCBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gZXNjcmV2ZXU6Cj4gPiA+ID4gPiA+IEFncmVl
ZCwgYXBwbGllZCB0byBwZXJmLXRvb2xzLW5leHQsIHNvcnJ5IGZvciB0aGUgZGVsYXkuCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IEhhZCB0byBhZGQgdGhpcyB0byBtYWtlICdwZXJmIHRlc3QgcHl0aG9u
JyB0byB3b3JrLiBQbGVhc2UgcnVuICdwZXJmCj4gPiA+ID4gPiB0ZXN0JyBiZWZvcmUgc2VuZGlu
ZyBwYXRjaGVzLgo+ID4gPiA+IAo+ID4gPiA+IE9uZSBtb3JlLCBwbGVhc2UgYWxzbyBkbyBhICdt
YWtlIC1DIHRvb2xzL3BlcmYgYnVpbGQtdGVzdCcsIHdpdGggaXQgSQo+ID4gPiA+IGNhdWdodCB0
aGlzOgo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICAgIG1ha2Vfbm9fbGlidW53aW5kX086IGNkIC4g
JiYgbWFrZSBOT19MSUJVTldJTkQ9MSBGRUFUVVJFU19EVU1QPS92YXIvaG9tZS9hY21lL2dpdC9w
ZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAtajMyIE89
L3RtcC90bXAueWVFR3lRcTJIUiBERVNURElSPS90bXAvdG1wLklUZ29PMTZqakgKPiA+ID4gPiBj
ZCAuICYmIG1ha2UgTk9fTElCVU5XSU5EPTEgRkVBVFVSRVNfRFVNUD0vdmFyL2hvbWUvYWNtZS9n
aXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFUVVJFX0RVTVAgLWoz
MiBPPS90bXAvdG1wLnllRUd5UXEySFIgREVTVERJUj0vdG1wL3RtcC5JVGdvTzE2ampICj4gPiA+
IAo+ID4gPiArI2luY2x1ZGUgInV0aWwvZW52LmgiCj4gPiA+IAo+ID4gPiBBcyBub3cgd2UgbmVl
ZCBpdCBmb3IgcGVyZl9lbnZfX2FyY2godWktPm1hY2hpbmUtPmVudikKPiA+IAo+ID4gU29ycnkg
Zm9yIGluY29udmVuaWVuY2UuCj4gPiAKPiA+IEkgc2F3IHRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBi
ZWVuIHBpY2tlZCBpbnRvIHRoZSBicmFuY2g6Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9hY21lL2xpbnV4LmdpdC9sb2cvP2g9dG1wLnBlcmYtdG9v
bHMtbmV4dAo+ID4gCj4gPiBJZiB3YW50IG1lIHRvIGZvbGxvdyB1cCwgbGV0IG1lIGtub3cuICBU
aGFuayB5b3UhCj4gCj4gUmlnaHQsIEknbGwgZml4IHRoaXMgb25lczoKPiAKPiBbcGVyZmJ1aWxk
ZXJAZml2ZSB+XSQgZ3JlcCAidW51c2VkIHZhcmlhYmxlIiBkbS5sb2cvKjoqCj4gZG0ubG9nL3Vi
dW50dToxOC4wNC14LW02OGs6dXRpbC9ldnNlbC5jOjg0ODoxNDogZXJyb3I6IHVudXNlZCB2YXJp
YWJsZSAnYXJjaCcgWy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQo+IGRtLmxvZy91YnVudHU6MTgu
MDQteC1yaXNjdjY0OnV0aWwvZXZzZWwuYzo4NDg6MTQ6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg
J2FyY2gnIFstV2Vycm9yPXVudXNlZC12YXJpYWJsZV0KPiBkbS5sb2cvdWJ1bnR1OjE4LjA0LXgt
c2g0OnV0aWwvZXZzZWwuYzo4NDg6MTQ6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUgJ2FyY2gnIFst
V2Vycm9yPXVudXNlZC12YXJpYWJsZV0KPiBkbS5sb2cvdWJ1bnR1OjE4LjA0LXgtc3BhcmM2NDp1
dGlsL2V2c2VsLmM6ODQ4OjE0OiBlcnJvcjogdW51c2VkIHZhcmlhYmxlICdhcmNoJyBbLVdlcnJv
cj11bnVzZWQtdmFyaWFibGVdCj4gW3BlcmZidWlsZGVyQGZpdmUgfl0kCj4gCj4gQW5kIG1vdmUg
dGhhdCB0byBwZXJmLXRvb2xzLW5leHQsIHdlIGNhbiBnbyBvbiBmcm9tIHRoZXJlLgo+IAo+IFRo
ZSBhYm92ZSBpcyBiZWNhdXNlIHdlIGRvbid0IGRlZmluZSBDT05GSUdfUEVSRl9SRUdTIGZvciB0
aGVzZQo+IGFyY2hpdGVjdHVyZXMgYW5kIHRodXMgdGhhdCB2YXJpYWJsZSBlbmRzIHVwIG5vdCBi
ZWluZyB1c2VkLCBzbyBJJ20KPiBmaXhpbmcgdXAgbGlrZSBiZWxvdywgaW4gdGhlIGNzZXQgd2hl
cmUgeW91IG1hZGUgRFdBUkZfTUlOSU1BTF9SRUdTCj4gcmVjZWl2ZSB0aGUgYXJjaCBwYXJhbWV0
ZXIuCgpJIHJldmlld2VkIHlvdXIgYmVsb3cgYW1lbmRlZCBjaGFuZ2UsIGl0IGxvb2tzIGdvb2Qg
dG8gbWUuCgpBbmQgSSB0ZXN0ZWQgdGhlIGxhdGVzdCBwZXJmLXRvb2xzLW5leHQgYnJhbmNoIGZv
ciBib3RoIG5hdGl2ZSBhbmQgY3Jvc3MKcmVnaXN0ZXIgcGFyc2luZyB3aXRoIHBlcmYgQXJtNjQg
YmluYXJpZXMuICBMb29rcyBnb29kIHRvIG1lLgoKVGhhbmtzIGEgbG90IGZvciBmaXhpbmcgdXAh
Cgo+IEFsc28gSSBoYXZlbid0IGNoZWNrZWQgaG93IGdyYWNlZnVsbHkgd2UgcmVhY3Qgd2hlbiBw
cm9jZXNzaW5nIGEKPiBwZXJmLmRhdGEgY29sbGVjdGVkIGluIG9uZSBvZiB0aG9zZSB1bnN1cHBv
cnRlZCBhcmNoZXMsIGNhbiB5b3UgcGxlYXNlCj4gY2hlY2s/CgpBdCB0aGUgZmlyc3QgZ2xhbmNl
LCB3ZSBjYW4gYWRkIGNoZWNraW5nIGFyY2ggc3VwcG9ydCBvZiByZWdpc3RlcgpwYXJzaW5nIGlu
IHRoZSBmdW5jdGlvbiBjYWxsY2hhaW5fcGFyYW1fc2V0dXAoKSwgd2hpY2ggaXMgaW52b2tlZCBi
eQpgcGVyZiByZXBvcnRgIGFuZCBgcGVyZiBzY3JpcHRgLCBidXQgd2UgbmVlZCB0byBoYW5kbGUg
YHBlcmYgdG9wYApzcGVjaWZpY2FsbHkuICBPciB3ZSBjYW4gY29uc2lkZXIgdG8gYWRkIGNoZWNr
aW5nIGluIHRoZSBmdW5jdGlvbgpfX3BhcnNlX2NhbGxjaGFpbl9yZXBvcnRfb3B0KCkuCgpBbnl3
YXksIEkgd2lsbCBsb29rIGludG8gZGVhaWxzIGFuZCB3b3JrIG91dCBwYXRjaGVzLgoKVGhhbmtz
LApMZW8KCj4gLSBBcm5hbGRvCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9wZXJm
X3JlZ3MuaCBiL3Rvb2xzL3BlcmYvdXRpbC9wZXJmX3JlZ3MuaAo+IGluZGV4IDc5MGMxYTI2YmJm
ZTliNGIuLmRlMTY3MzA1N2U1MDJkZTkgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL3Bl
cmZfcmVncy5oCj4gKysrIGIvdG9vbHMvcGVyZi91dGlsL3BlcmZfcmVncy5oCj4gQEAgLTMyLDkg
KzMyLDYgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBzYW1wbGVfcmVnIHNhbXBsZV9yZWdfbWFza3Nb
XTsKPiAgCj4gICNpbmNsdWRlIDxwZXJmX3JlZ3MuaD4KPiAgCj4gLSNkZWZpbmUgRFdBUkZfTUlO
SU1BTF9SRUdTKGFyY2gpCVwKPiAtCSgoMVVMTCA8PCBwZXJmX2FyY2hfcmVnX2lwKGFyY2gpKSB8
ICgxVUxMIDw8IHBlcmZfYXJjaF9yZWdfc3AoYXJjaCkpKQo+IC0KPiAgY29uc3QgY2hhciAqcGVy
Zl9yZWdfbmFtZShpbnQgaWQsIGNvbnN0IGNoYXIgKmFyY2gpOwo+ICBpbnQgcGVyZl9yZWdfdmFs
dWUodTY0ICp2YWxwLCBzdHJ1Y3QgcmVnc19kdW1wICpyZWdzLCBpbnQgaWQpOwo+ICB1aW50NjRf
dCBwZXJmX2FyY2hfcmVnX2lwKGNvbnN0IGNoYXIgKmFyY2gpOwo+IEBAIC02NywxMSArNjQsMTkg
QEAgY29uc3QgY2hhciAqX19wZXJmX3JlZ19uYW1lX3g4NihpbnQgaWQpOwo+ICB1aW50NjRfdCBf
X3BlcmZfcmVnX2lwX3g4Nih2b2lkKTsKPiAgdWludDY0X3QgX19wZXJmX3JlZ19zcF94ODYodm9p
ZCk7Cj4gIAo+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IERXQVJGX01JTklNQUxfUkVHUyhjb25z
dCBjaGFyICphcmNoKQo+ICt7Cj4gKwlyZXR1cm4gKDFVTEwgPDwgcGVyZl9hcmNoX3JlZ19pcChh
cmNoKSkgfCAoMVVMTCA8PCBwZXJmX2FyY2hfcmVnX3NwKGFyY2gpKTsKPiArfQo+ICsKPiAgI2Vs
c2UKPiAgI2RlZmluZSBQRVJGX1JFR1NfTUFTSwkwCj4gICNkZWZpbmUgUEVSRl9SRUdTX01BWAkw
Cj4gIAo+IC0jZGVmaW5lIERXQVJGX01JTklNQUxfUkVHUyhhcmNoKQlQRVJGX1JFR1NfTUFTSwo+
ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IERXQVJGX01JTklNQUxfUkVHUyhjb25zdCBjaGFyICph
cmNoIF9fbWF5YmVfdW51c2VkKQo+ICt7Cj4gKwlyZXR1cm4gUEVSRl9SRUdTX01BU0s7Cj4gK30K
PiAgCj4gIHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqcGVyZl9yZWdfbmFtZShpbnQgaWQgX19t
YXliZV91bnVzZWQsIGNvbnN0IGNoYXIgKmFyY2ggX19tYXliZV91bnVzZWQpCj4gIHsKPiAgCj4g
PiA+ID4gICBDQyAgICAgIC90bXAvdG1wLnllRUd5UXEySFIvdXRpbC9leHByLWZsZXgubwo+ID4g
PiA+IHV0aWwvdW53aW5kLWxpYmR3LmM6IEluIGZ1bmN0aW9uIOKAmG1lbW9yeV9yZWFk4oCZOgo+
ID4gPiA+IHV0aWwvdW53aW5kLWxpYmR3LmM6MTczOjI4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFy
YXRpb24gb2YgZnVuY3Rpb24g4oCYcGVyZl9lbnZfX2FyY2jigJkgWy1XZXJyb3I9aW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gPiA+ID4gICAxNzMgfCAgICAgICAgIGNvbnN0IGNoYXIg
KmFyY2ggPSBwZXJmX2Vudl9fYXJjaCh1aS0+bWFjaGluZS0+ZW52KTsKPiA+ID4gPiAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+Cj4gPiA+ID4gdXRpbC91
bndpbmQtbGliZHcuYzoxNzM6Mjg6IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiDigJhjb25zdCBj
aGFyICrigJkgZnJvbSDigJhpbnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91
dCBhIGNhc3QgWy1XZXJyb3I9aW50LWNvbnZlcnNpb25dCj4gPiA+ID4gdXRpbC91bndpbmQtbGli
ZHcuYzogSW4gZnVuY3Rpb24g4oCYdW53aW5kX19nZXRfZW50cmllc+KAmToKPiA+ID4gPiB1dGls
L3Vud2luZC1saWJkdy5jOjI1ODoyODogZXJyb3I6IGluaXRpYWxpemF0aW9uIG9mIOKAmGNvbnN0
IGNoYXIgKuKAmSBmcm9tIOKAmGludOKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRo
b3V0IGEgY2FzdCBbLVdlcnJvcj1pbnQtY29udmVyc2lvbl0KPiA+ID4gPiAgIDI1OCB8ICAgICAg
ICAgY29uc3QgY2hhciAqYXJjaCA9IHBlcmZfZW52X19hcmNoKHVpX2J1Zi5tYWNoaW5lLT5lbnYp
Owo+ID4gPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn4KPiA+ID4gPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+ID4g
PiA+IG1ha2VbNl06ICoqKiBbL3Zhci9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29s
cy9idWlsZC9NYWtlZmlsZS5idWlsZDo5ODogL3RtcC90bXAueWVFR3lRcTJIUi91dGlsL3Vud2lu
ZC1saWJkdy5vXSBFcnJvciAxCj4gPiA+ID4gbWFrZVs2XTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KPiA+ID4gPiBtYWtlWzVdOiAqKiogWy92YXIvaG9tZS9hY21lL2dpdC9w
ZXJmLXRvb2xzLW5leHQvdG9vbHMvYnVpbGQvTWFrZWZpbGUuYnVpbGQ6MTUwOiB1dGlsXSBFcnJv
ciAyCj4gPiA+ID4gbWFrZVs0XTogKioqIFtNYWtlZmlsZS5wZXJmOjY2MjogL3RtcC90bXAueWVF
R3lRcTJIUi9wZXJmLWluLm9dIEVycm9yIDIKPiA+ID4gPiBtYWtlWzRdOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+ID4gPiA+ICAgQ0MgICAgICAvdG1wL3RtcC55ZUVHeVFx
MkhSL3BtdS1ldmVudHMvcG11LWV2ZW50cy5vCj4gPiA+ID4gICBMRCAgICAgIC90bXAvdG1wLnll
RUd5UXEySFIvcG11LWV2ZW50cy9wbXUtZXZlbnRzLWluLm8KPiA+ID4gPiBtYWtlWzNdOiAqKiog
W01ha2VmaWxlLnBlcmY6MjM4OiBzdWItbWFrZV0gRXJyb3IgMgo+ID4gPiA+IG1ha2VbMl06ICoq
KiBbTWFrZWZpbGU6NzA6IGFsbF0gRXJyb3IgMgo+ID4gPiA+IG1ha2VbMV06ICoqKiBbdGVzdHMv
bWFrZTozMzc6IG1ha2Vfbm9fbGlidW53aW5kX09dIEVycm9yIDEKPiA+ID4gPiBtYWtlOiAqKiog
W01ha2VmaWxlOjEwMzogYnVpbGQtdGVzdF0gRXJyb3IgMgo+ID4gPiA+IG1ha2U6IExlYXZpbmcg
ZGlyZWN0b3J5ICcvdmFyL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYn
Cj4gPiA+ID4gCj4gPiA+ID4gcmVhbAkxbTI5Ljc4NHMKPiA+ID4gPiB1c2VyCTEwbTQxLjU5N3MK
PiA+ID4gPiBzeXMJMm01NS45NDhzCj4gPiA+ID4g4qyiW2FjbWVAdG9vbGJveCBwZXJmLXRvb2xz
LW5leHRdJAo+ID4gPiA+IAo+ID4gPiA+IEknbSB0cnlpbmcgdG8gZml4Cj4gPiA+IAo+ID4gPiAt
LSAKPiA+ID4gCj4gPiA+IC0gQXJuYWxkbwo+IAo+IC0tIAo+IAo+IC0gQXJuYWxkbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
