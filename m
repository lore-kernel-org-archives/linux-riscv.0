Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB057C25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKr5L4WYtw73/8CLAdgvDeRRERO7I+Yb0vAF5ydJBqs=; b=S5nNnwUOBSEFNB
	cwDh8aNVWgP9ezBEW05TYrMrGmECZZ8zWd1GGavKZJFEscZLiS4teki4vXxGAGksJ4biNVKKzugqk
	DBcaJ1TTKZv6UOLKoJ10aEeLlOV6qSXW4goVhquvT82UhtZ2klmpZTpaTFg+mnxFHZzG2RU2IhHzS
	2YgGJr2RQb5jc5kBAK/ZwSBREHYMPHJjZSOoL4fbNGWpSHEBDL1vzBRXQxjnm7FWCyY4IWpQcs8C/
	kJjdsbiat7JpxcNbVQoO01ynETbQQ1FPPWbXulYNbLDXx//J4pVtOfJv4aS2hyrSJAm8xn4wI6FgY
	rNxC3M0E7VZTVGiZtihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYm-00000002LOd-1WHz;
	Tue, 04 Jun 2024 12:46:40 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYi-00000002LKs-2exR
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:46:38 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6c9cd96e485so313644a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505193; x=1718109993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH0bMsHD4vaf3RN6eECK/cSeWYzW9s54IHrYdJwEDyo=;
        b=N8eqxSi8cFCdszz2dERjxCjWXY9zm2jNqSDp8RR4FR+p8Gv2z/uvtj/CvEAPBzuc7d
         P64gdjQJvSbrtGiKiOaLtHrLxZFVggwFjsB+b/cpqjG5NobCICYlTw2T5t+JqNj8QmIC
         OcgmuJ7/NnFHtI62MJII164zbc9L9ccCnklfeBHrqSd2qLhCdgXdi2nEbs11OurbiSeL
         awtS2qPitUI4rc9bnVFmvIMZTDqfzyjnQS6+faKQR0AuQDN9oYXH12klqS/W7RhVjlcH
         t9zVuDP0w0kPJyvsMjFrJlUv3prvJxZ5NZRL9ouenA5o8/6H9c5DE2ZpNPIiQSnspUmA
         nCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505193; x=1718109993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH0bMsHD4vaf3RN6eECK/cSeWYzW9s54IHrYdJwEDyo=;
        b=JxA91Lwur7FxyJLuLoIt08brfCZY6hjnQWAGnCOBnGeOBh2da5GmzIuCcvsq/ZQ9P3
         gPj6mqT6G3CBXGgpA8q/w2jDcQ50UIlTcBb6y3Ot9kd56k+fs6EZpEwGj5FfORUpH97A
         K0lkKdhMw59G237x4pcJfrN7Bxam5k9/vb/gBt8tm6JN3pfNpqf7mqvHiY2TP/MXZCFC
         vHImT7KYj6xcN8Qs2d2KvR3z2Ff8xMq1yy1bziGiZbiK0oVNZlVv2e1h0PWr2IWWVhI+
         McX4UyokT6QSYRypSEKbUqbCqbB2oE4+jBa2f3PUhsAVKJX27Wuz3GYc2LqRsb7g64VZ
         qTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXluILa2UjtGDQroySPpEfXFWwkOVv5Reh2oah9J1MY1J+3d02cLyDuibgSULn6DcTk6dtvtJuxgy/1oPmzofhge+Ll5PSRFLRkfqGx0FjO
X-Gm-Message-State: AOJu0YztPnnCYgWuoMq3b46fgSvkmcq5aHJ7PlfHa669B4cOIrPmwu12
	YbR6jsL6lFiUWfJDktXXACLVZfFrCJJapsFKHbaLuv3oNpOx7blqN6H+nQIapZY=
X-Google-Smtp-Source: AGHT+IEcDwjJyY3zBUf22+Q+de7qq4n7Qn6IlYomnDRBzOkE4B5z+4AhELmoSGtibPGFsq4xo3mqwQ==
X-Received: by 2002:a17:902:e5d2:b0:1f4:962f:e006 with SMTP id d9443c01a7336-1f693dd486bmr22891645ad.1.1717505193034;
        Tue, 04 Jun 2024 05:46:33 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:46:32 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 02/16] riscv: add ISA extension parsing for Zimop
Date: Tue,  4 Jun 2024 14:45:34 +0200
Message-ID: <20240604124550.3214710-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054636_716235_35C7914A 
X-CRM114-Status: UNSURE (   9.68  )
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

QWRkIHBhcnNpbmcgZm9yIFppbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdAo1ODIyMDYxNGE1ZiBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAx
ICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CmluZGV4IGUxN2QwMDc4YTY1MS4uNTQzZTNlYTJkYTBlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CkBAIC04MSw2ICs4MSw3IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTwkJNzIKICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9aQUNBUwkJNzMKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YQU5ERVNQ
TVUJCTc0CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklNT1AJCTc1CiAKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9YTElOVVhFTlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCA1ZWY0
OGNiMjBlZTEuLmJkMTU5NzU3OGZiYyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjU2LDYg
KzI1Niw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtd
ID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludG50bCwgUklTQ1ZfSVNBX0VYVF9aSUhJ
TlROVEwpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhU
X1pJSElOVFBBVVNFKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhwbSwgUklTQ1ZfSVNBX0VY
VF9aSUhQTSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemltb3AsIFJJU0NWX0lTQV9FWFRfWklN
T1ApLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphY2FzLCBSSVNDVl9JU0FfRVhUX1pBQ0FTKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZBKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKLS0gCjIuNDUuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
