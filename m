Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED03AC77B75
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9IeYly4WLAERCIZqQ3kxHoVIsGOv5azmhtfy0RV3Es=; b=1Hu/+MwgICyzQI
	BeGyKpyOtEIp49c3bMwb0oKHmL/QjNsCnpVWOUGxu+lT7LMeQFVYc5Eu7fp7MiAW9FvZytHwi78MT
	FFKIZ4SUk2Zr2ErCu9pUCUuqvFTgNXdn19jZOr2J0HY8uCdN1yt4+Un365xdhB/E8/exKnhFANpUn
	rph7SAwQr6xDNOKq8c73uprxJtb7M+JIwcEPZ4EqaHBiZkOjGQ60pVNG0ZtjRL9LsQMlqRAt/bXll
	aYh5E4bhLYtkAv+H1R65iFikvbqyRrRIgo+8vOP71XskSDePWHG+qwxlelTj0GCkq2+Ona59J0VN3
	reKxKXmTQMKjZMRFbKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvgUh-00GJba-1D;
	Sun, 07 May 2023 15:40:15 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvgUe-00GJaR-12
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 15:40:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bcc565280so5531308a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1683474009; x=1686066009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5Pp7plOXKov3HGN3A57TzbkMhjOejQetUlM+mZ2KPA=;
        b=H9B6ObqHh+7v0vLYifvsDy4ssZ2kW9pF8G+91JdtkDQja6uX1QfeQe2tGfxl0FbIzL
         s5xZ7s3dLjcDvjym1+TSkBt/xcKlccBO0a1udA/hEV9DP2K65JfHA7aAxIiR46sQHAxf
         XDp7QJnLtmXQoypdYxm+/oLrIkyzDVSIAVmULuL3+wJ90z7NsFZdxgIrWDkbWIUljbH7
         csPVS+5rYdO3RGj1kTx80Zo9SgeybNN/zpbWfx2ccVqgkw1hdIwqyCrobkKWvfGinBzA
         pSucBod1cpAuYp0UPHtn+XS4fUjoFL5jj9cJl2VlDRpGWVviMc8HPGbmln3SxoBLvAMd
         0Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683474009; x=1686066009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5Pp7plOXKov3HGN3A57TzbkMhjOejQetUlM+mZ2KPA=;
        b=hRRVNsriopIwikAS9Uu7EtPDmZBy9eSYiq6VHTzFU9kCruCSSMMtUBW3NqOa4R3f1J
         zAv6IzPhdTFyoBdQDZIss7kOIgkNZXlTUOhl8EjruR0gbAuR482Do1Lczx2chYpR0fbo
         TQZvSwXHigcrPg8yxb4l5BKIL7JfOa/cV5ehZDwOl57fCWJTgxqpZPdknN5dYSry1oTC
         hlSii8zE74y5C8WTgSxElTU/Gjb2d9vaC26JipJV8Vd0KWFWf5woNKJ1ixmUzAxluJ5G
         1phz9013aLPtRp5BxDXWeBgNL7TVxJFpf3BnBvczoAIvR2ThiJKVIFeu3GKbPlDDbU4F
         PrBw==
X-Gm-Message-State: AC+VfDx2y7mMr+nJY5a93S5C60bYIY4ttF70WpW9z3fi3ZzJ3zWXf/Se
	WRvSei1Ju/CZpmqrKMXjxk1lTZR+4PjxUBvTjE/zDg==
X-Google-Smtp-Source: ACHHUZ6bkFYh4m/GEp+qUFWxV6rN57l8XbRSNZJ7xxL5HglrhlV+/GXGcEpby4YAmQL6/KbQAvkAK8y0Uo0XKMN5+u8=
X-Received: by 2002:a17:907:7f25:b0:94a:937a:58f1 with SMTP id
 qf37-20020a1709077f2500b0094a937a58f1mr8422433ejc.1.1683474009148; Sun, 07
 May 2023 08:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <202305061711417142802@zte.com.cn>
In-Reply-To: <202305061711417142802@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 May 2023 21:09:57 +0530
Message-ID: <CAAhSdy0xBiyXz903xmK4e4n4tknjW4aBTjuGe4-v1xat5hqFmA@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: use bitmap_zero() API
To: ye.xingchen@zte.com.cn
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, sergey.matyukevich@syntacore.com, dylan@andestech.com, 
	ajones@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_084012_584560_779C518A 
X-CRM114-Status: GOOD (  15.12  )
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

T24gU2F0LCBNYXkgNiwgMjAyMyBhdCAyOjQy4oCvUE0gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+
IHdyb3RlOgo+Cj4gRnJvbTogWWUgWGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+Cj4K
PiBiaXRtYXBfemVybygpIGlzIGZhc3RlciB0aGFuIGJpdG1hcF9jbGVhcigpLCBzbyB1c2UgYml0
bWFwX3plcm8oKQo+IGluc3RlYWQgb2YgYml0bWFwX2NsZWFyKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBZZSBYaW5nY2hlbiA8eWUueGluZ2NoZW5AenRlLmNvbS5jbj4KCkxvb2tzIGdvb2QgdG8gbWUu
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMs
CkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L21tL2NvbnRleHQuYyBiL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jCj4gaW5kZXgg
MTJlMjJlNzMzMGU3Li4yMTdmZDRkZTYxMzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9j
b250ZXh0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+IEBAIC02Nyw3ICs2Nyw3
IEBAIHN0YXRpYyB2b2lkIF9fZmx1c2hfY29udGV4dCh2b2lkKQo+ICAgICAgICAgbG9ja2RlcF9h
c3NlcnRfaGVsZCgmY29udGV4dF9sb2NrKTsKPgo+ICAgICAgICAgLyogVXBkYXRlIHRoZSBsaXN0
IG9mIHJlc2VydmVkIEFTSURzIGFuZCB0aGUgQVNJRCBiaXRtYXAuICovCj4gLSAgICAgICBiaXRt
YXBfY2xlYXIoY29udGV4dF9hc2lkX21hcCwgMCwgbnVtX2FzaWRzKTsKPiArICAgICAgIGJpdG1h
cF96ZXJvKGNvbnRleHRfYXNpZF9tYXAsIG51bV9hc2lkcyk7Cj4KPiAgICAgICAgIC8qIE1hcmsg
YWxyZWFkeSBhY3RpdmUgQVNJRHMgYXMgdXNlZCAqLwo+ICAgICAgICAgZm9yX2VhY2hfcG9zc2li
bGVfY3B1KGkpIHsKPiAtLQo+IDIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
