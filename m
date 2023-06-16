Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B84DEB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5U5BWnIdgOwIGTnrDeknxEX0WSLTeYAaFZMz45dFho=; b=udU2pAV3Ba6t2e
	g8Mg0/KkvpoNSo7davEgOXO3UmiU8ZFS8P0Gko0adI7HRULb/m6wrJtDqcADfKs6p09S2RPlVc8d8
	1igzMA9UkCJsyO0eOfaAoNZRYpJbCUFwyApBodIQJscpxc8ycxEini81+P3Qi0kdiXn4u6/uEsNKn
	pImiyvfp00yYIwwJVVxMyzwtzQr73GRvzio808vBEfhr4iHXkq54i4hqPfaEJmQKglarDn7kV2axu
	o+5FSljRZSg5UOMHpIBSvT/b/kaAWenbxxcEq2A+SmsFN26ufxFP5aT4UVGjazA9Gj+cy8ACUh8f8
	z97Nk7In3h4mP9Ebv5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAAYz-000pM8-0F;
	Fri, 16 Jun 2023 14:36:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAAYv-000pKm-0s
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 14:36:30 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-982a1b92d55so116534766b.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1686926187; x=1689518187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BACqnweRL61UjLrvkmQrlGuJAGVIBESiVvuLAZdqQgo=;
        b=SI9LdqWxDOWAVuG55cmvzVYPb5UqK7IiZ5dfEkIn7TqIshRNu/zoicyG1+0ZCxHS5o
         uo9sKJROKr+jJyWoUprePgJx0DGOHnCrk9lokCssSZ0y3YcAjd2erad5hYTEQd+xSr42
         8xPLgmcjFm3jDu3n8xA+fG29trDJbxZKAqOGZk7UWp4XbSHSL6WxaS0h/cvh9l5luSIr
         ajHPspUrYAblG+LJ2Wa+pjJTkhsBOSUDJSqGhfWBAKdiZE4YFJz+bmOF60YHc1UnmerB
         fMVUNX+rkssWKpjRBk0QjNWSp/sezaAZzLn/qjRftNnF3vpufRjwx8nL7W7yB5k8kXl6
         1MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926187; x=1689518187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BACqnweRL61UjLrvkmQrlGuJAGVIBESiVvuLAZdqQgo=;
        b=QxcVHMRVSt6W2+aWKRIQ6fJ9Jc4C3huNXmglnBT/2gL1Qnb1d19mO/I/hTqX15VgMB
         9ZtAMTGJyJCxsHsPY5N/P8SePi2cJYxxgAnSL6cillokvlH+u7yZDtY5Pw17F707jZaS
         QUxzu5vHXUrhN9H0wY6ObdF0EwDXPi4HBX7Zp79V2YzSpqa34A7686Z1wi1cS7lgMeDZ
         ikNtYjPh7LbeMHdhsurcn46YSOSAWQEFlhFyBAH8rBfgsvVfJnBA+YTLqt5HXoEL6gB3
         kkNb7akjWe4ARNchVvf1y87Ke6zKLlwm2BjJrMuOeAxb+WQvqJmrD+7sN18QEgJ80YnE
         8zHw==
X-Gm-Message-State: AC+VfDzHU2ybPneICWmtNiz+4e+tPpiTAxyVqY93Ufvu6mCv/3QWDb93
	UViU2xF6LRLhryGUD41dBjnqzlgmeDhVfqhR7F9ejg==
X-Google-Smtp-Source: ACHHUZ6RJz+dJvapT4zI/sjWIJF+dBfDpbIVQmXDr5TNO0zmnnDqhOMJOYvim3qW9pYH7lUqULrkrWkjhVTbdzGASws=
X-Received: by 2002:a17:907:783:b0:982:c8d0:683f with SMTP id
 xd3-20020a170907078300b00982c8d0683fmr2002129ejb.18.1686926186692; Fri, 16
 Jun 2023 07:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Jun 2023 20:06:14 +0530
Message-ID: <CAAhSdy0Yu6965Q1eS8gZq3-CkiD=s5hqdsC=VwHU7fnrJq=M9A@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: kvm: define vcpu_sbi_ext_pmu in header
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	atishp@atishpatra.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_073629_523004_7B4B0324 
X-CRM114-Status: GOOD (  16.98  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgNzo1MuKAr1BNIEJlbiBEb29rcyA8YmVuLmRvb2tzQGNv
ZGV0aGluay5jby51az4gd3JvdGU6Cj4KPiBTcGFyc2UgaXMgZ2l2aW5nIGEgd2FybmluZyBhYm91
dCB2Y3B1X3NiaV9leHRfcG11IG5vdCBiZWluZwo+IGRlZmluZWQsIHNvIGFkZCBhIGRlZmluaXRp
b24gdG8gdGhlIHJlbGV2YW50IGhlYWRlciB0byBmaXgKPiB0aGUgZm9sbG93aW5nOgo+Cj4gYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmM6ODE6Mzc6IHdhcm5pbmc6IHN5bWJvbCAndmNwdV9z
YmlfZXh0X3BtdScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPgo+IEZp
eGVzOiBjYmRkYzRjNGNiOWUgKCJSSVNDLVY6IEtWTTogQWRkIFNCSSBQTVUgZXh0ZW5zaW9uIHN1
cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5j
by51az4KClBsZWFzZSBpbmNsdWRlIFJldmlld2VkLWJ5IHRhZ3Mgb2J0YWluZWQgb24gcHJldmlv
dXMgdmVyc2lvbgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiB2MjoKPiAgIC0gY29ycmVjdCB0aGUg
Zml4ZXMgdGFnIGFzIHN1Z2dlc3RlZCBieSBDb25vciBEb29sZXkKPiAtLS0KPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8IDMgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpLmMgICAgICAgICAgICAgfCA0ICstLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmgKPiBpbmRleCA0Mjc4MTI1YTM4YTUuLmI5NGM3ZTk1OGRhNyAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+IEBAIC02Niw0ICs2Niw3IEBAIGV4dGVybiBjb25z
dCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfaHNtOwo+ICBleHRl
cm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2V4cGVy
aW1lbnRhbDsKPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZj
cHVfc2JpX2V4dF92ZW5kb3I7Cj4KPiArI2lmZGVmIENPTkZJR19SSVNDVl9QTVVfU0JJCj4gK2V4
dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfcG11
Owo+ICsjZW5kaWYKPiAgI2VuZGlmIC8qIF9fUklTQ1ZfS1ZNX1ZDUFVfU0JJX0hfXyAqLwo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYwo+IGluZGV4IGU1MmZkZTUwNDQzMy4uYzk3M2Q5MmEwYmE1IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aS5jCj4gQEAgLTIwLDkgKzIwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlf
ZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF92MDEgPSB7Cj4gIH07Cj4gICNlbmRpZgo+Cj4gLSNpZmRl
ZiBDT05GSUdfUklTQ1ZfUE1VX1NCSQo+IC1leHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3Ni
aV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3BtdTsKPiAtI2Vsc2UKPiArI2lmbmRlZiBDT05GSUdf
UklTQ1ZfUE1VX1NCSQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNp
b24gdmNwdV9zYmlfZXh0X3BtdSA9IHsKPiAgICAgICAgIC5leHRpZF9zdGFydCA9IC0xVUwsCj4g
ICAgICAgICAuZXh0aWRfZW5kID0gLTFVTCwKPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
