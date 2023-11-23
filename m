Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9D5C636BD
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5PiqgmdJnV8WMS/NguAZB5GnJcASuyMy2jEo/k1FyE=; b=qVm9HY0V3yId+C
	xraHDzEKqBsqUIyupHeqWYB+LklcTNWNiQ/bbgMysOHR2EW94kEt8DlIdIkrU6KV9shOnNiaeaPca
	iteMzbUVi5XaSh75bnBT+U0C+2WeV/ngVdf84UTosPUIWw49hg63Vee/vO5V3qNXFgiogpTVZfGh4
	dMicBtsSlqKK8NJ8DVtCAV1yl/BnZpGEIHveWuuvXtoPvd7E6vhE1YfQPEfk4eg5QPskC0uWUD9xJ
	B1NIB7plh3rhS1/y2LfrdH5jxpz0pt7/vimlpWQzAHLINLURAA0EYa/d7pZp0CT88EAoOJFx0A/xe
	Avne8Wx3fZqUuFkknCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuO-005YLB-0E;
	Thu, 23 Nov 2023 18:58:40 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuJ-005YGv-0l
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 18:58:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a00c200782dso168480966b.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700765911; x=1701370711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gBMT1D8EIh0bBWoj7ImRklCKaan3pldMceeCzs+vUQ=;
        b=k1r9+LIYQ2XaM/GWomTyGQoo+vhtZFIhiIg5HjNP5VAon4SS2ykX0FBQUVDysN2H8Q
         ZqwAUixw0fbEhtQ86V9aLnbS75gKn0sji0wepYyVfKRLaMBgZv/qjHcW+mq5cNV2AMYm
         hKS2AIvPUh3/rqbtKnsp+ZYbdR/TmB1oZuxi/tidCD6bsqg9AEJ+9U9T9tC+thteybhR
         vPzKgmxSLk5afsTNioT7G2tFdG50GPmX9bG5kIQp6OX1mznpDValEMSKPsRhqgNCwYPM
         1GwlgKshNfNauJjVFORxLEFKUe5FgE0782+YbyMm82nsD27g5esv2L+58SBcK8UT/R1r
         1f/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700765911; x=1701370711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gBMT1D8EIh0bBWoj7ImRklCKaan3pldMceeCzs+vUQ=;
        b=uxxeLtzGBnc33IC+ev7uVFVOLY0gFzv/sQewOa9DtDRB9+c7hQwwkzccugIcclj29X
         ZerlP1XMB/pGEF0xbYMU/aBZfeQT582Lm33D8nefcC1c3y7plKI9iKmQIKo/d4xjraYq
         2PcsLkgRkxX8+KMyU6z3Ckfl8hPrYFIj1ntuqMMHy2p59PfTrlu7rWzhyDhV5sM7LWYC
         Br7YJokqL/VTkX2P0rQAi7W33aR1h5+OMNkwmTe6IntvMTiGRlewiQZtAYMYzoNwLa7L
         O8UZhOqFlXxW3leFlB5ckEiuZWkPslmz2sOs67MbNnSin/ry6j6UTDSQI0K0n+Hf/V45
         foPQ==
X-Gm-Message-State: AOJu0YxYHJi6SucPpOfZ5QE/pEmjamCGzrucF69gMkf/Au9goiyke9oW
	0GksoL1EKGZM8KALM/mvYSQrnbP/RY83CVEXDHND4jnd
X-Google-Smtp-Source: AGHT+IHM33vf1NCGDtR+L8oDLbeP6Km4LXuLVeIqB8PR1IIY6cQtOKQe4/t/v35w1zVrGzfmN4G2PA==
X-Received: by 2002:a17:907:d30c:b0:9bf:d65d:dc0f with SMTP id vg12-20020a170907d30c00b009bfd65ddc0fmr232442ejc.4.1700765911728;
        Thu, 23 Nov 2023 10:58:31 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id l23-20020a170906231700b009ff1997ce86sm1115944eja.149.2023.11.23.10.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:58:31 -0800 (PST)
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
Subject: [PATCH 3/5] tools: selftests: riscv: Add missing include for vector test
Date: Thu, 23 Nov 2023 19:58:19 +0100
Message-ID: <20231123185821.2272504-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_105835_276137_7B1628AB 
X-CRM114-Status: UNSURE (   9.06  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpH
Q0MgcmFpc2VzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKICB3YXJuaW5nOiAnc3RhdHVzJyBtYXkg
YmUgdXNlZCB1bmluaXRpYWxpemVkClRoZSB3YXJuaW5nIGNvbWVzIGZyb20gdGhlIGZhY3QsIHRo
YXQgdGhlIHNpZ25hdHVyZSBvZiB3YWl0cGlkKCkgaXMKdW5rbm93biBhbmQgdGhlcmVmb3JlIHRo
ZSBpbml0aWFsaXphdGlvbiBvZiBHQ0MgY2Fubm90IGJlIGd1ZXNzZWQuCkxldCdzIGFkZCB0aGUg
cmVsZXZhbnQgaGVhZGVyIHRvIGFkZHJlc3MgdGhpcyB3YXJuaW5nLgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Ci0tLQogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9leGVjX25vbGliYy5jIHwg
MyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMK
aW5kZXggMmMwZDJiMTEyNmMxLi4xZjk5NjliZWQyMzUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92c3RhdGVfZXhlY19ub2xpYmMuYworKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMKQEAg
LTEsNCArMSw3IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisK
KyNpbmNsdWRlIDxsaW51eC93YWl0Lmg+CisKICNkZWZpbmUgVEhJU19QUk9HUkFNICIuL3ZzdGF0
ZV9leGVjX25vbGliYyIKIAogaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQotLSAKMi40
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
