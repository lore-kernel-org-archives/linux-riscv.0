Return-Path: <SRS0=T2Hi=MJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FEFC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 18:52:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D34121710
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 18:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ddFT9B5K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MP3W1KEL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D34121710
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ye8oUHt0qfsLiTAYV3eAbmgBfJjxPBc4flzt2ssWlF0=; b=ddFT9B5K/z2DyM
	Vt3iJjXBAvmW2lpxNWJMpMfCqCmt1D2IV05nWzTA8fdg1FvOSiL4wUeIaT+8XniZEWzpZUNqVt33n
	8x+XAJ+Twl76HN2DlVYuOh65i9KhkXYDuRPnimRRP4GbQvd5kwovX1aCI0QeNM/jyGbqdXEtFQHiq
	cuRj9s0xA/xhdnczv99jY3DzXDxFg1vOw7QiEuJ9H7MnsucCpRGlYSXXU2I46Sh18YEvCXvcNDTG8
	6eKOKNiiM4215jHZe+jbmZE7+/My4aMe18DdTD5ZT8u5XSW0jG9vPtRP/EjZxdaMuUI4O4SVpf9gA
	nafpDihjMx/h8rNmdFrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5bOL-0003L3-Ib; Thu, 27 Sep 2018 18:52:01 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5bNu-0003EY-8L
 for linux-riscv@lists.infradead.org; Thu, 27 Sep 2018 18:51:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id s5-v6so2527899pfj.7
 for <linux-riscv@lists.infradead.org>; Thu, 27 Sep 2018 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=azWPOKqWWFSGqe6aQhQ6tNpWbbpg2xrzIx5NPKK1yVA=;
 b=MP3W1KELwdxZbu0ygcHjtm/i4y7HO8qY4jczI9DxNL+GyVP7eXIev0Cb0gVTxd8Ooo
 jzf2xpjrX0gO8cuO4Sot6nR0lB3jEqC18kdNVXgKlCdHWlSSbUKOQKZwRWNWjkPBK16C
 GdBJMLa2DWA5Lyrs8+u7njaPkZS9ArZRoMKosifNbJ3ssSXHGL7fGAYE2cXg7RBdhs1c
 1zJBkhOwyZqRmNnUNkE8uJKsu9xAe8zN+jopD9kG2C8GnZlVlh/fH/s3Z3aB6ksOrsur
 TosjPqg+exXNRE0z13IJQmo+UHdutRih3a55+yhxEGYQ00ws6FQZRSdn3V/41JnCS/cI
 p6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=azWPOKqWWFSGqe6aQhQ6tNpWbbpg2xrzIx5NPKK1yVA=;
 b=TNmk+MNqKTVCXcLFxFV5LqvJI2bsudNNf+SPK/PEmPAdX02ccNWOOVZHFDrzvxQTto
 T5uDslGeJFFTyErMZuQtn9Ww9jik2EbME+mUQWxv++nbCZMwnnNLSemGn/PHTmOW14r7
 ErYQjwOKypwCC91VHOz3E5/XoqDIkjGARc9Bq02eiE86PEvuKtIYPbSql2AG0cR2zgxy
 odUwYVKAp4qemktq+rXs/gZe1rqq7sYaYM1AHn2AeXBiECduHWlCR2QRIPctifTPoMtz
 feTcObc/zcaxCnVhqYPPGGANG9l70tWJqUlkspUf3nKgmE9DPMKsVpQWb6P1uoRzaKWF
 Betg==
X-Gm-Message-State: ABuFfogCV3B2fnXKZGLpJgGMfoGuyq8pMSiH4wWRf69XFAYuBZHJEBZD
 +mFOz0FWtOTurCfVnDcdlmzDEGcB11s=
X-Google-Smtp-Source: ACcGV63kyLzh6l7CteavuoSH14wiZpGIpQyzNFKe2Nv8G1pC4wtckyjVdjO1Qc6n+ti1Gx0Dwsb9lA==
X-Received: by 2002:a17:902:3c5:: with SMTP id
 d63-v6mr12262827pld.145.1538074268234; 
 Thu, 27 Sep 2018 11:51:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e7-v6sm5630127pfk.3.2018.09.27.11.51.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Sep 2018 11:51:07 -0700 (PDT)
Date: Thu, 27 Sep 2018 11:51:07 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Sep 2018 11:18:36 PDT (-0700)
Subject: [GIT PULL] A Single RISC-V Update for 4.19-rc6
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-61f81f3e-1f1c-4b5d-a36c-caabba09a7b9@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180927_115134_333828_4202F9ED 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180927185107.lf74sj8fQPyBs4joR3YaLDyrVF-s4foOaE8d1McPon0@z>

The following changes since commit 6bf4ca7fbc85d80446ac01c0d1d77db4d91a6d84:

  Linux 4.19-rc5 (2018-09-23 19:15:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc6

for you to fetch changes up to 57a489786de9ec37d6e25ef1305dc337047f0236:

  RISC-V: include linux/ftrace.h in asm-prototypes.h (2018-09-24 13:12:27 -0700)

----------------------------------------------------------------
A Single RISC-V Update for 4.19-rc6

The Debian guys have been pushing on our port and found some unversioned
symbols leaking into modules.  This PR contains a single fix for that
issue.

----------------------------------------------------------------
James Cowgill (1):
      RISC-V: include linux/ftrace.h in asm-prototypes.h

 arch/riscv/include/asm/asm-prototypes.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/riscv/include/asm/asm-prototypes.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
