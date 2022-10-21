Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCD6C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMhgturl3fp/remYE4BYdfEWJkSfPR9CODyWLtNRCmU=; b=PgItk6EeaTzBdc
	s4koO7WkyXoNGeWCVAgeR8o5dvjsP2nj7lafKJ7HEF1mxI2vON3Pco3djlT4I49in0eUOCD6HpPFH
	nmrL+hDDYa7/Rf2iP/PcfyI/Qoxpc5wTBegkeFzNbTHI12L0wcaNKdxYHDZKai5k0F2bWqv8qL1Sp
	MNfmaAbNB1+/3R4BPfzwbAr+euJFgql1STCeUNN/6BdAFzT1EjRzE1FgCLYa1CAQIrlEOICOqYgCC
	reujT1YIfvphqdX+pr7VXk6ygv6dPLyUEiNXDs5ft4aLl8sXHUc98vAF2xTLLK/yjC3P7k4G51R9k
	O+DWIOL8BWqoH9y46blA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olr3d-007aiK-JQ; Fri, 21 Oct 2022 12:23:25 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olr3Z-007afa-Hu
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 12:23:24 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mv3Qq6Z18z15Lxs;
	Fri, 21 Oct 2022 20:18:27 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 20:23:14 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 20:23:12 +0800
Message-ID: <09d1c410-5690-7158-8982-48ceec8ab64e@huawei.com>
Date: Fri, 21 Oct 2022 20:23:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 2/2] riscv: extable: add new extable type
 EX_TYPE_KACCESS_ERR_ZERO support
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, <guohanjun@huawei.com>
References: <mhng-b5608339-68e0-4706-9002-50ba006b4d05@palmer-ri-x1c9>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <mhng-b5608339-68e0-4706-9002-50ba006b4d05@palmer-ri-x1c9>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_052321_953498_F02ADC8F 
X-CRM114-Status: GOOD (  16.29  )
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

CgrlnKggMjAyMi85LzIyIDQ6MjUsIFBhbG1lciBEYWJiZWx0IOWGmemBkzoKPiBPbiBTYXQsIDI3
IEF1ZyAyMDIyIDAzOjM5OjM4IFBEVCAoLTA3MDApLCB0b25ndGlhbmdlbkBodWF3ZWkuY29tIHdy
b3RlOgo+Pgo+Pgo+PiDlnKggMjAyMi84LzI2IDE2OjE2LCBBbmRyZXcgSm9uZXMg5YaZ6YGTOgo+
Pj4gT24gRnJpLCBBdWcgMjYsIDIwMjIgYXQgMDI6NDQ6NDhQTSArMDgwMCwgVG9uZyBUaWFuZ2Vu
IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiDlnKggMjAyMi84LzI1IDE5OjA2LCBBbmRyZXcgSm9uZXMg
5YaZ6YGTOgo+Pj4+PiBPbiBNb24sIEF1ZyAxNSwgMjAyMiBhdCAwMzoyMDoyNUFNICswMDAwLCBU
b25nIFRpYW5nZW4gd3JvdGU6Cj4+Pj4+PiBDdXJyZW50bHksIFRoZSBleHRhYmxlIHR5cGUgRVhf
VFlQRV9VQUNDRVNTX0VSUl9aRVJPIGlzIHVzZWQgYnkKPj4+Pj4+IF9fZ2V0L3B1dF9rZXJuZWxf
bm9mYXVsdCgpLCBidXQgdGhvc2UgaGVscGVycyBhcmUgbm90IHVhY2Nlc3MgCj4+Pj4+PiB0eXBl
LCBzbyB3ZQo+Pj4+Pj4gYWRkIGEgbmV3IGV4dGFibGUgdHlwZSBFWF9UWVBFX0tBQ0NFU1NfRVJS
X1pFUk8gd2hpY2ggY2FuIGJlIHVzZWQgYnkKPj4+Pj4+IF9fZ2V0L3B1dF9rZXJuZWxfbm9fZmF1
bHQoKS4KPj4+Pj4+Cj4+Pj4+PiBPbmx5IHJlZmFjdG9yIGNvZGUgd2l0aG91dCBhbnkgZnVuY3Rp
b25hbCBjaGFuZ2VzLgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzbid0IHF1aXRlIHRydWUuIF9fZ2V0L3B1
dF9rZXJuZWxfbm9mYXVsdCBub3cgc2V0cyBhIGRpZmZlcmVudAo+Pj4+PiBleHRhYmxlIHR5cGUg
KGFzIHRoZSBjb21taXQgbWVzc2FnZSBzYXlzKS4gQnV0LCBub3RoaW5nIHNwZWNpYWwgc2VlbXMK
Pj4+Pj4gdG8gYmUgZG9uZSB3aXRoIHRoYXQsIHNvIHRoZXJlJ3MgZWZmZWN0aXZlbHkgbm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuIENhbgo+Pj4+PiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBvbiB0aGUgbW90
aXZhdGlvbiBmb3IgdGhpcyBjaGFuZ2U/IFdoZXJlIHdpbGwgdGhlCj4+Pj4+IEtBQ0NFU1MgdHlw
ZSBuZWVkIHRvIGJlIGRpc3Rpbmd1aXNoZWQgZnJvbSB0aGUgVUFDQ0VTUyB0eXBlPwo+Pj4+Cj4+
Pj4gVGhlIGludHJvZHVjdGlvbiBvZiBFWF9UWVBFX0tBQ0NFU1NfRVJSX1pFUk8gZG9lcyBub3Qg
Y2hhbmdlIGFueSAKPj4+PiBmdW5jdGlvbiwKPj4+PiBidXQgbWFrZXMgYSBjb3JyZWN0IGRpc3Rp
bmN0aW9uIGluIHRoZSBhY3R1YWwgdHlwZSwgaW5kaWNhdGluZyB0aGF0IAo+Pj4+IHRoZXJlCj4+
Pj4gYXJlIGluZGVlZCBzb21lIGthY2Nlc3MgZW50cmllcyBpbiBleHRhYmxlLiBJIHRoaW5rIHRo
aXMgCj4+Pj4gb3B0aW1pemF0aW9uIGlzCj4+Pj4gbW9yZSBjbGVhciBhbmQgcmVhc29uYWJsZS4K
Pj4+Cj4+PiBXZWxsLCBjcmVhdGluZyBuZXcgdHlwZXMsIGp1c3QgZm9yIG5ldyB0eXBlIHNha2Us
IGp1c3QgYmxvYXRzIGNvZGUuCj4+Pgo+Pj4+Cj4+Pj4gQSBmZXcgd2Vla3MgYWdvLCBJIGRpZCBz
b21ldGhpbmcgc2ltaWxhciBvbiBhcm02NFsxXS4gSSB0aGluayB0aGlzCj4+Pj4gb3B0aW1pemF0
aW9uIGNhbiBhbHNvIGJlIHVzZWQgb24gcmlzY3YuCj4+Pj4KPj4+PiBXZSBjYW4gZG8gc29tZSBm
ZWF0dXJlcyB0aGF0IGFyZSB1c2VkIG9uIHVhY2NzcyBidXQgbm90IGFwcGxpY2FibGUgb24KPj4+
PiBrYWNjZXNzIGluIHRoZSBmdXR1cmVbMl0uCj4+Pj4KPj4+PiBbMV0KPj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMjIwNjIxMDcyNjM4LjEyNzM1OTQtMi10b25ndGlhbmdlbkBo
dWF3ZWkuY29tLyAKPj4+Pgo+Pj4+IFsyXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
MjA4MTIwNzA1NTcuMTAyODQ5OS00LXRvbmd0aWFuZ2VuQGh1YXdlaS5jb20vIAo+Pj4+Cj4+Pj4K
Pj4+Cj4+PiBUaGlzIGlzIHBhcnQgb2YgdGhlIGluZm9ybWF0aW9uLCBidXQgSSBoYWQgYWxyZWFk
eSBmb3VuZCB0aGlzLiBXaGF0J3MKPj4+IHN0aWxsIG1pc3NpbmcgdG8gbWUgYXJlIHRoZSByaXNj
diBwYXRjaGVzLCBvciBhdCBsZWFzdCBhIHJpc2N2IHBsYW4sIGZvcgo+Pj4gYWN0dWFsbHkgaW1w
bGVtZW50aW5nIHNvbWV0aGluZyB3aGljaCByZXF1aXJlcyBrYWNjZXNzIGFuZCB1YWNjZXNzIHRv
IAo+Pj4gaGF2ZQo+Pj4gZGlzdGluY3QgdHlwZXMuCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gZHJldwo+
Pgo+PiBBdCBwcmVzZW50LCB0aGVyZSBpcyBubyBzdWNoIHBsYW4gb24gcmlzY3YsIGJlY2F1c2Ug
aXQgaXMgcmVseSBvbgo+PiBoYXJkd2FyZSBzdXBwb3J0Lgo+PiBJIHRoaW5rIHRoaXMgcGF0Y2gg
Y2FuIGJlIG1lcmdlZCBhcyBhIHNtYWxsIGNvZGUgb3B0aW1pemF0aW9uIGFuZAo+PiB3aXRob3V0
IGFueSBmdW5jdGlvbiBjaGFuZ2UuCj4gCj4gR2VuZXJhbGx5IHdlIG5lZWQgc29tZSB1c2Ugb2Yg
dGhlIGNvZGUgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbCB0byBqdXN0aWZ5IAo+IGl0cyBleGlzdGVu
Y2UuwqAgSW4gdGhpcyBjYXNlIEkgZG9uJ3QgcmVhbGx5IHNlZSB0aGF0OiBpdCdzIGp1c3QgYW5v
dGhlciAKPiB0eXBlIHRoYXQncyBleGFjdGx5IHRoZSBzYW1lIGFzIHRoZSBleGlzdGluZyBvbmUs
IGhhdmluZyBzb21lIG91dCBvZiAKPiB0cmVlIGNvZGUgdGhhdCBkZXBlbmRzIG9uIG1ha2luZyB0
aGVzZSB0eXBlcyBkbyBzb21ldGhpbmcgZGlmZmVyZW50IAo+IGlzbid0IGEgc3VmZmljaWVudCBq
dXN0aWZpY2F0aW9uLgo+IC4KSGkgcGFsbWVyOgoKSSBhZ3JlZSB3aXRoIHRoaXMgcG9pbnQgdmVy
eSBtdWNo77yMbWFueSB0aGFua3MuCgpUb25nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
