Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01179C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFrB5LQGyaVxOn3sX7p058CScWU4vV/B8l9c75d4MsE=; b=JNNKsrZ6+sRM1v
	KGzZyz0BL+lWj20io8sxsGfe8Q0WGwisLWfP8HSZjcDawtHAPdfMBbzmghYKaDRRWtImbp+cN66eX
	Flfrsk2jZ8PnujocW1+WMJaonJ2+uS1KqThPTKKdTKrsOFVizG2k1Bqt5zBkSrFf1Jtfrnl8fhK4Y
	YgL7nIxw74Ml/F/tX1eCtAg9id6b9malb7nv1iK75y2rUpz835CLDcEUee3vqviXaiVEmkwtA8R0H
	g9okoa0zPx2BPteroVwZ8b3iEOzNByQaB6QKR/KX8RiriUA+eRAlEj7oQsP71J8XTPaCbV46+o9DO
	sTTm1CqE4FAzjuzRb/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfM4-00000003GCh-2E3V;
	Mon, 10 Mar 2025 15:47:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trepo-0000000380H-2A77
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22438c356c8so47844025ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619668; x=1742224468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=yC+ybaopEaJqXDGp/9K6/1Mujg0DWFIiAQRmv3Y4FGAJQFr+ji9kCBEqqI1aokSWGe
         l0wp0o87CTWppPKLzvVmqn+faoUshksSKAdCt2bNQPbs/LEdYT0i3tHAIfcuK+8qc15u
         fhVmJ6vOaDsJhg5xNp7RBTdKF5amdjYgxbRlHer85dJ424SMETiKwzPYLYxHbyYqJSGI
         JM6nipwTTj/YciGt3lw/XaX/kkRHFxMX9r3GewOGmkL2XJjGVzEb5I6rXcXZyHhVnUK4
         u/gPsIAccW77BZ/B9CqYqku4rotiXQVonoL6aig6sVGRexbGII/jYJC1Q3ebeG6BvFUv
         jhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619668; x=1742224468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=hhDpCT1cqR97XgKaaA/nCTJhuB+x9fCZkM1VSvt+ECn2D2QgK7tEfadBrf4U9p5i+t
         r09nySyWkiiVZP0YggIg5xY5xCkmnCEU00Z7ZE6i3MiP0ey+D+nGpG7kkLlSSvpWE8On
         q8fbayaneghg7rJJ3d7dZYIxJ5JRMUOfGMfm/QRCo9xBPxQD8JTTMvIin3A+30j1a3+J
         1TpDgfkw++z9VUNF0aDg7QQ/B1A2XjqptBsZbXKarKUdAQCLACo9qWhmYRBxx1rKDJQG
         rNAXQdVVBox7qD/gC1KxOVBDPVa3X6PYWh0kBxI6YpTvfAU7Vnd3hd8tmu4ka7/zsQFZ
         jaBw==
X-Forwarded-Encrypted: i=1; AJvYcCWApSlRkNxTxr9vUK/le6jVcWuPnXpcqqa7zlkDCQBEnq5X2xTk9Yfr6ialHXL0UX/F18uT/LJwpHfp0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4XeDajQrUXwaNbl4AXegA79SlICJ7tvgnuYAzsMBuiJroT3IO
	A/XqLxTpL4HZNbd9R+kQ/CrJNboxZyPn8l4tOFCkZQSj38nrqhnHLY/mkHeL+GM=
X-Gm-Gg: ASbGnctWy/yf7PjQvX9h7XMharIS6ndWahuDr0TRBYNodnJmUCytTQKn8q43+O/RP1p
	CtQ/o25wTAXjweQ2josIEgr0Wwki0RYJ40Qwkc2rgaAMWt68KJ7MNkvtztHMj8891ALYR5HYBul
	URgMEgYdWy8aHoNKspmpKEsC8+xOBLrhY4jNLCmUVUs8wIVR5yDADQGYcXI2fou7jZy6B3gKVnt
	joiBVtPKxHn96STEwWh0WBd3cbrqbIubZh4c+p7cuZlIbOZ8hfGWs/wdx+8Mwv0cio5wwkYnrNg
	BBqqoOc2G8LpIU2CNl43PapM8bq2HKQIOAEIcwsDBU3roA==
X-Google-Smtp-Source: AGHT+IFtA7ejSY4XIE1Y8FAoh6UcQJS/Qm4jl+kbYc+4FdTVNJHdwGd9aRrsWNeD8S620FnvoI8t0w==
X-Received: by 2002:a17:902:eb81:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22428bd592amr282068535ad.40.1741619667997;
        Mon, 10 Mar 2025 08:14:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:27 -0700 (PDT)
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
Subject: [PATCH v3 12/17] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 10 Mar 2025 16:12:19 +0100
Message-ID: <20250310151229.2365992-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081428_546080_DCF50472 
X-CRM114-Status: GOOD (  10.04  )
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
