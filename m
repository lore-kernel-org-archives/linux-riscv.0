Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469DDC9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIFuqExlC19Ml8YnMc0645feWvQbO8u0Te9M2gj9YlE=; b=DDJZ461m4O3Adl
	ihPkWk3xXmIxal+UQaobcBO/cltKwLtDv0S3FkNe/BAMPg6/tI4EHJvA6WXnvQ1uhF1ZLTIzzHzMj
	zJrYDZbLz0tMKNlf/I7uS2VVX3V+rNWV5RCHu/LkDua/OaE3kajeGKYs8vLGcunnx928c9ga7maVi
	G2fUe1F6gimia2jpaR4vPUwTZYCjK/++8t7dPrC8xhaHkPssiLhFoRurDkFYlFB1wZBxJW11tkEuc
	3AEPYapEJa5/6MM0SL+8KCIyO5izuPAk0nJsZDcS8pQBPjgL9n7eTM61HubicrjkQhkD0osM4m7vB
	koV6RzoAwOmrkp9eaTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOZ-0000000GGmr-0yGr;
	Sun, 27 Sep 2026 11:50:15 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOI-0000000GGbh-3HN0
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 11:50:09 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so12055345e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Sep 2026 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509797; x=1791114597; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=JaVaVqwc4AoqcbQYiZZIcfHpudJclmX/SlA1xCauyCGaQhQq1O3tjdAPJHCNa7NWEj
         BDLthIdaPTTG0oA0Cc7VxaT2rxbz9ZcT+XTwMJ7M6UOgO88wzCoT20NmgaW08guOZjxL
         l20ztyQP50clJEnWYuaLeopdS3cPwefWeUz27nZLoORl5sEV7vIIY/BR0iQAx7ZWC+re
         4e6Kkol/fek6j9jaYFvoiLBCHFEZL0shmbVdID0HbOdgvrlXEEnw4sluZR9X9nb1cDE5
         eWfTUmWo9x0Ju+vOw3xpeAP3LR6D/3bdQas5dW+93+x/vwL0FxlSTt8Cl+VXyZ19Gj3B
         JZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509797; x=1791114597;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=xUmzqBedrHB4C0DAErZmmje5cefDE3vfd26rMe6SP2Y2tOngcHmO3ONpegTu1dnlP2
         niBAqoFvJa9vH7dVzjk7j/f0rz5PllLs7xRvM/jV8Crua8xXQicZm2PF9OoIkCv/uSpJ
         rZ9KPIkKcBRgFgXa1wpgdfY9jJHZkEvV5FHMWlECM7efhIeeTQzgS7UqGQqZUTApJbFb
         eWj+jwpZSpOFekNXgBdsrsI8bV+k6RYDkGsz8SYF9IRmpAQWa7D189epsBYmRAknxbTA
         V+UBJoa5aGelzLMdXG34F+2MLqfxnUiY+QvpD4eXBvJD+fl6QbDicN65EOqEUPaKeo9B
         XEqg==
X-Forwarded-Encrypted: i=1; AKwUvBwiDrATfjjHYYRxJVUenNkzyybQK14yI/Wb11HMzRu1Q2EoStbrzNKJ2KoQTPmfAXXnlNDDf2cP2mxqdg==@lists.infradead.org
X-Gm-Message-State: AFuF++m8DC49jofiDi65CW5DBF1Ake789g+QAPDtu2+rUgtLZaOJV/Qj
	AyrnhWMmzdqEgj3V2xQSLlVuRa910MN1Aawd9W3MIXhwxzhhAgIcnNt+yM9/irMKs6Qn
X-Gm-Gg: AYBFou2ypaubVZLsw0FT/kPtZFKg1NTYcX/1HxN9t1+fTJNG5UCZif4b7oKRYjhyWY+
	68pFZ4OlqT4yMdyDmaSawfOF8RsomRn5A/nKQfmsPXNwAbhUmckTqFAJcFp9fMmoMTvEaGwVlG2
	yMy+dzanMP8Lm5rsh77/Dqzq2R0bM2QcryfS7bxXCLxk+q7AIveGWJ/ZPQoPaT/WSWnTudZukeC
	8Ip1V9u4cRIGO2bL1AV4Tg7wQUhoRLdOUOYJ7fE4MuHhaP3UNQU/kZMQ7Vt1jwSEIhbNCrblq0l
	aoXv5QGP/8JMRQoygN+vqPhrSfByZ6B1sJqqH3KWK4PON/Udr1Vw2eCPqLhhjrFYYXEnWG/RS6P
	hS2N1Z+0UjwmxHaYveMED2jGTald1PHFSSWrO8HScQyCwZXoqZOwCV0eCUrNYRQBqPJsG1IdwJN
	/tIdCLXRCO3SfYVu7Bv7BVqisskpaP35JTODGRYrK32yrF9u8ouqtiKAtry1LFWK1jOeGWL3TEd
	EOxk2PV8T8OW8Xeq3E=
X-Received: by 2002:a05:600c:620f:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-49ffe395d5cmr47873615e9.12.1790509797287;
        Sun, 27 Sep 2026 04:49:57 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:56 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sun, 27 Sep 2026 12:49:24 +0100
Message-ID: <f8be09ac54f1e0e8a46f077ebadef13301f3d054.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044958_845971_7F50F992 
X-CRM114-Status: UNSURE (   9.38  )
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

QWRkIGEgTUFJTlRBSU5FUlMgZW50cnkgY292ZXJpbmcgdGhlIEJhbyBoeXBlcnZpc29yIGRyaXZl
cnMgYW5kIHRoZWlyClVBUEkgaGVhZGVyLgoKU2lnbmVkLW9mZi1ieTogSm/Do28gUGVpeG90byA8
anBlaXhvdG9Ab3N5eC50ZWNoPgotLS0KdjQ6Ci0gRHJvcCB0aGUgYXJjaC8qL2luY2x1ZGUvYXNt
L2Jhby5oIGFuZCBpbmNsdWRlL2xpbnV4L2Jhby5oIGVudHJpZXMgKHRoZQogIGZpbGVzIGFyZSBn
b25lKTsgdXNlIHRoZSBkaXJlY3RvcnkgZm9ybSBmb3IgZHJpdmVycy92aXJ0L2Jhby8uCgogTUFJ
TlRBSU5FUlMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAzYTE5ZGE3NGQwMGMu
LmZjMzdhMWRiMWFhYiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMK
QEAgLTQ1NTksNiArNDU1OSwxNCBAQCBGOglkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC8KIEY6CWlu
Y2x1ZGUvbGludXgvYmFja2xpZ2h0LmgKIEY6CWluY2x1ZGUvbGludXgvcHdtX2JhY2tsaWdodC5o
CiAKK0JBTyBIWVBFUlZJU09SCitNOglKb3PDqSBNYXJ0aW5zIDxqb3NlQG9zeXgudGVjaD4KK006
CURhdmlkIENlcmRlaXJhIDxkYXZpZG1jZXJkZWlyYUBvc3l4LnRlY2g+CitNOglKb8OjbyBQZWl4
b3RvIDxqcGVpeG90b0Bvc3l4LnRlY2g+CitTOglNYWludGFpbmVkCitGOglkcml2ZXJzL3ZpcnQv
YmFvLworRjoJaW5jbHVkZS91YXBpL2xpbnV4L2Jhby5oCisKIEJBUkNPIFA1MCBHUElPIERSSVZF
UgogTToJU2FudG9zaCBLdW1hciBZYWRhdiA8c2FudG9zaGt1bWFyLnlhZGF2QGJhcmNvLmNvbT4K
IE06CVBldGVyIEtvcnNnYWFyZCA8cGV0ZXIua29yc2dhYXJkQGJhcmNvLmNvbT4KLS0gCjIuNDMu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
