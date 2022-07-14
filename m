Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299FEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRpyGn7dLmUOcneHvR7wL2fsmN7MVdCUoCEeLgcmuII=; b=VW3fM9Pr3P2UP2UKvhz4J/+Bv7
	CAWnSD6/l26xvGZNRn2MJGS96AtY1Za6kIA4DdqFC0GFDw2h8g8E15/1AkbAdGYSCDaP50pykKsKm
	VHG4rRnflPjMfItIu6W4dBzDDj4zpOkfddLJlParia7TzKUE3kVaBQ+sTe/n5TMyZpE75mZCaZ2tt
	oFKOCSEJf+rxSwp0pWLYEzbc98bQyg1G8UQ6tVqDX4QodtcCj0xZ+0iD4iPQ+gYGu9eq3t24g5I59
	J2GhSuo+0mxJ6JT2j1JvtjAQBZOIUycaFh2InTfBJ9DDAyyAZvDQ6pTEnCgFB3Kk4JtP7JiujuVoF
	VIay5vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwfk-00DaXO-It; Thu, 14 Jul 2022 11:06:20 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwfg-00DaPl-9B
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 11:06:18 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VJJBXzu_1657796763;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJJBXzu_1657796763)
          by smtp.aliyun-inc.com;
          Thu, 14 Jul 2022 19:06:04 +0800
Subject: Re: [PATCH V2 2/2] riscv: Add modules to virtual kernel memory layout
 dump
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, Guo Ren
 <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Mike Rapoport <rppt@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 huanyi.xj@alibaba-inc.com
References: <20220714025901.359695-1-xianting.tian@linux.alibaba.com>
 <CAK8P3a3-jKEs+uGL=_kjmfzao6DYgmrkO+YWtNhv5O+hFw_qog@mail.gmail.com>
 <f706ddff-8444-bba1-a98a-23a1333cc70a@linux.alibaba.com>
 <3975689.5fSG56mABF@diego>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <46732d07-f14b-2fd1-5606-1582f69b8d00@linux.alibaba.com>
Date: Thu, 14 Jul 2022 19:06:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3975689.5fSG56mABF@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_040616_529990_4C7FB16C 
X-CRM114-Status: GOOD (  15.61  )
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

CuWcqCAyMDIyLzcvMTQg5LiL5Y2INTo0NiwgSGVpa28gU3TDvGJuZXIg5YaZ6YGTOgo+IEFtIERv
bm5lcnN0YWcsIDE0LiBKdWxpIDIwMjIsIDExOjE3OjI2IENFU1Qgc2NocmllYiBYaWFudGluZyBU
aWFuOgo+PiDlnKggMjAyMi83LzE0IOS4i+WNiDQ6MjQsIEFybmQgQmVyZ21hbm4g5YaZ6YGTOgo+
Pj4gT24gVGh1LCBKdWwgMTQsIDIwMjIgYXQgNDo1OSBBTSBYaWFudGluZyBUaWFuCj4+PiA8eGlh
bnRpbmcudGlhbkBsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4+Pj4gQXMgTU9EVUxFUyBpcyBv
bmx5IGRlZmluZWQgZm9yIENPTkZJR182NEJJVCwgc28gd2UgZHVtcCBpdCB3aGVuCj4+Pj4gQ09O
RklHXzY0QklULgo+Pj4gRG9lc24ndCB0aGlzIGNhdXNlIGEgY29tcGlsZS10aW1lIGVycm9yIG9u
IDMyLWJpdD8KPj4gSSB0ZXN0ZWQsIHJ2MzIgY29tcGlsZSBpcyBPSy4KPj4+PiAgICAgICAgICAg
ICAgICAgICAodW5zaWduZWQgbG9uZylWTUVNTUFQX0VORCk7Cj4+Pj4gICAgICAgICAgIHByaW50
X21sKCJ2bWFsbG9jIiwgKHVuc2lnbmVkIGxvbmcpVk1BTExPQ19TVEFSVCwKPj4+PiAgICAgICAg
ICAgICAgICAgICAodW5zaWduZWQgbG9uZylWTUFMTE9DX0VORCk7Cj4+Pj4gKyAgICAgICBpZiAo
SVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQo+Pj4+ICsgICAgICAgICAgICAgICBwcmludF9tbCgi
bW9kdWxlcyIsICh1bnNpZ25lZCBsb25nKU1PRFVMRVNfVkFERFIsCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpTU9EVUxFU19FTkQpOwo+Pj4gVGhlIElTX0VOQUJM
RUQoKSBjaGVjayBwcmV2ZW50cyB0aGUgbGluZSBmcm9tIGdldHRpbmcgZXhlY3V0ZWQsIGJ1dAo+
Pj4gdW5saWtlIGFuICNpZmRlZiBpdCBzdGlsbCByZWxpZXMgb24gaXQgdG8gYmUgcGFyc2FibGUu
Cj4+IFRoYW5rcywgSSB3aWxsIHVzZSAjaWZkZWYgaW5zdGVhZCBvZiBJU19FTkFCTEVECj4gUGF0
Y2gxIGFsc28gaGFzIHRoYXQgaXNzdWUgd2l0aCB0aGUKdGhhbmtzLCBJIHdpbGwgbW9kaWZ5IGl0
IGluIFYzLgo+Cj4gICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR182NEJJVCkpIHsKPiAgICAg
ICAgICAgICAgICB2bWNvcmVpbmZvX2FwcGVuZF9zdHIoIk5VTUJFUihNT0RVTEVTX1ZBRERSKT0w
eCVseFxuIiwgTU9EVUxFU19WQUREUik7Cj4gICAgICAgICAgICAgICAgdm1jb3JlaW5mb19hcHBl
bmRfc3RyKCJOVU1CRVIoTU9EVUxFU19FTkQpPTB4JWx4XG4iLCBNT0RVTEVTX0VORCk7Cj4gICAg
ICAgIC4uLi4KPgo+Cj4gbW9kdWxlX2FsbG9jIGZhbGxzIGJhY2sgdG8gYSB3ZWFrIHZhcmlhbnQg
WzBdIHdoaWNoIGlzIHRoZSBzYW1lIGFzIHRoZSByaXNjdiB2YXJpYW50Cj4gb25seSB0aGVuIHVz
aW5nIFZNQUxMT0NfU1RBUlQgLSBWTUFMTE9DX0VORCBhcyByYW5nZSwgYXMgdGhlIHJpc2N2LXZh
cmlhbnQKPiBjb25kaXRpb25hbCB0byBDT05GSUdfNjRCSVQuCgp5ZXMsIEkgZXZlciBjaGVja2Vk
LCBhY3R1YWxseSBiZWZvcmUgNS4xMywgaXQgZG9lc24ndCBkZWZpbmUgTU9EVUxFUyAKYXJlYSBi
dXQgdXNlIFZNQUxMT0MgZm9yIG1vZHVsZXMsCgpjcmFzaD4gbW9kCiDCoMKgwqDCoCBNT0RVTEXC
oMKgwqDCoMKgwqAgTkFNRcKgwqDCoMKgwqDCoMKgwqDCoMKgIEJBU0XCoMKgwqDCoMKgwqDCoMKg
wqDCoCBTSVpFwqAgT0JKRUNUIEZJTEUKZmZmZmZmZGY4MTY3ZjI4MMKgIGdhbGNvcmXCoCBmZmZm
ZmZkZjgxNjQ2MDAwwqAgMzA3NTg0McKgIChub3QgbG9hZGVkKcKgIApbQ09ORklHX0tBTExTWU1T
XQoKW8KgwqDCoCAwLjAwMDAwMF3CoMKgwqDCoMKgIHZtYWxsb2MgOiAweGZmZmZmZmQwMDAwMDAw
MDAgLSAweGZmZmZmZmRmZmZmZmZmZmbCoMKgIAooNjU1MzUgTUIpCgo+Cj4gSSdtIHdvbmRlcmlu
ZyBpZiBpdCB3b3VsZG4ndCBiZSBlYXNpZXIgaW4gdGhlIGxvbmcgcnVuIHRvIGp1c3QgZGVmaW5l
Cj4gTU9EVUxFU19WQUREUiwgTU9EVUxFU19FTkQgZm9yIDMyYml0IHRvIHVzZSB0aGVzZSB2YWx1
ZXMgYW5kIGdldCByaWQgb2YKPiB0aGUgQ09ORklHXzY0QklUIGlmZGVmIHdlIGFscmVhZHkgaGF2
ZSBmb3IgTU9EVUxFUyAoYW5kIG5ldyBvbmVzIHdlIGFyZQo+IGludHJvZHVjaW5nIG5vdykuCj4K
Pgo+IEhlaWtvCj4KPgo+IFswXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2tlcm5lbC9tb2R1bGUuYyNMMjgzNQo+Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
