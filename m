Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F90606A31A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sNJibZnJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FUTUNWLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYzfYXSZurB1shaxFqYUCbu7cpqrDusZi8odYxgERsc=; b=sNJibZnJE0x5jV
	zhqW9v+9pPxJqDxeuNsp5EBeGCLrN91VqfLr7tJkJL5YcbdE6YvTtPEj2LMN83bQRr6hTJ8tRpIQX
	R+aTJGUtISVvH/3saQBP7VWSedI+JRlK7ovRcHlxcr1SK47dsB96XPJGTZSrrkYx2InUeHA/e75ST
	t8Uz9O0V1UbgIkwWj6RisfOYF1d97WsZTjZXEru0eP850zDn3Z5wOUQTEimich04aMJdwj7CGg/H7
	ltYr9Ac4ZF5XMLwomE+P4I1ZHb4hCMVIAvi/5fCh/6HJWwrwAeT709VKRPjUJe6NhyXKFj3wAVQ9z
	SH1rzSbQBPpBhNFG++wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6gr-00000009O6T-0A5q;
	Tue, 20 Oct 2026 10:03:29 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6gn-00000009O64-44O8
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 10:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792490606; x=1824026606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0uupRHpCPIAnfVVmmMtZVRVwnEHBLHGwl/qJmmSWTA0=;
  b=FUTUNWLRHKapYaO55Fzg/y7EJVKpYUiuNFO6+WTLezSn90AWiedT4T/J
   9P1OA88ELU65oHuriJVq+UAsZ1XO54QXY8Vta9XoEQDlesroyA/7N54Bb
   JnyOedTsFMXJvvqXYHYGtvt2MMBSY1jZMEASVyXIyyoIg9UF70pGXVPiC
   9G5rr7TO3DGButuhOhyX1Whq7wWkheb3XhlGE+oAWqoQjdVp2q0XaBlki
   2qTK8v/fw1eXiRFdObM6UVSECQR8WxFKaN+Zh5yrvnvFnuyY/KSUi2sQA
   ulUivpnvI+Qzv4rl0Pb7nNF93wBiVshoAmGX+/uYIr6Hdv84b10UKb3bV
   A==;
X-CSE-ConnectionGUID: z2x2D2BnRCCiYRemH0tNJw==
X-CSE-MsgGUID: RrGjPMaLT1aDgFXpGzFXGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1082682"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1082682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:03:23 -0700
X-CSE-ConnectionGUID: 3l70Pp/sSLu4oxS8pxyXKA==
X-CSE-MsgGUID: Fz6ZIbqwQSO/OvnglPRIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2890222"
Received: from sdp-s2600wc.sh.intel.com ([10.112.229.16])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2026 03:03:21 -0700
From: Guobin Zhang <guobin.zhang@intel.com>
To: tchiu@tenstorrent.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	guobin.zhang@intel.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] riscv: signal: protect regs->status RMW from concurrent preemption
Date: Tue, 20 Oct 2026 18:03:20 +0800
Message-Id: <20261020100320.2107301-1-guobin.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <atMjHBJI9LoEve8-@Tao-Chiu's-Mac>
References: <atMjHBJI9LoEve8-@Tao-Chiu's-Mac>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_030326_019757_E48DEFAA 
X-CRM114-Status: UNSURE (   3.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andy,

Thanks for the review and the suggested approach. I'll send a v2 that
disables preemption at the fstate_save()/fstate_restore() level and
adds the fstate_{save,restore}_preempt_off() variants for the scheduler
and kernel_mode_fpu.

Thanks,
Guobin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
