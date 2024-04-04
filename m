Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26CCD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19QxdT4HlieBfCKkX+KwtuO9BhCphvKnky0Knu5A8ww=; b=u6UnU07DB9g8RT
	mBkwZxraOqUUl+HXhUSn6z4tlzjfXrunMTIXrCPCJZ8V8E90k5Hxyx2N8J4Hs8ypGZJhcsNxsRKXd
	S1SE599/lY/Ldqb1DaJUsRnu9sHtZpgLssC1OSfSAdmZkG2+RF8G9AFAMKnN7/wB/mffW4MU7WV3X
	hlDMGFVV6fwqp4OlYUBOUKIR5LRR+o4nGmbCImWlP0jlkM/4YgQv9ZrHJi9/6aAkJ55AndLU/qcy1
	wG6YAa+tyHea8+/oQPk6swIHjYK4uQt7dohUzFZ65brjcgiFjzYhdlwEtWOMKugC1aqTX2TYM171F
	s7NJBGq8mSxMkTLUL6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMlf-00000002kpG-1xAQ;
	Thu, 04 Apr 2024 13:04:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQY-00000002Btq-3OIq
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:34:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-414953e580eso407915e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226867; x=1712831667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3qT2c8/AbHM1mLG3KaUUQ1VJHCZOCgVEzdfPOCGq3I=;
        b=XHQQXkMe+SSLGUGy5A6x0vqIIShzb7nTt+e7K8gg1fGuVnayl4KP9MgFenDuhpmFqQ
         +ErMlWRU5NCedbW/vFY7b6hzpIUAUFHH4INDsgSTrVV35HDnFtEZXFsvOOwOkjjLyzpr
         BWmjlnmxRgxl7Gu6fWPuPqop72G7gsl5fQKThxlB2tS0vV7taUT5PMBvTxrsAYhHorWP
         oiU8DixCgC6AGgpEfMrssTUk2JMCyjbuddpG6vm0WRPx8IOq6sQsCMidmW2ja7sYlqpB
         5+fXY+TDJh1xTlJuddv1FaADO0J+6noTRBENW3CzpdCCATDe+hRJALRLk+tat0aqZ4RR
         5hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226867; x=1712831667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3qT2c8/AbHM1mLG3KaUUQ1VJHCZOCgVEzdfPOCGq3I=;
        b=AU8jNhWyE5Yew10UA0/wxNWGlqSN7GhTT/mGpjbNtpTdEuJo6BFomnOFwAbGNHWlfH
         20V0MWO6n7752WnIZkGkoRKPv6QGDpgD36A61hg9B2C1lMgF0gzy+PR366ZxmzUyBKuM
         6S7UBy9wxUOgdRB9Y3wLUznN31atC0kpeD7aoCZ1FWQOGkpNzyQSajZ4SFvmtjZc+kz1
         Ukgoq4Sz++GjR/J4Soqbwy11O3MD6+s4swWzQ5/XNF9pouivvuIPUVd91WMEcE0cNq9s
         bJnPQa0ALjlxa+KDFoQpvacnhi3ArwWswH1bj245fR17RYYU5s6IDGQRlPhQA1wToREP
         lilA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1wzbt07XHE4bJg5+iser0C8GYRjTvsLu6L6eE4K1+Xc37+5LBkC43PNcPB5SKa4dxnJJJabwAs4ESHZR3h1WzqNeqAVtbKG4YDPbcybc
X-Gm-Message-State: AOJu0YyjIQGzEEFEyk9suckHHXHDfXlubo+nivjS1En4+O19iomuckWC
	RADh29YA1eoq3LyLjgk+s6h3pAKW8S6v/mdjWXzw7Y7wH8iQpzx73rIYmV4lci4=
X-Google-Smtp-Source: AGHT+IFHr+u5rilj3I1gcYe1DCoh9ifQezh0QsNetqn5cyyFOzLAXut6U4dx1r1pj5Eqiio15Ou5mQ==
X-Received: by 2002:a05:600c:1c13:b0:414:6467:2b1d with SMTP id j19-20020a05600c1c1300b0041464672b1dmr1726188wms.0.1712226867334;
        Thu, 04 Apr 2024 03:34:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 4/5] RISC-V: KVM: Allow Zimop extension for Guest/VM
Date: Thu,  4 Apr 2024 12:32:50 +0200
Message-ID: <20240404103254.1752834-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_033438_940095_6051AC51 
X-CRM114-Status: UNSURE (   9.39  )
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaaW1vcCBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCB8IDEgKwogYXJjaC9y
aXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKaW5kZXggYjFjNTAzYzI5NTlj
Li4zNWExMmFhMTk1M2UgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKQEAgLTE2Nyw2ICsx
NjcsNyBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKIAlLVk1fUklTQ1ZfSVNBX0VYVF9a
RkEsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfWlRTTywKIAlLVk1fUklTQ1ZfSVNBX0VYVF9aQUNBUywK
KwlLVk1fUklTQ1ZfSVNBX0VYVF9aSU1PUCwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCiB9Owog
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYwppbmRleCBmNGE2MTI0ZDI1YzkuLmM2ZWU3NjM0MjJmMiAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1X29uZXJlZy5jCkBAIC02MCw2ICs2MCw3IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25n
IGt2bV9pc2FfZXh0X2FycltdID0gewogCUtWTV9JU0FfRVhUX0FSUihaSUhJTlROVEwpLAogCUtW
TV9JU0FfRVhUX0FSUihaSUhJTlRQQVVTRSksCiAJS1ZNX0lTQV9FWFRfQVJSKFpJSFBNKSwKKwlL
Vk1fSVNBX0VYVF9BUlIoWklNT1ApLAogCUtWTV9JU0FfRVhUX0FSUihaS05EKSwKIAlLVk1fSVNB
X0VYVF9BUlIoWktORSksCiAJS1ZNX0lTQV9FWFRfQVJSKFpLTkgpLApAQCAtMTM3LDYgKzEzOCw3
IEBAIHN0YXRpYyBib29sIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWdu
ZWQgbG9uZyBleHQpCiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlROVEw6CiAJY2FzZSBL
Vk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRToKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pJ
SFBNOgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWklNT1A6CiAJY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aS05EOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWktORToKIAljYXNlIEtWTV9SSVND
Vl9JU0FfRVhUX1pLTkg6Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
