Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDCECD4F38
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5b/TUXMzrVpdg1O3QOqkt2OAITkeGdzOOcVR/oQtCQ=; b=hYDKIyihLmsGJ1
	FjzbyDGE6yo6OPpfE2P1pYHiK0q86D23PmilAbbAI+f1hVyFqsms6y6TB9nYowhkF/cV7GuxK5gev
	8rJkuImPnzW7O/krGQnAxDDThAGYawuCWNNem4+REhYP9cTrqxEIDnNH4V3GTAtDR53cMTMQkvJnP
	DtC6rWt+Ksr1GFpQf35AfKw5fO2AApLwo2YdTcdQ49A5MUd9hnEKeJF+dAkutNyIvCCDfy4rR1eIV
	I0Bwr8HVtp7v5utWk1swYDGVYTnnakouR656VBR7aXpu3M/LwJmXGeZ0dKwOMcEZgd92cgBp4bk/D
	86tyMRUETJerHksHXTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQr-00000009jzF-3fWE;
	Thu, 13 Nov 2025 01:47:29 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQn-00000009juD-2oj1
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:26 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so230925a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998445; x=1763603245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnUrJZR22oRvK4b9Hq0rnS55dGa+J0g2wL6xk4xR6+s=;
        b=lIz8/7uLlDkrLA/weDT01WcaIWzKhUqUgsk4Y8TSKdAt87NXifWX2zflxF+4CnhrGa
         Ym97Faxk5SkIan66U5lIV8QhHQp/sUVh0LiSmF3hUD8W1EgWUpt8wKGJwl5i+YBS99Nh
         NzDhhdU3HOyBWQfrRXFl+0sNORTmPeUExYhkjAfM4Na3sLx5s1FKlGGp6f9vRTG4nx3I
         myMAlkv9cGb76jsnysj9ftQ+0oufVRUbNzsUXk2lhgsOyVHEqNhlPy0ksOMh9svn8K4j
         D6MP08uVikeer/BXUEuHRVrJV9VvPMv9Lu6/gfsxXPolC0pzgIsWl13Zv+KuJqq1jdSt
         mCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998445; x=1763603245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnUrJZR22oRvK4b9Hq0rnS55dGa+J0g2wL6xk4xR6+s=;
        b=f89dS1tBM3mJ5+WnEZVttRb+5UdZhIbCQljrr3TwPNhfVgcLPzB7z8fQB4or9vagy9
         pGWhcw2KvXlFbodjy+HvmvZJs+DUpTb9EAdnIkG21YAyO5RyjC1ULB8zBNkt/Y2NuR9l
         gRBn0FaZhMxfR4YVjd2BtRDdZBleiAUijrJmwgETTKBQ6zEj89CdvKpHqO7/RerSgdK/
         jbKjXt73idcWzmX0l4NGtxgiHLjV2yp0hEhdummtUJEX9Ep/yKr3Q7xgImjq4S5FE0lZ
         p97gFB/cM/u7fEfM2gfBisVpzPcVwbT6WVkCQCgfqhXKd8Ja0IEZEj5S0dBWMjc2EUSP
         hK/w==
X-Forwarded-Encrypted: i=1; AJvYcCUW3ajjfp8eTZt/Bj8Sn+F3EZXMweXbh09FlAaxGBLsYsq0WvC5NW2iYZy91t4iX/vzA4ZIOPHWBz6CxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0vrkakt0BcFpxC6fhd/R68lOFP4TvOFsiYD1jnbV03bfarZ0
	a81RLn67XscOK0E55dYxfOFGrD0mmqmErVQPC/AQ5T0C0NVVOaos83Y0ir/OwBQcwBo=
X-Gm-Gg: ASbGncveBGxxRFI7TjFuHbcwiX3FnZigs68rcatphhzsq6szh9F2noucez4DHsP/2WL
	vFjmNstlkIz/XV0fBedYspFj7MBbQgKmp7rcPd8/HkkY2fsVi3q9Q2iYi9jU+EELhZxDMxJ3pz4
	EsYV32b8RnGnRCZ4zy7ZQroRViiZ4o1q78UXTOKhCVJYlDDl/pkFukpzMTOyZaHaRdaHsayTxkh
	gZSS2QWD+fdTy7hjqd1QlvyO/IrtFfZC3dRGC0M2/ejW9ubcE+tM3bOW0ugvM0dUna9fDEateSm
	X8wKFjSSnyYqW5GWKHDQvCMg0SM5BKzioCM7g8IlGYmvklxJGkDK7qs0+yMiQnSrMn+QwAnbkNt
	Zc3PXBjcj/q12mRjrBBVnRk3SqZuXP08j04Q2V4cRQgb6J1DrXpakFELmFDy0lGZjbfNiH8R5PJ
	sDBLx/k9upGTCdJIbPxz2LoA==
X-Google-Smtp-Source: AGHT+IFqAfqeVcZ22DpgtEmtnZ9MrEayC7yLg/9qX8OddaBkDjNDdLzIDATV5Jsr3mCugzkW5GzqeA==
X-Received: by 2002:a17:902:f54e:b0:28b:4ca5:d522 with SMTP id d9443c01a7336-2984ede9839mr68599425ad.39.1762998444849;
        Wed, 12 Nov 2025 17:47:24 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:24 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 17/22] riscv: alternative: Allow calls with alternate link registers
Date: Wed, 12 Nov 2025 17:45:30 -0800
Message-ID: <20251113014656.2605447-18-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174725_712495_0C629FDC 
X-CRM114-Status: GOOD (  11.47  )
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

Alternative assembly code may wish to use an alternate link register to
minimize the number of clobbered registers. Apply the offset fix to all
jalr (not jr) instructions, i.e. where rd is not x0.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/kernel/alternative.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 7642704c7f18..e3eb2585faea 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -126,8 +126,8 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 			if (!riscv_insn_is_jalr(insn2))
 				continue;
 
-			/* if instruction pair is a call, it will use the ra register */
-			if (RV_EXTRACT_RD_REG(insn) != 1)
+			/* if instruction pair is a call, it will save a link register */
+			if (RV_EXTRACT_RD_REG(insn) == 0)
 				continue;
 
 			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
