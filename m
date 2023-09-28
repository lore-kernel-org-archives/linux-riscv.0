Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9603FCE7B09
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3GQgpBqmMuOXSKCR6SIZ8p9MhmBGWIwyTUTZ6XlMgo=; b=cdPbV3vesjZrHl
	vT4Mw184Fk3e1Ygoe1nZ0QzvQkcXGAou4HOqNRK8ERve0VUhPa/XNlluSvuyX6pHsZ0Rz9iehAWSM
	+pKBewjAhUaCGhRLJSg80laRy+xp6ps9UibV3f1q2TVgrMptwBOO2arNDOrEbpIc6XxoXlmbcs0uZ
	fMOhuPzZ9121MkFIo5WTgwkzSWBfMCzTj7gUzrxpU2eHeNee6pbVV9iKBib2UVnWjHLW8I6bhLXZp
	71icU1jJkxIAnvamxvsqaR8XP4ke90shSBT+dEArEOtEIhcJTm9efNff3DUwbh268UgigpN3AzdNd
	/NVL18u8cttGFv3L7B0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllyp-002a6D-2N;
	Thu, 28 Sep 2023 08:02:39 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllym-002a38-1L
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 08:02:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47DE240004;
	Thu, 28 Sep 2023 08:02:23 +0000 (UTC)
Message-ID: <d0f12692-f0df-9535-922a-f0578c713547@ghiti.fr>
Date: Thu, 28 Sep 2023 10:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] riscv: fix out of bounds in walk_stackframe
To: Edward AD <twuufnxlz@gmail.com>, conor@kernel.org
Cc: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 alexghiti@rivosinc.com, liushixin2@huawei.com,
 linux-riscv@lists.infradead.org
References: <0000000000000170df0605ccf91a@google.com>
 <20230926114343.1061739-2-twuufnxlz@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230926114343.1061739-2-twuufnxlz@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_010236_609007_FBF6C018 
X-CRM114-Status: GOOD (  14.95  )
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

SGkgRWR3YXJkLAoKT24gMjYvMDkvMjAyMyAxMzo0MywgRWR3YXJkIEFEIHdyb3RlOgo+IEluY3Jl
YXNlIHRoZSBjaGVjayBvbiB0aGUgZnJhbWUgYWZ0ZXIgYXNzaWduaW5nIGl0cyB2YWx1ZS4gVGhp
cyBpcyB0byBwcmV2ZW50Cj4gZnJhbWUgYWNjZXNzIGZyb20gY3Jvc3NpbmcgYm91bmRhcmllcy4K
Pgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwOTI2MTA1OTQ5LjEw
MjU5OTUtMi10d3V1Zm54bHpAZ21haWwuY29tLwo+IEZpeGVzOiA1ZDg1NDRlMmQwMDcgKCJSSVND
LVY6IEdlbmVyaWMgbGlicmFyeSByb3V0aW5lcyBhbmQgYXNzZW1ibHkiKQo+IFJlcG9ydGVkLWFu
ZC10ZXN0ZWQtYnk6IHN5emJvdCs4ZDI3NTdkNjJkNDAzYjJkOTI3NUBzeXprYWxsZXIuYXBwc3Bv
dG1haWwuY29tCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzAwMDAwMDAwMDAw
MDAxNzBkZjA2MDVjY2Y5MWFAZ29vZ2xlLmNvbS9ULwo+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBB
RCA8dHd1dWZueGx6QGdtYWlsLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3N0YWNr
dHJhY2UuYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zdGFja3RyYWNlLmMKPiBpbmRleCA2NGE5YzA5M2FlZjkuLjUzYmQxODY3MjMyOSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPiBAQCAtNTQsNiArNTQsOCBAQCB2b2lkIG5vdHJhY2Ug
d2Fsa19zdGFja2ZyYW1lKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MsCj4gICAJCQlicmVhazsKPiAgIAkJLyogVW53aW5kIHN0YWNrIGZyYW1lICovCj4gICAJ
CWZyYW1lID0gKHN0cnVjdCBzdGFja2ZyYW1lICopZnAgLSAxOwo+ICsJCWlmICghdmlydF9hZGRy
X3ZhbGlkKGZyYW1lKSkKPiArCQkJYnJlYWs7Cj4gICAJCXNwID0gZnA7Cj4gICAJCWlmIChyZWdz
ICYmIChyZWdzLT5lcGMgPT0gcGMpICYmIChmcmFtZS0+ZnAgJiAweDcpKSB7Cj4gICAJCQlmcCA9
IGZyYW1lLT5yYTsKCgp2aXJ0X2FkZHJfdmFsaWQoKSB3b3JrcyBvbiBrZXJuZWwgbGluZWFyIGFk
ZHJlc3Nlcywgbm90IG9uIHZtYWxsb2MgCmFkZHJlc3Nlcywgd2hpY2ggaXMgdGhlIGNhc2UgaGVy
ZcKgICgweGZmMjAwMDAwMDZkMzdjMzggYmVsb25ncyB0byB0aGUgCnZtYWxsb2MgcmVnaW9uOiBz
ZWUgCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1l
bnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0I0wxMjUpLiAKU28gdGhpcyBmaXggY2FuJ3Qgd29y
ay4KCkknbSBhIGJpdCBzdXJwcmlzZWQgdGhvdWdoIG9mIHRoaXMgb3V0LW9mLWJvdW5kcyBhY2Nl
c3Mgc2luY2UgCkNPTkZJR19GUkFNRV9QT0lOVEVSIGlzIGVuYWJsZWQsIHNvIHRoZXJlIG1heSBi
ZSBhIHJlYWwgaXNzdWUgaGVyZSAodGhlIApjb25zb2xlIG91dHB1dCBpcyBob3JyaWJsZSwgbG90
cyBvZiBiYWNrdHJhY2VzLCB3aGljaCBpcyB3ZWlyZCksIHNvIGl0IAptYXkgYmUgd29ydGggZGln
Z2luZyBpbnRvIHRoYXQuCgpUaGFua3MsCgpBbGV4CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
