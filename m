Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD3BD35159
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boUKpSSJB1bv5TVsNSqx0egG7TZKiUm8p2yVtZnfK6M=; b=y74nzMvN5/Uphz
	W+VB8udxdPXo0vtqzZpuhN58F4L00U6SuGBomMEZ8zKWZk+O+up7OKUrizNAvVC0qtcgC0TVTkc84
	xcv6eBA/q0NDUrWwG+GJuMv2nlFKZT3VnW7w+RrVazqO8idCmXM1sbValiXoojUZddYeU6W3ssShl
	W074EqGDaV7OqSzdMxZoSDHzLhT7rX58m68tZIlnn+yLH9uqget7pke8qMPX4Nb32oyzPsG2S9C+w
	eoXdHIqlHiV8KZlaoqQ2AcfKTx97epb1cZgQYHAXs6fZAIsQ+IDrBGX+BnH/122k301Nkcg83wXnA
	HUmqLWSN50mzCvYpz6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qqq-0000000EJKp-0qpY;
	Wed, 01 Apr 2026 08:23:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qqo-0000000EJKg-1CtV;
	Wed, 01 Apr 2026 08:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MTNaVMsdonTBgQUg0Ejtg6uI8JOpWHbQuBn8i2Muytk=; b=WIHGR7WXawXcOQfz8rStjnsG7Y
	KVh5jVxM1vURBpt8PbPPH2E3urrZ9D/tSaGE4RWFHBTo0dHtMOHaTbtAi1j3V0CRJI8ABRBOpW8aF
	OnRciznnYS4SmcXzjrV4jot7NGt6aW0FvK+oP3JaoOEMqgAn/Zji6yvsi3pMbaAz3oVe7yRdu44CR
	AZvWrUJOamZVf5ld2a4BIhXfCe/WBLsjA7Khn1zH8VJtd+lcxb8jGYth84nHVIBPPKWczVCAc5bcM
	DzGs7Z0We3869wZaN2j0qo/g4N9iTA3ebTL5p2xpt76+FdnULMN1jgo9WRcL3G4NKc7t9GXg4hP0B
	ofiAWOzA==;
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qqk-0000000HQ7m-36Kz;
	Wed, 01 Apr 2026 08:22:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MTNaVMsdonTBgQUg0Ejtg6uI8JOpWHbQuBn8i2Muytk=;
	b=zfVqdZWZzivpJLTuZeEYbETVgUbpjxcc6vmJiz9VmBmGK7+p3ocbi7KhRl4SW1imGIWS+H+/S
	GEL7RNT6jhEzLuaPxUUhmMIjHBiCm2o5aipjEt5QgHPSsV8YAFhEn4y9speX8o0Hs3CLk5Jp28M
	LXlEaI+zkFwl4t8bQIqGT9w=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4flyW63nb4z1K9VW;
	Wed,  1 Apr 2026 16:16:34 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 071664056C;
	Wed,  1 Apr 2026 16:22:42 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 1 Apr 2026 16:22:40 +0800
Message-ID: <504b43e1-fa7d-4694-b8af-fe4975823db3@huawei.com>
Date: Wed, 1 Apr 2026 16:22:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/8] ACPI: Unify CPU UID interface and fix ARM64 TPH
 steer-tag issue
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260320031737.35048-1-fengchengwen@huawei.com>
 <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_092255_583682_2356BD8C 
X-CRM114-Status: GOOD (  14.64  )
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

T24gMy8zMS8yMDI2IDg6MjQgUE0sIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+IE9uIEZyaSwg
TWFyIDIwLCAyMDI2IGF0IDQ6MTfigK9BTSBDaGVuZ3dlbiBGZW5nIDxmZW5nY2hlbmd3ZW5AaHVh
d2VpLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoaXMgcGF0Y2hzZXQgdW5pZmllcyBBQ1BJIFByb2Nlc3Nv
ciBVSUQgcmV0cmlldmFsIGFjcm9zcwo+PiBhcm02NC9sb29uZ2FyY2gvcmlzY3YveDg2IHZpYSBh
Y3BpX2dldF9jcHVfdWlkKCkgKHdpdGggaW5wdXQgdmFsaWRhdGlvbikKPj4gYW5kIGZpeGVzIEFS
TTY0IENQVSBzdGVlci10YWcgcmV0cmlldmFsIGZhaWx1cmUgaW4gUENJL1RQSDoKPj4KPj4gMS00
OiBBZGQgYWNwaV9nZXRfY3B1X3VpZCgpIGZvciBhcm02NC9sb29uZ2FyY2gvcmlzY3YveDg2ICh1
cGRhdGUKPj4gICAgICByZXNwZWN0aXZlIHVzZXJzKQo+PiA1OiBDZW50cmFsaXplIGFjcGlfZ2V0
X2NwdV91aWQoKSBkZWNsYXJhdGlvbiBpbiBpbmNsdWRlL2xpbnV4L2FjcGkuaAo+PiA2OiBDbGVh
biB1cCBwZXJmL2FybV9jc3BtdQo+PiA3OiBDbGVhbiB1cCBBQ1BJL1BQVFQgYW5kIHJlbW92ZSB1
bnVzZWQgZ2V0X2FjcGlfaWRfZm9yX2NwdSgpCj4+IDg6IFBhc3MgQUNQSSBQcm9jZXNzb3IgVUlE
IHRvIENhY2hlIExvY2FsaXR5IF9EU00KPj4KPj4gVGhlIGludGVyZmFjZSByZWZhY3RvciBlbnN1
cmVzIGNvbnNpc3RlbnQgQ1BVIFVJRCByZXRyaWV2YWwgYWNyb3NzCj4+IGFyY2hpdGVjdHVyZXMg
KG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBmb3IgdmFsaWQgaW5wdXRzKSBhbmQgcHJvdmlkZXMgdGhl
Cj4+IHVuaWZpZWQgaW50ZXJmYWNlIHJlcXVpcmVkIGZvciB0aGUgQVJNNjQgVFBIIGZpeC4KPj4K
Pj4gLS0tCj4+IENoYW5nZXMgaW4gdjEwOgo+PiAtIFJlZmluZSBjb21taXQgaGVhZGVyJmxvZyBh
Y2NvcmRpbmcgdG8gUHVuaXQncyBhbmQgQmpvcm4ncyByZXZpZXcKPj4gLSBTcGxpdCBwZXJmL2Fy
bV9jc3BtdSBhcyBhIHNlcGFyYXRlIGNvbW1pdCB3aGljaCBhZGRyZXNzIFB1bml0J3MKPj4gICBy
ZXZpZXcKPj4KPj4gQ2hhbmdlcyBpbiB2OToKPj4gLSBBZGRyZXNzIEJqb3JuJ3MgcmV2aWV3OiBz
cGxpdCBjb21taXRzIHRvIGVhY2ggcGxhdGZvcm0gc28gdGhhdCBtYWtlCj4+ICAgdGhlbSBlYXN5
IHRvIHJldmlldwo+Pgo+PiBDaGFuZ2VzIGluIHY4Ogo+PiAtIE1vdmluZyBhcm02NCdzIGdldF9j
cHVfZm9yX2FjcGlfaWQoKSB0byBrZXJuZWwvYWNwaS5jIHdoaWNoIGFkZHJlc3MKPj4gICBKZXJl
bXkncyByZXZpZXcKPj4KPj4gQ2hlbmd3ZW4gRmVuZyAoOCk6Cj4+ICAgYXJtNjQ6IGFjcGk6IEFk
ZCBhY3BpX2dldF9jcHVfdWlkKCkgZm9yIHVuaWZpZWQgQUNQSSBDUFUgVUlEIHJldHJpZXZhbAo+
PiAgIExvb25nQXJjaDogQWRkIGFjcGlfZ2V0X2NwdV91aWQoKSBmb3IgdW5pZmllZCBBQ1BJIENQ
VSBVSUQgcmV0cmlldmFsCj4+ICAgUklTQy1WOiBBQ1BJOiBBZGQgYWNwaV9nZXRfY3B1X3VpZCgp
IGZvciB1bmlmaWVkIEFDUEkgQ1BVIFVJRAo+PiAgICAgcmV0cmlldmFsCj4+ICAgeDg2L2FjcGk6
IEFkZCBhY3BpX2dldF9jcHVfdWlkKCkgZm9yIHVuaWZpZWQgQUNQSSBDUFUgVUlEIHJldHJpZXZh
bAo+PiAgIEFDUEk6IENlbnRyYWxpemUgYWNwaV9nZXRfY3B1X3VpZCgpIGRlY2xhcmF0aW9uIGlu
Cj4+ICAgICBpbmNsdWRlL2xpbnV4L2FjcGkuaAo+PiAgIHBlcmY6IGFybV9jc3BtdTogU3dpdGNo
IHRvIGFjcGlfZ2V0X2NwdV91aWQoKSBmcm9tCj4+ICAgICBnZXRfYWNwaV9pZF9mb3JfY3B1KCkK
Pj4gICBBQ1BJOiBQUFRUOiBVc2UgYWNwaV9nZXRfY3B1X3VpZCgpIGFuZCByZW1vdmUgZ2V0X2Fj
cGlfaWRfZm9yX2NwdSgpCj4+ICAgUENJL1RQSDogUGFzcyBBQ1BJIFByb2Nlc3NvciBVSUQgdG8g
Q2FjaGUgTG9jYWxpdHkgX0RTTQo+Pgo+PiAgRG9jdW1lbnRhdGlvbi9QQ0kvdHBoLnJzdCAgICAg
ICAgICB8ICA0ICstLQo+PiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hY3BpLmggICAgICB8IDE3
ICstLS0tLS0tLS0KPj4gIGFyY2gvYXJtNjQva2VybmVsL2FjcGkuYyAgICAgICAgICAgfCAzMCAr
KysrKysrKysrKysrKysrKysKPj4gIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2FjcGkuaCAg
fCAgNSAtLS0KPj4gIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC9hY3BpLmMgICAgICAgfCAgOSArKysr
KysKPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oICAgICAgfCAgNCAtLS0KPj4gIGFy
Y2gvcmlzY3Yva2VybmVsL2FjcGkuYyAgICAgICAgICAgfCAxNiArKysrKysrKysrCj4+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9hY3BpX251bWEuYyAgICAgIHwgIDkgKysrKy0tCj4+ICBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS9jcHUuaCAgICAgICAgIHwgIDEgLQo+PiAgYXJjaC94ODYvaW5jbHVkZS9hc20v
c21wLmggICAgICAgICB8ICAxIC0KPj4gIGFyY2gveDg2L2tlcm5lbC9hY3BpL2Jvb3QuYyAgICAg
ICAgfCAyMCArKysrKysrKysrKysKPj4gIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgICAg
ICAgfCAgNSArLS0KPj4gIGRyaXZlcnMvYWNwaS9wcHR0LmMgICAgICAgICAgICAgICAgfCA1MCAr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9yaGN0
LmMgICAgICAgICAgfCAgNyArKysrLQo+PiAgZHJpdmVycy9wY2kvdHBoLmMgICAgICAgICAgICAg
ICAgICB8IDE2ICsrKysrKystLS0KPj4gIGRyaXZlcnMvcGVyZi9hcm1fY3NwbXUvYXJtX2NzcG11
LmMgfCAgNiArKy0tCj4+ICBpbmNsdWRlL2xpbnV4L2FjcGkuaCAgICAgICAgICAgICAgIHwgMTEg
KysrKysrKwo+PiAgaW5jbHVkZS9saW51eC9wY2ktdHBoLmggICAgICAgICAgICB8ICA0ICstLQo+
PiAgMTggZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQo+
Pgo+PiAtLQo+IAo+IEl0IGRvZXNuJ3QgbG9vayBsaWtlIGFueW9uZSBoYXMgYSBwYXJ0aWN1bGFy
IGhlYXJ0YnVybiByZWxhdGVkIHRvIHRoaXMKPiBzZXJpZXMsIHNvIEkgY291bGQgYXBwbHkgaXQg
aW4gcHJpbmNpcGxlLCBidXQgSSdkIGFwcHJlY2lhdGUgc29tZSBBQ0tzCj4gZnJvbSBhcmNoIG1h
aW50YWluZXJzLgo+IAo+IFdoeSBkb24ndCB5b3UgcmVzZW5kIGl0IHdpdGggYWxsIG9mIHRoZSB0
YWdzIGNvbGxlY3RlZCBzbyBmYXIgKGFuZAo+IHBsZWFzZSBhZGQgeDg2QGtlcm5lbC5vcmcgdG8g
dGhlIENDIGxpc3QpPwoKZG9uZSBmb3IgcmVzZW5kIHYxMCB3aGljaCB3aXRoIGFsbCB0aGUgcmV2
aWV3L2FjayB0YWcsIGFkZCBhZGQgeDg2QGtlcm5lbC5vcmcgdG8gQ0MgbGlzdAoKVGhhbmtzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
