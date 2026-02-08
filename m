Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F119EF06E2
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 05:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFohkilic67s6HD5nYmashZ09sUu9mz2yHkX9vKrOQ8=; b=InHs1i1bb9rcfW
	a29SgYNcbElegil+sKYEwN3XfC+vaXoJJ0vnB9twUxhiZ06GLowGQYK/R1elE6+YSIjf/h5bgZqKZ
	p7UV3jV0GgFINr9hvU+9EKI19RKkfcUG1luoAb1W/6HBdMUXMdaPqB7WtCa3AmKQjDHtvMWe5u6I0
	bjWYlVa8x3PL2nH4yYujAiyAGTjRSA6yAb5DanS+d2DIJn//MfAUQdJK/62D8jjLB8TPedH3cTUvB
	L4eSmhxWk4c+sBXLXnLdnO7lg5HHtQ7xetK1prnVRXjcfwmhsqLhQbexUm+T1VG1ZyKoPSHuA7WvD
	TMJ5msa2805S3uxwWVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQX-0000000D2zs-0q4U;
	Sun, 08 Feb 2026 05:33:45 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQR-0000000D2zI-33e2
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 05:33:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-81f47610542so2292438b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 21:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770528819; x=1771133619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5ZW0Lp2uS+rJ6cqos6DM9CIgCyO+gQDhoGFyA1Jyks=;
        b=BxmYiHJRpiK9ou3IPZm9+LAKem8T2vvWOilJL90GyBACpRySyUvU2LJod8fXdv8lYZ
         rezEMyYtwAJtd16zpC/DvSFCyEdHlWCRuHxPqzuUpkcl5tP6/R4WcEe6wncjNazM0WAo
         NHoIVi6W35hVauHvIqy6+zEYP8CMpwHotp9JxfU094Rg4DxkVD7CO32GJulpiY0HtcN2
         tYNwvpA76G/grjOQaboD/gIEQ6a9oag8epcuFUELMbQfdi7YkJ/4x9VUkrkecA66pjTG
         v1jwbeGtQT6m77TeG4y9oUP+Y4p90KpupGkyQI9UiPaK2NXAXVOOL3kbsXBG3nfYsUgu
         ul/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770528819; x=1771133619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5ZW0Lp2uS+rJ6cqos6DM9CIgCyO+gQDhoGFyA1Jyks=;
        b=t4Ou8sEmxfPNaLWhNUEwp9TFGJv9tDDt4CqxBki9fd/tLC9lmYNI6WUEU5pGRv5zh1
         vkoFMHi+tUXghyUNzdNROGeNaK33vXEEMQThFKgMZTf0cEfdjuuT5I3uw5bkwRxmWkra
         T5JvMTTCW8XOdtVZC4uMHo9fdGYLohmMpOG6baoisTYKch8vddIJTXuV4jEuQIvqDZwW
         ZUdgK1p/5NWHqGD1KbMcR0XUI+duwUPWZtabfHVPa4Mt8ZhAhoMDYIAQj2pIiSgz/38x
         wKJ4bDBpUffDiBfV31G2uSHDkBFZyjTLa8ebcva2YoFuBSG5MF1MUPlGkCLgNruPur5W
         4nMA==
X-Forwarded-Encrypted: i=1; AJvYcCXCppn6247tke6IQfWBR0JFEjPBLirkej42H5kEmLT0v5FKWikrA7cBTixn0E03lzmgjWs+uHfHjAq8iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXjOZVPSxNaGnP+99aYKJ0yXvXMOhzD1WNyCxZDtgmb55WtcqA
	LM9OPMqQsYMvWg1lfu3V6bwNhqNci9Y/FPZRR6RxvrKkIJ5O/TZeFXn6
X-Gm-Gg: AZuq6aJnPTaw9J1OpyIecehiMmpWQTfWFFlcFp0wDiRrocJoakucQ9fAdBImb8pwRa/
	XXjkQaEKico02DRZBOYmtK7kuMK7bmLjQ2CQd3m3A7Zi8dcROnZEBoL/N6KnH/sUTQAyvd5GjZ5
	TKLqrOycfeAzc87CcmGK8mSyYGsPdQBOoDDn0bOVXHvRJVyojPDWbbj7S5M6vSdTzSByCJytYcP
	m/znw12SRkLLxRjoIexncDFIfDgyYH1HFHiyV9EMsrChn2dCJzXR5BMa68vpT+KZ0w9PHWQyWqR
	w7yqWFPPQ4Pej9OyRjSP6O9W3Ipgw27pMmToUyxtR2VQrE7W7kvYWOovAlvR1iUea34X8RCYVDn
	EYMVs8T3O1XtPlaT1OHIHkeLq8+AgLJmCM60+vyxqN5peYUGmOdM++RXwmIE9de6RcKJf3S0oVG
	xsQJlUNHtL
X-Received: by 2002:a05:6a00:bb88:b0:81f:8084:7ea0 with SMTP id d2e1a72fcca58-824416005d3mr7456957b3a.7.1770528818761;
        Sat, 07 Feb 2026 21:33:38 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418de80dsm6067700b3a.62.2026.02.07.21.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 21:33:38 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org,
	bjorn@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jiang.biao@linux.dev
Subject: [PATCH bpf-next v4 1/3] bpf, riscv: introduce emit_store_stack_imm64() for trampoline
Date: Sun,  8 Feb 2026 13:33:09 +0800
Message-ID: <20260208053311.698352-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208053311.698352-1-dongml2@chinatelecom.cn>
References: <20260208053311.698352-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_213339_824016_9D1FFF6F 
X-CRM114-Status: GOOD (  12.03  )
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

SW50cm9kdWNlIGEgaGVscGVyIHRvIHN0b3JlIDY0LWJpdCBpbW1lZGlhdGUgb24gdGhlIHRyYW1w
b2xpbmUgc3RhY2sgd2l0aAphIGhlbHAgb2YgYSByZWdpc3Rlci4KClNpZ25lZC1vZmYtYnk6IE1l
bmdsb25nIERvbmcgPGRvbmdtbDJAY2hpbmF0ZWxlY29tLmNuPgpUZXN0ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyNSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggMzc4ODhhYmVlNzBj
Li5lNGY0NWUyZTdlMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtOTI2LDYgKzkyNiwx
NCBAQCBzdGF0aWMgdm9pZCByZXN0b3JlX3N0YWNrX2FyZ3MoaW50IG5yX3N0YWNrX2FyZ3MsIGlu
dCBhcmdzX29mZiwgaW50IHN0a19hcmdfb2ZmLAogCX0KIH0KIAorc3RhdGljIHZvaWQgZW1pdF9z
dG9yZV9zdGFja19pbW02NCh1OCByZWcsIGludCBzdGFja19vZmYsIHU2NCBpbW02NCwKKwkJCQkg
ICBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3sKKwkvKiBMb2FkIGltbTY0IGludG8gcmVn
IGFuZCBzdG9yZSBpdCBhdCBbRlAgKyBzdGFja19vZmZdLiAqLworCWVtaXRfaW1tKHJlZywgKHM2
NClpbW02NCwgY3R4KTsKKwllbWl0X3NkKFJWX1JFR19GUCwgc3RhY2tfb2ZmLCByZWcsIGN0eCk7
Cit9CisKIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9wcm9nKHN0cnVjdCBicGZfdHJhbXBfbGluayAq
bCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29mZiwKIAkJCSAgIGludCBydW5fY3R4X29mZiwg
Ym9vbCBzYXZlX3JldCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiB7CkBAIC05MzMsMTIg
Kzk0MSwxMCBAQCBzdGF0aWMgaW50IGludm9rZV9icGZfcHJvZyhzdHJ1Y3QgYnBmX3RyYW1wX2xp
bmsgKmwsIGludCBhcmdzX29mZiwgaW50IHJldHZhbF9vZgogCXN0cnVjdCBicGZfcHJvZyAqcCA9
IGwtPmxpbmsucHJvZzsKIAlpbnQgY29va2llX29mZiA9IG9mZnNldG9mKHN0cnVjdCBicGZfdHJh
bXBfcnVuX2N0eCwgYnBmX2Nvb2tpZSk7CiAKLQlpZiAobC0+Y29va2llKSB7Ci0JCWVtaXRfaW1t
KFJWX1JFR19UMSwgbC0+Y29va2llLCBjdHgpOwotCQllbWl0X3NkKFJWX1JFR19GUCwgLXJ1bl9j
dHhfb2ZmICsgY29va2llX29mZiwgUlZfUkVHX1QxLCBjdHgpOwotCX0gZWxzZSB7CisJaWYgKGwt
PmNvb2tpZSkKKwkJZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1ydW5fY3R4X29m
ZiArIGNvb2tpZV9vZmYsIGwtPmNvb2tpZSwgY3R4KTsKKwllbHNlCiAJCWVtaXRfc2QoUlZfUkVH
X0ZQLCAtcnVuX2N0eF9vZmYgKyBjb29raWVfb2ZmLCBSVl9SRUdfWkVSTywgY3R4KTsKLQl9CiAK
IAkvKiBhcmcxOiBwcm9nICovCiAJZW1pdF9pbW0oUlZfUkVHX0EwLCAoY29uc3QgczY0KXAsIGN0
eCk7CkBAIC0xMTIzLDEzICsxMTI5LDEwIEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBm
X3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJZW1pdF9zZChSVl9SRUdf
RlAsIC1zcmVnX29mZiwgUlZfUkVHX1MxLCBjdHgpOwogCiAJLyogc3RvcmUgaXAgYWRkcmVzcyBv
ZiB0aGUgdHJhY2VkIGZ1bmN0aW9uICovCi0JaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfSVBfQVJH
KSB7Ci0JCWVtaXRfaW1tKFJWX1JFR19UMSwgKGNvbnN0IHM2NClmdW5jX2FkZHIsIGN0eCk7Ci0J
CWVtaXRfc2QoUlZfUkVHX0ZQLCAtaXBfb2ZmLCBSVl9SRUdfVDEsIGN0eCk7Ci0JfQorCWlmIChm
bGFncyAmIEJQRl9UUkFNUF9GX0lQX0FSRykKKwkJZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9S
RUdfVDEsIC1pcF9vZmYsICh1NjQpZnVuY19hZGRyLCBjdHgpOwogCi0JZW1pdF9saShSVl9SRUdf
VDEsIG5yX2FyZ19zbG90cywgY3R4KTsKLQllbWl0X3NkKFJWX1JFR19GUCwgLW5yZWdzX29mZiwg
UlZfUkVHX1QxLCBjdHgpOworCWVtaXRfc3RvcmVfc3RhY2tfaW1tNjQoUlZfUkVHX1QxLCAtbnJl
Z3Nfb2ZmLCBucl9hcmdfc2xvdHMsIGN0eCk7CiAKIAlzdG9yZV9hcmdzKG5yX2FyZ19zbG90cywg
YXJnc19vZmYsIGN0eCk7CiAKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
