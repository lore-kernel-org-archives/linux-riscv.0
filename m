Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D495BC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJjC5MSkCky5RcVksa2VLhkKHeEaHWqsT81FhGEbcLA=; b=gEV8RvQ/NZbWlo
	RQbSBn31ScyvvTJFB0Z1J60i2I/h5k4Uzmg9F+M9gebkfuKSD1RaIUGgNJdrbSisvKbCDc9c6TN9m
	j7GwD1sOUcP4RGP0/eu8k1bRt2SaQEGzB26fTQ2HVQP/8UmvNPPG+jymCFbMWsax/Z0pZSBlZB5d+
	7qyjy1Oz+8PM431uo/he+PK35nPfGd98ZXTW3JJaCiBxje6oY0+CTTvwoyMQyf34zII4urFSgoeX4
	8KhCgeRNpIAMO8250zxexpSalThHZ8QLaTbb59efGRyGqn8b94XRH4YQKHmpnyDEpOS45owOtFtIw
	7fnAIng5HjuFPLgum54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVd-0000000HSxu-3d80;
	Tue, 23 Apr 2024 12:44:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFV1-0000000HSSd-2KRW
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-34b39ecbd0dso313401f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876230; x=1714481030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPMUP7jTPhU8KtBceS7+PJO2x6890fNpaWNWTvJnT8g=;
        b=M/2K/tN0FSgLDpTSzIGgs1HCgTs5H39W5n2QyV/Ge/3W+ZLSE3Dwd6mUJGsGU9fzfo
         yT7qAG6aZRUHKAMZqrXOnxGjfbzZ4F3EMjyucg/FM1hM380DWuyhtapgVpO+2Gwglsdt
         Zj2Ss7QMRqfI93R5p4ODyZ3ArlIugQ+yipGXk4rSlcYaWN94Dh8/VE9SN0gShSb6OmZF
         mvgMmWyN9QJ6gq6TxGaVzn+N7l6QIwjuvEC6CMnCD9onLV0DlA2cxRXXzGI4855pwYr1
         Dqi02cpV0ar21H4mpVdkkiBAgLGg9Tmon45QLCVBUqJZ6I/5smC+CivHGuji4HqnZCUg
         Jxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876230; x=1714481030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPMUP7jTPhU8KtBceS7+PJO2x6890fNpaWNWTvJnT8g=;
        b=GDmOc5okFr5y22B+gEABYpMYpcH0qSHDmwiHYTmCX8D75Zg50MLYh6GHGTGeNtfx6f
         BM5JDDDtmfV7QJ9gwOut9BjNwATsss/C/1oJsS+oUzq7OMLWGvzB3gworfLPjqZTxFIH
         9eFOCxuLw46wpc+riqGpPrXve3jOMIrIaTx9pcyhTERpMVcVG95K+Vrqx+2jAPHQE1uH
         RHlDgYnGQpHaUEGQz825e6j2kP8IM/C1DOQl5xTFWYoUS/2S1LSy5Ld8WrNcN60FqFXT
         LXStMC7zzNrI6vHTsAEkqO3kkUa44tHuUrLsMTq1D9Tqs4oNXn5bAxH86RbeCWJOE5JW
         1tuw==
X-Forwarded-Encrypted: i=1; AJvYcCXSQgl+xuyi+Mq8MQe0u1QV4RN1sEqi5/fGKEtijYBaYI5oJwARUUaQTewitbkkVcKDix7yNLMQyTU0Xm3qeLDRk6TcbGXeDSEyirsNDeJt
X-Gm-Message-State: AOJu0YxQnfVx3la57Ez/uCdqpRqEJOwjF0Og0bhqKYzmw+A/TXptBTbs
	yINRTns9ZIt71rAsSx1N4UrQygZXqOIYk+Bk1gnycjJjK4WkCgPMYJHJReAQjxU=
X-Google-Smtp-Source: AGHT+IF4Owb23uP4IaZsltc9oiRU6sq23tH0PC+Yw0dOc5/Ns9UfmjB52gYnOefx2T6o79mISwlW4w==
X-Received: by 2002:a05:600c:1c9c:b0:41a:bc88:b84 with SMTP id k28-20020a05600c1c9c00b0041abc880b84mr1191832wms.1.1713876230241;
        Tue, 23 Apr 2024 05:43:50 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:49 -0700 (PDT)
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
Subject: [PATCH v3 08/11] riscv: add ISA extension parsing for Zcmop
Date: Tue, 23 Apr 2024 14:43:22 +0200
Message-ID: <20240423124326.2532796-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054351_789867_DEE7A714 
X-CRM114-Status: UNSURE (   9.67  )
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

QWRkIHBhcnNpbmcgZm9yIFpjbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdApiODU0YTcwOWMwMCAoIlpjbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNj
di1pc2EtbWFudWFsLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCBiNzU1MWJhZDM0MWIuLmNmZjc2
NjBkZTI2OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODYsNiArODYsNyBAQAogI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pDQgkJNzcKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTc4CiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNGCQk3OQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDTU9Q
CQk4MAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKaW5kZXggMjRiZjNmYmMwNTc4Li5mNTljM2E1ZWY5ZGIgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKQEAgLTMxOSw2ICszMTksNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFU
RSh6Y2IsIFJJU0NWX0lTQV9FWFRfWkNCLCByaXNjdl9leHRfemNhX2RlcGVuZHMpLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjZCwgUklTQ1ZfSVNBX0VYVF9aQ0QsIHJpc2N2X2V4
dF96Y2RfdmFsaWRhdGUpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjZiwgUklT
Q1ZfSVNBX0VYVF9aQ0YsIHJpc2N2X2V4dF96Y2ZfdmFsaWRhdGUpLAorCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBX1ZBTElEQVRFKHpjbW9wLCBSSVNDVl9JU0FfRVhUX1pDTU9QLCByaXNjdl9leHRfemNh
X2RlcGVuZHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklTQ1ZfSVNBX0VYVF9aQkEp
LAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYiwgUklTQ1ZfSVNBX0VYVF9aQkIpLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHpiYywgUklTQ1ZfSVNBX0VYVF9aQkMpLAotLSAKMi40My4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
