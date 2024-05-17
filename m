Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFF0C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19QxdT4HlieBfCKkX+KwtuO9BhCphvKnky0Knu5A8ww=; b=4RqzeubF/s2SbH
	LxDXhEa+OByVioRytqA1iu/QkooZtR5/3KyLbAeVANCSrMRdWUa/A23r3umF/t6wy169CYjCR58nN
	ve2bEm3jj/L73+SUhkvk2XqHJpEhsiF0gtzYS44g/qlsZ82zY3x9k087H5I3nWfU2A4eAi1gkWHhH
	ocvmJsonkwsH4I98UfEKo8Xj397+VUirI5zSyvL3WVVVlpD43GeP2F0mYEUVFJK7F7R5lkq9iXBJt
	qoB0eKEdTNlXhRqqlmxvIzbVKwC09FlG/tCUrvknXe5gveV+MCaFntO3qJPgwsAI6RdpqzoAZb8EF
	feJ0tJwWVACHT+bRvQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxi-000000088FW-3Tp2;
	Fri, 17 May 2024 14:53:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxW-0000000883M-0ES0
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4200e4b7bcbso327865e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957601; x=1716562401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3qT2c8/AbHM1mLG3KaUUQ1VJHCZOCgVEzdfPOCGq3I=;
        b=NG9ze1ZGCbHKd+UEpzF4Wdr1gz35Y3Q+nVbTRlwdujGnv5fHbbDpv9ulSCguosF2nO
         pIctpw+LBC9MzMAz+6mBlpCpAYSni4GXDfQp1+wDyUkUb8Z1oXhxBUQKkMnqqLl6LWfP
         xFMHqRzWuEWn6Fv4w2TQ/9VIvJyQUIUhaDs4l1lQWJY3espTvENpSwLT4yapyrBoLmgY
         CMclOtDOSaU4uTPUSq0gkH2GkZ4sv6iMjxYyTOfeH3F3UeQUKWk0u6+M2H9NX66n5pw6
         E/8uIJpESztOVb4BKv50wCZfbhbphG3cbWyg4JZvN0PcPeIVfTwF34W3J+aiuSILr1J6
         yFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957601; x=1716562401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3qT2c8/AbHM1mLG3KaUUQ1VJHCZOCgVEzdfPOCGq3I=;
        b=Xz5o+rE7pcsU0iYV5Nt8upbobjaE2G9rDsUAg6uU4QtQpkeYvNfEOQqMP3tzLkXS9c
         /WmjHPCO+tbyJCJmOT8y6N5k6zNUDrJVyAcVUnKmcXzTnOmE/CXoP5tQuExSiGYWihPR
         HOALBslvl3b49rrmYX51yPZWDxs3qAhnm5n+Sr4YXGxMEwvTMKcG2sMbc0jM5FZV34x+
         MxQQweA/Zf4ummjvye1Owi7dr5JvySQd56zagAJLPul9RSMm+Fw8tls8wwzN5090C07p
         qHSO/te1j/At6+EOvObbQDZjxB69dVGlpocDaAUW5paCBshe4R0/mvmgog95zlFKiRs/
         BhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL0+ffU1Yl6w6oxgqqIDie4yMNKLD5v7IUcSMr0SkQL6En1Hh3SkzA3y8Jct5SfHrTqhLHs1YIDIZigZWSMwLhGEDPaATbfBk4+C2e6Kea
X-Gm-Message-State: AOJu0YzXFfUkWJF4YCkfHbJItp/veYdDY0JXcaH94UbivE/P2RlTATGx
	UeAd0oKCRsfX207QpYz4hPaeFaPQu4KmUQSDB8+IPn7kDd6jCppInnG4mRR5AcA=
X-Google-Smtp-Source: AGHT+IGmFz2dCCSoIGSZgcVXd3L2iIvNLJ1n+dSnLeRekQmogP6yVON/V7TWTOPfu9vhDYg4e13TwQ==
X-Received: by 2002:a05:600c:5116:b0:418:ef65:4b11 with SMTP id 5b1f17b1804b1-41feac59e8amr185538735e9.2.1715957600825;
        Fri, 17 May 2024 07:53:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:20 -0700 (PDT)
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
Subject: [PATCH v5 04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
Date: Fri, 17 May 2024 16:52:44 +0200
Message-ID: <20240517145302.971019-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075322_131187_0C44CDE7 
X-CRM114-Status: UNSURE (   8.99  )
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
