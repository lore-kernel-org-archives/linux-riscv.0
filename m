Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDBDC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 00:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iKgYZVDGXmdsCb/8aDdUIyByZ4Qup0KtafYJhQpp73U=; b=koJC2PMNCRMl5A
	YnDgnLgdGNYWaVk5GPevOXhthAjRm+j+hZf2Fa0pZ3ajLe3K2dxVh5S3QQ8ydUcbunAACu1uH2RYu
	6ZE3t5slJls2XsFJ9M636nhLDvV7Q7rOBOIfyM2LFRGHAH3rx/qjOCYqxvMVeM3ZUzpLT/LHcVARi
	/dAMl3ZaGRkcypiP0rEtYOVnjEBcrzH3BPt9Pd0G2DYMHezHw786SWLBmtzfhIZebjPDTC4XzzXw3
	YBa0DxwDd7CMHZHScmW7SWQIpSoGfKOGdmsKXQlKsDObMtw6uyEjJShzRYadbdyOidr9u4BBlv7EF
	LZeUDt+OaqnbNwOQ9MAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUc7i-0000000EiFB-3yB7;
	Tue, 30 Jan 2024 00:37:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUc7f-0000000EiAp-3dRJ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 00:37:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d8e1f0be53so9390565ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 16:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706575023; x=1707179823; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5TFMd8ZeRyjiOalUt16J2vr2THoaCcjjHoXH9jXrtYQ=;
        b=bY5M2OfH+wutPZDICIJrvY8UXAfKPZrbanN27wFmsV0r3hIQdXjq1udVmwgWYvKx7g
         NXwELaqciH/lcwiTn7diJ4d/cp0WTqIz1/l3A1eTpj1fp6UtaR/gYWtizobl1u8tkaRU
         eDZodNQlc3lIaoUH9X2HH+WqUdNyoGzunZmzS190ufNTl25noZW4ICn2q27uLqGsv5Dm
         J1wC75OIIqjXeSc7cklIRCuEvGKm/gBjsXMoLlY03/Ul60jjVEpSz5eqtmKxvrgEn0VE
         cd7X7bHih4x1ZzZ7QmnLXDMii6lm7H1Ny+skYf/D7yaq6E2+o4PaWMvw7kkQGnAexLiK
         +sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706575023; x=1707179823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TFMd8ZeRyjiOalUt16J2vr2THoaCcjjHoXH9jXrtYQ=;
        b=AxZLPf8AjqvkU4StWRVAegFrFsaWY4RuTRgXgM7r0QhU+l/wsRKddRCaANl4nvHWE/
         xkXzEyf5Rq8qI2O+cu+5yO+6XV7QnKlh3T+EUZRiZJD3tg1oF81EfWs7I1XNXRX/HQ2h
         Qxjytm1ecq/b/rqiPEsN5D9AiMWDjqjeukffvWMSMKhJIUYAhRnTQEmy9IBOuUCK9rn0
         bkM+Hp8mXkNDRaDMCvrjauhCCC8Ga5XSKXS7DylgfeJTFQT6Y5QuS+vyAivSYulFk4fm
         yJ/HqcdWlsNMx2vzbYnpo81HUo3B8j4TU17czq6st1e5fZx5biXDUI9uJ5S8aAx/IQcV
         GqJg==
X-Gm-Message-State: AOJu0YzLO3sSq9NX7alShlWYY+fmtUdV0pRqqXiaClq1R5WWLU8xopYb
	0CYBqjmvOFurbBXuA123Tv0ZpTickGNDLsCy8ftxRkIuzPJFdpPqn9OCBxtTmM0=
X-Google-Smtp-Source: AGHT+IHouZt2X6rfsHSDuKVQG7Dio6bVc//7RWirBkJAX25H0ZFFwPSk8rVRv3/4TN3qfd8Wnl5X5w==
X-Received: by 2002:a17:902:784e:b0:1d7:8cae:a5dc with SMTP id e14-20020a170902784e00b001d78caea5dcmr5649574pln.62.1706575023239;
        Mon, 29 Jan 2024 16:37:03 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jb9-20020a170903258900b001d8ca3f5e3fsm3406375plb.295.2024.01.29.16.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 16:37:02 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/3] riscv: mm: Use hint address in mmap if available
Date: Mon, 29 Jan 2024 16:36:59 -0800
Message-Id: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKtEuGUC/3WNQQ6CMBBFr0JmbQ3TYBVX3sMQAmUqs6AlHWw0h
 LtbiVuX7yX//RWEIpPAtVghUmLh4DPgoQA7dv5BiofMoEtdlYi1egq109TN7ch+abthiCSiXO2
 qHnvjTg4hb+dIjl97995kHlmWEN/7TcKv/RW1/lNMqFAZY3u6nF1VG7pFTkHY26MNEzTbtn0AV
 UJcAr0AAAA=
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706575021; l=1216;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=MBqHVwDGuAF644QBUmaFqas8tYpxSS6yi6tIOOSWm10=;
 b=SN9b/QxznrtxHxm3ihKTSgB4jNcs+2+HV3KevBEHBaKKAz4WEk+1+qsuWzkp9ngsCRMawSo8o
 YPZH/hcRVIDBnn80q9dZ2Jvt9xuRib+yzFFyol5U3cR2ZUpagkqq9Ib
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_163708_187092_BB2E9E25 
X-CRM114-Status: UNSURE (   7.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On riscv, mmap currently returns an address from the largest address
space that can fit entirely inside of the hint address. This makes it
such that the hint address is almost never returned. This patch raises
the mappable area up to and including the hint address. This allows mmap
to often return the hint address, which allows a performance improvement
over searching for a valid address as well as making the behavior more
similar to other architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (3):
      riscv: mm: Use hint address in mmap if available
      selftests: riscv: Generalize mm selftests
      docs: riscv: Define behavior of mmap

 Documentation/arch/riscv/vm-layout.rst           | 16 ++--
 arch/riscv/include/asm/processor.h               | 21 ++----
 tools/testing/selftests/riscv/mm/mmap_bottomup.c | 20 +----
 tools/testing/selftests/riscv/mm/mmap_default.c  | 20 +----
 tools/testing/selftests/riscv/mm/mmap_test.h     | 93 +++++++++++++-----------
 5 files changed, 66 insertions(+), 104 deletions(-)
---
base-commit: 556e2d17cae620d549c5474b1ece053430cd50bc
change-id: 20240119-use_mmap_hint_address-f9f4b1b6f5f1
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
