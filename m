Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DCDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJHINUTVv1aD0tL00USIYPiiggsjT1K9Ve5Qs0qM8xY=; b=EZ2GtAZMoYq+Qf
	sDwWU5ieYZ7gxhhMGHSSh8CA8WPIjxdlE/wZmT5fNzQK58HfwckY1b/6X0Gwc4Rgz4i6cOuLpp0ce
	lsh8+vMuI9/i1DSql8w1+dfq7TXyg7SUSYIKl5BOW8mfdi4vqd4FesJHhytSGkrPEgCrwwZ063VhZ
	f43yc7rIxGsIY50LSTieM+x89oHBD0GgVgATV5IAlgY47lBNjxXKIbfDXxi9dYDzM+Be9NHAdaIyL
	08v5Da01sxthDbemRnosTlkDVCy56Ep70EklSTSuYcY8qZGwGaNckNANBykyIjaMV94mtbu/Mkzwz
	aDN/ZmPHT2dse2JWeggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Tqd-000FCo-O1; Wed, 14 Dec 2022 15:39:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Tqb-000FAb-A8
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 15:39:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC612618AF;
	Wed, 14 Dec 2022 15:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97066C433D2;
	Wed, 14 Dec 2022 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671032343;
	bh=WV8Ks/w5GzfCJYbihJ02iBiB3DlG+fE3MpPxGRtjLmQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mCZlGxg2ymMDDCfzP4rC3sLdn5J/Hz+r6apM01YKMc0RIzYAq4W7tE+voD9fmQpqV
	 wa8E+dT5tcbtVSwXZfEpEmsVSNwuUVh+Vodq8o69cDRHycQY5okpYZyaLWCj6SzcKH
	 ySMEPQH7dy85bfjNkGpwSp18YJ83uC0yLvcX4N9ONikOWXzqRbMIWa8PTkhhNrnanv
	 jRxbnBC1Z+nRh6b9NbsLSlKt4TRxtw9cXEX43gO0FrIPdN3RPHmu5IaK7/HzZimgt1
	 BefqCk8JgOg2cBYdGP2y4QT9CR3A5n9rdFeKKmvrOSJLlbFt4TH/kUVOM23qTvR1YO
	 m5/hhblbLwfnQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: Allow to downgrade paging mode from the command
 line
In-Reply-To: <20221214143311.960266-1-alexghiti@rivosinc.com>
References: <20221214143311.960266-1-alexghiti@rivosinc.com>
Date: Wed, 14 Dec 2022 16:38:57 +0100
Message-ID: <87cz8m3sha.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_073905_440378_150265D2 
X-CRM114-Status: GOOD (  14.20  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gaW5k
ZXggYjU2YTBhNzU1MzNmLi44MTQwZmVmZTBlNTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9t
bS9pbml0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IEBAIC03NTIsMTIgKzc1Miwz
NSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZGlzYWJsZV9wZ3RhYmxlX2w0KHZvaWQpCj4gICAqIHRo
ZW4gcmVhZCBTQVRQIHRvIHNlZSBpZiB0aGUgY29uZmlndXJhdGlvbiB3YXMgdGFrZW4gaW50byBh
Y2NvdW50Cj4gICAqIG1lYW5pbmcgc3Y0OCBpcyBzdXBwb3J0ZWQuCj4gICAqLwo+IC1zdGF0aWMg
X19pbml0IHZvaWQgc2V0X3NhdHBfbW9kZSh2b2lkKQo+ICtzdGF0aWMgX19pbml0IHZvaWQgc2V0
X3NhdHBfbW9kZSh1aW50cHRyX3QgZHRiX3BhKQo+ICB7Cj4gIAl1NjQgaWRlbnRpdHlfc2F0cCwg
aHdfc2F0cDsKPiAgCXVpbnRwdHJfdCBzZXRfc2F0cF9tb2RlX3BtZCA9ICgodW5zaWduZWQgbG9u
ZylzZXRfc2F0cF9tb2RlKSAmIFBNRF9NQVNLOwo+ICAJYm9vbCBjaGVja19sNCA9IGZhbHNlOwo+
ICAKPiArI2lmbmRlZiBDT05GSUdfS0FTQU4KPiArCS8qCj4gKwkgKiBUaGUgYmVsb3cgZmR0IGZ1
bmN0aW9ucyBhcmUga2FzYW4gaW5zdHJ1bWVudGVkLCBzaW5jZSBhdCB0aGlzIHBvaW50Cj4gKwkg
KiB0aGVyZSBpcyBubyBtYXBwaW5nIGZvciB0aGUga2FzYW4gc2hhZG93IG1lbW9yeSwgdGhpcyBj
YW4ndCBiZSB1c2VkCj4gKwkgKiB3aGVuIGthc2FuIGlzIGVuYWJsZWQuCj4gKwkgKi8KPiArCWlu
dCBjaG9zZW5fbm9kZTsKPiArCj4gKwljaG9zZW5fbm9kZSA9IGZkdF9wYXRoX29mZnNldCgodm9p
ZCAqKWR0Yl9wYSwgIi9jaG9zZW4iKTsKPiArCWlmIChjaG9zZW5fbm9kZSA+PSAwKSB7Cj4gKwkJ
Y29uc3QgY2hhciAqY21kbGluZSA9IGZkdF9nZXRwcm9wKCh2b2lkICopZHRiX3BhLCBjaG9zZW5f
bm9kZSwKPiArCQkJCQkJICAiYm9vdGFyZ3MiLCBOVUxMKTsKClRoZSBjb21tYW5kIGxpbmUgaGFu
ZGxpbmcgbmVlZHMgdG8gaG9ub3IgQ09ORklHX0NNRExJTkVfRk9SQ0UgYW5kCkNPTkZJR19DTURM
SU5FX0VYVEVORCAod2hpY2ggbWFrZXMgaXQgcG9zc2libGUgdG8gdXNlIG5vezQsNX1sdmwgKmFu
ZCoKS0FTQU4gOy0pKS4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
