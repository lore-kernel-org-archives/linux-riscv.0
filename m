Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0D2C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 16:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB962070D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 16:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QOreJpFg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I7n5wh7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB962070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hCdZ41s5Npuv692UawV27tmed7irFh2YpV87R4ejPc=; b=QOreJpFgrFWTGCPUGLjkAQVRd+
	ZwI0yXywkvwCxrBwpZq4wJFvSUVWXq5Ib09nVbfFdjdf12HccWP5smArDNdOS+rGKCnx21Y5n8B7Z
	RmSk+W/1Tciur0cDgU0Br2KTNqXikQR4kCt2vRugNqB0fsVCJ3a+K19MpKwDQvpck/LTasAL58TW7
	6uLckL1whYkVDUy0bupbFa43d+ZX8/vwujahgpGYo2UNgFe9IvH3KarW+HOmC8Sp+Kj+QksaaDsfB
	mo4z4IC38byiO5e8xHUWpGo/LhqKZuQN3s7VDb7+R1WhfW9xCqyTKOzpp6aRQx2YXAacFeq85YrLn
	iPT8V98A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBMc5-0000oo-0t; Tue, 02 Apr 2019 16:50:17 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBMbx-0008Pa-GM
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 16:50:14 +0000
Received: by mail-pf1-x436.google.com with SMTP id c207so6667518pfc.7
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0l0tNKaocypDC4XTUt1EgnCaFCKG2M2CChVaNtve5aA=;
 b=I7n5wh7pJknlMkF505wzhzxSI/Rdp2vYfoe5sAJN8xNZbUItYnNSLR8qeZ+D9Wrx+X
 TpXXgjgZgA8rjE2Cyt7r8VRb4vLmTLSkhtBvczZmhmihk2AFvt1TQ8trtmseYw/kHd3S
 M0O6z5uRFTsmoxgRebo+WJsxc4g9tiZRF/AuJyU75p/+eR9nHnbpatzx4OH7pSlMX52b
 BhWAjlilRkm8ODRstCNPIjK5AZtEQQVkI2U9YVYJJc2bIQoxLuMSiUmFrfNuNPgYS1jb
 6sCAl1uJIxDi8aCtCsJ16+kwSx2uG4UUe07wmdQ+ueYuuqB21nzDs2t+PpiaNOuySCD9
 DKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0l0tNKaocypDC4XTUt1EgnCaFCKG2M2CChVaNtve5aA=;
 b=Uv6DRYknYtPu0jIzuJEKvDcVtyHWv+THDMXpMT5dysMb5Wgy6uJBpxL+4w4/dqp1Gt
 uiXbIoX+gCgfvg3f8x9pT3TFPffq8Mrbx4kVrNY89eYjKlQBX2ZK6QLoa10SC0wAY8GF
 jVMgG2MEhJAor8z8tkxLc1V7pmdjap9DVmlqo6FTIEzL5eSrZF+gYPC3+ObCVgNHDgez
 rsPY1WnktjL9H2cAusbz/t9SCt3z89qIeQKspJp3Gga3g77/88zy6aw3BXD09E2E+Pj0
 JuQ4obBnO6jULWLZAWBeQdKSaHj2JKwJ0IPh+poeP20Kb9BoGqTFD+0q1DkJw89/RiyY
 zkOw==
X-Gm-Message-State: APjAAAUVxWTitW4en6HbQDmTqvA0QO7/LSCAEpqd6bmCM19QW08aNp0J
 zLvim9gTZElwUU0B8yP7pwR2Fw==
X-Google-Smtp-Source: APXvYqzltALzvca9jG2x0dOkPn1YTQ+GEppT5MshvkBqTCsneWqEr94bDd6sYCqL4x+cqPp6+isPdA==
X-Received: by 2002:a65:654c:: with SMTP id a12mr20154166pgw.101.1554223807983; 
 Tue, 02 Apr 2019 09:50:07 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q86sm33399678pfi.171.2019.04.02.09.50.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 09:50:06 -0700 (PDT)
Date: Tue, 02 Apr 2019 09:50:06 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Apr 2019 09:50:01 PDT (-0700)
Subject: UNIX-Class Platform Specification Working Group
From: Palmer Dabbelt <palmer@sifive.com>
To: sw-dev@groups.riscv.org, hw-dev@groups.riscv.org, isa-dev@groups.riscv.org,
 linux-riscv@lists.infradead.org
Message-ID: <mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_095010_495263_0DB90175 
X-CRM114-Status: UNSURE (   6.97  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Atish and I have approval from the RISC-V technical committee and board to 
start a group to manage the UNIX-class platform specification.  This working 
group will start by defining a subset of this platform specification that both 
allows compatibility with existing implementations and extensibility for the 
future needs.  The contents of this first platform specification will include:

* A versioning scheme for future versions of the UNIX-class platform 
  specification.
* A specification for a platform-level interrupt controller that is compatible 
  with existing implementations of SiFive's PLIC.
* A specification for a standard SBI that is compatible with the current 
  implementation in Linux as well being extensible for future needs.
* An SBI extension for CPU power management.
* A specification of the interface between a bootloader and supervisor-mode 
  software.

Since this working group mostly consists of standardizing existing 
implementations, I hope it can progress quickly.  As such, I'd like to set a 
6-month deadline between when the working group is started (ie, today) and when 
a specification enters the 45-day review period.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
