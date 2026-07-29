Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2A8C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9TYBBG/VDRjN/dQ3xNYY3KofvoeGY89MeQNwnMXye0=; b=kce8keNEtYAoeQ
	OkWle1ld+w3+YsHmyGV66Ye6BPjvxJKquJ5+A5hcmcZV9A1cOLc5l0j9ysZoRGDnjfuC5J2g+A3Yg
	rbxMmAt44P9yektDLK3xfgsy8RG/icw8iFyLb6w4ZKNkAloDwu8FuShkUWFzx56/zp0E/70p8lYy+
	t82FJ0JqaGQkuILO48fkoM8J6iPOZpku42eTVO2D384cgDfFMbY1y9wGXaLJo2pgkZejCcIyfol7/
	cSHM8UBbZ93zkq0y7EibxeQNy68834+mnJwC5AYI1XiAkUtBq1oRtyr7jMCvQufX1ZhoO1riQtjdi
	lnUzPb0sA+l5KeLIXoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozD1-00000007BHv-0yl8;
	Wed, 29 Jul 2026 08:00:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozCy-00000007BGo-10q7
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 08:00:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso303116f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 01:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312006; cv=none;
        d=google.com; s=arc-20260327;
        b=M0Lbw6rFRK7Wt+XE5x7OA6gFfpE8zL8yS5X59Um+GA0Q7oK/PgNkTW5AMiP3tXn4uA
         1ZtvIwBEPdtpWaBgZpjzdrJ+/6bnZULKwzGnNeD4BoJaghZYJaTWDfEGrJU01LUI3vRr
         k08Od403L/iUtZj+PGUjmLv+gFrWcrbWFyDdWY4XvnUWu/squGPw7/PMvIP3UzdscwWF
         GEcYBSHPNNdSVx09Tfe6IcDPmrUCucYVpfS0zkx0EumLQoAg6RqmDCdtBiW3fIOQlkDT
         bnkai8rty8vksG40QnIjjvsQ5iCVoACljFfOxFWeszNxTNH0+OpISuCzaCumrezp2hG/
         NenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rci5JZNGuacWnB92Os9ssONVUy8Ji8/sE2wdKdAgC1Y=;
        fh=fjimmtSwjHy2S2QDE1gW+zfe7Fr+SJg54+qtk39JFxQ=;
        b=E3g1+TSQIGEqK65JChSXtqvHCQfIhM0XvPDIgGYhAM1wd4t3fwyajbeQIsLCuGNOQ1
         dG56kTo0JUrmWt62rXRqhyGnQ6cl2gNZJXvYS3gLjx5BfR+oOD8OnUoPr/2vg1wOy3Ve
         nbWGNDsZDeyrfBOrLbdCkCTGU+I74ySt44edMlEnH/p2I4FPC+7IqLQHRydXv9vieSyN
         2u7gghPQxh6aGmkfccni9sysEwe8QntCPHbXl9DZQ/oZS7tdLdg0C6D1DCgVDgjD0JaM
         v4WtaT3a8SLzGFKgZuymtzT3nzt2YZlSJifWnravGP82zXoLRZw/PO+V8lpvzR43D7W/
         vdkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785312006; x=1785916806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rci5JZNGuacWnB92Os9ssONVUy8Ji8/sE2wdKdAgC1Y=;
        b=tCfIfR1Z9XXXKUVFbXVCqNHQk9bM7VI7qWmCT7pCPWeAJ9hwPb4Ne5nBGOgButXhf1
         bAeVeoRjGBevexHURpK6bfcRTPD9niOYtuBi9ZI04R2TUNOZnO2TOcQweGCDwhhxccBf
         HtPwWsYEWhuumWwA3MITXpBS6xIkxdR1P5hnRv9pccVZa4XUYQlsMuF3scxtuZEA86OW
         PMnWqtz1/oeG10FK7TfObkxM0sp02jxFS6gfYn/BeDGN1mtisTatFXLIt8pZxSGBph0M
         V+YI004NhiipoTHc2NHUwDyLPNAT0a7i9TcR383sEvNfz554CP/Am4pWPuzp2Sk9bIX1
         2ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312006; x=1785916806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rci5JZNGuacWnB92Os9ssONVUy8Ji8/sE2wdKdAgC1Y=;
        b=BRFCZLdCTE539Mn45jI8AKyHcxS11ZMA65+YrGdzbYNgjaD0sEqPE0yPFiGPJENHz8
         fcrMdYITIs4ht4CAAh6gX2rBN04kHQgYwFvS66EXsn3BT41iTs9yO7IgniGO1pD+kn5a
         Y++QAHPXqyuylqJcZOCcoLwlLFbjFQ6dMrShlq3hBj0wjS9kmZgXeogN1A7ZwfXgEw15
         B8+F3rkQCrWsB50ZL6TXwUMUBilBSeWoJ4YOZu/XU1APckc6/vg+tj1Rqa9dG4dH+MFt
         9eCyc3HVD3zb25zqur35MKli+hPNSpOKVuoY62LuzHHjQfm5AlAqAZ4ZVMPimyMcw47W
         V+4A==
X-Forwarded-Encrypted: i=1; AHgh+RqtJi0TxZhMjWkkx+0CgC/qlMUHdL1dKqL3u7jvZ3sLqXMd8htmmuVhJeNB71jysBNXoeyYzkLkrc7Tcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDlEuKWfZ8akq9KqRcKEUmJhvKLV26M51JSl+BY0hZk/wltmpP
	88xaS+uQYdI9zMgF6mou2YzZGKlI5i3kUN9Xqun7TBEL4kJ8V3w9qvQN56xvLrwMZsaJ/BkiSlF
	pznNlL21O4jbngYQX1rut3GRg2EOOnAX3m3P9LhQG3g==
X-Gm-Gg: AR+sD11wydku/nBrjJiHc8Kd1XfrMEM4YkXqH5n2nTNdMQ4jUqAoK/+b7Da3yyB2CHs
	1cw3lqIn3W8fMEpoz9Sy5oCUl61r4KNQLQNFhrwI48brqhh8VYCrnpxSq/reyGjpN+e/K0HLSuZ
	hu9TwMvA5GO29bsr60ZxAKKXf7KKxoYQ3/cJd7ZsMuQOEmBTq5LkfHD3HxV8Qce7dp9vekxv39R
	jeUdQKEhCAIwZIFKoyoHyaba0TUoL/XNmuaJoaVUIOX2SB75qJIA8u/dCmbRJeBfpz1GNbeGrKz
	uibMHrYHMg7IOySBIsJBPaYtIow9Bbrfv0ZOkPV1nHeg+Ry3lNnLxTvNL4kJKwrlBxrjnpm1OJj
	zTP9c4tuxDk1DSK/yby/T+Ib7BFG4UdOUUg9n0zycjiEU70kwtb3n9YRjXxhlbnjtn4WDV8nhmQ
	==
X-Received: by 2002:a05:6000:2305:b0:47f:9cc2:ddd2 with SMTP id
 ffacd0b85a97d-47fb1f12564mr6605912f8f.35.1785312005784; Wed, 29 Jul 2026
 01:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260706021154.210289-1-inochiama@gmail.com> <20260706021154.210289-3-inochiama@gmail.com>
In-Reply-To: <20260706021154.210289-3-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 13:29:54 +0530
X-Gm-Features: AUfX_mzA13dUOuvRHNAI3CYEINk5v4YYOQCfEpDt04tRyGPj1v-cqDo2CrT7xfE
Message-ID: <CAAhSdy2roJqQGtCXjfm4WoeSbXxMt5GSk_WO=4fAvJ4WEbjYeg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] RISC-V: KVM: Add SBI FWFT validation support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_010008_490964_AD361261 
X-CRM114-Status: GOOD (  17.27  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCA3OjQy4oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSB0aGUgS1ZNIFNCSSBoYXMgZXh0ZW5zaW9uIHBh
cmFtZXRlcnMgdmFsaWRhdGlvbiBzdXBwb3J0LAo+IGltcGxlbWVudCBpdCBmb3IgdGhlIFNCSSBG
V0ZUIHN1cHBvcnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFA
Z21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYmM1MTRhZTY1
MjFkLi4wYWExZjlhNTdjOTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTYwNCw2
ICs2MDQsMzAgQEAgc3RhdGljIHZvaWQga3ZtX3NiaV9leHRfZndmdF9yZXNldChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBrdm1fc2JpX2V4
dF9md2Z0X3ZhbGlkYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgc3Ry
dWN0IGt2bV9zYmlfZndmdCAqZndmdCA9IHZjcHVfdG9fZndmdCh2Y3B1KTsKPiArICAgICAgIGNv
bnN0IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSAqZmVhdHVyZTsKPiArICAgICAgIHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mOwo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAg
ICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZmVhdHVyZXMpOyBpKyspIHsKPiArICAgICAg
ICAgICAgICAgZmVhdHVyZSA9ICZmZWF0dXJlc1tpXTsKPiArICAgICAgICAgICAgICAgY29uZiA9
ICZmd2Z0LT5jb25maWdzW2ldOwo+ICsgICAgICAgICAgICAgICBpZiAoIWNvbmYtPnN1cHBvcnRl
ZCkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAg
ICAgIGlmICghZmVhdHVyZS0+c3VwcG9ydGVkIHx8IGZlYXR1cmUtPnN1cHBvcnRlZCh2Y3B1KSkK
PiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAg
IGNvbmYtPmVuYWJsZWQgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgY29uZi0+ZmxhZ3MgPSAw
Owo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGZlYXR1cmUtPnJlc2V0KQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGZlYXR1cmUtPnJlc2V0KHZjcHUpOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+
ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBrdm1fc2JpX2V4dF9md2Z0X2dldF9yZWdfY291bnQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1heF9yZWdf
Y291bnQgPSBzaXplb2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdCkgLyBzaXplb2YodW5zaWdu
ZWQgbG9uZyk7Cj4gQEAgLTc1Niw2ICs3ODAsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2Jp
X2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfZndmdCA9IHsKPiAgICAgICAgIC5pbml0ID0ga3ZtX3Ni
aV9leHRfZndmdF9pbml0LAo+ICAgICAgICAgLmRlaW5pdCA9IGt2bV9zYmlfZXh0X2Z3ZnRfZGVp
bml0LAo+ICAgICAgICAgLnJlc2V0ID0ga3ZtX3NiaV9leHRfZndmdF9yZXNldCwKPiArICAgICAg
IC52YWxpZGF0ZSA9IGt2bV9zYmlfZXh0X2Z3ZnRfdmFsaWRhdGUsCj4gICAgICAgICAuc3RhdGVf
cmVnX3N1YnR5cGUgPSBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZULAo+ICAgICAgICAgLmdldF9zdGF0
ZV9yZWdfY291bnQgPSBrdm1fc2JpX2V4dF9md2Z0X2dldF9yZWdfY291bnQsCj4gICAgICAgICAu
Z2V0X3N0YXRlX3JlZ19pZCA9IGt2bV9zYmlfZXh0X2Z3ZnRfZ2V0X3JlZ19pZCwKPiAtLQo+IDIu
NTUuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
