Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284A4C25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDUWkDOg9otj+QxdD37tlWYU+JkzgG3o+9jEI3NnYN8=; b=H5eBPJQbnEil9S
	6WXD/Hi7OpSGYe56MIPECc7zjbOf4LWcERVBS25JItrZ8JIVjKE/NuBrFMMo6Bp2tZ8W8pcDjkGIG
	ASgQejgV6781a/dKweCV1IIfJQYTd1gCs12NFtCyKa0U84RC4PTrhQZgNWSH2wMS8qro1sWcFyWzh
	jPcYNiDjhS5GdxsdGrET2sTpWxDmkYVAgb1Ozm7mB6tvqrBwT6hJVSuqN5HcY/jAc31sxnl3nMAmI
	DamNy2LFpCeSYbsld7YBScqsvZbMUVSPQOrIXs6hnQ9zTFy1+0NBo4mFw/EB8TlN0ASa9jVTt8Ow3
	ur6lZUOA7VRi6b8XjTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETbF-00000002NDj-3xu7;
	Tue, 04 Jun 2024 12:49:13 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETbC-00000002NA6-17KI
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:49:12 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-6d125d826f4so202990a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505348; x=1718110148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H32tM/kIq9tLTuMJ+qVcoNAPrEuAu35f6jcL7aj1B8=;
        b=0vfw7lseH9PyvVWxRS+a0CpZt2ISHVVIoj7/xovxFaK60uRZQaVNYVfGHc+7UEJM4o
         i8XufBghkBs4cdm9HXFQGMoS46VkmrY997QSFFHiW6SekQGLeIaqHcKcaISwRPlLihOB
         tS5j3MCCNsZIkYn3yiSLLZNJ6cpJOSE3PhPYYRsX0pWJShqXnKkT7SkjQunUWoc1zvLr
         hReJm+zOO+Htu0XdWpg/Nn/tlZJ5jPSU6LAToDdxsz8aLJFG2zu7Hm3GSkX0PmZZBGLT
         Zyyp9EOumIRncblXSpx4YAMAHmaPrxcee7IHzeEvsiir3LMpX79kh8HxLPv7lkGHlqwR
         /eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505348; x=1718110148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6H32tM/kIq9tLTuMJ+qVcoNAPrEuAu35f6jcL7aj1B8=;
        b=tuHrI+vBsTnElbDgRMhg7YsrEgY6GjgmXJ9V1hroUef087aINn6dAV5ogE1ze0lhIe
         UVuEMdHue+DcoILrBgQbqFirTKDmZySl0LG2VptrP6bupsf70qAX21/FjnsdROUr3l5m
         SKJBIdpZJ/Bxp1FKlqSKfetMxbbBFzKg3J/xHh7Niy5E7Xs5Q4bynIhGw7fAj5ZX5uHX
         73IEiY40qyWWvgB6ZUH4u52ESc/A9aFjqAMy7L+UN7UjY5H1DoiVafQXIb+IY+cLNh+s
         t5Nnr8bKhYFWb0hl/57skg+jziQtabX4Av3fBxjkXeQWzyFfDNdmr1WQsIhjidzJYc+m
         X9eA==
X-Forwarded-Encrypted: i=1; AJvYcCUliuSzOi5AlcUoR1LsKNR5MmUkU6k8AR+XA+s2CGputuWpCc7nMyeW9ZUvztx6594NyPaYesnNG+fJUbRJTtvdt779JAf4eSJARBi2kIky
X-Gm-Message-State: AOJu0YwnOsEkxhhbQ0bDtqfPhWY8aIqisRdggqCgsj1GHROuG94dXzkg
	KrGLZhipVhZJSlWLQN/olrZZrXEPgKpYBZDC8dhAJA75lU4V1e1nbS5oS1GwPRE=
X-Google-Smtp-Source: AGHT+IEOlFKJRCl1OGX3feCz8BceiHmgf7WyvD3dckWQnAhBGa2tvUo1bIZmX+1nEEZL2bIqoKxgpw==
X-Received: by 2002:a17:902:dac2:b0:1f6:2389:221 with SMTP id d9443c01a7336-1f69424e9c7mr22945345ad.5.1717505348316;
        Tue, 04 Jun 2024 05:49:08 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:49:07 -0700 (PDT)
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
Subject: [PATCH v6 15/16] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Tue,  4 Jun 2024 14:45:47 +0200
Message-ID: <20240604124550.3214710-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054910_368833_F26A8599 
X-CRM114-Status: UNSURE (   9.77  )
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
YXBpL2FzbS9rdm0uaAppbmRleCA3MWIxN2E2Nzk5ZTYuLmE2MjE1NjM0ZGY3YyAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTczLDYgKzE3Myw3IEBAIGVudW0gS1ZNX1JJU0NWX0lT
QV9FWFRfSUQgewogCUtWTV9SSVNDVl9JU0FfRVhUX1pDQiwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9a
Q0QsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfWkNGLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAog
CUtWTV9SSVNDVl9JU0FfRVhUX01BWCwKIH07CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCmluZGV4IGY2OGIx
NWIxNWYwZS4uZmE1ZWU1NDRiYzY5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKQEAgLTUzLDYgKzUzLDcg
QEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7CiAJS1ZN
X0lTQV9FWFRfQVJSKFpDQiksCiAJS1ZNX0lTQV9FWFRfQVJSKFpDRCksCiAJS1ZNX0lTQV9FWFRf
QVJSKFpDRiksCisJS1ZNX0lTQV9FWFRfQVJSKFpDTU9QKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZB
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZIKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZITUlOKSwKQEAg
LTE0Miw2ICsxNDMsNyBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9h
bGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgog
CWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNG
OgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1A6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VY
VF9aRkE6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aRkhNSU46Ci0tIAoyLjQ1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
