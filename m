Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1725CCAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 03:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCwSSkExdT7+RPf+uPdMFAuIugpUKAsQCptYupFkx/o=; b=idHrrc3j4MisPx
	iHjBANs7L3TIdhm538SMAT3rfTs8g33ZJKQCHOkzxcrAClDA6FSXYOlkYEXXpFR1HqrOlNEEIWHwq
	xIfZVF4PYdtPdAvts4HgXuqyQkMN2vLuo2YGVi3bqAhGlcfwtzSBLv1RL2SPncBooqf7K2ekK+IMZ
	PKkzvsFOrldf1iD0yGadnsGEnP3UNisBLiM+F0ZDTsBTRT2JBhZJOknfd05jSHS6DSYHBmaQ2/S04
	HdEzNrJm7LZSVTRpENOnRekwKLnnalkKqjKB/zh7MKGfydK3mUgDz1zTRfppM+uvWj5r/MgkWcDoT
	GgRAv8LXMbiiWZCCe9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2M5F-00000006qen-4B2x;
	Sat, 27 Sep 2025 03:58:53 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2M5B-00000006qWZ-3Ivf
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 03:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758945483;
	bh=tZd0GByrmUmEmv/KTM2Z/9NM+LpY4Nwqa49uosFrd3c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=UOFpMPy3wgMi6DtJR3u7O0In++mZqwplfaHoHtHz0B0qn6Mj0Rb5Vy0HIZwIgZI6E
	 H+zxZ9ma/gtXNXlVRO1fCSO8pkttMC1GGOHyNL79sCkHtFCUcJLIkLD4tfsKD29eB8
	 wLJ/YkOCGZY0AXc0HUlXEdOZZTwIFFlX0RVIf/ek=
X-QQ-mid: zesmtpip4t1758945481t77f69a0a
X-QQ-Originating-IP: 4hAQJEdGIUHUtFK8Zm7CAj82QXu40PWPNzuez6mX62s=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Sep 2025 11:57:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6486326469717875745
EX-QQ-RecipientCnt: 10
Date: Sat, 27 Sep 2025 11:57:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <578DFDF368D5EDF5+aNdgx8bKJy0dGekS@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
 <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
 <aNajJ0RZ4Ku0eDXr@shikoro>
 <20250927012429-GYA1330052@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250927012429-GYA1330052@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NV33GuG3VJ0Z1N1s6G/QbDuKdURcurS4b7zhGxcTBGaPWW6CbvXUG02E
	W8M3rX+hKgQEAOIrvqc++usFmyTg752MhsTcMCZKJn3oQMXkcaYckmyLeIZ8PHxX3EI6vpn
	VVg7zxVol159KLE7Qkb9T9W+SqW2HGnprUOl+on9q04armE/fPXG/xfd0iwtpm43m4ZNV94
	Gz4MMS8Z95L0okZD3eBHgWdeSp5p7uShFWzC2mzhB0EdLWMJV7hzR5m9YH0xyVYR0l3kw7V
	jX5Osdd2wfgGZbH9sX81N49TNLoxCEcJiqjbO4QqQRiWp1kiw96aolzOsu4ASk8iCeKp8kq
	0sD76vr0V36z8p6ws1DUKhrEYrtxLj9bHKXpYntz4nb7lKsUHPvB76LIlkxP3xLW3Qboj2K
	kzmMPtEARxb8+boX6apVeSigjqrbxFvf9AXHHzL7A5dcknZ21xrXw79y8QbPNg4AerLz7zz
	vrLm0cG7Ms7w4YZAmwpsV14xqEhuVfboDv+kJb/pmVh9pEObm/O9gFAc4OVOgKS91AYME2a
	uwrehyvBMhs5YJ6tOQNU5/T/+Qvp47u7Pyiz2OjcBdoTcah3/uDn7+JPmyUdh591n7oQfz+
	QTf7/dB/Z1Arug0PSon5z/r9qFmz0KzLytsEZVOEz+nZXFQ8+WdISRItvnZVD6AHOSjV9Hk
	eIPZSjHf3gdiy2QU68IPObp0/AXj69WW8z805jVnxpTOEQDXm3b4sylr93gc6oa8HgqiHIE
	1Chb/VLGBJwdSAq27xnUP3MSQO88F86S1v/YRTS0qhh9FZQEarx68g5LPARinzdLHecLYAk
	bc/OXdoUeVhhj1xZjHrVng7HA8c9LnPKmeOhsmchPRdhWBTIDYia1F4fcmjWiLCPb9MtKyk
	vqj45tI0lrjIgNG9VR03t1JBXkfa5g29et9553t73y8FpUxBsQpk99LSpwLak7Tf6Lis2je
	SqsyZR34+j7pponnNAav3NbCEJcwswMwfAmcQ3bNI4Qv95s4jsKY/4EPfEZkD+MnFq4Ju0U
	exzSVlSbjv7eIZbqmoEHrUjpwKifXDCOH9N+wJsps9Ol9NDGax3lD8MbyNJlz73xjqo2fxo
	kmbJUVVBYLRk000UZyTxZ7/ShIdahJCNA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_205850_815011_D1D787A4 
X-CRM114-Status: UNSURE (   9.62  )
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

T24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMDk6MjQ6MjlBTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEhpIFRyb3ksCj4gCj4gT24gMTY6MjggRnJpIDI2IFNlcCAgICAgLCBXb2xmcmFtIFNhbmcg
d3JvdGU6Cj4gPiAKPiA+ID4gU2luY2UgcGF0Y2hlcyAx4oCTNSBoYXZlIGFscmVhZHkgYmVlbiBt
ZXJnZWQsCj4gPiA+IHNob3VsZCBJIGtlZXAgdGhlIGN1cnJlbnQgdmVyc2lvbiBudW1iZXIgYW5k
IGp1c3Qgc2VuZCB0aGlzIHNpbmdsZSBwYXRjaCA/Cj4gPiAKPiA+IFllcywgcGxlYXNlLgo+ID4g
Cj4gSSBhZ3JlZSwgcGxlYXNlIGRvIGluY3JlYXNlIHRoZSBwYXRjaCB2ZXJzaW9uLCBoYXZlIGEg
Zm9ybWFsIGNvdmVyIGxldHRlciwKPiBkb2N1bWVudCB0aGUgY2hhbmdlcywgYW5kIGFkZCBvbGQg
cGF0Y2ggVVJMIGxpbmsuLgpUaGFua3MuIEkgd2lsbC4KICAgICAgICAgICAgICAgIC0gVHJveQo+
IAo+IC0tIAo+IFlpeHVuIExhbiAoZGxhbikKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
