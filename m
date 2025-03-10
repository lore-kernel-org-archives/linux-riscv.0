Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB72C35FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltngW466mIc/M2lDZ7fhvqE7A3ScDE/VQS8ffu5ynDc=; b=YnGjMTyx0skH16
	Q81lSTamspdJ1J0ff68RMYZrbWac0CFBuI3fMreW5bNXKoYzKDvwD5r4628Mm00OhoQqeQppTyRw/
	cmm2k9RLmEqGNvGcjLsL7iIrFkeVf1Wl5I7YxXJo6GritkiMXR2XqTaeFl7rV4/6z4g3OIlROVoTu
	xFvQ9bL47HJ/RdbweySXTimkwV8rgVgGz1zDQ56QRqEycKwu3n3mOLk0O1oQHvo9ksWEZZTzL4ihh
	Bd+GYJvVeXDRS8OxQLoCA9MpU0iH2l6cpqA9TKOlMbncQ/j0axBwVWBP9N1AOrRY1yKf+Zqxm6Bvg
	jGPFOQ4wSBoHgT1Yqefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLu-00000003FxK-2T0A;
	Mon, 10 Mar 2025 15:47:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoz-000000037hQ-3Nyl
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223f4c06e9fso72941605ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619617; x=1742224417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Radg/O1kYDcS8p0IZNGBH2Vna601zEl7dWErY3x7IKQ=;
        b=3dKN2OS+oWMOrOnfzgSOtxAz2g+QzJYOWD0mnujyBvxyTNSnsmc4l1/GRbvms8tXYs
         LVRnfZ8cTL2p7ycdX4KnHk+ohxJkX2Ut0AxRwCvrUqZktiVwFsrZrqT/flIaUa13A3x4
         D7uEi/rYn/nMQdt+CUIMVF7eZn9ro29qEn0CO2rhh1deaEhST7aN/1bBErST6dy98160
         8otTS2GuMz+gKpj3yeSeYnj31ONWsEiIF4nykp1cRu8zjYeR8/SV/4xn76OOcCJsGN1Q
         OVG1NsjKvGYfTD3Dun/ZOvWHmE0qH6eAvSEeQxoWvLiVUUZF536BVQY3OxC/nujmh3nd
         VO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619617; x=1742224417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Radg/O1kYDcS8p0IZNGBH2Vna601zEl7dWErY3x7IKQ=;
        b=pP+xzDbSE+ociDrN+7RDre1dAMY2/SMGaEeFSbxL45Hh5L+3G2ERXIm8g9BBnRzCec
         GNnKCHlH8s50r10QePBp35nDDYW3gpEmNqkiDPrvT1hTr/Xps0CBY5FU2yVSPZZrvLJQ
         ZXA+BUjgIJPFWobAAXGN6vh05rEgJz7cdvezDnH1FJTN4j0fotHdeDZd2vp8x9BLC9Al
         4s0dGyuHp+DYXeN192Q6k2t9X+AmiUfFjQf3NeHyseSI/x1yiK1qqz4mri/e1q0wfdDB
         T5m+9gbFjdm/VS+EFT6D0SvR8LOIdeBjiwT7HD0F7xJjQwr618Vi4NKYkMjLj0veYefP
         0fiA==
X-Forwarded-Encrypted: i=1; AJvYcCVieF0GSap5o89oy8J8dpe/ZG7UwwdcFFyhkvjnuD5GuM8L3J3PjvIPeD7XC5DU5cM99eG6r2T7k9qWZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCDy4Lj9oUWLIqBvQ8jEuqgyh2aNZ4Kqh0FucYi9hkl3yDMdYq
	DGep0jklpWSRnzuMtEOBM2RPGNj+CG87gaVWgJy0BJUohA6P+pg2Oo2zCV26RFM=
X-Gm-Gg: ASbGncvJFwZZW6hi9jGWHJ+k365qXC+OkTX1oqThdjjsifmeraUGnYLw+9e3AoeDtKS
	zMzWoTJhiR9lt+KH679asVSwD/HBKuEbbtrgVsMQfQJY3PqhPtXmPg2xtl3yJQk4sUvrAjWoGv9
	1VJLPal2FqOCjX/9S52oENyYS/F4p7x5DB191oDBqvZ+hPYxdjdtJ7PWPO8mVnCayFtVGDZDn2+
	x4CrUi72Hf3exDouUwFfigmh6ab3PO0ylPfLR6+vIRvX7u1QjZNPzaeN5BoNpElwOaE1D1mn6r/
	bv2ieFR801XVDlnJ7xXQ8Gfe3lzMveLhGSXkByNzC7NoRQ==
X-Google-Smtp-Source: AGHT+IFYtJx1zpZXoyRZ/KHJTP5G1HNeErNj7hP1Uj5JhhNtVjlp1IKO2nyoOwTegiQflbbotJG7Sw==
X-Received: by 2002:a17:903:2308:b0:215:58be:334e with SMTP id d9443c01a7336-224628603d2mr147459315ad.10.1741619617154;
        Mon, 10 Mar 2025 08:13:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:36 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 10 Mar 2025 16:12:13 +0100
Message-ID: <20250310151229.2365992-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081337_851535_D0237D4E 
X-CRM114-Status: GOOD (  10.87  )
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
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwppbmRleCBmZmFjNDI0ZmFhODguLjdmZTI1YWRmMjUzOSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtMzYyLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQg
aGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAlw
ZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRk
cik7CiAKLSNpZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUworI2lmZGVm
IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAogCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkKSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFU
RUQ7CiAjZW5kaWYKIAotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
