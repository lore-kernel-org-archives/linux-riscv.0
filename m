Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BB5CD98E7
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 21:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjqifvG4B8b88HTxNHyYnZ09dhMryAbXlHLQKdetl+8=; b=b53Sz9jWQaD+kQ
	KzprxCmNjzbnqKbtIyq9qXhlZn5HAhWeXasdqsdzDWN5bP2+goa77mmh8ktFJ7vZv6gx6rmb7YkF0
	RrcOyBDkIu2FWJJgoKj0glFtLGX5yB5Atd3bOyGHAq31T9LiCPr9Ccr9iuplgKRlIhe82s+kFKWuR
	SBjrGw4lwNtjfUIPJiSJ+M9z3iiJGIInrUCFJfP9u60XGSxSe0Qmpf5V6JPyV9Cox8vBnPCyRW6O5
	kO6wPurCc7/Ob3SAwHZOsnI0AlnBAIq4diQZfGGE2+yfClvTkvWJBdqXvIRHvBoOj8xfNGQNUeIgb
	b7BWxy7dtvIHugxx2uKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf4Z-0000000B8ur-2sT7;
	Thu, 13 Nov 2025 21:41:43 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf4X-0000000B8uP-0Tk8
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 21:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=6Q+eQ0jQq4j3cE3OQzV7WwPST+vm1AuIfNIfB6ulnWs=; b=tJauWlZbkPmWRDcbqq+7FVfW2g
	tn5sMzpqX8dB33N7WzoWj5n7HsjBc/M8RwNGBtSTV5k5z8jKEZDfIeoH5ytmdJojflllCqRbyd1Nf
	Sl4nLCykpangvKs6sYLFcMlYwQ8s3foCQy6aKbQTTPwF8dQijUlMvE8TElZw7wvw4nK5nIgcQz9qE
	pQnWhLLPBSQEs+1/c3GjnBNEF+NMbCz2mlqB+xEVyqB/yfzAUwGI5BJ6SlfDwjqYLFzBFZMFp2D78
	J19ursYXrzLjWwhTSvsNM2tWLAwU/Xrr8cA0f+HkPAHZIDvCIfc5akhL4ESuG995ji8bsRDltVY0O
	v7haPHjw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vJf4A-00000002tEH-3gkL;
	Thu, 13 Nov 2025 22:41:18 +0100
Date: Thu, 13 Nov 2025 22:41:18 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <aRZQfqFjDNds19by@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_134141_614320_80F8FF6B 
X-CRM114-Status: GOOD (  14.71  )
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

T24gMjAyNS0xMS0xMyAyMToyMSwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiBUaGlzIGNvbW1pdCBh
ZGRyZXNzZXMgdHdvIGlzc3VlcyBjYXVzaW5nIGkyYyBkZXRlY3QgdG8gZmFpbC4KPiAKPiBUaGUg
aWRlbnRpZmllZCBpc3N1ZXMgYXJlOgo+IAo+IDEuIEluY29ycmVjdCBlcnJvciBoYW5kbGluZyBm
b3IgQkVEIChCdXMgRXJyb3IgTm8gQUNLL05BSyk6Cj4gICAgQmVmb3JlIHRoaXMgY29tbWl0LCBC
b3RoIEFMRCAoQXJiaXRyYXRpb24gTG9zcyBEZXRlY3RlZCkgYW5kCj4gICAgQkVEIHJldHVybmVk
IC1FQUdBSU4uCj4gMi4gTWlzc2luZyBpbnRlcnJ1cHQgc3RhdHVzIGNsZWFyIGFmdGVyIGluaXRp
YWxpemF0aW9uIGluIHhmZXIoKToKPiAgICBPbiB0aGUgSzEgU29DLCBzaW1wbHkgZml4aW5nIHRo
ZSBmaXJzdCBpc3N1ZSBjaGFuZ2VkIHRoZSBlcnJvcgo+ICAgIGZyb20gLUVBR0FJTiB0byAtRVRJ
TUVPVVQuIFRocm91Z2ggdHJhY2luZywgaXQgd2FzIGRldGVybWluZWQgdGhhdAo+ICAgIHRoaXMg
aXMgbGlrZWx5IGR1ZSB0byBNU0QgKE1hc3RlciBTdG9wIERldGVjdGVkKSBsYXRlbmN5IGlzc3Vl
cy4KPiAKPiAgICBUaGF0IG1lYW5zIHRoZSBNU0QgYml0IGluIHRoZSBJU1IgbWF5IHN0aWxsIGJl
IHNldCBvbiB0aGUgbmV4dCB0cmFuc2Zlci4KPiAgICBBcyBhIHJlc3VsdCwgdGhlIGNvbnRyb2xs
ZXIgd29uJ3Qgd29yayDigJQgd2UgY2FuIHNlZSBmcm9tIHRoZSBzY29wZSB0aGF0Cj4gICAgaXQg
ZG9lc24ndCBpc3N1ZSBhbnkgc2lnbmFsLgo+ICAgIChUaGlzIG9ubHkgb2NjdXJzIGR1cmluZyBy
YXBpZCBjb25zZWN1dGl2ZSBJMkMgdHJhbnNmZXJzLgo+ICAgIFRoYXQgZXhwbGFpbnMgd2h5IHRo
ZSBpc3N1ZSBvbmx5IHNob3dzIHVwIHdpdGggaTJjZGV0ZWN0LikKPiAKPiBXaXRoIHRoZXNlIHR3
byBmaXhlcywgaTJjIGRldmljZSBkZXRlY3Rpb24gbm93IGZ1bmN0aW9ucyBjb3JyZWN0bHkgb24g
dGhlIEsxIFNvQy4KPiAKPiBGaXhlczogNWVhNTU4NDczZmEzMSAoImkyYzogc3BhY2VtaXQ6IGFk
ZCBzdXBwb3J0IGZvciBTcGFjZW1pVCBLMSBTb0MiKQo+IFRlc3RlZC1ieTogQXVyZWxpZW4gSmFy
bm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwg
PHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+IC0tLQo+IENoYW5nZWxvZyBpbiB2
MjoKPiAtIGhhbmRsZSBBTEQgYW5kIEJFRCBlcnJvcnMgc2VwYXJhdGVseSBpbiBzcGFjZW1pdF9p
MmNfaGFuZGxlX2VycigpCj4gLSBtb3ZlIGNsZWFyX2ludF9zdGF0dXMoKSBhYm92ZSBzcGFjZW1p
dF9pMmNfaW5pdCgpCj4gLSBtb3ZlIGNsZWFyX2ludF9zdGF0dXMoKSBmcm9tIHhmZXIoKSBpbnRv
IHNwYWNlbWl0X2kyY19pbml0KCkKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI1MTEwMy1maXgtazEtZGV0ZWN0LWZhaWx1cmUtdjEtMS1iYjA3YThkN2RlN2NA
bGludXguc3BhY2VtaXQuY29tLwo+IC0tLQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMg
fCAxOSArKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKVGVzdGVkLWJ5OiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5A
YXVyZWwzMi5uZXQ+ClJldmlld2VkLWJ5OiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwz
Mi5uZXQ+CgotLSAKQXVyZWxpZW4gSmFybm8gICAgICAgICAgICAgICAgICAgICAgICAgIEdQRzog
NDA5NlIvMURERDhDOUIKYXVyZWxpZW5AYXVyZWwzMi5uZXQgICAgICAgICAgICAgICAgICAgICBo
dHRwOi8vYXVyZWwzMi5uZXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
