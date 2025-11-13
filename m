Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D637CD4F35
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DRtqR7DoB2C70vU+uMP/s+Im+4mhLp8Kqs53Nv82lY=; b=duGTWCHzYD8Iq3
	RXgnkMV+zn0LEYScPJnYUrKfWhG6/h6iYK4xEKxcQh+6etu7lSbyKjxOJC+d3mnHVy1G9KFrYRcym
	9c9ntiRm2LZmUf7gVoLFMX5QdvDZZ42NNjGTmYfqLkP4CNsdx3Xo96gaBxNiM05MtICqIQPgkeZ8z
	v0LCtIJKmdBMVye3WgzD/+khb6yHdiuK5G1fmx5FnxkVRQPK/C3w0+W6AWShiGTGYJLYUFOFczP8c
	msXIhZQLY8ZV0rkd0pYKkrxGFeB+j1NhtTa+SGY4R+T0z0pUSYpS2ok2PmQz+6ujl7bQsuIpSjlXS
	dVH8U7r46t6DQpIMz4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQj-00000009jrE-3E69;
	Thu, 13 Nov 2025 01:47:21 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQh-00000009jok-3HPq
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:21 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso176368a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998439; x=1763603239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61IAp/RLZglhPiTIaYZ0zqBWXh5TU3+Z1ZyRv4wlW+o=;
        b=ZgL3lyN3DSWCfqHXnqI4mEOTIaEHwNeaSMiZGs6Q9Zk35aaJjy5F/+qwieaJ2yK6mI
         juKEiyTd+2oXKNcbA5gsMKaNyZJfdFVoJsDQalngZs2SOF/ll6xgecUSqp5hdIxdsaBr
         xkXOCDxomLdCH+TY2y7c8BwTUAwgaUmXK36CzaJ9LJ+S/Ed3mKLPm9tH4uLkQai16Bu8
         t6UKiXybdSzlLqHEM+TmyZvE95v6ZSEicODUe+14AAl6VEEpJC8eqU09OWganQYw1r68
         uJM8n4SSQauT32CvIb+JT24rxDgdJHOGJx3PjwGBwq7e4Logtu60nBfz680SsHrfe7d8
         7URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998439; x=1763603239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61IAp/RLZglhPiTIaYZ0zqBWXh5TU3+Z1ZyRv4wlW+o=;
        b=iyiZ7pJvb6emCkU2cpcGVlQ8DUROeyhmOLxDzpjotvP/HaIsX0OfN668iiC3uPVIfy
         OxWCy9B6kSKfHpeogE144NNZmlWgO1Pzr8ETvNsLCMPWF+kzWAggytMqmG2F9ARbD6cj
         Fz6ptDR9P3oPWyxRNoaFvQGSXOH0bUfPoSi3fdbkXXMtX13HVybjy7d9fQAKqWdrcl6C
         tfYJawEF3+d6mQSemXeGWCHarJekRTtc+ZC9DJc28v5qkcmalJWXnYu7k0QPKrvLi+sM
         y6LCG5UntcPXJboq0P2mNX9lzISHCZIaHCgrZRSelB6A0NT4J+TdNAsY5UACdxBks3op
         Yjcg==
X-Forwarded-Encrypted: i=1; AJvYcCV7gYquvCTBZG6tLFNGbuPL2awzcTIEvFAzo14gpztaPGsRM4S6Ti3kQOBs+q2kyVlMAdFGlFdpHJRrVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyatwZCDddCcfj6ePFOfc6VlOUkiqaz9uWHK5Brn0YGTDDUT+F7
	QAXQgUyXI9tQbOb/DKeJfJEUJ+Fuy+BrS70Q5EXGiHVwBp61cjyhrw9GBlucsQ2B4OA=
X-Gm-Gg: ASbGnct1SIdirrkiVCOzPHipuqsin66D9ZmEFVA3lDIiK1NMlOP+bf0XUVGVS0OKhdY
	K4NTVKNfpuBSHJ67l+GNZb6+6zW50+jKX/7Ka/iWs8Snl3DJ+HXnchd7d/HPlRDmw4VQ+93mFTy
	vWvHg7CiWnuu3i3clPYpIsnoX+FDpfESwy7lmo5YqJfoJSHjYpejiSVWpszLdu6pstaATsxPrHz
	LcHAUWpni8NDCsF4OERdw+zQ+KzlarP/0QHUjOg8yQ/ShlQFNrv4DadiX4QQ/+REze653F+g2TQ
	fTtFHPvtHLQGYJNHWVaEOJ05TNl2PpFJaGtF12j4su66PBTpbikydov3HbiybjVfBauACGvTw90
	EiOsSrlhYhcyiKdcTTfAlLjSPZbD/l0q1i+S8TeqEbO6/NM7lp/eEJsmcov/KM8s+BAROvQ/cPh
	UBXBPIiAA1/1Qb314/+n1F8g==
X-Google-Smtp-Source: AGHT+IFQeTKY4sW5xPwKJekSx5UPto2J8a08JXV7cfYp4pOZ2iobnw+lqJ4IrO6RHskdtg/6++UDAg==
X-Received: by 2002:a17:902:e5c3:b0:295:ed6:4625 with SMTP id d9443c01a7336-2984ee0459dmr58942605ad.47.1762998438873;
        Wed, 12 Nov 2025 17:47:18 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:18 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 13/22] riscv: ptdump: Only show N and MT bits when enabled in the kernel
Date: Wed, 12 Nov 2025 17:45:26 -0800
Message-ID: <20251113014656.2605447-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174719_843918_6B1A406F 
X-CRM114-Status: GOOD (  13.37  )
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

When the Svnapot or Svpbmt extension is not implemented, the
corresponding page table bits are reserved, and must be zero. There is
no need to show them in the ptdump output.

When the Kconfig option for an extension is disabled, we assume it is
not implemented. In that case, the kernel may provide a fallback
definition for the fields, like how _PAGE_MTMASK is defined on riscv32.
Using those fallback definitions in ptdump would produce incorrect
results. To avoid this, hide the fields from the ptdump output.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/ptdump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 34299c2b231f..0dd6ee282953 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -134,11 +134,13 @@ struct prot_bits {
 
 static const struct prot_bits pte_bits[] = {
 	{
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
 		.mask = _PAGE_NAPOT,
 		.set = "N",
 		.clear = ".",
 	}, {
+#endif
+#ifdef CONFIG_RISCV_ISA_SVPBMT
 		.mask = _PAGE_MTMASK_SVPBMT,
 		.set = "MT(%s)",
 		.clear = "  ..  ",
@@ -214,7 +216,7 @@ static void dump_prot(struct pg_state *st)
 		if (val) {
 			if (pte_bits[i].mask == _PAGE_SOFT)
 				sprintf(s, pte_bits[i].set, val >> 8);
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_RISCV_ISA_SVPBMT
 			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
 				if (val == _PAGE_NOCACHE_SVPBMT)
 					sprintf(s, pte_bits[i].set, "NC");
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
