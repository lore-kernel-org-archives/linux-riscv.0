Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EC7C28B28
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 02:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l8xnQESoL5WLxzgpsHXrVx4ighRHUgRaoBgCha/qt98=; b=A8ykDPc4gmwTW8
	uZH43+ST6HY1hzsNO9KOkj7NWICB3Dese1772Rmkd1z4vaqNeold98LK7Tocs9H/lYntmef4fK8j3
	1KYdthR3BA93rgx5zIKe4O4z6UCTE7Zlz/06nHO/meHXNhqzFFQkYHhFMGEYhZKQEUiTCQaBNVcE1
	he3f28QcMCe0cflwS4SuD9Zn9G/8bvsIc/z6+yorD3Cy62mOz/ousLgxwNnELFrdAHIkHGstBdKhm
	UbWSXWhF6NclWc1aU1UQEfYjR/cEBevdmf9uR5ztlWgC9Hb1sAfJtlQmA+sQKP0SPVLnGBegom+Mk
	0UzlBTVYdPhn/ugCc+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYAy-00000009urt-41jp;
	Thu, 13 Mar 2025 02:20:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYAw-00000009urV-13RC
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 02:19:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22349bb8605so9507895ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741832397; x=1742437197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2X0zLRd9NddFffy12lVG5DNnWJTtdDxYSURxmcbPPGs=;
        b=H+RGCSxUu+X9u+wQf2RMDFeNe2jd6TQ5lXrA5oPhyg8cmtLw2C9mF9rK1KB+XtfnPP
         IFGOgPOPur/Kl0aNY1eHqnsg51G6BYnvt9SHxR6YFfkKX+LvoKrwSSCXGiCfwRMKQp3X
         83BJ3lxMcJRyUOL3kCpJc/bIhdFMwg0i2m7jEWPvUD5gMnzjZ/6QrMsfvFishXNORWug
         76bFmekMaZsujupMqgrf+qMvMuQH6r8R1vUMV0Rp3HjqNY1uMbIJRCtlDl7FXTOptBeP
         aYW4ZI0Cu3QTnKBbNUDoqoACCLsklfe5/dHTcvR02oJtePMxIDNeHrv49srQp+U1ZlRL
         jrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741832397; x=1742437197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2X0zLRd9NddFffy12lVG5DNnWJTtdDxYSURxmcbPPGs=;
        b=qO3vEQhUaAgwIWjbAGKQAjT1/0M0BtLx1EB7hOOEuTbw/mibtIVHECyjsTC70o27gH
         SnpRgga5tRxGwPXr86nwls8pA/Cmfk0k33dTaU48SIuOCfP1hJz3n90sK8ICJAjKpBEe
         F2FbreJtEcDSpXsYvbH4GveOswKD5lezdWcCMYmN8ottj7qp29UN6qVnt4leXsL7YCBa
         rxWlhayeic+Dy/wDaG2GkgAG2C4GVu8vbl8+1iCZmQA2pj5+SKuqW12v7r3UcWEG3Iyk
         GOU9hg45fQzbMhVmwUjhWtSkzOPLKPk16nrabqMqum+AjMfouIy/ET6/glDPqhtK8epj
         Vceg==
X-Forwarded-Encrypted: i=1; AJvYcCXeCiwxPLd3KvuFC/rGHrqbyBAT5sIWtzHf7k2UsIXpl987cBBO7OvnFJTfgQUJ/FR0zcrUTKfPi/EeUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2rp/SCYj7ucuolh28BwI4nrj+UEzzsroVq+ZV5vXJwqx94MV5
	8tgVd098tijfuJ2lUqv49v6/dcXKgxPzNkx6WYFB1q8mkBCdl+qK
X-Gm-Gg: ASbGncvqTevkqMZ7NYAJz8lbdRUNE0ibRynXOL0LTjNL2d53PXq0Tx5/nN///LbrAEO
	dnmadvjUEnaIqHNSpXGlh0qI+rySwx/8C4bmOWm2K9mlCwURUORyz6NkuzBFwk8vV2y9L3bPTri
	KCYnAQGQgDu6TGok7aPXxatgCVoDtpIPIPPfL1YiMyeo8b5NN4SPtQc0zy0wScZ923uaz0JfKOZ
	qJTpnMXpXgqscHLY97gldvFPuGNZJl7WZMqTJwtLVnO+ygs664cTeUU7H1FQv3+Vz/XKONSPFsE
	ls9r8jQaVKnUOlOQvxitHwFLu4i2ezD0Ed18lP5Plp6q
X-Google-Smtp-Source: AGHT+IGUUbSyJ0QDHcHkMIAjP03ULd0lMeCdX1HDPPOjpdH715uX03jqaD5cx6WCzUd+w7d6In6D/Q==
X-Received: by 2002:a05:6a21:7116:b0:1f5:8479:dfe2 with SMTP id adf61e73a8af0-1f58479e277mr20721508637.6.1741832397552;
        Wed, 12 Mar 2025 19:19:57 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea7bd0csm242006a12.47.2025.03.12.19.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 19:19:56 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH 0/4] cleanup dead code in nodemasks and cpumasks
Date: Wed, 12 Mar 2025 22:19:48 -0400
Message-ID: <20250313021953.86035-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_191958_310593_9D9333A8 
X-CRM114-Status: UNSURE (   5.28  )
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

Cleanup dead code in nodemasks and cpumasks, and while there, fix
set_icache_stale_mask() that misuses atomic cpumask_assign_cpu().

Yury Norov (4):
  nodemask: drop nodes_shift
  cpumask: add non-atomic __assign_cpu()
  riscv: switch set_icache_stale_mask() to using non-atomic assign_cpu()
  cpumask: drop cpumask_assign_cpu()

 arch/riscv/mm/cacheflush.c |  2 +-
 include/linux/cpumask.h    | 19 +++----------------
 include/linux/nodemask.h   | 19 -------------------
 3 files changed, 4 insertions(+), 36 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
