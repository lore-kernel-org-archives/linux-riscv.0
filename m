Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70131C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GW11vBlx2eXYgR5vymUk0TZNsfDwI3341dBOZ8Z7wm8=; b=RFy1tyk8Tyi7o3
	oc7nPoFHRoUWc42JwEK30IToQ+FvcpXQZf7YEeVnLryNDa0AYzaQgwDP7EUvw1aCCtvHlufl4/xhr
	7Imb9Z1TzcRZfR3an1FW9xiIeIl6uFnaKjBDMFh9wIrdLfXfpcB4DPSYTXDBi4JmTFhlkDhN9c813
	Rkj/oZh6JSAVeG+HbeYHO9q5hyBrkBPR+DejqcahitNzln2B39J/E4iLcwA7FLNlbLbQKGb6Iwjjx
	LroqqQVnOj3mXUFuywI+X6bB6b9urf56VapjiYPwQ7Uo61ZgVtfHT0D2r0kS1UKfAaQurisAl3PoA
	JeOIB1EvCTIu0kVqhzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sdb-00000003IVF-1McC;
	Mon, 29 Apr 2024 15:09:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Saa-00000003GTj-2Ex2
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:47 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2dcae31018aso549441fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403202; x=1715008002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQHXVYsUJGkXAyoSx2aDU2oA4c+tlzZFdLvDimlX5cw=;
        b=urJkOKG/BcNdoW9T8aGDQS0OI1WxrKmD6+tpAVjnj27oC38Qc5EqWUuZKWwzjkICIE
         xdIxFiTlFIx5oqMZ57hwjXxULm7to5pwnlsGzwScd6R0ZcWVENjUxLt3jjXBcz8x+dbO
         wGtzN2TSYds6FH1W3DewOlPz3CF0HzefeHZO9YnrnkrMB9JdxJxZYFFMhb7qaKCMJGkF
         jovcgHRUTZo4vmsHVk9ekSDMhCrxl8w+kHRMoK0gvDkj0w0/NlGQWIcOsTbowJpzFIwa
         9Z9wLj/Gbobu6cHceyTUFjF7us0maRs/puHXdVuzv8yUpqnu2ZYw00W/8L10XJE+NNNY
         JjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403202; x=1715008002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQHXVYsUJGkXAyoSx2aDU2oA4c+tlzZFdLvDimlX5cw=;
        b=tCg8vAVQAmlwYA3l4lNQX9RgfsiQp36786060tDXhw9/wltyRw/Zn8DeHlNu636NPV
         QHLVGRIVl4eqb5nenxtUSV4vTIsiZPc2FNWjQgGI/xYlGjXu3QrGYvc1MbObWX9zqDhI
         7+Yke5UGjZKsHEIPo/FUKYy+u1Jl/eonq7FP8FralIXL1pHIftP1LdlF8hjDrO0ZWjp3
         2RtB7cA7BMKRsUhbbfIlrnPMP6jvywjvcvmdyQxZyKVaiiIcOg6lvc3+d3/28vo60b2j
         5W7AMbci5+ryKnd/248idsqWb/QjqBDHJLsva/HW8O8eLCH0Cqh9iOTV3goWzLtsJ+hQ
         loMA==
X-Forwarded-Encrypted: i=1; AJvYcCWeCYIsdSnqR39QYd3XF2ILySOkK9McVmDjfHb9W+OAtUAFmYqm69rcCDl0n0rM5D/s82R8jlvQtii3lS9v6jMJ+SRu64euYCL8wUtQtgKi
X-Gm-Message-State: AOJu0YyiK8UDB5Gf0v1lkLy9LdNg9beqUgxAqTEKQGB29o5sMnx/aND/
	k4Rnlzndozg+bWW4Qkpz7QLJWo5F61gkvnkPF6n85Jarut+PaIHR6kLt9WIluEI=
X-Google-Smtp-Source: AGHT+IF5Vs0aqFA3oJjuIMNqrstrULWJr97uvIHCvJJ63TtvRmaJzQ2/6ase4AtbajSIDHGGP4F5Fw==
X-Received: by 2002:a2e:9ad4:0:b0:2de:1457:9d22 with SMTP id p20-20020a2e9ad4000000b002de14579d22mr7307292ljj.0.1714403200338;
        Mon, 29 Apr 2024 08:06:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:40 -0700 (PDT)
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
Subject: [PATCH v4 08/11] riscv: add ISA extension parsing for Zcmop
Date: Mon, 29 Apr 2024 17:05:01 +0200
Message-ID: <20240429150553.625165-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080644_680924_5C6F5EA8 
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
cHVmZWF0dXJlLmMKaW5kZXggYzc0YmRiOWMwYTlmLi5hY2Q3NDViYmY0MWYgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKQEAgLTMxNSw2ICszMTUsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
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
