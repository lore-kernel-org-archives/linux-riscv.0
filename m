Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E4AC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pbF8xDeI0j02IPZJKpCKn/BvygdeZnqcrDfJnS9F5U=; b=xJBUlnEThzQhCH
	+tgPFhkwHkjfhN4mKuCxTYb4xQgp8c9LzvXLjdtMU57BLq95bK+VnRpiJbaJjN5fQPxFZbvAcaD9m
	oD/T2FMj9GgWOwtpW8bmDVkTPm3ao6xvmjnwG4njBy6os/JK3/0teJ9lzpqwId6ekruhnb4R2YqJh
	tFAbMmpqJUJaDT+fY/ADidm3uaw7hYWwEg4UPlIGKJHNDKgk1UGLJMgD31sbukn4YbV7qZ4s2L/QX
	PCdLWtFefVILThER1bjXT0yVRLw2QKZ0dHkX9ejtgPoznS6bLO8Je8WhoNULoofXgYuM9XuMcilss
	pwYK2Fj1Iemq5m5w5h5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64q-00000006DN3-3h2Q;
	Tue, 24 Jun 2025 16:00:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4hK-00000005vKR-0qb6
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:32:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso46534495e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775549; x=1751380349; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFxv+CSVT1JduUoBwXVfn9STkVHcaXwFmqXMPaWFmWg=;
        b=LrqzNeDGBPyMO/8By9EimmliTx+cspW6Y/4EU/7ln9wgf6+kPxFFhStJQt1X1aantW
         5ujaX9Fx6i4EHwoScjiX9bmaIYiJWcnIf5CfAH0dh4gxdod/LHBVXhflJunebme8rwkM
         qnN2HhBvZWAItOreAKQl7TewKg4r+ayQiiFMF09E2QkqJ2L8w+mldlwrTtVZ71vAhPaa
         yrhOWymXeESdnFDEeiHJzg7m2izoQ1b+z2GAxgMlY22nX+kfvq5Xn/9oMIyj7ScXDstb
         D+ie06l3Eegkwsbwu7/v+wxmgntEdJG8/DZ2UXwahtxuz8EPoCk7HO46Ku0P6lbUXrLm
         xonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775549; x=1751380349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFxv+CSVT1JduUoBwXVfn9STkVHcaXwFmqXMPaWFmWg=;
        b=Ssw/NIB1mJIcfn25UMnm64gqS+vZKDQ/SIKurJMZNkuVfQ054d7GxPD7Ds5RfvTsF/
         QV65fBwp2J0xAs/pkvKRkggKclIo09KOJJzFEg2R8hwGAlST5hYLjQZI11ccIy9DfNnQ
         uwDNSObezJSTcAG94DspL2Ra3ZZVQ5kPMKKdKbO6dTJgCv1/cpAwSVJ1VhEJrgA1ZDuP
         id/CGrMMYbovzfZpseUey8hWuEqboNowbpM7NQIhHfXC+urAhA+lsyt6u6KvtgSTf8u9
         oGAAxh0nE9vF/77Slp60DElmP/C9EiyKa1i4UE7i96JfhAugaD8u6mqg/jOHXS2iVql2
         e5Jg==
X-Gm-Message-State: AOJu0YzgIc2itUWeEwl0tIOEYm4TxzrO8u/2vmdgyhLxJ30jO8LKVJST
	RDIlzBuVSR9Wmf1roFCO8rCEvI8vL7K9T15MFIDTxI8kmCWNcqOQPQsHafwvOP0OMRc=
X-Gm-Gg: ASbGnctRlHTv6Qpo+I3UcUixWiCL/FWGJ1IcLYLzPWH8mhB2quQrkC2f7epcxjCYwvU
	8+KndFCmCW1tx59QlkX5uA9Z5dzI5ZpZtHOSSagCCWyh9c7rMh+HL3euxwcbOFh6Rw5o/TqU10r
	SdXJiW/Oy1SxfiKSvisXxnjC3uH2b5xgTh2HvmOi6RvkBJdncIVPE8eGiyRQjJ+8T1pICVmpGO6
	AqAGPd874BLlT9mp6I8/r4WDMdCg+CFOdw5DDKZ5/m0eMM0uwhPTGKXIkmClW0LhCLw4LdgqyZo
	XTkwqGLHJFsHaTnABTMC0sih+i7s0EifC5lgH+tghSeUvtKadZtoRaj8
X-Google-Smtp-Source: AGHT+IHD4d2ak9CVpp5Gb3Vl//bTvUG78qxypokPSA3JfLjuNCjdx/+p/2yyT5p37+Ky+IXsejzn0Q==
X-Received: by 2002:a05:600c:3489:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4537dfbbd31mr26524705e9.13.1750775548638;
        Tue, 24 Jun 2025 07:32:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:18 +0200
Subject: [PATCH 1/5] pwrseq: thead-gpu: add missing header
MIME-Version: 1.0
Message-Id: <20250624-pwrseq-match-defines-v1-1-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kuQ4uO8LOxmEAAqs0l/C6pNUD/i2/y1K+eYCkH9r2oE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb5hTVaHLse7YY4Z8fJIQZKJ3AQgAUmHNQv0
 VwZwM91+1SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+QAKCRARpy6gFHHX
 cujsEADPF8KCWrxiSt3p+cb4oVKfu3+XmlPa8P9/B3GoYcQRJeLWaTiMykmZYCWqLqquF996s5Z
 wmdFKfXPHda6dYr0UrL6AjoMDT3E2vi7vhx8XCENm0S3SU2IPnmUC6ZoSrRxq4j+pVYbchBLpi6
 usUAgi/RwAJ+oG36mYWYewQdGX7+2dpMjje5y1awCGwzcscsyg6IxSJDp0puslMfIYTfsh/cfRA
 fBJIzMW/dlVZW0QZVjXoZHWG6dlQbkAmUEiVURqPeKnia6SAvivPg8D+vyYv4etq5Clv18wCJRI
 lonF0OYTo0XxK3SAtUTgyuyYbiZr2uUAJDyOvzVgTjaJ+kbz2q7s+ykgusXxpBrhfsx0hxTOsh+
 Gznzh9pKDozRA9R8QOBdLmHbzqoVvWojoURYiul1T/q/06+CbC7rXfj8z6rH8kaRSBzPE37AIf6
 V8CKI/Uqz0B7JZCC1rtmFnWW7fFIkZGLD5DPG+rxIJ7y9IZnAtj3sk1vCRM1rHgnX4+1KajRx0H
 OXe6HlBsNJCmMzP446DYdvuj+DWhCghrCxIRQLl2EQm5vjiYzGhM27jt2ofnYPFw2G+hob+VbSa
 LmG1m17inHqLh1uVc/ypB5241VTSoK05UHHf8YR9GurlLl5qGyloHhTHqZdiO9zDc/llKFs77po
 z9GnVX4voR6m3Jw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_073230_244835_6A3EB511 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3Jn
PgoKV2hlbiB1c2luZyBrY2FsbG9jKCksIGtmcmVlKCkgZXRjLiwgd2UgbmVlZCB0byBpbmNsdWRl
IGxpbnV4L3NsYWIuaC4KV2hpbGUgb24gc29tZSBhcmNoaXRlY3R1cmVzIGl0IG1heSB3b3JrIGZp
bmUgYmVjYXVzZSB0aGUgaGVhZGVyIGlzCnB1bGxlZCBpbiBpbXBsaWNpdGx5LCBvbiBvdGhlcnMg
aXQgdHJpZ2dlcnMgdGhlIGZvbGxvd2luZyBlcnJvcnM6Cgpkcml2ZXJzL3Bvd2VyL3NlcXVlbmNp
bmcvcHdyc2VxLXRoZWFkLWdwdS5jOiBJbiBmdW5jdGlvbiDigJhwd3JzZXFfdGhlYWRfZ3B1X21h
dGNo4oCZOgpkcml2ZXJzL3Bvd2VyL3NlcXVlbmNpbmcvcHdyc2VxLXRoZWFkLWdwdS5jOjE0Nzoy
MTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGtjYWxsb2PigJkg
Wy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgMTQ3IHwgICAgICAgICBjdHgtPmNs
a3MgPSBrY2FsbG9jKGN0eC0+bnVtX2Nsa3MsIHNpemVvZigqY3R4LT5jbGtzKSwgR0ZQX0tFUk5F
TCk7CgpGaXhlczogZDRjMmQ5YjViN2NlICgicG93ZXI6IHNlcXVlbmNpbmc6IEFkZCBULUhFQUQg
VEgxNTIwIEdQVSBwb3dlciBzZXF1ZW5jZXIgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogQmFydG9z
eiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgotLS0KIGRyaXZl
cnMvcG93ZXIvc2VxdWVuY2luZy9wd3JzZXEtdGhlYWQtZ3B1LmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcG93ZXIvc2VxdWVuY2lu
Zy9wd3JzZXEtdGhlYWQtZ3B1LmMgYi9kcml2ZXJzL3Bvd2VyL3NlcXVlbmNpbmcvcHdyc2VxLXRo
ZWFkLWdwdS5jCmluZGV4IDNkZDI3YzMyMDIwYTZkM2I1NTFlZWFmZjI4NTk0NTZmZWQ2Nzk4MTQu
Ljg1NWM2Y2M0ZjNiNWJkMWFhNmU5MzMwNWFmMDQxN2Q1NzkxYjA5MmQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcG93ZXIvc2VxdWVuY2luZy9wd3JzZXEtdGhlYWQtZ3B1LmMKKysrIGIvZHJpdmVycy9w
b3dlci9zZXF1ZW5jaW5nL3B3cnNlcS10aGVhZC1ncHUuYwpAQCAtMjEsNiArMjEsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8bGludXgvcHdyc2VxL3Byb3ZpZGVyLmg+CiAj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAKICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9wb3dlci90aGVhZCx0aDE1MjAtcG93ZXIuaD4KIAoKLS0gCjIuNDgu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
