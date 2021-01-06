Return-Path: <SRS0=kC5X=GJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D2FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jan 2021 06:39:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44DCA207B2
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jan 2021 06:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44DCA207B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fkhwyt/0DrS6SltJiNhhzxNLdkyVKliI3BhF2uhHPLE=; b=leOUoNLUhhxgEHniAeatOtiGF
	VJXf7Wm9p6g4ojNC6KULKroyffUruEh6dMBRUFRzoyRsXTn5AFBBtN/L6KTm3OSiGBYBq7j5F+mOA
	EgMOvLd8AJqc1lD+AALP9jE/wEo3uhSGekXaW3NabXxziOw0ErzEo6hQMJoRahF31RCOzxK7Zn8Xn
	Ycny5nwuW+2XoW1lbczbceOzkfaDIw0EUZ2fYv6myc7zX1SU8lWba+F0zPqmKqvaG0cJG1yHbVLS/
	u+QqxLGfEx3Em+9XJD8rGA3+iOnOwaMu2dbnOZtzQHCvesOhLn/oWccvIoWyd4pAkXK/Ohf9B38An
	06fkdWL5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx2TH-0000mw-V5; Wed, 06 Jan 2021 06:39:03 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx2TF-0000mP-4V
 for linux-riscv@lists.infradead.org; Wed, 06 Jan 2021 06:39:02 +0000
X-Originating-IP: 90.112.190.212
Received: from [192.168.1.100] (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C21CFC0002;
 Wed,  6 Jan 2021 06:38:56 +0000 (UTC)
Subject: Re: [RFC PATCH 04/12] riscv: Allow to dynamically define VA_BITS
To: Anup Patel <anup@brainfault.org>
References: <20210104195840.1593-1-alex@ghiti.fr>
 <20210104195840.1593-5-alex@ghiti.fr>
 <CAAhSdy0Diu3nD+QswUUr7Ox+FdZGRedivJ6gNU2dYUCaOx8KjA@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <6c3d062b-69e0-820e-0c45-53e6930c0350@ghiti.fr>
Date: Wed, 6 Jan 2021 01:38:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0Diu3nD+QswUUr7Ox+FdZGRedivJ6gNU2dYUCaOx8KjA@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_013901_376462_B67A8771 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: linux-arch@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAxLzUvMjEgw6AgNzowNiBBTSwgQW51cCBQYXRlbCBhIMOpY3JpdMKgOgo+IE9uIFR1ZSwg
SmFuIDUsIDIwMjEgYXQgMTozMyBBTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdy
b3RlOgo+Pgo+PiBXaXRoIDQtbGV2ZWwgcGFnZSB0YWJsZSBmb2xkaW5nIGF0IHJ1bnRpbWUsIHdl
IGRvbid0IGtub3cgYXQgY29tcGlsZSB0aW1lCj4+IHRoZSBzaXplIG9mIHRoZSB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2Ugc28gd2UgbXVzdCBzZXQgVkFfQklUUyBkeW5hbWljYWxseQo+PiBzbyB0aGF0
IHNwYXJzZW1lbSByZXNlcnZlcyB0aGUgcmlnaHQgYW1vdW50IG9mIG1lbW9yeSBmb3Igc3RydWN0
IHBhZ2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGku
ZnI+Cj4+IC0tLQo+PiAgIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAxMCAt
LS0tLS0tLS0tCj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICB8IDExICsr
KysrKysrKy0tCj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGFyc2VtZW0uaCB8ICA2ICsr
KysrLQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tj
b25maWcKPj4gaW5kZXggNDQzNzdmZDc4NjBlLi4yOTc5YTQ0MTAzYmUgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTEy
MiwxNiArMTIyLDYgQEAgY29uZmlnIFpPTkVfRE1BMzIKPj4gICAgICAgICAgYm9vbAo+PiAgICAg
ICAgICBkZWZhdWx0IHkgaWYgNjRCSVQKPj4KPj4gLWNvbmZpZyBWQV9CSVRTCj4+IC0gICAgICAg
aW50Cj4+IC0gICAgICAgZGVmYXVsdCAzMiBpZiAzMkJJVAo+PiAtICAgICAgIGRlZmF1bHQgMzkg
aWYgNjRCSVQKPj4gLQo+PiAtY29uZmlnIFBBX0JJVFMKPj4gLSAgICAgICBpbnQKPj4gLSAgICAg
ICBkZWZhdWx0IDM0IGlmIDMyQklUCj4+IC0gICAgICAgZGVmYXVsdCA1NiBpZiA2NEJJVAo+PiAt
Cj4+ICAgY29uZmlnIFBBR0VfT0ZGU0VUCj4+ICAgICAgICAgIGhleAo+PiAgICAgICAgICBkZWZh
dWx0IDB4QzAwMDAwMDAgaWYgMzJCSVQgJiYgTUFYUEhZU01FTV8yR0IKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPj4gaW5kZXggMTAyYjcyOGNhMTQ2Li5jNzk3M2JmZDY1YmMgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+IEBAIC00Myw4ICs0MywxNCBAQAo+PiAgICAqIHN0
cnVjdCBwYWdlcyB0byBtYXAgaGFsZiB0aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlLiBUaGVuCj4+
ICAgICogcG9zaXRpb24gdm1lbW1hcCBkaXJlY3RseSBiZWxvdyB0aGUgVk1BTExPQyByZWdpb24u
Cj4+ICAgICovCj4+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4+ICsjZGVmaW5lIFZBX0JJVFMgICAg
ICAgICAgICAgICAgMzkKPj4gKyNlbHNlCj4+ICsjZGVmaW5lIFZBX0JJVFMgICAgICAgICAgICAg
ICAgMzIKPj4gKyNlbmRpZgo+PiArCj4+ICAgI2RlZmluZSBWTUVNTUFQX1NISUZUIFwKPj4gLSAg
ICAgICAoQ09ORklHX1ZBX0JJVFMgLSBQQUdFX1NISUZUIC0gMSArIFNUUlVDVF9QQUdFX01BWF9T
SElGVCkKPj4gKyAgICAgICAoVkFfQklUUyAtIFBBR0VfU0hJRlQgLSAxICsgU1RSVUNUX1BBR0Vf
TUFYX1NISUZUKQo+PiAgICNkZWZpbmUgVk1FTU1BUF9TSVpFICAgQklUKFZNRU1NQVBfU0hJRlQp
Cj4+ICAgI2RlZmluZSBWTUVNTUFQX0VORCAgICAoVk1BTExPQ19TVEFSVCAtIDEpCj4+ICAgI2Rl
ZmluZSBWTUVNTUFQX1NUQVJUICAoVk1BTExPQ19TVEFSVCAtIFZNRU1NQVBfU0laRSkKPj4gQEAg
LTgzLDYgKzg5LDcgQEAKPj4gICAjZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4+Cj4+ICAgI2lm
ZGVmIENPTkZJR19NTVUKPj4gKwo+PiAgIC8qIE51bWJlciBvZiBlbnRyaWVzIGluIHRoZSBwYWdl
IGdsb2JhbCBkaXJlY3RvcnkgKi8KPj4gICAjZGVmaW5lIFBUUlNfUEVSX1BHRCAgICAoUEFHRV9T
SVpFIC8gc2l6ZW9mKHBnZF90KSkKPj4gICAvKiBOdW1iZXIgb2YgZW50cmllcyBpbiB0aGUgcGFn
ZSB0YWJsZSAqLwo+PiBAQCAtNDUzLDcgKzQ2MCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZXBf
Y2xlYXJfZmx1c2hfeW91bmcoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4+ICAgICogYW5k
IGdpdmUgdGhlIGtlcm5lbCB0aGUgb3RoZXIgKHVwcGVyKSBoYWxmLgo+PiAgICAqLwo+PiAgICNp
ZmRlZiBDT05GSUdfNjRCSVQKPj4gLSNkZWZpbmUgS0VSTl9WSVJUX1NUQVJUICAgICAgICAoLShC
SVQoQ09ORklHX1ZBX0JJVFMpKSArIFRBU0tfU0laRSkKPj4gKyNkZWZpbmUgS0VSTl9WSVJUX1NU
QVJUICAgICAgICAoLShCSVQoVkFfQklUUykpICsgVEFTS19TSVpFKQo+PiAgICNlbHNlCj4+ICAg
I2RlZmluZSBLRVJOX1ZJUlRfU1RBUlQgICAgICAgIEZJWEFERFJfU1RBUlQKPj4gICAjZW5kaWYK
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BhcnNlbWVtLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NwYXJzZW1lbS5oCj4+IGluZGV4IDQ1YTcwMThhODExOC4uNjNh
Y2FlY2MzMzc0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwYXJzZW1l
bS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BhcnNlbWVtLmgKPj4gQEAgLTQs
NyArNCwxMSBAQAo+PiAgICNkZWZpbmUgX0FTTV9SSVNDVl9TUEFSU0VNRU1fSAo+Pgo+PiAgICNp
ZmRlZiBDT05GSUdfU1BBUlNFTUVNCj4+IC0jZGVmaW5lIE1BWF9QSFlTTUVNX0JJVFMgICAgICAg
Q09ORklHX1BBX0JJVFMKPj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPj4gKyNkZWZpbmUgTUFYX1BI
WVNNRU1fQklUUyAgICAgICA1Ngo+PiArI2Vsc2UKPj4gKyNkZWZpbmUgTUFYX1BIWVNNRU1fQklU
UyAgICAgICAzNAo+PiArI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+PiAgICNkZWZpbmUgU0VD
VElPTl9TSVpFX0JJVFMgICAgICAyNwo+PiAgICNlbmRpZiAvKiBDT05GSUdfU1BBUlNFTUVNICov
Cj4+Cj4+IC0tCj4+IDIuMjAuMQo+Pgo+IAo+IExvb2tzIGdvb2QgdG8gbWUuCj4gCj4gUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCgo+IAo+IFJl
Z2FyZHMsCj4gQW51cAo+IAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
