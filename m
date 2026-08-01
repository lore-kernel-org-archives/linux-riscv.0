Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BECC5516F
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOHJ9Q6Pfp5JvqntDQDW3EE0rkrdE8GlnekKSg37PcU=; b=DtMYJtjQKPcr1g
	YDODtwYrE9fxc6CeqksYAoWmMQPliWDohpKA4e/NQY+a858HGdEk0Vg/aIu5EETvIpUzA1WoyEW2+
	ohtw4Q+uF9/oLYF/7Oyvt0cP3xs9VqPcH2GeTGTynovvO7e5jCsouJ8G08y5zsY7WlGXAD5/CTh7q
	Mrrb9vZIFw6OOD2jO0TQkSmp8WsIm5F9wVCpw1YQBuhz0cYMl7hM3bhq1a/tocS4JB/B6G/GywnzU
	ZlcMVxRZdOB/4FgbA82mPVMYm3B5honfQtJF4HlC6TpeVvHHFKeY+bhexPbzKOzdr0jZ3iIyWNmnJ
	ULAPepauha6bWRf45Epg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Y8-0000000E6CO-0GKn;
	Sat, 01 Aug 2026 08:58:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Y4-0000000E6Aw-0Vu7
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:58:30 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aec6360133so1589594e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785574706; cv=none;
        d=google.com; s=arc-20260327;
        b=glyLDvuASml06GUKPlApHvuj7J0HlQY8sGFOzQ/kqliV4+b9CLseDoAPyWIrhLuirR
         PP5DfTORUcu4NC3bW6xRiwE5shIHIZC6MeLn3jubek/dvgBUlMhzlgYW+o66fNYF1bPi
         sNuDN87sGvzsuJVBf4ziAik2oAdEI0W7B7Jc0WMSfZqOTxctyRCOFp5puwt9AwtenYq4
         UhWk9FlVhH9LgAABDiadkFda3sRc5rwIz4oYGKDo7KkgwuG0r/a5HyMLt8Hqp/vV4Dqn
         kYZ/541nl0GxCfrKburW7ElxoLshmn+IDOlAG/qbn6Btoo7vz6FAkYWLGOKyef4Qn+8H
         7DMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ot7Bn3ZEURQrk42Oh0sapiZcIWCpwwKzFXd66di2HQw=;
        fh=omR8/5xKwjdQw2Ax7sef/3ghSSlRofMatvxocRQAeW4=;
        b=oirGarRc8IXCJFs6PGsZ+919Z4S7+7Pz/OShloZinuHEZCg0pJEPfQ1KCWvxjwGyhV
         Pu91OC1BuGULe/sb/BGwUqg9oFcWCWkD15FxyaFuo2veae7+yLaZbsS5/GyU5CzgystP
         kIMYIUguURvI+TvpA622i6T7xpy6VuVAxtnc5wJHphjKjuwDJQrMGMCkvpyCkndVGpNA
         ZuotdsyPabXmcc0jg2YgnouX0bpW2Cizzi4VTt9NNfib+UL7cs9yroJOPesNOE7r0FXK
         6Y5LQ1qqfkHYLap6jE2S2xnP+BdB1rCad+eJN/ogtbUxQDHak1LGS54GYWtJB3p6dydi
         DM2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785574706; x=1786179506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ot7Bn3ZEURQrk42Oh0sapiZcIWCpwwKzFXd66di2HQw=;
        b=JUdF/WfbZPWbP6NcRnkHcpMdtnOXh0TLCk4Hi1lZhHoTSF263fjpxdj9fCmVfmif8t
         g00JUBazpxJGslUmN0MJJ3DREB+jOdyYGTNUm87mKmNsio0E3Hc5/FJO07d12gbmJnIT
         IUpeUucMyCZvSlY5VMKlUB5vwguYrzalzk9ASne6PWXkjY6IddhHx/zFgg/w0coZg6VI
         BEZ71jAKzU+cEIdL5vwx7ZMt/7mGBi1RT8eWCd9/PIUmEu665Efcc6QpI+6Q+5G8fhWM
         AkpZLP6Ck883l8BNqoWDMoOPeZ6w0bjRt+ixXCmVPZt/vPw4lWpxvArZs5vBwS3XVgxz
         FqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785574706; x=1786179506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ot7Bn3ZEURQrk42Oh0sapiZcIWCpwwKzFXd66di2HQw=;
        b=cjdm/+IfplDbMEJgFCh/Ldf+6RkDwSKIyRmJYZn8g0cGuPgQn95bFLSqDKMpgjk7Xq
         jNQUyaBUju4qivU5X744UADmS7yEAHoT0jp1fb+yTBXVBzE00WIiCCBxAdAMsXAAo8yU
         Nn1ZgJDM9yJ5/NTZBo2ZDjnmtYZph31wQVURB8a77XxS5BigiqRdzRM+W7NoAGysQIm1
         wQB3XvdNF1qVmFjr23n0fTVZEp2Scx/RQeWIWU9UIiAVYJhvljhppzwchhaA3z//fH8+
         iTowjyRWA7LbqjJ4Pj+YAvN367IIjyHulKIHqANUsLjEgYgww8Bd15oj0BNchgG7dfdY
         OfxA==
X-Forwarded-Encrypted: i=1; AHgh+RqXbFkWtqcli/o2SfD8jdwylqPUqpFIvw0+Xg+/l2k9SGByBFXQC11JRTTEiUyBBiV7dWQp6Cccf+mpAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykg0gQYOei6bQalRwg6iRIMIy4k+FDy2WRDtuae5IhaNS/4TLq
	6x+X62ebeAzjdI8SvK6nnHNU7l8+XReK8t5Mqto5e8sjofrcMRbugXKhZNEutaZ8KPiLlbdPKnI
	KJWLZgshn0MbCs0phf7I5ydDyR+tl4JXdZd5v1TVQxw==
X-Gm-Gg: AR+sD12EER9jDVBrT0bZwLWnGwWFXMnLUZ5q4qdWCXHwrm+xE+tXVD8vRWgOLgD2ffL
	8qURVl9Xp2Kj7DeO6aF9u7aAFHaXYkKEykmaxrlDN5htKESlFfRDEyx2o+U8W31yk2drVOzzIjD
	iWOUtXtYQGrNndFgI5MKNlMZU3SGQYeX75j6pGef89/ByWgFPDhD3ch8baeFv413b4giZ+5a6Tw
	a6N48TXMzFxEtQVqcxyjiojzmWegO0fZJirgaHY8u9EFHkl8lI8V6r4vCyJ1PHw6a3mheul+/W/
	esgOzev43w8PAYDLKmeKCCrImw0mnkwyy7xwmxpEyQAkxxS9dEGF2ZPRHE+pP6A/b/R7b0ynp6D
	xe4AGYR9W4uBYdx2mP+4RezO8hUWtQstcHlLVWG/JxTDzANd1afpvZFX5Sx8JaH1K
X-Received: by 2002:a05:6512:1093:b0:5b0:1df9:2adf with SMTP id
 2adb3069b0e04-5b2e4f3cf51mr582135e87.28.1785574706057; Sat, 01 Aug 2026
 01:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260716073756.44153-1-min_halo@163.com>
In-Reply-To: <20260716073756.44153-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:28:13 +0530
X-Gm-Features: AUfX_my5qj7P0Pupl53QfIIfW1LsY1looLvmcDl2m-c-rMFrzQ4zMY72aHpKZiA
Message-ID: <CAAhSdy2eTsxG=aoXb=LqG6+=mthMcwTY6cZOi+NSvzHJ0s7r=w@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix infinite loop in NACL hfence entry allocation
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_015828_176817_6AEA934B 
X-CRM114-Status: GOOD (  16.64  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMTowOOKAr1BNIFpvbmdtaW4gWmhvdSA8bWluX2hhbG9A
MTYzLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBab25nbWluIFpob3UgPHpob3V6b25nbWluQGt5bGlu
b3MuY24+Cj4KPiB0cnlfY291bnQgaXMgaW5pdGlhbGl6ZWQgdG8gNSBidXQgbmV2ZXIgZGVjcmVt
ZW50ZWQgaW4gdGhlIHJldHJ5IHBhdGgsCj4gbWFraW5nIHRoZSBgaWYgKHRyeV9jb3VudClgIGNo
ZWNrIGFsd2F5cyB0cnVlLiBJZiBhbGwgTkFDTCBzaGFyZWQgbWVtb3J5Cj4gaGZlbmNlIGVudHJp
ZXMgcmVtYWluIGluIHRoZSBwZW5kaW5nIHN0YXRlIGFmdGVyIHN5bmMsIHRoZSBmdW5jdGlvbiBs
b29wcwo+IGZvcmV2ZXIsIGNhdXNpbmcgYSBzb2Z0IGxvY2t1cC4gRGVjcmVtZW50IHRyeV9jb3Vu
dCBvbiBlYWNoIHJldHJ5IHNvIHRoZQo+IGZhbGxiYWNrIHdhcm5pbmcgYW5kIHJldHVybiBiZWNv
bWUgcmVhY2hhYmxlLgo+Cj4gRml4ZXM6IGQ0NjZjMTljZWFkNSAoIlJJU0MtVjogS1ZNOiBBZGQg
Y29tbW9uIG5lc3RlZCBhY2NlbGVyYXRpb24gc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogWm9u
Z21pbiBaaG91IDx6aG91em9uZ21pbkBreWxpbm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExp
bnV4LTcuMwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9uYWNsLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL25hY2wuYyBiL2FyY2gvcmlzY3Yva3ZtL25hY2wu
Ywo+IGluZGV4IDZmOWY4OTYzZTlkZC4uOWFmZjAzYzRmNjY3IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL25hY2wuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL25hY2wuYwo+IEBAIC0zMyw3
ICszMyw3IEBAIHZvaWQgX19rdm1fcmlzY3ZfbmFjbF9oZmVuY2Uodm9pZCAqc2htZW0sCj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIGlmIChlbnQgPCAwKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICh0
cnlfY291bnQpIHsKPiArICAgICAgICAgICAgICAgaWYgKHRyeV9jb3VudC0tKSB7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgbmFjbF9zeW5jX2hmZW5jZSgtMVVMKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGFnYWluOwo+ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+IC0tCj4g
Mi4zNC4xCj4KPgo+IE5vIHZpcnVzIGZvdW5kCj4gICAgICAgICAgICAgICAgIENoZWNrZWQgYnkg
SGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
