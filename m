Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3841061B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 12:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUnPPh3AVgwC3sjKIbKLnQAmKVFOp0X2AIN+qWOF1qk=; b=LpTmd2WurUYlwM
	RbCUj932jlECllKBdF8jMXYU+hU+WyHmynrbOQ8Eyt9zfWlnpFBQ+hYedD5uyF1RP3kJG9Dafa9M5
	YCnvdFQ62GQ3lEPPQNRm46NoIfuFHYWxXTbhZ9IRsoQczjFouRNoVQBZGykPjw3P1/gE/CTR8HtxZ
	uI3DBKTMdVikxf5Z18hmie+7f56yKCoe2RTZbUlGaivlt4aeXXiVhzcJWAZej9lnwr8JSFkIYBT7O
	OaH22ESOMb7SX1lEj2Iho1C8BrsGXX0vRb2dWQ/SG71ssr14HCvI0BEyMZTl1TbN0h8ZgACEyKCDG
	fMyX9VmSAKSCsLi4lhYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Y9B-0000000Cw9x-3ceR;
	Tue, 31 Mar 2026 12:24:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Y9B-0000000Cw9l-1SaA
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 12:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8625F61332
	for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541B2C2BCB2
	for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774959880;
	bh=+v0lsG31lmz9yOKp4sThWdLD00iDG9mSDxn4BdCze+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RJZmO7TvhY88kQe3eU7xRIwnSJdkZvyh60WN8MrF2rST5eqYT7Si7twWZg/DT2ZoX
	 YzqUgPxfYDwdo0IEdVVzbGnpMkc2xEIEQWtZG/kOBKnlwvP5OBf9k5ABA9qJOS+Ukj
	 eOekVrlTQVDRLMnCElfoE+fONsncPPw1jhKXxukkxEyJi7dEXS+heu/pZUzPng526Q
	 fQrEJ4DiG53+M4yOJk7Zh135J6HBPJuwoHDZrzQcHd3EDgZteWUMcAVKR5sOaepyV5
	 f2xbf4yCO62QwUTSWKNB376JIzJj0sbMnh6R7hTd0WRb04t6xyHnCnYuuXajw89d5X
	 Ti2a3xJRDsK2w==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4152698e745so2024692fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 05:24:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWh1njANJOlLqdwfCjz6f2VSnUZNRPdxCcw78fT0G3ZJWY7gV0EZmdTk+J+baaLebnVLhJm/McXeOUDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzINhW0JzUg0GZu2ZgiDoGSUft1N2JpEwxPa1tnKfp64ZbKoxkf
	mZEAOR94xelSRV4qAzP/T1DPUizF6bg2OaLNIlKMSZYidgIlpdgbvAzNP6jvYY00HTcCtKXq6os
	Tda6XeDulKS97aRT5JesIyNtlIcnP7DY=
X-Received: by 2002:a05:6870:3212:b0:41c:5212:2c7e with SMTP id
 586e51a60fabf-41cec149624mr8736242fac.20.1774959878527; Tue, 31 Mar 2026
 05:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260320031737.35048-1-fengchengwen@huawei.com>
In-Reply-To: <20260320031737.35048-1-fengchengwen@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 31 Mar 2026 14:24:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
X-Gm-Features: AQROBzDL-JtY7QC0BpuyBPGCuLquO5-Gf9GrQy5Yvy_4yGsymDKEHbc8tb9l0x0
Message-ID: <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/8] ACPI: Unify CPU UID interface and fix ARM64 TPH
 steer-tag issue
To: Chengwen Feng <fengchengwen@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, liuyonglong@huawei.com, anshuman.khandual@arm.com, linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, guohanjun@huawei.com, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Yanteng Si <si.yanteng@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXIgMjAsIDIwMjYgYXQgNDoxN+KAr0FNIENoZW5nd2VuIEZlbmcgPGZlbmdjaGVu
Z3dlbkBodWF3ZWkuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2hzZXQgdW5pZmllcyBBQ1BJIFBy
b2Nlc3NvciBVSUQgcmV0cmlldmFsIGFjcm9zcwo+IGFybTY0L2xvb25nYXJjaC9yaXNjdi94ODYg
dmlhIGFjcGlfZ2V0X2NwdV91aWQoKSAod2l0aCBpbnB1dCB2YWxpZGF0aW9uKQo+IGFuZCBmaXhl
cyBBUk02NCBDUFUgc3RlZXItdGFnIHJldHJpZXZhbCBmYWlsdXJlIGluIFBDSS9UUEg6Cj4KPiAx
LTQ6IEFkZCBhY3BpX2dldF9jcHVfdWlkKCkgZm9yIGFybTY0L2xvb25nYXJjaC9yaXNjdi94ODYg
KHVwZGF0ZQo+ICAgICAgcmVzcGVjdGl2ZSB1c2VycykKPiA1OiBDZW50cmFsaXplIGFjcGlfZ2V0
X2NwdV91aWQoKSBkZWNsYXJhdGlvbiBpbiBpbmNsdWRlL2xpbnV4L2FjcGkuaAo+IDY6IENsZWFu
IHVwIHBlcmYvYXJtX2NzcG11Cj4gNzogQ2xlYW4gdXAgQUNQSS9QUFRUIGFuZCByZW1vdmUgdW51
c2VkIGdldF9hY3BpX2lkX2Zvcl9jcHUoKQo+IDg6IFBhc3MgQUNQSSBQcm9jZXNzb3IgVUlEIHRv
IENhY2hlIExvY2FsaXR5IF9EU00KPgo+IFRoZSBpbnRlcmZhY2UgcmVmYWN0b3IgZW5zdXJlcyBj
b25zaXN0ZW50IENQVSBVSUQgcmV0cmlldmFsIGFjcm9zcwo+IGFyY2hpdGVjdHVyZXMgKG5vIGZ1
bmN0aW9uYWwgY2hhbmdlcyBmb3IgdmFsaWQgaW5wdXRzKSBhbmQgcHJvdmlkZXMgdGhlCj4gdW5p
ZmllZCBpbnRlcmZhY2UgcmVxdWlyZWQgZm9yIHRoZSBBUk02NCBUUEggZml4Lgo+Cj4gLS0tCj4g
Q2hhbmdlcyBpbiB2MTA6Cj4gLSBSZWZpbmUgY29tbWl0IGhlYWRlciZsb2cgYWNjb3JkaW5nIHRv
IFB1bml0J3MgYW5kIEJqb3JuJ3MgcmV2aWV3Cj4gLSBTcGxpdCBwZXJmL2FybV9jc3BtdSBhcyBh
IHNlcGFyYXRlIGNvbW1pdCB3aGljaCBhZGRyZXNzIFB1bml0J3MKPiAgIHJldmlldwo+Cj4gQ2hh
bmdlcyBpbiB2OToKPiAtIEFkZHJlc3MgQmpvcm4ncyByZXZpZXc6IHNwbGl0IGNvbW1pdHMgdG8g
ZWFjaCBwbGF0Zm9ybSBzbyB0aGF0IG1ha2UKPiAgIHRoZW0gZWFzeSB0byByZXZpZXcKPgo+IENo
YW5nZXMgaW4gdjg6Cj4gLSBNb3ZpbmcgYXJtNjQncyBnZXRfY3B1X2Zvcl9hY3BpX2lkKCkgdG8g
a2VybmVsL2FjcGkuYyB3aGljaCBhZGRyZXNzCj4gICBKZXJlbXkncyByZXZpZXcKPgo+IENoZW5n
d2VuIEZlbmcgKDgpOgo+ICAgYXJtNjQ6IGFjcGk6IEFkZCBhY3BpX2dldF9jcHVfdWlkKCkgZm9y
IHVuaWZpZWQgQUNQSSBDUFUgVUlEIHJldHJpZXZhbAo+ICAgTG9vbmdBcmNoOiBBZGQgYWNwaV9n
ZXRfY3B1X3VpZCgpIGZvciB1bmlmaWVkIEFDUEkgQ1BVIFVJRCByZXRyaWV2YWwKPiAgIFJJU0Mt
VjogQUNQSTogQWRkIGFjcGlfZ2V0X2NwdV91aWQoKSBmb3IgdW5pZmllZCBBQ1BJIENQVSBVSUQK
PiAgICAgcmV0cmlldmFsCj4gICB4ODYvYWNwaTogQWRkIGFjcGlfZ2V0X2NwdV91aWQoKSBmb3Ig
dW5pZmllZCBBQ1BJIENQVSBVSUQgcmV0cmlldmFsCj4gICBBQ1BJOiBDZW50cmFsaXplIGFjcGlf
Z2V0X2NwdV91aWQoKSBkZWNsYXJhdGlvbiBpbgo+ICAgICBpbmNsdWRlL2xpbnV4L2FjcGkuaAo+
ICAgcGVyZjogYXJtX2NzcG11OiBTd2l0Y2ggdG8gYWNwaV9nZXRfY3B1X3VpZCgpIGZyb20KPiAg
ICAgZ2V0X2FjcGlfaWRfZm9yX2NwdSgpCj4gICBBQ1BJOiBQUFRUOiBVc2UgYWNwaV9nZXRfY3B1
X3VpZCgpIGFuZCByZW1vdmUgZ2V0X2FjcGlfaWRfZm9yX2NwdSgpCj4gICBQQ0kvVFBIOiBQYXNz
IEFDUEkgUHJvY2Vzc29yIFVJRCB0byBDYWNoZSBMb2NhbGl0eSBfRFNNCj4KPiAgRG9jdW1lbnRh
dGlvbi9QQ0kvdHBoLnJzdCAgICAgICAgICB8ICA0ICstLQo+ICBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2FjcGkuaCAgICAgIHwgMTcgKy0tLS0tLS0tLQo+ICBhcmNoL2FybTY0L2tlcm5lbC9hY3Bp
LmMgICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvbG9vbmdhcmNoL2lu
Y2x1ZGUvYXNtL2FjcGkuaCAgfCAgNSAtLS0KPiAgYXJjaC9sb29uZ2FyY2gva2VybmVsL2FjcGku
YyAgICAgICB8ICA5ICsrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCAgICAg
IHwgIDQgLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyAgICAgICAgICAgfCAxNiArKysr
KysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2FjcGlfbnVtYS5jICAgICAgfCAgOSArKysrLS0K
PiAgYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1LmggICAgICAgICB8ICAxIC0KPiAgYXJjaC94ODYv
aW5jbHVkZS9hc20vc21wLmggICAgICAgICB8ICAxIC0KPiAgYXJjaC94ODYva2VybmVsL2FjcGkv
Ym9vdC5jICAgICAgICB8IDIwICsrKysrKysrKysrKwo+ICBhcmNoL3g4Ni94ZW4vZW5saWdodGVu
X2h2bS5jICAgICAgIHwgIDUgKy0tCj4gIGRyaXZlcnMvYWNwaS9wcHR0LmMgICAgICAgICAgICAg
ICAgfCA1MCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgZHJpdmVycy9hY3BpL3Jp
c2N2L3JoY3QuYyAgICAgICAgICB8ICA3ICsrKystCj4gIGRyaXZlcnMvcGNpL3RwaC5jICAgICAg
ICAgICAgICAgICAgfCAxNiArKysrKysrLS0tCj4gIGRyaXZlcnMvcGVyZi9hcm1fY3NwbXUvYXJt
X2NzcG11LmMgfCAgNiArKy0tCj4gIGluY2x1ZGUvbGludXgvYWNwaS5oICAgICAgICAgICAgICAg
fCAxMSArKysrKysrCj4gIGluY2x1ZGUvbGludXgvcGNpLXRwaC5oICAgICAgICAgICAgfCAgNCAr
LS0KPiAgMTggZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygt
KQo+Cj4gLS0KCkl0IGRvZXNuJ3QgbG9vayBsaWtlIGFueW9uZSBoYXMgYSBwYXJ0aWN1bGFyIGhl
YXJ0YnVybiByZWxhdGVkIHRvIHRoaXMKc2VyaWVzLCBzbyBJIGNvdWxkIGFwcGx5IGl0IGluIHBy
aW5jaXBsZSwgYnV0IEknZCBhcHByZWNpYXRlIHNvbWUgQUNLcwpmcm9tIGFyY2ggbWFpbnRhaW5l
cnMuCgpXaHkgZG9uJ3QgeW91IHJlc2VuZCBpdCB3aXRoIGFsbCBvZiB0aGUgdGFncyBjb2xsZWN0
ZWQgc28gZmFyIChhbmQKcGxlYXNlIGFkZCB4ODZAa2VybmVsLm9yZyB0byB0aGUgQ0MgbGlzdCk/
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
