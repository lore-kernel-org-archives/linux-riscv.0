Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71096EE209E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOnv5nUJ47vwR33kJWnkNN3KRX0sOxiVDw8Riefsn+M=; b=VdlCqWlf4p9fZu
	MmBidy+N/NB1ju+YYK7VFppId6g0YfAreEpEhdAD7RlEWy53yapzbAU8SJiI3ESvAN0o+kUWPSu8c
	aex1ILPBa1C1WYxG3jIHQZk/PzcCvPDRGCS+deblkfj6iLtVe6uop0NQrQ8C1xJCnaT1El6OuuF2n
	PhSHmJwG6HuuY+FCL1FzvKSt41U9NqeUeq2GsX5eIAvEyw/yZtUvplHFfGI81qn0hpnOjgOgg38uj
	hCGSj3VyX+ZP8auCeVuA0GdI1EnIceqH1G/Ye7E3mFs6uIJOAxRys/6klPxls9HK55ZVKQExW6wA5
	DLTHpd6Rstdwqe6k8CaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLMv-0000000BKSQ-1H6e;
	Fri, 06 Feb 2026 12:55:29 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLMs-0000000BKS3-2Vj9
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:55:28 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-382f0732612so4357731fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 04:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770382524; cv=none;
        d=google.com; s=arc-20240605;
        b=TT0/24efuTOmPiO3szHVffbXrnZ5fZO/O/pWlmFjpbp2HMafi2hmAfa0K2pKBY7ptw
         JNJDh1FLwxfjzWvUGIEdqwh9O38+ASGqBuDNgupZKkP0btKHzM8bYNq8UG1lEmTzPfQ+
         bhqQUCZfPZQqkITNn2sdExvELhO6/Qb7lcCF6TO2rf1jxtxnl7R+M6flpvBk1yN9lOYG
         INVUCSDgP6HKZf4k9NfDLrULO1YOaD+bAIh/hNOmxhYJ7nLxN5doVJIqSUumiMtPXQR6
         vpXTrJnRzJt/Yu9sTQ511dZu+OuiT2QwBOJz74xuU3YtKOECLKa4RdLKSlKaKqJFDleR
         63xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWG8MiKgoGDaUL/5SxjX7qejFCIkmY0v5IG2Vfw68JE=;
        fh=nxwRMyGPg2c19oH69iMWBuF5dUqypqmcia/iD1RRgw8=;
        b=WaN3BAtZxZqi2pv9W0xxGUguyJCkejzU7aohFCiYjFHR6Q2yUFrZVQtOcNwd6T+SFZ
         /sZnysi9eaZb/J8z//o+uvIAjSE1glEC9JIo+XJncAum461QqDcb4/lPT8kpivat/Hl3
         67my2NLjWZR0jomMcC64mhByLfaoaVakSy43LuxdptHgE2AFgLlE42FAKOS14HeRu2Az
         ulU28K2k8K1aOpaEY+Y+82d9hqLeWCSftzpW4rNjKvphm3uwu7B5xuBSNrIQnJqArMcr
         RE1GTv8xLj2dlnQy3vy6tf8ZEk5+p5QCfulyLBnuEcl9lQ+7A78s2eUnliiCunvYRne3
         P3NA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770382524; x=1770987324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWG8MiKgoGDaUL/5SxjX7qejFCIkmY0v5IG2Vfw68JE=;
        b=YGiEnmb6A1l7ZT0a2mehjw5asmSiuZaYzExva5TUIH/Z8wQHGk+QnqEDOw2MUCPCkv
         r/1l3LiI191k18tdCGKbnJb+dfPj6zlGFNdk8g55ac2rOlcZGJgLkzfFO9p8u+FqI/uk
         lxL0a0+funJlwQ7n21os9F2P0rjsPbrzfDt/Alxma9+BoLkMtITJ/e+72sSQS/0fcYau
         Do0wC3qzNhLjhQV9cafX9RRgbg7O4qX8tbrxAVomhCXGBnN4hMY2xY4Tq/orLX3wdXfu
         ger2eLYCk8/WEmkFuCmdz7kgEIP4byFPQdydpjY6bJ6kmte8iy8V6fsrVefnLn57S9MV
         zjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382524; x=1770987324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWG8MiKgoGDaUL/5SxjX7qejFCIkmY0v5IG2Vfw68JE=;
        b=BnP/RK1L5F25BTPpWGljsOh0HPKq17W4HcZXs4W3WN1fNqCUvN0XiGOjxRx9iZiZ72
         gBbJGDzGzMFouerNE3GPLwi+YF90qV3rq87aWGfu9XyEor22k3nv+qMAIXZN7o8FTmTI
         XnwQMxrgYLkF6azxBQbfvwUgJ6TcTKzj7G6Shhpy7IkSz99u8EfZUjvJZjSRa2/NQUNQ
         Jp//i2PKT/gPQsau0Z25bD6cMzfUFeyuj+wJ5n09a5eWKJpQ1tRmFZ8jOeOLUvvzGrhE
         kNR8U/h+PgQ5bU5vwZRriVbyM7ivQ0GT2tslZuSTSeMR/0RrxBMPxhV1Dkl7Fi3JGol6
         cp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE6zeHq/Sbbb4+foRnkjdyk49oe/dn7f7zX4Je60gwhxhm1q+GK+CRSuX1H97ktG7gM8ZZ9/71GqpErA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOt0Jna8VOPCqMFp0iKbNilG67DM1eqQ4kOc0ldgK8GtsLDzmT
	P+cqJ5dCsHQZ46pLh3QqEMUQ0GIPbHG4yRIgrk5XFKZ9L36ng/v5SHHvkE4tJNVh+AGCMdMXeU8
	9FgaJtl7hcs4Egf0MztlhEqQggNtUPQIBtGWzcaQbKw==
X-Gm-Gg: AZuq6aKCXpS3seBi2GOcAOSLvCsmYyRbxakJOrSf+nFbRyrG1sjbMvqtm9p5WEp/I0F
	cPIUHaK25Cvy/KzpWOq8PsUJTjx4prsQHjBOuuCTv/QlzlJVYZJdhi5SIITP+gKCm89FqtlWh5K
	UHvtuC1XQJX519EyJFxfzFmUfzQ2dOvSMM8n+BxbG4pjmCUC9bo+LnZEC0sOiwAsIVH/j4Gc4yS
	peMdms+snlIF6BPcfXapN8dHhdpRmCmAfNEhPT9m5hpHpLnFLzaPG1tqg8PLn7oWKatzHuw2A==
X-Received: by 2002:a2e:9a15:0:b0:37f:c5ca:72f0 with SMTP id
 38308e7fff4ca-386b4e7d8d8mr9491481fa.8.1770382524147; Fri, 06 Feb 2026
 04:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20251101154245.162492-1-apatel@ventanamicro.com> <20251101154245.162492-12-apatel@ventanamicro.com>
In-Reply-To: <20251101154245.162492-12-apatel@ventanamicro.com>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 6 Feb 2026 20:55:12 +0800
X-Gm-Features: AZwV_QhI9tzwE3oQcQDzEEcs4kH1Y8KeyrODiC00ZJu2Ksk08hjM7uuYWFodWpE
Message-ID: <CAPqJEFodbAyHcLTL3UCQ6rKvRmbVDNm-zK9D5esg-ek9n4VeUw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] perf tools: Initial support for RISC-V trace decoder
To: Anup Patel <apatel@ventanamicro.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mayuresh Chitale <mchitale@gmail.com>, 
	Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_045526_716334_E524AE1B 
X-CRM114-Status: GOOD (  24.67  )
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

SGkgQW51cCwKCk9uIFNhdCwgTm92IDEsIDIwMjUgYXQgMTE6NDXigK9QTSBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBNYXl1cmVzaCBDaGl0YWxl
IDxtY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgo+Cj4gQWRkIGJhcmUgYm9uZXMgc3VwcG9ydCBm
b3IgUklTQy1WIHRyYWNlIGRlY29kZXIgc28gdGhhdCB0aGUgZGF0YSByZWNlaXZlZAo+IGZyb20g
dGhlIGhhcmR3YXJlIGJ5IHRoZSBSSVNDLVYgdHJhY2UgcGVyZiBkcml2ZXIgY2FuIGJlIHdyaXR0
ZW4gdG8gdGhlCj4gcGVyZiByZWNvcmQgb3V0cHV0IGZpbGUuCj4KPiBDby1kZXZlbG9wZWQtYnk6
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFu
dXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1heXVy
ZXNoIENoaXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIHRvb2xzL3Bl
cmYvdXRpbC9CdWlsZCAgICAgICAgICAgICB8ICAxICsKPiAgdG9vbHMvcGVyZi91dGlsL2F1eHRy
YWNlLmMgICAgICAgIHwgIDMgKwo+ICB0b29scy9wZXJmL3V0aWwvcnZ0cmFjZS1kZWNvZGVyLmMg
fCA5MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHRvb2xzL3BlcmYvdXRpbC9y
dnRyYWNlLmggICAgICAgICB8ICAyICsKPiAgNCBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3V0aWwvcnZ0cmFjZS1kZWNvZGVy
LmMKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvQnVpbGQgYi90b29scy9wZXJmL3V0
aWwvQnVpbGQKPiBpbmRleCA0YmUzMTNjZDExNWEuLmY3MzZjZWE1MWZkOCAxMDA2NDQKPiAtLS0g
YS90b29scy9wZXJmL3V0aWwvQnVpbGQKPiArKysgYi90b29scy9wZXJmL3V0aWwvQnVpbGQKPiBA
QCAtMTQ1LDYgKzE0NSw3IEBAIHBlcmYtdXRpbC0kKENPTkZJR19BVVhUUkFDRSkgKz0gY3MtZXRt
Lm8KPiAgcGVyZi11dGlsLSQoQ09ORklHX0FVWFRSQUNFKSArPSBjcy1ldG0tZGVjb2Rlci8KPiAg
ZW5kaWYKPiAgcGVyZi11dGlsLSQoQ09ORklHX0FVWFRSQUNFKSArPSBjcy1ldG0tYmFzZS5vCj4g
K3BlcmYtdXRpbC0kKENPTkZJR19BVVhUUkFDRSkgKz0gcnZ0cmFjZS1kZWNvZGVyLm8KPgo+ICBw
ZXJmLXV0aWwteSArPSBwYXJzZS1icmFuY2gtb3B0aW9ucy5vCj4gIHBlcmYtdXRpbC15ICs9IGR1
bXAtaW5zbi5vCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9hdXh0cmFjZS5jIGIvdG9v
bHMvcGVyZi91dGlsL2F1eHRyYWNlLmMKPiBpbmRleCBjOTA1NTYzZTBkOGEuLjI5OTk5MWQ1ZDMw
NSAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL3V0aWwvYXV4dHJhY2UuYwo+ICsrKyBiL3Rvb2xz
L3BlcmYvdXRpbC9hdXh0cmFjZS5jCj4gQEAgLTU0LDYgKzU0LDcgQEAKPiAgI2luY2x1ZGUgImFy
bS1zcGUuaCIKPiAgI2luY2x1ZGUgImhpc2ktcHR0LmgiCj4gICNpbmNsdWRlICJzMzkwLWNwdW1z
Zi5oIgo+ICsjaW5jbHVkZSAicnZ0cmFjZS5oIgo+ICAjaW5jbHVkZSAidXRpbC9tbWFwLmgiCj4g
ICNpbmNsdWRlICJwb3dlcnBjLXZwYWR0bC5oIgo+Cj4gQEAgLTEzOTUsNiArMTM5Niw4IEBAIGlu
dCBwZXJmX2V2ZW50X19wcm9jZXNzX2F1eHRyYWNlX2luZm8oc3RydWN0IHBlcmZfc2Vzc2lvbiAq
c2Vzc2lvbiwKPiAgICAgICAgICAgICAgICAgZXJyID0gcG93ZXJwY192cGFkdGxfcHJvY2Vzc19h
dXh0cmFjZV9pbmZvKGV2ZW50LCBzZXNzaW9uKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICAgICBjYXNlIFBFUkZfQVVYVFJBQ0VfUklTQ1ZfVFJBQ0U6Cj4gKyAgICAgICAgICAgICAg
IGVyciA9IHJ2dHJhY2VfX3Byb2Nlc3NfYXV4dHJhY2VfaW5mbyhldmVudCwgc2Vzc2lvbik7Cj4g
KyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBQRVJGX0FVWFRSQUNFX1VOS05P
V046Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL3J2dHJhY2UtZGVjb2Rlci5jIGIvdG9vbHMv
cGVyZi91dGlsL3J2dHJhY2UtZGVjb2Rlci5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjU4ZGI1Y2E2MmMxYQo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29s
cy9wZXJmL3V0aWwvcnZ0cmFjZS1kZWNvZGVyLmMKPiBAQCAtMCwwICsxLDkxIEBACj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIFJJU0MtViB0cmFjZSBE
ZWNvZGVyCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGVycm5vLmg+Cj4gKyNpbmNsdWRlIDxpbnR0
eXBlcy5oPgo+ICsjaW5jbHVkZSAiZXZsaXN0LmgiCj4gKyNpbmNsdWRlIDxpbnRlcm5hbC9saWIu
aD4KPiArI2luY2x1ZGUgInJ2dHJhY2UuaCIKPiArCj4gK3N0cnVjdCBydnRyYWNlX2RlY29kZXIg
ewo+ICsgICAgICAgc3RydWN0IGF1eHRyYWNlIGF1eHRyYWNlOwo+ICsgICAgICAgdTMyIGF1eHRy
YWNlX3R5cGU7Cj4gKyAgICAgICBzdHJ1Y3QgcGVyZl9zZXNzaW9uICpzZXNzaW9uOwo+ICsgICAg
ICAgc3RydWN0IG1hY2hpbmUgKm1hY2hpbmU7Cj4gKyAgICAgICB1MzIgcG11X3R5cGU7Cj4gK307
Cj4gKwo+ICtzdGF0aWMgaW50IHJ2dHJhY2VfcHJvY2Vzc19ldmVudChzdHJ1Y3QgcGVyZl9zZXNz
aW9uICpzZXNzaW9uIF9fbWF5YmVfdW51c2VkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuaW9uIHBlcmZfZXZlbnQgKmV2ZW50IF9fbWF5YmVfdW51c2VkLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwZXJmX3NhbXBsZSAqc2FtcGxlIF9fbWF5
YmVfdW51c2VkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBwZXJmX3Rvb2wgKnRvb2wgX19tYXliZV91bnVzZWQpCj4gK3sKPiArICAgICAgIHJldHVybiAw
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHJ2dHJhY2VfcHJvY2Vzc19hdXh0cmFjZV9ldmVudChz
dHJ1Y3QgcGVyZl9zZXNzaW9uICpzZXNzaW9uIF9fbWF5YmVfdW51c2VkLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuaW9uIHBlcmZfZXZlbnQgKmV2ZW50IF9f
bWF5YmVfdW51c2VkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBwZXJmX3Rvb2wgKnRvb2wgX19tYXliZV91bnVzZWQpCj4gK3sKPiArICAg
ICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHJ2dHJhY2VfZmx1c2goc3RydWN0
IHBlcmZfc2Vzc2lvbiAqc2Vzc2lvbiBfX21heWJlX3VudXNlZCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IHBlcmZfdG9vbCAqdG9vbCBfX21heWJlX3VudXNlZCkKPiAr
ewo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHJ2dHJhY2VfZnJl
ZV9ldmVudHMoc3RydWN0IHBlcmZfc2Vzc2lvbiAqc2Vzc2lvbiBfX21heWJlX3VudXNlZCkKPiAr
ewo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBydnRyYWNlX2ZyZWUoc3RydWN0IHBlcmZfc2Vzc2lv
biAqc2Vzc2lvbikKPiArewo+ICsgICAgICAgc3RydWN0IHJ2dHJhY2VfZGVjb2RlciAqcHRyID0g
Y29udGFpbmVyX29mKHNlc3Npb24tPmF1eHRyYWNlLCBzdHJ1Y3QgcnZ0cmFjZV9kZWNvZGVyLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXV4dHJhY2UpOwo+
ICsKPiArICAgICAgIHNlc3Npb24tPmF1eHRyYWNlID0gTlVMTDsKPiArICAgICAgIGZyZWUocHRy
KTsKPiArfQo+ICsKPiArc3RhdGljIGJvb2wgcnZ0cmFjZV9ldnNlbF9pc19hdXh0cmFjZShzdHJ1
Y3QgcGVyZl9zZXNzaW9uICpzZXNzaW9uLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGV2c2VsICpldnNlbCkKPiArewo+ICsgICAgICAgc3RydWN0IHJ2dHJh
Y2VfZGVjb2RlciAqcHRyID0gY29udGFpbmVyX29mKHNlc3Npb24tPmF1eHRyYWNlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBydnRy
YWNlX2RlY29kZXIsIGF1eHRyYWNlKTsKPiArCj4gKyAgICAgICByZXR1cm4gZXZzZWwtPmNvcmUu
YXR0ci50eXBlID09IHB0ci0+cG11X3R5cGU7Cj4gK30KPiArCj4gK2ludCBydnRyYWNlX19wcm9j
ZXNzX2F1eHRyYWNlX2luZm8odW5pb24gcGVyZl9ldmVudCAqZXZlbnQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGVyZl9zZXNzaW9uICpzZXNzaW9uKQo+ICt7
Cj4gKyAgICAgICBzdHJ1Y3QgcGVyZl9yZWNvcmRfYXV4dHJhY2VfaW5mbyAqYXV4dHJhY2VfaW5m
byA9ICZldmVudC0+YXV4dHJhY2VfaW5mbzsKPiArICAgICAgIHN0cnVjdCBydnRyYWNlX2RlY29k
ZXIgKnB0cjsKPiArCj4gKyAgICAgICBpZiAoYXV4dHJhY2VfaW5mby0+aGVhZGVyLnNpemUgPCBS
VlRSQUNFX0FVWFRSQUNFX1BSSVZfU0laRSArCj4gKyAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBw
ZXJmX3JlY29yZF9hdXh0cmFjZV9pbmZvKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gKwo+ICsgICAgICAgcHRyID0gemFsbG9jKHNpemVvZigqcHRyKSk7Cj4gKyAgICAgICBp
ZiAoIXB0cikKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsgICAgICAg
cHRyLT5zZXNzaW9uID0gc2Vzc2lvbjsKPiArICAgICAgIHB0ci0+bWFjaGluZSA9ICZzZXNzaW9u
LT5tYWNoaW5lcy5ob3N0Owo+ICsgICAgICAgcHRyLT5hdXh0cmFjZV90eXBlID0gYXV4dHJhY2Vf
aW5mby0+dHlwZTsKPiArICAgICAgIHB0ci0+cG11X3R5cGUgPSBhdXh0cmFjZV9pbmZvLT5wcml2
WzBdOwo+ICsKPiArICAgICAgIHB0ci0+YXV4dHJhY2UucHJvY2Vzc19ldmVudCA9IHJ2dHJhY2Vf
cHJvY2Vzc19ldmVudDsKPiArICAgICAgIHB0ci0+YXV4dHJhY2UucHJvY2Vzc19hdXh0cmFjZV9l
dmVudCA9IHJ2dHJhY2VfcHJvY2Vzc19hdXh0cmFjZV9ldmVudDsKPiArICAgICAgIHB0ci0+YXV4
dHJhY2UuZmx1c2hfZXZlbnRzID0gcnZ0cmFjZV9mbHVzaDsKPiArICAgICAgIHB0ci0+YXV4dHJh
Y2UuZnJlZV9ldmVudHMgPSBydnRyYWNlX2ZyZWVfZXZlbnRzOwo+ICsgICAgICAgcHRyLT5hdXh0
cmFjZS5mcmVlID0gcnZ0cmFjZV9mcmVlOwo+ICsgICAgICAgcHRyLT5hdXh0cmFjZS5ldnNlbF9p
c19hdXh0cmFjZSA9IHJ2dHJhY2VfZXZzZWxfaXNfYXV4dHJhY2U7Cj4gKyAgICAgICBzZXNzaW9u
LT5hdXh0cmFjZSA9ICZwdHItPmF1eHRyYWNlOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9ydnRyYWNlLmggYi90b29scy9wZXJmL3V0
aWwvcnZ0cmFjZS5oCj4gaW5kZXggOTNjMDQxZGI4NjYwLi5mZGYyZTU4NjZjODUgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvcGVyZi91dGlsL3J2dHJhY2UuaAo+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9y
dnRyYWNlLmgKPiBAQCAtMTUsNCArMTUsNiBAQAo+Cj4gICNkZWZpbmUgUlZUUkFDRV9BVVhUUkFD
RV9QUklWX1NJWkUgICAgIHNpemVvZih1NjQpCj4KPiAraW50IHJ2dHJhY2VfX3Byb2Nlc3NfYXV4
dHJhY2VfaW5mbyh1bmlvbiBwZXJmX2V2ZW50ICpldmVudCwgc3RydWN0IHBlcmZfc2Vzc2lvbiAq
c2Vzc2lvbik7Cj4gK3N0cnVjdCBhdXh0cmFjZV9yZWNvcmQgKnJ2dHJhY2VfcmVjb3JkX2luaXQo
aW50ICplcnIpOwoKSXQgbG9va3MgbGlrZSB0aGUgaW1wbGVtZW50YXRpb24gb2YgYHJ2dHJhY2Vf
cmVjb3JkaW5nX2luaXRgIGluIHRoZQphdXh0cmFjZS5jIGZpbGUgaXMgc3RhdGljIChwcml2YXRl
KSwgYW5kIHRoZSBhcmd1bWVudHMgZG9uJ3QgbWF0Y2gKdGhpcyBkZWNsYXJhdGlvbi4KU2hvdWxk
IHdlIHJlbW92ZSAic3RhdGljIiBmcm9tIGF1eHRyYWNlLmMgYW5kIHVwZGF0ZSB0aGlzIHByb3Rv
dHlwZQp0bzogInN0cnVjdCBhdXh0cmFjZV9yZWNvcmQgKnJ2dHJhY2VfcmVjb3JkaW5nX2luaXQo
aW50ICplcnIsIHN0cnVjdApwZXJmX3BtdSAqcnZ0cmFjZV9wbXUpOyI/CgpPciBzaG91bGQgd2Ug
c2ltcGx5IHJlbW92ZSB0aGlzIGRlY2xhcmF0aW9uIGZyb20gdGhlIGhlYWRlcj8gVGhhbmtzLgoK
UmVnYXJkcywKRXJpYyBMaW4sCgo+ICAjZW5kaWYKPiAtLQo+IDIuNDMuMAo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
