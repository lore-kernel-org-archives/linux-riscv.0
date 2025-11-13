Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2A1CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3o+dqWEasDxZvVPLPGzowImdQfXd+gKo6d0iEs3gF7k=; b=qiFNcwwayin7Kc
	XOP/zfjnEyv+gv86vqSC+Vnapj9OxmLZQqqwYEflnxsdf2T3SjdnuI+YeSu0DA3+7t55+QutbOKn8
	b8wHE0T9/YoYYR8StKDPDjn9ABTzXhJLecf2nDdWHlha6rFbr3y3CFg32cOESLmXDo5cPpii/N7rE
	DkZxNm22IVppBzDn9ionSZZnH86Nk5HOSrwVLKDIq6wwxCt5NOf00zkUlKLlDYYsoTLSob1TRALKj
	6IWXFuu6HFqb6L5NrGb1oCphV3MMnRPREZUraNqJrKqOTdpvMB/uWml6X5uSl+hzR8w9nYx/PZMcR
	iHO+04FUykZ33lnqVs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQW-00000009jhG-0fQ8;
	Thu, 13 Nov 2025 01:47:08 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQS-00000009jfK-1fG0
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29555415c5fso3310465ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998423; x=1763603223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+yqNsk4liq+0TyYbfqqqgCxYeLqjkF7jXxObMUTUHM=;
        b=SGWp+ezcymwauf+iXaqFWWcxl1Bvar859cZT0rxhIA/xYvUb5Qff/lvcTuG5obzkb0
         F32pX3g8mN3uQfRKaY5Ms4rsKmWAFs+hw0YAGj/DTio4d9eG/L70phj+aYiVtOJxNgS2
         Hqjhd/nxEnbRU1757hbF4a5mSBEgWHc8pshuMaDsqIotDHPGZN/sugRy889W8B2rPIN4
         FdIjrQa2Q2EZ4T+zEPlvXDroJMHKfYNyZhe0o2A/jifMAgD6PtASLuWnjnsXwTDtFYK3
         0ODEUbHZDZXXzLDsWnPfMxHQ2+PMh3pOVPx2j+45W5PuEJ7c3EnZl2selmiSHj71zfQa
         5nNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998423; x=1763603223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+yqNsk4liq+0TyYbfqqqgCxYeLqjkF7jXxObMUTUHM=;
        b=lwA4qgIiznZIN0uEsELTkHpcOpohA5phoyOt8lhystXRQJRjez8qZc3fnD9D3pKD0Q
         MPD9Jj7JUN6VyyXcGaz0lyHqujgPc07jbdFbJJrOv8p1+GdEmkzDe6EAsTGiqLIYPzaH
         H5DK+zJVFDnESwaNbr+OxGfscb4uIY5hNUeTRDenZRy1yci4ygc6p2vU7RHRWwleH+sk
         DB+SCBSstRr7Zbz7YYX+xX3QRRH6BrCovGORfDtqgp8OH6a10EhUn6ZsbhZt8J429/pm
         Rq0dCiFpelFqe38MBPPvF8eK4fEq+QIQNBrI9mbtPzzsM7NADvGTgXgFQ4A5Uo7aev2E
         8ZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgIDnW3u9ktMAzEzby6u6madFSvcMCR366egL7n29tlfWo0fUb8TzE2+qHWqtidx7mRgMKlz8zn+JfrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhWohBGo4VCSGn3gPysri3VZZadtBEi273B6CK476HC+lUvGVv
	P/lPEBeot0Tjqjx1KV7+94O39o8S26KT0F4RLWiYB5m8Oh5nK7oVa2vU2FT3YE3jgiY=
X-Gm-Gg: ASbGncvPGGPdZZXXTW8QWLkhUKS109a/Ia31uabV+2jr2tZgKWsWAfq+i4yDvm8MLDB
	N+gexOkGiDvLFgPN9o/NTViaoG+el6liqaVBKkaSv771I3EXgEIvQc6QU9XoVYUftC9HlU8xFmM
	0ekFjKxHZu8MmpZLEu5nsJ4Tvp0jjMLTUwfwH2EySrPLk9pB47s7BwE7IyZORQubMnvLRZhog7T
	j+x53hVGfwe6M818jLSgrmtlQds0X6TLiTUGaE6Xfqr1mi8eTfd1eHEoIetGLjynSzd80GtZBbe
	vkxYCpAvl7GeKvNrHkGRnEeAhVdllS/n9GH/96fpVDBMmt+SWWIdeYnZZwTWPBmw2WBnY02lO/t
	E7/6AKd5UPPvQR/3LOdflgkrfsZCg568Ie0S/9buiay0sSMaGiPPE+Tm2+Tr9CXOIFJyXlZujxB
	ofnClGrtb/swrb1x2c2aA0Xyvq+Rt9wWdV
X-Google-Smtp-Source: AGHT+IE5/byJkN6PUIJz0PFtm0m4DzcmYy5ZdKT+rzV4QNwdcHdn7EgBhDmqTxsB7L2xrr78NQwjSQ==
X-Received: by 2002:a17:902:d4d2:b0:295:1351:f629 with SMTP id d9443c01a7336-2984ed328abmr54095875ad.9.1762998423477;
        Wed, 12 Nov 2025 17:47:03 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:03 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 03/22] mm/dirty: replace READ_ONCE() with pudp_get()
Date: Wed, 12 Nov 2025 17:45:16 -0800
Message-ID: <20251113014656.2605447-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174704_458538_1930B7B5 
X-CRM114-Status: GOOD (  11.77  )
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

From: Anshuman Khandual <anshuman.khandual@arm.com>

Replace READ_ONCE() with a standard page table accessor i.e pudp_get() that
anyways defaults into READ_ONCE() in cases where platform does not override

Link: https://lkml.kernel.org/r/20251006055214.1845342-1-anshuman.khandual@arm.com
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Cc: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - New patch for v3 (cherry-picked from linux-next)

 mm/mapping_dirty_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mapping_dirty_helpers.c b/mm/mapping_dirty_helpers.c
index c193de6cb23a..737c407f4081 100644
--- a/mm/mapping_dirty_helpers.c
+++ b/mm/mapping_dirty_helpers.c
@@ -149,7 +149,7 @@ static int wp_clean_pud_entry(pud_t *pud, unsigned long addr, unsigned long end,
 			      struct mm_walk *walk)
 {
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-	pud_t pudval = READ_ONCE(*pud);
+	pud_t pudval = pudp_get(pud);
 
 	/* Do not split a huge pud */
 	if (pud_trans_huge(pudval)) {
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
