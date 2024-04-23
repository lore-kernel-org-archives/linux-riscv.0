Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C4FC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrXGf4V+SUfS526+G6EVworOfyPCtDnpxG9VwyCk+a4=; b=YXfXW2QKXvyyxE
	yFk+hRjuaUC/MO6LdqcS9BnQcgxvoieDzRKDUE8AFsJYSNc9JU7ogorkRYUTXRFIFs3ergpCAzwbr
	qEvqNcZ+TlrZyqlZAAA2CCjRrABwf7fncQ2Xp6RdZ5UBQbGGqbhpYPZYa40KlKQNXVGdLDifregpF
	OE+3JRBE9CudMmLNxI63HK28Hf8WuGsvGyS67PWv5yujXPKdpIOevqqsark9f2ciYWPkDAz7sEaUO
	7cKo0Fw6depPK55iBtmvQCwTRU0nIE3HIg1tGB4seD+Txb106KVA6CKkIAwW5Fkqg5YyTYZF2v+g7
	yNEezfHlWUN9y+TWZIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFWI-0000000HTYg-45hL;
	Tue, 23 Apr 2024 12:45:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVE-0000000HSct-1UHM
	for linux-riscv@bombadil.infradead.org;
	Tue, 23 Apr 2024 12:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=; b=Rg65TR96fRtFaRTSfaLnCigzUn
	vy9jb2aj76EcUaOUJ3b3607oWudaEedPDRQrKvrD3rLk5XfsYJ1FybdD1JYq+rNuYAIykO+jyoR/U
	oi9T3xmX0YdZ3cwDX7uFkV4xA5v/+2Y0KI0CmtJ8Dyk0LIOWgcNJFZNFo6ngTDvmOqlhJF6d/zjSj
	/oJO3cR8Lgvh5C0EYPn6TWEoULgrREW4nMFC5S0tkaD64TutorQxXtRLNl7m5IFnciks9wVkKvgAr
	6PCeL56WO1Xo5FxjD31vnV4BoWfX9XywoM5l2BcA2/jrQHpnYzZwTH+noOMI9MDOiuQ5ghKR9cT3u
	yDM8GfYQ==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVA-0000000E1zt-07iL
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:44:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-346407b8c9aso1491801f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876232; x=1714481032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=X9jPqhXjrno0uqP1GCRYHmnTFpz55KWpsHWF7zqXSChsXhbuBwWuHJNbcwd2HUW7DI
         54fA+wnHlL25LitdXNWLxnmdWS75OqmlGDTnE75WS7YSFLQpcnTFlGdOPVg4KoDZvNcY
         CJIHlxWBoA/s+dphaNOb5nGMib1ma1IYfEc7SdGq9/DSpjF7doxW+50lpiVv3IwK2pFE
         bVGVQDTgLCa+AydUcp8vsNe6tByRrfLoxy3+1f7xTAo6fiHu9/CY4AHfxHXJzLj06NnS
         hTY97NX0piKKQz1jfk2TfJ2gGj2eihxvUmfXOvlqGpN+mTGDNXCsYaw9ZoS4NKHjuiQt
         o7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876232; x=1714481032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=RRhz5/Okr8s78gQBiLr2M71LmPO8Hl3g6z+XPwxBdrTGCaeSlJgpqbWyfzu5Yj0t6m
         TT7MRzogoLUc3YLl3Zrz/hnNfxsIG56tgNViJATYdK3MYuWsaPh3GVI279MrP54wl6Ls
         Tzslyq40VTTRJF8njSg8RWh6He1NpBSYVLFDZ9rdp/yawVrIs7tDZZFjCGxQlqVlaZar
         WwtJ7VmcCeQrBjTXapClwCqq/4dWdspeqv3MSR9BtAM6yD/M34p/ED2VxPuWuKm34470
         +jOxuUeIV/6ra7MgRkfPPYjp4xeGUOL4SjiC0/lx3Vax9e3WM71USToSpjaT+3G+8p/s
         nT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyKW+8FQoyTulDfkRhdoNaUtIbBbwAS9DaAwPEhruYTWYMcIpNfncZSjQFg6ApWoSVqjy4sVGuMotXj+CB2sk2GEppHZUWv0nLRK8rrL89
X-Gm-Message-State: AOJu0YyJOakQb8fCNtQTjqUzcR0cqeRvDvBd7gLN5xSS+8CdRh03ozIo
	UV6oHHKZTVeCuaEAd5gpthWASaIBC59WqNeQhSiovwZoO62Wnu/o+2YHC5Kx3z4=
X-Google-Smtp-Source: AGHT+IG8Y0QuKdCdamw6m12y/zyBhHBAXQlGn8wgQVKcyAjav27SlxD5OClQSLzPK55ylnTNKzC2Ow==
X-Received: by 2002:a05:600c:3d95:b0:41a:c4fe:b0a5 with SMTP id bi21-20020a05600c3d9500b0041ac4feb0a5mr958105wmb.4.1713876232338;
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:51 -0700 (PDT)
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
Subject: [PATCH v3 10/11] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Tue, 23 Apr 2024 14:43:24 +0200
Message-ID: <20240423124326.2532796-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_134400_372856_E038EB64 
X-CRM114-Status: UNSURE (   9.42  )
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
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCmluZGV4IGEyNzQ3
YTZkYmRiNi4uNzdhMGQzMzdmYWViIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
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
