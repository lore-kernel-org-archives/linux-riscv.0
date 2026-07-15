Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88662C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GreM4P3cG6nDS7CgDkwILIt060CprC6EwPvHuke59Hk=; b=sz5Pyq84c67Usm
	/gVpfwRsSXKpkuNNav7lYJwvcfl1+YrtLrrxDk8J3EP7Wb3kQQuAYvnWA+gKeWjWl6HxG4uxR188E
	DKNlDrKPOpR5dkHT+ZN71J0w1+kD/07UyFQbyZwvKDYRXa+JU15II8M+O6oE4yS64RvO1oTRsMvaE
	c+MBEekbQG86D0QOBNffp4TLr6Ee0CdhIwMPYWNinigl5jUNfkV3sxiiBJBAJe44IAMnwEQfSJpm1
	ZLeuT8cqONMi31F62dQMyCFUSeuEDKfLd1hPb44UJxq/9BzNg7QLoFXh+NSZX7hkCFLowMCeB8Omb
	oVS5xLMlduYXdUYY/VjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Nq-0000000F5If-0oIu;
	Wed, 15 Jul 2026 14:14:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0No-0000000F5I0-3BbO
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 14:14:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4C7A600BB;
	Wed, 15 Jul 2026 14:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319CC1F000E9;
	Wed, 15 Jul 2026 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784124883;
	bh=XPbHzMf8ZuNOajp4uzbkCTChjqTG6TYtOB2wzsiTBgw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=bOZYk/2pWMdUYy0jZGTT8yXjkMHfnf0R14EIDk76ALS4a150bWx0KKclnt2wi3pgk
	 oI6kFjKJ1zXzId4bdj7pUVN0fV+Av6ngFUronXjzSUawM1CZs39XRfN9mJcqcmzvtn
	 txokT9Eq/qERXkwo4QaojpcLS6iBGMT6VS+YjgrxRsnq/xiyWH66bz8Fe4cJJTPqBO
	 eNyARUFeiM0kLUDB6m9LoEycdK8ZNR1I8uQhXA0glewjPwp6fuQTanyKUUHpi+wOPb
	 YnTCcovmvgernYxBETNVDq6WlTrgNDIZ5+WVgxLziZvj2UwDwLvJa2/bMWOrOvAZKh
	 xlOjfmfhw8tiQ==
Date: Wed, 15 Jul 2026 08:14:40 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Sherman <shermanpauldylan@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
    linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v2] riscv: smp: set CPU 0 possible in setup_smp()
In-Reply-To: <512ccb67-3b5d-4ae9-b74a-56275443ad49@iscas.ac.cn>
Message-ID: <8a2944c4-dad0-87cc-85be-15033639a7ae@kernel.org>
References: <20260714223301.5265-1-shermanpauldylan@gmail.com> <0fcf59d9-fbf5-3f1c-910d-3e269fdadf75@kernel.org> <d20d1eca-472f-4599-925e-5a9519f674c7@iscas.ac.cn> <CALGMsBD4QKLx61gYLTBb5JokF+=EbcMxUhTYznjRiYcC6eAVEA@mail.gmail.com>
 <512ccb67-3b5d-4ae9-b74a-56275443ad49@iscas.ac.cn>
MIME-Version: 1.0
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

On Wed, 15 Jul 2026, Vivian Wang wrote:

> Given that neither visual analysis (see above) nor runtime testing (we
> have SG2042 machines in ISCAS running 7.0.x and 7.1.x without running
> into this) can confirm that this bug exists, I'm concluding that, unless
> further convincing evidence otherwise comes up, this is a bug you
> introduced in your tree and does not fixing for mainline.

Thanks for taking a closer look, Vivian; I'll drop this patch for now 
until either Paul or someone else can reproduce this on mainline.


- Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
