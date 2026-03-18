Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2528BFCD0A7
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 04:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUnIumphzvOx8mwG7Wi8JSToT0G/O5SKtfOiRP7Yj3k=; b=lMva/k5qCDFhXu
	k4SckCzc5c74XxhWYgoLeRIW2graW4lMC3TJY6ZAfd4/ND1RfZ0uILJS+utA5OHpyk8Rpf1ij5N9/
	JwwPeWeuf8hm64+nYGxsYm0mG3JBPpDO8GYzKabYhTaQ4O7aSCh65fhcsz/hiBQO3/hkxUnNHSeMb
	T7I4Vr7y6nx0vmk+mbcxdTWOj2gSKg5rCz50l4MlbvsQczJYbzIEFGqUXhINXBpFPLN8qIjr6RJxI
	ec7wLg99Q5uj6SGWzFiDPEMI7KUpdKK4YDMsYxbWtalJY6BgAQPrWuSnIfStcGZfYaEv74a2K027f
	Et41umXwXLXTPCF9Z8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2i9L-00000007k3K-3SJj;
	Wed, 18 Mar 2026 04:04:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2i9I-00000007k2F-1kEf;
	Wed, 18 Mar 2026 04:04:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XZKg5HSzqw961TE78Y1nHw4DDOpQ3KVITP3+xW3FZMU=;
	b=tgKSLKH3FRXeuZflU+YmXS6o6Nivgvm0hUbiV+64ojQwdlRuj748sRRNImMTKVJ0zSqQ4mFD9
	vyWfROqFApjH8PJl/yObRR3ZUwmsw9hG0AiTaunIlNM5kOdnbqS/nXO8pxQZ0gDOyc2ERqq/FSD
	tUkS7f1ubwBj8AMZrIXLpUM=
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fbFYv3j7Xz1BFSt;
	Wed, 18 Mar 2026 12:03:47 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XZKg5HSzqw961TE78Y1nHw4DDOpQ3KVITP3+xW3FZMU=;
	b=tgKSLKH3FRXeuZflU+YmXS6o6Nivgvm0hUbiV+64ojQwdlRuj748sRRNImMTKVJ0zSqQ4mFD9
	vyWfROqFApjH8PJl/yObRR3ZUwmsw9hG0AiTaunIlNM5kOdnbqS/nXO8pxQZ0gDOyc2ERqq/FSD
	tUkS7f1ubwBj8AMZrIXLpUM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fbFSC5sDgzpTMG;
	Wed, 18 Mar 2026 11:58:51 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 19BFD40569;
	Wed, 18 Mar 2026 12:04:15 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Mar 2026 12:04:14 +0800
Message-ID: <0744ee77-78ee-4e3d-9f0d-e8fe44be1c28@huawei.com>
Date: Wed, 18 Mar 2026 12:04:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] ACPI: Refactor get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
From: fengchengwen <fengchengwen@huawei.com>
To: Jeremy Linton <jeremy.linton@arm.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>
CC: <punit.agrawal@oss.qualcomm.com>, <guohanjun@huawei.com>,
	<suzuki.poulose@arm.com>, <ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>,
	<masahiroy@kernel.org>, <wangyuquan1236@phytium.com.cn>,
	<anshuman.khandual@arm.com>, <heinrich.schuchardt@canonical.com>,
	<Eric.VanTassell@amd.com>, <jonathan.cameron@huawei.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <linux-pci@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <xen-devel@lists.xenproject.org>,
	<linux-acpi@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20260313022144.40942-1-fengchengwen@huawei.com>
 <20260313022144.40942-2-fengchengwen@huawei.com>
 <e4b0aefa-7108-47b4-ad5d-d62d385b8f33@arm.com>
 <c9eb7f53-db46-4229-b9ef-8faa1138aca7@huawei.com>
Content-Language: en-US
In-Reply-To: <c9eb7f53-db46-4229-b9ef-8faa1138aca7@huawei.com>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_210448_789307_39C4FF97 
X-CRM114-Status: GOOD (  28.75  )
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

U29ycnkgdG8gc2VsZi1yZXBseQoKT24gMy8xOC8yMDI2IDEwOjAyIEFNLCBmZW5nY2hlbmd3ZW4g
d3JvdGU6Cj4gSGksCj4gCj4gT24gMy8xOC8yMDI2IDU6MzggQU0sIEplcmVteSBMaW50b24gd3Jv
dGU6Cj4+IEhpLAo+Pgo+PiBMZXRzIHRyeSB0aGlzIGFnYWluLCBzaW5jZSB0aGUgbGFzdCBvbmUg
bG9va3MgbGlrZSBpdCBnb3QgY2F1Z2h0IGluIHRoZSBtb2RlcmF0aW9uIHN5c3RlbSBhbmQgd2Fz
bid0IHF1aXRlIHJpZ2h0IGFueXdheS4KPj4KPj4gT24gMy8xMi8yNiA5OjIxIFBNLCBDaGVuZ3dl
biBGZW5nIHdyb3RlOgo+Pj4gVW5pZnkgQ1BVIEFDUEkgSUQgcmV0cmlldmFsIGludGVyZmFjZSBh
Y3Jvc3MgYXJjaGl0ZWN0dXJlcyBieQo+Pj4gcmVmYWN0b3JpbmcgZ2V0X2FjcGlfaWRfZm9yX2Nw
dSgpIHRvIGFjcGlfZ2V0X2NwdV91aWQoKSBvbgo+Pj4gYXJtNjQvcmlzY3YvbG9vbmdhcmNoOgo+
Pj4gLSBBZGQgaW5wdXQgcGFyYW1ldGVyIHZhbGlkYXRpb24KPj4+IC0gQWRqdXN0IGludGVyZmFj
ZSB0byBpbnQgYWNwaV9nZXRfY3B1X3VpZCh1bnNpZ25lZCBpbnQgY3B1LCB1MzIgKnVpZCkKPj4+
IMKgwqAgKG9sZDogdTMyIGdldF9hY3BpX2lkX2Zvcl9jcHUodW5zaWduZWQgaW50IGNwdSksIG5v
IGlucHV0IGNoZWNrKQo+Pj4KPj4+IFRoaXMgcmVmYWN0b3JpbmcgKG5vdCBhIHB1cmUgcmVuYW1l
KSBlbmhhbmNlcyBpbnRlcmZhY2Ugcm9idXN0bmVzcyB3aGlsZQo+Pj4gcHJlcGFyaW5nIGZvciBj
b25zaXN0ZW50IEFDUEkgUHJvY2Vzc29yIFVJRCByZXRyaWV2YWwgYWNyb3NzIGFsbAo+Pj4gQUNQ
SS1lbmFibGVkIHBsYXRmb3Jtcy4gVmFsaWQgaW5wdXRzIHJldGFpbiBvcmlnaW5hbCBiZWhhdmlv
ci4KPj4+Cj4+PiBOb3RlOiBNb3ZlIHRoZSBBUk02NC1zcGVjaWZpYyBnZXRfY3B1X2Zvcl9hY3Bp
X2lkKCkgaW1wbGVtZW50YXRpb24gdG8KPj4+IMKgwqDCoMKgwqDCoCBhcmNoL2FybTY0L2tlcm5l
bC9hY3BpX251bWEuYyB0byBmaXggY29tcGlsYXRpb24gZXJyb3JzIGZyb20KPj4+IMKgwqDCoMKg
wqDCoCBjaXJjdWxhciBoZWFkZXIgZGVwZW5kZW5jaWVzIGludHJvZHVjZWQgYnkgdGhlIHJlbmFt
ZS4KPj4+Cj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hlbmd3ZW4gRmVuZyA8ZmVuZ2NoZW5nd2VuQGh1YXdlaS5jb20+Cj4+PiBSZXZpZXdlZC1ieTog
Sm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+
PiDCoCBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2FjcGkuaMKgwqDCoMKgwqAgfCAxNiArLS0tLS0t
LS0tCj4+PiDCoCBhcmNoL2FybTY0L2tlcm5lbC9hY3BpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDE2ICsrKysrKysrKysKPj4+IMKgIGFyY2gvYXJtNjQva2VybmVsL2FjcGlfbnVtYS5jwqDCoMKg
wqDCoCB8IDE0ICsrKysrKysrKwo+Pj4gwqAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vYWNw
aS5owqAgfMKgIDUgLS0tCj4+PiDCoCBhcmNoL2xvb25nYXJjaC9rZXJuZWwvYWNwaS5jwqDCoMKg
wqDCoMKgIHzCoCA5ICsrKysrKwo+Pj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmjC
oMKgwqDCoMKgIHzCoCA0IC0tLQo+Pj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAxNiArKysrKysrKysrCj4+PiDCoCBhcmNoL3Jpc2N2L2tlcm5lbC9h
Y3BpX251bWEuY8KgwqDCoMKgwqAgfMKgIDkgKysrKy0tCj4+PiDCoCBkcml2ZXJzL2FjcGkvcHB0
dC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTAgKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tCj4+PiDCoCBkcml2ZXJzL2FjcGkvcmlzY3YvcmhjdC5jwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA3ICsrKystCj4+PiDCoCBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3Bt
dS5jIHzCoCA2ICsrLS0KPj4+IMKgIGluY2x1ZGUvbGludXgvYWNwaS5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDEzICsrKysrKysrCj4+PiDCoCAxMiBmaWxlcyBjaGFuZ2VkLCAxMjIg
aW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20vYWNwaS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hY3BpLmgK
Pj4+IGluZGV4IGMwN2E1OGI5NjMyOS4uMTA2YTA4NTU2Y2JmIDEwMDY0NAo+Pj4gLS0tIGEvYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS9hY3BpLmgKPj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vYWNwaS5oCj4+PiBAQCAtMTE0LDIyICsxMTQsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgYWNw
aV9oYXNfY3B1X2luX21hZHQodm9pZCkKPj4+IMKgIH0KPj4+IMKgIMKgIHN0cnVjdCBhY3BpX21h
ZHRfZ2VuZXJpY19pbnRlcnJ1cHQgKmFjcGlfY3B1X2dldF9tYWR0X2dpY2MoaW50IGNwdSk7Cj4+
PiAtc3RhdGljIGlubGluZSB1MzIgZ2V0X2FjcGlfaWRfZm9yX2NwdSh1bnNpZ25lZCBpbnQgY3B1
KQo+Pj4gLXsKPj4+IC3CoMKgwqAgcmV0dXJuwqDCoMKgIGFjcGlfY3B1X2dldF9tYWR0X2dpY2Mo
Y3B1KS0+dWlkOwo+Pj4gLX0KPj4+IC0KPj4+IC1zdGF0aWMgaW5saW5lIGludCBnZXRfY3B1X2Zv
cl9hY3BpX2lkKHUzMiB1aWQpCj4+PiAtewo+Pj4gLcKgwqDCoCBpbnQgY3B1Owo+Pj4gLQo+Pj4g
LcKgwqDCoCBmb3IgKGNwdSA9IDA7IGNwdSA8IG5yX2NwdV9pZHM7IGNwdSsrKQo+Pj4gLcKgwqDC
oMKgwqDCoMKgIGlmIChhY3BpX2NwdV9nZXRfbWFkdF9naWNjKGNwdSkgJiYKPj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVpZCA9PSBnZXRfYWNwaV9pZF9mb3JfY3B1KGNwdSkpCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gY3B1Owo+Pj4gwqAgLcKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsKPj4+IC19Cj4+PiAraW50IGdldF9jcHVfZm9yX2FjcGlfaWQodTMyIHVpZCk7Cj4+PiDC
oCDCoCBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9maXhfcGh5c19wYWNrYWdlX2lkKGludCBudW0s
IHUzMiBzbG90KSB7IH0KPj4+IMKgIHZvaWQgX19pbml0IGFjcGlfaW5pdF9jcHVzKHZvaWQpOwo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL2FjcGkuYyBiL2FyY2gvYXJtNjQva2Vy
bmVsL2FjcGkuYwo+Pj4gaW5kZXggYWY5MDEyOGNmZWQ1Li5mMzg2NjYwNmZjNDYgMTAwNjQ0Cj4+
PiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9hY3BpLmMKPj4+ICsrKyBiL2FyY2gvYXJtNjQva2Vy
bmVsL2FjcGkuYwo+Pj4gQEAgLTQ1OCwzICs0NTgsMTkgQEAgaW50IGFjcGlfdW5tYXBfY3B1KGlu
dCBjcHUpCj4+PiDCoCB9Cj4+PiDCoCBFWFBPUlRfU1lNQk9MKGFjcGlfdW5tYXBfY3B1KTsKPj4+
IMKgICNlbmRpZiAvKiBDT05GSUdfQUNQSV9IT1RQTFVHX0NQVSAqLwo+Pj4gKwo+Pj4gK2ludCBh
Y3BpX2dldF9jcHVfdWlkKHVuc2lnbmVkIGludCBjcHUsIHUzMiAqdWlkKQo+Pj4gK3sKPj4+ICvC
oMKgwqAgc3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX2ludGVycnVwdCAqZ2ljYzsKPj4+ICsKPj4+
ICvCoMKgwqAgaWYgKGNwdSA+PSBucl9jcHVfaWRzKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlOVkFMOwo+PiBJZiB0aGlzIGFjdHVhbGx5IGhhcHBlbnMsIGl0cyBwcm9iYWJseSB1c2Vm
dWwgdG8ga25vdyBpdCB3aXRoIGEgcHJfd2Fybi9wcl93YXJuX29uY2UuPiArCj4gCj4gVGhlIGZ1
bmN0aW9uIG1heWJlIGNhbGxlZCBmcm9tIHVzZXJzcGFjZSB3aGljaCBvbiBsYXRlciByb2FkbWFw
LCBzbyBJIHByZWZlciBub3QgYWRkCj4gd2FybmluZyBvciBlcnJvciBoZXJlLgo+IEJUVzogdGhl
IGZ1bmN0aW9uIHdpbGwgcmV0dXJuIC1FSU5WQUwsIHNvIGNhbGxlciBjb3VsZCBrbm93IHRoZSBj
YXNlLgo+IAo+Pj4gK8KgwqDCoCBnaWNjID0gYWNwaV9jcHVfZ2V0X21hZHRfZ2ljYyhjcHUpOwo+
Pj4gK8KgwqDCoCBpZiAoIWdpY2MpCj4+IEkgdGhpbmsgdGhpcyBjaGVjayBpcyByZWR1bmRhbnQg
YmVjYXVzZSB3ZSBjYW4ndCBoYXZlIGxvZ2ljYWwgY3B1J3MgdGhhdCBhcmVuJ3QgaW4gdGhlIGNw
dV9wb3NzaWJsZSgpIGxpc3QsIHdoaWNoIG9uIGFybTY0IGRvZXNuJ3QgQUZBSUsgaGF2ZSBob2xl
cy4gSW4gdGhlIHBhc3QgdGhpcyBtaWdodCBoYXZlIG1hZGUgc2Vuc2UgaWYgd2Ugd2VyZW4ndCBt
YWludGFpbmluZyBhIGNvcHkgb2YgdGhlIGdpY2Mgc3RydWN0dXJlIGZyb20gdGhlIE1BRFQgZm9y
IGVhY2ggY29yZS4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPiAKPiBUaGlzIGNv
bW1pdCB3aWxsIGJhY2twb3J0IHRvIHN0YWJsZSBicmFuY2ggYXQgbGVhc3QgNi42LiBTbyBJIHRo
aW5rIGl0J3MgT0sgdG8ga2VlcCBpdC4KPiAKPj4+ICsKPj4+ICvCoMKgwqAgKnVpZCA9IGdpY2Mt
PnVpZDsKPj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+PiArfQo+Pj4gK0VYUE9SVF9TWU1CT0xfR1BM
KGFjcGlfZ2V0X2NwdV91aWQpOwo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL2Fj
cGlfbnVtYS5jIGIvYXJjaC9hcm02NC9rZXJuZWwvYWNwaV9udW1hLmMKPj4+IGluZGV4IDI0NjVm
MjkxYzdlMS4uNDFkMWU0NmE0MzM4IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwv
YWNwaV9udW1hLmMKPj4+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL2FjcGlfbnVtYS5jCj4+PiBA
QCAtMzQsNiArMzQsMjAgQEAgaW50IF9faW5pdCBhY3BpX251bWFfZ2V0X25pZCh1bnNpZ25lZCBp
bnQgY3B1KQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gYWNwaV9lYXJseV9ub2RlX21hcFtjcHVdOwo+
Pj4gwqAgfQo+Pj4gwqAgK2ludCBnZXRfY3B1X2Zvcl9hY3BpX2lkKHUzMiB1aWQpCj4+PiArewo+
Pj4gK8KgwqDCoCB1MzIgY3B1X3VpZDsKPj4+ICvCoMKgwqAgaW50IHJldDsKPj4+ICsKPj4+ICvC
oMKgwqAgZm9yIChpbnQgY3B1ID0gMDsgY3B1IDwgbnJfY3B1X2lkczsgY3B1KyspIHsKPj4+ICvC
oMKgwqDCoMKgwqDCoCByZXQgPSBhY3BpX2dldF9jcHVfdWlkKGNwdSwgJmNwdV91aWQpOwo+PiBU
aGlzIG1pZ2h0IGhhdmUgYmVlbiBhIHNpbXBsaWZpY2F0aW9uLCBidXQgc2luY2Ugd2UgYXJlIGJh
c2ljYWxseSBkb2luZyBhIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIGFuZCBldmVyeSBwb3Nz
aWJsZSBjcHUgd2lsbCBoYXZlIGEgR0lDQyBlbnRyeSBiZWZvcmUgaXQgYmVjb21lcyAncG9zc2li
bGUnIHRoZXJlIHdpbGwgYmUgYSBVSUQsIHNvIGFsbCB0aGUgZXJyb3IgY2hlY2tpbmcgQUZBSUss
IGlzIGltcG9zc2libGUgaGVyZS4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0ID09IDAgJiYgdWlk
ID09IGNwdV91aWQpCj4gCj4gSSBwcmVmZXIgdG8ga2VlcCB0aGUgY3VycmVudCBpbXBsLCBhcyBp
dCBtYXkgY2F0Y2ggZnV0dXJlIGVycm9yLgo+IAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGNwdTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4gLUVJTlZB
TDsKPj4+ICt9Cj4+PiArCj4+IEkgYWxzbyBtb3ZlZCB0aGlzIGJlbG93IGFjcGlfZ2V0X2NwdV91
aWQoKSBpbiBhY3BpLmMgYW5kIEkgZG9uJ3Qgc2VlIHRoZSBhIGZvcndhcmQgZXJyb3IgaXNzdWUg
eW91IG1lbnRpb25lZC4gSXQgc2VlbXMgdG8gbWUgdGhhdCB0aGV5IHNob3VsZCBiZSBrZXB0IGNs
b3NlIHRvIGVhY2ggb3RoZXIgc2luY2UgdGhleSBhcmUgYmFzaWNhbGx5IGludmVyc2VzIG9mIGVh
Y2ggb3RoZXIuCj4gCj4gQXMgbG9uZyBhcyB5b3UgZW5zdXJlIHRoYXQgaXQgaXMgbm90IHBsYWNl
ZCBpbiBhc20vYWNwaS5oLCB0aGF0J3MgZmluZS4KPiBTbyBpdCdzIE9LIHRvIG1vdmUgdGhpcyBm
dW5jdGlvbiB0byBhY3BpLmMKPiAKPiBCdXQgSSBqdXN0IGNoZWNrZWQgdGhlIGNhbGxlcnMgb2Yg
dGhpcyBmdW5jdGlvbiBhZ2FpbiBhbmQgZm91bmQgdGhhdCB0aGVyZSBhcmUKPiBhbGwgaW4gYWNw
aV9udW1hLmMsIHNvIEkgd2lsbCBub3cgYWRkIHRoZSBzdGF0aWMga2V5d29yZCB0byB0aGlzIGZ1
bmN0aW9uIGFuZAo+IG1ha2UgaXQgYW4gaW50ZXJuYWwgZnVuY3Rpb24uCgpJIGp1c3QgZm91bmQg
ZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYyBoYXMgYSBjYWxsIGZvciBnZXRfY3B1X2Zvcl9h
Y3BpX2lkLApzbyBXZSBzaG91bGQgbm90IG1hcmtpbmcgYXMgc3RhdGljLgoKQWNjb3JkaW5nIHRv
IHlvdXIgYWR2aXNlLCBJIG1vdmVkIGl0IGluIGFjcGkuYyBpbiB2OC4KClRoYW5rcwoKPiAKPiBU
aGFua3MKPiAKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
