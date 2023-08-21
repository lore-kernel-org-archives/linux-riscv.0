Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44979EE49A5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kL/dkGVTGu3tUFLKq7VPmzFoiFbVnyHd7pK0fYTjDG8=; b=2QsG6SdZxHFr0w
	dDl+ayIj3sfidEidILlEWn1iUXI/CyZdlJn4EO4BEhYsve4ctV6FpWcRXOUD2ipxNmWQ9pRMCyWnJ
	hE94Ke27/3OmSw6zwWlFwlRlvXF4vY0/bhPMEiIs8eay4cDV7T/HGAU5umM0AGf/qsJkgzluv4+3w
	+ucDoyZVPQkzk2U0zvrRx04uqs0YTTONXWUMqQOt6Y39DRGhXL2YzXtVdr9Zva9nuMWVo5NjluDa4
	lrAn/DGFWWwJ7ClL/tUdQoApCn1IfLbLOhOWzjVtfGvkrT3Ww+/YqVPFqoYR9I0l5VH/A8E2MaJL8
	fmbYggeJkBMW95xiHKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzr3-00DRO7-2u;
	Mon, 21 Aug 2023 08:01:41 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzr0-00DRMo-2v
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 08:01:40 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 7611C2297B;
	Mon, 21 Aug 2023 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692604894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8BBh7KO/rWIsvAPTT++pOv5NwgOadfrFZd4xxBSpVDM=;
	b=D+29zRSPO8o1VT2rMtedAIfwBcukofUh8QNyewcvhZGT0A6Qx7xyXh0p4K6oxKXVGdCnoi
	cFNdll2cQHuiU2U0jGxKk0w9cFYrFp9zdNFQo3JeXw7DJqvwTzB/AmLTZ29ANA50FjKY3g
	eahwssSEZK94HVMWOdEFmmB3IESojA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692604894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8BBh7KO/rWIsvAPTT++pOv5NwgOadfrFZd4xxBSpVDM=;
	b=fziSU3tsUIaB5AQnsBUTlaTDgVMRkSEm3IlmPKTyVEVAcgutZzV9eX/xiO6/Cra3zoHcHg
	Pb11Hl3R3r8nKFAA==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 0110A2C143;
	Mon, 21 Aug 2023 08:01:33 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id E2BEA4AB2B4; Mon, 21 Aug 2023 10:01:33 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  jszhang@kernel.org,  ajones@ventanamicro.com,  aou@eecs.berkeley.edu,
  palmer@dabbelt.com,  paul.walmsley@sifive.com,  greentime.hu@sifive.com,
  zong.li@sifive.com,  nylon7717@gmail.com
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
In-Reply-To: <CAHh=Yk8upMOdhma4EDZj_TsA2rf8=MQVrP2sidhmwBh3G-ix-Q@mail.gmail.com>
	(Nylon Chen's message of "Mon, 21 Aug 2023 15:51:14 +0800")
References: <20230615072302.25638-1-nylon.chen@sifive.com>
	<20230615-unvisited-deceit-9beab8ce987a@wendy>
	<CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
	<20230615-luxurious-rewire-84ff9d639fea@wendy>
	<20230615084310.GA780@hsinchu15> <mvmo7lh2ip6.fsf@suse.de>
	<20230615094732.GA8710@hsinchu15>
	<CAHh=Yk8upMOdhma4EDZj_TsA2rf8=MQVrP2sidhmwBh3G-ix-Q@mail.gmail.com>
X-Yow: Th' PINK SOCK... soaking... soaking... soaking...
 Th' PINK SOCK... washing... washing... washing...
 Th' PINK SOCK... rinsing... rinsing... rinsing...
Date: Mon, 21 Aug 2023 10:01:33 +0200
Message-ID: <mvmy1i4ako2.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_010139_086344_4F5AF18C 
X-CRM114-Status: UNSURE (   6.94  )
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

On Aug 21 2023, Nylon Chen wrote:

> If RISC-V were to support the unwind table in the future, would we
> need to re-enable it? Would this require implementing related
> changes(module relocation type handler) at that time?

I'm not quite sure I understand your question.  Nothing in the kernel
makes use of unwind tables on RISC-V, so there is no point in generating
them.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
