Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD58C369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jVw48asX0n4zT7FP4nyQiCt8eY2d6kMRB4LgGnlM3I=; b=m6BnlbCpbdAHsQ
	eZ4j0HypVuGgFd1t3iR7kk4OMOSGh470IQ0auHn5zCCLb97xXFHmRFli1Z+uE+r44sVjDIsAcj4zg
	UtKbNiwFFtSwI6/u8vXdtDR0cOYx6Y3xUC4nObfWiqOzLhzWL7IEJcTqt8ARJfn8fzkJKYSpi+poR
	NsWPi1ONF3PMNlOtDMIs6uGtIfnUhvFGl8fR+S+5VITZHcVQE5nA94hv40sYjb2IFnJJBwXTOKmoQ
	fQvkrsvUTYWzR/Qi1McrRcQW2igslZNiiYWNbKBCuUTwH0ufRdfBYodSscqzoE0Y4ulvKskyGSnhJ
	S3vRhe0q5+dUvjLZobXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J4h-00000001yIs-2SeG;
	Mon, 14 Apr 2025 12:38:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J2d-00000001xf6-1787
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 12:36:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3680593f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634158; x=1745238958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBLPFCAF2kFHPFPqsZ7gzO7W+qircTgsDB5v3GeiCmE=;
        b=GQfo4N/YTAZbvlrwPhqBes4lX0zvfTmWLf6GnJSS20Xy3CQm2SmSRns55xqQ1vMlaq
         6/jGtSyZrMspCEHCW+/BtsO60dWF+GeykIl2a27hV3lDwww9SrH3QL8AzJGgxx2vw380
         YgrxZ33Q8Jf5ESbCudrLscQ4MlaSbD/bEWF+ep7GGoeuov/3Rgu46EhrgDO+YxjggmZX
         +aqs/cq7jk8AN47y72kNdbWv72r/yxNyVhS7TEbQdnKOkJvv2vM4IgoUTjeDi+CZy1Ge
         5aNjlaJFDOr56o7502/wuRcGlE4S+SWde9V+5ke5oUSwIT/GD7rIfk8sCdDc0LrcYIPk
         A2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634158; x=1745238958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBLPFCAF2kFHPFPqsZ7gzO7W+qircTgsDB5v3GeiCmE=;
        b=KMGRef0bE1aLqobKwqaxFQ0kZUoujle6eKSJRXYIeHGF6DRicQCekekplzSK79NI1P
         rk6MdyUWpaL8RGpUi64DZsauh2toT6hc7UJTYz20ep10i1upSkgcbJB7D50r4kGzGpyO
         wWHoYVvvKhRH3O4gS8jF2VFjXbCyf/u6vYzatJAPRkJ+A68t1Mf3JLkrThp3lfoHW5Yb
         MnJFtDDty/CE4s44QGCx7cx6Gavjc0RznI8l55FKdKJcWK2gspjV8SuWdDkqNiscZvCm
         oumxUeFoAWfYRvFkkE9nW1XPw+L9rLsv9O6cL7lOhktKQzuGkBB4wqdPkZnuOj2J8g5i
         w4YA==
X-Forwarded-Encrypted: i=1; AJvYcCUFSNzu8JzILLwjlMhcClMpNZ2WYY//goVGCcmAIlWvLoIiSlB3/gCUmv9opd+gWA6NtWxc0HnGY/L7pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5eQJwP4EGJLhr8FzVrQCcWQqUE2JqE1e2CEqfyzdFg6IZAzRo
	a0eUoLNp4B9PfEb6yrJypmocxI7Mb60vMw/RChKY1EZcmGmfFN919K7ZPEeJe8c=
X-Gm-Gg: ASbGncshjOku/6NirHle2QT5ujhKW+TeRw4COBT2NSsNK/zZeHDffhUohK+IwTrKIOc
	hhNndR8nheg9DZPRYcOZGTDVekigdA9upWvzU4zX1ro93il1DNJJV0F/MMGln/qnfej4EA5XkjD
	VPwpPFoNJHE3yqRVoOsA7yXlSPV/gaKj21YXYOXLa0rPFr7MM5ZWkWsTHNrblc0e0abiQ7HS51P
	AKu++XLjAqrGLPZ6op5hRlmwTqW0QpLLYbmCDygzVOtgbmG35OLd14ql8rOZDS33YgM5UNwqidz
	aj13PEhgFKzNeJWCuIjz1yVqY83EVnyYKAjBOtt1xDLCyhFmeNHw
X-Google-Smtp-Source: AGHT+IE7ESI9/ydkjbVeedcglNd5VgE6W7NzmKgufSbnzN+RWnm218oxoJgC0K2N8RXVX/uDv+F3kg==
X-Received: by 2002:a5d:5847:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39eaaebebd2mr10756640f8f.40.1744634157684;
        Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 4/5] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 14 Apr 2025 14:34:44 +0200
Message-ID: <20250414123543.1615478-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053559_313465_7528CB6B 
X-CRM114-Status: UNSURE (   9.61  )
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
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9zeXNjdGwva2VybmVsLnJzdAppbmRleCBkZDQ5YTg5YTYyZDMuLmEzOGU5MWM0ZDkyYyAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0CkBAIC0xNTk1
LDggKzE1OTUsOCBAQCB1bmFsaWduZWQtdHJhcAogCiBPbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHVu
YWxpZ25lZCBhY2Nlc3NlcyBjYXVzZSB0cmFwcywgYW5kIHdoZXJlIHRoaXMKIGZlYXR1cmUgaXMg
c3VwcG9ydGVkIChgYENPTkZJR19TWVNDVExfQVJDSF9VTkFMSUdOX0FMTE9XYGA7IGN1cnJlbnRs
eSwKLWBgYXJjYGAsIGBgcGFyaXNjYGAgYW5kIGBgbG9vbmdhcmNoYGApLCBjb250cm9scyB3aGV0
aGVyIHVuYWxpZ25lZCB0cmFwcwotYXJlIGNhdWdodCBhbmQgZW11bGF0ZWQgKGluc3RlYWQgb2Yg
ZmFpbGluZykuCitgYGFyY2BgLCBgYHBhcmlzY2BgLCBgYGxvb25nYXJjaGBgIGFuZCBgYHJpc2N2
YGApLCBjb250cm9scyB3aGV0aGVyIHVuYWxpZ25lZAordHJhcHMgYXJlIGNhdWdodCBhbmQgZW11
bGF0ZWQgKGluc3RlYWQgb2YgZmFpbGluZykuCiAKID0gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDAgRG8gbm90IGVtdWxhdGUgdW5hbGln
bmVkIGFjY2Vzc2VzLgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
