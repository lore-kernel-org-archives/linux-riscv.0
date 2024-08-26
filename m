Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA07C5472E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r0+gyyb+bxTNQgrpRGudcIQGj3b0Rfsr2VlxonN5X54=; b=DcDEOrZqHAFMTt
	+G/Ny/6yuHaq/k6adTSnZvyGbmG+KUz8ZrQFkrh6rvMzD72JlJ4C79GKyUNFIFgYhTh16KeFRvzmm
	MghAKCHXMa5ctzZ3uEpitaG3YH0/FEtcO1OdVACP3tnhNemoXW3OapVDynUFm7gH2boVRNrwVK74w
	uFb2lu6nInJqpZsp15TtzEgW/VKvMMeBlQ0V5xlHOZhwdE5RcDrMjafslYB7bmBPUi/WQJUmByMV3
	UHuaY5XvLjrT3HS/SpTF5E9SNC/nZ/yCgNDN0QqdgSzrFYQVPafx6IVFTXsp0B2TMaIWG/imOhJma
	ih76DH0Bo+BeDi/bh1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicim-000000082Af-3WkO;
	Mon, 26 Aug 2024 16:37:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sici7-000000081x1-0Dp5
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 16:36:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7106cf5771bso3633449b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724690214; x=1725295014; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzJj8pzBdC/SjkNgCg+eFusMGgeO5OB+75LPuxAheKY=;
        b=q2lE2NuqCKF4MHg2YJmKQ2ze6QTmn6a2DXTAfxiE5JAibxKw2MC00WsP086fmq6Jjo
         rujp6OVf0zwRjj3KlwViYYZNTqMycWvuSt0IPbw7fHgZH3VPTopoQS/xT6kIiMk0qM9d
         CBswgLo7TltRw8jX9rj0ecsNp+IhyINYX+bzgkRzOT9xmAtUz37i94xQSiwD7ogqRwyo
         d9Pg3UHlqUp47cLvHAot2hoXf/ZZw+ShK6kZgeKL49SubtHei75TWMhn7yE2gsKG9JX6
         Qbk4cTVWCYa/A/QWL42RPRhchHCEgIEQGq7FlEqj0otJ4raanXxKGPQ530ti8RqeWNKx
         um2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724690214; x=1725295014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzJj8pzBdC/SjkNgCg+eFusMGgeO5OB+75LPuxAheKY=;
        b=lSuabvkNRHK/6I8iaiFTSLtLNUTTIQZ/xJSA7nrNeehMlqqSISL8OtSZoc/BUCxlft
         wWbQTmpYg5d4XF2AYnoD/eQGpeTa9vzNlbD8sD/i8Awma6sfXCjmsGvKGzjTyDuWRXdy
         eWoLzHHNzaZYRcw+lq6TAkpG97HBxFwesW3gXt1iZvoMQLjC1IQJ98a/gaDsE4ai70Lb
         kmNNuzm5fygkCt5vc8pLaYtp4/ddRL+tVq1RLlycco3LFVOx8t+l3ODVnsmXgM3m2T2w
         PPdNpEB2qPVKOQN7vHnpuP5v/WWYHFhKIZWYP4PbVsGUZ3BrRZvfBBVvzpFT1Gx/7UzR
         jaIw==
X-Forwarded-Encrypted: i=1; AJvYcCUoEC+mIVe291hUK/GgNyX8Q+xn0yi97zJy48yjhOGBN1FQCD2bOoO1HED0+vHiB8t1HJadYYJOVdpZxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgse1i+UG0IaF1wwKaaOdPEWp8B1ZEekZ3jC7X+UbqKTTe70Ex
	/B6jNKApnPdRNdx8ZTHzXs60TsrnCVtDtRXR5i0qgXxWCECTm/mwRDMJZ2QQk4g=
X-Google-Smtp-Source: AGHT+IEhhlwfKu+qrTkve0/BmPBWlOtzw1R6AUtvBmtz1f6WqoPjaogV9GfYZT3VAsdVTB8oqC9zcA==
X-Received: by 2002:a05:6a21:1584:b0:1c6:fc4e:e4ca with SMTP id adf61e73a8af0-1cc8a268142mr10196588637.47.1724690213501;
        Mon, 26 Aug 2024 09:36:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143434052dsm7174708b3a.217.2024.08.26.09.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:36:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/3] riscv: mm: Do not restrict mmap address based on hint
Date: Mon, 26 Aug 2024 09:36:44 -0700
Message-Id: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAByvzGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyMD3aLM4uSy+NzcxAJdA1PT1LQUI+M0Q8tkJaCGgqLUtMwKsGHRsbW
 1ACMCc6hcAAAA
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
 Levi Zim <rsworktech@outlook.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=Ggjt/PK8ZO1KdyZKks/DPga8mkjKTc2hpGQom8saAb4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qZ9bJn1kYurJt9sPFIkVbf8aYlF/gv+z8qKVxUu/jzd
 55zGU0lHaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEykKZzhf8qODI2UOd4br+q6
 KG81cMv9HxRemBLzcrrfzp5uJ5WcZob/ldOX7r8f4GB2olQ9arpc/sQ6tp6gpnXpU9fu9NlXbPi
 AEwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_093655_130789_A0B4207C 
X-CRM114-Status: UNSURE (   6.92  )
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

There have been a couple of reports that using the hint address to
restrict the address returned by mmap hint address has caused issues in
applications. A different solution for restricting addresses returned by
mmap is necessary to avoid breakages.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (3):
      Revert "RISC-V: mm: Document mmap changes"
      riscv: selftests: Remove mmap hint address checks
      riscv: mm: Do not restrict mmap address based on hint

 Documentation/arch/riscv/vm-layout.rst           | 16 ------
 arch/riscv/include/asm/processor.h               | 26 +--------
 tools/testing/selftests/riscv/mm/mmap_bottomup.c |  2 -
 tools/testing/selftests/riscv/mm/mmap_default.c  |  2 -
 tools/testing/selftests/riscv/mm/mmap_test.h     | 67 ------------------------
 5 files changed, 2 insertions(+), 111 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240820-riscv_mmap-055efd23f19c
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
