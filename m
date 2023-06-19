Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CFCEB64DA
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YGv70wLB1spH3qXIvVbTRpnjkEHtx21oDRBeig0d+iQ=; b=OWX4H1s4mh3dhq
	DgWiqjTqoIjMWdRetT5Or7cKBeCKBcjrS1gAJoRyJW39kXqLCw3UM86AuQWQTpaNuGh4PoEGAeOgk
	GUxW5FPf/x53gJFKXGfVVcqLRivgHIX//OHou93aaZwlDRK3S2EgzIJQd+CfgkRe8TtEOQ3jhwOQ/
	1dvOeOr0w4yP3S6o4IfeRrgL98JKZEz0eQiQBOWqryX2WRUD9C/Fo4r1yR1NgzwClEc1x+JB4gB6K
	mhj6jLhS9Uv5RjRHbRO5Q/wR4puDMqt70RhdWbL6bRS6eF1XQzT8bhYTwLvCgR1b1NQlvmEjmbDER
	vZcMAFcD1yIWX9/RTj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgK-009ohh-1T;
	Tue, 20 Jun 2023 00:57:16 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgH-009ogx-21
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:15 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1a28de15c8aso4200261fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222632; x=1689814632;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=QThS6xqALgxYUk/2aegV4R6B6LP64NAwfaxJsiltL6s=;
        b=w5Njsp1KNufF4HamhI161OsHa93XjIcrw9mM4nUdvk1aw9FRSK9rRAGt+B1Sutrqpp
         YByTgtPxQ2LCav3eUd9/Ft/reEWpVsjuZ66HlqeTePsgFiqSBSJRAng3WZqkeE5PhbzS
         nhGYZdFpa7NhTdclsV7lPEvUAh/m0ixZSds7wZAAuD6uMVpsoQ1tkNEBH8Nl1Jm56fYV
         npC1fpBxpZHynXowvEMoVA7q8tdDhfTFJEwu8FZ1mW1COUkt9TgR20dn6klU77Gc5W9G
         zpYXfHQEJu9evLY5CwYm/PDkqQGflBDGtQxwwSdwTOhYN8NzFcenotky4hU19vo7Pq7Y
         kGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222632; x=1689814632;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QThS6xqALgxYUk/2aegV4R6B6LP64NAwfaxJsiltL6s=;
        b=S526C9oUDoaMPnaOqL0Xi9eHMYTSSSku2p+Cex3aqNVqWi1aFEp4AZaQxWwWncAwEG
         yRy2MFsiGat04bNmgu0LHjzCWxMSkGDMBnaOOOp46dD5RSWh6Wq7eJd6lN5sZK0nCxCd
         /mZEC0hEPMlIv/wh0PWrhLej9nemN9XS0S85NeR8eKBFIn/UqDONtwEM/9helrYw6pr8
         UbpYPUWJ2xwPURBLGX/LSF7Gd4+pKOg046NLc5d6OSHBBooYGbBzNmH8+Eteei0WqMfw
         A/LCOMqFSyrinH1EEL6vub/P2RFLxejKVN3HjxEKMEhix4vdmbBd6uTthcwtzw5IXnlO
         hr6g==
X-Gm-Message-State: AC+VfDw7tLUuH/7VSdMqMUdr9JjaOjyJnhbZP5NzhOMW6M42U+oVUKE9
	ONh46jZn8NAAOwOsfUti5Sc5qVlT5HHIBkqTVlY=
X-Google-Smtp-Source: ACHHUZ7RCyRF0xqR4ks4y/CUMmQORTCC4AI009wBEyMxXvrTAqDMI8l07ZlkpJyIR4Gx7o8lJMuokg==
X-Received: by 2002:a05:6870:9d9c:b0:1a6:614c:aa00 with SMTP id pv28-20020a0568709d9c00b001a6614caa00mr8366459oab.47.1687222632478;
        Mon, 19 Jun 2023 17:57:12 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y128-20020a636486000000b0051b9e82d6d6sm258681pgb.40.2023.06.19.17.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:12 -0700 (PDT)
Subject: [PATCH] RISC-V: Fix up some vector state related build failures
Date: Mon, 19 Jun 2023 10:21:01 -0700
Message-Id: <20230619172101.18692-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175713_903034_83EF63ED 
X-CRM114-Status: GOOD (  10.18  )
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

SSBnZXQgYSBmZXcgYnVpbGQgZmFpbHVyZXMgYWxvbmcgdGhlIGxpbmVzIG9mCgouL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0Lmg6MTk6MzY6IGVycm9yOiBmaWVsZCDigJh2
X3N0YXRl4oCZIGhhcyBpbmNvbXBsZXRlIHR5cGUKICAgMTkgfCAgICAgICAgIHN0cnVjdCBfX3Jp
c2N2X3ZfZXh0X3N0YXRlIHZfc3RhdGU7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+Ci4vYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3NpZ2NvbnRl
eHQuaDozMjo0OTogZXJyb3I6IGZpZWxkIOKAmHNjX2V4dGRlc2PigJkgaGFzIGluY29tcGxldGUg
dHlwZQogICAzMiB8ICAgICAgICAgICAgICAgICBzdHJ1Y3QgX19yaXNjdl9leHRyYV9leHRfaGVh
ZGVyIHNjX2V4dGRlc2M7CgpUaGUgViBzdHJ1Y3R1cmVzIGluIHF1ZXN0aW9uIGFyZSBkZWZpbmVk
IGZvciAhYXNzZW1ibHksIHNvIGxldCdzIGp1c3QgZG8Kc28gZm9yIHRoZSBvdGhlcnMuCgpGaXhl
czogOGVlMGI0MTg5OGZhICgicmlzY3Y6IHNpZ25hbDogQWRkIHNpZ2NvbnRleHQgc2F2ZS9yZXN0
b3JlIGZvciB2ZWN0b3IiKQpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2lnY29udGV4dC5o
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3NpZ2NvbnRleHQuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmgKaW5kZXggOGI4YTg1NDE2NzNhLi44Yzg3MTJhYTk1
NTEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3NpZ2NvbnRleHQuaApAQCAtMTUsNiAr
MTUsOCBAQAogLyogVGhlIHNpemUgb2YgRU5EIHNpZ25hbCBjb250ZXh0IGhlYWRlci4gKi8KICNk
ZWZpbmUgRU5EX0hEUl9TSVpFCTB4MAogCisjaWZuZGVmIF9fQVNTRU1CTFlfXworCiBzdHJ1Y3Qg
X19zY19yaXNjdl92X3N0YXRlIHsKIAlzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSB2X3N0YXRl
OwogfSBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDE2KSkpOwpAQCAtMzMsNCArMzUsNiBAQCBzdHJ1
Y3Qgc2lnY29udGV4dCB7CiAJfTsKIH07CiAKKyNlbmRpZiAvKiFfX0FTU0VNQkxZX18qLworCiAj
ZW5kaWYgLyogX1VBUElfQVNNX1JJU0NWX1NJR0NPTlRFWFRfSCAqLwotLSAKMi40MC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
