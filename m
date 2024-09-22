Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3869CF9C5B
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Sep 2024 02:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cfGii5GHEvvFmjVE8omCx3pIgVGMa5lJstSiICT+6U=; b=VMow8LFNyFwv8K
	YiaUNdEB6Gp46/7Q5SEnmQBnJJHXFcvFy9ur6TUkFyETJuIHa0mypvT1Ss9MOeotK/rpxYtbrstRD
	jwsCTxXq65SjDOLUGCkg+kpTSRgh9dBv30OG0MibyxXExuJEwmAkbYJcHEHKqUH36N71VH6kPKxpo
	sp0REYzQkw1elHV0gajZsq5UgaHcWrAjy9M08mFLpujX9F9m9VV/6GTxc7S6Ybh13jYvcnOmtttGn
	frJEIuP+oFw1MlbcKI9A6iCj070eoJF1Wy8KQvKyD07YpTcgbAElI7BneYtshZsjSoLb4h7URw8pt
	rANkSpPRybeex5peZTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssCYD-0000000EcOv-3WSx;
	Sun, 22 Sep 2024 02:42:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssCYB-0000000EcNe-06Ex
	for linux-riscv@lists.infradead.org;
	Sun, 22 Sep 2024 02:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 943125C04E2;
	Sun, 22 Sep 2024 02:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C24C4CEC2;
	Sun, 22 Sep 2024 02:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726972933;
	bh=F2sRA/waMaVZiogBCpg45s1Yg8jSpVY87MXz2W5LWhk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PwL5moodjftQlhDhVTIBrhaaq1XyE3g8oVWYf/Poal/g8OP09ccV5wGEHHQXYeAWH
	 P2mPFpfb4UTuUcbO6yRr7L2KmZy93Qx7nfEX2sUkLnBVDOoYLg+BXX/HRSLc8xBk+K
	 5Cdl89F5IVTephwz36skmMpwlakldWidNhsWGfocLcwF9qCiJygzqsJglZ71sT+G5R
	 xBo/OkLs1yclRMeS+z+aPEEeknM2VPD8PqmSLT4kGsmrsJfksio5Z3Ajl0WUNl3wuc
	 CunKOMfVThwIK8NP/zDJCLLj2nrB4l0TNxcIOse/NOOb35erffXNv9eNgh1lpaiu88
	 ig3cKe7kcvaPA==
Date: Sat, 21 Sep 2024 19:42:12 -0700
From: Kees Cook <kees@kernel.org>
To: Jason Montleon <jmontleo@redhat.com>, linux-hardening@vger.kernel.org
CC: Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BREGRESSION=5D=5BBISECTED=5D_Cannot_boot_?=
 =?US-ASCII?Q?Lichee_Pi_4A_with_FORTIFY=5FSOURCE_enabled?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
References: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
Message-ID: <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240921_194215_131937_7F8F5B0F 
X-CRM114-Status: UNSURE (   9.45  )
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



On September 21, 2024 10:42:11 AM PDT, Jason Montleon <jmontleo@redhat.com> wrote:
>Starting with 6.11-rc1 I can no longer boot the Lichee Pi 4A with
>FORTIFY_SOURCE enabled. This works on 6.10 up to at least 6.10.11.
>However, with 6.11 I get no output at all from the kernel on the
>serial console with FORTIFY_SOURCE enabled and the system never comes
>online on network or otherwise as far as I can tell.
>
>I did a bisect which led to:
>2003e483a81cc235e29f77da3f6b256cb4b348e7
>fortify: Do not special-case 0-sized destinations
>
>If I revert this commit I can once again boot the Lichee Pi 4A with
>FORTIFY_SOURCE enabled.
>

Thanks for the report! Are you able to catch what the error log shows? There must be some 0-sized array that snuck by.

Can you share your .config and compiler version?

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
