Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011DEC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLAjDLNSI0dZ5ZKEzLvHxvJ2j4AJMvVjP40qy4xk8NM=; b=2Ntesyuu+SNY51
	EWB5FQMuwOKa8Bn4CZBxLUFjqVxRVN+yvslGvpqBW6/glHJeZmq8q8XDdwL7ALzYMmw9tYV91e+F/
	bLRAANfR/6hK39ZCanT4EbTmHPhJxDniLDrwvYp/We8VDultv8noI7b4prVQqjo85RuR9b6YJep++
	poyVOZcH2AYZFuYHUmRI/cPO0UPmwhqkNz6OAvdJ3YiYDLN1e6VzRSZmQwdnzUiYOE4IJBcZm9OyI
	em8LmfoeRIgX5jNLMBzLrSI0jEC+GAJwqvf9fQSQtMdQ3chDl4/CWumXPgdsulrhdiac14rlr2UK7
	BVJjnResy3YAPED5b0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFWB-0000000HTSO-0XMR;
	Tue, 23 Apr 2024 12:45:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVL-0000000HSi2-3E8B
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:44:13 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a469dffbdfeso125183066b.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876249; x=1714481049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqUXz3P/ILbAY/obovxuw/ulwPrEeHHfsINnJJgombQ=;
        b=kiauy8HdSwMUbVZWP49jiYrrqCWOlY7xQVmQInT1n34Kw51Xmac0p/BiiqB9ynCgzZ
         i5RBULc3fVFVS0E2yJSIb7FVwed2q67xxe/vX393dSL0tmGWXjFGMiLC11ktqfUJwv3g
         /jm1YWAW6Lv3eXBcXuEqH0k21vCkysJBInduQdQP60xwO1XAPrI9wUPu6aIF6TL9LtWO
         uHlltFaSq1iXN/iIe5tip5aJ8krD8ojFGE8uYqk9m3+lnPxg9/sWNNcki09cuR+00BID
         dHERKttR7ttsL41dRKlyuVCP+l/HJF3gW2duBQ0MXFyu7qqyVRtEXxgCOfAEIGWZDB1j
         AMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876249; x=1714481049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqUXz3P/ILbAY/obovxuw/ulwPrEeHHfsINnJJgombQ=;
        b=oFFUBA70cj85yUGK7FFNkeOuJVtnfdYf4f1bPvyINcinRwGpmPyPIqixSDvso4RvBi
         CWeqY8F3bnis6OU8r1MoZs5w23ZnZ5UxkF8N7ug6jiJ/GEnz1aivaj/o+/vjlpxwLz2g
         hQgJa3KNQ84wJhO73cok+TzzpHAp5LZmWvLqxS+ZBIEWHn/qb2pBlwIJUr9Y+LVM75Zx
         BrTCvn86COnT4CKxBTcZK4Yrh4adfiQIxP9zkh14lWxudrs4+C9nnrVXC/Aghfgdui8O
         2f8FlvlnhrSeI7Pfn897tFPT/JPywgD62nsWku7TEQFXyggydQYrMdqJl8c8benRenvT
         qivg==
X-Forwarded-Encrypted: i=1; AJvYcCWt8yGxi0Ovgok3QqPmfzbzPmk0xHBK777j7rw7vhJKH/kth7yRrf7bIrDKIwAyhCO18EAAvqTQJ1F5WklnpYdDBwxBff//TGtFpRai+7kv
X-Gm-Message-State: AOJu0YwNN/uRW0ys/C2K6bX1M3efd/fU6oaL2vLCeRVS6eiKSyP/oZ5m
	X/qo3FkoNLMCiXgD7NN/Fo+UZupXERMjbWRRd6tedg+55kkN8jsMWao5n5LPJvk=
X-Google-Smtp-Source: AGHT+IGYD6R7lCuFXcFn1CiEepxwRzLgpJssX7t6iPTjHzI3S73/lLM0TpTesKJAZsPqOxcquQWylg==
X-Received: by 2002:a05:600c:1c27:b0:41a:c4fe:b0a6 with SMTP id j39-20020a05600c1c2700b0041ac4feb0a6mr1112456wms.4.1713876229210;
        Tue, 23 Apr 2024 05:43:49 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:48 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/11] dt-bindings: riscv: add Zcmop ISA extension description
Date: Tue, 23 Apr 2024 14:43:21 +0200
Message-ID: <20240423124326.2532796-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054411_892942_98D07DA9 
X-CRM114-Status: UNSURE (   9.02  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmNtb3AgKENvbXByZXNzZWQgTWF5LUJlLU9wZXJhdGlv
bnMpIElTQQpleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGluIGNvbW1pdCBjNzMyYTRmMzlh
NCAoIlpjbW9wIGlzCnJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNjdi1pc2EtbWFudWFsLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpBY2tlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgICAgICAgIHwgMTIgKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCmlu
ZGV4IDgxYmNlNGZhMjQyNC4uMTk1MmQyMGI4OTk2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKQEAgLTI1Miw2
ICsyNTIsMTEgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIG1lcmdlZCBpbiB0aGUgcmlzY3Yt
aXNhLW1hbnVhbCBieSBjb21taXQgZGJjNzljZjI4YTIgKCJJbml0aWFsIHNlZWQKICAgICAgICAg
ICAgIG9mIHpjLmFkb2MgdG8gc3JjIHRyZWUuIikuCiAKKyAgICAgICAgLSBjb25zdDogemNtb3AK
KyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaY21vcCBl
eHRlbnNpb24gdmVyc2lvbiAxLjAsIGFzIHJhdGlmaWVkIGluIGNvbW1pdAorICAgICAgICAgICAg
YzczMmE0ZjM5YTQgKCJaY21vcCBpcyByYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlzY3YtaXNhLW1h
bnVhbC4KKwogICAgICAgICAtIGNvbnN0OiB6ZmEKICAgICAgICAgICBkZXNjcmlwdGlvbjoKICAg
ICAgICAgICAgIFRoZSBzdGFuZGFyZCBaZmEgZXh0ZW5zaW9uIGZvciBhZGRpdGlvbmFsIGZsb2F0
aW5nIHBvaW50CkBAIC01NDksNiArNTU0LDEzIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICAg
ICAgY29uc3Q6IHpjYQogICAgICAgICAgICAgLSBjb250YWluczoKICAgICAgICAgICAgICAgICBj
b25zdDogZgorICAgICAgIyBaY21vcCBkZXBlbmRzIG9uIFpjYQorICAgICAgLSBpZjoKKyAgICAg
ICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y21vcAorICAgICAgICB0aGVuOgor
ICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjYQogCiBhbGxPZjoKICAg
IyBaY2YgZXh0ZW5zaW9uIGRvZXMgbm90IGV4aXN0IG9uIHJ2NjQKLS0gCjIuNDMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
