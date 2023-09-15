Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EBEEE6422
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRa3dmfvshm97vmOl7HkPQO+S/GTniDMNKp1EToSfeU=; b=otnxHrfs2dUm1k
	JYJ3UQ7SZno75w7oxovLG6nfJ7DZEoK2a7dQ5ZnnqwHxnVgzRs7eGEc2Evnr+KIZTDNWlKmvglWEs
	UEzJIHKvuCKo3nMcjI2GN4HXsToH00/LGq3ob8kdS9ZKqeJY8Mjf5mRZx1Zqs2WMHEWI42BHkgNbh
	ymjs9qvIUPdTVbSEIXEG0uiFc1sJhY3neU4lpe7W5fwxiT0I7y3m8U8AHtI4KOkwl1AmwW93CXoUR
	r0s9wun47VGY0aEjDRV/pOit7+yabbP2jUWvmWox+tEzfpWoMkRKUM3InYnpBaDsW7N7k7/TeqoiQ
	9HctLEIbBhbEn3InN7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2mP-009xWC-1T;
	Fri, 15 Sep 2023 06:58:17 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2mM-009xUq-09
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 06:58:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2749b003363so256390a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 23:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694761092; x=1695365892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sgHfASFh3gAMSRsD4T8u/tQ4O/8NbFhdumsAYnmZ04=;
        b=SRrWurIgkfJz+hvigvsH43pEuuxfzjtATsnOrHu2pSX2Cx0YPYG8q18TpGepFjGGVP
         FyCgMlgwAp0zyCb5PfYrBlUa7zi1wG+a3N4Hetops4yP5moxhvTjHaaMV43w9vBYij/I
         YcBRCI0OwyQ6kLBJXfFhftVGIeFKeweldljNoLLvNoJqz/pSFQiVSWsrX+fVhdgz5QFj
         X6GKSGzb09TXnKXqxZKiT3gWwfK6Dwjk8pycQsMENohDrbzh1cgvYbjfoGXx0V6Khn26
         sZN+x2a48vdZewlR04YLDdO3MGRl4+oF3SuASwHb83s6mWh9rQsuLwOiXWWvAe77kSr8
         Faig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761092; x=1695365892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sgHfASFh3gAMSRsD4T8u/tQ4O/8NbFhdumsAYnmZ04=;
        b=A1cAbm1ihvMvezwLiP7hIkMBHNpPSMHpnr/p1MB6mz4gbNNqT59JibhzCJq7LBJ24T
         8b/OmcKfqKDm/MB9dP0X8ERz3kOF/hB5Xi0kuPflrjI+/1DdkIEF/txF8mJUPN5M8NGM
         GVhRuMZtLksadPMkscX5Dh9oqeNBo5/SeOooj6nco9DIMTvpdg2FgzA1EgGJD0fZcA/e
         kVTeARqFsCXFL/SPnPllREbqVJy1GghGsX5stA5S/vq6zT4mA6UDNmhaRLbSOeYLy6c8
         3Bvg6ZQ0utFn3dY08LM4dzUTQVFbtE2trVYjrBpahS3qKRJBIf4eQLNnUueZDXrvzVQa
         x2sQ==
X-Gm-Message-State: AOJu0YwxMUh57elnCvqxukzfSr+eT3WKJ3ObBeGQZ43c/T1uFvVHMMZ+
	DsmP4PHRru/X50JIhKQtB+tKGgAAGXQy+jviFeoZxg==
X-Google-Smtp-Source: AGHT+IEXGX3qdnpoVEB63l/vmhNINtjvr5hIW4tkdfNIQMCuMg9uAsM2xQSTRv+vJwFnG4MdfPbX0nye1IfP5YTNyjM=
X-Received: by 2002:a17:90b:128a:b0:26b:698f:dda7 with SMTP id
 fw10-20020a17090b128a00b0026b698fdda7mr628681pjb.32.1694761091749; Thu, 14
 Sep 2023 23:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 15 Sep 2023 12:27:59 +0530
Message-ID: <CAK9=C2VF0Q=sZn48fhqOCY5jBq8OR-YyJOrh6AREsYhUnivcVA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Risc-V Kvm Smstateen
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_235814_080389_210F59EE 
X-CRM114-Status: GOOD (  19.41  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTA6MTDigK9QTSBNYXl1cmVzaCBDaGl0YWxlCjxtY2hp
dGFsZUB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9y
dCB0byBkZXRlY3QgdGhlIFNtc3RhdGVlbiBleHRlbnNpb24gZm9yIGJvdGgsIHRoZQo+IGhvc3Qg
YW5kIHRoZSBndWVzdCB2Y3B1LiBJdCBhbHNvIGFkZHMgc2VudmNmZyBhbmQgc3N0YXRlZW4wIHRv
IHRoZSBPTkVfUkVHCj4gaW50ZXJmYWNlIGFuZCB0aGUgdmNwdSBjb250ZXh0IHNhdmUvcmVzdG9y
ZS4KPgo+IFRoZSBtb3RpdmF0aW9uIGJlaGluZCBTbXN0YXRlZW4gZnJvbSB0aGUgc3BlYwo+ICho
dHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytc3RhdGUtZW5hYmxlKToKPiAiVGhlIGltcGxl
bWVudGF0aW9uIG9mIG9wdGlvbmFsIFJJU0MtViBleHRlbnNpb25zIGhhcyB0aGUgcG90ZW50aWFs
IHRvIG9wZW4KPiBjb3ZlcnQgY2hhbm5lbHMgYmV0d2VlbiBzZXBhcmF0ZSB1c2VyIHRocmVhZHMs
IG9yIGJldHdlZW4gc2VwYXJhdGUgZ3Vlc3QgT1Nlcwo+IHJ1bm5pbmcgdW5kZXIgYSBoeXBlcnZp
c29yLiBUaGUgcHJvYmxlbSBvY2N1cnMgd2hlbiBhbiBleHRlbnNpb24gYWRkcyBwcm9jZXNzb3IK
PiBzdGF0ZS0tLXVzdWFsbHkgZXhwbGljaXQgcmVnaXN0ZXJzLCBidXQgcG9zc2libHkgb3RoZXIg
Zm9ybXMgb2Ygc3RhdGUtLS10aGF0Cj4gdGhlIG1haW4gT1Mgb3IgaHlwZXJ2aXNvciBpcyB1bmF3
YXJlIG9mIChhbmQgaGVuY2Ugd29u4oCZdCBjb250ZXh0LXN3aXRjaCkgYnV0Cj4gdGhhdCBjYW4g
YmUgbW9kaWZpZWQvd3JpdHRlbiBieSBvbmUgdXNlciB0aHJlYWQgb3IgZ3Vlc3QgT1MgYW5kIHBl
cmNlaXZlZC8KPiBleGFtaW5lZC9yZWFkIGJ5IGFub3RoZXIuIgo+Cj4gQ2hhbmdlcyBpbiB2NToK
PiAtIFJlYmFzZWQgb24gbGF0ZXN0IGxpbnV4IG1hc3Rlcgo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAt
IFVwZGF0ZSBjb21taXQgZGVzY3JpcHRpb24gZm9yIHBhdGNoIDEKPiAtIFJlYmFzZSB0byBrdm1f
cmlzY3ZfcXVldWUKPiAtIEFkZCByZXZpZXdlZC1ieSB0YWcKPgo+IENoYW5nZXMgaW4gdjM6Cj4g
LSBNb3ZlIERUIGJpbmRpbmdzIGNoYW5nZSB0byBhIHNlcGFyYXRlIHBhdGNoCj4gLSBNb3ZlIHNl
bnZjZmcvc3N0YXRlZW4wIHNhdmUvcmVzdG9yZSB0byBzZXBhcmF0ZSBmdW5jdGlvbgo+Cj4gQ2hh
bmdlcyBpbiB2MjoKPiAtIEFkZCBzbXN0YWVlbiBkZXNjcmlwdGlvbiBpbiByaXNjdi9leHRlbnNp
b25zLnlhbWwKPiAtIEF2b2lkIGxpbmUgd3JhcCBhdCA4MCBjaGFycwo+Cj4gTWF5dXJlc2ggQ2hp
dGFsZSAoNyk6Cj4gICBSSVNDLVY6IERldGVjdCBTbXN0YXRlZW4gZXh0ZW5zaW9uCj4gICBkdC1i
aW5kaW5nczogcmlzY3Y6IEFkZCBzbXN0YXRlZW4gZW50cnkKPiAgIFJJU0MtVjogS1ZNOiBBZGQg
a3ZtX3ZjcHVfY29uZmlnCj4gICBSSVNDLVY6IEtWTTogRW5hYmxlIFNtc3RhdGVlbiBhY2Nlc3Nl
cwo+ICAgUklTQ1Y6IEtWTTogQWRkIHNlbnZjZmcgY29udGV4dCBzYXZlL3Jlc3RvcmUKPiAgIFJJ
U0NWOiBLVk06IEFkZCBzc3RhdGVlbjAgY29udGV4dCBzYXZlL3Jlc3RvcmUKPiAgIFJJU0NWOiBL
Vk06IEFkZCBzc3RhdGVlbjAgdG8gT05FX1JFRwoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51
eC02LjcKClRoYW5rcywKQW51cAoKPgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgfCAgNiArKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAg
ICAgICAgICAgICAgICAgfCAxOCArKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggICAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCAgICAgICAgICAgICB8IDE4ICsrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9rdm0uaCAgICAgICAgICAgICB8IDEwICsrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgICAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDcwICsrKysrKysrKysrKysrKy0tLS0KPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgNDEgKysrKysrKysrKysKPiAg
OCBmaWxlcyBjaGFuZ2VkLCAxNTIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiAt
LQo+IDIuMzQuMQo+Cj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
