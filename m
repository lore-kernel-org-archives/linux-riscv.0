Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35554C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 00:11:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E686620851
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 00:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cdmEil7z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EpIwF6g/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E686620851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eA7vop5FDWLUkoYm4B8zpXUPRJ69HMAQsat11rRvgpc=; b=cdmEil7zk6i9V5
	RU/xI0FO7YtJQSH67fMZn+C3hv7PxtOwcRFm1/cTUn3RwsQsIksejcs0sOa9RZ1xUpWz7Ct0ADDll
	Ib5GbzIc2iwQQF7mSvjjg3PglpQVIQ/nvy60eRGziPbbU5VrrAcqSBccoQDB7zx7eDJK/HwY2/DkN
	mQmNvNl10dnYguQ2gW9V4/kr1C7Apy0LFdd+Z3MSxlO3VuCTeoCS7WpHhJ8gPbqmedvb+Zz+PQIxQ
	SHGhVEJfe0MPE5suSSYad4nm9zcrm6INY6lPM0lc0kz+31rqspOtsnECB8D9ZPuIJikZnXnuBacvT
	xfAWsQPrKA0X98nFqXYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOtdu-0006CB-33; Tue, 20 Nov 2018 00:11:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOtdq-0006Bx-Df; Tue, 20 Nov 2018 00:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZhIBE19kpg4+CuqtY8aPJND/BWZRsva0xtfqygHFAqo=; b=EpIwF6g/H1xhYF7DRYzAkL7GZ
 PFx20/dm1i8zjWEZH27OvDRCFYOIdKsOPccR0WQk5Pr33/fd6fK6c5zSQFsh5PVRpgXWDgq1qmFd3
 o5DttYMuJKmbHfkJSFUhSFaE0AHwN80wUiVzJ7WhWvdMNFA4QbHOogz78IrzVtDZJux8jcJpQICqC
 fDN28/Ve0GOg7+bXE8+odfaxn1MLktNfY89rx6zqsve9XogInDTW+iI3gwYU38nKn0gmPa3GbUqaq
 O2Zm5ayLK2BUmROYggg2o6sWXR3TK0uRCugVWNS1jhhyHinGffSaqE23PGcdRPqS+Ufi0XuEqSzgC
 KkaNKj+iA==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOtdl-0005vw-Gs; Tue, 20 Nov 2018 00:11:43 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 3A24472CA5E;
 Tue, 20 Nov 2018 03:11:29 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 288D97CD1FF; Tue, 20 Nov 2018 03:11:29 +0300 (MSK)
Date: Tue, 20 Nov 2018 03:11:29 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v2 00/15] Prepare for PTRACE_GET_SYSCALL_INFO
Message-ID: <20181120001128.GA11300@altlinux.org>
References: <20181107042751.3b519062@akathisia>
 <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_001141_609778_D8B1DD2F 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Paul Moore <paul@paul-moore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Elvira Khabirova <lineprinter@altlinux.org>,
 Palmer Dabbelt <palmer@sifive.com>, Mark Salter <msalter@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>,
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
Message-ID: <20181120001129.Jk2yF4FQM76fPOcqYBUHl2uxeN20k28jK0zz7jnWHh4@z>

syscall_get_arch() is required to be implemented on all architectures
in order to extend the generic ptrace API with PTRACE_GET_SYSCALL_INFO
request.

The primary intent is that the triple (audit_arch, syscall_nr, arg1..arg6)
should describe what system call is being called and what its arguments are.


Dmitry V. Levin (15):
  Move EM_HEXAGON to uapi/linux/elf-em.h
  Move EM_ARCOMPACT and EM_ARCV2 to uapi/linux/elf-em.h
  Move EM_UNICORE to uapi/linux/elf-em.h
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
  unicore32: define syscall_get_arch()
  xtensa: define syscall_get_arch()

 arch/arc/include/asm/elf.h           |  6 +-----
 arch/arc/include/asm/syscall.h       | 10 ++++++++++
 arch/c6x/include/asm/syscall.h       |  7 +++++++
 arch/h8300/include/asm/syscall.h     |  5 +++++
 arch/hexagon/include/asm/elf.h       |  6 +-----
 arch/hexagon/include/asm/syscall.h   |  8 ++++++++
 arch/m68k/include/asm/syscall.h      | 12 ++++++++++++
 arch/nds32/include/asm/syscall.h     |  8 ++++++++
 arch/nios2/include/asm/syscall.h     |  6 ++++++
 arch/riscv/include/asm/syscall.h     | 10 ++++++++++
 arch/unicore32/include/asm/elf.h     |  3 +--
 arch/unicore32/include/asm/syscall.h | 12 ++++++++++++
 arch/xtensa/include/asm/syscall.h    |  7 +++++++
 include/uapi/linux/audit.h           | 15 +++++++++++++++
 include/uapi/linux/elf-em.h          |  7 +++++++
 15 files changed, 110 insertions(+), 12 deletions(-)
 create mode 100644 arch/m68k/include/asm/syscall.h
 create mode 100644 arch/unicore32/include/asm/syscall.h

-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
