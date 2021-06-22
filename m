Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FF1C4743C
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 00:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49A261245
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 00:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D49A261245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpP3KjkFKPTGh0VAD3MtUqCWt+YsSYy7ual0xWyj0Zg=; b=YAYnk/hbkLiRQNvmQreAIfJf8C
	AuS8b1U5YN3asYd4wm7W+agXyQCWUfeW5lFkYQcdKknQqM/mOfNUA9SaajdRAsnv6u2EaBEEokI1J
	DHHOQ4tc9b2QU5K+5V0EHHBeKgkxvlqjgYyHt40f4YY9CPajCykaIqfOzA2qLnIJ8osaFPOdRwwbk
	Meg5KLuDtDKeJmHjVWgpzPfZ1APYLRBzKaWDEGY57bNoXgmQUijijPlTI9PtRyi9FfpqJPFseaptq
	cyS9jQgl6mFQ87ctkfZLZWy6/J+INEbmajQ13K6U7VYsgxMGNA+pniZVDSqk5Pa1eQndw6+A4H8Ww
	TfL96WpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvUYe-005H5n-8Z; Tue, 22 Jun 2021 00:46:28 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvUYb-005H4R-NI
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 00:46:27 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15M0kN1D035484
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 03:46:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1624322777; x=1626914777;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0TIRxIkkteAzwssAi+Hquy4jV1LNAzUACaNk/lpu6ew=;
 b=o0fdKLodMohtHshXDEq8hARatX0xabreVNwHrHMQWImCnCFn6ep0idKk/EOR4NXv
 /FQKsPndB+8o4mbmcwBPNpepmlZ9r3x6BsRyrSNJxxMSgH0ce6UNNx7efv6yMFqq
 wp/v2TdlOCgFY2p09yGgMivS3YxdQWYB8AUuVLZKbvq+1wN6mHGuG8CHrcyWMRvk
 gFKiVMe1ZkJj+wPWBUmxK3Xq7OsFRdZCv0jIjsoUHUpuSgF8HI+lQKCBibpTXW2N
 qhkliIkVjFHoLLY6D9K5rOr7qz2QRXLbvL/xUeVDwEKLTyMn2ZSSMvFUSBSKNE3S
 UFfITKPcba/Ia5+02Q/oFQ==;
X-AuditID: 8b5b014d-962f1700000067b6-be-60d132d912be
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 51.60.26550.9D231D06; Tue, 22 Jun 2021 03:46:17 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 03:46:16 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Akira
 Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 2/3] riscv: optimized memmove
Organization: FORTH
In-Reply-To: <20210617152754.17960-3-mcroce@linux.microsoft.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-3-mcroce@linux.microsoft.com>
Message-ID: <3a71b234ec05b6ce842a3d6da552ba30@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsXSHT1dWfem0cUEg+etphbb3l1lsdj6exa7
 xaIV31kspvbEW+xYupnJ4t6KZewWL/Y2slg8WTOT0aJj11cWi8u75rBZbPvcwmZx8dd8RouX
 l3uYLdpm8TvwefTPnsLm8e73MkaPNy9fsngc7vjC7tHR94/FY+esu+wem1Z1snn82n6UyWPz
 knqPS83X2T0+b5LzaD/QzRTAE8Vlk5Kak1mWWqRvl8CV8e/mJ/aC2VwVb7p6mRsYv7J3MXJy
 SAiYSDx+9JG1i5GLQ0jgKKPEpXnnoRKmErP3djKC2LwCghInZz5hAbGZBSwkpl7Zzwhhy0s0
 b53NDGKzCKhKbJi9CyzOJqApMf/SQbB6EQFdiYsfDrODLGAWmM4i8at3NxtIQhhoc/Pm32DL
 +AWEJT7dvcgKYnMKOEh8fHUUaCgH0EWlEt+mSIOYvAIuElfvMkOcpiLx4fcDdpCwKJC9ea7S
 BEbBWUgOnYXk0FlIDl3AyLyKUSCxzFgvM7lYLy2/qCRDL71oEyM46hh9dzDe3vxW7xAjEwfj
 IUYJDmYlEd6bKRcShHhTEiurUovy44tKc1KLDzFKc7AoifPy6k2IFxJITyxJzU5NLUgtgsky
 cXBKNTCtTvvKU9XsfPFo3RE1d42rAq0v93HvCIsxPZrR3HmNo4rlLG/p8TjzdVwFIsX5jvce
 rKn+WSJ/OkK4pNy67NXmjtYG5TYDptLLXFp3N+9cnfTqkGmileeTAP/AxBT35fHnTFoKU1p/
 l1ndjP5+3lW3fer6VaYOzdpr9LNbFyVdydj02G9V3Y4PIodjvmbFKUgH1bJGWq97s+xTWIPP
 nBmixyvU3z/6s1e0+8jbGasn1C/vOsb1gTGhIrXVsl7/iHf1h/lKJzt5l3x9WPk6KnV+scCF
 1E3hh8Xzvk065R8a/F1jVtC0x0ujQ1Y3n/zz9Otfmzl57/3sdgkZyN5K+1iUmKF+/JfYT2G+
 Kp35vkosxRmJhlrMRcWJAEYP1ZkpAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_174626_180403_048F7A08 
X-CRM114-Status: GOOD (  12.25  )
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

zqPPhM65z4IgMjAyMS0wNi0xNyAxODoyNywgTWF0dGVvIENyb2NlIM6tzrPPgc6xz4jOtToKPiAr
Cj4gKy8qCj4gKyAqIFNpbXBseSBjaGVjayBpZiB0aGUgYnVmZmVyIG92ZXJsYXBzIGFuIGNhbGwg
bWVtY3B5KCkgaW4gY2FzZSwKPiArICogb3RoZXJ3aXNlIGRvIGEgc2ltcGxlIG9uZSBieXRlIGF0
IHRpbWUgYmFja3dhcmQgY29weS4KPiArICovCj4gK3ZvaWQgKl9fbWVtbW92ZSh2b2lkICpkZXN0
LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBjb3VudCkKPiArewo+ICsJaWYgKGRlc3QgPCBzcmMg
fHwgc3JjICsgY291bnQgPD0gZGVzdCkKPiArCQlyZXR1cm4gbWVtY3B5KGRlc3QsIHNyYywgY291
bnQpOwo+ICsKPiArCWlmIChkZXN0ID4gc3JjKSB7Cj4gKwkJY29uc3QgY2hhciAqcyA9IHNyYyAr
IGNvdW50Owo+ICsJCWNoYXIgKnRtcCA9IGRlc3QgKyBjb3VudDsKPiArCj4gKwkJd2hpbGUgKGNv
dW50LS0pCj4gKwkJCSotLXRtcCA9ICotLXM7Cj4gKwl9Cj4gKwlyZXR1cm4gZGVzdDsKPiArfQo+
ICtFWFBPUlRfU1lNQk9MKF9fbWVtbW92ZSk7Cj4gKwoKQ29weWluZyBiYWNrd2FyZHMgYnl0ZS1w
ZXItYnl0ZSBpcyBzdWJvcHRpbWFsLCBJIHVuZGVyc3RhbmQgdGhpcyBpcyBub3QgCmEgdmVyeSBj
b21tb24gc2NlbmFyaW8gYnV0IHlvdSBjb3VsZCBhdCBsZWFzdCBjaGVjayBpZiB0aGV5IGFyZSBi
b3RoIAp3b3JkLWFsaWduZWQgZS5nLiAoKChzcmMgKyBsZW4pIHwgKGRzdCArIGxlbikpICYgbWFz
ayksIG9yIG1pc3NhbGlnbmVkIApieSB0aGUgc2FtZSBvZmZzZXQgZS5nLiAoKChzcmMgKyBsZW4p
IF4gKGRzdCArIGxlbikpICYgbWFzaykgYW5kIHN0aWxsIAplbmQgdXAgZG9pbmcgd29yZC1ieS13
b3JkIGNvcHlpbmcuIElkZWFsbHkgaXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IApyZS11c2VkIHRo
ZSBzYW1lIHRlY2huaXF1ZSB5b3UgdXNlZCBmb3IgZm9yd2FyZHMgY29weWluZyBvbiB5b3VyIG1l
bWNweS4KCj4gK3ZvaWQgKm1lbW1vdmUodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXpl
X3QgY291bnQpIF9fd2Vhawo+IF9fYWxpYXMoX19tZW1tb3ZlKTsKPiArRVhQT1JUX1NZTUJPTCht
ZW1tb3ZlKTsKCkFzIEkgbWVudGlvbmVkIG9uIHlvdXIgbWVtY3B5IHBhdGNoLCBpZiB5b3UgaW1w
bGVtZW50IG1lbW1vdmUsIHlvdSBjYW4gCmp1c3QgYWxpYXMgbWVtY3B5IHRvIG1lbW1vdmUgYW5k
IHdlIHdvbid0IGhhdmUgdG8gd29ycnkgYWJvdXQgbWVtY3B5IApiZWluZyB1c2VkIG9uIG92ZXJs
YXBwaW5nIHJlZ2lvbnMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
