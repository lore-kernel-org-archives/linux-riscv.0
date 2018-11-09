Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F799C0044B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 03:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234C42086C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 03:13:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EJe58vP3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WopEE9w8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 234C42086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5mIAYBWaZU0gyrM9uDtvN6Xsir3PmEAuDuu248+S0U=; b=EJe58vP3TGxTCU
	TNwHzblzO8616HfJ2hpdangN+iP2VjqzKk1gEtF+6+UrCkfPgbDrUJ8hgyLmq5PBUCpjX1hbp60wt
	IgAeRU8UpCm2s/f/Dzukk5rnt+k4iaJqXP58wD7j4hkrmFwIg5ajFLtScb0vLDRj1BMNa2Jujzl51
	LTZWkd3ebBxKyY0Y/yuacou6qgvoXPD5ZOFfD5ryyD/sU7Gv8oSCU+tHFkaaiQxojCSHz/cKuWTIo
	Pebik5dYmO87mf7J3KS88Tywvbm4VAhD7cjEA/YpG1Lq0BftfFJnRlx2PN/Kv4+2LJduiTXPaQyAo
	fkhFw99CxxipmUFVa37w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKxEX-0000ij-75; Fri, 09 Nov 2018 03:13:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKxEV-0000ia-AZ; Fri, 09 Nov 2018 03:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/oMXNNYJHNdtN4Uh6LLWWg6n0/+C/ts9xKj64GefCDE=; b=WopEE9w8Gev1RXdLLAgDXav2M
 Js788pNY933U9Mwjc0S9/yB9Hsskjph/6tQHq35R+d5yuwrV9UoUXp+3TCwDY743K54Ij55tKZdOK
 3AuvMaAf/dYDVANWUFIhyuTputMo0EYZK8kOFsSkh+PK2/e872o6SQCdsF8ngkJuLNN/WLspN1ieP
 EFXSOdbHs/SehvMzxRbp+Ho9tR8fdY9e6ASgdnH3yonMLEBS+4EPa5aYsRz7O4acPACDOAOJO15Ym
 pUO0gn8TWgxFBlqHbklZfyLjxpvLZ1Li+Hb+QI3DHTAdeVrPYeq6I6gQCY/344c/MtRqUjelUkRxA
 Dyn8TLuCQ==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKxES-0006UL-4g; Fri, 09 Nov 2018 03:13:17 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 42E2D72CBF9;
 Fri,  9 Nov 2018 06:13:04 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 3359F7CD1FF; Fri,  9 Nov 2018 06:13:04 +0300 (MSK)
Date: Fri, 9 Nov 2018 06:13:04 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 00/13] Prepare for PTRACE_GET_SYSCALL_INFO
Message-ID: <20181109031303.GA20906@altlinux.org>
Mail-Followup-To: Andy Lutomirski <luto@kernel.org>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 Chris Zankel <chris@zankel.net>, Eric Paris <eparis@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greentime Hu <green.hu@gmail.com>, Ley Foon Tan <lftan@altera.com>,
 Mark Salter <msalter@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Paul Moore <paul@paul-moore.com>, Richard Kuo <rkuo@codeaurora.org>,
 Vincent Chen <deanbo422@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-audit@redhat.com,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 nios2-dev@lists.rocketboards.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-kernel@vger.kernel.org
References: <20181107042751.3b519062@akathisia>
 <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_031316_294042_3DA362FC 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Elvira Khabirova <lineprinter@altlinux.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, linux-c6x-dev@linux-c6x.org,
 Chris Zankel <chris@zankel.net>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 Richard Kuo <rkuo@codeaurora.org>, linux-audit@redhat.com,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109031304.QmIDGyoDLB1pdN9OK5xiy7oKMPDIE-fCiA5g8YzH9bI@z>

syscall_get_arch() is required to be implemented on all architectures
that use tracehook_report_syscall_entry() in order to extend
the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Dmitry V. Levin (13):
  Move EM_HEXAGON to uapi/linux/elf-em.h
  elf-em.h: add EM_ARC
  elf-em.h: add EM_NDS32
  elf-em.h: add EM_XTENSA
  m68k: define syscall_get_arch()
  arc: define syscall_get_arch()
  c6x: define syscall_get_arch()
  h8300: define syscall_get_arch()
  hexagon: define syscall_get_arch()
  nds32: define syscall_get_arch()
  nios2: define syscall_get_arch()
  riscv: define syscall_get_arch()
  xtensa: define syscall_get_arch()

 arch/arc/include/asm/syscall.h     |  6 ++++++
 arch/c6x/include/asm/syscall.h     |  6 ++++++
 arch/h8300/include/asm/syscall.h   |  5 +++++
 arch/hexagon/include/asm/elf.h     |  6 +-----
 arch/hexagon/include/asm/syscall.h |  8 ++++++++
 arch/m68k/include/asm/syscall.h    | 12 ++++++++++++
 arch/nds32/include/asm/syscall.h   |  7 +++++++
 arch/nios2/include/asm/syscall.h   |  6 ++++++
 arch/riscv/include/asm/syscall.h   |  6 ++++++
 arch/xtensa/include/asm/syscall.h  |  7 +++++++
 include/uapi/linux/audit.h         |  8 ++++++++
 include/uapi/linux/elf-em.h        |  5 +++++
 12 files changed, 77 insertions(+), 5 deletions(-)
 create mode 100644 arch/m68k/include/asm/syscall.h

-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
