Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13861D64099
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 23:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuwudTWnvW4Fdo8AuYRSVtk/dXEfOD4KERqmdTN/eSk=; b=QwNM4Y3q5P0mlg
	JdEDxQck135+AVQwImx72ddTPXvWkpPh5YIY2RxjBSzytU/hibR8QqO0e7l+DlnFxlL6C/gEmSH6Z
	5J8Xd5w0qs1SnMbvarBzXFNTlJVo9IrhawcK4GU5WZdnGoVuvEmZav//VNp2sn4u6BKC07bZsX2Md
	JYxYBbs43S0D1F+M9pMfY2b6LpmRdluYi9lTyfv9vQ//mcIK64PecsvVonnRFlv8kc4cpviy/Qlsr
	sddKrBExRPmzmP/SU9bG9/USUDWzmony4QzjewqqgEYyXIT5inJDmz4c6z3gr32Z1/ztRjxtA644p
	vXXjnzuaOwYE2lEjFdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Y7I-0000000CBoM-0GYe;
	Fri, 08 Nov 2024 23:10:12 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Y5U-0000000CBaU-3RC7
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:08:22 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3a4e54d3cefso35725ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731107299; x=1731712099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiCqEW55XHvVf8qTba07pGSpYKmfdNiKgbJzhLD73iM=;
        b=kIp8XRDGPwA8/edpQZfxwFyQAUIELsObtQ8i8FBzvENWhA8lFucW41a7PQZi36J3S3
         Hm+hSiSVK/iBkEtoDSqoDpVhxsAwmK19vq2C8YCEYFR6X1Aw7DzZ8okV1gvTS0SSlsR/
         80gTmaY97huR66UhX/L5b2QZnTLyV0M51b7vmnQqCZEbwx+/0OTk+01dXW8H3eeuHuh5
         ZKE8H/bYXbX0/+C4NUFEBe5exQcYB+nAJajVK1Ql05bLIdJHlT67qVTPgD2+60SldBXk
         G4af3S52VI3R3iQppRZd0UEW3RsTAIMdvuW3gD6QPqaeqn2HHiounGg1eeaaTTKm9Pmk
         NmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731107299; x=1731712099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiCqEW55XHvVf8qTba07pGSpYKmfdNiKgbJzhLD73iM=;
        b=vEDs5LX+IVNShxyc9yf0loUWWSy/Kp2ZHfC4m3HunUj6wbOToj9KDG4nYxNNHdZNIW
         sL2v53cPCuPRRaIuwX1/4u702VPdkRtI38/dMjtvj8GscN+KClhlvTMdJ6sxw8wNCzat
         xLhaQm9oZH90w6yjmwrDk/A848e2Ky1+ymvCbJBGwWRF6AnRjdfyS5a8wJi5X4Pv1PTA
         cTXO1/WkIJJscTC88bn1za9pBAzsFn3Ckxv9WD1odkNTP5ghHNbdtxRecczs1Bn4q6pP
         r7y2UdETQokmd0gum0uko8Vq0WNcHdnk5tAIzrwpaARiBETxt8Cya1RazifCo/r6dTlg
         lO9g==
X-Forwarded-Encrypted: i=1; AJvYcCUPBrkyAwCI9l7T0Ei0eYgI31GsnBOY73RcuGdfbVNwiI9NkGTILK7Eo3a0Wz2+QRM/d2oPQPG51eTlmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9rZ6zc+dompoTUGaQnbNmXpmzsbUo9KQULU88oue8w9UFECG7
	k5d0pEMFmvqjHwQ7Q4IrLSxagn+e/+qFRgTAFaUqYoC155JLGmFYnGgrz6b2wmz7Px6qHHgS4h5
	8NcU9hwlypBGu1MQflf/IbncP1GlC9RYWtEL+
X-Gm-Gg: ASbGnctqV8CsqQaOoEjsfQTIwAfZDmRa1v31u/umVQGFLSAFzHUhQQSsBoCOGFONNVl
	3qQuQTO9g9e7maTsa7LNou3B1pj+Etl/6
X-Google-Smtp-Source: AGHT+IEukeGFoyo6dh0VbQTAZvTWfrcspZTzt0yr9OYJp6P2e9ETJS0TnoGpuVFVzJTNq6FY+rr4thPlSIkzzSRgbw0=
X-Received: by 2002:a05:6e02:1946:b0:3a0:a224:eb2c with SMTP id
 e9e14a558f8ab-3a6f9564132mr264765ab.25.1731107299142; Fri, 08 Nov 2024
 15:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com> <20241017002520.59124-11-irogers@google.com>
 <Zy5udmX6gZAg0wkS@google.com>
In-Reply-To: <Zy5udmX6gZAg0wkS@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Nov 2024 15:08:07 -0800
Message-ID: <CAP-5=fWhiLJ97smNySGk+TmmQ=ELOdztqdb7h3hrxT+18wG_HA@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] perf dwarf-regs: Move csky dwarf-regs out of arch
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_150820_906547_A25EA691 
X-CRM114-Status: GOOD (  26.22  )
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

T24gRnJpLCBOb3YgOCwgMjAyNCBhdCAxMjowM+KAr1BNIE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAxNiwgMjAyNCBhdCAwNToyNToxMFBN
IC0wNzAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gTW92ZSBhcmNoL2Nza3kvdXRpbC9kd2FyZi1y
ZWdzLmMgdG8gdXRpbC9kd2FyZi1yZWdzLWNza3kuYyBhbmQgY29tcGlsZQo+ID4gaW4gdW5jb25k
aXRpb25hbGx5LiBUbyBhdm9pZCBnZXRfYXJjaF9yZWdzdHIgYmVpbmcgZHVwbGljYXRlZCwgcmVu
YW1lCj4gPiB0byBnZXRfY3NreV9yZWdzdHIgYW5kIGFkZCB0byBnZXRfZHdhcmZfcmVnc3RyIHN3
aXRjaC4KPiA+Cj4gPiBVcGRhdGUgI2lmZGVmcyB0byBhbGxvdyBBQkkgVjEgYW5kIFYyIHRhYmxl
cyBhdCB0aGUgc2FtZQo+ID4gdGltZS4gRGV0ZXJtaW5lIHRoZSB0YWJsZSBmcm9tIHRoZSBFTEYg
ZmxhZ3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUu
Y29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvcGVyZi9hcmNoL2Nza3kvdXRpbC9CdWlsZCAgICAgICAg
ICAgICAgIHwgIDEgLQo+ID4gIHRvb2xzL3BlcmYvdXRpbC9CdWlsZCAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiA+ICAuLi4vZHdhcmYtcmVncy5jID0+IHV0aWwvZHdhcmYtcmVncy1j
c2t5LmN9ICAgfCAxOSArKysrKysrKysrLS0tLS0tLS0tCj4gPiAgdG9vbHMvcGVyZi91dGlsL2R3
YXJmLXJlZ3MuYyAgICAgICAgICAgICAgICAgIHwgMTEgKysrKysrKy0tLS0KPiA+ICB0b29scy9w
ZXJmL3V0aWwvaW5jbHVkZS9kd2FyZi1yZWdzLmggICAgICAgICAgfCAgMiArKwo+ID4gIDUgZmls
ZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPiAgcmVuYW1l
IHRvb2xzL3BlcmYve2FyY2gvY3NreS91dGlsL2R3YXJmLXJlZ3MuYyA9PiB1dGlsL2R3YXJmLXJl
Z3MtY3NreS5jfSAoNzQlKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvY3Nr
eS91dGlsL0J1aWxkIGIvdG9vbHMvcGVyZi9hcmNoL2Nza3kvdXRpbC9CdWlsZAo+ID4gaW5kZXgg
MTMyNTMxMGNhYjZhLi41ZTZlYTgyYzQyMDIgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL2Fy
Y2gvY3NreS91dGlsL0J1aWxkCj4gPiArKysgYi90b29scy9wZXJmL2FyY2gvY3NreS91dGlsL0J1
aWxkCj4gPiBAQCAtMSw0ICsxLDMgQEAKPiA+ICBwZXJmLXV0aWwteSArPSBwZXJmX3JlZ3Mubwo+
ID4KPiA+IC1wZXJmLXV0aWwtJChDT05GSUdfTElCRFcpICs9IGR3YXJmLXJlZ3Mubwo+ID4gIHBl
cmYtdXRpbC0kKENPTkZJR19MSUJEV19EV0FSRl9VTldJTkQpICs9IHVud2luZC1saWJkdy5vCj4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL0J1aWxkIGIvdG9vbHMvcGVyZi91dGlsL0J1
aWxkCj4gPiBpbmRleCA0YzYxNTYxMWI5ZDcuLjk5YWU0ZTI4MDJiOCAxMDA2NDQKPiA+IC0tLSBh
L3Rvb2xzL3BlcmYvdXRpbC9CdWlsZAo+ID4gKysrIGIvdG9vbHMvcGVyZi91dGlsL0J1aWxkCj4g
PiBAQCAtMjAzLDYgKzIwMyw3IEBAIGVuZGlmCj4gPiAgcGVyZi11dGlsLSQoQ09ORklHX0xJQkRX
KSArPSBwcm9iZS1maW5kZXIubwo+ID4gIHBlcmYtdXRpbC0kKENPTkZJR19MSUJEVykgKz0gZHdh
cmYtYXV4Lm8KPiA+ICBwZXJmLXV0aWwtJChDT05GSUdfTElCRFcpICs9IGR3YXJmLXJlZ3Mubwo+
ID4gK3BlcmYtdXRpbC0kKENPTkZJR19MSUJEVykgKz0gZHdhcmYtcmVncy1jc2t5Lm8KPiA+ICBw
ZXJmLXV0aWwtJChDT05GSUdfTElCRFcpICs9IGR3YXJmLXJlZ3MteDg2Lm8KPiA+ICBwZXJmLXV0
aWwtJChDT05GSUdfTElCRFcpICs9IGRlYnVnaW5mby5vCj4gPiAgcGVyZi11dGlsLSQoQ09ORklH
X0xJQkRXKSArPSBhbm5vdGF0ZS1kYXRhLm8KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2Fy
Y2gvY3NreS91dGlsL2R3YXJmLXJlZ3MuYyBiL3Rvb2xzL3BlcmYvdXRpbC9kd2FyZi1yZWdzLWNz
a3kuYwo+ID4gc2ltaWxhcml0eSBpbmRleCA3NCUKPiA+IHJlbmFtZSBmcm9tIHRvb2xzL3BlcmYv
YXJjaC9jc2t5L3V0aWwvZHdhcmYtcmVncy5jCj4gPiByZW5hbWUgdG8gdG9vbHMvcGVyZi91dGls
L2R3YXJmLXJlZ3MtY3NreS5jCj4gPiBpbmRleCBjYTg2ZWNhZWFjYmIuLmQzOGVmMWYwN2YzZSAx
MDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9jc2t5L3V0aWwvZHdhcmYtcmVncy5jCj4g
PiArKysgYi90b29scy9wZXJmL3V0aWwvZHdhcmYtcmVncy1jc2t5LmMKPiA+IEBAIC01LDkgKzUs
OCBAQAo+ID4gICNpbmNsdWRlIDxzdGRkZWYuaD4KPiA+ICAjaW5jbHVkZSA8ZHdhcmYtcmVncy5o
Pgo+ID4KPiA+IC0jaWYgZGVmaW5lZChfX0NTS1lBQklWMl9fKQo+ID4gLSNkZWZpbmUgQ1NLWV9N
QVhfUkVHUyA3Mwo+ID4gLWNvbnN0IGNoYXIgKmNza3lfZHdhcmZfcmVnc190YWJsZVtDU0tZX01B
WF9SRUdTXSA9IHsKPiA+ICsjZGVmaW5lIENTS1lfQUJJVjJfTUFYX1JFR1MgNzMKPiA+ICtjb25z
dCBjaGFyICpjc2t5X2R3YXJmX3JlZ3NfdGFibGVfYWJpdjJbQ1NLWV9BQklWMl9NQVhfUkVHU10g
PSB7Cj4gPiAgICAgICAvKiByMCB+IHI4ICovCj4gPiAgICAgICAiJWEwIiwgIiVhMSIsICIlYTIi
LCAiJWEzIiwgIiVyZWdzMCIsICIlcmVnczEiLCAiJXJlZ3MyIiwgIiVyZWdzMyIsCj4gPiAgICAg
ICAvKiByOSB+IHIxNSAqLwo+ID4gQEAgLTI2LDkgKzI1LDkgQEAgY29uc3QgY2hhciAqY3NreV9k
d2FyZl9yZWdzX3RhYmxlW0NTS1lfTUFYX1JFR1NdID0gewo+ID4gICAgICAgTlVMTCwgTlVMTCwg
TlVMTCwgTlVMTCwgTlVMTCwgTlVMTCwgTlVMTCwgTlVMTCwKPiA+ICAgICAgICIlZXBjIiwKPiA+
ICB9Owo+ID4gLSNlbHNlCj4gPiAtI2RlZmluZSBDU0tZX01BWF9SRUdTIDU3Cj4gPiAtY29uc3Qg
Y2hhciAqY3NreV9kd2FyZl9yZWdzX3RhYmxlW0NTS1lfTUFYX1JFR1NdID0gewo+ID4gKwo+ID4g
KyNkZWZpbmUgQ1NLWV9BQklWMV9NQVhfUkVHUyA1NwoKRGVmaW5pdGlvbiBvZiBDU0tZX0FCSVYx
X01BWF9SRUdTLgoKPiA+ICtjb25zdCBjaGFyICpjc2t5X2R3YXJmX3JlZ3NfdGFibGVfYWJpdjFb
Q1NLWV9BQklWMV9NQVhfUkVHU10gPSB7Cj4gPiAgICAgICAvKiByMCB+IHI4ICovCj4gPiAgICAg
ICAiJXNwIiwgIiVyZWdzOSIsICIlYTAiLCAiJWExIiwgIiVhMiIsICIlYTMiLCAiJXJlZ3MwIiwg
IiVyZWdzMSIsCj4gPiAgICAgICAvKiByOSB+IHIxNSAqLwo+ID4gQEAgLTQxLDkgKzQwLDExIEBA
IGNvbnN0IGNoYXIgKmNza3lfZHdhcmZfcmVnc190YWJsZVtDU0tZX01BWF9SRUdTXSA9IHsKPiA+
ICAgICAgIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsCj4g
PiAgICAgICAiJWVwYyIsCj4gPiAgfTsKPiA+IC0jZW5kaWYKPiA+Cj4gPiAtY29uc3QgY2hhciAq
Z2V0X2FyY2hfcmVnc3RyKHVuc2lnbmVkIGludCBuKQo+ID4gK2NvbnN0IGNoYXIgKmdldF9jc2t5
X3JlZ3N0cih1bnNpZ25lZCBpbnQgbiwgdW5zaWduZWQgaW50IGZsYWdzKQo+ID4gIHsKPiA+IC0g
ICAgIHJldHVybiAobiA8IENTS1lfTUFYX1JFR1MpID8gY3NreV9kd2FyZl9yZWdzX3RhYmxlW25d
IDogTlVMTDsKPiA+ICsgICAgIGlmIChmbGFncyAmIEVGX0NTS1lfQUJJVjIpCj4KPiBIbW0uLiB5
b3UgbmVlZCBpdCBoZXJlIGFzIHdlbGwuCgpUaGVzZSBjb25zdGFudHMgYXJlIHBhcnQgb2YgdGhl
IGR3YXJmLXJlZ3MtY3NreS5jIGZpbGUgYW5kIG5vdCBlbGYuaC4KCj4gPiArICAgICAgICAgICAg
IHJldHVybiAobiA8IENTS1lfQUJJVjJfTUFYX1JFR1MpID8gY3NreV9kd2FyZl9yZWdzX3RhYmxl
X2FiaXYyW25dIDogTlVMTDsKPiA+ICsKPiA+ICsgICAgIHJldHVybiAobiA8IENTS1lfQUJJVjFf
TUFYX1JFR1MpID8gY3NreV9kd2FyZl9yZWdzX3RhYmxlX2FiaXYxW25dIDogTlVMTDsKPiA+ICB9
Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL2R3YXJmLXJlZ3MuYyBiL3Rvb2xzL3Bl
cmYvdXRpbC9kd2FyZi1yZWdzLmMKPiA+IGluZGV4IGZkMjFmOWU5MGU0MC4uOWE3NmY4M2FmNjJj
IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL2R3YXJmLXJlZ3MuYwo+ID4gKysrIGIv
dG9vbHMvcGVyZi91dGlsL2R3YXJmLXJlZ3MuYwo+ID4gQEAgLTI5LDE3ICsyOSwxOCBAQAo+ID4g
ICNkZWZpbmUgX19nZXRfZHdhcmZfcmVnc3RyKHRibCwgbikgKCgobikgPCBBUlJBWV9TSVpFKHRi
bCkpID8gKHRibClbKG4pXSA6IE5VTEwpCj4gPgo+ID4gIC8qIFJldHVybiBhcmNoaXRlY3R1cmUg
ZGVwZW5kZW50IHJlZ2lzdGVyIHN0cmluZyAoZm9yIGtwcm9iZS10cmFjZXIpICovCj4gPiAtY29u
c3QgY2hhciAqZ2V0X2R3YXJmX3JlZ3N0cih1bnNpZ25lZCBpbnQgbiwgdW5zaWduZWQgaW50IG1h
Y2hpbmUsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3Mg
X19tYXliZV91bnVzZWQpCj4gPiArY29uc3QgY2hhciAqZ2V0X2R3YXJmX3JlZ3N0cih1bnNpZ25l
ZCBpbnQgbiwgdW5zaWduZWQgaW50IG1hY2hpbmUsIHVuc2lnbmVkIGludCBmbGFncykKPiA+ICB7
Cj4gPiAtI2lmIEVNX0hPU1QgPT0gRU1fWDg2XzY0IHx8IEVNX0hPU1QgPT0gRU1fMzg2IHx8IEVN
X0hPU1QgPT0gRU1fQUFSQ0g2NCB8fCBFTV9IT1NUID09IEVNX0FSTQo+ID4gKyNpZiBFTV9IT1NU
ID09IEVNX1g4Nl82NCB8fCBFTV9IT1NUID09IEVNXzM4NiB8fCBFTV9IT1NUID09IEVNX0FBUkNI
NjQgfHwgRU1fSE9TVCA9PSBFTV9BUk0gXAo+ID4gKyAgICB8fCBFTV9IT1NUID09IEVNX0NTS1kK
Pgo+IEFuZCBoZXJlIHRvby4gIEl0IHNlZW1zIHlvdSBhbHNvIG5lZWQgYSByZWJhc2UuCj4KPiBB
dCB0aGlzIHBvaW50LCBJJ20gZ2l2aW5nIHVwLiAgQ2FuIHlvdSBwbGVhc2UgcmVmcmVzaCB0aGUg
c2VyaWVzIHdpdGgKPiBhIGZpeD8KClN1cmUgSSdsbCByZWJhc2UgYW5kIGFkZCBpZm5kZWYrZGVm
aW5lcyB0byBkd2FyZi1yZWdzLmgsIEkgc2VlIHdlIGhhdmUKdGhlc2UgY3VycmVudGx5IGZvciBF
TV9BQVJDSDY0IGFuZCBFTV9MT09OR0FSQ0ggdGhlcmUuCgpUaGFua3MsCklhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
