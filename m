Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D8C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zV3ho0eMYuARTcJH+d+D+Ude4hDl0LnLgrNSBvrcg0k=; b=ih8N3RVjo/BnWE
	WMDpK2VnI8suaAwdCkW/f1CSfshiu5En2xWUEvZoHVo3Tjw3d6+UiySPUPDouTb0NKqD1HLR/Bx+B
	alnqXJJdYdTqnOBX/AfSmgZ9MLlLpgwwD2ILilmGKYY721xrL00WG5OmBK7m3Sqted3Zx8FVJfDRw
	DgvFZD6cAbwGMratez5NqxL91tH2gLlnqLp17g7Mhq3KVA6feEMWeOikuW3+eBRb/q6eagYUbQync
	nsgnJJ6A86a1ZWK+nWqM20bqvxocEqKKd5ou9jrLarfG0jRArIUUz2e9XJjF4Zcm9QsmY93gUGBW9
	Jv7jKlgfDROav+qb9A1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfCA-0000000CYON-0dM7;
	Tue, 14 Jul 2026 15:37:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfC8-0000000CYO6-2sKm
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:37:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D65840086;
	Tue, 14 Jul 2026 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2191F000E9;
	Tue, 14 Jul 2026 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043436;
	bh=p/WVKNRgG6HCMh8QdcHkpFgg2wBA4OGdLOMQQGR5bXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mSudT+fhGsjkm1g7cHqsqzU9OFwdWKZdQdeL6LMnf8iYmh+1TH0pMbblp2eT5BvVR
	 EQc7YaED2+psd6tI4QUVFHYcWtjr0Bq7/Ia/Fl94B6DY4k6b85Qk8e+hDJPw4F1wir
	 ZhFCa1sR6Swq0A+/zlsBdmOhCtrpx9L8JpVDdOdAEX08Wp2evSJmnd7YxvjX62Of+0
	 uWmLmcAeURVSEe1HCSbCKazOC91BCEMdVreaIerBOtWzB2/vERh2FNWTsQu0jNN1Kr
	 gxabJOOOFZxHjoleatK3GksI3w/tEZZEgWJy61vBEOCW4jEqz8Oy8/h4myZPxkVzOz
	 8tv0PjlkgtzmQ==
Date: Tue, 14 Jul 2026 17:37:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
Message-ID: <alZXX4xX-f2EPNIJ@zenone.zhora.eu>
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn>
 <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
 <DJUQ3TZHM7OO.34ULEC76Z2BDY@linux.spacemit.com>
 <e453a825-4d73-4d35-a699-a495b0ca1058@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e453a825-4d73-4d35-a699-a495b0ca1058@kylinos.cn>
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

SGkgUGVpLAoKPiA+IE9uZSBwcm9jZXNzIG5vdGUsIHRob3VnaDogcGxlYXNlIGRvbid0IHJlcG9z
dCBuZXcgdmVyc2lvbnMgdGhpcwo+ID4gcXVpY2tseS4gdjIgZm9sbG93ZWQgdGhlIHJldmlldyBj
b21tZW50cyBhbG1vc3QgaW1tZWRpYXRlbHksIHdoaWNoCj4gPiBtZWFucyBvdGhlciByZXZpZXdl
cnMgd2hvIHdlcmUgc3RpbGwgbG9va2luZyBhdCB2MSBuZXZlciBnb3QgYQo+ID4gY2hhbmNlIHRv
IGNoaW1lIGluIGJlZm9yZSB0aGUgdGhyZWFkIG1vdmVkIG9uLCBhbmQgdGhlIGRpc2N1c3Npb24K
PiA+IGdldHMgZnJhZ21lbnRlZCBhY3Jvc3MgdmVyc2lvbnMuCgo+IEJlY2F1c2UgSSBub3RpY2Vk
IGEgc2ltcGxlIG1pc3Rha2UgcmlnaHQgYWZ0ZXIgc2VuZGluZyB2MQo+IOKAlEkgZm9yZ290IHRv
IGluY2x1ZGUgdGhlIHZlcnNpb24gbnVtYmVyIGFuZCBjaGFuZ2Vsb2cgZm9yIHYy4oCUCj4gc28g
SSB0aG91Z2h0IHRoYXQgYnkgZml4aW5nIGl0IHdpdGhvdXQgd2FpdGluZyBmb3IgcmV2aWV3ZXJz
IHRvIHBvaW50IGl0Cj4gb3V0LMKgCj4gSSBjb3VsZCBzYXZlIHJldmlld2VycycgdGltZSBhbmQg
Z2V0IHRoZSBwYXRjaCBtZXJnZWQgbW9yZSBxdWlja2x5Lgo+IMKgSSBtYXkgaGF2ZSBiZWVuIHdy
b25nIGFib3V0IHRoYXQuIFNvcnJ5LgoKWW91IGNvdWxkIGhhdmUganVzdCByZXBsaWVkIHRvIHlv
dXIgb3duIHBhdGNoLiBJdCBoYXBwZW5zIHRvCmV2ZXJ5b25lIHRvIG1ha2Ugc3VjaCBtaXN0YWtl
cy4KCkFuZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
