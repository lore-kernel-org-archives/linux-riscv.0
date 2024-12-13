Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3225E7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 00:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5aIugfJb0c8pVPN0pWvHDr26KsrAB73MoLjba0mG4p0=; b=b0tj+a2OJmyERs
	3x57qd1mbbN+S01sB13QX8fewCixc9eiD9DB7pH3yCl6oHI+88ndiNMPj9XilKsRRvfSwndwMfV9x
	GWGggrpuh9PXAuw4TcJV0Idcdb0vJD50CZdiKTG5ilpl7Ob8Q8gVqAU/bWLyMsaXVVvVkvG835AsX
	MdB68zC/KHT9Shsqpt6j9le5XpXnEI2MrZ5raXJstiJuNMbvpyDnm4fj9Ym6p9Rcnf0nxpdQYAQrV
	1luKmL9H+/3aQLxvkfvg28RJcSdUcrPJ4hH0a2JYw5WyD1QIJial60oVluXOBdjX1BOTK3doixuJZ
	1smyluS+UyDcESOZa/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFb-00000002FmT-2xmi;
	Fri, 13 Dec 2024 00:09:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFY-00000002Fkw-06JH
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:09:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7265c18d79bso1348604b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734048583; x=1734653383; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi3tuGJpo/rfMiWH0BQDI1m0iie42CjFIyvVnonkPTw=;
        b=CYPQ8f3KQpUhnpHXAubaADIT5dMWoQ0tPtWRsumnjmPhR3D4BGj1zXWCb1YX73EVCd
         SnyDGH8Op4ml04f2XSgfZq08BXgg7BlmB0TRwo5CS/Ny2pT8/vwJ3MvJbm7K986uITqa
         rVcMYxI0w6Aaxi22313EbJS6grFGqTQa5r56h+GhnOgzdyPiR54HjzjKionlzCEUlKxe
         X/G8J36yjAQ1S8QVycCrIg49FooFPOHTyo9vQZuevZ7VG2ukNT0IhI/RcvZfz0ELPV3M
         iwKt71d/ku48qS2GKQI7nW97RkCOW8IoCKnKH65270c4j/9BH8QRZjPePLieqVjg7Xot
         FLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734048583; x=1734653383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi3tuGJpo/rfMiWH0BQDI1m0iie42CjFIyvVnonkPTw=;
        b=w794gBtLtoaikjs5sHwM3Bcdt+I/s+mOi/mmk0cwmAWzEWPVUXXrzJ7HiGnqcBnM++
         kVpGJ0OcnN+vNS6ILenUVimOogm0f1sGiXBjZdLjeMHLw9KXgCuqefUAxlbhgYQrKYqu
         /rbiVZu8NdUUPcfCfMdL2LUDvRGDoVu3IQnTdgshjQd4bFJAlVj5MFqlC/9i0mGq4/HC
         48eAFjkae5IMagL0FDzfU+LGAZPrjtTCVUuigyC/Xy1Q943mW0KVNOvVAoJyXIQBwf3w
         eFDi7zGcCzYPujCVqsfRO+qyu4HhjPwIazxLzrpJvnuNVjUhAzi23vtKfDp6FNC30e2Y
         i1dw==
X-Forwarded-Encrypted: i=1; AJvYcCU+3vDdvMa3hQ+VW+a4GPRdZU4uMn0QvXZo//RClQad8CJV4NncjIrQl77z0XKUZNMkIX6fe21870b3zA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0LAuM/RKm4fq/uaxtD6o4f2zEjllknivF1FWas7117L6H7wi
	BGa7kRJKiI3lmyu68ECOGjg4z2yLHiB+LFFTq+bS0CtbYDjkS7YAfFWvbUVC/Wk=
X-Gm-Gg: ASbGncunZzQkFsxt7ae5Q2g9LeGlWer5O0YfODXPP3vpcC83UkAHdgok6B9tAyA7b8h
	f7EwMfspZHa4ezk9eWESW7ZJbacR/mERtjXMnE3zU/B3U6sWzygavjtoiL3DG0qHeADrkMbz4yz
	ttbj0hxySYDpf4XQA4lchDyJA57QXdrsyUEBOgIQSg/kzOCtqG8FeVbCxp6AmqOusLbtu28OvDJ
	Pd4oraMaMRipTHKQImRITPd+FhAAKjR1TsKwbw66vXtqMXv/dZ32zBuLuXIRj+7+WGmRQ==
X-Google-Smtp-Source: AGHT+IHlKxnMQX6RMj7z9YA7s0otxhJXTIs1jwyScxFa+NZs2HrzWHf7CwoOpIR95MIDKYBY/7Lzrw==
X-Received: by 2002:a05:6a00:2d8d:b0:728:e25b:745 with SMTP id d2e1a72fcca58-7290c1b0f5amr802857b3a.12.1734048582736;
        Thu, 12 Dec 2024 16:09:42 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f0a0779dsm7441455b3a.154.2024.12.12.16.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:09:42 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/3] SBI PMU event related fixes
Date: Thu, 12 Dec 2024 16:09:31 -0800
Message-Id: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADt7W2cC/12NwQ7CIBBEf6XZsxhYaQye/A/TNC2sdg+FBirRN
 Py72Hjy+GbyZjZIFJkSXJoNImVOHHwFPDRgp8E/SLCrDChRK1QolvnZUya/9nd+UeozCnvS4zA
 apREdVHGJtHfVu3WVJ05riO/9I6tv+puT5n9OZCWkcKbFloyUZ7TXyDkk9vZowwxdKeUDiFoqj
 rQAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_160944_335233_A676D047 
X-CRM114-Status: UNSURE (   9.52  )
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

Here are two minor improvement/fixes in the PMU event path. The first patch
was part of the series[1]. The 2nd patch was suggested during the series
review. 

While the series can only be merged once SBI v3.0 is frozen, these two
patches can be independent of SBI v3.0 and can be merged sooner. Hence, these
two patches are sent as a separate series.
 
[1] https://lore.kernel.org/kvm/20241119-pmu_event_info-v1-7-a4f9691421f8@rivosinc.com/T/#u

To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@atishpatra.org>
To: Anup Patel <anup@brainfault.org>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Removed a drive-by fix from PATCH 1 and created a separate patch.
- Added fixes tag 
- Link to v1: https://lore.kernel.org/r/20241209-pmu_event_fixes-v1-0-d9525e90072c@rivosinc.com

---
Atish Patra (3):
      drivers/perf: riscv: Fix Platform firmware event data
      drivers/perf: riscv: Return error for default case
      drivers/perf: riscv: Do not allow invalid raw event config

 arch/riscv/include/asm/sbi.h |  1 +
 drivers/perf/riscv_pmu_sbi.c | 22 ++++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-pmu_event_fixes_v2-c34bab91422d
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
