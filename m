Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21159D73E87
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=usGEkWYc1imEG2ojYzqSfi6sdxAMTxyCmg3G1ehndl0=; b=csQPM7B85bf6Sx
	EqZpRaiE8XIY3Z7+gW7qfa9bq2zn9qVDV4OuKgxMD8Hso3slJ4fnbwr9QR0T/HPscka4JSUsBy6tQ
	pfmMZXbhVNvf7cu8n825k0V1elHtpVU1WYq9pI8XF2th7ZSnJC/Q/MPXGepRdGZtk834UWHXIq2c+
	C9g8kfYECPxPGi3T7QyJY4x+YhwqDpk7d0urEIPBBSn/bM2DlOJzu+nD4VR4DHg0lBNIvbDtBuVnE
	onFMm/gBAnF2R7ptpxu/JOtXMqRf2BZetEWodK/J6LYJMmUKganFYBCuuIXkknpIbQzDfXVIBIirE
	nEFO8yAs7+ibbEPsQyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZQg-00000000eoD-0eP6;
	Thu, 29 Jan 2026 21:19:54 +0000
Received: from 16.mo584.mail-out.ovh.net ([188.165.55.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUGJ-00000000IEi-2TBl
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 15:48:53 +0000
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.37.189])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4f23TW5wzvz8Kg1
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 15:48:47 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-sd5vw (unknown [10.110.101.192])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 489A0C29CE
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 15:48:47 +0000 (UTC)
Received: from courmont.net ([37.59.142.101])
	by ghost-submission-7d8d68f679-sd5vw with ESMTPSA
	id gt7HN16Be2novw4Ak4fCnQ
	(envelope-from <remi@remlab.net>)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 15:48:47 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004ceae882a-afb3-4533-a694-e0937d36ed72,
                    6B6018DE514075A4857B4905F5B6652134FE0652) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 85.23.113.149
From: =?UTF-8?B?UsOpbWk=?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] Documentation: riscv: update Vector discovery for userspace
Date: Thu, 29 Jan 2026 17:48:46 +0200
Message-ID: <5044566.GXAFRqVoOG@basile.remlab.net>
Organization: Remlab
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9322169754411932103
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTEylfqsPhUOuRO22oeUdnmUVRktnXKUhCKSEXE7Qqaqi6C4UTNF+AYgN2q+rE0rKkMZ/gc3gsb7VpEQL+1tgLuEhgAPYPeujPbBahfIeqPlMX0L5DX5nxJNfNwsJ/QuKFweN/ZnPcS8FB1RXArs95iVVdeT4QjveANBiEZQX0uDtcOcNauUAxtsOPUfLAEi0PGCwCzEO9KycPXqmb9j+qBbDt9sZ1+XwMH/LmXMJ61TSqix3jzY6Pxjfxpwi9uOVOf4+6YtG/77q9m2HmAruAK0+fqzcvxegbwbdX0sIhTO4J1ugA0rp13LcYKjRyIK8C5Q9i5iHaOuF7p9HNT0usfFLZM0Q4CiA9Ed5exafzB/HHd39AY+95mQQ4mLCnJw7dfICjPOr4s+39F63n3uNGc49j8q4vAtWowsgKiMqkuzVnWA9tNLcHkK1LPyFUhgevsosbA6dTfW2KBJRfRe2oBHMdIhxjiAfg/kfDmM6c0tQnn56LZ7d3iWJDz/XXArfu5JTrbHKbGPS4fIHTtCBfT6edPhphE3p2tJ4yd4wxIYDU20/XEWqA8CjM9Dep2jdcFiCKC9L0xusXy3NMDSovAtO/bI6F8eqn6zV1x3nEGrl1SctKxJEBWt+ToSx+frzzUx96JBMpLT7E4R0F2gA9b+PImlAIBOqPWjW809Bneo1Q
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_074851_797916_96B21415 
X-CRM114-Status: GOOD (  11.07  )
X-Mailman-Approved-At: Thu, 29 Jan 2026 13:19:52 -0800
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

SGksCgpMYXRlIHRvIHRoZSBwYXJ0eSBidXQuLi4KCj4gTWFrZSBpdCBleHBsaWNpdCB0aGF0IHVz
ZXJzIG1heSB1c2UgYm90aCBIV0NBUCBhbmQKPiBQUl9SSVNDVl9WX0dFVF9DT05UUk9MIGZvciBj
aGVja2luZyB0aGUgYXZhaWxhYmlsaXR5IG9mIFZlY3Rvcgo+IGV4dGVuc2lvbnMuCgpObz8gU29t
ZSB1c2VyLXNwYWNlIGNoZWNrcyBIV0NBUC4gU29tZSBjaGVjayBgaHdwcm9iZSgpYCBpbiBsaW5l
IHdpdGggCkRvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBpbiB0aGUgc2FtZSBk
aXJlY3RvcnkuIFNvbWUgY2hlY2sgCmh3cHJvYmUoKSBhbmQgZmFsbGJhY2sgdG8gSFdDQVAuCgpJ
dCdzIGEgZmV3IHllYXJzIHRvbyBsYXRlIHRvIGRpc2FsbG93IHVzaW5nIF9fcmlzY3ZfaHdwcm92
ZSgpIGZvciB0aGlzIApwdXJwb3NlLgoKPiBUaGlzIGFkZHJlc3NlcyB0aGUgQUJJIHVzYWdlIGNv
bmNlcm5bMV0gYXJpc2VkIGZyb20gdGhlIHVzZXIKPiBzcGFjZSBjb21tdW5pdHkgaW4gc3VwcG9y
dGluZyBWZWN0b3Igc3ViLWV4dHMgYW5kIG11bHRpdmVyc2lvbmluZy4KClRoYXQgbG9va3MgdG8g
bWUgdGhhdCBpdCBvbmx5IG11ZGRsZXMgdGhlIHNpdHVhdGlvbiBtb3JlIHJhdGhlciB0aGFuIGNs
YXJpZnkgCml0IGJ5IHJlY29tbWVuZGluZyB5ZXQgYW5vdGhlciB3YXkgdG8gZGV0ZWN0IFZlY3Rv
cnMgdGhhdCBkb2VzIG5vdCBtYXRjaCB3aGF0IApydW5uaW5nIGNvZGUgYWN0dWFsbHkgZG9lcy4K
CklmIGl0IHdlcmUgdXAgdG8gbWUsIEkgd291bGQganVzdCBkZXByZWNhdGUgdGhlIHByY3RsKCkg
UlZWIGNvbnRyb2xzLiBUaGVpciAKb3JpZ2luYWwgaW50ZW50IGFwcGVhcnMgdG8gaGF2ZSBiZWVu
IHRvIGFsbG93IHJ1bm5pbmcgbGVnYWN5IG5vbi12ZWN0b3IgY29kZSAKdGhhdCB3b3VsZCBoeXBv
dGhldGljYWxseSBub3QgYWNjb21vZGF0ZSBsYXJnZXIgbWFjaGluZSBjb250ZXh0cyBpbiBzaWdu
YWwgCmhhbmRsaW5nLiBIb3dldmVyLCBnaXZlbiB0aGF0IFZlY3RvcnMgYXJlIGVuYWJsZWQgYnkg
ZGVmYXVsdCwgYmFja3dhcmQgCmNvbXBhdGliaWxpdHkgaW4gdGhhdCBoeXBvdGhldGljYWwgc2Nl
bmFyaW8gbmV2ZXIgYWN0dWFsbHkgZXhpc3RlZC4gU28gaXQgCnNlZW1zIGxpa2UgaXQgd2FzIG1l
cmdlZCBhcyBzb21lIGtpbmQgb2YgYmFkIGNvbXByb21pc2UgLyBjb21taXRlZSBkZXNpZ24uCgpB
bHRlcm5hdGl2ZWx5LCBjbGFyaWZ5IHRoYXQgdGhlIFJWViBwcmN0bCgpJ3MgYXJlIG9ubHkgbWVh
bnQgZm9yLCB3ZWxsLCAKcnVubmluZyBsZWdhY3kgY29kZSB0aGF0IGNhbid0IGFjY29tb2RhdGUg
dmVjdG9yIHJlZ2lzdGVycywgYW5kIE1VU1QgTk9UIGJlIAp1c2VkIG90aGVyd2lzZSBhcyBpdCBp
cyBrbm93biB0byBicmVhayBhcHBzIGFuZCBsaWJyYXJpZXMgd2l0aCBydW50aW1lIGZlYXR1cmUg
CmRldGVjdGlvbi4KCk9yLCBidXQgdGhhdCdzIGdvaW5nIHRvIGJlIGNvbnRyb3ZlcnNpYWwsIGFu
ZCBhcmd1YWJseSBhbHNvIGFuIEFCSSBicmVhaywgbWFrZSAKaHdwcm9iZSgpIGFjY291bnQgZm9y
IHRoZSB2ZWN0b3Igc3RhdGUgb2YgdGhlIHByb2Nlc3MuCgpCciwKCi0tIArlvrflsLwt5bqT5bCU
6JKZ4oCn6Zu357GzCmh0dHBzOi8vd3d3LnJlbWxhYi5uZXQvCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
