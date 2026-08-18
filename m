Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3659C5DF86
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qnNY/0FpJDWE1DvVUSs3CUoWtiyfwCElaiyWg4pbcLo=; b=zkM/Ux1uUWhk1gx8gxkW48B4bF
	/Icz1GJfHrk46XvMIIzmw4o+70Gs80RQVSDZw7ibBMqnKXAjMbvsiVADAHDdtWCqCoxIbLqOuTjhQ
	EO3meWBmQSx+XCBmqLS2MtNF4xRJvcZM2H4LSYvO8wZ/kbMR8FDtdkqCCnawy7J/J1tNLitLnkopC
	E2/H0knAIS+Qr3sLmeUBeolZIMf4UnNNCzukqos43pIqg1oHJKQDIzf59i/ta578DDhx7DI+ZPX/x
	nfSJkJ8inLqVCfCQ3C1b9ldYrZQbyeEURP2+4Khfrhb8JcteSw9KTcH967LWK6CnVW5gLQ8yGeSMn
	muiif60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwT3n-00000008l23-0Zzw;
	Tue, 18 Aug 2026 23:17:35 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwT3k-00000008l16-0WKa
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 23:17:33 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8485d853b08so656626b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787095050; x=1787699850; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=isOvqMF/5WA0EHYdsGtLtHCnG1u9xSNeKPU4MxGk99M=;
        b=gQpgN95CAV4wnDefY/VJmOUrSoCWNqvhn8meBXfy6K/KCVzacyOqM5DE9XM1n+T7HQ
         X41hQaju7BCol9PdcV4OFErlrD7Rw1OS5COG3QpmxeNMlula6KcGlIHmoT7UVOhaEHop
         /eAGzo5Xdk2zb3f51IOtCRRVvUC5ZdwFDsF2hfUzKt+VxoO2rsfre2SQbtHPoN1gBgoW
         op+dxH/V1O29fcrwW9XO7I13BdIDgSwOMRB/ReeDTx15ieH4zK74tf/XjBhqhaBTsfZl
         grj0DJYIbklWz0KnxRkdimw+XJe1lNv/IQtDKOEgWj5oKV8uOVwr/Mm20Ouh4s10SW9W
         QUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787095050; x=1787699850;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isOvqMF/5WA0EHYdsGtLtHCnG1u9xSNeKPU4MxGk99M=;
        b=J38gU0Vro8AigNQPdHzeJswY7k0Iu6S1co3ySDQmdrzn0cseFbMnPT6J1KNq/wuIGr
         7JLznBBVF6wdtIsHdThPq2bDE5qxIraDBOaWaZ91RafbkTeyVI/LxGRXtVYQGXUsddC8
         8z6vBRIR1GLSJ+gaipsKzjFYvNhqSot1YoouaDUsI2NehWjEDjPVFKu42qi3j3CH/9nU
         WYxRmiVYhogVLlFF6vpQH+UA7iipDAoj2uR2X/M2+BWttSB3h+VO62tCCN92UfbvQ5rp
         NieMckfcaFvY9x/dXrhfDKLi7xAX0KozYAEeYrnHWNH2OK2IyiESd+8uQ/j2dHf/gm5k
         zVew==
X-Forwarded-Encrypted: i=1; AHgh+RpcJ5FR1XGuYfCSi2vGYQxOJO0BQvdCndDZCrtLJAJkUdXc35JOh41plytgyK8gKOADzqfvpQsjviRLlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiwJUx/qOm2FYP/VDqVXS2cTZ+9lljYqMnM8zmCRyI9xTzDjUG
	M2h39BapHl8l8nRu3N6dHNn8E53RUdNfxVSGoelMyR9G+BaZ+INCMZXmKCXmA7fdeYzb+uE1GA8
	Yn59hDSWLng==
X-Received: from pfblb8.prod.google.com ([2002:a05:6a00:4f08:b0:845:4da8:56a5])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:23c3:b0:848:3f07:c5a2
 with SMTP id d2e1a72fcca58-851d38399c0mr327599b3a.4.1787095050148; Tue, 18
 Aug 2026 16:17:30 -0700 (PDT)
Date: Tue, 18 Aug 2026 23:16:33 +0000
In-Reply-To: <20260818231646.804507-1-wfelipe@google.com>
Mime-Version: 1.0
References: <20260818231646.804507-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260818231646.804507-3-wfelipe@google.com>
Subject: [PATCH v2 2/2] init/Kconfig: make config INIT_ENV_ARG_LIMIT user-configurable
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_161732_170853_BABEBB72 
X-CRM114-Status: GOOD (  12.56  )
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

SU5JVF9FTlZfQVJHX0xJTUlUIGlzIGRlZmluZWQgd2l0aG91dCBhIHByb21wdCBzdHJpbmcgKGBp
bnRgKSwgbWFraW5nIGl0CmEgaGlkZGVuIEtjb25maWcgc3ltYm9sIHRoYXQgZGVmYXVsdHMgdG8g
MzIgKG9yIDEyOCBmb3IgVU1MKSBhbmQgY2Fubm90CmJlIGNvbmZpZ3VyZWQgaW4gYG1ha2UgbWVu
dWNvbmZpZ2AuCgpOb3cgdGhhdCBDT05GSUdfQ09NTUFORF9MSU5FX1NJWkUgaXMgY29uZmlndXJh
YmxlIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcywKdXNlcnMgd2hvIHNlbGVjdCBsYXJnZXIga2Vy
bmVsIGNvbW1hbmQgbGluZXMgKGUuZy4sIDQwOTYgYnl0ZXMpIG1heSBwYXNzCm1vcmUgdGhhbiAz
MiBjb21tYW5kLWxpbmUgYXJndW1lbnRzIG9yIGVudmlyb25tZW50IHZhcmlhYmxlcyAoYGZvbz1i
YXJgKSB0bwpgL3NiaW4vaW5pdGAuIElmIElOSVRfRU5WX0FSR19MSU1JVCByZW1haW5zIGhhcmRj
b2RlZCBhdCAzMiwgYW55IGFyZ3VtZW50CmFmdGVyIHRoZSAzMm5kIHNldHMgdGhlIHBhbmljX2xh
dGVyIGZsYWcgYW5kIGNhdXNlcyBhIGhhcmQga2VybmVsIHBhbmljCm9uIGJvb3QuCgpBZGQgYSBw
cm9tcHQgc3RyaW5nICgiTWF4aW11bSBudW1iZXIgb2Yga2VybmVsIGNvbW1hbmQgbGluZSBhcmd1
bWVudHMiKSBhbmQKYSBgcmFuZ2UgMzIgNDA5NmAgdG8gYGNvbmZpZyBJTklUX0VOVl9BUkdfTElN
SVRgIHNvIHRoYXQgdXNlcnMgY2FuCmNvbmZpZ3VyZSB0aGVpciBpbml0IGFyZ3VtZW50IGFuZCBl
bnZpcm9ubWVudCB2YXJpYWJsZSBsaW1pdCB3aGVuIG5lZWRlZCwKd2hpbGUgcHJlc2VydmluZyB0
aGUgZXhpc3RpbmcgZGVmYXVsdCBvZiAzMiBmb3Igc3RhbmRhcmQgYnVpbGRzLgoKU2lnbmVkLW9m
Zi1ieTogTWFjaWVqIMW7ZW5jenlrb3dza2kgPG1hemVAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1i
eTogV2lsc29uIEZlbGlwZSBQZXJlaXJhIDx3ZmVsaXBlQGdvb2dsZS5jb20+Ci0tLQogaW5pdC9L
Y29uZmlnIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9pbml0L0tjb25maWcgYi9pbml0L0tjb25maWcKaW5kZXggZDAz
ZDQyZWNiMGU5Li5iZGQ2NmRjN2Y2MjggMTAwNjQ0Ci0tLSBhL2luaXQvS2NvbmZpZworKysgYi9p
bml0L0tjb25maWcKQEAgLTIzMSw5ICsyMzEsMTAgQEAgY29uZmlnIEJST0tFTl9PTl9TTVAKIAlk
ZWZhdWx0IHkKIAogY29uZmlnIElOSVRfRU5WX0FSR19MSU1JVAotCWludAorCWludCAiTWF4aW11
bSBudW1iZXIgb2Yga2VybmVsIGNvbW1hbmQgbGluZSBhcmd1bWVudHMiCiAJZGVmYXVsdCAzMiBp
ZiAhVU1MCiAJZGVmYXVsdCAxMjggaWYgVU1MCisJcmFuZ2UgMzIgNDA5NgogCWhlbHAKIAkgIE1h
eGltdW0gb2YgZWFjaCBvZiB0aGUgbnVtYmVyIG9mIGFyZ3VtZW50cyBhbmQgZW52aXJvbm1lbnQK
IAkgIHZhcmlhYmxlcyBwYXNzZWQgdG8gaW5pdCBmcm9tIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5l
LgotLSAKMi41NS4wLjczNy5nMDg4NjZhNmQxMy1nb29nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
