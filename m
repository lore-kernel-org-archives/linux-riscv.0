Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB289C43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pET2U8ht/Z5Y/tM5xu8xvsgu43pJmHt3P/wNJHdVjWU=; b=xuXzUzFwCC2SKI
	+Jwbex2HiYl1vOJkiQGj8nvWNuTqh2/VBNDskQo0zseYt/0Tw3nKRzdMGixBaCmeENqzkFrlNLDMJ
	UbGvS6veXyamDda37czXDrYWIHsA9jxkp7eW2POxJ1WVuTnpinycQ+csqzi8hhfqlbYXAPsT1MTQk
	CvzO94gvw4+mRZCiTwm5mMIn5GcvhTZcjil6E8+NLSz8oCWChYlrJF+d1O27lHdCMcB5bHKmG6OGk
	PPBAyf6BheMOx8thqsAqwwNPd3+89oAFDP+PHDdDVw/lDR7KvoavTFyLGL5E/IlLWMS0kvdIA0S3O
	8m+xtE8NONXbqfsVKRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea19-0000000HKVi-11eM;
	Tue, 30 Jun 2026 15:04:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea16-0000000HKUL-0cFg
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 15:04:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c99672293cso26039375ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831891; x=1783436691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ+KouBHR2A5cU5ulbS52ssZaf2NlH3yq/de1XOWkF8=;
        b=Cup7TQ5tVsk3QhVBHU7IDpYLbb+TKgVvSTffPeJb66QbHqJf1If1ZDGRF5+qTmTw2C
         Gs0ORPtLDfh5ie/jnRziIMEt6JNHS5CUTAaDtsEKx64dbrLyCjEv5FnEosvH4a4V3nCO
         /yx97wpNlB6CTTBBphHu8/NGQ3KsYFN5HH5GP1oOAG8/3QvVYWnv3Og/XBJ0TkLv9ich
         lvBkMGtpLWqKMvdCDy6F/kd7Y7bH9EgaEYpYVjPYkmJluu6I8iQaqE10k/7eFbeqo3rl
         +CyNn6R0Sr///nACvjsBh046bylFXVAx+CoLW0bGEOzHaXTIckyaaBiFC+2fvo0r4h0o
         txAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831891; x=1783436691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZ+KouBHR2A5cU5ulbS52ssZaf2NlH3yq/de1XOWkF8=;
        b=q5ZvAiRP68wYCEsk2wYLkyDFZO2VZ8/58mCNHCF25bgJeC/Q2lTUW0VyangqWVSpw+
         Wsic89YyMnqrq9ReKav1dC76aZDhxT3ZXrjHdyZpTE4SnXRHxPIUCoehOPzNjbZOoPCS
         9mXyFnY0Ot9KZ6CAFy8DPeVsz3Pix97yG3zkuzFWtcpRZtVepE6JWvZk3z6qaKYoaqh3
         CXcgXaZAjDIlhym3biGlf97YZMAtSelAEToknV4jyfzGzTiXPNDxc56+rFRy5rrJlVrn
         i8PvlrrfAnCxnJ0u46mmb5Xm3+RUfxaXNrwewUimlP8FVEV4cLluklIipoqVETg3SB+b
         BPcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPKvslCuolR++XGZppV1LFVd1BEMuiQ2Wcm64xZL+MPJ1zSxNWtr9j7sCVSjNjL7dxlZv90TypLS3Ztw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWteBcM9Pqco01eEQgT5a8HoE1SaYJL1W2bINqa+6MPIaO3VyX
	X7GE2nqB6vf+V0bPOlrAGerSa/1l0sGahNwwzrGf4iCTOYkadpVZFoOM
X-Gm-Gg: AfdE7clq8h9tCsksYR+e5+a+mZs6kHFqYlz7Aq8Q7AOmZ2YcLE9iEXRab5thqMXXfht
	0zFA+9uwwa5/EgOsK28rXghcNjbumCksjZDCxm27uKMwOk8VPacoFoGprFNM1SMpihp/1cxVqM6
	2vqDvSSP4K4+t1bTHeJtwW4pMuvTOQdnJR0trQXing+czdB8SB7AiQQU3AuW3MilswJiamDRx5l
	kuQk/MqiTjOBQiyBg3MiVJYnfdScf5JQwqZ42Wb2ZnIt2BpywBm5LGILkUWRn3MxCPaNgRiGjCH
	L7JsuD3GhaH1AuGc3xCAaMf03GHrUPH7BwThqKq2R43qW0+qHSQZeCryXvsoXfUh53mLadLFsbf
	EEkT2eUnyHsV+2jSHO6qwOzGA4rxIBvZW8glWYdozWiB5beeL6CBswUjrj1jnniMZe1Xjis+Eii
	Mn0/QJKXY=
X-Received: by 2002:a17:903:3c0c:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2ca5a55308emr7483055ad.15.1782831891075;
        Tue, 30 Jun 2026 08:04:51 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bc0sm16250465ad.10.2026.06.30.08.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:50 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v3 4/8] riscv: remove unreachable invalid range check in kasan_init()
Date: Wed,  1 Jul 2026 00:04:09 +0900
Message-ID: <20260630150413.1718632-5-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630150413.1718632-1-ekffu200098@gmail.com>
References: <20260630150413.1718632-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080452_181318_384103B0 
X-CRM114-Status: UNSURE (   7.92  )
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

kasan_init() populates the linear mapping shadow with for_each_mem_range()
and breaks the loop when start >= end. for_each_mem_range() never returns
an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
 arch/riscv/mm/kasan_init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index c4a2a9e5586e..1f3aa9611187 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -512,9 +512,6 @@ void __init kasan_init(void)
 		void *start = (void *)__va(p_start);
 		void *end = (void *)__va(p_end);
 
-		if (start >= end)
-			break;
-
 		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
