Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CE6CD6E64
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH9LuVeWTEVXEO6EGgEydPyU57E/bM+L9WrOXjBQ/yo=; b=N3I3Q/Jm3DfAe5
	IPZAr2XoZfjHnMzt7GVDVPIu816Q5RYayYH5wlEHAZde3zh8WsFfGDpZ7vQ+RC+F8OCZdvF/rRhtr
	yiD8sDoi1FQ7TI5Bz8wD0XudtgAU5GZn9ohTxykCcB6VlS8BOiA/uKn24kioOhxqJa7ZXLeyamZDV
	KlahXCCZoG3VY/+aDjIX6Pda2ia8R4FZLn3SuQgzsTAJX6pni+bDXvH0EFp3XQ42pg3947qOQruyZ
	PZTMSxcni58SOj1nZih0EFjl9wDsTzUR7ayQUObaBY9py9K97BXN2JGLl5LEGRwN6gcaIf+GYD6tw
	2+Kq6Go86B5oqz3Xgwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYMF-00FqpN-0O;
	Wed, 11 Oct 2023 12:30:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFR-00FjNI-04
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Oct 2023 11:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uPwBFtd40HLyGqXLen0KbaY9uN71oHhwHjqBqDa/Amo=; b=XU6Q5HswEJSPhHqcXBpxtiow5s
	89LDS1b55TUbi6q2Wl/l+MsrX+XcNgf1uWM5BXqEzWwgCNuccTr0u7i2fQerG+oCAoLRvAAUNGtSu
	2te0uY2XLzbLU0fbSftKXbKYwwIQNLi+EWccJqunHvrVVog8Re1enPqjzpEriteIUGE/h5CLhBPJ3
	Suh9i8jUC86BgdM8iXEuFC9Mf+PlX/Gla0HhEAudOcbte5e52PVBY+nWd5AiLDtqWfPmcVMLEC/Ea
	472ActV3H6ppIv+oyRNf+8BQrXBAubwhdpsEC3CVmAf3fvPulB0loZ/a1ALPFoPdkjeiuiuQm8Eg7
	zQzIrc3g==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFL-000A20-29
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40651b22977so11504915e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023162; x=1697627962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPwBFtd40HLyGqXLen0KbaY9uN71oHhwHjqBqDa/Amo=;
        b=WZrbb0JVu1uvOW734fJqOQyLWwdT4PHIGVfZ36K0KpssrAZIMKv00u8NlV4ELEP7EU
         Lrn1XIe3UXcwJJwrkVHmt+VtqK8MnxwNF8W2yRhE2FlSnwuIEerqnwKC3WFeoGkD+0IG
         xThQUKJRU55k7HR3H5l3ysBGA7Awn5ISSjkCMT2gxjmCiE3AOcm37K6GnmuQ/8QEJdJG
         wzkmDuy4iTfp479/+ZFXRLMnSodAbug3x9PRZPZvfb7Ee+e9JrKf2Cx9SrFpm1MspR4D
         naSbQcOA5wRs0d5wqHuLyw8SudIK0mc3NJiJnQsMefXRRdNpYVmlxFvLnOw/BWFNDuxa
         +QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023162; x=1697627962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPwBFtd40HLyGqXLen0KbaY9uN71oHhwHjqBqDa/Amo=;
        b=uqlK0LhTBAgzRWQEnbcgWaq+8+FmNOhJsi4A9JOrd7VbRFUIuKkO3e8ayrGaHv9SXY
         6aHj9nGFAYPQOfGIhHY42GYwhr9vC3//NNGRtHsbYO5lnQSWunyQOcbBR75B8unWvzUW
         PCqv9Ziq8kbY7POQlVb8nwa4nuFFKXhR8KKJ/lBUVPAhmEnyXSq0gf2yaI3PZ8U43iqT
         PIBpSE92kved+WAszoSxNw03MKwhBab6t5tof2c1nO2Vr7g//9wcWthVz/1iRTkbKcxu
         p8tAaKaVLXf6LkcCQnxz2pxtle1VHb7rqrmH294KQVyK0hOO92fGd0XOp06OKslBlTjp
         mj9Q==
X-Gm-Message-State: AOJu0YyRRvs/2NTy07+SQCWArb+vuzH+WsT0NBCgwPqX5iT0JI+BGn6p
	PjuQ6ARdWWBdB6glPN2Nkh7Pu3qw9N9UAewoEnm9yw==
X-Google-Smtp-Source: AGHT+IExnIHp9l/UnaTbrZ3Z3/Wvq+vo4xX0Z23oITLpc5cVbubkCxO0IQd8/NJP5tC/mEAiM4RIRw==
X-Received: by 2002:a05:600c:1d18:b0:404:72f9:d59a with SMTP id l24-20020a05600c1d1800b0040472f9d59amr18737359wms.0.1697023161691;
        Wed, 11 Oct 2023 04:19:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 08/13] riscv: add ISA extension probing for Zihintntl
Date: Wed, 11 Oct 2023 13:14:33 +0200
Message-ID: <20231011111438.909552-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_121925_352978_7E358541 
X-CRM114-Status: UNSURE (   9.22  )
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

QWRkIHByb2JpbmcgZm9yIFppaGludG50bCBJU0EgZXh0ZW5zaW9uWzFdIHRoYXQgd2FzIHJhdGlm
aWVkIGluIGNvbW1pdAowZGM5MWY1ICgiWmloaW50bnRsIGlzIHJhdGlmaWVkIikgaW4gcmlzY3Yt
aXNhLW1hbnVhbFsyXS4KClsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzEzX3dz
TjhZbVJmSDhZV3lzRnlUWC1EalRrQ25CZDloai92aWV3ClsyXSBodHRwczovL2dpdGh1Yi5jb20v
cmlzY3YvcmlzY3YtaXNhLW1hbnVhbC9jb21taXQvMGRjOTFmNTA1ZTZkCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
fCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oCmluZGV4IDM1ZjAwNDAxYWZjOC4uMWYwOWI4YjNkYTJhIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oCkBAIC03Niw2ICs3Niw3IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLVAkJNTgKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkgJCTU5CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZITUlO
CQk2MAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTAkJNjEKIAogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX01BWAkJNjQKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDllZTc4MTQ2NDFh
NC4uMTM2ZTkwMjYzYmEyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0xNjksNiArMTY5LDcg
QEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEoemljbnRyLCBSSVNDVl9JU0FfRVhUX1pJQ05UUiksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoemljc3IsIFJJU0NWX0lTQV9FWFRfWklDU1IpLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHppZmVuY2VpLCBSSVNDVl9JU0FfRVhUX1pJRkVOQ0VJKSwKKwlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6aWhpbnRudGwsIFJJU0NWX0lTQV9FWFRfWklISU5UTlRMKSwKIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSks
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRfWklIUE0pLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAotLSAKMi40Mi4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
