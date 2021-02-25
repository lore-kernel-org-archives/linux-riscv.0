Return-Path: <SRS0=t5Vp=H3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCECC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 11:56:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F9D964F13
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 11:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F9D964F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qowp6bd+eBLr3p/2oTxoXlac6yac6VTlOglNhuvxRJU=; b=bKIMM0abEks8/v1XV5zaLktcR
	ld2CAK0+VZyryF2nrmq7C/qe345msiKQjmZVssrbuPfh5WqyrhBRy6HnSfBlQXIX5ASH8RALyIBOm
	ocwRlCIbpHE97lttfdO0y+Ue6Iau/KXEGr2R3m184Al1opDltJ58JVMCJnZOJrUGXeIM28W0KmZXJ
	DLScD/Fx3Ua+E+IBg5zkBGpZvlLwa/fKkbLIb+KanXN+nc5+L7le/rAxU8twNJcMVN+GBr3mgjmPX
	m3GNs6d2y1UjDipzDDtTG/VQ1HWBuosdLNakSCNYVlWqaWagOYyiSTg9zyZDZFj4QHTuKBCTjc9HZ
	pTRYUEgog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFFFq-0003Ta-4L; Thu, 25 Feb 2021 11:56:26 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFFFm-0003SR-Aj
 for linux-riscv@lists.infradead.org; Thu, 25 Feb 2021 11:56:23 +0000
Received: from [192.168.43.237] (35.161.185.81.rev.sfr.net [81.185.161.35])
 (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 85E2B200008;
 Thu, 25 Feb 2021 11:56:12 +0000 (UTC)
Subject: Re: [PATCH 2/3] Documentation: riscv: Add documentation that
 describes the VM layout
To: David Hildenbrand <david@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20210225080453.1314-1-alex@ghiti.fr>
 <20210225080453.1314-3-alex@ghiti.fr>
 <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <7d9036d9-488b-47cc-4673-1b10c11baad0@ghiti.fr>
Date: Thu, 25 Feb 2021 06:56:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_065622_524734_58C957B0 
X-CRM114-Status: GOOD (  11.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

TGUgMi8yNS8yMSDDoCA1OjM0IEFNLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoCB8PiAr
IAo+IGZmZmZmZmMwMDAwMDAwMDAgfCAtMjU2wqDCoMKgIEdCIHwgZmZmZmZmYzdmZmZmZmZmZiB8
wqDCoCAzMiBHQiB8IGthc2FuCj4+ICvCoMKgIGZmZmZmZmNlZmVlMDAwMDAgfCAtMTk2wqDCoMKg
IEdCIHwgZmZmZmZmY2VmZWZmZmZmZiB8wqDCoMKgIDIgTUIgfCBmaXhtYXAKPj4gK8KgwqAgZmZm
ZmZmY2VmZjAwMDAwMCB8IC0xOTbCoMKgwqAgR0IgfCBmZmZmZmZjZWZmZmZmZmZmIHzCoMKgIDE2
IE1CIHwgUENJIGlvCj4+ICvCoMKgIGZmZmZmZmNmMDAwMDAwMDAgfCAtMTk2wqDCoMKgIEdCIHwg
ZmZmZmZmY2ZmZmZmZmZmZiB8wqDCoMKgIDQgR0IgfCB2bWVtbWFwCj4+ICvCoMKgIGZmZmZmZmQw
MDAwMDAwMDAgfCAtMTkywqDCoMKgIEdCIHwgZmZmZmZmZGZmZmZmZmZmZiB8wqDCoCA2NCBHQiB8
IAo+PiB2bWFsbG9jL2lvcmVtYXAgc3BhY2UKPj4gK8KgwqAgZmZmZmZmZTAwMDAwMDAwMCB8IC0x
MjjCoMKgwqAgR0IgfCBmZmZmZmZmZjdmZmZmZmZmIHzCoCAxMjYgR0IgfCAKPj4gZGlyZWN0IG1h
cHBpbmcgb2YgYWxsIHBoeXNpY2FsIG1lbW9yeQo+IAo+IF4gU28geW91IGNvdWxkIG5ldmVyIGV2
ZXIgaGF2ZSBtb3JlIHRoYW4gMTI2IEdCLCBjb3JyZWN0Pwo+IAo+IEkgYXNzdW1lIHRoYXQncyBu
b3RoaW5nIG5ldy4KPiAKCkJlZm9yZSB0aGlzIHBhdGNoLCB0aGUgbGltaXQgd2FzIDEyOEdCLCBz
byBpbiBteSBzZW5zZSwgdGhlcmUgaXMgbm90aGluZyAKbmV3LiBJZiBldmVyIHdlIHdhbnQgdG8g
aW5jcmVhc2UgdGhhdCBsaW1pdCwgd2UnbGwganVzdCBoYXZlIHRvIGxvd2VyIApQQUdFX09GRlNF
VCwgdGhlcmUgaXMgc3RpbGwgc29tZSB1bnVzZWQgdmlydHVhbCBhZGRyZXNzZXMgYWZ0ZXIga2Fz
YW4gCmZvciBleGFtcGxlLgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
