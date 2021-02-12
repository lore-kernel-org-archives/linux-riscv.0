Return-Path: <SRS0=T1n8=HO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5030AC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 18:30:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D052164E8E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 18:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D052164E8E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJ9YyeMTq/sArgqTH8JUT8jjnEivYQF/EbeU0yGtlnI=; b=1yYzWuVogzT7VoiN8uN2onKQn+
	LAh5bajU10/4JAFICrGlHfvK7L5nqoP5e7rYp+fikE09ynUX8Yx4M8//acJJD9PxFoomi/udgzD88
	gXGbzYbQKxMvnqQn49MFCdBGx/JnG6D4c53+i+T9Aou6sXuJoTcE3KyqTBGAAcoQah7lzmtZ1xzIE
	lUx7v/O22h781fch4PnGiz5xb94bVTJ+XM+euEb2fFxOI9JgPEN8VMeDuT6wsWNmxclZnLVwBNXAE
	xa+7dlBVN8/QPOT5riLEeGpqaUN6ThfvAVkNyD7mMKa/pR+6nJNUGhYjFnt29kjKYpDbizeviXkDI
	q17/mmKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAdCm-0007sI-B4; Fri, 12 Feb 2021 18:30:12 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAdCj-0007rJ-9D
 for linux-riscv@lists.infradead.org; Fri, 12 Feb 2021 18:30:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id z6so51195pfq.0
 for <linux-riscv@lists.infradead.org>; Fri, 12 Feb 2021 10:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=JbomQHAoZoGv/4dMz0OTiHTIjl0YKCnX4ahvGqfOTls=;
 b=gJnkxOsSoZ2/JOP8KjcKuuCyb+HmaeSo5Drk7PMd6QZDHfXeUUPvMx2g0oFZzR5vxW
 LSQFNKj5a90o+u9NejB+HKxwuBf2AMhG0kSDqZr/SmuWQHashrRrMPiXFTODQzpFYLcK
 VVlvNrYCqt1mjxGSHRmU/C22SDY06N3DrBCC1puGBxpmO+8elfMiIRmkRTWKZXVdWFh2
 56VqWXjPc1EhxRRdmeArKU6bNPem+FwTGd8Rz1m+pAuAi2d3CFrsE5Pc3wiaW6eIPjtk
 N7vsK4JKyrZPYh7XPVMIqmfB7wMlRexyFREA79f6/B7UonKNQ92r8ClNtHi1I7yr94TP
 9r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=JbomQHAoZoGv/4dMz0OTiHTIjl0YKCnX4ahvGqfOTls=;
 b=WCP17v3Bs8WjZgtR8DMbFa6AjOw75p2s/4olrfpiFB1Xa/kw3S2WpSDLqHneF0MrXS
 rymU8zO9wmWEnjMmEV6G4o6UM1gic+pJyWqIMLEhs2YG+ho+g8XRW+56fM+WlrHeTA3Z
 CPJK3N6eIBM6Ikv0ymfzEdUAgytnwJeC6wLCxVOhhgDvjHoKZg5hA/mr5Unxibw7xus0
 v/XoFf2Dr+nTUPvkhYV6cxdii+XYr3nKWEb41guOpsfieWRye6SbWJ1t3Fka/tS8iaYB
 G37yxXx30jRGobhLGJVMZUBD3KUXcImZ8rlcUDuz8R83c+v9D3z8hhm5eck3Hf6j6mpe
 Pv0Q==
X-Gm-Message-State: AOAM532V2XV3MVS/+DF/0kalE2pn4NIKc6805BQWLxrwr6fiuYP4HTBo
 wwEcGNC3Td5Bi7qjth3V65TqSbAkRWBfh+1B
X-Google-Smtp-Source: ABdhPJyCPSCJ8NaI5QTRkdam3hFkx5ohbtF9rmTgKCa3fOsZYUGWHytJsmzBRjzmcULh1Cz3Xs5IcA==
X-Received: by 2002:a63:c84f:: with SMTP id l15mr4438612pgi.170.1613154604747; 
 Fri, 12 Feb 2021 10:30:04 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s1sm9180166pfe.151.2021.02.12.10.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:30:04 -0800 (PST)
Date: Fri, 12 Feb 2021 10:30:04 -0800 (PST)
X-Google-Original-Date: Fri, 12 Feb 2021 10:29:58 PST (-0800)
Subject: [GIT PULL] A Single RISC-V Fix for 5.11-rc8 (or 5.11)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-30cf4392-0de1-4d1c-89f6-d260a072350d@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_133009_476508_0693AD5B 
X-CRM114-Status: GOOD (  11.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc8

for you to fetch changes up to 3da3cc1b5f47115b16b5ffeeb4bf09ec331b0164:

  Revert "dts: phy: add GPIO number and active state used for phy reset" (2021-02-10 16:06:14 -0800)

----------------------------------------------------------------
A Single RISC-V Fix for 5.11-rc8 (or 5.11)

I have a single fix this week:

* The removal of the GPIO reset method for the Ethernet phy on the
  HiFive Unleashed.  This returns to relying on the bootloader's phy
  reset sequence, which we'll have to cintune doing until we can sort
  out how to get the Linux phy driver to perform the special reset
  dance required for this phy.

----------------------------------------------------------------
Palmer Dabbelt (1):
      Revert "dts: phy: add GPIO number and active state used for phy reset"

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 -
 1 file changed, 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
