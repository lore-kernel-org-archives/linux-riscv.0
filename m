Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C947EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwlFFUrbGOb4WGNa+EyfOMbkBRgMl/F9hrd5chr8IX8=; b=eo8S3h+ckdyP3z
	32Qcsre5ajoU3smyFvLvwOC/6fsNtY9NPUUq5p1hNJNX/Z4tuKFrEQ1VTAvnbR58/l8QGX4iACH37
	KzB01HvqwnWGIvPd7NVF8YJC6intAy2bxwje+L8g/+x6kZ/f3Y27RfjOXSyA5+mc5eK7V5m0Cxl9T
	YH6ObSmuASi+gxxEaD2hBlZCD/33Kl9uaUzrFyvQIWVByclxvJyaL/biXChBdtA+kPm5xOMGdTPDL
	caoGslIg/6qR8zZKF17pg6If2fk97uADDXAOWvu79FoeHfe2+T1n3dVIVqkTd+utGTiTREvAiArtY
	048Uvv1z8mHDEKcIDsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9j1I-00EG4T-2z;
	Thu, 15 Jun 2023 09:11:56 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9j1F-00EG2w-2P
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 09:11:55 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id DBAE82189E;
	Thu, 15 Jun 2023 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686820309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NjcdizOEFWmMO6xt7/fP21f8bxNsubkeN1M9YVs3Uy8=;
	b=KhI4HW/OBeYkha3aAqTXigt/inAF1d7dCGQnkw3H5HDm3fYiynwA6/TqG2VPclvfgG3We5
	Cz9/f8B3DcPId1cUgD9V3lfPxO0Nmh+/EHfxZ6V9VwaNfaxgy0jAJTFuzO0FPlRceehGY3
	PHN6I7q+ezScnR5Im7GAyrke0+rWWdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686820309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NjcdizOEFWmMO6xt7/fP21f8bxNsubkeN1M9YVs3Uy8=;
	b=p9O3Y2znZuj/32VZHJUBbjweXNIg+jNHag/4ZErWSkYLRjYIxhjfJw25CjTrAHGMs2e8ji
	RiPw/but4qaxJNDQ==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id B216B2C141;
	Thu, 15 Jun 2023 09:11:49 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id A367C4A037D; Thu, 15 Jun 2023 11:11:49 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  jszhang@kernel.org,  ajones@ventanamicro.com,  aou@eecs.berkeley.edu,
  palmer@dabbelt.com,  paul.walmsley@sifive.com,  greentime.hu@sifive.com,
  zong.li@sifive.com,  nylon7717@gmail.com
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
In-Reply-To: <20230615084310.GA780@hsinchu15> (Nylon Chen's message of "Thu,
	15 Jun 2023 16:43:11 +0800")
References: <20230615072302.25638-1-nylon.chen@sifive.com>
	<20230615-unvisited-deceit-9beab8ce987a@wendy>
	<CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
	<20230615-luxurious-rewire-84ff9d639fea@wendy>
	<20230615084310.GA780@hsinchu15>
X-Yow: Not enough people play SKEE-BALL..  They're always thinking about
 COCAINE or and ALIEN BEINGS!!
Date: Thu, 15 Jun 2023 11:11:49 +0200
Message-ID: <mvmo7lh2ip6.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_021153_929031_113F6840 
X-CRM114-Status: UNSURE (   6.44  )
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

On Jun 15 2023, Nylon Chen wrote:

> Because LLVM currently has it enabled by default(https://reviews.llvm.org/D145164), it will generate this
> relocation type.
>
>>From what I know, GCC will also enable it in the future.

That's why the kernel explicitly disables it.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
