Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE12EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAfzCQDzFLiGGTPPRv+WH+oXU4q0s2xmD9U1t3TzomI=; b=A8OvyjpeXojJMK
	BkO6rFXEpDRmRxQa/zQv/ORXCSEn2OhsVOSXKarR79Vr6TJyYXITwWUEwW5Xa6i35S8LVQDEfA1r+
	bIHQTMFW7DxSiFGTfCyepyqYg5K2wuFxWJ0Nrdlf0robGSJzri1umyz3KGnuDMpGpWy5emvJaqKlC
	cBbofO1slBpGg7InFhCqG/jC0myjkQtLTq8C+omwuA4acG8YvXwg0i9Ee95vF/gsAOMur8ZLV+z6/
	qi+6TLHXTwMW52f69ibexOyf/QtmJatBHy1yttQIMb+NxR8LxTcq07As4MM8TkYiMD6mue9o630VS
	d/SVUsAfkXg+DqnbCUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZqF-005zvG-08;
	Thu, 17 Aug 2023 10:02:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZqC-005zuN-1E
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 10:02:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D991B60B05;
	Thu, 17 Aug 2023 10:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C47C433C8;
	Thu, 17 Aug 2023 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692266575;
	bh=lW9/v/Opq7Tqu51ERKYkMPKnGxso6nLfK0q1mdCNrsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fI7bnbVMq3itrQOao9vU4L0SOVnvpnC9v0HOf/90utdAMXD4ugPN20wWc+t/bXjRI
	 aDciWdcxEh2EPGH9Ck/mvC08v8UONzzEBP3sK+wale3vF7oTIdQ/n3438lZYE4aguP
	 PKfYkWJKyf8QkysdjpsyYsqtbq6WGSEHBxrGgTSgpC9QOTy3mEf2j7E37PlIUj+InV
	 CEzi6C8uPkcQUSmmZv3DkgIizUgbS/mRHuPerBZFpCwUpcQ/cy0WSXCwWImqg67af5
	 UuL8dKaUevr7RZdbcaBznnP+u7Mja6HZHwnUbyATGQ88rL5JHiP7pjzWUtNRl98i2I
	 JGWKt2HarJEYA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: conor.dooley@microchip.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org,
 mpe@ellerman.id.au, jpoimboe@kernel.org, mark.rutland@arm.com,
 svens@linux.ibm.com, guoren@kernel.org, jszhang@kernel.org,
 ebiederm@xmission.com, bjorn@rivosinc.com, heiko@sntech.de,
 xianting.tian@linux.alibaba.com, mnissler@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH v2] riscv: Dump user opcode bytes on
 fatal faults
In-Reply-To: <CAEEQ3w=MgH82+BMpwmUHnUevMJsJUqgeBRWSZnU_iizMLK37UQ@mail.gmail.com>
References: <20230329082950.726-1-cuiyunhui@bytedance.com>
 <87v8dfqays.fsf@all.your.base.are.belong.to.us>
 <CAEEQ3w=MgH82+BMpwmUHnUevMJsJUqgeBRWSZnU_iizMLK37UQ@mail.gmail.com>
Date: Thu, 17 Aug 2023 12:02:52 +0200
Message-ID: <871qg29eb7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_030256_465468_B14FE9E7 
X-CRM114-Status: GOOD (  13.72  )
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

eXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gSGkgQmrDtnJu
LAo+Cj4gT24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMTE6MTHigK9QTSBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gSGkgWXVuaHVpLAo+Pgo+PiBXYWtpbmcgdXAg
dGhlIGRlYWQhIDstKQo+Pgo+Cj4+Cj4+IFg4NidzIHNob3dfb3Bjb2RlcygpIGlzIHVzZWQgYm90
aCBmb3Iga2VybmVsIG9vcHM6ZXMsIGFuZCB1c2VybGFuZAo+PiB1bmhhbmRsZWQgc2lnbmFscy4g
T24gUklTQy1WIHRoZXJlJ3MgZHVtcF9rZXJuZWxfaW5zdHIoKSBhZGRlZCBpbiBjb21taXQKPj4g
ZWIxNjViZmE4ZWFmICgicmlzY3Y6IEFkZCBpbnN0cnVjdGlvbiBkdW1wIHRvIFJJU0MtViBzcGxh
dHMiKS4KPj4KPj4gV2R5dCBhYm91dCByZXdvcmtpbmcgdGhhdCBmdW5jdGlvbiwgc28gdGhhdCBp
dCB3b3JrcyBmb3IgdXNlcmxhbmQgZXBjIGFzCj4+IHdlbGw/IEkgdGhpbmsgaXQncyB1c2VmdWwg
dG8gaGF2ZSB0aGUgc3Vycm91bmRpbmcgaW5zdHJ1Y3Rpb24gY29udGV4dCwKPj4gYW5kIG5vdCBq
dXN0IG9uIGluc3RydWN0aW9uLgo+Cj4gT2theSwgIEJhc2VkIG9uIHlvdXIgc3VnZ2VzdGlvbiwg
SSdtIGdvaW5nIHRvIHJlbmFtZSBkdW1wX2tlcm5lbF9pbnN0cgo+IHRvIGR1bXBfaW5zdHIuIExp
a2U6Cj4gc3RhdGljIHZvaWQgZHVtcF9pbnN0cihjb25zdCBjaGFyICpsb2dsdmwsIHN0cnVjdCBw
dF9yZWdzICpyZWdzKQo+IHsKPiAuLi4KPiAgICAgICAgICAgICAgICAgaWYgKHVzZXJfbW9kZShy
ZWdzKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBiYWQgPSBnZXRfdXNlcl9ub2ZhdWx0KHZh
bCwgJmluc25zW2ldKTsKPiAgICAgICAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGJhZCA9IGdldF9rZXJuZWxfbm9mYXVsdCh2YWwsICZpbnNuc1tpXSk7Cj4gLi4uCj4g
fQo+Cj4gV2hhdCBkbyB5b3UgdGhpbms/CgpZZWFoLCBsb29rcyBnb29kISBEb2VzIHRoYXQgd29y
ayBmb3IgeW91PwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
