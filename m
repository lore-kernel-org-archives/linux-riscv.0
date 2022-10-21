Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F227DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IePHSqvavTRm48CRyJTu2AA+97M8BI6CJD+QKStVHWs=; b=Jdt+gfZNtm+KsD
	0pgz1PLAp4x2Yn/Wg5TEwsD92uwfFynm625DKHcp+ZlfE6liweJ9MlBdb+ZBNCFM3bByOO+1BhNEz
	+DgCDtwrafSjFFVNbzXggrhN8iaR1nAc3qRdAt4sLTvOWDY77v3UJ3z4lMs79DL/NNws0VpCVBDLS
	MmIUhOiT4RqOHMxaqk64o2WreNWxUyIC72Xj7da7IjKY7rPvLPpWvblIWy4lZtPYZcWvr/dLqWBjl
	b8XfhKMxHkpaA81jA7QfVQNvQY/b8cSa7wcckf5bcDvhXOhLUys2sfo35kJTLVgnCay67wCUN1Inl
	E7sbon8AMpn9a0jdPDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhzi-004WES-Hp; Fri, 21 Oct 2022 02:42:46 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhzd-004WAw-JG; Fri, 21 Oct 2022 02:42:43 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VShO5TF_1666320153;
Received: from 30.221.97.251(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VShO5TF_1666320153)
          by smtp.aliyun-inc.com;
          Fri, 21 Oct 2022 10:42:35 +0800
Message-ID: <4bccb5c9-6385-23d9-d496-65f9bd06beb2@linux.alibaba.com>
Date: Fri, 21 Oct 2022 10:42:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [Crash-utility][PATCH V4 1/9] Add RISCV64 framework code support
To: =?UTF-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+IOS4gOS7gSk=?= <k-hagio-ab@nec.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "hschauhan@nulltrace.org" <hschauhan@nulltrace.org>,
 "lifang_xia@linux.alibaba.com" <lifang_xia@linux.alibaba.com>,
 "crash-utility@redhat.com" <crash-utility@redhat.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 "heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "yixun.lan@gmail.com" <yixun.lan@gmail.com>,
 "lijiang@redhat.com" <lijiang@redhat.com>
References: <20221020015014.46085-1-xianting.tian@linux.alibaba.com>
 <20221020015014.46085-2-xianting.tian@linux.alibaba.com>
 <4022d4a1-8967-3d09-e158-5a6f78f73655@nec.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
In-Reply-To: <4022d4a1-8967-3d09-e158-5a6f78f73655@nec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_194241_826465_E5F7719A 
X-CRM114-Status: GOOD (  13.18  )
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

CuWcqCAyMDIyLzEwLzIxIOS4iuWNiDEwOjE3LCBIQUdJTyBLQVpVSElUTyjokKnlsL4g5LiA5LuB
KSDlhpnpgZM6Cj4gT24gMjAyMi8xMC8yMCAxMDo1MCwgWGlhbnRpbmcgVGlhbiB3cm90ZToKPgo+
PiBkaWZmIC0tZ2l0IGEvUkVBRE1FIGIvUkVBRE1FCj4+IGluZGV4IDVhYmJjZTEuLmQ1ODllNzIg
MTAwNjQ0Cj4+IC0tLSBhL1JFQURNRQo+PiArKysgYi9SRUFETUUKPj4gQEAgLTM3LDcgKzM3LDcg
QEAKPj4gICAgICBUaGVzZSBhcmUgdGhlIGN1cnJlbnQgcHJlcmVxdWlzaXRlczoKPj4gICAgCj4+
ICAgICAgbyAgQXQgdGhpcyBwb2ludCwgeDg2LCBpYTY0LCB4ODZfNjQsIHBwYzY0LCBwcGMsIGFy
bSwgYXJtNjQsIGFscGhhLCBtaXBzLAo+PiAtICAgICBtaXBzNjQsIHMzOTAgYW5kIHMzOTB4LWJh
c2VkIGtlcm5lbHMgYXJlIHN1cHBvcnRlZC4gIE90aGVyIGFyY2hpdGVjdHVyZXMKPj4gKyAgICAg
bWlwczY0LCByaXNjdjY0LCBzMzkwIGFuZCBzMzkweC1iYXNlZCBrZXJuZWxzIGFyZSBzdXBwb3J0
ZWQuICBPdGhlciBhcmNoaXRlY3R1cmVzCj4+ICAgICAgICAgbWF5IGJlIGFkZHJlc3NlZCBpbiB0
aGUgZnV0dXJlLgo+IFNlbnRlbmNlcyBpbiB0aGUgUkVBRE1FIGFyZSB3cmFwcGVkIHdpdGhpbiA4
MCBjaGFyYWN0ZXJzLCBJIHdpbGwgY2hhbmdlCgp0aGFua3MsCgpEbyB5b3UgbmVlZCBtZSB0byBz
ZW5kIFY1IHBhdGNoIHNldCB0byBmaXggdGhpcz8KCj4gdGhpcyB0bzoKPgo+ICsgICAgIG1pcHM2
NCwgcmlzY3Y2NCwgczM5MCBhbmQgczM5MHgtYmFzZWQga2VybmVscyBhcmUgc3VwcG9ydGVkLiAg
T3RoZXIKPiArICAgICBhcmNoaXRlY3R1cmVzIG1heSBiZSBhZGRyZXNzZWQgaW4gdGhlIGZ1dHVy
ZS4KPgo+PiAgICAKPj4gICAgICBvICBPbmUgc2l6ZSBmaXRzIGFsbCAtLSB0aGUgdXRpbGl0eSBj
YW4gYmUgcnVuIG9uIGFueSBMaW51eCBrZXJuZWwgdmVyc2lvbgo+PiBAQCAtOTgsNiArOTgsOCBA
QAo+PiAgICAgICAgIGFybTY0IGR1bXBmaWxlcyBtYXkgYmUgYnVpbHQgYnkgdHlwaW5nICJtYWtl
IHRhcmdldD1BUk02NCIuCj4+ICAgICAgbyAgT24gYW4geDg2XzY0IGhvc3QsIGFuIHg4Nl82NCBi
aW5hcnkgdGhhdCBjYW4gYmUgdXNlZCB0byBhbmFseXplCj4+ICAgICAgICAgcHBjNjRsZSBkdW1w
ZmlsZXMgbWF5IGJlIGJ1aWx0IGJ5IHR5cGluZyAibWFrZSB0YXJnZXQ9UFBDNjQiLgo+PiArICBv
ICBPbiBhbiB4ODZfNjQgaG9zdCwgYW4geDg2XzY0IGJpbmFyeSB0aGF0IGNhbiBiZSB1c2VkIHRv
IGFuYWx5emUKPj4gKyAgICAgcmlzY3Y2NCBkdW1wZmlsZXMgbWF5IGJlIGJ1aWx0IGJ5IHR5cGlu
ZyAibWFrZSB0YXJnZXQ9UklTQ1Y2NCIuCj4+ICAgIAo+PiAgICAgIFRyYWRpdGlvbmFsbHkgd2hl
biB2bWNvcmVzIGFyZSBjb21wcmVzc2VkIHZpYSB0aGUgbWFrZWR1bXBmaWxlKDgpIGZhY2lsaXR5
Cj4+ICAgICAgdGhlIGxpYnogY29tcHJlc3Npb24gbGlicmFyeSBpcyB1c2VkLCBhbmQgYnkgZGVm
YXVsdCB0aGUgY3Jhc2ggdXRpbGl0eQo+Cj4+IGRpZmYgLS1naXQgYS9oZWxwLmMgYi9oZWxwLmMK
Pj4gaW5kZXggOTkyMTRjMS4uMjUzYzcxYiAxMDA2NDQKPj4gLS0tIGEvaGVscC5jCj4+ICsrKyBi
L2hlbHAuYwo+PiBAQCAtOTUxMiw3ICs5NTEyLDcgQEAgY2hhciAqUkVBRE1FW10gPSB7Cj4+ICAg
ICIgIFRoZXNlIGFyZSB0aGUgY3VycmVudCBwcmVyZXF1aXNpdGVzOiAiLAo+PiAgICAiIiwKPj4g
ICAgIiAgbyAgQXQgdGhpcyBwb2ludCwgeDg2LCBpYTY0LCB4ODZfNjQsIHBwYzY0LCBwcGMsIGFy
bSwgYXJtNjQsIGFscGhhLCBtaXBzLCIsCj4+IC0iICAgICBtaXBzNjQsIHMzOTAgYW5kIHMzOTB4
LWJhc2VkIGtlcm5lbHMgYXJlIHN1cHBvcnRlZC4gIE90aGVyIGFyY2hpdGVjdHVyZXMiLAo+PiAr
IiAgICAgbWlwczY0LCByaXNjdjY0LCBzMzkwIGFuZCBzMzkweC1iYXNlZCBrZXJuZWxzIGFyZSBz
dXBwb3J0ZWQuICBPdGhlciBhcmNoaXRlY3R1cmVzIiwKPj4gICAgIiAgICAgbWF5IGJlIGFkZHJl
c3NlZCBpbiB0aGUgZnV0dXJlLiIsCj4+ICAgICIiLAo+PiAgICAiICBvICBPbmUgc2l6ZSBmaXRz
IGFsbCAtLSB0aGUgdXRpbGl0eSBjYW4gYmUgcnVuIG9uIGFueSBMaW51eCBrZXJuZWwgdmVyc2lv
biIsCj4gU2FtZSBhcyBhYm92ZS4KPgo+IEFuZCBoZWxwLmMgbGFja3MgdGhpcyBwYXJ0LCB3aWxs
IGFkZDoKPgo+IEBAIC05NTcyLDYgKzk1NzIsOCBAQCBSRUFETUVfRU5URVJfRElSRUNUT1JZLAo+
ICAgICIgICAgIGFybTY0IGR1bXBmaWxlcyBtYXkgYmUgYnVpbHQgYnkgdHlwaW5nIFwibWFrZSB0
YXJnZXQ9QVJNNjRcIi4iLAo+ICAgICIgIG8gIE9uIGFuIHg4Nl82NCBob3N0LCBhbiB4ODZfNjQg
YmluYXJ5IHRoYXQgY2FuIGJlIHVzZWQgdG8gYW5hbHl6ZSIsCj4gICAgIiAgICAgcHBjNjRsZSBk
dW1wZmlsZXMgbWF5IGJlIGJ1aWx0IGJ5IHR5cGluZyBcIm1ha2UgdGFyZ2V0PVBQQzY0XCIuIiwK
PiArIiAgbyAgT24gYW4geDg2XzY0IGhvc3QsIGFuIHg4Nl82NCBiaW5hcnkgdGhhdCBjYW4gYmUg
dXNlZCB0byBhbmFseXplIiwKPiArIiAgICAgcmlzY3Y2NCBkdW1wZmlsZXMgbWF5IGJlIGJ1aWx0
IGJ5IHR5cGluZyBcIm1ha2UgdGFyZ2V0PVJJU0NWNjRcIi4iLAo+ICAgICIiLAo+ICAgICIgIFRy
YWRpdGlvbmFsbHkgd2hlbiB2bWNvcmVzIGFyZSBjb21wcmVzc2VkIHZpYSB0aGUgbWFrZWR1bXBm
aWxlKDgpIGZhY2lsaXR5IiwKPiAgICAiICB0aGUgbGlieiBjb21wcmVzc2lvbiBsaWJyYXJ5IGlz
IHVzZWQsIGFuZCBieSBkZWZhdWx0IHRoZSBjcmFzaCB1dGlsaXR5IiwKPgo+Cj4gV2l0aCB0aGVz
ZSwgdGhlIHY0IGNyYXNoIHBhdGNoIHNldCBsb29rcyBnb29kIHRvIG1lLgo+Cj4gQWNrZWQtYnk6
IEthenVoaXRvIEhhZ2lvIDxrLWhhZ2lvLWFiQG5lYy5jb20+Cj4KPiBUaGFua3MsCj4gS2F6dQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
