Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A598CAC5AC
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPrK8dHm6jeqIj+8D+FnP7tEWMpNhI5kSr18UQ9tmHE=; b=igR/DiTGgzCTqP
	8scOX5Xftwp9mgtDpBJAsXRjBYPkMPZLt1cU/mH6brp1HvvtUoeOyOpywe1rinQDFVVUmVLZThaLL
	1ek2JMzNNtCyTPamNXeA/57xSpnINAmIHnaXtzr86OH7OOQIf5XG2gpvrwAveSL5AqYXTpjOhvtHE
	DztMOb2QiPkOYqY3MhS29X5e/Gsa0HKJhUgQ+c/fjRobtGUsMuUg/cIIBVsga4QlbqbkIbp1pRBSV
	v8TmzdSZnkYat7zdmXF00HCWfSHGKUlzpU0Z1aBEXDC4i0V6Qrzrmwd20VaWFyGHchSWrEP9spKXo
	zVFqcnWucAMBPSQmmmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22R3-0000000GZy8-3U4D;
	Fri, 26 Sep 2025 07:00:05 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22R1-0000000GZva-1atA
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 07:00:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758869995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QkTOcOfFY4baMchg3LR2JuebeFgUlm+dPMtjYbMgxme/rr0cyHoIpKLTedhQ3bZJ41v65Fzlo1Y1lPvVfNJAMPDWE8rHyj5AoRwoqEnSijU/2duMHGODkLNsHAr4EqpTwjpFJOozY0Pcetc7DHw5ZWRITAS1WJxZ9MUo6Fn1oH0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758869995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0d9+QhwLUeUPH+Ao+04JvPakxKcbgowNGfFk3Ill9Lc=; 
	b=Skie3Y2qByPr0+fZ3z+bHHr3qmnDzvCmLMaTyVV4Mlbuk0IYBU8fRslxmqjAgXB3u7EnPV0thbnkePfJqQuf2L+WejXXX2k8x0Co10Hhiyg03UOjZwunMTibAfV2ICnNYmIMx0iZ0a2qEnK0be8Sbd7Nx6/nJ1HPAjUZ79Zkqs0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758869995;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=0d9+QhwLUeUPH+Ao+04JvPakxKcbgowNGfFk3Ill9Lc=;
	b=BLg6SYgbtAdkYngvl718gBszCAox2SMv7/VsoRaT0FLf0L6hiITao+dr/T2W+7A4
	67Tr3cRdlBcBsMbPha6ZACAGjEh4+0RCXKguBazNW1LBWtaRsXtA0X2QiRGdJhVqz3G
	PMrZvp2q2PDNLHU9nBYJenPEE0Jmu1u3Ulus3kPpoiPKnRl58CLbUw0FnKotDW8jQYX
	gHkE9+FSzClOi77oPNpwrDsHifFWhkdBGiPZhJJvROO3bh3Vc7fw5K1C2Ncuthchyxf
	E0R24scAB2b5AFp54iSCKWXZ0H6K9va4RW1cFvkEPJNkut08cYRfJxR6wNXgrNz50cX
	ylYzzgIETA==
Received: by mx.zohomail.com with SMTPS id 17588699937861009.4088550034123;
	Thu, 25 Sep 2025 23:59:53 -0700 (PDT)
Message-ID: <6ded068f5c004f8735dca378502b91ccdf56bc21.camel@icenowy.me>
Subject: Re: [PATCH next] pmdomain: thead: Fix error pointer vs NULL bug in
 th1520_pd_reboot_init()
From: Icenowy Zheng <uwu@icenowy.me>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	 <wefu@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Fri, 26 Sep 2025 14:59:48 +0800
In-Reply-To: <aNYQkVuVpP3Daq7x@stanley.mountain>
References: <aNYQkVuVpP3Daq7x@stanley.mountain>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_000003_489135_A93A5B1A 
X-CRM114-Status: GOOD (  11.57  )
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

5ZyoIDIwMjUtMDktMjbmmJ/mnJ/kupTnmoQgMDc6MDMgKzAzMDDvvIxEYW4gQ2FycGVudGVy5YaZ
6YGT77yaCj4gVGhlIGRldm1fYXV4aWxpYXJ5X2RldmljZV9jcmVhdGUoKSByZXR1cm5zIE5VTEwg
b24gZXJyb3IuwqAgSXQgbmV2ZXIKPiByZXR1cm5zIGVycm9yIHBvaW50ZXJzLsKgIFVzaW5nIFBU
Ul9FUlJfT1JfWkVSTygpIGhlcmUgbWVhbnMgdGhlCgpDaGVja2VkIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiBhdXhpbGlhcnkgZGV2aWNlcywgYW5kIHRoaXMgaXMgdHJ1ZS4KClNvCgpgYGAKQWNrZWQt
Ynk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgpgYGAKCj4gZnVuY3Rpb24KPiBhbHdh
eXMgcmV0dXJucyBzdWNjZXNzLsKgIFJlcGxhY2UgdGhlIFBUUl9FUlJfT1JfWkVSTygpIGNhbGwg
Y2hlY2sKPiB3aXRoCj4gYSBOVUxMIGNoZWNrLgo+IAo+IEZpeGVzOiA2NDU4MWY0MWY0YzQgKCJw
bWRvbWFpbjogdGhlYWQ6IGNyZWF0ZSBhdXhpbGlhcnkgZGV2aWNlIGZvcgo+IHJlYm9vdGluZyIp
Cj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3Jn
Pgo+IC0tLQo+IMKgZHJpdmVycy9wbWRvbWFpbi90aGVhZC90aDE1MjAtcG0tZG9tYWlucy5jIHwg
NCArKystCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcG1kb21haW4vdGhlYWQvdGgxNTIwLXBtLWRvbWFp
bnMuYwo+IGIvZHJpdmVycy9wbWRvbWFpbi90aGVhZC90aDE1MjAtcG0tZG9tYWlucy5jCj4gaW5k
ZXggNTIxMzk5NDEwMWE1Li5kN2NiOTYzM2M3YzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wbWRv
bWFpbi90aGVhZC90aDE1MjAtcG0tZG9tYWlucy5jCj4gKysrIGIvZHJpdmVycy9wbWRvbWFpbi90
aGVhZC90aDE1MjAtcG0tZG9tYWlucy5jCj4gQEAgLTE3OSw4ICsxNzksMTAgQEAgc3RhdGljIGlu
dCB0aDE1MjBfcGRfcmVib290X2luaXQoc3RydWN0IGRldmljZQo+ICpkZXYsCj4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphZGV2Owo+IMKgCj4gwqDCoMKgwqDCoMKg
wqDCoGFkZXYgPSBkZXZtX2F1eGlsaWFyeV9kZXZpY2VfY3JlYXRlKGRldiwgInJlYm9vdCIsIGFv
bl9jaGFuKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIWFkZXYpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAtRU5PREVWOwoKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHJldHVy
biBQVFJfRVJSX09SX1pFUk8oYWRldik7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9
Cj4gwqAKPiDCoHN0YXRpYyBpbnQgdGgxNTIwX3BkX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
