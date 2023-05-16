Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8E3C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rYI0b1/bgFz49JlzWjFxaKJIxLknmQzGI4RcIpNTIc=; b=aK8hYS4OSctrTp
	j4cLSu9z0vUwViJm9r/0gjGDwAA1+mrBwPuYkSuy7mL5wBR0QBQR/VhuENHA+ERamvJZ9JLi/rVd6
	UM/TUA+zAyGg9ncGhP8Y+cUlxMOUq1s/yt6FxEf6xcn7WlLrjE34qMb2aGsk4ilXN6RHVUrHp1MXg
	lKiJFb+ZIDcqWEMj0Ui1M71UZjuTBe8/VIlIXTO9MPFuYPmFzjCpC1LT4JHJrk8cIJOSG1zIkJ4TH
	UOBm1Ta+IqJk2XeIoScmNgJNi43bZWgBJ/1GZdVN5I8HhgS3hrWC5h/mSo1/xRZh09H+nfASDyVwB
	BbYTMCukWuLX94ghzSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoi5-004aiZ-22;
	Tue, 16 May 2023 07:03:01 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyohz-004agl-2k
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:03:00 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 39B5D240003;
	Tue, 16 May 2023 07:02:50 +0000 (UTC)
Message-ID: <280c0994-f7cd-bb0e-8c68-62f72a4a38ca@ghiti.fr>
Date: Tue, 16 May 2023 09:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Robin Murphy
 <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux.dev, Conor Dooley <conor@kernel.org>,
 linux-riscv@lists.infradead.org
References: <20230330060105.29460-1-rdunlap@infradead.org>
 <2529dd93-2cb2-6ed8-20c0-c424e6613717@arm.com>
 <833203b0-aee5-eb23-afb4-ff71a3024258@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <833203b0-aee5-eb23-afb4-ff71a3024258@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_000256_034704_03C101C4 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

SGkgUmFuZHksCgoKT24gMy8zMC8yMyAxODo0OSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+Cj4gT24g
My8zMC8yMyAwOTozNCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+PiBPbiAyMDIzLTAzLTMwIDA3OjAx
LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiByaXNjdjY0LCBsaW51eC1uZXh0LTIwMjMzMDMw
IChhbmQgZm9yIHNldmVyYWwgZGF5cyBlYXJsaWVyKSwKPj4+IHRoZXJlIGlzIGEga2NvbmZpZyB3
YXJuaW5nOgo+Pj4KPj4+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0
ZWQgZm9yIElPTU1VX0lPX1BHVEFCTEVfTFBBRQo+Pj4gIMKgwqAgRGVwZW5kcyBvbiBbbl06IElP
TU1VX1NVUFBPUlQgWz15XSAmJiAoQVJNIHx8IEFSTTY0IHx8IENPTVBJTEVfVEVTVCBbPW5dKSAm
JiAhR0VORVJJQ19BVE9NSUM2NCBbPW5dCj4+PiAgwqDCoCBTZWxlY3RlZCBieSBbeV06Cj4+PiAg
wqDCoCAtIElQTU1VX1ZNU0EgWz15XSAmJiBJT01NVV9TVVBQT1JUIFs9eV0gJiYgKEFSQ0hfUkVO
RVNBUyBbPXldIHx8IENPTVBJTEVfVEVTVCBbPW5dKSAmJiAhR0VORVJJQ19BVE9NSUM2NCBbPW5d
Cj4+Pgo+Pj4gYW5kIGJ1aWxkIGVycm9yczoKPj4+Cj4+PiByaXNjdjY0LWxpbnV4LWxkOiBkcml2
ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLm86IGluIGZ1bmN0aW9uIGAuTDE0MCc6Cj4+PiBpby1w
Z3RhYmxlLWFybS5jOiguaW5pdC50ZXh0KzB4MWU4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
YWxsb2NfaW9fcGd0YWJsZV9vcHMnCj4+PiByaXNjdjY0LWxpbnV4LWxkOiBkcml2ZXJzL2lvbW11
L2lvLXBndGFibGUtYXJtLm86IGluIGZ1bmN0aW9uIGAuTDE2OCc6Cj4+PiBpby1wZ3RhYmxlLWFy
bS5jOiguaW5pdC50ZXh0KzB4YWIwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZnJlZV9pb19w
Z3RhYmxlX29wcycKPj4+IHJpc2N2NjQtbGludXgtbGQ6IGRyaXZlcnMvaW9tbXUvaXBtbXUtdm1z
YS5vOiBpbiBmdW5jdGlvbiBgLkwxNDAnOgo+Pj4gaXBtbXUtdm1zYS5jOigudGV4dCsweGJjNCk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGZyZWVfaW9fcGd0YWJsZV9vcHMnCj4+PiByaXNjdjY0
LWxpbnV4LWxkOiBkcml2ZXJzL2lvbW11L2lwbW11LXZtc2EubzogaW4gZnVuY3Rpb24gYC5MMCAn
Ogo+Pj4gaXBtbXUtdm1zYS5jOigudGV4dCsweDE0NWUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBhbGxvY19pb19wZ3RhYmxlX29wcycKPj4+Cj4+PiBBZGQgUklTQ1YgYXMgYW4gYWxsb3dlZCBB
UkNIIGRlcGVuZGVuY3kgdG8gZml4IHRoZXNlIHByb2JsZW1zLgo+Pj4KPj4+IEZpeGVzOiBkMjg2
YTU4YmM4ZjQgKCJpb21tdTogVGlkeSB1cCBpby1wZ3RhYmxlIGRlcGVuZGVuY2llcyIpCj4+IEJU
VyB0aGF0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZSByaWdodCBmaXggdGFyZ2V0IC0gdGhpcyBwcmVz
dW1hYmx5IGRhdGVzIGJhY2sgYXMgZmFyIGFzIHdoZW4gQVJDSF9SRU5FU0FTIHdhcyBhZGRlZCB0
byBSSVNDViwgc3VjaCB0aGF0IGl0IHdhcyBwb3NzaWJsZSB0byBzdGFydCBzZWxlY3RpbmcgSVBN
TVVfVk1TQSB3aXRob3V0IENPTVBJTEVfVEVTVD8KPiBPSywgSSBjYW4gZ28gd2l0aCB0aGF0LiBU
aGFua3MgZm9yIHlvdXIgaGVscC4KPgoKQW55IHVwZGF0ZXMgb24gdGhpcyBmaXg/CgoKVGhhbmtz
LAoKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
