Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDE1606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZdgDzovG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O2p8XH9+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XzczZHQtIokxURgVxBLHPjt18pltgwyx+/gBwMYC4+8=; b=ZdgDzovGRREwnqqcpHrcyCDswC
	RB9fjMC+4p3Q57NAf4hjwxtS6lu4ZnlTS1/+s0QDdlXPZmje2F6E6IPGAMnClTN5raLF7V/D6Nkiv
	8EoAhqKAab7ay5yqUcgvyLACsGfnZG6EXJvjMFQnIePfc7CCzsn4oyumB6+KXA9xnhKsd1qIuF8OQ
	oaYwNxhK9NI8qVuBYKUV9MFtFlaxvulTyQ79jIi8Ku4NwnHT3x9gTMk8ksNMfbu2D6eLk+3q9xzxr
	IIGqtaA767UYN9HhlsS1S8pA9bQYqXvzlrkOqS7aEuEYr83KGRZeFTWAGGCcQn5LQzIXp6HY3a/bR
	EH7lV2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNieY-0000000FRY5-3QPa;
	Mon, 02 Nov 2026 03:24:10 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNieU-0000000FRXH-2uQl;
	Mon, 02 Nov 2026 03:24:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KaTdiwMWudYfERU/E+XvtEtv6XN7xCCT4UxFwKCQbgY=;
	b=O2p8XH9+nIKo/SHJQvkoNlL4LG8DUPa7z5az4NMbn4QOSUwJiVcYlpUUX/m9TA7CQfyPm2MvU
	Cwh5LZ6dROeeylnsx9068aMRCbanodwtjZlAGPjtuw2LVfYHEH7g6S6Ul29eDy6TYX4JY1IF6uP
	NNoos+v4xL/Z385AyfTy/iA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jHxqs4cm8zpStD;
	Mon,  2 Nov 2026 11:23:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E70540561;
	Mon,  2 Nov 2026 11:23:58 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 11:23:57 +0800
Message-ID: <9880eb24-2189-4592-a999-5769c59ebb81@huawei.com>
Date: Mon, 2 Nov 2026 11:23:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/19] resctrl: Generalize monitor events across
 resources
To: Reinette Chatre <reinette.chatre@intel.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <d4a54429-7d45-4936-b5b3-06d8fa8545ee@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <d4a54429-7d45-4936-b5b3-06d8fa8545ee@intel.com>
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_192407_360586_D9AC03ED 
X-CRM114-Status: GOOD (  19.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMC8zMSAxOjA5LCBSZWluZXR0ZSBDaGF0cmUg5YaZ6YGTOgo+IEhpIEppbmpp
ZSwKPiAKPiBPbiAxMC8yOS8yNiA1OjM1IEFNLCBKaW5qaWUgUnVhbiB3cm90ZToKPj4gUmVzY3Ry
bCBvbmx5IGtub3dzIGFib3V0IG1vbml0b3JpbmcgYXQgdGhlIEwzIHNjb3BlLiBNUEFNIG1vbml0
b3JzIGFyZQo+PiBhdHRhY2hlZCB0byBhIHJlc291cmNlIGluIGFuIE1TQywgYW5kIGZpcm13YXJl
IHNheXMgd2hpY2ggY2FjaGUgbGV2ZWwgdGhhdAo+PiByZXNvdXJjZSBpcy4gVGhlIGRyaXZlciBh
bHJlYWR5IGZpbmRzIEwyIG1vbml0b3JzLCBidXQgcmVzY3RybCBoYXMKPj4gbm93aGVyZSB0byBz
aG93IHRoZW0uCj4+Cj4+IFRoaXMgaXMgbm90IE1QQU0gc3BlY2lmaWMuIFJJU0MtViBjYW4gYWxz
byBwbGFjZSBtb25pdG9ycyBhdCBzZXZlcmFsCj4+IHBvaW50cyBpbiB0aGUgc3lzdGVtLgo+Pgo+
IAo+IE9uZSBrZXkgdG8gdGhpcyBpcyBpbiB0aGUgZmlyc3Qgc2VudGVuY2Ugb2YgdGhpcyBjb3Zl
ciBsZXR0ZXI6ICJSZXNjdHJsIG9ubHkga25vd3MKPiBhYm91dCBtb25pdG9yaW5nIGF0IHRoZSBM
MyAqc2NvcGUqLiIuCj4gCj4gV2hlbiBpdCBjb21lcyB0byBleHBvc2luZyBtb25pdG9yaW5nIGRh
dGEgdG8gdXNlciBzcGFjZSByZXNjdHJsIGhhcyBiZWVuIHVzaW5nICJMMyIKPiBpbnRlcmNoYW5n
ZWFibGUgYXMgcmVzb3VyY2UgYW5kIHNjb3BlLiAKPiAKPiBUaGUgZXhpc3RpbmcgcmVzY3RybCB1
c2VyIGludGVyZmFjZSBhbHJlYWR5IGVzdGFibGlzaGVzIHRoYXQgdGhlICJMMyIgaW4KPiAiTDNf
TU9OIiBhbmQgdGhlIHBlciBtb25pdG9yIGdyb3VwICJtb25fZGF0YS9tb25fTDNfeHgiIHJlZmVy
cyB0byB0aGUgTDMgKnNjb3BlKiwKPiBub3QgdGhlIEwzIHJlc291cmNlLiBNb3JlIHNwZWNpZmlj
YWxseSwgY29uc2lkZXIgdGhlIGV4aXN0aW5nIHVzZXIgaW50ZXJmYWNlOgoKSGkgUmVpbmV0dGUs
CgpUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24sIHlvdSBhcmUgcmlnaHQsIHRoZSAiTDMiIGlu
ICJMM19NT04iIGFuZAoibW9uX0wzX3h4IiBpcyB0aGUgc2NvcGUsIG5vdCB0aGUgcmVzb3VyY2Us
IHRoaXMgaW50ZXJmYWNlIGNhbiBpbmNsdWRlCmRpZmZlcmVudCByZXNvdXJjZXMgc3VjaCBhcyBN
QiBhbmQgTDMgYXQgdGhlIHNhbWUgdGltZS4uCgo+IAo+ICMgZmluZCBtb25fZGF0YS8KPiBtb25f
ZGF0YS8KPiBtb25fZGF0YS9tb25fTDNfMDAKPiBtb25fZGF0YS9tb25fTDNfMDAvbWJtX2xvY2Fs
X2J5dGVzIDw9PT0gbW9uaXRvcmluZyBkYXRhIGFzc29jaWF0ZWQgd2l0aCBNQiByZXNvdXJjZSBh
dCBMMyBzY29wZQo+IG1vbl9kYXRhL21vbl9MM18wMC9tYm1fdG90YWxfYnl0ZXMgPD09PSBtb25p
dG9yaW5nIGRhdGEgYXNzb2NpYXRlZCB3aXRoIE1CIHJlc291cmNlIGF0IEwzIHNjb3BlCj4gbW9u
X2RhdGEvbW9uX0wzXzAwL2xsY19vY2N1cGFuY3kgICA8PT09IG1vbml0b3JpbmcgZGF0YSBhc3Nv
Y2lhdGVkIHdpdGggTDMgcmVzb3VyY2UgYXQgTDMgc2NvcGUKPiAKPiBBc3NvY2lhdGluZyB0aGUg
bW9uaXRvciBldmVudHMgd2l0aCB0aGUgTDMgcmVzb3VyY2Ugd2FzIGFuIGltcGxlbWVudGF0aW9u
IGNob2ljZQo+IHRoYXQgd2FzIGNvbnZlbmllbnQgYXQgdGhlIHRpbWUuIFNpbmNlIEwyIGNhbiBz
aW1pbGFybHkgYmUgdXNlZCBpbnRlcmNoYW5nZWFibHkgZm9yIHJlc291cmNlCj4gYW5kIHNjb3Bl
IGFzc29jaWF0aW5nIHRoZSBMMiBzY29wZSBtb25pdG9yaW5nIHdpdGggdGhlIEwyIHJlc291cmNl
IG1heSBzaW1pbGFybHkgYmUgY29udmVuaWVudAo+IHdoZW4gY29uc2lkZXJpbmcgaG93IHRvIHN1
cHBvcnQgTDIgbW9uaXRvcnMgYXMgaXMgZG9uZSBpbiB0aGlzIHNlcmllcy4KCkwyIHdvcmtzIGhl
cmUgb25seSBiZWNhdXNlIHRoZSBuYW1lcyBoYXBwZW4gdG8gYmUgdGhlIHNhbWUgZm9yIHJlc291
cmNlCmFuZCBzY29wZSBhcyBMMyBoYXMgZG9uZS4KCj4gCj4gRXZlbiBzbywgSSBkbyBub3QgYmVs
aWV2ZSB0aGF0IGFzc29jaWF0aW5nIG1vbml0b3Jpbmcgd2l0aCB0aGUgcmVzb3VyY2Ugd2lsbCBi
ZQo+IGFibGUgdG8gY2xlYW5seSBzdXBwb3J0IGFsbCBNUEFNIG1vbml0b3JpbmcgY2FwYWJpbGl0
eS4gU3BlY2lmaWNhbGx5IHRoZSB1cGNvbWluZyBDUFUtbGVzcwo+IG1lbW9yeSBiYW5kd2lkdGgg
bW9uaXRvcmluZy4KPiAKPiBBcyBJIHNlZSB0aGUgcGxhbiBhdCB0aGlzIHRpbWU6IENQVS1sZXNz
IG1lbW9yeSBiYW5kd2lkdGggYWxsb2NhdGlvbiB3aWxsIGJlCj4gYmFja2VkIGJ5IGEgbmV3IE1C
X05PREUgcmVzb3VyY2UuIEZvciB0aGVzZSBzeXN0ZW1zIHRoZSBleHBlY3RhdGlvbiBpcyB0aGF0
IHRoZWlyCj4gbW9uaXRvcmluZyBkYXRhIHdpbGwgYmUgZXhwb3NlZCB0byB1c2VyIHNwYWNlIHZp
YSBOT0RFIHNjb3BlIGFuZCB3aWxsIGFwcGVhciB0byB1c2VyIHNwYWNlIGFzOgo+IAo+IG1vbl9k
YXRhLwo+IG1vbl9kYXRhL21vbl9OT0RFXzAwCj4gbW9uX2RhdGEvbW9uX05PREVfMDAvbWJtX3Rv
dGFsX2J5dGVzIDw9PT0gbW9uaXRvcmluZyBkYXRhIGFzc29jaWF0ZWQgd2l0aCBNQiByZXNvdXJj
ZSBhdCBOT0RFIHNjb3BlCgpZb3UgYXJlIHJpZ2gsIGFzc29jaWF0aW5nIG1vbml0b3Jpbmcgd2l0
aCB0aGUgcmVzb3VyY2UgY2Fubm90IGdpdmUKbW9uX05PREVfMDAgYnV0IG1vbl9NQl94eC4gSSBh
bSBoYXBweSB0byBrZXkgaXQgb2ZmIHNjb3BlIGluc3RlYWQgZm9yCm5hbWluZyBhbmQgZGlzcGxh
eSwgYW5kIGtlZXAgdGhlIHJlc291cmNlLWJhc2VkIGV2ZW50IHRhYmxlcyBhcyBhbgppbnRlcm5h
bCBkZXRhaWwuCgo+IAo+IFRoZSBjb3Zlci1sZXR0ZXIgaXMgdGl0bGVkICJHZW5lcmFsaXplIG1v
bml0b3IgZXZlbnRzIGFjcm9zcyByZXNvdXJjZXMiLiBBcyBJIHNlZSBpdCBzdWNoCj4gZ2VuZXJh
bGl6YXRpb24gZG9lcyBub3QgcHJlcGFyZSByZXNjdHJsIGZvciBhbGwgTVBBTSBtb25pdG9yaW5n
IGNhcGFiaWxpdGllcy4gQ291bGQgdGhpcwo+IHdvcmsgZG8gc28/CgpDUFUtbGVzcyBOT0RFIG1v
bml0b3JpbmcgaXMgbm90IHBhcnQgb2YgdGhpcyBzZXJpZXMsIGJ1dCBJIHdpbGwgbWFrZQpzdXJl
IHRoZSBzY29wZS1iYXNlZCBuYW1pbmcgZG9lcyBub3QgYmxvY2sgaXQuCgo+IAo+IFJlaW5ldHRl
CgotLSAKQmVzdCByZWdhcmRzLApKaW5qaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
