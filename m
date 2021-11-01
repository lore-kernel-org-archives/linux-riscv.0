Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90ED7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 21:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA4760184
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 21:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EA4760184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xmission.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZS7/A0wAMFXaODl0De3iob7zYQi+WuspcilvTFpT/yA=; b=mINETpOXiGrd3qcDoOFUDbFen7
	PCaEz7mHAQkaUGOftkIxq4DQnTHP0L6jKtRdLskfTZazE32/2OVhqesVEMNDrOW8WHWfHlaZSjjQW
	q0FWyPO//SEALeCz0sw2ekWCZ2F9Pd+ta1fpePuX7GupUftE6k3e4poxaUl541WnJoWDeSLGqnXDV
	4HPUoYgC2kh7TGCT3GZx1f7GP1BQGXsFR0GB32J24mkpq0kVcdRUi6yd4sqLue0g28tS4tFDvT0A5
	Z0VQn6u0W/QhzXXrFdeh4hnfGf8EMl9YvykMX3DScXpTxt5rlw0qZVN9J6BrHA22qhhE302E7dnk7
	CZGeOe6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mheev-00HKwo-C2; Mon, 01 Nov 2021 21:16:01 +0000
Received: from out01.mta.xmission.com ([166.70.13.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mheer-00HKve-IN; Mon, 01 Nov 2021 21:15:58 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:35836)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mheek-007Fck-MN; Mon, 01 Nov 2021 15:15:50 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:34714
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mheej-00B5mV-HN; Mon, 01 Nov 2021 15:15:50 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc: Liao Chang <liaochang1@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Nick Kossifidis <mick@ics.forth.gr>,
 jszhang@kernel.org, guoren@linux.alibaba.com,
 Pekka Enberg <penberg@kernel.org>, sunnanyong@huawei.com,
 wangkefeng.wang@huawei.com, changbin.du@intel.com, Alex Ghiti <alex@ghiti.fr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, kexec@lists.infradead.org
References: <20211030031832.165457-1-liaochang1@huawei.com>
 <20211030031832.165457-3-liaochang1@huawei.com>
 <87ee83goju.fsf@disp2133>
 <CAJ+HfNjaBQrBtOuMvTccbb2K-Ua=T1eZk0+70hp0_aOAc83A-Q@mail.gmail.com>
Date: Mon, 01 Nov 2021 16:15:42 -0500
In-Reply-To: <CAJ+HfNjaBQrBtOuMvTccbb2K-Ua=T1eZk0+70hp0_aOAc83A-Q@mail.gmail.com>
 (=?utf-8?Q?=22Bj=C3=B6rn_T=C3=B6pel=22's?= message of "Sun, 31 Oct 2021
 12:14:33 +0100")
Message-ID: <87a6inbmrl.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1mheej-00B5mV-HN; ; ; mid=<87a6inbmrl.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX18DBOf1ufm8A1FhY1m4kqu+CrD7jATo5Fs=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH 2/3] RISC-V: use memcpy for kexec_file mode
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_141557_635858_2256E89C 
X-CRM114-Status: GOOD (  22.08  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9uIFNhdCwg
MzAgT2N0IDIwMjEgYXQgMDU6NTEsIEVyaWMgVy4gQmllZGVybWFuIDxlYmllZGVybUB4bWlzc2lv
bi5jb20+IHdyb3RlOgo+Pgo+PiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+IHdy
aXRlczoKPj4KPj4gPiBUaGUgcG9pbnRlciB0byBidWZmZXIgbG9hZGluZyBrZXJuZWwgYmluYXJp
ZXMgaXMgaW4ga2VybmVsIHNwYWNlIGZvcgo+PiA+IGtleGVjX2ZpbCBtb2RlLCBXaGVuIGNvcHlf
ZnJvbV91c2VyIGNvcGllcyBkYXRhIGZyb20gcG9pbnRlciB0byBhIGJsb2NrCj4+ID4gb2YgbWVt
b3J5LCBpdCBjaGVja2VzIHRoYXQgdGhlIHBvaW50ZXIgaXMgaW4gdGhlIHVzZXIgc3BhY2UgcmFu
Z2UsIG9uCj4+ID4gUklTQ1YtViB0aGF0IGlzOgo+PiA+Cj4+ID4gc3RhdGljIGlubGluZSBib29s
IF9fYWNjZXNzX29rKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQo+PiA+
IHsKPj4gPiAgICAgICByZXR1cm4gc2l6ZSA8PSBUQVNLX1NJWkUgJiYgYWRkciA8PSBUQVNLX1NJ
WkUgLSBzaXplOwo+PiA+IH0KPj4gPgo+PiA+IGFuZCBUQVNLX1NJWkUgaXMgMHg0MDAwMDAwMDAw
IGZvciA2NC1iaXRzLCB3aGljaCBub3cgY2F1c2VzCj4+ID4gY29weV9mcm9tX3VzZXIgdG8gcmVq
ZWN0IHRoZSBhY2Nlc3Mgb2YgdGhlIGZpZWxkICdidWYnIG9mIHN0cnVjdAo+PiA+IGtleGVjX3Nl
Z21lbnQgdGhhdCBpcyBpbiByYW5nZSBbQ09ORklHX1BBR0VfT0ZGU0VUIC0gVk1BTExPQ19TSVpF
LAo+PiA+IENPTkZJR19QQUdFX09GRlNFVCksIGlzIGludmFsaWQgdXNlciBzcGFjZSBwb2ludGVy
Lgo+PiA+Cj4+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGlzIGlzc3VlIGJ5IHNraXBwaW5nIGFjY2Vz
c19vaygpLCB1c2UgbWVtcGN5KCkgaW5zdGVhZC4KPj4KPj4gSSBhbSBhIGJpdCBjb25mdXNlZC4K
Pj4KPj4gV2h5IGlzIG1hY2hpbmVfa2V4ZWMgZXZlciBjYWxsaW5nIGNvcHlfZnJvbV91c2VyPyAg
VGhhdCBzZWVtcyB3cm9uZyBpbgo+PiBhbGwgY2FzZXMuCj4+Cj4KPiBJdCdzIG5vdCBtYWNoaW5l
X2tleGVjIC0tIGl0J3MgbWFjaGluZV9rZXhlY19wcmVwYXJlLCB3aGljaCBwdWxscyBvdXQKPiB0
aGUgRkRUIGZyb20gdGhlIGltYWdlLiBJdCBsb29rcyBsaWtlIE1JUFMgZG9lcyBpdCBzaW1pbGFy
bHkuCj4KPiAoQ2F2ZWF0OiBJIG1pZ2h0IGJlIGNvbmZ1c2VkIGFzIHdlbGwhIDstKSkKClRydWUg
aXQgaXMgbWFjaGluZV9rZXhlY19wcmVwYXJlLiAgQnV0IHN0aWxsLiAgY29weV9mcm9tX3VzZXIg
ZG9lcyBub3QKYmVsb25nIGluIHRoZXJlLiAgSXQgaXMgbm90IHBhc3NlZCBhIHVzZXJzcGFjZSBw
b2ludGVyLgoKVGhpcyBsb29rcyBtb3JlIGxpa2UgYSBjYXNlIGZvciBrbWFwIHRvIHJlYWQgYSB0
YWJsZSBmcm9tIHRoZSBmaXJtd2FyZS4KCkV2ZW4gaWYgaXQgc29tZW9uZSBtYWRlIHNlbnNlIGl0
IGRlZmluaXRlbHkgZG9lcyBub3QgbWFrZSBzZW5zZSB0bwptYWtlIGl0IGEgY29uZGl0aW9uYWwg
Y29weV9mcm9tX3VzZXIuICBUaGF0IHdheSBsaWVzIG1hZG5lc3MuCgpUaGUgZW50aXJlIGNoYW5n
ZSBpcyBhIHNtZWxsIHRoYXQgdGhlcmUgaXMgc29tZSBhYnN0cmFjdGlvbiB0aGF0IGlzCmdvaW5n
IHdyb25nLCBhbmQgdGhhdCBhYnN0cmFjdGlvbiBuZWVkcyB0byBnZXQgZml4ZWQuCgpFcmljCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
