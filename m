Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6179C636F2
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5ET7cZUyAEsxstLC64IxCs/Q4XLcNWwmGf3dcIYF5Q=; b=03PrNeT2ariTbV
	RsGieEAAbDXxang9lPxo1bYiGzxhYmsm/wtOYpABELj+QdhcoLTTG+2rFOoAFWuE+ajRpEBS63ZP1
	+cP9oHv+MWfGCyLsWbTIbSrqVSL5B1JgLC9QTzXn3lde18XJREhLD7stN47/nyTeIDG58lvyRg7yh
	cyXDuqe/zOcLeT/tuA8pyOYynftstR7NTNWfdkXRr4IWoyD2hJNYyoMD93NBsf81QvpqB5wjKksa+
	vz812tcwq+HmF7S6zZVSGrYiGSxYYUCqKSw9RbXcs00yOIgq/fPQ2u68iDoAJ1oGaxaOqdZVtCTK4
	F0gcxL1oo6Z7Fv2aUiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuS-005YOI-2S;
	Thu, 23 Nov 2023 18:58:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuN-005YHt-0j
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 18:58:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991c786369cso166411166b.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 10:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700765915; x=1701370715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vE4taij5q3MAjmiPUZKHE8qoF6TdBc6iBW1aIWJ4LYw=;
        b=jA4ViEfSWgtAn2FIYVv1n6e4cs889aCaP7gFN99i5udio9tp0Ki+1crro9uzZOIbJP
         dDOEH3EkRVYY7ohGB0JwI+U5rFmivIkVZdrWaFrKol1bGxHP6pA2GZgw3eg/V58U/6Wy
         XTfvQU9PoLV93kW+MEUSUmDJc0lNN+LHnxahKzsfcOjK5qy9QhspO99Bp2SS/yoJh8oP
         B3AX5lrV+2QmY3DhZ1zeW/3E3Lw4lKt1E3ujBiyl4asvtezoT83umSV+b4KpsNv8iFSb
         Z4xMcQU6Eg9QI5lH64RpFqUkIFzX5oyjOjKHPuSAC7OyFMsTabMBjBycWiJr306iVC0W
         ntdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700765915; x=1701370715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE4taij5q3MAjmiPUZKHE8qoF6TdBc6iBW1aIWJ4LYw=;
        b=dydnu2rzFrMJquw92CL9qG8AT49ORZ8BNSknuzW7BZmSpE/3vkIW8SZPnOHfiUSlSl
         x2O02KYNksCmqaTVrNDbQWito3H81M9WrsW+tX8nIJugvRFBkQL5d/tVZqKdzzdroIM2
         xh858APU5gHCza4Z8bgkhwBFvIR58KDi0Iwf7rJjYkh+OptAWOchXC03bwHTR7Ui3eSa
         EdhEWHDdIzUKWYB8telCT4lOs5BZFA1B0AzGYQvFiNO61pZ+Xjgy4lnfWe9qcs8JAEy7
         8t14v3qFaUAdTpgboiOGHjFPTJs73eaOF9o8NFgj27W2C888F44Q36obcVTOZuzTYPfe
         t6Cg==
X-Gm-Message-State: AOJu0YxQxzoI9d2SP0XnWsbcHdAJznR9VbqHoyd6O3zHNBdZsjFObBks
	JQ7BKNnC33l3FmHIqNogdA2QiIToZPvW1tihD1dHvzhy
X-Google-Smtp-Source: AGHT+IGq6dOMJJMtU5Up+yGiMT76gDi7Z83Zw3jt75JpsMbNdpOYO4U2mN9YDUlYYRNjg8nPchbdWA==
X-Received: by 2002:a17:906:1ccd:b0:a00:a591:929 with SMTP id i13-20020a1709061ccd00b00a00a5910929mr195955ejh.24.1700765915300;
        Thu, 23 Nov 2023 10:58:35 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id l23-20020a170906231700b009ff1997ce86sm1115944eja.149.2023.11.23.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:58:34 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 5/5] tools: selftests: riscv: Fix compile warnings in mm tests
Date: Thu, 23 Nov 2023 19:58:21 +0100
Message-ID: <20231123185821.2272504-6-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_105839_262170_F4362260 
X-CRM114-Status: GOOD (  10.28  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpX
aGVuIGJ1aWxkaW5nIHRoZSBtbSB0ZXN0cyB3aXRoIGEgcmlzY3YzMiBjb21waWxlciwgd2Ugc2Vl
IGEgcmFuZ2UKb2Ygc2hpZnQtY291bnQtb3ZlcmZsb3cgZXJyb3JzIGZyb20gc2hpZnRpbmcgMVVM
IGJ5IG1vcmUgdGhhbiAzMiBiaXRzCmluIGRvX21tYXBzKCkuIFNpbmNlLCB0aGUgcmVsZXZhbnQg
Y29kZSBpcyBvbmx5IGNhbGxlZCBmcm9tIGNvZGUgdGhhdAppcyBnYXRlZCBieSBgX19yaXNjdl94
bGVuID09IDY0YCwgd2UgY2FuIGp1c3QgYXBwbHkgdGhlIHNhbWUgZ2F0aW5nCnRvIGRvX21tYXBz
KCkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5l
ckB2cnVsbC5ldT4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9tbS9tbWFwX3Rl
c3QuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvbW0vbW1hcF90ZXN0LmggYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9tbS9tbWFwX3Rlc3QuaAppbmRleCA5Yjg0MzRmNjJmNTcu
LjJlMGRiOWM1YmU2YyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
bW0vbW1hcF90ZXN0LmgKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvbW0vbW1h
cF90ZXN0LmgKQEAgLTE4LDYgKzE4LDggQEAgc3RydWN0IGFkZHJlc3NlcyB7CiAJaW50ICpvbl81
Nl9hZGRyOwogfTsKIAorLy8gT25seSB3b3JrcyBvbiA2NCBiaXQKKyNpZiBfX3Jpc2N2X3hsZW4g
PT0gNjQKIHN0YXRpYyBpbmxpbmUgdm9pZCBkb19tbWFwcyhzdHJ1Y3QgYWRkcmVzc2VzICptbWFw
X2FkZHJlc3NlcykKIHsKIAkvKgpAQCAtNTAsNiArNTIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
ZG9fbW1hcHMoc3RydWN0IGFkZHJlc3NlcyAqbW1hcF9hZGRyZXNzZXMpCiAJbW1hcF9hZGRyZXNz
ZXMtPm9uXzU2X2FkZHIgPQogCQltbWFwKG9uXzU2X2JpdHMsIDUgKiBzaXplb2YoaW50KSwgcHJv
dCwgZmxhZ3MsIDAsIDApOwogfQorI2VuZGlmIC8qIF9fcmlzY3ZfeGxlbiA9PSA2NCAqLwogCiBz
dGF0aWMgaW5saW5lIGludCBtZW1vcnlfbGF5b3V0KHZvaWQpCiB7Ci0tIAoyLjQxLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
