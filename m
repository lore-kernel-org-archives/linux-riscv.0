Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4210D43370
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bKAyY5f6WKtDE76AkOtxQvTl0IkA+6aSEUvUcFD4Go=; b=jPpzplH0DZBR8N
	jPb1/uhON+OwxoZEuxQeGSgE8Tq4XjE447ubsXpRkS0p+VnBoNs/xE4mYzvJpsD39d3/yGtU5wiQb
	Wk6Vmdx2868TSjNxhwwfrKOBh6r344TLWUI3DA2xzmOJGTwtg29jfcjdc2H6O54e4EYDMCPRDp9Ls
	ac1WsrxopQile4FNL5cKoimcs+66X1F5tV/wsWFaSNFo8xJhqzQQHzwsoH4n2K0ZJBhQhUIuhn3U0
	hWOZtndnvxaSHOAFgiKOwDTgWQGkzqIIV3v8IPpfywFrRAlcERzsjuvFr3be2t0b5dzaNV4BAJ3CL
	6TWsAdJozkvLX2x+axqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94xo-00000007X6d-1h6A;
	Thu, 07 Nov 2024 16:02:28 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94t4-00000007W3F-2Zt2
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 15:57:36 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4608dddaa35so363481cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 07:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730995053; x=1731599853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+7ho61/oAoiWQbCyZG6AJoc8iLMZGuZ9+96uL2SaXc=;
        b=zE1yKcORw+9mW/75rOdyG5FYTVpVLnFMwDDleuidJoInNopCP408pUsyWncQbRJCRO
         LkzFOpN6F7yBLZDlTqjJ7wX+P+H/Nr+pPP+BYG3DDxuc+K4StkLUYsDl/v8ubQ0frq9Q
         Xb74zsKTcR5fNx/hV6RDV+M3qOehkri4oU1NPfA39k/jFuehI0vxbfSPwOWOb24PDBMn
         zSiHPgyW8Q8AurGrMBXeaILFX5ILYm0sSUmyUgmncJb5vpuYZ3zYacipvfWbDTDa9gQv
         bogzkgKPa3BAOK3Sw8Wr9YGMbU+5H1AnG7NYrP5ZSPbpUA6YATGkr7dCDbxdPq3sj4ZM
         zQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995053; x=1731599853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+7ho61/oAoiWQbCyZG6AJoc8iLMZGuZ9+96uL2SaXc=;
        b=vDglplKIoezdBr4hVuiNZzpYodF7mnjNfMujq4pXim/QFb2sBeS1FKWg+NbhZicWCO
         e3Y+baj/oI3mrmUOco4QNPiFgwFHazi+byPxS0KMi7W++MQrPeiRrjLYgVipAWa3qXb8
         oQOB1iHF/x2DPdp3hB+7BpIWYrTnDLDnMEurjSk3UgsL1/WmO9lgtZO4SaTxOkR5nDCq
         S9NK9B97iy3qirtmW7EiorXsREnQ0KSnCIt4kXIBhi9HRrnnaGcheZcidWcfPS3IE95M
         ChilSyguFWNnPYs69bp2kBN1og4ur/10eYuhIjBHQUVKdxfaO309xSihRDBblUKGww52
         tFUA==
X-Forwarded-Encrypted: i=1; AJvYcCWhGITs2QvS7YgPV32fTvHt5mHc7TtbgYty62MKqeJw1khiaHztcqHmljdciDOaRp2mukWYoQeZa1iWjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1lXJO37g3nyaf4MoqiHZGPljPlY0fP4axQpWZCbX+2GnpDST9
	L2bzip4kR6UUdj9rIxmyCiDOklxWbUx8IiwHgja5kAwV/9A2Ho5NvdX8tIUxdYDjCVtdkmukY0v
	J+kv+DJtD+GUQ7ToXqQclsmBr4RNzlbNk9UrX
X-Gm-Gg: ASbGncu1TQQcay4/xDPx/X1P03Up/YqxVQAuQD/4LUKN3rSn0JmYNRV6PqZ/fApXUBc
	IcCIsBC9aNBmBEYapD/vJC9S6pM4hBbkZT9Vjw/tMxopHSp4th/0d2Rjpk3wS9Ak=
X-Google-Smtp-Source: AGHT+IHVKHBvB2cCzxWI5DhXsQxE1wxEcC6cL+BUBfk+cOX40yCQNgt2BOrt/ugueoPHNZE5j5DaoRIma6XSWf55aH0=
X-Received: by 2002:a05:622a:4e8f:b0:460:3f4a:40a1 with SMTP id
 d75a77b69052e-462fa5a3211mr4869671cf.13.1730995053179; Thu, 07 Nov 2024
 07:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20241107071600.9082-1-irogers@google.com> <20241107082807.ipb7xzqvs24tto2e@hippo>
In-Reply-To: <20241107082807.ipb7xzqvs24tto2e@hippo>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 Nov 2024 07:57:21 -0800
Message-ID: <CAP-5=fXn3GSR88=UVqZ6zxsuv6s+ZBMGY1A0U8D-_oU4sm10kQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] Refactor cpuid and metric table lookup code
To: Xu Yang <xu.yang_2@nxp.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Ben Zong-You Xie <ben717@andestech.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Sandipan Das <sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_075734_681983_414A3E96 
X-CRM114-Status: GOOD (  18.44  )
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

T24gVGh1LCBOb3YgNywgMjAyNCBhdCAxOjA14oCvQU0gWHUgWWFuZyA8eHUueWFuZ18yQG54cC5j
b20+IHdyb3RlOgo+Cj4gSGkgSWFuIFJvZ2VycywKPgo+IE9uIFdlZCwgTm92IDA2LCAyMDI0IGF0
IDExOjE1OjUzUE0gLTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBYdSBZYW5nIDx4dS55YW5n
XzJAbnhwLmNvbT4gcmVwb3J0ZWQgaXNzdWVzIHdpdGggdGhlIHN5c3RlbSBtZXRyaWMKPiA+IGxv
b2t1cDoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBlcmYtdXNlcnMvMjAyNDEx
MDYwODU0NDEuMzk0NTUwMi0xLXh1LnlhbmdfMkBueHAuY29tLwo+ID4gVGhlc2UgcGF0Y2hlcyBy
ZW1vdmUgYSBsb3Qgb2YgdGhlIGxvZ2ljIHJlbGF0aW5nIENQVUlEcyB0byBQTVVzIHNvCj4gPiB0
aGF0IHRoZSBQTVUgaXNuJ3QgcGFydCBvZiB0aGUgcXVlc3Rpb24gd2hlbiBmaW5kaW5nIGEgbWV0
cmljIHRhYmxlLgo+ID4gRm9yIHRpbWUgcmVhc29ucywgaXQgZG9lc24ndCBnbyBhcyBmYXIgYXMg
YWxsb3dpbmcgc3lzdGVtIG1ldHJpY3MKPiA+IHdpdGhvdXQgYSBtZXRyaWMgdGFibGUgYXMgYSBt
ZXRyaWMgdGFibGUgaXMgbmVlZGVkIGZvciBtZXRyaWNzIHRvCj4gPiByZWZlciB0byBvdGhlciBt
ZXRyaWNzLCBhbmQgdGhlIHJlZmFjdG9yaW5nIG9mIHRoYXQgcmVzb2x1dGlvbiBpcyBhCj4gPiBo
YXNzbGUuCj4gPgo+ID4gSWFuIFJvZ2VycyAoNyk6Cj4gPiAgIHBlcmYgaGVhZGVyOiBNb3ZlIGlz
X2NwdV9vbmxpbmUgdG8gbnVtYSBiZW5jaAo+ID4gICBwZXJmIGhlYWRlcjogUmVmYWN0b3IgZ2V0
X2NwdWlkIHRvIHRha2UgYSBDUFUgZm9yIEFSTQo+ID4gICBwZXJmIGFybTY0IGhlYWRlcjogVXNl
IGNwdSBhcmd1bWVudCBpbiBnZXRfY3B1aWQKPiA+ICAgcGVyZiBoZWFkZXI6IEF2b2lkIHRyYW5z
aXRpdmUgUE1VIGluY2x1ZGVzCj4gPiAgIHBlcmYgaGVhZGVyOiBQYXNzIGEgcGVyZl9jcHUgcmF0
aGVyIHRoYW4gYSBQTVUgdG8gZ2V0X2NwdWlkX3N0cgo+ID4gICBwZXJmIGpldmVudHM6IEFkZCBt
YXBfZm9yX2NwdQo+ID4gICBwZXJmIHBtdTogTW92ZSBwbXVfbWV0cmljc190YWJsZV9fZmluZCBh
bmQgcmVtb3ZlIEFSTSBvdmVycmlkZQo+ID4KPiA+ICB0b29scy9wZXJmL2FyY2gvYXJtNjQvdXRp
bC9hcm0tc3BlLmMgICAgIHwgMTQgKy0tLQo+ID4gIHRvb2xzL3BlcmYvYXJjaC9hcm02NC91dGls
L2hlYWRlci5jICAgICAgfCA3MyArKysrKysrKysrLS0tLS0tLS0tLS0KPiA+ICB0b29scy9wZXJm
L2FyY2gvYXJtNjQvdXRpbC9wbXUuYyAgICAgICAgIHwgMjAgLS0tLS0tCj4gPiAgdG9vbHMvcGVy
Zi9hcmNoL2xvb25nYXJjaC91dGlsL2hlYWRlci5jICB8ICA0ICstCj4gPiAgdG9vbHMvcGVyZi9h
cmNoL3Bvd2VycGMvdXRpbC9oZWFkZXIuYyAgICB8ICA0ICstCj4gPiAgdG9vbHMvcGVyZi9hcmNo
L3Jpc2N2L3V0aWwvaGVhZGVyLmMgICAgICB8ICA0ICstCj4gPiAgdG9vbHMvcGVyZi9hcmNoL3Mz
OTAvdXRpbC9oZWFkZXIuYyAgICAgICB8ICA2ICstCj4gPiAgdG9vbHMvcGVyZi9hcmNoL3g4Ni91
dGlsL2F1eHRyYWNlLmMgICAgICB8ICAzICstCj4gPiAgdG9vbHMvcGVyZi9hcmNoL3g4Ni91dGls
L2hlYWRlci5jICAgICAgICB8ICA1ICstCj4gPiAgdG9vbHMvcGVyZi9iZW5jaC9udW1hLmMgICAg
ICAgICAgICAgICAgICB8IDUxICsrKysrKysrKysrKysrKwo+Cj4gTWVldCBlcnJvciB3aGVuIGJ1
aWxkIHBlcmYgdG9vbDoKPgo+ICAgQ0MgICAgICB1dGlsL2xldmVuc2h0ZWluLm8KPiAgIENDICAg
ICAgdGVzdHMvbWVtLm8KPiAgIENDICAgICAgdXRpbC9tbWFwLm8KPiBiZW5jaC9udW1hLmM6IElu
IGZ1bmN0aW9uIOKAmGlzX2NwdV9vbmxpbmXigJk6Cj4gYmVuY2gvbnVtYS5jOjU1MDoyMTogZXJy
b3I6IHN0b3JhZ2Ugc2l6ZSBvZiDigJhzdGF0YnVm4oCZIGlzbuKAmXQga25vd24KPiAgIDU1MCB8
ICAgICAgICAgc3RydWN0IHN0YXQgc3RhdGJ1ZjsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fgo+IGJlbmNoL251bWEuYzo1NTQ6MTM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJhzdGF04oCZOyBkaWQgeW91IG1lYW4g4oCYc3RyY2F04oCZPyBb
LVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIDU1NCB8ICAgICAgICAg
aWYgKHN0YXQoYnVmLCAmc3RhdGJ1ZikgIT0gMCkKPiAgICAgICB8ICAgICAgICAgICAgIF5+fn4K
PiAgICAgICB8ICAgICAgICAgICAgIHN0cmNhdAo+IGJlbmNoL251bWEuYzo1Nzg6MTM6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhzeXNmc19fcmVhZF9zdHLigJkg
Wy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICA1NzggfCAgICAgICAg
IGlmIChzeXNmc19fcmVhZF9zdHIoYnVmLCAmc3RyLCAmc3RybGVuKSA8IDApCj4gICAgICAgfCAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4KPiBiZW5jaC9udW1hLmM6NTUwOjIxOiBlcnJvcjog
dW51c2VkIHZhcmlhYmxlIOKAmHN0YXRidWbigJkgWy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQo+
ICAgNTUwIHwgICAgICAgICBzdHJ1Y3Qgc3RhdCBzdGF0YnVmOwo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+Cj4gICBDQyAgICAgIHRlc3RzL2NwdW1hcC5vCj4gICBDQyAgICAg
IHRlc3RzL3N0YXQubwo+Cj4gQWZ0ZXIgcmVtb3ZlIHRoZXNlIGVycm9ycywgbXkgaXNzdWUgaXMg
ZGlzYXBwZWFyZWQuCgpUaGFua3MsIEknbGwgZml4IHRoaXMgaW4gdjIuIEknbGwgYWxzbyBhZGQg
eW91ciBwYXRjaCB0byB0aGUgZnJvbnQgZm9yCnRoZSBzYWtlIG9mIGJhY2twb3J0IGZpeGluZy4g
SWYgeW91IGNvdWxkIHByb3ZpZGUgdGFncyBmb3IgbXkgY2hhbmdlcwppdCB3b3VsZCBiZSBhcHBy
ZWNpYXRlZC4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
