Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB28CD4F40
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8JEhBiuOlNT9p3fzEA5rvewVDlqASkaewrxQ96yvTw=; b=rmJcyY8EOW1bRn
	I8kKCPbKuXb1JmuqvPbKrpDyDoqOWkqECIXkWc16yt7KX0MRP8trQmkWiRE5Jepq+n++4Eh8lXalY
	oXBPmKDpNaARjTGJ4WyBjpuqbUJPfuD0V/hmSmblH6SSZjt/pMsz4HOU+JyxmbvYmz0dScNKWTRCr
	ecP8VvcLXl1al7zIfWbnnjh/OjWV4YwpADjFEnvsH7347dHybOqdcw6x12h7rZrSKHYt/V05rx3rK
	m5B74sIVU8qYE0diTbVocebn8IcO7zUm08NlBqo7IkAMALaEGso2542m941AW9P4uqoLXN83uS6r/
	fduypd9lj62LX6e98qMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQi-00000009jpU-0ODa;
	Thu, 13 Nov 2025 01:47:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQe-00000009jlu-3AP4
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2953e415b27so2453185ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998436; x=1763603236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhqbfzFBgO5voylyQ1oE0qebaNihNkFkz8eAAFF/X6s=;
        b=J8kUpPBTPdpSnXxCurvTgFwbGcXFW2gAiQ448pMKCF1/eHIDdKc0PTzcfyG0/3rJZz
         DhWjWmm0LamkSL2Ia5xMSJcjjk5GKf6PL4Q0yw5Iae2QyU0xlIef90cpQ/RaWpSAgSfi
         K4Opj49RbqAiLpwhhSvPpriYZo5FcEGPI9o6QxSujwi2KBkp5+b66f/KHd77v8jZB4aL
         utoATIURLWqfwtWKlF8KeA2sJ6I4yuCOhPClzSdbPtrm3oyFkEgpqWPNkcD7DcHrSK5B
         hsAs3NfseXXdzKzqwFrUGUzpmchU4bmdg5ygUYEnimiSxFmC5cRmHPDOXoAWBBEBfOzb
         E1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998436; x=1763603236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FhqbfzFBgO5voylyQ1oE0qebaNihNkFkz8eAAFF/X6s=;
        b=Nn4/9AbjQtFdZtpSOwRFmWcmGOrgePSQ3CKVpeYLE448MUuyQyUNsQiw6UHPyPUiz/
         pOf0+wF34e3WFNlizeXGhTQdVOffbFYfZ+PGUrtPDvnhRaP12yY3gJpsNb9GMbl/VyX3
         IJzzzHgNaxmift/7aZlMje56I1NZkMOVQDLAUin4ABvEo2nuMp5IaLRU6MZGnmEhp2lV
         Disqw4GV7/n/jxlRluQa+qpoK+USNGZhng9E/n9mF79G4sxFIvjukxX4xnZzR1IyD+yU
         pJBITXww0vOH8lWpHhCi6fQhxqTByblOQ6JJys+EsVoyFtL1XmCHjlqpZQ2/Ui8Rv1Tm
         FjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnJDqQAPX33ujJ8d68yoMuXndS7AEPgXfNLwDGCA2gGQLTIOZLmYiG94Koy4gxgn8ni2+A9uaxtJiUNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEBZqOhUZ/WlYlp4/lDDeOyKGiBw4rHuY7owQd7b/bK8tefVsY
	W0KrIVeVOujkphwA5r2VkD2F5fRDkcU/DULcnDX8qhNnvTw+UxB+qBxdq+lqYHqCZVw=
X-Gm-Gg: ASbGnctZJSyzcL3VbyknEitVrXx0hJxV6C/BLCQQLUrL0thrQIQJGEUpbUNNQjqvZfD
	s6u0QZdSFOhol+fqNQ5QWYQH8xaQZ+f8qkSMJq18KDHSxeqfE4PKpNJtzquznbxLCADOtyPXJyP
	5zSSijl07Nv03pp9wrtR0/5oxpsogX9vun8SV4tlXgP6kFF98N29elF32J07XpKELWoMojv0lQz
	reBKPQjQSK8k8m8SaztxQn9CKP8WV25em+e1qA0vu01dzUVAORYuqaIggDS6z4SdjoS9SJ5iIwj
	HVZKeu7T0wky1v8YM1bU4m+CjMWbIqFUwBIQhqEAqANNE5CJtrzA1oI/x0glHmJsjz93LW6shMx
	NG8M8QD07+iE4erVNmlxvEgYFitgkJcE3ZKByRY3jQxvh5qvySHgo1E+9NsAYa+K/zglHHjGoYO
	z8auJ6vAcEGZ9qUMjJUJpT/PVVzkWDaJDB
X-Google-Smtp-Source: AGHT+IFU3ZD0WgCFLGesvoHcSqmefP/DlaLr5QtMhOO16RVbV2tzjU8K9lCg5h0K2mU/+/PVAIgbRA==
X-Received: by 2002:a17:902:fc86:b0:298:1156:acd5 with SMTP id d9443c01a7336-2984edcaeccmr67224805ad.39.1762998435872;
        Wed, 12 Nov 2025 17:47:15 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:15 -0800 (PST)
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
Subject: [PATCH v3 11/22] riscv: mm: Simplify set_p4d() and set_pgd()
Date: Wed, 12 Nov 2025 17:45:24 -0800
Message-ID: <20251113014656.2605447-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174716_796821_18F206E3 
X-CRM114-Status: GOOD (  11.08  )
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

RISC-V uses the same page table entry format and has the same atomicity
requirements at all page table levels, so these setter functions use the
same underlying implementation at all levels. Checking the translation
mode to pick between two identical branches only serves to make these
functions less efficient.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/riscv/include/asm/pgtable-64.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514..5532f8515450 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -275,10 +275,7 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
-	if (pgtable_l4_enabled)
-		WRITE_ONCE(*p4dp, p4d);
-	else
-		set_pud((pud_t *)p4dp, (pud_t){ p4d_val(p4d) });
+	WRITE_ONCE(*p4dp, p4d);
 }
 
 static inline int p4d_none(p4d_t p4d)
@@ -342,10 +339,7 @@ pud_t *pud_offset(p4d_t *p4d, unsigned long address);
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
-	if (pgtable_l5_enabled)
-		WRITE_ONCE(*pgdp, pgd);
-	else
-		set_p4d((p4d_t *)pgdp, (p4d_t){ pgd_val(pgd) });
+	WRITE_ONCE(*pgdp, pgd);
 }
 
 static inline int pgd_none(pgd_t pgd)
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
