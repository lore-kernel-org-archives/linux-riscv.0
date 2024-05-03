Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9105EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpEbwSR3g8XfjiB+6l1h61CamN3rwa2589KYOAKo/Mg=; b=JWo7fZrGmCwEk2
	ePqDdhxGxIwUMi7yygpITH5L6nnx29W6Pdq9OroB0cMHA1aBLJB1kOZxInJgyO94GY5Cr1mBeCjqz
	YgJDTdImIGTYjTqHdiiw/seCcUmsm9iuvQIK5SGDmC3Ojlk7XaVMwpt7gRiujFcLxvmRHCaq5oK/I
	l12rLnKO2xmEGie7QU1pe/0YGZoCxymVOdUJzXWwHYjK+6SPf+LRjLuEJnH1viwORd4wkockn7cti
	nf/Xi+1MeFwDHAh22yWWCEu/ROPuB/NNDv/A+evZGLIzSsIn7wP80VgJvJwXx5fp4BrsUY25QKSm8
	zOvpu0TBtCOErSX7i6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rte-0000000GP1F-0OfS;
	Fri, 03 May 2024 12:20:14 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rta-0000000GOxF-474c
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 12:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nrKtj6pAhuqpN++t5oFkqusThl46U1xzi7qk6r4wSuM=; b=S9xoFgyUSJE2p/2JBqE0YpGBpJ
	QwckRrBl9cBYy++fD+wFfHSF0GCtxPDsRg4xnpytbcvoe516loFGg7raYIKeXvDuM1EQgUw3qrqe8
	EfWtriskAQF3S74PnEmsfAxleewBbxj8Iz7NbuMysAaplmm8VnYDJYJNBiLp0hqsb1oJSdyY0XQWg
	jVlqTxSh6An7dE8fpUpMRcaR6r5Lb9TMNhpZt1Z2mXW/nTGyA1jaRgw9ivWAhFudkbe7nPQ4sZFa1
	ToiFSN9VqVjPIW0W/y1HxEgPmICmwLXTUznruhbxW+cjpx0o6iDMJPz9qBdKAISACcXcVsWqGPG1L
	We43Catw==;
Received: from [167.98.27.226] (helo=[10.35.6.244])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1s2rtE-004KaJ-2W; Fri, 03 May 2024 13:19:48 +0100
Message-ID: <4bc238eb-410b-46b1-98e1-4aaa35e34404@codethink.co.uk>
Date: Fri, 3 May 2024 13:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: Allow the last potential unrolled copy
Content-Language: en-GB
To: Alexandre Ghiti <alex@ghiti.fr>, Xiao Wang <xiao.w.wang@intel.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: jerry.shih@sifive.com, nick.knight@sifive.com, ajones@ventanamicro.com,
 bjorn@rivosinc.com, andy.chiu@sifive.com, viro@zeniv.linux.org.uk,
 cleger@rivosinc.com, alexghiti@rivosinc.com, haicheng.li@intel.com,
 akira.tsukamoto@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240313103334.4036554-1-xiao.w.wang@intel.com>
 <7ebc5b28-7115-494f-a607-e46c71214cce@ghiti.fr>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <7ebc5b28-7115-494f-a607-e46c71214cce@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_052011_209557_D3B0A54A 
X-CRM114-Status: GOOD (  15.97  )
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

T24gMDMvMDUvMjAyNCAxMzoxNiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIFhpYW8sCj4g
Cj4gT24gMTMvMDMvMjAyNCAxMTozMywgWGlhbyBXYW5nIHdyb3RlOgo+PiBXaGVuIHRoZSBkc3Qg
YnVmZmVyIHBvaW50ZXIgcG9pbnRzIHRvIHRoZSBsYXN0IGFjY2Vzc2libGUgYWxpZ25lZCAKPj4g
YWRkciwgd2UKPj4gY291bGQgc3RpbGwgcnVuIGFub3RoZXIgaXRlcmF0aW9uIG9mIHVucm9sbGVk
IGNvcHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpYW8gV2FuZyA8eGlhby53LndhbmdAaW50ZWwu
Y29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TIHwgMiArLQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyBiL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3Mu
Uwo+PiBpbmRleCAyZTY2NWY4ZjhmY2MuLjEzOTlkNzk3ZDgxYiAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+ICsrKyBiL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+
PiBAQCAtMTAzLDcgKzEwMyw3IEBAIFNZTV9GVU5DX1NUQVJUKGZhbGxiYWNrX3NjYWxhcl91c2Vy
Y29weSkKPj4gwqDCoMKgwqDCoCBmaXh1cCBSRUdfU8KgwqAgdDQswqAgNypTWlJFRyhhMCksIDEw
Zgo+PiDCoMKgwqDCoMKgIGFkZGnCoMKgwqAgYTAsIGEwLCA4KlNaUkVHCj4+IMKgwqDCoMKgwqAg
YWRkacKgwqDCoCBhMSwgYTEsIDgqU1pSRUcKPj4gLcKgwqDCoCBibHR1wqDCoMKgIGEwLCB0MCwg
MmIKPj4gK8KgwqDCoCBibGV1wqDCoMKgIGEwLCB0MCwgMmIKPj4gwqDCoMKgwqDCoCBhZGRpwqDC
oMKgIHQwLCB0MCwgOCpTWlJFRyAvKiByZXZlcnQgdG8gb3JpZ2luYWwgdmFsdWUgKi8KPj4gwqDC
oMKgwqDCoCBqwqDCoMKgIC5MYnl0ZV9jb3B5X3RhaWwKPiAKPiAKPiBJIGFncmVlIGl0IGlzIHN0
aWxsIHNhZmUgdG8gY29udGludWUgZm9yIGFub3RoZXIgd29yZF9jb3B5IGhlcmUuCj4gCj4gUmV2
aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KCk91dCBv
ZiBpbnRlcmVzdCwgaGFzIGFueW9uZSBjaGVja2VkIGlmIGNhdXNpbmcgYSBzY2hlZHVsZSBldmVu
dCBkdXJpbmcKdGhpcyBjb2RlIGJyZWFrcyBsaWtlIHRoZSBsYXN0IHRpbWUgd2UgaGFkIGlzc3Vl
cyB3aXRoIHRoZSB1cHN0cmVhbQp0ZXN0aW5nPwoKSSBkaWQgcHJvcG9zZSBzYXZpbmcgdGhlIHN0
YXRlIG9mIHRoZSB1c2VyLWFjY2VzcyBmbGFnIGluIHRoZSB0YXNrCnN0cnVjdCBidXQgd2UgbW9z
dGx5IHNvbHZlZCBpdCBieSBtYWtpbmcgc2xlZXBpbmcgZnVuY3Rpb25zIHN0YXkKYXdheSBmcm9t
IHRoZSBhZGRyZXNzIGNhbGN1bGF0aW9uLiBUaGlzIG9mIGNvdXJzZSBtYXkgaGF2ZSBiZWVuIGRv
bmUKYWxyZWFkeSBvciBuZWVkIHRvIGJlIGRvbmUgaWYgdGhyZWUncyBsb25nIGFyZWFzIHdoZXJl
IHRoZSB1c2VyLWFjY2VzcwpmbGFncyBjYW4gYmUgZGlzYWJsZWQgKGdlbmVyYWxseSBvbmx5IGEg
ZmV3IGRyaXZlcnMgZGlkIHRoaXMsIHNvIHdlCm1heSBub3QgaGF2ZSBjb21lIGFjcm9zcyB0aGUg
cHJvYmxlbSkKCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNl
bmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3
dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
