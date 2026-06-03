Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75619CD6E69
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzkl72/TxK0v3tcW98PmkWyJFj36D4nR6+Afog1BiSQ=; b=E9iR0/GwPWdXVo
	yDmj2UvN6xLSD/3Qjt5Z6gk+yLZrMzYvbIKIA4mLqJRzwiaCB4idoPRqsd9NAt817nIC9z0uAe3ES
	z8OGMsZiefzbSqxIzulX9p4oPUcIrplWoP379u2w0z/FPmry+0Ty9EpQygdFeQExeaHyBDDuRVYPL
	X6EGyZunUCjWvfJO6Zs2ZEetF1xRvumWd7nTMelmEvm5u27efQCCn+H0XkOdt6rcQZUgeL8hkBWHw
	FnF1IipQ9mrLvk6wbba8U+RJ97oqYibY2xnDLZ5xekpxOwrBuN/Six9ZCZTAxDReWeVWchvIv50u2
	jJS2yzZirA9q8UDY1JYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFi-0000000EV3v-2D25;
	Wed, 03 Jun 2026 07:43:02 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFe-0000000EV2v-3rDj
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:43:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-842264dde84so185252b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472578; x=1781077378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7yqFw0tWdchIDC7Bn/I4SbgaqSJ84oj4eVuugZh2/Y=;
        b=i4FZtLFJzYRzD1sOnIH/tABq2m3RCBLNLn08X7KnzJw03WnrpkQu9mdCBuT76q/dBK
         Z9exxGPGtue8x/Tk08212sRlQcKLY8+bnomxOMUGMc9slYaAofNN6KTK0qD8jZW/O82q
         HANt8QPkm8lu529XA3Q++51J/DFzAK/ow5Ak9bPJtwOYGzrkQITK/nwkRvIN4/7jLTgC
         TMJS4dCXyNAGXojBXbaX7g0/MF+IRjCQyqPi2xx+DePSIORkXAsqYXlnngS4iflUE90l
         kQl7Y8pu/JrAVOQRRQ5AVHb59R/GMUt/8ugVZfpO3bq4+nr3FRU74M0/DXCFm5TQqyy2
         wQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472578; x=1781077378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7yqFw0tWdchIDC7Bn/I4SbgaqSJ84oj4eVuugZh2/Y=;
        b=jrFg7uOG8lRWwJrtB3vBbT3Vzgnz2Q6SMuyeXu5IbKL7p+8LE9ovqjvUdm78ue/eGE
         FUZfSBY9Tny68eyHtO23wGJJbyQp1uup8VvGctdv55Ur4ZvYCahw9UgvFiHZqUqG2BQz
         +QZgkc6wCO0EQvL9/A+QeqCtUam6/x7/db56rS35Oqf8Rxu6iLi+Muh9MT00V4Av8mBa
         6d2kUtNyWcUHb+pWKp7YklKUgJQ7Z+sGy9OWrsp+AWTbnDu7rBF4yqaH8RUbRPI391YY
         2AdxFnLnEnyDmZEXiqOoNS5RdUu4R/TdSwYUV96ssKYP3lcxcc0f7MRkVaNmFC8LjZgW
         EK3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Gigr6tXf8PAhEQPHdpu9Kh8i//kz78eWEuMmEm+tL3HhySOV8j1TtPnm7RHhaGEWzAsocZl0BiTTpgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvICNXcPh2WocNPnMmQrYKu12Na6pybGzjZ65qOGGliqimcgNX
	my+gq8GdibqmFbOm0ixwrYauFlXWrwzPTU3AK07Cnq8+M8X/fG2uDjiZ
X-Gm-Gg: Acq92OEdRegh9U9imPjh6LreBrZjN9WSyWuFw487+a2lgy7wrrKsl9YQ0L+8XKIsNK7
	4CJ1VUVomFY+zNW9qk7wxC7Yih9wNMTyzhGLkLOJX14FCFKUAeWvqo3LOEQCBQ4FYsJ7J02w0im
	m6w0mGD6krK1xSoqXjR3XoJcFfGDBI/cB+D/fru9UH23R0TtUL6k5uqSxxqtdT3CvVMLZMfruyM
	iKIMB2BQDa6/zsTfxljLgglKiFUR9EhG5zvEhM/Wk0vJ4n1fTOsW9OJgv36jyzFlJPe4hXFx/Jh
	+AZi6keuKnOaX/4s8XYg0CHD0mWtgcEh1EDuXYKhe/n9lNMt2Jm064pfeqmQNf2zXyDqkGjUveU
	nQ9v1tlyYmTfcrAnMaQ5o98lMDDWtpJakVuBwpNgojp3W5ifUbi+NC/PwAvht9zmGDOrdvvNwNJ
	8qb4pzXjxNak1FhMJMKqezVrxFY3Fa4h2DVeLC+t4CRzt52smWInVhCPJrEeZJMJISN8zVDSHFJ
	PJdfqeRpuKvhrthyfybAc6OY4kvdAU+BjG29JlERGlgwT4idP0crC/nKUB0vDOJ
X-Received: by 2002:a05:6a00:90aa:b0:842:6344:f33a with SMTP id d2e1a72fcca58-8428596369amr1682866b3a.3.1780472577913;
        Wed, 03 Jun 2026 00:42:57 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:42:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Wed,  3 Jun 2026 17:12:13 +0930
Message-ID: <20260603074222.593243-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004259_714407_20A39D8C 
X-CRM114-Status: UNSURE (   7.96  )
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

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d2..d4e17861eda4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - qemu,aplic
           - spacemit,k3-aplic
+          - tenstorrent,atlantis-aplic
       - const: riscv,aplic
 
   reg:
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
