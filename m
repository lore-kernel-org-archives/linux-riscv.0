Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB2C369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XjvIu6Yg7HNgTkibli/AwuCFkCQeGipgDuWhS4Ah6E=; b=srgdKyBsFdI6eE
	MMTeQVGdjkr/5lBYhAfpzmmxyi80y8dc1TbYPNMrKV/d2EbBkfgSUbOErP+H0EqzdCLFEF5fPd9Nd
	shD8rviph3ORgKjCntUatKHPWtO7oVKgl4wDtaUMM66IR57SNbAYtUipqZQ7QIKgXqS1Aeqv4+hY6
	/agUn/ocpH+POHYkpZzLDd7gNqaoXQioMyBYnUGKY/6wIMbSuXy/mnnrzzBltO3zxOxThyQCCSNyy
	27qhNW/uuWw7b/9wx5ZAINwDpcVyRMsAv8gC6p8uV6ldYJT8yEI3QsQWsroIjmlQeAw/wuqpvw9P+
	N5gFd5EJVfWxdiUK3cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTU-0000000Cz8n-2ChP;
	Thu, 17 Apr 2025 12:36:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIf-0000000CvhG-2pEA
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:25:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2240b4de12bso10097615ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892701; x=1745497501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIScjDpjhLjkf06YMmBlHqg/pe/+cSuNoY3aF822M2E=;
        b=e3IUqv1NA+u8d3mSgCs5I9e0TNsDjDuTPkWzWYpZdJSZRJTRcBbwQ6R+SWW8odXac/
         eIvTaFNa4+csekPDvxDUaN0rJthdy2NXVbg9Qjiiy2Hm235ZwVOG222/T0hY6KgpJHXB
         msz4Uc6M6fqaTXo0Ulc6xUPMJiHB9HioQj94X2o6e+2UqT5i3D3dhGcfYzvTuQ2SIOBo
         i39YGUK3Nyx7fnVjjgtgtdd4gl69TevXmzZks3TFuGaGM+pFYlSZ09iX9VCOKXVXmPyy
         Uw9WgqHvZL5uKLXFo+fu43pYRZb2Mmzkpw19DyBEdhn05CiL47W0jjd7wnGy8Y+zyfPe
         NwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892701; x=1745497501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIScjDpjhLjkf06YMmBlHqg/pe/+cSuNoY3aF822M2E=;
        b=bAt5WOiloWZ55EN65Pzy5iJON9LGRUZCpyJUGhlQRKqW5U72dHu/P0Kqcq0eHm31OF
         iRmSPkDkfTrrdVigaH0p0UzzSkVdBfr4/m6AqeTFh1ilBzOpUV4pyBpFyeyJo9nIdoAq
         iq2TP68+0ofBX9WdKIT+n6ZgPEWFYiUrJd4s5vfZLuQ6na3Rr4vlMwdztvnbheqgOkIY
         6l3By6JTKMPPx7mBFKMPjjSWxELVqhRKj58uP0KAyaIFMMSKPdaFNDPlaejWF9euMIWy
         SnGtAUKf2v0i2KO5UcvKDoFUF7BJ6kTM8zQDU25qSMCpurSjksiYQ0SGEvWy20jt9/G4
         InBA==
X-Forwarded-Encrypted: i=1; AJvYcCUBZDIiDvIwhdJYmzZjGbkAnlfUf6YkfE1S0TVi6Y+A219CWnhc63UViDG0lYU2YMvH99Hu4I8bygpDHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC6jbaKPwfybz30HWigwQCopuwPILLdozyBlLT3KgJ44qOPqh9
	Ou3iZOnvkJvSW3ZH6Gx1izORaOEjtHLGYZseEtkgRYzwsHtOIahh5yv4torhmoM=
X-Gm-Gg: ASbGnctRiXyq1HzPO0/W7+WgVKn8OhQJv5GiZzsN+uOfbswWMgY14us+7drx+XoBDoS
	Xrj4i4LrOMJu5kiaS0SBq6lhHWEAI/poxQ/0oOqDhLLp4NFpgwBob5Ji+VW4h6e3KETKTRxw1AB
	gL/f61C3cb9srf5zFrtLfhsnHFeis0yIR6h9trgX1OftkJ5y7oX7iYBc1+lijGk7CLuILkbyJBc
	ym6X7hDCIflX0/x+UHny15tGJXeRiuDrrVaL7dRcNfSEyfMdwVxLJxLH1wZ9IOHEj4vRqDn8YE4
	KWKEOySP63nSbH6C6ygrl8FMo2MfrvLnBv1sOj/PtA==
X-Google-Smtp-Source: AGHT+IF+QdSHgucK282rG6JIZxJMqqmRWlCOO1zcFo/iz9JeHV9jdYKxWAUM/FMJsou8iVRkgl5odw==
X-Received: by 2002:a17:902:d48b:b0:22c:36d1:7a49 with SMTP id d9443c01a7336-22c36d17c11mr92045175ad.53.1744892701180;
        Thu, 17 Apr 2025 05:25:01 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:00 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 07/13] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Thu, 17 Apr 2025 14:19:54 +0200
Message-ID: <20250417122337.547969-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052501_709986_EE4D6289 
X-CRM114-Status: UNSURE (   9.74  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKaW5kZXggZmJhYzBjZjFmZDMwLi5jOTlkM2MwNWYzNTYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTM2Miw3ICszNjIsNyBAQCBzdGF0aWMgaW50IGhhbmRs
ZV9zY2FsYXJfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcGVyZl9z
d19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3MsIGFkZHIpOwog
Ci0jaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MKKyNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAkqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEOwog
I2VuZGlmCiAKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
