Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E8DE7717D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 00:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YsFnMmyf7pkb6a3OgxS5WSDdivOqRPnhakHuXrI0yTg=; b=FURhYU4zNSzlIC
	oZbsqdI+yM45xGUXfhqzcXg6ZElievI+l8ngk+JPpj4MOsLhXBR4eie8hAqi8BURnG235z0JKLiSz
	2F1YSvjyvN+y2+UxbHA8gpDSp4Iu8DC3eV6DJh62eO1jLlWSbMDB6bY47+OPPgU/UPDJrCmEz/0+1
	+Vo3xQZOQrmadbgcpw2yAfMZ3EjtZDw72m9lDSyGhK6GZo67x+7Djhhekn1KzxVZDD/ATn9voqMg5
	vu9DMve44CcCIg8XnviUV47ok4lbyt3dg/k2NrFQY5XRDGO2TvOw33YB53LNZO9ckUQ1XkR0HaCra
	9RIj8GnHmIX/UtPliNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnkE-00000009e1z-2w5m;
	Tue, 10 Dec 2024 00:04:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnkC-00000009e0l-2E2H
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 00:04:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725f3594965so1057089b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 16:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733789091; x=1734393891; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji/bjCDM8Ft34migBO4y7ku5uywiRK/wox/r71XWWSc=;
        b=BSR/vzD59+F+b903cm1wiZISTpXbB4oZWj98vz4DAF12soIhEVH9YuPML47Ei+xcIy
         6L2diVZUQc7lBkQDKhbI92rUKQngM4HduhBOfG9v3KX34u/7Al3va8rFFQ6JWMeJmM8M
         hMTdxOvpRm7pGuTAyz6Ml2qIkUszfG4HevLJVBkESLwfHYJIQtzqGV+kNaSj1u/iGYnD
         yXMJ2s7sqE1oMXW5K8gjlCbWo91bRxMohjnLk7G3o8Zh0LyNxctqlJzACjorAJzLOCX7
         l/iJEABRaxIo6vZZSkakXanOTAzNVwnlQFiYNT1S1g6SQHMPbJcildVAdA5hIqwPQVKT
         seyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789091; x=1734393891;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ji/bjCDM8Ft34migBO4y7ku5uywiRK/wox/r71XWWSc=;
        b=nuDSMtAhNlmaFpvi3wnhOS8A3hReEK9e3IwHXypgCPV/B0rqshNtxQuktSA5vb3GMF
         2pGDnGLa8lirPaKdLcQpnKb0wAdGiOf2Dziyceo9gJjq5Zp0EZ3aCFD3zKRFZ1+u7jWR
         lfcDW1aFaIanBtDDE5r/6pQNENIx+w6c3Q/2uYeBmnGQ0u8lN0C3Rqdvaq8vJpFHbW7K
         +4yimRD0KijL5ZBriCEsDcy8MsFjYsmvKgCp4s2MEZejBZeEtjA9E9CzsR51LQ+gTwce
         vAx3E0TfQVaUeGnz9oj074qpNxeU15cMkVJWxcbs4B/IHoGovfOP8ZrPYd4Nu0aHvE0T
         eW3A==
X-Forwarded-Encrypted: i=1; AJvYcCW+fh5tbGAHg3nLHjYhrwozJIGAQ5My3BJOKsFgAKkdIkd/8eh5CjauzY9/YgMA1aCEoJS45IV84O8shA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6qg/GWQveqtQ752R/1gHkvx1DUcIflk/GcK8rkSz4zb7/TJOp
	RtbREBktHkvlSZkZA23Me+8KuNrOt1u1thnZCyz/ZY/1YhQbpt45GYP/bvEXW7s=
X-Gm-Gg: ASbGncvmQz3J7XiGWOr7Vwpb+6w8C6PHsLsiymrqQNiBQPWz/vQ3mJL8o0024UXF1rb
	4iFIXgik2v7lbwR/KlBtaTuZBDAfmkp1RLsmxqBo9YhjZ4gzax1pXqeT27mDdfTWk0UOzk+QemY
	8VsVcCIVTkooBnJU356PnoWPyk9WbBgWQisRIM7lN9C0zikgPZRwY74PnSyhHImArt9A6u+Bf56
	6wsmQYzO2q84fV9sN7CCXGCnZspgR89RXHlarDfqVIXRUjuuVPWbFimS/3qBsMy2GM=
X-Google-Smtp-Source: AGHT+IEl0iThSUMRmBt5x82YsS+Na48szQj4WL5LFMN+y7ChsI0Bj1eWoqCFm3HRkd/vd/duzw7Oyg==
X-Received: by 2002:a05:6a21:7889:b0:1dc:1:3e28 with SMTP id adf61e73a8af0-1e18713e068mr26159811637.40.1733789091182;
        Mon, 09 Dec 2024 16:04:51 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e3ca46f0sm3477249b3a.15.2024.12.09.16.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:04:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/2] SBI PMU event related fixes
Date: Mon, 09 Dec 2024 16:04:44 -0800
Message-Id: <20241209-pmu_event_fixes-v1-0-d9525e90072c@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJyFV2cC/x3LQQqAIBBA0avErBN0kLKuEiGhU80iCy0JorsnL
 R+f/0CiyJSgrx6IlDnxHgpUXYFbp7CQYF8MKFErlJ04tstSpnDamW9KokXntTYN6slAuY5Ifyj
 TML7vB1ahNx5hAAAA
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
X-CRM114-CacheID: sfid-20241209_160452_781209_8B0A244A 
X-CRM114-Status: UNSURE (   9.16  )
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
Atish Patra (2):
      drivers/perf: riscv: Fix Platform firmware event data
      drivers/perf: riscv: Do not allow invalid raw event config

 arch/riscv/include/asm/sbi.h |  1 +
 drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241209-pmu_event_fixes-72cd448624a8
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
