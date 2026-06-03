Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ABECD6E6A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/UBMq2YUjfLBkUAgcwSXxlWfSlR11MYYaguZzcDblQ=; b=zUTra0GY23el/o
	1DacYYM+PyORZP8GlegC9+Y8AqFVBVIZo8d4IPw1Yku9sm/UXpYQ4vGPDZPRElI4hcPTt4HXpsc+w
	NWLhkFUR3zqpzBxDWckNU6KhOqbOUQD2XvaQsUsDtwO7ZyEYqRRC+Mp0Hm0FnAUO756tf3XlUXBMm
	t7rL5W0bH9q1R6pOCUnC2gtqjKH9/QtL5/httyQzynelMcmy5wBzZ6FnUuOSrRb92se7QTl6es3Vt
	5Jg7RcqYff+RgihclUGm4Njt1/wHwLHEKkthpcXkmL39Opb3uNvDfc9lLQn5wXP8kcQosi23OsPVR
	SI4iu2cz+RSln+xRfQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoa-0000000EYsq-3TwT;
	Wed, 03 Jun 2026 08:19:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoY-0000000EYqq-2E3z
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=; b=GDqoIO12LLRkfGKk9qr0+f8Ee6
	y7G3Mo8Wuukq26u8gzV+felYDts61lDzu/anYO/FYftZthh8XT/GIfM5LoS70ipJC85OMKYLPIwlP
	3ZUXrZBGw+mfTKma/BVZwjnmovFdEynITPkOgaukZxI0CYhvuBOzn0DUzgkB6WW53wHncoT+bYCei
	dT/lxP9uomw8xFy29PlTCfSeDt9oP709sVhALp9/OfhBXpk8zmzQ1w6RxuKixpMVTn56GDZRSBZ22
	RhO2BLN0VjIe6FxdLJj2We8lkdo+IWw6ZywU3pi4T4pju7JUT18iIqUTE0FStokoQX5YWLrrl0bnp
	W4y+nD7w==;
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgoT-0000000BYWd-32Yi
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:19:01 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-43bf6230cffso283526fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474736; cv=none;
        d=google.com; s=arc-20240605;
        b=K/T1NnvS6m/B1OyFKcEJ2iFn9zgUufTyvUL3YK9UHPHiKmyzyN7yB4xiTX81r0eshY
         MsyN9GPkevvPfnTCrgPBU+RZJkutSzIhSWw0xQCdl4IiPAG4YnWdjA6nRG2voJVvBCp2
         DrIk5erRyaGm4QiKEoKM3RPutOHsUSVsK8XpYqnvcvZubfDRfnIvN7Gi/arxyiEpb9Hi
         ZCnNZt2gYvAkTX8hs9ssKPLvKv201uuIKQTJbhkq6T5fbIJREawRimXhCSTiFsmPcw9/
         stY7LJ4OZaCXawEEFTllM46YSIpDcM3usNo8IQa2P5gLlzRUxnqGYPuEr2kVojsnvKD7
         wLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=;
        fh=1o6n9GLgJ+QQFTdI0edGhvBH8puQLNi/g47aqjtLqeo=;
        b=bA2rlywlJ24jN/iUg+kk0e2woUBglvnYFMfCT85PiG6M0Ow+41eJ0viYjki1xwLD8g
         D8ZcBxD7BwAyTd7eyzn12ENjcff0vM+fjWqui3Rvih2LHof0WMRZi1fjIDqPFbkQprY6
         RlNSZdjWYRC3cWdSbcG5Ecn9kFssEqNIi3w65fuIgNylhZZaIXquPY448sdgh1PXwYn/
         rIrgMJqa6EsBspvX+t+iHRP99fOpLSpTc55vtSInC1oefMTqhVq9e2XSiIspPL9Wu88T
         U/LDRMPWgAOHaZwz7AWmInVgS5Qi7UDNCZrmJNHrP4FNIJPC1ZfXhuvFEWaMpEB2XAEZ
         gFqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474736; x=1781079536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=;
        b=ZwxmbQ4Erl3G2kYmnng34ACycuOCLJkByWZGZZ0lqAJnczZNGfNjs0sU4+rVHRoKKC
         d81LfaNbBt6apDJjCLcT0V2bQUrWkb3hNUCwdXo7IKhCEobdYkXK6Y4/qlBKlHn+XIdW
         yMxBHCkIOStY6x3NCSTsPqv+duNjtX3zHjzSrXOAkXmvKpjXqANaDfX/fQ4Ouk1LuBQm
         fCYq68At+gTmF40MTMLvaFa6DyUoj+ZuWRGs4q7Mk/jc80Nfs00/IcSmos9Pi2hQsJgI
         wG9zIO3WKM3DyCnipe61yTGXj1pnjFVzLBzQ/K9meDP3w9O+1VvWOfCvU3bhg0/9nGbs
         J8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474736; x=1781079536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=;
        b=N/LPhv6TI4KlquwIaN9M8ZVorDMqkgFbjsIeZKdrSpT7etQRu1hODA7puMnB5N6nQw
         FUsGGEBjZS428kA6DtYRLcHP04IU6Xu+Niz0uaqajRnCCJroI7FprsGPLwjsmNLSATpS
         kBBqzWWBVKjGJmKyOl8C9/uBidAuxFYrxmBeD6Vhvh3cRXxdJYw/xEUTI3GEvirfRQ8M
         fijuepxzerVfVz8NMUsc95usLgXpqerjUYdZtram7cYFDJhzTBJPKc/hoR2kM/X4tD3a
         mz/C4pS5WbbgU6M+ah/GQQMumNY/R3hxWaqfCYiZcPr63bfz/r/nkkpujkKToCa45gHW
         b4Og==
X-Forwarded-Encrypted: i=1; AFNElJ8+NiX3r0HlGRdMMcgKu1aoRc2qsZfr8wFgAE4k9PbvZ/SWhQ2LGhaj2b8jnjjwZ/kqRxp4dPL8UQ2rRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj7CDzRO4sjU/v1XyVva0MttV2aEP5y3E4+c1X3ovqiS5eA6FD
	KQt1bbDZD7lJ7CEZmbV+0DgUYopDQ3IJFdGLQ8XgNpGqEJSg4057hKlGGiTYkvSvGQfc4OBYD+y
	oCxTY9IwvHBB+lEC+CK35xHopFUOhpLKPSZgdqm1+Dg==
X-Gm-Gg: Acq92OEzhs7GuvUvCq9LQfQ8Jou0WE91zK/kHxE/B+lLJWvFbxAf1b3U/NDzD9AhT8p
	BLeJh0QiFIyVEzbceDZNTzD9ElhXrYHZ2AgfpbvtF4RrOglL6tnEDA13QV482FdUTLJTbrh2wjN
	rI3SZQWOpIAlHcE2irjl1vPtLY4bH5PRybtj31hAd7dR6S4vhYJ7ANQlgG8BZ0SbXLZn7HpQDze
	vDv/bgW25y1Zpo3trw/oRUSMeYJzPrbvvQ/Nks9+S7OmdSILONdPwC4Oe25QevWdYdAUXg4fvYQ
	NpkKSwERriQ958WhvN4wyAXMORqsySBJ2IrdE3sh65pd/rY9lDog5K6xdtj7G0R+7BjZlT2rcLH
	o/WkxoQzu0VBrv01ZLz1rNOZ2Aq+ZVzLhu+2PQOgHB6qX4Sjr
X-Received: by 2002:a05:6820:4c89:b0:696:6e28:8c19 with SMTP id
 006d021491bc7-69e48c8b9ebmr865206eaf.20.1780474735890; Wed, 03 Jun 2026
 01:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513154251861FBOlxl8ySih_oqyoJL1iA@zte.com.cn>
In-Reply-To: <20260513154251861FBOlxl8ySih_oqyoJL1iA@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:44 +0530
X-Gm-Features: AVHnY4KAwfGnPP2mIswxICBynzTnVouAFw9Yon74XWLX5xuvqnAhH_lb6zEINMc
Message-ID: <CAAhSdy3vB+jes4WxQh4jN2GSmLYU6i_tySfKd3Y2xcZJQ6K0Yw@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: KVM: Split huge pages during KVM_CLEAR_DIRTY_LOG
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091858_692927_7101FFCE 
X-CRM114-Status: GOOD (  13.18  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMToxM+KAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gU3BsaXQgaHVnZSBwYWdlcyBvbiB0aGUgcmFuZ2Ugc3BlY2lmaWVkIHVzaW5nIEtW
TV9DTEVBUl9ESVJUWV9MT0cuCj4gQW5kIGRvIG5vdCBzcGxpdCB3aGVuIGVuYWJsaW5nIGRpcnR5
IGxvZ2dpbmcgaWYKPiBLVk1fRElSVFlfTE9HX0lOSVRJQUxMWV9TRVQgaXMgc2V0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3Ms
CkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDMgKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9t
bXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMTRjNTU4ZWU1ZjE1Li4yY2RlYTNl
M2VkNGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS9tbXUuYwo+IEBAIC0xNDcsNiArMTQ3LDkgQEAgdm9pZCBrdm1fYXJjaF9tbXVfZW5h
YmxlX2xvZ19kaXJ0eV9wdF9tYXNrZWQoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAga3ZtX3Jp
c2N2X2dzdGFnZV9pbml0KCZnc3RhZ2UsIGt2bSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl9nc3Rh
Z2Vfd3BfcmFuZ2UoJmdzdGFnZSwgc3RhcnQsIGVuZCk7Cj4gKwo+ICsgICAgICAgaWYgKGt2bV9k
aXJ0eV9sb2dfbWFudWFsX3Byb3RlY3RfYW5kX2luaXRfc2V0KGt2bSkpCj4gKyAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl9zcGxpdF9odWdlX3BhZ2VzKCZnc3RhZ2UsIHN0YXJ0LCBlbmQsIHRydWUp
Owo+ICB9Cj4KPiAgdm9pZCBrdm1fYXJjaF9zeW5jX2RpcnR5X2xvZyhzdHJ1Y3Qga3ZtICprdm0s
IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QpCj4gLS0KPiAyLjI3LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
