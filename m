Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42CFC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8Qv27Zj3YMSWlFXaIa3Y3jxGKkscRwAu2DQLWa6j0o=; b=jHsC0978vkW+7P
	Ce1yuwrYNYX/AiQqvQRKH/bWGW0KTgGgLyXCeK0p+xtp3BOcUDywxzax8eanOxmsgFvYB+8RErk71
	gQC+kV38NiDJOPRnpj+Ty93U15Bzx1uWBBSm2e5Zc5ts242KczEtmgqxEvQkhg5tdX9ikHEBh1OpH
	dDQMbRM/+BECb2X5SJOf51VOzN++v2HEHsJK6yeF0vmIVfcSniue4+RcC0nNIBJl15aHAS+xkPYQp
	Hkb4FrHIdzZeR2kzyTDEwVH1vSZnkuqqFEmc8y43eIN5EIJ0NbqmktaISP6JI8trdOO1D1h8bw3KL
	MEaqPuuNAlqFm7Bmyf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ti9-0000000Gor7-1G8T;
	Fri, 03 May 2024 14:16:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2sZ5-0000000GXv8-0qGO
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 13:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vSw8QKu9HGf7qHmg18MXmUhtbJeVSX9Chf+hV0PW2t8=; b=FvCaKO6u4v99D04PS5PPs1f1Ai
	HQtK/ExETpotiPA6o9GFDA5ufB5rb94ORzyGUaHfDFw1Bvalq3aIiFfR1cr/xfQ2aE7DwSTr1oWTF
	rUxVFd9Iuw9+9SFZPKTHA+0tuR+uYaC1kp4gCScPr7qultUemeLvlUDddu6c602zk8SpBXu+KYpaJ
	kfyw+S6eNNQSY5JCceMdr5KffNK+xQbEim35g+Ok2id7arsOauHpejLssX94N5kuBUNvVwh9X9YTe
	WEhoLG4MmxNxcJai/viHhAaBiJ2AH+9Ns4RFQRz7dh7a6/6yohvDjnrlv59xJsrzqNc9+BslsZ+Df
	Z9uzqrvg==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2sZ0-00000000YHk-2Uk7
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 13:03:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A26A8E0008;
	Fri,  3 May 2024 13:02:52 +0000 (UTC)
Message-ID: <daa955d9-b554-4e0e-a08e-835c4cd5a366@ghiti.fr>
Date: Fri, 3 May 2024 15:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: Allow the last potential unrolled copy
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>, Xiao Wang <xiao.w.wang@intel.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: jerry.shih@sifive.com, nick.knight@sifive.com, ajones@ventanamicro.com,
 bjorn@rivosinc.com, andy.chiu@sifive.com, viro@zeniv.linux.org.uk,
 cleger@rivosinc.com, alexghiti@rivosinc.com, haicheng.li@intel.com,
 akira.tsukamoto@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240313103334.4036554-1-xiao.w.wang@intel.com>
 <7ebc5b28-7115-494f-a607-e46c71214cce@ghiti.fr>
 <4bc238eb-410b-46b1-98e1-4aaa35e34404@codethink.co.uk>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <4bc238eb-410b-46b1-98e1-4aaa35e34404@codethink.co.uk>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_140258_751327_7352C7FB 
X-CRM114-Status: GOOD (  18.73  )
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

SGkgQmVuLAoKT24gMDMvMDUvMjAyNCAxNDoxOSwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDAzLzA1
LzIwMjQgMTM6MTYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gSGkgWGlhbywKPj4KPj4gT24g
MTMvMDMvMjAyNCAxMTozMywgWGlhbyBXYW5nIHdyb3RlOgo+Pj4gV2hlbiB0aGUgZHN0IGJ1ZmZl
ciBwb2ludGVyIHBvaW50cyB0byB0aGUgbGFzdCBhY2Nlc3NpYmxlIGFsaWduZWQgCj4+PiBhZGRy
LCB3ZQo+Pj4gY291bGQgc3RpbGwgcnVuIGFub3RoZXIgaXRlcmF0aW9uIG9mIHVucm9sbGVkIGNv
cHkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWGlhbyBXYW5nIDx4aWFvLncud2FuZ0BpbnRlbC5j
b20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyB8IDIgKy0KPj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMgYi9hcmNoL3Jpc2N2L2xpYi91YWNj
ZXNzLlMKPj4+IGluZGV4IDJlNjY1ZjhmOGZjYy4uMTM5OWQ3OTdkODFiIDEwMDY0NAo+Pj4gLS0t
IGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi91YWNj
ZXNzLlMKPj4+IEBAIC0xMDMsNyArMTAzLDcgQEAgU1lNX0ZVTkNfU1RBUlQoZmFsbGJhY2tfc2Nh
bGFyX3VzZXJjb3B5KQo+Pj4gwqDCoMKgwqDCoCBmaXh1cCBSRUdfU8KgwqAgdDQswqAgNypTWlJF
RyhhMCksIDEwZgo+Pj4gwqDCoMKgwqDCoCBhZGRpwqDCoMKgIGEwLCBhMCwgOCpTWlJFRwo+Pj4g
wqDCoMKgwqDCoCBhZGRpwqDCoMKgIGExLCBhMSwgOCpTWlJFRwo+Pj4gLcKgwqDCoCBibHR1wqDC
oMKgIGEwLCB0MCwgMmIKPj4+ICvCoMKgwqAgYmxldcKgwqDCoCBhMCwgdDAsIDJiCj4+PiDCoMKg
wqDCoMKgIGFkZGnCoMKgwqAgdDAsIHQwLCA4KlNaUkVHIC8qIHJldmVydCB0byBvcmlnaW5hbCB2
YWx1ZSAqLwo+Pj4gwqDCoMKgwqDCoCBqwqDCoMKgIC5MYnl0ZV9jb3B5X3RhaWwKPj4KPj4KPj4g
SSBhZ3JlZSBpdCBpcyBzdGlsbCBzYWZlIHRvIGNvbnRpbnVlIGZvciBhbm90aGVyIHdvcmRfY29w
eSBoZXJlLgo+Pgo+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPgo+Cj4gT3V0IG9mIGludGVyZXN0LCBoYXMgYW55b25lIGNoZWNrZWQgaWYgY2F1
c2luZyBhIHNjaGVkdWxlIGV2ZW50IGR1cmluZwo+IHRoaXMgY29kZSBicmVha3MgbGlrZSB0aGUg
bGFzdCB0aW1lIHdlIGhhZCBpc3N1ZXMgd2l0aCB0aGUgdXBzdHJlYW0KPiB0ZXN0aW5nPwoKCkkg
dmFndWVseSByZW1lbWJlciBzb21ldGhpbmcsIGRvIHlvdSBoYXZlIGEgbGluayB0byB0aGF0IGRp
c2N1c3Npb24gYnkgCmNoYW5jZT8KCgo+Cj4gSSBkaWQgcHJvcG9zZSBzYXZpbmcgdGhlIHN0YXRl
IG9mIHRoZSB1c2VyLWFjY2VzcyBmbGFnIGluIHRoZSB0YXNrCj4gc3RydWN0CgoKTWFrZXMgc2Vu
c2UsIEkganVzdCB0b29rIGEgcXVpY2sgbG9vayBhbmQgU1JfU1VNIGlzIGNsZWFyZWQgYXMgc29v
biBhcyAKd2UgZW50ZXIgaGFuZGxlX2V4Y2VwdGlvbigpIGFuZCBpdCBkb2VzIG5vdCBzZWVtIHRv
IGJlIHJlc3RvcmVkLiBXZWlyZCAKaXQgd29ya3MsIHVubGVzcyBJIG1pc3NlZCBzb21ldGhpbmch
CgoKPiBidXQgd2UgbW9zdGx5IHNvbHZlZCBpdCBieSBtYWtpbmcgc2xlZXBpbmcgZnVuY3Rpb25z
IHN0YXkKPiBhd2F5IGZyb20gdGhlIGFkZHJlc3MgY2FsY3VsYXRpb24uIFRoaXMgb2YgY291cnNl
IG1heSBoYXZlIGJlZW4gZG9uZQo+IGFscmVhZHkgb3IgbmVlZCB0byBiZSBkb25lIGlmIHRocmVl
J3MgbG9uZyBhcmVhcyB3aGVyZSB0aGUgdXNlci1hY2Nlc3MKPiBmbGFncyBjYW4gYmUgZGlzYWJs
ZWQgKGdlbmVyYWxseSBvbmx5IGEgZmV3IGRyaXZlcnMgZGlkIHRoaXMsIHNvIHdlCj4gbWF5IG5v
dCBoYXZlIGNvbWUgYWNyb3NzIHRoZSBwcm9ibGVtKQo+CkkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0
IHlvdSBtZWFuIGhlcmUsIHdvdWxkIHlvdSBtaW5kIGV4cGFuZGluZyBhIGJpdD8KClRoYW5rcywK
CkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
