Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736A5C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 14:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FB0222B8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 14:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vBw1S2Mk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45FB0222B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fgYfUeqm7RosGBvHNj2/hZNGnU9HEM2Yt7DXlTi7cCE=; b=vBw1S2MklCnraw
	LEi8lma8UkJI4AvR3Ss+MYqX78BIb+op/T2mzs+9oHQc8kuJbcQDeyqbA0eOxKkc0who/3IFIjh/b
	iIpUNaZP0kTKb/819tQpab0MppWAk3FOtS8P6MCTan/8dPzNX2CCeaBSN0v1q49l7aKKaeQcP4cr4
	02O2plZjobrC4SQOu0twjC21qem1RfGGyGYzEfHh8kdikK3vObwjJ5f1E5K8fjWZDIRokUql+HIMN
	Q2qFNvnR3IQAla42LHkxeJiXb7cDxq9VrGUUM6oOSnM2x7tdGzaND3LCKEbpQKhz2S4lKMEk+xhf5
	I+r8xgm+YZxWFPYOJ+8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtCNe-0006V7-9J; Mon, 11 Feb 2019 14:16:18 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtCLH-0002ar-KS
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 14:13:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27507ACA2
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 14:13:50 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: sbi_trap_error: hart4: trap handler failed (error -5)
X-Yow: If a person is FAMOUS in this country, they have to go on the ROAD
 for MONTHS at a time and have their name misspelled on the SIDE
 of a GREYHOUND SCENICRUISER!!
Date: Mon, 11 Feb 2019 15:13:49 +0100
Message-ID: <mvmftsuv2ea.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_061352_291104_E7BF5E28 
X-CRM114-Status: UNSURE (   4.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

I have been getting this error:

sbi_trap_error: hart4: trap handler failed (error -5)
sbi_trap_error: hart4: mcause=0xd mtval=0x155574e000
sbi_trap_error: hart4: mepc=0x80003dba mstatus=0x8000000a00027822
sbi_trap_error: hart4: ra=0x80001eaa sp=0x8000dd60
sbi_trap_error: hart4: gp=0x2aaaccdd18 tp=0x155573cb20
sbi_trap_error: hart4: s0=0x8000ddc0 s1=0x5e
sbi_trap_error: hart4: a0=0x20000 a1=0x8000ddf0
sbi_trap_error: hart4: a2=0x15555eee96 a3=0x8000000a00006022
sbi_trap_error: hart4: a4=0x8000dd6b a5=0x155574e001
sbi_trap_error: hart4: a6=0x0 a7=0x155574e001
sbi_trap_error: hart4: s2=0xee s3=0x3
sbi_trap_error: hart4: s4=0x96 s5=0x20
sbi_trap_error: hart4: s6=0x0 s7=0x15555eee96
sbi_trap_error: hart4: s8=0x74 s9=0x14774
sbi_trap_error: hart4: s10=0x58782b5b s11=0x34fe3e52
sbi_trap_error: hart4: t0=0x4 t1=0x155574dffd
sbi_trap_error: hart4: t2=0x55 t3=0x85a303
sbi_trap_error: hart4: t4=0x0 t5=0x0
sbi_trap_error: hart4: t6=0x15

What does that mean?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
