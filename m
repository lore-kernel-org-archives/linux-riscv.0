Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E9CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9V+axbbwj7bjbbOCaNr0tUMoJjvkcRsVYOobblwF7rA=; b=YF/Vo58msgK1Dn
	YKihFysG1TRZfF6dd553WDkJqAWkllzgHyZm4P/1fsTrRFFIgkSmNErtKVw3Z4AMDVJL513CfWLJB
	8WWY6Z3qfhYLHYNWJyOeK9pLFrrWtWKrkx3juhhWivXPoPaa27pvpHL89lrB1n1khNbW8tlbbRoy3
	scsMmlL4b7Fb01zWVJ+Nult4NiT80cHGeyKix+jM275gX0xUiPu/0ly0F+yWF6hoJ/SEd1TVqAMcw
	bkwyZMfpj9hAG79JCx9XY+2S29hcFyFseECcuxo+kOPrGBh73I1R6PkFanqLEtN8LyvW17GjnYere
	98+Mfi3YP/XOzIQpOUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzF-0000000639v-0nGX;
	Wed, 10 Apr 2024 09:11:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTz7-00000006326-1czC
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:15 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-345606e8ac0so589022f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740270; x=1713345070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9SSkPjIJRaiY6nqvP2nXREr1dqNKWljAWGAyK7z7Oro=;
        b=bSe7kzegkFEedB6L12hakcSAV8DJUNN9JmtTqaoq7wM6D3G/YCpZtQ0NheVq1ukeAa
         u+7hWu77A/FqTue0tAuh2JBA/3YcLjaQ4Zf6QElulYJy8kSGcGT6rNtMiyG45H9sd5Sc
         bFAcWFu7PQk7mAV6wZaD/8NpVgzrm1OEZO5psEi6BO+qrmEQS32VIXUPhGF2bSDWYEiP
         qjMAm2VjMydFnVPyxanwiyQkN/mMmc/Dn7C2qwESI2zPG/bw2BLnHYnuAzGcgQoBN1n2
         8fOhoPRRlkANEchTXx7FUT9b0g+yovN9cDjPCGTohNQMVkWE2mwRThPix4lLGUZJZ/jj
         DZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740270; x=1713345070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SSkPjIJRaiY6nqvP2nXREr1dqNKWljAWGAyK7z7Oro=;
        b=puRNeK7OT4wOfqtwjF730PUBWXtxpPib+3hxycqLNvSrWgkNuD8RgfMBXLsazc9dxZ
         tqHBxBFyHiwhdHuSq7ImfMsLUXq3MHAVasMHb9ow9hyPag+K/rRaWSk8+Tc6d7m3UBY2
         YZNLHCZrc/yn81BEdCA/ZeE8Y29RcjNssRNUXYue6cDrfI5sU8KV2aThdvUdO0kxQ93n
         ecJyD+tha23TgPkRG+3Rt7ztZSi0cqrZRaSX34YDL/X6jNK2+HTwayH4pdbgE2F9jIcV
         ThUea+wtxhoeOwWJ46d0ih8kd2D4uYznYkDwsWf/MvF5pJaGhcQQ481eGr1l3mKkngzw
         mhZA==
X-Forwarded-Encrypted: i=1; AJvYcCUV89+rmDwmBH8ar+iLT69us5NNJ6iammmld0FQrzDoRXyqFV1IftqHKOEictel2UkUWQtPjq21VPjzTa4OwUEbnqX7jGYZCT4aqjVwMT5y
X-Gm-Message-State: AOJu0Yy+ASJD+7oLaFax7ysr9uqnzJo2yT9aLrVO5uH034nL8bLFR9Pj
	LihBpQFL7nSlUZYnsWrP5s5HPVg6Zn+q2woGAs2D49KCaBHW+ltQA+HoMJIY3V0=
X-Google-Smtp-Source: AGHT+IGq6GULyAjPCGB9cLzSRwOlrzNIJikNMv8sgGSqEmo6q9aRp4LbhqVra1QQcW7xHav631ZdHA==
X-Received: by 2002:a5d:4a52:0:b0:346:500f:9297 with SMTP id v18-20020a5d4a52000000b00346500f9297mr1449075wrs.2.1712740270397;
        Wed, 10 Apr 2024 02:11:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:09 -0700 (PDT)
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
Subject: [PATCH 00/10] Add support for a few Zc* extensions as well as Zcmop
Date: Wed, 10 Apr 2024 11:10:53 +0200
Message-ID: <20240410091106.749233-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021113_585747_BA5DEC37 
X-CRM114-Status: UNSURE (   8.38  )
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

QWRkIHN1cHBvcnQgZm9yICh5ZXQgYWdhaW4pIG1vcmUgUlZBMjNVNjQgbWlzc2luZyBleHRlbnNp
b25zLiBBZGQKc3VwcG9ydCBmb3IgWmNtb3AsIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNp
b25zIGlzYSBzdHJpbmcgcGFyc2luZywKaHdwcm9iZSBhbmQga3ZtIHN1cHBvcnQuIFpjZSwgWmNt
dCBhbmQgWmNtcCBleHRlbnNpb25zIGhhdmUgYmVlbiBsZWZ0Cm91dCBzaW5jZSB0aGV5IHRhcmdl
dCBtaWNyb2NvbnRyb2xsZXJzL2VtYmVkZGVkIENQVXMgYW5kIGFyZSBub3QgbmVlZGVkCmJ5IFJW
QTIzVTY0CgpUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgWmltb3Agb25lIFsxXS4KCkxpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNDA0MTAzMjU0LjE3NTI4
MzQtMS1jbGVnZXJAcml2b3NpbmMuY29tLyBbMV0KCkNsw6ltZW50IEzDqWdlciAoMTApOgogIGR0
LWJpbmRpbmdzOiByaXNjdjogYWRkIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBJU0EgZXh0ZW5zaW9u
CiAgICBkZXNjcmlwdGlvbgogIHJpc2N2OiBhZGQgSVNBIHBhcnNpbmcgZm9yIFpjYSwgWmNmLCBa
Y2QgYW5kIFpjYgogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmNhLCBaY2YsIFpjZCBhbmQgWmNi
IElTQSBleHRlbnNpb25zCiAgUklTQy1WOiBLVk06IEFsbG93IFpjYSwgWmNmLCBaY2QgYW5kIFpj
YiBleHRlbnNpb25zIGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNv
bWUgWmMqIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKICBkdC1iaW5kaW5nczogcmlz
Y3Y6IGFkZCBaY21vcCBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0Eg
ZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFpjbW9wCiAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaY21v
cCBJU0EgZXh0ZW5zaW9uCiAgUklTQy1WOiBLVk06IEFsbG93IFpjbW9wIGV4dGVuc2lvbiBmb3Ig
R3Vlc3QvVk0KICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaY21vcCBleHRlbnNpb24gdG8g
Z2V0LXJlZy1saXN0IHRlc3QKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3Qg
ICAgICAgICAgfCAyNCArKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbCB8IDM3ICsrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAgICB8ICA1ICsrKwogYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaCAgICAgICAgIHwgIDUgKysrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgfCAgNSArKysKIGFyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8ICA1ICsrKwogYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYyAgICAgICAgICAgICAgIHwgIDUgKysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1
X29uZXJlZy5jICAgICAgICAgICAgICAgICAgfCAxMCArKysrKwogLi4uL3NlbGZ0ZXN0cy9rdm0v
cmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgMjAgKysrKysrKysrKwogOSBmaWxlcyBjaGFu
Z2VkLCAxMTYgaW5zZXJ0aW9ucygrKQoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
