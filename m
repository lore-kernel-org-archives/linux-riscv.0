Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CC2E63C8E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 05:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J2TBmhwJw5adXYNDqnnq4gmGjID819/1IoXXHDi6dPQ=; b=YQO3H0/NbV1P0r
	2SmBL/8z1BHVrXA8MIc/ZC6jXZsE1byHVFypzWcxkcYiLh5aRWGcseyqgxnJFEPSLzHwbX2hGvnQc
	aS5478UI1kfSzguePintACHAgfajWwIeO1hgweuf1HpD9FDnCwlhlmMY9rI+LnwcfSiMGYwpChTLp
	FqOTh4Pe1+vTdSOaVheFOGUedXcvdts5AX+53wP3po3VQWgVArPKXkvWsTm20hyKUUxtZ7MGI9Cgb
	5xx4HRSmY0q6dYg2h5c8mOUw/2AYw3tRr8MseaQzV2lzZhL2EJShOX2EzFSi92d8COvJ5dGwW4WL4
	Llm5HpjMrEKLEkJzlL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjsz0-0000000Asp7-0iRr;
	Sun, 25 Jan 2026 05:48:22 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjsyx-0000000AsoM-0s8y
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 05:48:20 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso1801851b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 21:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769320097; x=1769924897; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIoY9K+e7aVBejOB930LThVJY6pFoCV3MhR4vjbtsmA=;
        b=Na1GeiAmTsPur5RPi/papMLv+Nn8hPDAkPjf6PNL5ougMyuJ16fZr6XpYpN5DPgKvZ
         /xD7rYdNPJiIWuKsIdsze1y1lgtC3tUCnHj4rfKNZoKriwv7ONSmkR0OoKxdkc7SwNv6
         lJFU/G5BZWkgK/SRGtuYWFPxrma1XWJiB1CmGVfOvD7GOVgc9YTe2EXmGFWIS3+lh8pt
         ZeC76B+de3FTeHrgdf97J5EoLCykY5zRMIvZKnfxT9sTdUmlH4EuoOexJ8dOlTuaAumz
         buUPS9ymPOK6gwRbmBEpFcUdHFJ+QKgtmGTstReIY9FF5LvHOkvxkzMz7rnEAZPq0iVp
         /FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769320097; x=1769924897;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIoY9K+e7aVBejOB930LThVJY6pFoCV3MhR4vjbtsmA=;
        b=Vo/dq0DuYA5zFikDc+qB9X7E6Ey2V9lR2Mbp5l7tuuuEqZDj5+yN6G7ad3WqT2j3GG
         i3GIXWZdVrVXq6oRTqLhiPjQ9D27GrySnkDUUzksPdd2bvvXp7Zk73Y/K/SytqVldK7n
         0Y07u9DtqYF0C7C//Xh7/ZzJnw19g7Gv3HbmgMrgXcU683wd7ChDxf6SsX9Gti6ReEAt
         Sf7hwBhbzQE3gfRT5+Z0nGpNVaCG6k/6sHv4fCaEdED3QUVbSzC3exZHwyUSJmF7BFDH
         d0qhx7Ei4aP0czcC+/x8gfevnqYtE0nmhTKmx4gWqU4NA0c4JO4jA0+4Dm5xbKc6hvUJ
         CmYw==
X-Forwarded-Encrypted: i=1; AJvYcCUFB4F8Voc83i7aEK6TI7ppy9xtPl20qH7rBYnETcOJDZqHSvwDZELKwBxyB6GvqS2PvvHrzF4x0ql5OA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuMTx7KHsxNFJo/jPRLbuXVd9n74DO/60SJv1DEUj7mwLINAnI
	jj39GPfHG3ZlWDNvHX0jLXjj38mymI1bh6wTikgLdVZrRRSx63NxDDC0XP8dhej49Sg=
X-Gm-Gg: AZuq6aJxWIGptNB3oSljs6s17wDFQJrzyVENW+iw+l9D9MIwfqGyD5JgDHyCkEnpWgM
	eBDHI+hDoLoNCbhY/xRgHqgFlgqxyncfDp70XxDheGzIwTJMDHcjBGod47zKL6hpM//yrqiUgHP
	d99Nwz+A1HoUVkprgWiUowVRVMcwvcnPuJJjdDUZB999jMqIHX6f6Blhyq0jAVFYCmipCE1NNTy
	0Qx9M2yV2IIov5ab5+k4uC4QmiVHTVpn4TAwspr7HLM3YHNzjwzJMRR0HKhkdwf4RfwTWdK3cng
	kcPoG3ggc84Ci+xK+LkGyRIsZsHYrRfrEEHxj9TtwcH4SeXsHf5FuXG222FGot/zmD8OHATm82O
	EorXLkJ4XatYqDgW7kuboymKEizMqOhWnElSwnDLW8NFRjTSDPGVXp/nwoZb1CT8L5ZlEc7/MMF
	bJagHScg91q2O548fc1qY3Pe6lVEN8+EA=
X-Received: by 2002:a05:6a00:298a:b0:7e8:4471:8c3 with SMTP id d2e1a72fcca58-823412871c7mr690891b3a.36.1769320097078;
        Sat, 24 Jan 2026 21:48:17 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f1ebesm5680016a12.19.2026.01.24.21.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 21:48:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/3] riscv: cpufeature: Add Supm extension id and
 validation
Date: Sun, 25 Jan 2026 09:36:05 +0800
Message-Id: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIVzdWkC/22OvQ6DMAwGXwV5biqSQkBMfY+KIQRTPPDTOCAqx
 Ls3hLXjfdKdvQOjI2Sokh0crsQ0jQHULQHbm/GNgtrAoFKlUym14GUeBG4+7KJUGsvWZDZrcgj
 G7LCjLdZe9cUOP0uI+muExjAKOw0D+SoZz8wVVg84hZ7YT+4bv1llNP4eXqVIRd7ZrijKxmRGP
 x2xZW/cPcShPo7jB0zoiUvaAAAA
X-Change-ID: 20260116-supm-ext-id-826e8da4c4b5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_214819_497904_2E62895F 
X-CRM114-Status: GOOD (  10.58  )
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

Supm as an extension indicates pointer-masking support for user mode
(U-mode). It relies on Ssnpm or Smnpm for the underlying hardware
implementation.

Major change in v2 is added dependency check for Supm in bindings.

As a ratified feature, define a dedicated RISCV_ISA_EXT_ id for Supm.
However, since Supm is targeting U-mode, it should not be added into
devicetrees that describe hardware running privileged system softwares.

Supm is implied by Ssnpm (S-mode) or Smnpm (M-mode). Add parsing logic
and validation to ensure this dependency.

When CONFIG_RISCV_ISA_SUPM is disabled, Supm validation will fail
regardless of whether Ssnpm or Smnpm exist. This patchset doesn't change
this behavior.

Prior discussions about how Supm should be handled can be found in Links
[1] and [2].

Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/#r [1]
Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com/#r [2]

Changes in v2:
- Patch 1: Added Supm dependency check.
- Patch 2: Updated the SUPM id number due to rebase conflict.
           Added Reviewed-by from Conor.
- Patch 3: Updated the Fixes tag.
           Added Acked-by from Conor.
- Link to v1: https://lore.kernel.org/r/20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Guodong Xu (3):
      dt-bindings: riscv: Add Supm extension description
      riscv: cpufeature: Add ISA extension parsing for Supm
      riscv: cpufeature: Clarify ISA spec version for canonical order

 .../devicetree/bindings/riscv/extensions.yaml      | 27 +++++++++++++++
 arch/riscv/include/asm/hwcap.h                     |  3 +-
 arch/riscv/kernel/cpufeature.c                     | 38 ++++++++++++++++++++--
 3 files changed, 63 insertions(+), 5 deletions(-)
---
base-commit: 4af4e95edc37ae54f64cbd75b46f16ce15f3a6b8
change-id: 20260116-supm-ext-id-826e8da4c4b5

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
