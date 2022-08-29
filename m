Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626B6ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vTRyKJMGdvE00VL2fnAnsNQDnA0FjTiCSXlyRS0W5t0=; b=TQyQC8LiLkuSEO
	JLDTF8RPhZP5P+mBkx0EcYPoMSznWJnaX8uFBhvXiqw9dhTF8NeDBJ1s0xh6+rIg20DT6uuR+ATr5
	0+3f6I318XENrn5TsdBUzgzakmg02p4oUQ15V1kY/46RyQJ9czGpoNm9S1/L2YFzvZefxhAd9hJJX
	pMPudePTpK7j9YIbQt4z42q7QoLbatR2SFO2M3rqaeP9z/dPcOIuo+yaBSeS1WyJGlEIXwNPqj5k6
	2q+/oVkF9r97L42liHBFDbi7+Bg98RqlJ87sEw3hYyfkZitQF+9a4RTBluukwswIk7Pv45WAOWXpg
	v7lgTLkRT6xFQqgc/BmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeG9-009wza-5Y; Mon, 29 Aug 2022 12:52:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeG4-009wkZ-CD
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 12:52:53 +0000
Received: by mail-pj1-x1033.google.com with SMTP id q3so4679025pjg.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=1h0GBYq+NzsJ/IQWpsMALuubNJw9yhw9UY7GXjQZX2I=;
        b=ly0bq1ZUCL2qcHcPFimIvf/jf2n+3ztJSeEDt76XL8nGh/7Vdfya9mlUMRvFnmI91M
         H3rOxCSe3ZGibiyt0eRCJF6ZwLecL22VRrXsa3aEPF4fVUjUb7hxhgVIBC8/h3ZEDNXe
         0gATDU9hxpIdN5OfnsTvkFwfJTkedE0c3qjPjgjCV1YRKIdTwaVQphn547SHivwBniZl
         d42yw0AoFFgwUM74b7V+hpD7Lcbn3sMUu/X51qEpjwBqv4mvw2H/HIRwCNMa9oJFkudy
         kkIW3wvE4SUkCnDi/GPbL/d2yiHBIvrkdzbVYa+DULtsMycy6sjTKdFNbF0AIsQLKNhG
         LO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=1h0GBYq+NzsJ/IQWpsMALuubNJw9yhw9UY7GXjQZX2I=;
        b=fxtyauv95q5jr6DS1Q9KuGUinvWg+bXb1nxm9Po6XDtTJBK8D4ir0/UgOlZdLskiIZ
         N067SYUe0Vo6IvyBdVQ7fS2x20crYBxp+Rkd80Z+VplJDWyMoH0hnhiPvBk+QyeFT6MQ
         Yw/bGY0rmfYGahL2AgyhMG4dJ3t2JjWsSepy5fN3m4/bvP5SM6/8g0LWttXLNWcFzcpP
         zWvhFUlQjHVte+4pwug34AT8OAsUgM2ejoGAAJWY18wDv+G2TOhwAakS6SX/es8Q5R+p
         mEwmsEleGNgilizQnWAzQ0Ilr6ctdDZ3c+nGyhns6kKVRjKo2s4cmL/cmKn9hr7iLXwK
         Lo/A==
X-Gm-Message-State: ACgBeo00t4+KetqFMO9r2zrzPLmsl6PDk4MpcvOK55ylj89XijtFFMBK
	BjbIl4DJSH0YwQxTdlfxNtEMfteOQXzE2g==
X-Google-Smtp-Source: AA6agR5GnXD87AIZDH/MOs+m0yJ9z56WeZdrn946KWQs2uuKa8c1y3AeCfRoXvhxEhTjciRVcdOgew==
X-Received: by 2002:a17:90b:2745:b0:1fb:1666:80f6 with SMTP id qi5-20020a17090b274500b001fb166680f6mr18203726pjb.103.1661777570505;
        Mon, 29 Aug 2022 05:52:50 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.110])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm7517607plh.170.2022.08.29.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 05:52:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/4] Add PMEM support for RISC-V
Date: Mon, 29 Aug 2022 18:22:22 +0530
Message-Id: <20220829125226.511564-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_055252_433004_58644FB7 
X-CRM114-Status: UNSURE (   9.18  )
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

The Linux NVDIMM PEM drivers require arch support to map and access the
persistent memory device. This series adds RISC-V PMEM support using
recently added Svpbmt and Zicbom support.

These patches can also be found in riscv_pmem_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (4):
  RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
  RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
  RISC-V: Implement arch specific PMEM APIs
  RISC-V: Enable PMEM drivers

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/configs/defconfig        |  1 +
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/include/asm/io.h         | 10 ++++++++
 arch/riscv/include/asm/pgtable.h    |  2 ++
 arch/riscv/mm/Makefile              |  1 +
 arch/riscv/mm/cacheflush.c          | 37 +++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 36 ----------------------------
 arch/riscv/mm/pmem.c                | 21 ++++++++++++++++
 9 files changed, 75 insertions(+), 36 deletions(-)
 create mode 100644 arch/riscv/mm/pmem.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
