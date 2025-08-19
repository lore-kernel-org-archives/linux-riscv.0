Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CEBCA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 18:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y8hupOQ39teoOzd1pJ8WQswr8eUu4Lt0TecTpE1VBrI=; b=CJKzY3ZixbECVZ
	6DMguGF/CA57iXkbHdCOoAv1qJHI0W42T4tRKd+6ffY58WbXcB9byHnK0CeL93aSVW9Y6wjTLKwbC
	jbaUT4JFUbmDCdKfGR97tO2ut9/2uqIMgOIeIOPL1pSxImgDQoov7nXB7xKCnb9pZl8u9QM7d4BZA
	/0yZ1iS9GSWyLJQ1CUcp5DE7UmZVRDkvMlAGd8jvXbchIUmuyypkP6VQ8Lomqxl03i3sdhElpwuHp
	Vg82NKLci/TLoiXHx/TG5UiUjQ/2TAwQCMqifFwhs4lZA4O3H57sxTiIFhyxwmmbZAKdA8GBle3PD
	az5yUkiTsN9vPuv7UcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQr6-0000000BECg-0qCP;
	Tue, 19 Aug 2025 18:14:44 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMjD-0000000Aeve-0Kyg
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 13:50:20 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b4746fd4793so1810971a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 06:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755611418; x=1756216218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9TJ4yjgH6QJU6NhC4uJmmFxWtgzYAcw2NPkZcqPt60=;
        b=hYPjchz1JuDVGWqRrK9jvHYHgVl37jDsmIWKMx76CQIGVZfs/1Iri/1+T58g43NnGL
         hUYyrppSDfGhjC5ibl/stU1Ji9/2dOZP7SbeYNqfGetH+07lJh85tNztMR5Uzwu3pcHs
         z5SrBk+U4dwdlYVliN+aMWGIjAWZEL91/YbJyGZovFgOpvJiwvtrG0JnJka0T7FEEr1b
         cF8KPuncJnoC2lOYZtu1zzdc0XkCvgNOOvxcnGLhU6OGVSwki7xkzKpfoMihtnNXPqdS
         WLchFK3pM2GsSThL+VSBK4RUBQStEyyEHCBj2XHjctXlTdTaaGQPR70G334KhOMiDYZt
         WSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611418; x=1756216218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9TJ4yjgH6QJU6NhC4uJmmFxWtgzYAcw2NPkZcqPt60=;
        b=dLufrW2CQQWIMBfums2bTZE5zj4ujNNgDbaM+njOvauvbg6PzvoeNh+ZexYsT2q5J8
         z5L3s2IUGblnVZNPy3v9Ai5GISEV6sbZYusqgF47s9JU0Kv6jC9um2DsINhIKHQLqfq9
         X/J0JnZlMM9ZCp0rPfF1LGZQGC0CSx719aJTSMutAeTAk9MpWrRwU6t/LtRVhtoJpzL6
         K4wdnEiV0pnEZ6lVnPYdmtariPQ00g4iP+E+LX9iLh1Whfk+5c4fDkGZ90xExeLXtbpw
         yTFXwc1AGmaB848yq/an9W035h0GGCaW8kENQyNPoTakq0KXoCq2inB2A4wttObiu6sR
         lyXA==
X-Forwarded-Encrypted: i=1; AJvYcCUG+3ByWgVDnEt1a/j43CaOZ9q+myPj7QnVIEuVSxa9GS5bufuD8gjN3I86fOXVqmgobjlnDGaDqIQfwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5c1febVqJwuSxwXze8NkCwWHhetLmHUCsTyvPDThx3cCVyxk+
	9oQKsifFVHGDO9OvskSri5zgHYArubGtN7mgerZ8pzaXVuQa30wZa+OGTK0W9U4Nhhs=
X-Gm-Gg: ASbGnctScEocGoL2DXTxHK37b1xaX/3K9ECFpn/35Z3gjg7ZuIRZTFCxYNPAY1wIjE6
	t54bPjCNL76ztJCzJNvkEf3N5pHT2xYf4fJ+jDXTBmrKC57StOv9RbDDzncRUpq9ClFVDa66Dbj
	FuwpVIX5iuk5b67CxeO2snuRIHr8Yz9Mc8x10VjoA+/V3GjDhAwmjY18/93eHJvAQCZeKte0LMi
	QTTPJJDvQBSyJ0DS5s+wJDOo3NMnRoppYxix+0rN82nUZ0iBvutdwrLIscz7CDliGnwvftY3QcB
	0i1BEb1ubucCa5pnYI1gn6Fi0qXPWjTsMaZ1uJgUQpGOxPolPkMEZd/t0A6KSddoyiz+4tkgYus
	EhY3GOeD7S3XvDLZtDm6J5h9LuVrIzQ0mrPqJQiEaqhrlL0OePIhvWimY
X-Google-Smtp-Source: AGHT+IHZy0Y4108SytN6YUHUMh4gN5FYzipiyPM05e4guHvSQuE82DjG6I5AZlKeM5wR3Grwk8hS5w==
X-Received: by 2002:a17:903:2282:b0:240:a504:cb84 with SMTP id d9443c01a7336-245e047bbe2mr35948055ad.30.1755611417766;
        Tue, 19 Aug 2025 06:50:17 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5533c4sm109937815ad.140.2025.08.19.06.50.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 Aug 2025 06:50:17 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	linux-mm@kvack.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH 0/2] riscv: introduce percpu.h
Date: Tue, 19 Aug 2025 21:50:05 +0800
Message-Id: <20250819135007.85646-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_065019_117538_EEA0C602 
X-CRM114-Status: UNSURE (   6.36  )
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

Current per-CPU operations rely on generic code using raw_local_irq_save(),
which incurs significant overhead. This patch optimizes 32/64-bit paths with
RISC-V atomic instructions, reducing overhead.

RISC-V lacks lr/sc.b/h support; without ZABHA, emulating 8/16-bit operations
via lr/sc.w would require complex mask logic. However, data shows 8/16-bit
per-CPU operations are extremely rare (single-digit counts in boot and
hackbench tests). Thus, we let 8/16-bit ops fall back to the generic
implementation, avoiding unnecessary complexity. 32/64-bit ops use direct
atomic instructions for performance.

Yunhui Cui (2):
  riscv: remove irqflags.h inclusion in asm/bitops.h
  riscv: introduce percpu.h into include/asm

 arch/riscv/include/asm/bitops.h |   1 -
 arch/riscv/include/asm/percpu.h | 138 ++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
