Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DCEC61D99
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 01:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sNR9NvaXmhFycyAxmlyb8Msjn484NIS17Aai/w6Kr44=; b=36MNYrGEL+6JOD
	YoLMl0k7JXz3XLpQyc37DfiX8TRb27gSuRdCIP4mhJgloaiKGxoGi85Byz36n6Qk+pRIrDvYl2ygo
	3Wu9MlK3hKwkbskkQjQAa+ygGh+jVVsOi4jZ9wmfc4lNSKnblyt94VcSeHTyw3uODZGiAoUTTnzL8
	52h7IZbMJdEJr5K34C/OjgTjm7C3px5AeMfQqRdSgfJ5jQOMY0xUCKOdz9oVv/2GCp8NKAjqNNFG2
	RnjemDQUButrEsSVi4YAEnPA9Ux/dJ4lPjZdTD1fWnIjGxkyjaLD0cXHz//UTxqDXSW+QyTLGgu28
	ivH6uZp726Qp17HE3a1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5y7s-003Slc-1l;
	Thu, 23 Nov 2023 01:03:28 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5y7o-003Skd-2X
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 01:03:26 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so266785fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 17:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700701403; x=1701306203; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXabQ8A/xezWt9SHwrUsDTpRrD0byx6vytti1k+h2UE=;
        b=NyeZ5Zv7hH4KUNwMCbgfu4BA9JYVx2ummBC6wgH4SHyflCG7nr4BihRL1lRSnVTRus
         u0RMF5Q/xbPSsx4jgw4xwSrFsMNKoW6spu5jJjiNjOn4ACGZZuok5hGXVy8pL5lypsw4
         qfbiEioPUe+C42jhbGVv2ymvnqPKw0bFLr8SMwX0sgVAzJ0ABABEJEgCjLPSJsaMe01G
         wPksmGbRWyD8K/aCNAyV78wMUpiW9VQjVf1cGqqu7k4oe2llc5ODdZb4jxf1mqhJ4bTI
         6BUmCb1uRZWC1bPRHa/waA1OWgZnLtbxIfJsCKirUswTnmKvf87DXlzMTCM52jWsUQyj
         9wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700701403; x=1701306203;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXabQ8A/xezWt9SHwrUsDTpRrD0byx6vytti1k+h2UE=;
        b=MLecKrf2R7lDxgYkiIsHxbcxkI3HSZ9QEg6ASK0bAYLkJlz0L3iMRiYQftzQW8XMqo
         OLHJ/C6YmwHhT8YrT2YDWiSNmWFtC68SF5pdkaxzb+K5N1tQ+Fx5QsvB/SPhPxdoZS+d
         8d/NqJ4bGPVAr/6SEc3nPVro3JqDtJpZRa9YuOeWhYyYIVtOWggE6x6/zx2e5F5rWSAx
         MXS03ZJ1VlkDqJKSlnHS2/DP7SbJ0e6/rXflO5f9J5meTSutYBXjObt7OGniimbQVJeo
         aPpXNNEFYN0QdM0DnLV0FB9VAmwbSJQU+QBzT3Q+QUSBCQfKOaklWuo4hF+2lj1eN006
         wHbg==
X-Gm-Message-State: AOJu0Yz7G5FCvBRqG8uHlEf+yZJHxke7Chp50fKzdhr5ERO7Qxkg0Mn/
	S0d2WNNcypkw18NKI2cSjhkvgDDwVOkrmC8gX1w=
X-Google-Smtp-Source: AGHT+IE3OiXSh/n62NzPcNJaO+UHvJxiRtnLq/HYy1a6CdXhApFeh1e7Zqff1Hl+t3oaIiBUu1WcOw==
X-Received: by 2002:a05:6871:e405:b0:1ef:f14e:6f0a with SMTP id py5-20020a056871e40500b001eff14e6f0amr5800832oac.0.1700701403123;
        Wed, 22 Nov 2023 17:03:23 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id oq12-20020a0568707d8c00b001dcfaba6d22sm65834oab.46.2023.11.22.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 17:03:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Wed, 22 Nov 2023 17:03:19 -0800
Message-Id: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANekXmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQ0Nz3bTUvOTUTN00yzQzgxRzC5O0RAMloOKCotS0zAqwQdGxtbUABi+
 6+VgAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700701401; l=1107;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=auzvGFp5g/T2qKBKlxbBfjnxEnv0hfKBNeuhh4Tx5wI=;
 b=RjXz/cYS321dvE4vAtGlRzqisR7ZU2GZV1umThCtWmuouptXgJgCogbp8jWViNc1v5bECzLkH
 JXVo2y0JtX4AkFFBaia53RtJSeZ1kp+askJq0Sm+YQhWqXbnbXRZHBN
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_170325_061966_85FE8D02 
X-CRM114-Status: UNSURE (   7.22  )
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

Improve the performance of icache flushing by creating a new prctl flag
PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
for future expansions such as with the proposed J extension [1].

Documentation is also provided to explain the use case.

[1] https://github.com/riscv/riscv-j-extension

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      riscv: Include riscv_set_icache_flush_ctx prctl
      documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl

 Documentation/arch/riscv/cmodx.rst | 98 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 arch/riscv/include/asm/mmu.h       |  2 +
 arch/riscv/include/asm/processor.h |  6 +++
 arch/riscv/mm/cacheflush.c         | 37 ++++++++++++++
 arch/riscv/mm/context.c            |  8 ++--
 include/uapi/linux/prctl.h         |  3 ++
 kernel/sys.c                       |  6 +++
 8 files changed, 158 insertions(+), 3 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231117-fencei-f9f60d784fa0
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
