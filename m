Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1A2C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60LBiWMvluW9Kl9stvHvSuTcEUGSNNp9sdRxaZsHWKk=; b=HWQ6QkFJGtUsqN
	MCKWXuahWbwRxiS+oyJD2AWFjhDAEHa2uqiZZjIjTAp99mcMljVH/GBY4CRP8nA3T4Ast2L+BQhwP
	LVNIxRdlPErkyoDFkaMUGc/J1yW++mHCf9y4yhiKVBzbxI+GDxx4LRnCFamncqJGKk3o0xpBiVoCi
	TnR7sXBNwwHrcz8mFy4Yn+XO6DM7OPwF6hGkC2SvpTujJEqqCVTfyiAXe7EHvhRcLK2ibuEPJBm4u
	tmLGFeGDQGSnOevWSyocdtBVG4DStIHiJepo6v4x24aAIjOuTmOfQP8RkV4go8jhvsq1HzHXZECXg
	W1+lo3II7qa+uIEE01dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yyM-000000088s3-00SZ;
	Fri, 17 May 2024 14:54:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxk-000000088DD-0x2x
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2e453dc8a31so2586741fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957611; x=1716562411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gKduH3vm4bA8ayteF62cYLjH3IlcFCjaIqG2zMpUYA=;
        b=YHVNSwO6MNc1goVHTL5PL+Ifff++geSNch95s31BdPnwoKMAwg3YlAKgmKAm+pLu84
         WlKCT8eTo0BUhG79Pz06I95OMRP60w9/E5y7kg32QAuDQ3gsprkKaB85TEe8/YR88DTj
         TApdlrjz4f/DIr5sVt8Khm1gafAYxbvFm04mDGUFRr4Q9p8mkTm3bbdfKOXeDendPQBa
         6sob0xj90WXLRdSie4MeWXAYlpmUsffchx3DHHp5TQQuE2fFsWhy+M+t2PvjYpsHo3op
         vQ+Qr6s842+2M21sBJ5Af7O8Q7wt1SEBV+X/v3Spd6PHDwt/TSRLJeLqYU+owh2dkZdT
         Y2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957611; x=1716562411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gKduH3vm4bA8ayteF62cYLjH3IlcFCjaIqG2zMpUYA=;
        b=T/+DjdtEycGYqqYyaOcRVpLiaOx0105sI9ig7VAK9N0i4POw1yCGaZxHSFqmqKUjvK
         3ariXOLzW+8wT6voYvO501AZYZwpt1cLXX4zeonTLVjnmd1PBGacw0zHM6/SC06KLUJw
         IBjKPEx/yFi2qWzrEcVvAZd3alx+b6SQUYuNMX/CuGQBXW7gqmop39DAfmt9G0JDICG/
         WMgIC0MbWFvcRfhG7xJiGYenZxJlsn15dl3vGkO6PEX3ZLUTR/MPPILoTxFZj6ydVUdU
         YqOOqP79WoukXa/vgT3HR1U7RIBxszBFhYcFGg7gPKaAdFE6YOMFwHpeYNombPPTolSr
         +vXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1tM45Nusa4FK5vskv2mNwofc8lVdArRpDSNE4TvV91GNFL4DRgv45wg4dkwJQp8t/7DXJHT/iSr2V1DAgtlUQM/FBTi/GSkl++EE/+Ngu
X-Gm-Message-State: AOJu0YwpJt4G0QqqHiD1noi+U0HthQQcR9/r/f58dIocZQGdHqEhAn5w
	qYy/uhKtxs4vMIb3bxCoySkAQ+9mjlup2gfloi1Hl4r2Dg9Rhz2CUDhz6eSTlL0=
X-Google-Smtp-Source: AGHT+IEoTnwmla6Aw69ILKU9EfBqXp43B9e88SNG9U5yWPM6gqE1tM5+qUVkKG7xDY04SlNYRjnGNA==
X-Received: by 2002:a05:651c:19ac:b0:2e2:18c2:9c8b with SMTP id 38308e7fff4ca-2e51f262c65mr155101901fa.0.1715957611714;
        Fri, 17 May 2024 07:53:31 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:31 -0700 (PDT)
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
Subject: [PATCH v5 12/16] dt-bindings: riscv: add Zcmop ISA extension description
Date: Fri, 17 May 2024 16:52:52 +0200
Message-ID: <20240517145302.971019-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075336_701108_897BA538 
X-CRM114-Status: UNSURE (   8.78  )
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
ZGV4IDM5MDg0YzU4ZDRlNC4uYWNhZDRkOWQ5NmFiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
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
aW5nIHBvaW50CkBAIC01NTksNiArNTY0LDEzIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICAg
ICAgY29uc3Q6IHpjYQogICAgICAgICAgICAgLSBjb250YWluczoKICAgICAgICAgICAgICAgICBj
b25zdDogZgorICAgICAgIyBaY21vcCBkZXBlbmRzIG9uIFpjYQorICAgICAgLSBpZjoKKyAgICAg
ICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y21vcAorICAgICAgICB0aGVuOgor
ICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjYQogCiBhbGxPZjoKICAg
IyBaY2YgZXh0ZW5zaW9uIGRvZXMgbm90IGV4aXN0IG9uIHJ2NjQKLS0gCjIuNDMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
