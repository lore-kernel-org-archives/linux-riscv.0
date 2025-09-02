Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81907CA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 04:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ur32O8lVD5YFcZ1/ZMAkjAgpvCmhLBh2cL7fEZWy0Vg=; b=LCVXi5/qORmPuk
	XTmnkIFZOWBxe8EZOF8q2++PjssLiuCFlNSE/DUW6UY5MMKKWV5ZOpxW3pmiNzeffjC3UmuFwFZYA
	t1bXjZMbnu2D971uvq+s/Fn2/J687I4eYW3CU7Oz1wt9jB9E/9d/5OlM2qybMJ2fc/n71z1IVOb3X
	H5n557kG6ospHLJkza0NmD59TKBu5BDZRC5dmDTCQ1BI+sV2h4MpJsnBaMZyJ7/4ig4UtREyyf/qb
	+Y1lt8f38s2HgorBAchxOtBxvvN+YJomunsGc+bHuM7V+uy7tvAKsNoPie8/DxOOYaPizd/W9drpt
	BQk5gp+nki2fHxMOr02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZf-0000000FCUo-2FUX;
	Tue, 02 Sep 2025 04:24:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZc-0000000FCU3-46fn
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 04:24:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-327d47a0e3eso3320487a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 21:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756787088; x=1757391888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=APVNjQXL7cNvQgx0O0MUFj1yRvDnp/NPjZ/tEuxF8xsVTRqt2ieeAWBtkqYW8RXhmn
         kAcMeC7E9IcoQFJ7T6tpN9/723eEBnl30dbBnjWlNUVKOWqrAtN4RVbUCNut7xUgvUhJ
         lHl6ypWcgFVQz7gHZk8NDe6myyP3jq1dIOv0+Tim/4UHGYM5Nah2W8ua4Y9pp3Rb/SYE
         AdhggPqMOOmoktFbehWwtNOfwd3MoEmOAHHRffdU+scqMkjcV6+oe5j/xVaPuU2SerHy
         iEp3ZKPAyCoP1CEZMkNQADsC2IBjXs2xIQU/UUmQ/bUkKjFZpNbklu6yqClu2IT5zkNX
         2rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756787088; x=1757391888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=XxysmTAFrZ4cYTpbBMzHhXu+CIBrHj0jqfbSrtPX6mv1DGfPIxT+Ae3ZdUcfSVFo//
         U0Lp8vUwJ9l3xiynUpstaikXmlOlYi7qCJlwayVUeFRmXOyMxurlzt21r7wegVojzXvj
         g6y7Fep7jD8d+Pq36+JqZJp8xfNSgKyI4Ck2Ia/34f62L9OVxJeZHj4It4h4RZAeMsl9
         w2piJxETUvr8G11ZfinIQ4aR67UyyfEgO6utMHZ08sUhul8dtWH2g9qyOcGxUkA6t36W
         emKmzRCMne+8E9U6lGoix9myTN0ebld9BlgRqEqhQdyJPrOui0hh7jpxPUmwar+C0qsB
         LEMg==
X-Forwarded-Encrypted: i=1; AJvYcCUEQ50yCxlrfpzEJe3SmbWSbQoZDd3nSe5atbwcf/iqB7TU6SvbGKSLn+HJfk3AdiMsGMqd8tMui1ooHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzppSr+xvs9YaK5NZlUITAg/B1GKzsvbGQodX/pFDWyQ4ocGE0V
	K7m7IwXkdLkhgqSs5FVYn715zanJaYQZn1CL3QNlFAvM6d5b45mNbph+S+jMVSH6r7E=
X-Gm-Gg: ASbGnct8sTVknVcq648SzcQg8Jz+iSJHu4xl8AftB4x0ZeEPxJUhseBtb/MtYY4kko0
	CElCmTeyw+S9UN9J+Vtynne2Qtt7zGEvOAgl4HBP1rDI+kxIlBJDuuESMRlRSuKnS9V7XUxWREX
	nY3v2PfCrqEBWgKqDHjZYBUuX0Ox9GcIoGgt9UmFWLuyAzTLHzcNHMgI0EWqe0td7EaiWHsEf/0
	+qYSlzFmvvl/g5lE/o2fwhgiKMTEMpZ2/95xqyfcCjo7bFVnoEWAiGVKtMyrTvzh3SDi64vK3im
	euzg6A8eJkIYg2Uf6FISzBal0uMWQsVw8HcD/YvZp3y+coPKX2iLWiKxAp/rowxocpNP95h/kUt
	eZ617h0JJPBprG8KG+WFpg5Pl23GJ75wpk+LnzFofGoVuN5HCWaKhjXLlNTbylTphFAHuDlcWEg
	/nkMYFmQ1cbvPQvK1WdhpZ2kF+34p7GLpcyyBxfk39/CoX5VMuzNEZYA==
X-Google-Smtp-Source: AGHT+IF/UIFHSTUTfHrNH3bDDX+6KD5zm8JCKYYhXajmMDgvuIFurnNObTwTgyDtBVvv4P6nH93RqA==
X-Received: by 2002:a17:90b:3d48:b0:321:cf49:2c04 with SMTP id 98e67ed59e1d1-32815433803mr13646315a91.9.1756787088100;
        Mon, 01 Sep 2025 21:24:48 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e21d14a8sm12216706a91.2.2025.09.01.21.24.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 21:24:47 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 1/4] riscv: add ISA extension parsing for Zalasr
Date: Tue,  2 Sep 2025 12:24:29 +0800
Message-Id: <20250902042432.78960-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250902042432.78960-1-luxu.kernel@bytedance.com>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212449_017890_1CB296FC 
X-CRM114-Status: UNSURE (   8.72  )
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

Add parsing for Zalasr ISA extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ae3852c4f2ca2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZALASR		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572e..bf9d3d92bf372 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -472,6 +472,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
