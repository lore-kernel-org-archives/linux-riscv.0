Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A0C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYnC6BozqNS9kQzohFpD9gynL6SBYnPtH7aXfwSd6ps=; b=2KfUD0c1iE5I4k
	7EET6Tgg7oRP5gQzpn/KOPoHaCoESMh3S6Pe4hMXc5Bhx6J1t9Y7fwXnV0ovE9p4F0G4ofhpuwIGO
	Ta5kxRr6r2oeTWf747v53txfaBBz/f+7Wy4x6CIQf8nCAjW7qMVY/Yjm0hvKihWoJSZlIrM/on2xZ
	LQw3rEeTe3IDzYCLofdQSgvXW3QaHN47wNRmoridyiH/v8Yddi3vW3kZLQIItZ14Zl94Cr/M5sHMe
	czi7KA9V1VeUqsfz9vYdREXQIUNwJiHz2vfpqMfw8VnFw4LWT0M7dX9bwEXSMjrprtWDvublSzw5B
	qEmg5OSjnVqp1yIFcv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7t-00000002Csk-4A0U;
	Thu, 18 Apr 2024 12:44:30 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7U-00000002CTw-3dCZ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:09 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2dba429a246so195251fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444241; x=1714049041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av0fCRvJ5d6BdL5At0wE/CNS0oRVP43ZLfrJceTJ89w=;
        b=Zm/JSt7AgCHSSwNhV9Zj6Y/sT3SPBttcqaDCdqOSggbMRlRiRiVeOsSA2hiLenxMUq
         p1arziri8oOeO6KbENI1a8Be0aFjDkVt1MlVmYH3ex4qJxh3AM+/rBMZd/Dikk0jCyaW
         FKdRgZUuWdFgv+xZqF1vTJbQ75mdQ5GNkHO7GSlaJZ2S2wznM7LBWm9HoBl0M9oWTOut
         5FaP3SbtUSPoTMdu2jn7j7PR40tECV5DruoZz+k84xpprfm3E8UUaUGS5dLEcR38a+bI
         cFQ3yTW2/2ViptWdvoJZXPDOp7QHH9MBTe1s56o4ngwx/z8c+wUpqBferIuU3ejGKErn
         DKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444241; x=1714049041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av0fCRvJ5d6BdL5At0wE/CNS0oRVP43ZLfrJceTJ89w=;
        b=QHcfwfYclK6ycU+bmlMY1FlfdqkgcZSv30lvWmpKds5/MKsGoYzdDX/H9sC20lQrmp
         JjHwWbyVyJ8NdLF3EOukmVLZ8VulIw3o7gVAY4G/X015Z9Il6MTnlatA1e4QJH05uL5A
         8yD0fOS5ZOPtlN2Xo1h0DE4u6R9qe8ASq18LDS65ridtdTZbRqw5Q+2ZHX6WaglTNGyo
         LUSxupkACdeOJkC/YMXnOcZjUr3FN4hWDIxLhdYzFjp1TuvX39AtN+ttZNeulSvMSwif
         5KzQ43lh28rvx3Z0FcK3mqLYGtsUhvhIxL4s6xbJutXupyY7pkrmK8T+JrMXEcPxE9mN
         hkmw==
X-Forwarded-Encrypted: i=1; AJvYcCUGWrc7UFuSGMf2ZhFW90Q370oBgJqi/jJvYNetNcdflRDlCgM3A0IlLWY8wyJnSjvodLhRX0du55QUuRa2VKiMj8n5Kp7SVSsaBUVHxoft
X-Gm-Message-State: AOJu0Yxkoa8dluFLbIJFkZejHm462AkCZo5YVFaHPjBXcHpeMUql9ksW
	xLiWPowOzEeJTNrr3m1apKAas2/TLgcs0V9+W/CKHXpwQ3GJNzLMesL/x0EpOk4=
X-Google-Smtp-Source: AGHT+IHdzMsUCMCexL1xcSXK55gyqNVYHzfsqQON0oQtcwPFlYxqOUNzTjfk86rgRUdr+Vw8mFv+bw==
X-Received: by 2002:a2e:3a19:0:b0:2da:320a:6739 with SMTP id h25-20020a2e3a19000000b002da320a6739mr1487240lja.1.1713444241121;
        Thu, 18 Apr 2024 05:44:01 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:00 -0700 (PDT)
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
Subject: [PATCH v2 06/12] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Thu, 18 Apr 2024 14:42:29 +0200
Message-ID: <20240418124300.1387978-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054405_008655_A565FFFF 
X-CRM114-Status: UNSURE (   9.51  )
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
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY2EsIFpjZiwgWmNkIGFuZCBaY2Ig
ZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIHwgNCArKysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCA4ICsrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmgKaW5kZXggMzVhMTJhYTE5NTNlLi41N2RiM2ZlYTY3OWYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKQEAgLTE2OCw2ICsxNjgsMTAgQEAgZW51bSBLVk1fUklTQ1ZfSVNBX0VY
VF9JRCB7CiAJS1ZNX1JJU0NWX0lTQV9FWFRfWlRTTywKIAlLVk1fUklTQ1ZfSVNBX0VYVF9aQUNB
UywKIAlLVk1fUklTQ1ZfSVNBX0VYVF9aSU1PUCwKKwlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0EsCisJ
S1ZNX1JJU0NWX0lTQV9FWFRfWkNCLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDRCwKKwlLVk1fUklT
Q1ZfSVNBX0VYVF9aQ0YsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAogfTsKIApkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25l
cmVnLmMKaW5kZXggMTI0MzZmNmYwZDIwLi5hMjc0N2E2ZGJkYjYgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
YwpAQCAtNDgsNiArNDgsMTAgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9l
eHRfYXJyW10gPSB7CiAJS1ZNX0lTQV9FWFRfQVJSKFpCS0MpLAogCUtWTV9JU0FfRVhUX0FSUiha
QktYKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkJTKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkNBKSwKKwlL
Vk1fSVNBX0VYVF9BUlIoWkNCKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKKwlLVk1fSVNBX0VY
VF9BUlIoWkNGKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZBKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZI
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZITUlOKSwKQEAgLTEyOCw2ICsxMzIsMTAgQEAgc3RhdGlj
IGJvb2wga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4
dCkKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pCS0M6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VY
VF9aQktYOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkJTOgorCWNhc2UgS1ZNX1JJU0NWX0lT
QV9FWFRfWkNBOgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgorCWNhc2UgS1ZNX1JJU0NW
X0lTQV9FWFRfWkNEOgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNGOgogCWNhc2UgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkZBOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZIOgogCWNhc2UgS1ZN
X1JJU0NWX0lTQV9FWFRfWkZITUlOOgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
