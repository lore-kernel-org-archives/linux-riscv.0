Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C78F46C47
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0Zd04gOH6X7QZ66oL+atnVJiMSh/CbRxfrPRaAYNiA=; b=WTqCB2rB6wMRa+
	7G+UkKnIA6VubaLMpVsynmElR4Uleeu020DiyNV7/DwlerdjXHgDvg1xKwsPVsrGnBtmRk0leJZSr
	Y7YeRa2QzVvIt17Ni3Cu6xg4TlEnahaeXqsQuLQVqjNocSyrx79ztgJJzoyEHLVKlHBy3E8xP7MG1
	qBqWKuYKM/+InUsM2nxNmZ73BVczh4xbKbf1/NEQO2qhJBEjI1bcLnsQFjVXuBAtkrC3gL7MAiGxl
	Dpoe2LtotXHWQH4T/qg/1y3jxi4Bb1y28NVFj8Jwcz/JyEVw8VZvnbRR39OxqXob2qYcLBGczEOWV
	yi6pEhebUvGyiCwYTjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lQ8-00000005ERG-0Sul;
	Mon, 06 Apr 2026 14:59:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lQ5-00000005EQR-0XE7
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 14:59:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4B784456A
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 14:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E11C4AF0C
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775487555;
	bh=xQ7o66TtbbwulQnJW5l2ZtOfYQA79hhGSfn9VhPlO6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MLkaENd1y02jG6YsphOhuZTp0iQI96L6WFY5DEmo/DZ6WCfvoSBDZJV2ohYZSu1N9
	 ac4WV6CKVr3vtjWO5PyYEkAdXK0hp0G+RobW161z0dcu3s/VU0gY22kCs+MYXqUHBH
	 Liz1EHAuKjE4fTRx4+YsiI+t4vTTDKeLdDI2YZy0dAHG/YzL3nR/Rt8+yoiTCr6Y7R
	 31IDqYUjMqFbupJ1fx/4xFWsQpHeFVPqQZdMM9fWEudaIkvMRtjafaQw7H2b7xvoYg
	 xYFQlwgI/yUaOmD2NLJlqgiOeQ45VmSMD64YK+4sRFnv7nXs5NX2dbzF574dvLBFqO
	 XtniXv49RXROw==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-46fc5b8a068so728944b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 07:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4n7cj73kZoSukB3W8lpMAaxeGGYdvydjX72HQ8pYa+VZ1JhcvmmmhaJzzBi0ZnWxHo69pjzpRc4ZdQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO0y/dwXIHDmpL/CHWm+VIYTHwkRvMs23RyZjWaZlkd2MLmH2+
	OErcuHftJyCZv+UyCVMEKAGMq7cK817iRniQ6oGy+OsAnwCHa44FPsALYKsKwhjzMvNwYH0vuC3
	f01PLUNBIx7aQ3aqlcROsGeHcWfugtT0=
X-Received: by 2002:a05:6808:1910:b0:468:776:1ead with SMTP id
 5614622812f47-46ef5af739fmr6450744b6e.21.1775487554002; Mon, 06 Apr 2026
 07:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260401081640.26875-1-fengchengwen@huawei.com>
In-Reply-To: <20260401081640.26875-1-fengchengwen@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 6 Apr 2026 16:58:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gE9jLbaGy0yJhNZdpQJTR9stE-ABNQVvP5jqss3LQpFw@mail.gmail.com>
X-Gm-Features: AQROBzDy996ma1a9twY_5lJC3Avr9hchzSyUdEAhSG92k1NHCBaaPp2eIIIoft4
Message-ID: <CAJZ5v0gE9jLbaGy0yJhNZdpQJTR9stE-ABNQVvP5jqss3LQpFw@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 0/8] ACPI: Unify CPU UID interface and fix
 ARM64 TPH steer-tag issue
To: Chengwen Feng <fengchengwen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_075917_212428_1BDDFA6B 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J . Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Yanteng Si <si.yanteng@linux.dev>, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Thomas Gleixner <tglx@kernel.org>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCAxMDoxNuKAr0FNIENoZW5nd2VuIEZlbmcgPGZlbmdjaGVu
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
ZmllZCBpbnRlcmZhY2UgcmVxdWlyZWQgZm9yIHRoZSBBUk02NCBUUEggZml4Cj4KPiAtLS0KPiBD
aGFuZ2VzIGluIHYxMC1yZXNlbmQ6Cj4gLSBBZGQgQ2F0YWxpbidzIGFjay1ieSBmb3IgYXJtNjQg
Y29tbWl0Cj4gLSBBZGQgQ0MgdG8geDg2QGtlcm5lbC5vcmcKPgo+IENoYW5nZXMgaW4gdjEwOgo+
IC0gUmVmaW5lIGNvbW1pdCBoZWFkZXImbG9nIGFjY29yZGluZyB0byBQdW5pdCdzIGFuZCBCam9y
bidzIHJldmlldwo+IC0gU3BsaXQgcGVyZi9hcm1fY3NwbXUgYXMgYSBzZXBhcmF0ZSBjb21taXQg
d2hpY2ggYWRkcmVzcyBQdW5pdCdzCj4gICByZXZpZXcKPgo+IENoYW5nZXMgaW4gdjk6Cj4gLSBB
ZGRyZXNzIEJqb3JuJ3MgcmV2aWV3OiBzcGxpdCBjb21taXRzIHRvIGVhY2ggcGxhdGZvcm0gc28g
dGhhdCBtYWtlCj4gICB0aGVtIGVhc3kgdG8gcmV2aWV3Cj4KPiBDaGFuZ2VzIGluIHY4Ogo+IC0g
TW92aW5nIGFybTY0J3MgZ2V0X2NwdV9mb3JfYWNwaV9pZCgpIHRvIGtlcm5lbC9hY3BpLmMgd2hp
Y2ggYWRkcmVzcwo+ICAgSmVyZW15J3MgcmV2aWV3Cj4KPiBDaGVuZ3dlbiBGZW5nICg4KToKPiAg
IGFybTY0OiBhY3BpOiBBZGQgYWNwaV9nZXRfY3B1X3VpZCgpIGZvciB1bmlmaWVkIEFDUEkgQ1BV
IFVJRCByZXRyaWV2YWwKPiAgIExvb25nQXJjaDogQWRkIGFjcGlfZ2V0X2NwdV91aWQoKSBmb3Ig
dW5pZmllZCBBQ1BJIENQVSBVSUQgcmV0cmlldmFsCj4gICBSSVNDLVY6IEFDUEk6IEFkZCBhY3Bp
X2dldF9jcHVfdWlkKCkgZm9yIHVuaWZpZWQgQUNQSSBDUFUgVUlECj4gICAgIHJldHJpZXZhbAo+
ICAgeDg2L2FjcGk6IEFkZCBhY3BpX2dldF9jcHVfdWlkKCkgZm9yIHVuaWZpZWQgQUNQSSBDUFUg
VUlEIHJldHJpZXZhbAo+ICAgQUNQSTogQ2VudHJhbGl6ZSBhY3BpX2dldF9jcHVfdWlkKCkgZGVj
bGFyYXRpb24gaW4KPiAgICAgaW5jbHVkZS9saW51eC9hY3BpLmgKPiAgIHBlcmY6IGFybV9jc3Bt
dTogU3dpdGNoIHRvIGFjcGlfZ2V0X2NwdV91aWQoKSBmcm9tCj4gICAgIGdldF9hY3BpX2lkX2Zv
cl9jcHUoKQo+ICAgQUNQSTogUFBUVDogVXNlIGFjcGlfZ2V0X2NwdV91aWQoKSBhbmQgcmVtb3Zl
IGdldF9hY3BpX2lkX2Zvcl9jcHUoKQo+ICAgUENJL1RQSDogUGFzcyBBQ1BJIFByb2Nlc3NvciBV
SUQgdG8gQ2FjaGUgTG9jYWxpdHkgX0RTTQo+Cj4gIERvY3VtZW50YXRpb24vUENJL3RwaC5yc3Qg
ICAgICAgICAgfCAgNCArLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hY3BpLmggICAgICB8
IDE3ICstLS0tLS0tLS0KPiAgYXJjaC9hcm02NC9rZXJuZWwvYWNwaS5jICAgICAgICAgICB8IDMw
ICsrKysrKysrKysrKysrKysrKwo+ICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9hY3BpLmgg
IHwgIDUgLS0tCj4gIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC9hY3BpLmMgICAgICAgfCAgOSArKysr
KysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmggICAgICB8ICA0IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9hY3BpLmMgICAgICAgICAgIHwgMTYgKysrKysrKysrKwo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9hY3BpX251bWEuYyAgICAgIHwgIDkgKysrKy0tCj4gIGFyY2gveDg2L2luY2x1
ZGUvYXNtL2NwdS5oICAgICAgICAgfCAgMSAtCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NtcC5o
ICAgICAgICAgfCAgMSAtCj4gIGFyY2gveDg2L2tlcm5lbC9hY3BpL2Jvb3QuYyAgICAgICAgfCAy
MCArKysrKysrKysrKysKPiAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYyAgICAgICB8ICA1
ICstLQo+ICBkcml2ZXJzL2FjcGkvcHB0dC5jICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9yaGN0LmMgICAgICAg
ICAgfCAgNyArKysrLQo+ICBkcml2ZXJzL3BjaS90cGguYyAgICAgICAgICAgICAgICAgIHwgMTYg
KysrKysrKy0tLQo+ICBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5jIHwgIDYgKyst
LQo+ICBpbmNsdWRlL2xpbnV4L2FjcGkuaCAgICAgICAgICAgICAgIHwgMTEgKysrKysrKwo+ICBp
bmNsdWRlL2xpbnV4L3BjaS10cGguaCAgICAgICAgICAgIHwgIDQgKy0tCj4gIDE4IGZpbGVzIGNo
YW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkKPgo+IC0tCgpBcHBsaWVk
IGFzIDcuMSBtYXRlcmlhbCwgYnV0IHBsZWFzZSBub3RlIHRoYXQgSSBoYXZlbid0IHRhZ2dlZCBp
dApleHBsaWNpdGx5IGZvciAic3RhYmxlIi4KClRoZSBsYXN0IHBhdGNoIGNhcnJpZXMgYSBGaXhl
czogdGFnIHdoaWNoIHNob3VsZCBiZSBzdWl0YWJsZSBmb3IKInN0YWJsZSIgdG8gcGljayBpdCB1
cCBhbmQgeW91IG1heSBhcyB3ZWxsIHJlcXVlc3QgdGhlIHdob2xlIHNlcmllcyB0bwpiZSBwaWNr
ZWQgdXAgYnkgInN0YWJsZSIgd2hlbiBpdCBoaXRzIHRoZSBtYWlubGluZS4KClRoYW5rcyEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
