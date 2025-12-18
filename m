Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AFDD6E2D1
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNx+vWkCG4UBAphgzlz9gddW1q6l3XLPdvems53GyUA=; b=hxcjIpArD5HpqX
	l56lMU6b1uiqArwDaJS/xiBwfME7LFtFJKuVdGjutjN8PcndLn8jCSbdbQaBe36zB9xOsus2N1Ad7
	q6TCfmGYQxuMeH77ihr/Gq9T1lrTY5eji5t6r8eRHQGfO7e5sOfRXe+idXBTsJMs1qherMzifTDMd
	hdToLntDxWcVOpuF3HYbMj86XsbY00Fn7hiP4vGtSRFvOiF/J3vMZS4cMm+zzqtYCtMoEvfvnKHEJ
	Cdqwdms1UgXh/uGyzYkG+ckOTBdY3b4qRIVbdXFJBZWSSY1wmYzjQc5HxABiTfoeb9oU0I5MML2N3
	ekdOtVydIjjrN2eaM1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8I-00000008wjM-3rmN;
	Thu, 18 Dec 2025 17:49:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8H-00000008wjA-246u
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Dec 2025 17:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=; b=Yo/HYHHV7OpEvzekcwz8iTr73L
	pSJVwzkO9kdBj9j8dYQ7A58MSSGBEePj/XUv6Mf0SI738W3uOM4t5OkeoYCcQ7aCi4tapLa3aEUXO
	o3csEmT/KOFtJcWVOJS24B/s1x1m4s6SmTf+BF5rpFAgQEBwntoxzYdfsJEejt9VRkRx1v0WCIFYp
	sELW2M9Snf0hJCYVbAAaSNNnFU8mSO3ywLg1na/QEPXiZVrRsqqmxqn0a3GpFh1xm7vzJRNmJvI8f
	a4fDoRL7PqK6tY+rFfNc6n3o7fWlWEmJ08SJSALQR2eRbYQx7ZlcZhKSRKSRLYWf+lJ6k2ivMku/9
	BuclLRUA==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHGl-00000009Jda-39Y6
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 16:54:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64b7a38f07eso935816a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080180; x=1766684980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=;
        b=dr0MlGYzbRRGs30nBJtXOSq/pCEFrNqO2NZHgRbBwmoEJx5+HH+BEGnGWiKrgo0kFZ
         pQRYySpfoX2B42HzjYtEJry+AFQPZrT5TiZQtuzqUO+Gmgj1r9ivKQey4rLYTMflUOXb
         wxNZoau7l1ymyMC0FxY+JaYsFRnE5QpH20TRO6Z4xzO+kSbIc9kZGs1sMqqW1hwHEtcf
         QXuUCeGlY3BFoPLwjSeUFzRa2YXfOW8IlnByly3l9fl21XUACu8TgGQocm4L7zZl+1F2
         AR5DnhihD4ZY6nXRCPirxzUuVXsbE0y2ETi1KNLzjixliFpECWS61EDenOsu2Dk4FBKQ
         NFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080180; x=1766684980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=;
        b=ODtZSFgMQVdhK/3NR9H5xIuK9Yem0FbGiucdxUciO9CoFl812k86DxiLWFnPLg81xb
         dFzmNWK/QDZeXLnwV+OrBRc10v5GTVstQ5hk6xNp7+jTHmR3JABiaJdmOyZTSi2KJ0iz
         Obx1yb4GB29f45CxwfflGgP44e9bG2do2EeUEqA5zqn54t1DhaHskz2xZL/SWJunLCn7
         GhWqbLu0CrNBZur2QB+sWjtHKFnG2NGjwN6wB3CjkKj8U7ciI6aEWwye+A33nKgbQyiq
         msWhnZCaC9uWCcYP+PNq3SRAsNhjQwLKXRRq1Uxf2BZKLLZzUNIZzxQbVjNq9auTIC9V
         JYfg==
X-Forwarded-Encrypted: i=1; AJvYcCXTXAEOP3CZ72Ymr7fSUvgtESz3A9Z3WmDJzuJGrXt3BEFCRekoGIMPWvqqNHcJB+xiRMeFNt1QpRf0RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz2t9tBqNOt31kMAHC7rYfYiErnsSrYWA2MRpg33i24kZ/CWYt
	uUq5oGiVWlQH/VZ6nXONEq2uNdeC36HjY2WQCsa3g9N7uOu09ebkOoM9A71Gf0A181O6XfIC4Yl
	JjMhhnqsDvddzrQAqLY9mye96cMo4WqwF67gwIPHCtA==
X-Gm-Gg: AY/fxX6WIyWEScbRqft1JzT8JEfxsoBQHzLU6IUFSw70AHkZiC6uoAhWaqcyDpowjsZ
	wj1eFmhu8tExSLjiwpNU7v/zCeGnh16PGMHNsZPe4nnxto9ElPOateoA73x9SFO+ai7kiaaEWgz
	6YMu8A+yqpD7cw08rs0luTowbqVxyFEzzdZOCpcgbaI+7rla1fmz15ea6P1igpru7DbeRSMoZm0
	5O5RQf9iTLRbrBx6ceZtDZs6FJ5aNjqTVOLIi8jBUkX6XMpD3BI8f4Uze25gw7rQZ6FVG5h4ZT8
	eS8Nft612aqBZEhRaDN16RBn
X-Google-Smtp-Source: AGHT+IGj1ZcHTui7KBWUYP4FXCtel/5ayalcHtcXFNH9hEXSeqZ0F+Z3lWPo8TWqbx8PXpNtXrjwPKCaynSUAFZ631g=
X-Received: by 2002:a05:6402:1e92:b0:649:8b6f:99c5 with SMTP id
 4fb4d7f45d1cf-64b8eb7194amr231643a12.15.1766080179958; Thu, 18 Dec 2025
 09:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <20251219-pgtable_check_v18rebase-v18-1-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-1-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:49:03 -0500
X-Gm-Features: AQt7F2r7kiXa3gHIKUaDejuDxi7v3d-8CVx2-W_EwfFsV1tLHpl2uarz70Sl-ZA
Message-ID: <CA+CK2bA-3p1iy9ryaQSthV0MhpxzuMVK91F1YF45qw90PUtG3g@mail.gmail.com>
Subject: Re: [PATCH v18 01/12] arm64/mm: Add addr parameter to __set_ptes_anysz()
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_165427_977099_A77E1AA1 
X-CRM114-Status: GOOD (  14.52  )
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

T24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgMTI6MTDigK9QTSBBbmRyZXcgRG9ubmVsbGFuIDxhamRA
bGludXguaWJtLmNvbT4gd3JvdGU6Cj4KPiBUbyBwcm92aWRlIHN1cHBvcnQgZm9yIHBhZ2UgdGFi
bGUgY2hlY2sgb24gcG93ZXJwYywgd2UgbmVlZCB0byByZWluc3RhdGUgdGhlCj4gYWRkcmVzcyBw
YXJhbWV0ZXIgaW4gc2V2ZXJhbCBmdW5jdGlvbnMsIGluY2x1ZGluZwo+IHBhZ2VfdGFibGVfY2hl
Y2tfe3B0ZXMscG1kcyxwdWRzfV9zZXQoKS4KPgo+IEluIHByZXBhcmF0aW9uIGZvciB0aGlzLCBh
ZGQgdGhlIGFkZHIgcGFyYW1ldGVyIHRvIGFybTY0J3MgX19zZXRfcHRlc19hbnlzeigpCj4gYW5k
IGNoYW5nZSBpdHMgY2FsbHNpdGVzIGFjY29yZGluZ2x5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+CgpSZXZpZXdlZC1ieTogUGFzaGEgVGF0
YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+Cgo+IC0tLQo+IHYxNTogbmV3IHBhdGNo
Cj4gdjE2OiByZWJhc2UKPiAtLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
fCAxOSArKysrKysrKy0tLS0tLS0tLS0tCj4gIGFyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYyAg
ICAgIHwgMTAgKysrKystLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
cGd0YWJsZS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBpbmRleCA0NDVl
MThlOTIyMjFjOThlZWY3MTc4ODhhZWFjNzFkMWQ2YjFkYTA2Li41MmYzZWEwNzQyN2NlZjM5OWU2
OGJlYTBkYmFiMzlkMDNlYTgzMDYwIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBA
QCAtNjczLDggKzY3Myw4IEBAIHN0YXRpYyBpbmxpbmUgcGdwcm90X3QgcHVkX3BncHJvdChwdWRf
dCBwdWQpCj4gICAgICAgICByZXR1cm4gX19wZ3Byb3QocHVkX3ZhbChwZm5fcHVkKHBmbiwgX19w
Z3Byb3QoMCkpKSBeIHB1ZF92YWwocHVkKSk7Cj4gIH0KPgo+IC1zdGF0aWMgaW5saW5lIHZvaWQg
X19zZXRfcHRlc19hbnlzeihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHRlX3QgKnB0ZXAsCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHRlX3QgcHRlLCB1bnNpZ25lZCBpbnQg
bnIsCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9wdGVzX2FueXN6KHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZSwgdW5zaWduZWQgaW50IG5yLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGdzaXplKQo+ICB7
Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHN0cmlkZSA9IHBnc2l6ZSA+PiBQQUdFX1NISUZUOwo+
IEBAIC03MDksMjYgKzcwOSwyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19zZXRfcHRlc19hbnlz
eihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHRlX3QgKnB0ZXAsCj4gICAgICAgICBfX3NldF9wdGVf
Y29tcGxldGUocHRlKTsKPiAgfQo+Cj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9wdGVzKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgX19hbHdheXNfdW51c2VkIGFkZHIsCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Nl
dF9wdGVzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZSwgdW5zaWduZWQg
aW50IG5yKQo+ICB7Cj4gLSAgICAgICBfX3NldF9wdGVzX2FueXN6KG1tLCBwdGVwLCBwdGUsIG5y
LCBQQUdFX1NJWkUpOwo+ICsgICAgICAgX19zZXRfcHRlc19hbnlzeihtbSwgYWRkciwgcHRlcCwg
cHRlLCBuciwgUEFHRV9TSVpFKTsKPiAgfQo+Cj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9w
bWRzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgX19hbHdheXNfdW51c2VkIGFkZHIsCj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBfX3NldF9wbWRzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG1kX3QgKnBtZHAsIHBtZF90IHBtZCwgdW5z
aWduZWQgaW50IG5yKQo+ICB7Cj4gLSAgICAgICBfX3NldF9wdGVzX2FueXN6KG1tLCAocHRlX3Qg
KilwbWRwLCBwbWRfcHRlKHBtZCksIG5yLCBQTURfU0laRSk7Cj4gKyAgICAgICBfX3NldF9wdGVz
X2FueXN6KG1tLCBhZGRyLCAocHRlX3QgKilwbWRwLCBwbWRfcHRlKHBtZCksIG5yLCBQTURfU0la
RSk7Cj4gIH0KPiAgI2RlZmluZSBzZXRfcG1kX2F0KG1tLCBhZGRyLCBwbWRwLCBwbWQpIF9fc2V0
X3BtZHMobW0sIGFkZHIsIHBtZHAsIHBtZCwgMSkKPgo+IC1zdGF0aWMgaW5saW5lIHZvaWQgX19z
ZXRfcHVkcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIF9fYWx3YXlzX3VudXNlZCBhZGRyLAo+ICtzdGF0aWMgaW5saW5l
IHZvaWQgX19zZXRfcHVkcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRy
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB1ZF90ICpwdWRwLCBwdWRfdCBwdWQs
IHVuc2lnbmVkIGludCBucikKPiAgewo+IC0gICAgICAgX19zZXRfcHRlc19hbnlzeihtbSwgKHB0
ZV90ICopcHVkcCwgcHVkX3B0ZShwdWQpLCBuciwgUFVEX1NJWkUpOwo+ICsgICAgICAgX19zZXRf
cHRlc19hbnlzeihtbSwgYWRkciwgKHB0ZV90ICopcHVkcCwgcHVkX3B0ZShwdWQpLCBuciwgUFVE
X1NJWkUpOwo+ICB9Cj4gICNkZWZpbmUgc2V0X3B1ZF9hdChtbSwgYWRkciwgcHVkcCwgcHVkKSBf
X3NldF9wdWRzKG1tLCBhZGRyLCBwdWRwLCBwdWQsIDEpCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9tbS9odWdldGxicGFnZS5jIGIvYXJjaC9hcm02NC9tbS9odWdldGxicGFnZS5jCj4gaW5k
ZXggMWQ5MGE3ZTc1MzMzNmQ4NjMxNGZlZTBmNzUzZTg3NzlkNmE2YmMxMi4uMTAwM2I1MDIwNzUy
MDhkNDI1MmMyN2ZmZGFjYjFhYWY0OTI4NjM5YiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L21t
L2h1Z2V0bGJwYWdlLmMKPiArKysgYi9hcmNoL2FybTY0L21tL2h1Z2V0bGJwYWdlLmMKPiBAQCAt
MjI1LDggKzIyNSw4IEBAIHZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAgICAgICBuY29udGlnID0gbnVtX2NvbnRpZ19wdGVz
KHN6LCAmcGdzaXplKTsKPgo+ICAgICAgICAgaWYgKCFwdGVfcHJlc2VudChwdGUpKSB7Cj4gLSAg
ICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBuY29udGlnOyBpKyssIHB0ZXArKykKPiAtICAg
ICAgICAgICAgICAgICAgICAgICBfX3NldF9wdGVzX2FueXN6KG1tLCBwdGVwLCBwdGUsIDEsIHBn
c2l6ZSk7Cj4gKyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBuY29udGlnOyBpKyssIHB0
ZXArKywgYWRkciArPSBwZ3NpemUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19zZXRfcHRl
c19hbnlzeihtbSwgYWRkciwgcHRlcCwgcHRlLCAxLCBwZ3NpemUpOwo+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4gICAgICAgICB9Cj4KPiBAQCAtMjM0LDcgKzIzNCw3IEBAIHZvaWQgc2V0X2h1
Z2VfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAg
ICAgICBpZiAocHRlX2NvbnQocHRlKSAmJiBwdGVfdmFsaWQoX19wdGVwX2dldChwdGVwKSkpCj4g
ICAgICAgICAgICAgICAgIGNsZWFyX2ZsdXNoKG1tLCBhZGRyLCBwdGVwLCBwZ3NpemUsIG5jb250
aWcpOwo+Cj4gLSAgICAgICBfX3NldF9wdGVzX2FueXN6KG1tLCBwdGVwLCBwdGUsIG5jb250aWcs
IHBnc2l6ZSk7Cj4gKyAgICAgICBfX3NldF9wdGVzX2FueXN6KG1tLCBhZGRyLCBwdGVwLCBwdGUs
IG5jb250aWcsIHBnc2l6ZSk7Cj4gIH0KPgo+ICBwdGVfdCAqaHVnZV9wdGVfYWxsb2Moc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+IEBAIC00NDksNyAr
NDQ5LDcgQEAgaW50IGh1Z2VfcHRlcF9zZXRfYWNjZXNzX2ZsYWdzKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLAo+ICAgICAgICAgaWYgKHB0ZV95b3VuZyhvcmlnX3B0ZSkpCj4gICAgICAgICAg
ICAgICAgIHB0ZSA9IHB0ZV9ta3lvdW5nKHB0ZSk7Cj4KPiAtICAgICAgIF9fc2V0X3B0ZXNfYW55
c3oobW0sIHB0ZXAsIHB0ZSwgbmNvbnRpZywgcGdzaXplKTsKPiArICAgICAgIF9fc2V0X3B0ZXNf
YW55c3oobW0sIGFkZHIsIHB0ZXAsIHB0ZSwgbmNvbnRpZywgcGdzaXplKTsKPiAgICAgICAgIHJl
dHVybiAxOwo+ICB9Cj4KPiBAQCAtNDczLDcgKzQ3Myw3IEBAIHZvaWQgaHVnZV9wdGVwX3NldF93
cnByb3RlY3Qoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gICAgICAgICBwdGUgPSBnZXRfY2xlYXJf
Y29udGlnX2ZsdXNoKG1tLCBhZGRyLCBwdGVwLCBwZ3NpemUsIG5jb250aWcpOwo+ICAgICAgICAg
cHRlID0gcHRlX3dycHJvdGVjdChwdGUpOwo+Cj4gLSAgICAgICBfX3NldF9wdGVzX2FueXN6KG1t
LCBwdGVwLCBwdGUsIG5jb250aWcsIHBnc2l6ZSk7Cj4gKyAgICAgICBfX3NldF9wdGVzX2FueXN6
KG1tLCBhZGRyLCBwdGVwLCBwdGUsIG5jb250aWcsIHBnc2l6ZSk7Cj4gIH0KPgo+ICBwdGVfdCBo
dWdlX3B0ZXBfY2xlYXJfZmx1c2goc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4KPiAtLQo+
IDIuNTIuMAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
