Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DE4C54EDA
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4jkGN56xuLykfqLpx1pF1PMYsmcxT1qcjq5gjGvsE4=; b=2Ei2KFav2r9bO3
	Rgd6AJlgxzhlFLy75iMO4l1a54rWghY7SvILy5fHgYTQbvWi2ePp/HvpfO1aoqiZqXSBxHt+4GEp+
	skznMUtrk8HODLwgnxED4NAg8EYTJG+QcuNiPgj0B/pAtZkwAnuv92CZeZirz098CJYhE72sV9WfK
	CvV+RrZV3tc9uWJ1fDCp2lWxfmpRMfEL2YIcpj1DQSyjUrOyusnQtra98uWVqzaSKS3Alhmfgue9u
	Y3bijY15qqWPhI19HWPljG4XEHQucobV+SULrr9qWA7WbDoOGmQ1diguTHJLpZ5KxgOjzZx0/Nzot
	2EN28bwbYndhaJc7tF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7X-00000004WyO-0DZj;
	Fri, 23 May 2025 17:23:47 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW0L-00000004Vke-1OaI
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 17:16:22 +0000
Message-ID: <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748020578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwSnBgPFez8PLTovNHh7DO/HqAHVQL0w4mtppSLYja0=;
	b=p4ygCmn0/SgSUw/j+FUlcInOw5bcP3qQpAP+WTRtVHCq8zqDVxfsG3vreS7WCBAJhRjcTY
	CNS0wuI2Zor/NqLA6i4HP+ByVNwTy/KZWyPRvH4hhejZLNvTG/9jo7xnLQXl37V2+/wL9Q
	eok6kr9D3cEhlTaruAu9Wmz5VZIJWYI=
Date: Fri, 23 May 2025 10:16:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_101621_514100_6D542A78 
X-CRM114-Status: GOOD (  12.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDUvMjMvMjUgNjozMSBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IDIwMjUtMDUtMjJU
MTI6MDM6NDMtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPjoKPj4gVXBn
cmFkZSB0aGUgU0JJIHZlcnNpb24gdG8gdjMuMCBzbyB0aGF0IGNvcnJlc3BvbmRpbmcgZmVhdHVy
ZXMKPj4gY2FuIGJlIGVuYWJsZWQgaW4gdGhlIGd1ZXN0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV9zYmkuaAo+PiAtI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMgo+
PiArI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMwo+IEkgdGhpbmsgaXQncyB0aW1lIHRv
IGFkZCB2ZXJzaW9uaW5nIHRvIEtWTSBTQkkgaW1wbGVtZW50YXRpb24uCj4gVXNlcnNwYWNlIHNo
b3VsZCBiZSBhYmxlIHRvIHNlbGVjdCB0aGUgZGVzaXJlZCBTQkkgdmVyc2lvbiBhbmQgS1ZNIHdv
dWxkCj4gdGVsbCB0aGUgZ3Vlc3QgdGhhdCBuZXdlciBmZWF0dXJlcyBhcmUgbm90IHN1cHBvcnRl
ZC4KCldlIGNhbiBhY2hpZXZlIHRoYXQgdGhyb3VnaCBvbmVyZWcgaW50ZXJmYWNlIGJ5IGRpc2Fi
bGluZyBpbmRpdmlkdWFsIFNCSSAKZXh0ZW5zaW9ucy4KV2UgY2FuIGV4dGVuZCB0aGUgZXhpc3Rp
bmcgb25lcmVnIGludGVyZmFjZSB0byBkaXNhYmxlIGEgc3BlY2lmaWMgU0JJIAp2ZXJzaW9uIGRp
cmVjdGx5Cmluc3RlYWQgb2YgaW5kaXZpZHVhbCBvbmVzIHRvIHNhdmUgdGhvc2UgSU9DVEwgYXMg
d2VsbC4KCj4gV2UgY291bGQgc29tZXdoYXQgZ2V0IGF3YXkgd2l0aCB0aGUgdXNlcnNwYWNlX3Ni
aSBwYXRjaCBJIHBvc3RlZCwKPiBiZWNhdXNlIHVzZXJzcGFjZSB3b3VsZCBhdCBsZWFzdCBiZSBp
biBjb250cm9sIG9mIHRoZSBTQkkgdmVyc2lvbiwgYnV0Cj4gaXQgd291bGQgc3RpbGwgYmUgaW5j
b3JyZWN0IHdpdGhvdXQgYSBLVk0gZW5mb3JjZW1lbnQsIGJlY2F1c2UgYQo+IG1pc2JlaGF2aW5n
IGd1ZXN0IGNvdWxkIHVzZSBmZWF0dXJlcyB0aGF0IHNob3VsZCBub3QgYmUgc3VwcG9ydGVkLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
