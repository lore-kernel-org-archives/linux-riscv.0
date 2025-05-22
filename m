Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E84C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/AML4ZgTAjmgG3pH1D6mu0yIPjwfMXzRCfbaPDs6qXw=; b=hegeQLqR1hYbV149mry0gZDHx+
	3iyJqU47K5NYYUs55wuyeyfX9OewFnCez4KtMzHhWZVqtcCpvEBYBlVOBTIhoSAcpFUWxGmtulVPr
	PRjsIm+ExGnJGFTL+msPc/qHw8RHjN5A60OrlCEaB3xCNmcz7l1ptb7G18pL1F6OXy7zMwzkgQaOC
	sySJL2SVtt905Wx08nWZGUBqJMOTGP4fos1XgYkHDVrB0TVtmPPtPuEMv+wwDKP+sbsm+/p9pg+Fu
	JY5iE179ssWo5iZOg0FyY3s0rcRgib4c1VPCqovFhWDB/naJ+emS6K5wk/ZUA++VQYEOqO1lHAwpC
	p9UmIPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6vP-00000001FiX-2oKS;
	Thu, 22 May 2025 14:29:35 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6kr-00000001ERi-3TZJ
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 14:18:43 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CECC425401B5;
	Thu, 22 May 2025 10:18:39 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Thu, 22 May 2025 10:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747923519;
	 x=1748009919; bh=hGvglmTdn2YYCq15UF3RYcVZFPJgASgYWxVBs5I74hw=; b=
	LQgfpgg5qMN/n4ao5YaViMJaALSaiAMgZmMoJDHEwBdrbW1ug39JOk+6t+gTcutK
	XUBb2TKbYTC5HvSUSPNfzJl4OJNuUhgGdB0G2T/vC4OfmStg/8/d5Isauiik95ma
	YlOiL/TMDLaGNsnev0376hsL6ooAGPiX2+pg7z6qVvRikLJc0H7zHv9t/rj+ryEi
	4X6p+jfy01WeLeeK9jxOcB/K/DuzJ8mvXVDGZ3TrnmapMMqx/TBxknUnNQYHgnVB
	6zHLMNQE/vONcqoENWRCslS+HZqo3BFtfpk+oZDMFy3VPGmWIRL0saoB/4Z7y1ET
	hCXEe2BznJopcHWknRzv8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747923519; x=1748009919; bh=h
	GvglmTdn2YYCq15UF3RYcVZFPJgASgYWxVBs5I74hw=; b=uHG8R7HMLD3IxgJFs
	N6+NNHlwGn8+xveMDWBfEzut3IeV+k25hLZ3m3VASXtJJ/lt9gKYO1G2RoRM+w7C
	LiPk+G3KLQeTS2i7g7lGoTBcHkmSJEiElBiIOD1hf4PRpakHC6+OpNiBUSfdbCQQ
	Ofpo0b2dNL3qAyVRmjlUjIcKVxVMB/2SdvN5wc98Cfa4HY8KzovV2aJGjibevQkh
	1So0WUu5zsydi0a5bVlgcDrZMJfSF5Os/Gd8B5HKks31lVeMu5hjxF+JgslI13nD
	/0lOKEbIYOrnPf5h4t4UAIa4WsvCFcxye+EKvtT4rpkp/ps9T55pLB68K4JQaulF
	aeo1w==
X-ME-Sender: <xms:PzIvaJy09rgWubYH3fSbSTp49ffHcOxMnVs_DBBP9ZPINvfEEB-eIA>
    <xme:PzIvaJQqFXcjHUC9ZziprMzDEBXxIUFBnqtfGD93FdjmbEqexw78qUAeMGBEV26BP
    b8y2AQEy7pVk0mngws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeiudekucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghf
    ufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoe
    grrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhkeeltdfffefhgffh
    teetheeuhffgteeghfdtueefudeuleetgfehtdejieffhfenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrh
    hiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopeifpggrrhhm
    ihhnsehgmhigrdguvgdprhgtphhtthhopehlvghnsgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdr
    jhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehmphgvrg
    hrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpthhtoheplhhinhhugidq
    rggtphhisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PzIvaDVxFEjxhCEqUac1ABEGaVMpopwUpKvHYjrncgUFlYpttWUHdA>
    <xmx:PzIvaLg9KaZ1PsspZX17NK01Aw-pqFO3RJeHK1oMfIamloa0Hv0JhQ>
    <xmx:PzIvaLBb5n7RbR44iBPqhDtGAwly1A58kUXlIyq1QbAHbLg_h319Lg>
    <xmx:PzIvaELGm6XpDr_41_996-BkkYQe8LDT6aUJ6DWocK3uqt4zYVx41w>
    <xmx:PzIvaCUZrIkbbK9xg6J50_BaO79ZnKDxvOMHlAops5-Co0kVRvCxSStD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 028A81060062; Thu, 22 May 2025 10:18:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tdd7d737077c6d117
Date: Thu, 22 May 2025 16:18:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, "Len Brown" <lenb@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-Id: <f6e5a993-2480-4d73-b866-81f9b7bc3dd8@app.fastmail.com>
In-Reply-To: <20250522141410.31315-1-alexghiti@rivosinc.com>
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi platforms
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_071842_150934_EFA0E56D 
X-CRM114-Status: UNSURE (   4.17  )
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

On Thu, May 22, 2025, at 16:13, Alexandre Ghiti wrote:

> Fixes: 77be5cacb2c2 ("ACPI: platform_profile: Create class for ACPI 
> platform profile")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
