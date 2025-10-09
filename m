Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2A2CAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmCoHGBeIhkqdI9FWmGx1QndVr2qucFno0TH3YsJceo=; b=sZAgQ3J26VFqIK
	U+hk1G1Q2Cexzk+KFXZpj5vdhImOmkGEtrcj+o6KzNefPK17u16SeZeIxGG9nKrGmUQJdpMEUr8H7
	hpldbqGzPzgtHstKFw3HVEFUM58794fBQdWiPRoPJFe+svj6VRt19vSUFzf7Kt9RrmviZU07Z44Fj
	S37refdCefIjeXHlh1BcmJOehH8iQzt8ohK9/5ONQpQpt6Uk5E8jQz4RUPyyp2FNeWahdcMfQiKUp
	b0eefFg2pX8wL7fo7Apu7i+kG0jFtpN6efrfHvNheMTfKW42yNo8w0s48Svlur0r+IHBKRIiHH29i
	8MMH7S+dmuJ94CyaF4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvk-00000004zG9-2y96;
	Thu, 09 Oct 2025 01:58:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvi-00000004zDg-0u87
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so4959065ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975133; x=1760579933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfdCPw2IgJr1hV5CQEQggBFG3P5nbVH7ubzcz6g7ycw=;
        b=in0el3ZlXASXNWLKJkvG7azOOivCi+thk6dsiljmnir+H6bvJaC2H2lB+/8DXsIezB
         HH5w/YbRjNKHFgXtSovBTTixdk/2vQ0HpC+aynzpdg+XM5XjTH6Ah58juRFMP5yARnOP
         dmprNJlWH5jnYhbtkuaz+Dn7EKXEcxv9MrCQcE4TGEMSZxln+YzloZYC56M/NzsGjG0+
         3DGv42rwByyh+4LfJ+hXhZfCduebfjuRefclEcC8FXz7F1Oivm38RKp4wrQPux21zgUi
         1tgMccbYucY6IjNCaBNkuhJVXWu1DZWibzwNoWSXiuNX2ZmHgSAe0CtY+Uz2plxLmhtd
         cg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975133; x=1760579933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfdCPw2IgJr1hV5CQEQggBFG3P5nbVH7ubzcz6g7ycw=;
        b=w1kxmEg0KGrmIypSsWZahAtm1T0xP1RtNoCwdfExKlU2Frqh5uEvtfC57e6So/Ql4Y
         QO5nnCMXdo+l8tTthbtZfHH/NFYMvq6YdDPT9EbFI8Cf/g5UzfKe4Tp69toEd2J15rKB
         In5dw5hD85IGRCovG4GE4O0mLOYgzYmxvJToVykNhZZvkv/Fj9z/0nXLD2tfMxi2D8wY
         QfPpErBBtMcXC5GypwZEJg8TuJSyDzkHtMAYK/PLl8JA2dhtnc6kuleV/go5/6rSK7Sm
         pwJqqRXPu0BQuOp7mpZp+ukln3HnvH6sr37Xu70iFBWV9T5QwOvhR5t1unFo/3NjLdfT
         F6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWUVaQVD94w1Qc8C59bbijLB+AsZQT83UehyORv5dp1dlA3u/poaBUDebnxvnYwIpNQXKkFXKteK8kfKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJlEfTynz8EBd1D4yF3I6l1sOxGR2mR5D34DSA8g83bMJCJbT1
	729tL4JLEwNdGFbgl46/pib4aCRSoFnscSm2aTC842J1v+2TY5XF59jMOYa7cRtt+lc=
X-Gm-Gg: ASbGncsItiV4Qw3uBXcizRnJmx4Dm3NiUj+gNYMbLtJhXpUT/FOnu/p9U4f74fyjzRr
	4LGv8JBzjjozAOMNjDBIAQHm0y42I1Jve4WqoeAAYJQElTw6mTlh+e1N9lhAlaxzlIx+UXhAOqR
	iXRymFoOga2/VRBTEgv0NgSyg9KMvtNqftwP2sEGqJcjXcbU7p+02p+vUS0KHW9PObzGjajIkNh
	Wa3SDIpL8oOm0ggyOgRm0CfDLQ9b8X/zJ1pmgExIOunQqcI2gVByGOoevNAAZ4QZRNwEK8Ola4f
	RQ3j57az0TSgpjCkAFYSQg+2FOFbfyIvvxfF0vT9wPARRyMqwJbQHoCdt5nQau767jEkZjqZob/
	ZdlSW5Rp7feS1MdL/+vcWBTBGvugBFyEWADPPY+0uhnMhPulor9elnenj/XR8Zebnb/i4
X-Google-Smtp-Source: AGHT+IECa/siV4SXNVKe+S+DKZ7Fr1sjCiPZn21F/lR8t8KUoN1d0luw1JkzSMcpjXsSdsF0G571uw==
X-Received: by 2002:a17:903:94f:b0:290:26fb:2b91 with SMTP id d9443c01a7336-2902724dc96mr73646385ad.0.1759975133415;
        Wed, 08 Oct 2025 18:58:53 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:53 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 10/18] riscv: ptdump: Only show N and MT bits when enabled in the kernel
Date: Wed,  8 Oct 2025 18:57:46 -0700
Message-ID: <20251009015839.3460231-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185854_326284_2ED39250 
X-CRM114-Status: GOOD (  13.89  )
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
index 3b51690cc8760..6608162459ae0 100644
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
