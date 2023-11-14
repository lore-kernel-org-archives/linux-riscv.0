Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551FDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jt5noykqg0XHxyKSIJt52muT9D92eKgM3bjJWy9RS4Q=; b=L5SJVPactfe8x8
	fRIQyYdWeDI+T5eJ7Tok6eSvWRZ/1fBC0v+PnI3ClLfEdPhXl+C13IT0afNBAcwNWhBgZA3oBOare
	hRpMOhOpOt4B/cxuhbMWGa6e7U8eHPAb0TdQhe9wN38iGiMpOOOP7kCppEs7ll78Y3y9gKCYDJh3G
	/6SMqCDdVjCc82eE1UDZtXQFuH07X6dpMtR6qdj7zHJoa5KHBksFmrVTpsGCeb4XANms4dZmVCHQ1
	MWwK3HcIhdZlTdChFggszkmpfktSCcB/1MomS/wPJSlh2XCwPrdIn0XXdDZWBXk2rHhSSzHsZh07u
	tzXhswTBQIzcH22wA5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2v8X-00GHYC-2V;
	Tue, 14 Nov 2023 15:15:33 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAu-00G93b-0V
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:57 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-779f81223ebso9062985a.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971230; x=1700576030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5yYxDd+9V9reUvZ2DQpNcNkqEc4BDOdQVkeYdlaxbs=;
        b=LnN2i5jYaUpBkT9m2Xql3E0ioTPw2L8rlVwD0fDGhdi7xG5odHuGPjgTVXsDdeVLrW
         cXtlIu4HrieaJcDMx33lyPXNPdWGMBS8EdNYKFSqmuKJm1QKgUYsB/GnabNenrpXOXcr
         vAeMtzbAD78iBBfDu9ml2pyQK4zjiFDbFYkNxwQWG6Uz4KR4sk8TnHO7S+Qa0NWm8GII
         pIw2dJ2nMqL74UDD9DejwB6q7/cO9GKRg6gTmeGUP//wOyfhS2Pn4GIshvQlmj3kA/2w
         yh42oN62PvNZs9ynhxbiwdIro1Q5N+wCVVX6xDiTGFhJMfX3dO2kl+4RbKcmvxMtH4pj
         OJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971230; x=1700576030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5yYxDd+9V9reUvZ2DQpNcNkqEc4BDOdQVkeYdlaxbs=;
        b=J3UpkL6bGLS8RaLagdLNTXD0AiyiLKncfRORiwnpUWCr4XM4lip7c5Ja6JsbgkgMSW
         BZtUZg6vAxQFEyq+Bih9v/54RXnmIQe4TtEhkRfnbsrlsGhSkomiPhET5gNEuiQyKidm
         szxy0pbc2QDqzy1OCYJgQFJtR0kiJ2jFuvlc6gtyBFO4hq3zkpVRfHBm332Q6gsk16zd
         MCT0QkcLK3jpl0UN82lnf4Okqld/CsJ9E9k/b5Mler5sGWDcuGMWCYeDrvVv0UfBGtr1
         7MSFCl26Y5Ivil09RC+tdzyB4yZ1jZYjpaIgzAJ6bif/HW4VOB30H2zSBTqBzWM30nLJ
         1T+w==
X-Gm-Message-State: AOJu0YwINK9ma4l1zmS8tql3FAIq5/L+8yFmcQuiMVRiaw+pucUPnTGF
	znMkHsVJtx9iwOfnMFwxlJU/GpqzyKXBlAYd+20p7w==
X-Google-Smtp-Source: AGHT+IFptxx2Guy0DQYVfc+KvtPdCaNrZCEFFfEn6l2iik1hGkFfOg6ndZjt6u/AUGRVAMsa0MAFtQ==
X-Received: by 2002:a05:620a:370d:b0:774:17d6:31dc with SMTP id de13-20020a05620a370d00b0077417d631dcmr2397859qkb.4.1699971230375;
        Tue, 14 Nov 2023 06:13:50 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:49 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 14/20] dt-bindings: riscv: add Zihintntl ISA extension description
Date: Tue, 14 Nov 2023 09:12:50 -0500
Message-ID: <20231114141256.126749-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061356_263075_A7898045 
X-CRM114-Status: UNSURE (   8.35  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBaaWhpbnRudGwgSVNBIGV4dGVuc2lvblsxXS4KCkxpbms6IGh0
dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMTNfd3NOOFltUmZIOFlXeXNGeVRYLURqVGtD
bkJkOWhqL3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwKaW5kZXggZjNjOTllNjk2MTliLi5mOTUzYzQ5YmU5MGQgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbApAQCAtMzM5LDYgKzMzOSwxMiBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgVGhlIHN0
YW5kYXJkIFppaGludHBhdXNlIGV4dGVuc2lvbiBmb3IgcGF1c2UgaGludHMsIGFzIHJhdGlmaWVk
IGluCiAgICAgICAgICAgICBjb21taXQgZDhhYjVjNyAoIlppaGludHBhdXNlIGlzIHJhdGlmaWVk
Iikgb2YgdGhlIHJpc2N2LWlzYS1tYW51YWwuCiAKKyAgICAgICAgLSBjb25zdDogemloaW50bnRs
CisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmloaW50
bnRsIGV4dGVuc2lvbiBmb3Igbm9uLXRlbXBvcmFsIGxvY2FsaXR5IGhpbnRzLCBhcworICAgICAg
ICAgICAgcmF0aWZpZWQgaW4gY29tbWl0IDBkYzkxZjUgKCJaaWhpbnRudGwgaXMgcmF0aWZpZWQi
KSBvZiB0aGUKKyAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51YWwuCisKICAgICAgICAgLSBjb25z
dDogemlocG0KICAgICAgICAgICBkZXNjcmlwdGlvbjoKICAgICAgICAgICAgIFRoZSBzdGFuZGFy
ZCBaaWhwbSBleHRlbnNpb24gZm9yIGhhcmR3YXJlIHBlcmZvcm1hbmNlIGNvdW50ZXJzLCBhcwot
LSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
