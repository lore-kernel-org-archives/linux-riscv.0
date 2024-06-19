Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E837FC27C79
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTVkaHOimV6BlGE9pDLeePZvvrW6ZhXcr3N17VdzIGw=; b=nboqBJRxYZaK9o
	DX0imXWSfkihPvC2HRASUgMaq2Dzfr+grnU4va3nxdzUf0b6oFVSKA+423QtShmYNUHj5TgyXlJKd
	SlCiq5f6z6u/VGF7gQy7c3Xqo2FPTEkfKT7X4bC5EzZGCaEgrLGU453SQNxDe0RjDJiY52ncnUFP/
	Wc/mjmjaWpaq2PP2RdGGgmPpiKKwBG6m3jaERBWxf+OWS65wlLMubFaWjP6RUjU6N1rkaNI+BfOae
	4FNCVvzeaGBB7x12xIma4M87Tw/C+ZZuwezl+ZXtbzgw33L0gZ3NQy7TdVt7CHuPvS1ZKgFjJLqXx
	UX3e+SU/GLd5U17UFrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxRB-00000001qfV-0GHa;
	Wed, 19 Jun 2024 15:41:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxQy-00000001qVk-15V0
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:41:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-363d0f1ceaeso70952f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811675; x=1719416475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6obIhMCgJtCMV7DNAB1Eq7WrI+7/yuJDuJixMHQfyjs=;
        b=hB3HlfdKP5AGq4YqeEuX4ar/NT+NwmQ3XNmeogKzvCs8jBl5nPrbWYePk8PLmRbJS3
         0VzF/0NGVB+QhXF66gxcznoeLxUMuq/r5a0NMIXHtj8cMS11cir8M4pdD59nqOcqbptW
         kyMSz7+JG9S2oIAkclXvD4yMv2U6FR4fN3gFHW0+BB43Qa+dvq7L0ZjRLZ74VOnB3fAC
         GBsEwMWTrDW3OZV6w457nWinlxsfFZKbBLfy07XUpX/swhdjK09genoudqJ3SaOnbXeI
         TLOJKxzBGRJu+K1N/zG3Dh+sHhVFLDB85pkQiF1zTSn52KZp6syzQTneCTPeZ00irkDr
         cPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811675; x=1719416475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6obIhMCgJtCMV7DNAB1Eq7WrI+7/yuJDuJixMHQfyjs=;
        b=lC3ybIJP2dXZvxptuJpcEcP/e82YjrHYIQX/hDi50jHJsHUd7mQ/5bSZucO7mPKQdv
         r4W1tWSB+oir9ZGymM+7NjZdjrtGB1az2+jg7whoRsknf0xMjXTeryWs/i+IrIpdEYzP
         cNyFBrDY08Rpjfg3msGVp9c/1ky3YTkHqnbHSuOwNp6jjs378EJQGW9wyFLtxpM/V17U
         3Ng3JDhMedpT4mwzzm43GaOAs6IfOO72j38yCF/yj//wmHpFzXtdjpswvHBtBZR+SrUj
         I9djQU5VS0XPXDRZcsFhj2ji0ZuX3g7t46U1iLuBEBN7FzFhL5nhgndyIh0k0A58DoEQ
         XZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCWZVbA+AzoTz7va3WJCWqWhZ5BHF3D5d9rvw+tRC0UiNo8zUM24Roy93wGv+Cv4GYCzqaoo5ndZLcjrVrX7BETJN2o5xCzokxqV2NbAyaRW
X-Gm-Message-State: AOJu0YzltFDslZL3esfZl2Wfcvgu6r5H7x4oKEGnOb/suXpidnlDvM5W
	aEdkRPSU8bYMQrb8hbs5L90ouMk4vuUll79OClNg6lixPv0xsrwfP3RJyh/NRzw=
X-Google-Smtp-Source: AGHT+IEsiGCR06DYSznwuNGZ/RtWasKc+Sn+mfD0wbhYFJwAh2e2fAjrUA7ukaEqVJFeFkb/5sRZzQ==
X-Received: by 2002:a05:6000:18a2:b0:360:872b:7e03 with SMTP id ffacd0b85a97d-36313fd733dmr2801721f8f.0.1718811674851;
        Wed, 19 Jun 2024 08:41:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 4/5] RISC-V: KVM: Allow Zaamo/Zalrsc extensions for Guest/VM
Date: Wed, 19 Jun 2024 17:39:11 +0200
Message-ID: <20240619153913.867263-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_084116_439094_57DC47E4 
X-CRM114-Status: UNSURE (   9.76  )
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
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaYWFtby9aYWxyc2MgZXh0ZW5zaW9u
cyBmb3IgR3Vlc3QvVk0uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiAr
KwogYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgNCArKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAppbmRleCBh
NjIxNTYzNGRmN2MuLmYxMGM2ZTEzM2Q0ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaApA
QCAtMTc0LDYgKzE3NCw4IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewogCUtWTV9SSVND
Vl9JU0FfRVhUX1pDRCwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0YsCiAJS1ZNX1JJU0NWX0lTQV9F
WFRfWkNNT1AsCisJS1ZNX1JJU0NWX0lTQV9FWFRfWkFBTU8sCisJS1ZNX1JJU0NWX0lTQV9FWFRf
WkFMUlNDLAogCUtWTV9SSVNDVl9JU0FfRVhUX01BWCwKIH07CiAKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCmlu
ZGV4IGZhNWVlNTQ0YmM2OS4uMDk3MmE5OTdiZWNhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKQEAgLTQx
LDcgKzQxLDkgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10g
PSB7CiAJS1ZNX0lTQV9FWFRfQVJSKFNWSU5WQUwpLAogCUtWTV9JU0FfRVhUX0FSUihTVk5BUE9U
KSwKIAlLVk1fSVNBX0VYVF9BUlIoU1ZQQk1UKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkFBTU8pLAog
CUtWTV9JU0FfRVhUX0FSUihaQUNBUyksCisJS1ZNX0lTQV9FWFRfQVJSKFpBTFJTQyksCiAJS1ZN
X0lTQV9FWFRfQVJSKFpCQSksCiAJS1ZNX0lTQV9FWFRfQVJSKFpCQiksCiAJS1ZNX0lTQV9FWFRf
QVJSKFpCQyksCkBAIC0xMzEsNyArMTMzLDkgQEAgc3RhdGljIGJvb2wga3ZtX3Jpc2N2X3ZjcHVf
aXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4dCkKIAljYXNlIEtWTV9SSVNDVl9J
U0FfRVhUX1NTVEM6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVklOVkFMOgogCWNhc2UgS1ZN
X1JJU0NWX0lTQV9FWFRfU1ZOQVBPVDoKKwljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pBQU1POgog
CWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkFDQVM6CisJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9a
QUxSU0M6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQkE6CiAJY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aQkI6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQkM6Ci0tIAoyLjQ1LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
