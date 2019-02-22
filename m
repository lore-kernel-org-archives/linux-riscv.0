Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E526C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 15:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E76520700
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 15:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ro35JhfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E76520700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tGvKVQzKCbedQPzSXris+cRpN8AWwIC23cPW02FVUQc=; b=Ro35JhfXnsW6hIkWZWu4XpdF0
	qo46aUqIRMjIcBcjTds43v7H6kdj+J5JsKNjRSa6tgaN+k6UFYyagAksHoRVZ0Ui4LTSa7T6KNa0t
	Z+Gt+FFdFu0eyYp7KRRyiDbtM9DAcyaWOvJkl9AMSwO2zQFQqfaP8ZRD9KZnbVfpzRmWwMt4RaxGr
	nIDS+/jNulymRi7LjlN0UX5YTfqc9VLhsc7aZCf/I58Og8unVYm9kj96kUhM/VKa4Mi/d1C3FgJeU
	OHqQcOQ1BpFeWrS360uBSIi1UFDjvOZMWAPy5FvWsqfUvLChc+sBwT6j7Eov4KpwZuDkMQedm6pLs
	nNL4A1GYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxCsO-00062y-Cn; Fri, 22 Feb 2019 15:36:36 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxCsL-00061R-1x
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 15:36:35 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x1MFaAEP014913; Fri, 22 Feb 2019 15:36:12 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-a9-5c7016e96c21
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 4B.48.09052.9E6107C5; Fri, 22 Feb 2019 17:36:09 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x1MFa9s9012971; Fri, 22 Feb 2019 17:36:09 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 22 Feb 2019 17:36:09 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
Organization: FORTH
In-Reply-To: <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
Message-ID: <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsXSHc2orPtSrCDGYMlPI4vz006xWVz/9obR
 YtvnFjaLzRMWsFp82PGX2YHVY+esu+weT65MZ/LYvKTe48bvXnaPS83X2QNYo7hsUlJzMstS
 i/TtErgyTk2cx17Qz1exe1tBA+MM7i5GTg4JAROJL3OXMncxcnEICRxmlHh6bwEbhHOIUWL3
 gnNMEFWmErP3djKC2LwCghInZz5hAbGZBSwkpl7Zzwhhy0s0b53NDGKzCKhKXJ7SC9bLJqAp
 Mf/SQaB6Dg4RATWJ7wtCIcrLJTZs6GYHsYUFZCUOvb0LNpJfQFji092LrCA2p0C8xLPTf6GO
 m80oMa3pEgvEDS4S1zr3M0PcpiLx4fcDsEGiAsoSL05MZ53AKDQLyamzkJw6C8mpCxiZVzEK
 JJYZ62UmF+ul5ReVZOilF21iBIf9XN8djOcW2B9iFOBgVOLhDfiUHyPEmlhWXJkLDBgOZiUR
 3mP/gEK8KYmVValF+fFFpTmpxYcYpTlYlMR5D78IDxISSE8sSc1OTS1ILYLJMnFwSjUwVh44
 NeFa9v5t3za+tNp+J5/N3bBWuTK887T48uzwnxsvbmsPu/e22N9wFu/q1XO1PoqXLa/NvRDd
 ILPA07Rx3Ztdj6Se/C25faRe5kamWvP8NxdnVq6/P2mPf5XFtk8KRyrUVrgcq3625dJyhS/N
 F3cusj0XcP110PVfBnamcVX6BU9L7/+/c0SJpTgj0VCLuag4EQDx2263dwIAAA==
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Fri, 22 Feb 2019 15:36:12 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Fri, 22 Feb 2019 15:36:12 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_073633_460369_7171970C 
X-CRM114-Status: GOOD (  13.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: bjorn.topel@gmail.com, paul@pwsan.com, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wMi0yMiAxNzowNCwgQ2hyaXN0b3BoZXIgTGFtZXRlciDOrc6zz4HOsc+I
zrU6Cj4gT24gVGh1LCAyMSBGZWIgMjAxOSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gCj4+IFRo
YXQgc2FpZCwgaXQncyBhbGwgYSBtb290IHBvaW50IGhlcmU6IG91ciBMUi9TQyBpbnN0cnVjdGlv
bnMgYXJlIHBhcnQgCj4+IG9mIHRoZQo+PiBBIGV4dGVuc2lvbiwgc28gaWYgeW91IGhhdmUgdGhv
c2UgeW91IGhhdmUgQU1Pcy4gIFRoZSBnZW5lcmFsIHBvbGljeSAKPj4gaGVyZSBpcwo+PiB0aGF0
IGlmIHRoZXJlIGlzIGFuIEFNTyB0aGF0IGVmZmljaWVudGx5IGltcGxlbWVudHMgd2hhdCB5b3Un
cmUgCj4+IGxvb2tpbmcgZm9yCj4+IHRoZW4gaXQgc2hvdWxkIGJlIHByZWZlcnJlZCB0byBhbiBM
Ui9TQyBzZXF1ZW5jZS4gIFRoaXMgc3BlY2lmaWMgY2FzZSAKPj4gaXMKPj4gYWN0dWFsbHkgb25l
IG9mIHRoZSBwbGFjZXMgd2hlcmUgQU1PcyBoYXZlIGEgYmlnIGJlbmVmaXQgYXMgb3Bwb3NlZCB0
byAKPj4gTFIvU0MKPj4gc2VxdWVuY2VzLCB3aXRoIHRoZSBBTU8gaW1wbGVtZW50YXRpb24gbG9v
a2luZyByb3VnaGx5IGxpa2UKPj4gCj4+ICAgIGxpIHQwLCAxCj4+ICAgIGxhIHQxLCBjb3VudGVy
Cj4+ICAgIGFtb2FkZC53IHplcm8sIHQwLCAwKHQxKQo+IAo+IENhbiB5b3UgYWRkIGEgcmVnaXN0
ZXIgdGhhdCBjb250YWlucyB0aGUgcGVyIGNwdSBhcmVhIGFkZHJlc3MgZm9yIHRoZQo+IGN1cnJl
bnQgaGFyZHdhcmUgdGhyZWFkIGluIGFtb2FkZD8KPiAKPiBJZiB3ZSBkbyBub3QgZGlzYWJsZSBp
bnRlcnJ1cHRzIGFuZCBwcmVlbXB0aW9uIHRoZW4gdGhlIGluc3RydWN0aW9uIAo+IGNvdWxkCj4g
YmUgZXhlY3V0ZWQgb24gYW55IHByb2Nlc3NvciBzaW5jZSB0aGUgT1MgbWF5IHByZWVtcHQgYW5k
IHJlc2NoZWR1bGUgCj4gdGhlCj4ga2VybmVsIHRocmVhZCBhcmJpdHJhcmlseS4gV2UgbmVlZCBh
IGdsb2JhbCByZWdpc3RlciB0aGF0IGNvbnRhaW5zIHRoZSAKPiBwZXIKPiBjcHUgYXJlYSBhZGRy
ZXNzICh3aGljaCBpcyBkaWZmZXJlbnQgZm9yIGV2ZXJ5IGhhcmR3YXJlIHRocmVhZCkuIElmIHRo
ZQo+IGluc3RydWN0aW9uIGlzIHJlc2NoZWR1bGVkIG9uIGEgZGlmZmVyZW50IHRocmVhZCB0aGVu
IHRoZSBvdGhlciBvZmZzZXQKPiBuZWVkcyB0byBiZSB1c2VkIHNvIHRoZSBpbnN0cnVjdGlvbiBu
ZWVkIHRvIHNwZWNpZnkgdGhhdCB0aGUgYWRkcmVzIGlzCj4gcmVsYXRpdmUgdG8gdGhhdCBnbG9i
YWwgcmVnaXN0ZXIuCj4gCj4gUG93ZXJQQyB1c2VzIHN1Y2ggYSBnbG9iYWwgcmVnaXN0ZXIuIE9u
IEludGVsIHRoZSBHUyBzZWdtZW50IHJlZ2lzdGVyIAo+IGlzCj4gYWJ1c2VkIGZvciB0aGF0IHB1
cnBvc2UuCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgoKSG93IGFib3V0IHRoZSBzY3JhdGNoIHJlZ2lzdGVycyBkZWZpbmVkIG9uIHBy
aXYgc3BlYyA/IFdlIGFscmVhZHkgdXNlIApzc2NyYXRjaCBvbiBMaW51eCBmb3Iga2VlcGluZyBw
ZXItaGFydCBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzIChjaGVjayBvdXQgCmVudHJ5LlMpIGFuZCBt
c2NyYXRjaCBvbiBPcGVuU0JJIGZvciBrZWVwaW5nIHBlci1oYXJ0IHN0YXRlIGV0Yy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
