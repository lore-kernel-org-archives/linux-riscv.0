Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6499C021A2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFrB5LQGyaVxOn3sX7p058CScWU4vV/B8l9c75d4MsE=; b=mqrBWj4Cb2XOhS
	FBtyP6Tq0h3iVczCf9NBcbFyI+fM2b/Ybi0MCE01/9FnbRxZn6s8xPTpvX5oznfbcyGKGakJn1XlN
	BVsGJt4hceje5t5zJCEBOTJD2bne3ZjSM8KdXapt8JSETUTQMuUq0ZHzym4u1LOYE8Hd0VOvpfRpY
	ejrzgrL1Ux4hcXRzCteip2gIndhotcdcpS1Z7c73KNwsK2MXNH4ykA+DvZ+t7PbTM1ACAaod6oCyx
	+T7j/LkNz4G7hV7+uskTDsQ/kK2Xa8LaLiqhALTU5kaFaHgYsgEDhokmI6gLNUMXYHqDvdZwp7Q9N
	6uZGoGuXS703nxmbMYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdd0-00000001u3f-0sh4;
	Mon, 10 Feb 2025 23:55:50 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRy-00000001VRi-3QQ3
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:20 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso2314052f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223377; x=1739828177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=t7q+s4vx1KmOCHWUvc+fsjebneFvruK1UrdYDdjxz9mdK+PhERmW3env7/vv074wo8
         u9WZY+cA0Tx1+8npCtaQDaEqxp63qfwgJ/p3yXcT3akAbUGtLzFzLhC/1iTzu1RuNr22
         eK6Ghkj+rssSsC+YhimZy2oRju2dhmdhBLs7EegWJgI7vkEPlYubZphm0WuJKkcgcvxi
         rB1HpU9dbmuowAZhdGErA3eoKJGgcw6DqsXRzYQ66ChPOYWaXHNrSEcIalpYxCs0BSDR
         bflvsgo71BlkTqGPWK4ctrTOKouK+vchRG/1M+rZxTa7CbXzga4WzX1+rXRwduqJRfzi
         FsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223377; x=1739828177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=b1zV8mFmweD6tnLotRHOaPDLfrLtDsbLWCTkU3cF8CMPBU4K4yJy15Al05t5i6rjXz
         6+eMdCBfPKZ+4guaHHxEonpx+5q86ZEURc8VJMRnANxUK7bUx+ZownXZs2EvHLJ2FbXa
         mfRZt8Bq92T7OxOCnbifwTWIfW7Nq5CLu9Ha9P39T4a+I67Mck0CeJfk/RQdUO+c2O0j
         u+GFa1qoPJicJCT0uNpBrzHRde6K76ZOlV0UBP5XWC23sccSvglEJ/E/I9OiPbg6r3q0
         UCb6u4KomokOUv18r4f5R2jd4KoZOtx5j0pu6DRaevnXiRS+i8oy7CoimllmrC8WRclK
         iRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZJuDflupeXyvWulrpkcCQWoOPCkoB3HKiGs1sX5IXXeC834mTFrRiYvkcvxcCmP2FiVSiH8RKXrLBig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWp48H63jxPUv6ccatsj4TqLUt+XgOQsA/PWy3uZRmVA3mdedz
	GaSLAiOqtWQ6btWSlIuJPa3RpCADQsCgJYPh4dEAahaex/qRYnXKArPg5DJea1g=
X-Gm-Gg: ASbGnctcQWyvFDFGfrBxH3FsC6VSfePOV6HSgE2GL820FD5PbSzbIpjslwdp9CRNMph
	AJQM3al8LgudqY8P3z+xpKfRWgWHsU1mYXQQ4RyesSGfdxyJYC28kVdimQ+Sojltmmc0X6JdMNz
	fqdEqYlR4CfFKPyNwq3iHMaWn5Q/MgOj7zVhydDc630nBHNV1aCa8gM8x5xMPXXquTywhBq4yTn
	XVBSO2ktgXKxNjqySxjWRUwiQkM2QfpvU0ptvgVj58usYUK9Nwv2ng011ykg7FBHz6Uy2Ot7f5h
	zq59ekalbct1bJj7
X-Google-Smtp-Source: AGHT+IHl9RCIMbw69DzrfNCBQKqxgwJyioxKnKZwfd1pCQSELzIBzuIUeEudhJAZ8urQjlYc1+XZZg==
X-Received: by 2002:a5d:64c4:0:b0:38d:c0c0:b3da with SMTP id ffacd0b85a97d-38de438e603mr681026f8f.2.1739223376894;
        Mon, 10 Feb 2025 13:36:16 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:16 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 10/15] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 10 Feb 2025 22:35:43 +0100
Message-ID: <20250210213549.1867704-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133618_858334_42F3B86E 
X-CRM114-Status: GOOD (  10.72  )
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
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9zeXNjdGwva2VybmVsLnJzdAppbmRleCBhNDNiNzhiNGI2NDYuLmNlM2YwZGQzNjY2ZSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0CkBAIC0xNTg0
LDggKzE1ODQsOCBAQCB1bmFsaWduZWQtdHJhcAogCiBPbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHVu
YWxpZ25lZCBhY2Nlc3NlcyBjYXVzZSB0cmFwcywgYW5kIHdoZXJlIHRoaXMKIGZlYXR1cmUgaXMg
c3VwcG9ydGVkIChgYENPTkZJR19TWVNDVExfQVJDSF9VTkFMSUdOX0FMTE9XYGA7IGN1cnJlbnRs
eSwKLWBgYXJjYGAsIGBgcGFyaXNjYGAgYW5kIGBgbG9vbmdhcmNoYGApLCBjb250cm9scyB3aGV0
aGVyIHVuYWxpZ25lZCB0cmFwcwotYXJlIGNhdWdodCBhbmQgZW11bGF0ZWQgKGluc3RlYWQgb2Yg
ZmFpbGluZykuCitgYGFyY2BgLCBgYHBhcmlzY2BgLCBgYGxvb25nYXJjaGBgIGFuZCBgYHJpc2N2
YGApLCBjb250cm9scyB3aGV0aGVyIHVuYWxpZ25lZAordHJhcHMgYXJlIGNhdWdodCBhbmQgZW11
bGF0ZWQgKGluc3RlYWQgb2YgZmFpbGluZykuCiAKID0gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDAgRG8gbm90IGVtdWxhdGUgdW5hbGln
bmVkIGFjY2Vzc2VzLgotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
