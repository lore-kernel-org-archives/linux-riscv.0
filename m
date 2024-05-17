Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A116EC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3AiBWCzY4/t7CioJan7pbc6H/joeMtFyb2SR6tW1iY=; b=dtp/xlkTUc2gHS
	NbDg2b+JygKA0NwRwMH47uKWTEzh/PZp1rjmGV9u+54s9sWBggpaqp5w0r1Cq93vL8Lix8t+U/tlD
	aPMzfjI0BfwyToz5NsTxe2bu/WVlGOetntS0oDCOCAYwlf1iUBHmDHjDt8i2DV4bBOy+W6Z5AxbdS
	UvMPswiY7SYEcG1+SQhKknVRcP8jy8iFZzlJau0GlXXMT/G3M0Ir55fh+jPinYZYrsU3DjaLwNQzd
	iwRTdZe2PJj55ohWXBL1IOCDAiRI6KA8OA5qL62pcfS/E5z4CTFsKnNkm+EhiW2l563rDcoc9hdoW
	M7bUadGSJid6FrjeO8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yz2-000000089VO-01pn;
	Fri, 17 May 2024 14:54:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yy5-000000088b6-2KSy
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 May 2024 14:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e9KC0tuSdit7TUVEzTpSp24//kOo0UeQXa0Z7JvTEow=; b=PY/9f4+CycnlTFE/tnIpLtLg3Z
	gXhq16ECVkFKOrLBz3Lo1jLVZc4vVPpt6PYe+9KUcDUMw4mokk05JUpjU+W6slOswQow2L1abi/Sv
	WJWqO0OBlX0QAhqT/nBqRrtWs2FNdoHvL0xrU+lPADW1icAGcuKZKH8j6R6XJtBITk31wO8uAemT5
	dg07l2vBx1Zi1/M6Xtv78wABqgJqnDsWLsAkpTd/GlufNYLEZOFalo4I2zKD7BnkganSnzJqnN2Ao
	f7MVUa7ZkoecSMTs78cB71oAHSvfI/lhYbaWsxwUAA2bTh0vh3KbJRqId9UfTWJSfT7uREGS+PGXR
	ExQaz0LQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxz-00000005itE-0XRI
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-351d30ade7fso38487f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957616; x=1716562416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9KC0tuSdit7TUVEzTpSp24//kOo0UeQXa0Z7JvTEow=;
        b=anu3PWqUuKhXAkKNqvGhwE/q0B8jCDMJX/0uOsvfpRUZImnyzBqV+4TgqD9egj6FJe
         Cay1Vlysh2lvxfNWupf8gvmBk5286thPUXUJmgL/b7t/7pxrcODOOEPWz82fsttRaEgC
         UStT8QsevhV6py1s/fsKNJIeofXB3VHTAKMJlCq73hFl9FjxmfpYJos4BInTojIbfvKQ
         DmsoPxwNy4gOgoLz43niYXMqShcxLiR9jhEaYf1w2Xs0pI0Mpd7uBmC0cjytkHn3DUBQ
         zL9x/57stN3yDMk777moLpN7eYRpm/XF+IqvKFbuUuVcw3zQ/X1Ix8yDRfuVQjiTWRds
         0YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957616; x=1716562416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9KC0tuSdit7TUVEzTpSp24//kOo0UeQXa0Z7JvTEow=;
        b=uuqEhjS5x+tyXSDAs04dN1T3/iLYX0lYOaEx9vsAZgT0bGIARffloCLCMy4qxCkbSQ
         4wjDtyeXYCINjFc8UtIXOuD7LuEmvIp6w6SjCUdZBcp1RZmScxhqApSj4wR01H/76Qem
         l0XKkFIm80oo8vMJCKVnpY+9vmeabBCYykAdfCdK22lbeuTyC3R4H78XbvKuGx1qYnLb
         Xh/rRbG0dPhrmuiG1VmRJH//MMSqRC7yxY4BSUAsboB6mEWnRwr9QmJjphycxRH2y4Cx
         usrATYkwAJ0rPCZkUwxCRJTni50EmJSwQPH203i0SXgP4Cf3LGJR/eaf8KbSNyxsFugx
         XYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtpgsSPfccG0mHcwmV0sofCc26s4z/yfw+kHP50XS/JKDjKfoRrvp51D/wjcWReqLFQcGsJGy92A8NLchjoqMFk2mJFBHA75JxhnW5BQ6M
X-Gm-Message-State: AOJu0YwQl1olNdve9J1NxOs0cWWgOERNz7sm2p5SsqSPHFCTubwvdGGv
	AhBIulBF5dIky7ogHB5qbIwG+5qs2Fa7OVV6dBnWcNRGysRNke/Xyha27dzgI44=
X-Google-Smtp-Source: AGHT+IHzMauOaObmH6bJHd+GEHQtwrBkXzklFT3v/zPDqrR2YcC6kkpEK8DoADrBqc2G886rfeUyUA==
X-Received: by 2002:a05:600c:3b26:b0:41f:cfe6:3646 with SMTP id 5b1f17b1804b1-41fead6b0f6mr159820025e9.4.1715957615814;
        Fri, 17 May 2024 07:53:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:35 -0700 (PDT)
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
Subject: [PATCH v5 15/16] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Fri, 17 May 2024 16:52:55 +0200
Message-ID: <20240517145302.971019-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_155351_578389_58F80940 
X-CRM114-Status: UNSURE (   9.02  )
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
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY21vcCBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIHwgMSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9rdm0uaAppbmRleCA1N2RiM2ZlYTY3OWYuLjAzNjYzODlhMGJhZSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTcyLDYgKzE3Miw3IEBAIGVudW0gS1ZNX1JJU0NWX0lT
QV9FWFRfSUQgewogCUtWTV9SSVNDVl9JU0FfRVhUX1pDQiwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9a
Q0QsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfWkNGLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAog
CUtWTV9SSVNDVl9JU0FfRVhUX01BWCwKIH07CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCmluZGV4IDdkNDdm
YzkxMGJkOS4uYWY0ZmVmYTE4OWFmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKQEAgLTUyLDYgKzUyLDcg
QEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7CiAJS1ZN
X0lTQV9FWFRfQVJSKFpDQiksCiAJS1ZNX0lTQV9FWFRfQVJSKFpDRCksCiAJS1ZNX0lTQV9FWFRf
QVJSKFpDRiksCisJS1ZNX0lTQV9FWFRfQVJSKFpDTU9QKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZB
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZIKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZITUlOKSwKQEAg
LTEzNiw2ICsxMzcsNyBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9h
bGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgog
CWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNG
OgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1A6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VY
VF9aRkE6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aRkhNSU46Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
