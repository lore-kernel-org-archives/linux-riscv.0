Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB215C369D9
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUUpgTcMQ+nTNYjLihcwFE+5OcAWlvHz3BcGDJ9VzPM=; b=MKrd56CY+2RqZH
	XfvnfTAbT0u8F55LF1M9vfLn3YD5kG7X6tMlFM/3CIUPL84M02v4DfrQzdRjNbqkbVSrlvme+w6AV
	7US/jyB0sbV8kqtFebX1OJKjL4yqF0H/5clrsC6tCbQqKP4O9wLTIkJgW4X2l0uphR86YfT4xZ8nh
	HXlrfyq7PANdtH7cCtLM9gy0y/g5sfX+k2sxLbq897Eoq9rSsT9Oy3mp79nGp3qOXFNkX347LX0ys
	lM57dgCPoAt8ZSwE9OcxefVCIGNxdnSkizIpvetHX7ZvyBzV9Gx/vTEbFuLSLSdja9f3gf8vFIM/F
	yczMDUPcRdWGrmyv7O7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jad-00000008Lk7-1qRj;
	Tue, 22 Apr 2025 19:47:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GQ3-00000007taP-46jh
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:24:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-736a72220edso5378994b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339063; x=1745943863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbKVfcaTHYuJWKRcGFqU1yco7PJvUrfVpm2zvqDMXhg=;
        b=kICG12OsrN0Ldcd1Ptvk2vtA2o3oXFgKyyN6OGl3nx9Di2lOUviiGzNW6YrsInukBn
         qVf8onD0cBTOQ5Y9ItqnXR8fKkFoacK4bKbbgk6QCeHwaEOqD2lHSZupk2IHRKmtUMH0
         cp9nApXwsYKRZ6aKYT0nPf1Uz2g8Z0UhOvSf/BITo+ZXksbeKQ+InQP9+eLgX3djXXcG
         A+vL2WvkJS8L+G7caKpcNyAmgo6t+Wk3WW+na83x94TJsZxCAZ4jNtUoWtrrQaXHa9Aq
         zbQRjr9iXVpj/KUK8VFcjsvSyOIbvtCsvQr2jz/+lMwELIUfDsdMgEUUtD3rZhY+GlSe
         RsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339063; x=1745943863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbKVfcaTHYuJWKRcGFqU1yco7PJvUrfVpm2zvqDMXhg=;
        b=EVPWi6R5jug4IAvdXLTaCxwJWHbwe86LD+TeWsZVjj1Kpu1W0qG+rhIRnLTwDcH47Z
         g6lgADdmmansbB6M9429rQB2DsSPOzSXPNY2x4cGpTL3+OGWvZmt9SXmyRPw84zt2qOk
         OX4/UhKwEcKzyy6Keda8CLPvEvuVMYvAaZE2PVGcRfjVJhHq54pzfV0uUWwhJvoQuJsS
         SKLJeEc3NVNa77Xak1BZZwBHlbVmrBeP8K9BXg/WNa1lv8pOTmkVHp25KJpPLSgcJ0+w
         MODLZS7AHOvv5k5RTfV6FAMTTWnkaEPRxaVh04syjDeulvISEqQise1gnr0GbAO88F8r
         s58Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/dkncwSR17Mkn00EcirYxDqYZ9QyvU65kpLQAF6v2ffCnOfB/2lEygyUMula3+NQ72qnTYFv6XoevzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM0pk1gF/HkWnqF6Uknun80iJQndq0h8qUA1fnS26G/UjZ1J6Q
	zkXjyRy/LWBohNM0sUkxhGk62HWkSUze8Vi24kbmGISmf4W5jUl2930MHwyR6ek=
X-Gm-Gg: ASbGncuYdZ3dz+dCEPz+savk3KHlCnSdJRAVtKx/cCCpDkwnachiHQWzk9CM3rkRYIW
	OM0UMXgVhFlUz5LgvjZNve//EC5+QKkKnrIGs8GJlihZyP24yt0ZzWj/3QQqO8NQ5X9LMH7IAcn
	dC/Adn3+fjFuKvbVZZbfth5p5ScsdxRP6L1X+4HfH1L+/JMbFeSntHV7bcg1XVZDC0pyLzG+/cx
	l5YMGQWni+ISymeerEhD+voFHIkiz/86eb9K1xXUtUJeQQcfTuXvImaX6uemdk6haWPjtUnp99N
	8wMioYTsYmVhpaIzclgrKzLRRkie/vye/zI8vYT/ig==
X-Google-Smtp-Source: AGHT+IEFf0tssnpfmlIbhqMb84KZUlhUCNzB5IiKyJZf9ulfPIE7IN7Goopu3beJAt1h94MrpDZmZg==
X-Received: by 2002:a05:6a00:27a9:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-73dc159de28mr23833026b3a.18.1745339063142;
        Tue, 22 Apr 2025 09:24:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:22 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 4/5] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Tue, 22 Apr 2025 18:23:11 +0200
Message-ID: <20250422162324.956065-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092424_015392_6E7EA92F 
X-CRM114-Status: UNSURE (   9.83  )
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

cmlzY3Ygc3VwcG9ydHMgdGhlICJ1bmFsaWduZWQtdHJhcCIgc3lzY3RsIHZhcmlhYmxlLCBhZGQg
aXQgdG8gdGhlIGxpc3QKb2Ygc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9zeXNjdGwva2VybmVsLnJzdAppbmRleCBkZDQ5YTg5YTYyZDMuLmEzOGU5MWM0ZDkyYyAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAorKysg
Yi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0CkBAIC0xNTk1LDgg
KzE1OTUsOCBAQCB1bmFsaWduZWQtdHJhcAogCiBPbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHVuYWxp
Z25lZCBhY2Nlc3NlcyBjYXVzZSB0cmFwcywgYW5kIHdoZXJlIHRoaXMKIGZlYXR1cmUgaXMgc3Vw
cG9ydGVkIChgYENPTkZJR19TWVNDVExfQVJDSF9VTkFMSUdOX0FMTE9XYGA7IGN1cnJlbnRseSwK
LWBgYXJjYGAsIGBgcGFyaXNjYGAgYW5kIGBgbG9vbmdhcmNoYGApLCBjb250cm9scyB3aGV0aGVy
IHVuYWxpZ25lZCB0cmFwcwotYXJlIGNhdWdodCBhbmQgZW11bGF0ZWQgKGluc3RlYWQgb2YgZmFp
bGluZykuCitgYGFyY2BgLCBgYHBhcmlzY2BgLCBgYGxvb25nYXJjaGBgIGFuZCBgYHJpc2N2YGAp
LCBjb250cm9scyB3aGV0aGVyIHVuYWxpZ25lZAordHJhcHMgYXJlIGNhdWdodCBhbmQgZW11bGF0
ZWQgKGluc3RlYWQgb2YgZmFpbGluZykuCiAKID0gPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDAgRG8gbm90IGVtdWxhdGUgdW5hbGlnbmVk
IGFjY2Vzc2VzLgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
