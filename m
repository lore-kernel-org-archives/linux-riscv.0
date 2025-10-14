Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3850CCD183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 01:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cJg6yKufG4blWZC+3eEVxwMhktAOJqVXUDVYocWKXw=; b=EmcM+uRlMell2i
	5rloHFduKC6Bqs7a80xa6u2q2IK1FAGquUrre1iuOrsxgyw2hEs6E15K3D1/kXCiaALPwK2PhBd1/
	Nj//Y1JaVWnMG/BpJE8yWEXrKSwPVub9r0c7fDBxuIJfXXKxsbznFSuqI+PyGaN01N9QVKdTTcs70
	6BiVKGlFbBVKZslKN7Rjv+VeDQmI1D9whF0OfXW0cFhnXd9te7lD7DhDXQayUbylbyPOjp+G9zQjn
	UsMCKz9ja4chD6D/e8Q/nlWSZHEKGmDdUV2lA03rAVl9HkZdiD5kNPoH3DA8HZErMADJaCEoGunza
	kEH5AhItgPKUpMgo4FNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Te9-0000000Esti-0jvk;
	Tue, 14 Oct 2025 01:16:13 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Te3-0000000Eskw-0Ank
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 01:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760404508;
	bh=yPaqLTFJBou/8d1hMyxh74PBxgkDsYMEzO+87OROHB0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=gIQahV4nYcfZPXN831GaW2evLz/LB7hnbHbG35YusVe/IIjQKN+6jldM+xEJ9HjNU
	 WrJ3WUxFP99enmzNu6uVKrHoI2o5m/dn6mw5Z3Jy0M+azu1kmtIjNbhBU85+cJojJo
	 mqAkyobyz/G5tJLewoGfZtyvMVzl+1SkNl5UtoGI=
X-QQ-mid: esmtpgz13t1760404499t2e911499
X-QQ-Originating-IP: o0PzaMQ5hTsLiEQfnYn0/i0z9Av6u2RRMSRj69aXyEU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 09:14:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1259685802699772283
EX-QQ-RecipientCnt: 16
Date: Tue, 14 Oct 2025 09:14:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v4 2/2] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <775044E19528DA5A+aO2kEerOWeY8ad0h@kernel.org>
References: <20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com>
 <20250921-k1-i2s-v4-2-4f819f50e468@linux.spacemit.com>
 <d1d965c4-f0f4-4b09-b5c3-5925d5f7ce1b@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1d965c4-f0f4-4b09-b5c3-5925d5f7ce1b@sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OFWsfmE1GYcucjtZg+KEjRlCsj0y/80SVScxcqo55Hl6k5plK2uYiE0e
	UmmSczndIIISYCroAAZfA1qLkfBtwrgwxq9OJv5L7tXsZRdPi6XKVQcVD9EghKXXfUTVYkO
	WybVF9Hv1dX+kGiJex2PyHnyew6kKxHh5IKGUuse8CvbwOkjJWe8H3Eazezl9tZvTn6urp+
	0V3TiCPDh6iX76ZcI2mtgY1+f1VHdJ2hPsurji0OUB2/XeHVIlx+pF9huFPmSwO2ybR3KnV
	8nhf03Qa6SZvf/GLZYRo96hXRfvYBFWB6u0hIYNJlX9Gcw2qNmgNY491iEjHJV5MeKJ/qsl
	v/UwM6AXjHHEU0PFWLYaQPpFA/luOoUoZ7ij4cmQCFfSdpKNMqkwIPqJOvnAogPK68tUOTd
	thtmZlqpurHYUrfP6VqOhYdKR7TH3akptlludkELnKi56Xljl59ixwnw3Vbso3iux5l0z/A
	G7Tsa/O/GjQtPwa0d4lAK+SDEhrWEKsNWzyjtT3wx5whuL+UGejBfwEN/0tImC1RDovHBJk
	kLydjegjIXVU42sH+gf7VNiLaQg82KAr50JdokvTE4c4Jm1uG5kKqJAbQYybjzkSq8E75aH
	ToZAuaGP9onKFZ89UVkmCQu3UXi+ojDa0Aq1py7Xcm7urC3RapGsNnkL/ko4kxfs+8MoVhG
	Ec19cuPeHskjfMwrd/s68TyBZe8+RupJe+nqM11bX36qVKtzxThgEkZtRitlAS5pxdEQK2D
	DqZkVdvFjWxBgYGc2UJRCnMchydHHPo32/62kOq+knDZF9bWofFZ5kGYwPYYXSy09S96+jj
	sWnszEejE8l7TI9Z+G+HRQf3MKOKnVCxvE7PKjqAK52/FzRIQAPxms7aevGWT7LzxJCcoSC
	/StrcXgL3elcPh3dlbysTxCYkPSCNer7zxQT+k/TgYjXIddabgHs7N4vnUJcIgz5zEAG2qP
	s8dWyRbAJvvaVhXEVPaO3UzoW54sIqyx3uSD2aLnBIYSmMKnNpIDYEfiy7Iu+8oRkv0926w
	gsBrX5ctnGNRPAlpQz4KIYYKgANhBPxNiwqAohFdVqjGKfmJMuEcjRiFmfrclspdKC0vbTs
	w==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_181608_240988_03E0BBAA 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMDE6MDU6NThQTSArMDEwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBTdW4sIFNlcCAyMSwgMjAyNSBhdCAwNDo1MjoxN1BNICswODAwLCBUcm95IE1pdGNo
ZWxsIHdyb3RlOgo+IAo+ID4gKwljYXNlIFNORF9TT0NfREFJRk1UX0RTUF9BOgo+ID4gKwljYXNl
IFNORF9TT0NfREFJRk1UX0RTUF9COgo+ID4gKwkJc25kX3BjbV9od19jb25zdHJhaW50X21pbm1h
eChzdWJzdHJlYW0tPnJ1bnRpbWUsCj4gPiArCQkJCQkgICAgIFNORFJWX1BDTV9IV19QQVJBTV9D
SEFOTkVMUywKPiA+ICsJCQkJCSAgICAgMSwgMSk7Cj4gPiArCQlzbmRfcGNtX2h3X2NvbnN0cmFp
bnRfbWFzazY0KHN1YnN0cmVhbS0+cnVudGltZSwKPiA+ICsJCQkJCSAgICAgU05EUlZfUENNX0hX
X1BBUkFNX0ZPUk1BVCwKPiA+ICsJCQkJCSAgICAgU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUpOwo+
ID4gKwkJYnJlYWs7Cj4gCj4gVGhlIGhhbmRsaW5nIGZvciBvbmUgb2YgdGhlc2UgaXMgYnVnZ3ks
IERTUCBBIGFuZCBCIGFyZSBkaXN0aW5jdCBtb2Rlcwo+IGJ1dCB0aHJvdWdob3V0IHRoZSBkcml2
ZXIgdGhleSdyZSBoYW5kbGVkIGlkZW50aWNhbGx5IEFGQUlDVC4KVGhhbmtzISBJbmRlZWQsIHRo
aXMgYnVnIHdhcyBpbnRyb2R1Y2VkIGluIHRoaXMgdmVyc2lvbi4KSeKAmWxsIGZpeCBpdCBhbmQg
c2VuZCB2NSBBU0FQLgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
