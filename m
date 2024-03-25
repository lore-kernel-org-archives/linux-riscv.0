Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666B5C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 22:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoDNwB+Uy+hhW9UKtNm55myPSSgvdO51zso2UQfpR/Q=; b=ekyt9eIlY0N//l
	ZMY7ak8Ig7RSNGdDNzIZMucuSkHg8frmTv2XHeKQbQzOyhNcxFVVCMsukgp5oKuvwNQt39KdmnEJd
	GlvCqY+DKHUNxNHV499EvsCH4fWCTqWugWPFNf3pwR4xjrpQgPGQ7zzWIO8Jcqk1Fp5cqLC5jfFn6
	BxxsCXrReKlf0PL54qz2rtmXrZLehMH0WqmP4Sn/2b0bV24KO5OBqSQOTltDc4x32poGE7hLXliyj
	99QZvxwpU94U6lnHkWgce4791Ffqu+CXYsKTo2tkp/+ie/08jarMPInUYzfBsHZg0EVSZ1fCcYRzW
	CimBAxjXPMciSluTz7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosSp-000000028P1-1nHc;
	Mon, 25 Mar 2024 22:06:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosSn-000000028N5-11Tr
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 22:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 366876118D;
	Mon, 25 Mar 2024 22:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF2EC433C7;
	Mon, 25 Mar 2024 22:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711404395;
	bh=z/mz7FVFwe1LcDtvbacDByrhd+3w8HygIiOVlwJYbDU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nUHFUZpJoimXH48MX0QAGf9i1kd81LXa6MCNkuKKiuL/HL0G/isOw3uNIJbFJgy/I
	 tM8XtTD2n9TxwpwqVDRMOR9seeFdqslt/L4RG3SXOQnPYC7wtLQw7adq46ggnSNyK4
	 NyhL1L1edHltaLQYS4ugCN+2ctlA1u0Xwmec4RSALlTYiDoqlTzcUQ0/xsZUS7ZeVP
	 es0UF2PqFCLKqS9CKiJ1N6KGd2aDr+eoChBqx0Fd1lQjnYPGmUKx+htikR0i6RlzOR
	 YpsngEmzjg/or+4fWjSJ3Km/MUCyQ3Un9N49l47F7/ovgKZ2wMWhGqlfEy54rtAblq
	 G2ze3GUVApWug==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 00:06:31 +0200
Message-Id: <D03683T2J8T8.18AMQ9ABQAQT5@kernel.org>
Cc: "Masami Hiramatsu" <mhiramat@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
In-Reply-To: <20240325215502.660-1-jarkko@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_150641_335468_767968D2 
X-CRM114-Status: UNSURE (   3.44  )
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

s/textmem/execmem/ (also in long description)

will hold sending a new version as not a functional issue, will fix
after review.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
