Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1385C54E90
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jh4k9cEVFnblhFm/1D+05o/mOIYb6wh1QuR8z/LI6SY=; b=Vx040HNT3fTzlWfdhJLBxNCFMe
	IIo2rHNLs/C83flORXpYoH1itVdZtz49Qx3hYZjziKB/ZFuKQ+Ow9iW4ZVYlnDrMPo8JOKuWRLZBW
	NVjbiuwc6UiG4vAtfSz0K9JNf2BfY/fAbZC7yFkrnbP7zdFEEb7SkMS6YMI6cyRzRmr3pQ/LYD3Py
	O0Ms/xWpmfSGzmmKfxWTY2dxufD1P2cnzXw3l5M7HL9K/DZs9JNoELk+h11CTyUIreg0G3HM2j8yt
	xIcLglg1dzkXKj9ypsPdb4JfxO6PEbIg2pAARpY/7qqD/cYcIPGAZ4iKL9Ts4EIwwh02vbsQZkeDy
	hhuKPTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6vQ-00000001FjB-1W8S;
	Thu, 22 May 2025 14:29:36 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6mg-00000001Edx-22Lq
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 14:20:36 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F40041140191;
	Thu, 22 May 2025 10:20:30 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Thu, 22 May 2025 10:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747923630;
	 x=1748010030; bh=6SzZjdG+sF7GjKUZx/yFtARR+eKZB/Yfx9kGEaaXnEo=; b=
	egyaIK78kY8i5gA29bk8ECXgVxvt0Ai621vlSvncFJS6Ae3SqPtsGeCEw8NRfWov
	M+Um8GmHSHyBfFFLi/ZiauYubwK+s8Hv78tT0QWJtmatEHDKnVCr5Ast30R7UIG9
	8rosAoWXETSV3YN2mtuB1mm+WQqRT+QHDS+4IDriS72+zqGIPjirIvePkobSS1Gi
	38qoXBCZ3Emp2N2fZEyZ9RfZ5zJdrvZx/UOxAlighz6DIByzrpqdKf1nqTBU4lr4
	uqv8JuWOMgasvaR3SwGVVGuj0iRoooMyaGqKvb55LjoJ/KrfN66IXobkHRpOLxOR
	OmAUJA/5WTtb7kxclPccyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747923630; x=1748010030; bh=6
	SzZjdG+sF7GjKUZx/yFtARR+eKZB/Yfx9kGEaaXnEo=; b=Zd8XoNmYGq+p/5wqq
	osELy9IZIfUWCl+pufqzM1aVNZiwRvv1Tyaho+QcLOyd7oNO6TbtDUNn0bMYCf2B
	rouMvdhnJAgm+Z47x2k+8noLTmpv3tm5/p2n3IsIs8Xk52qaCewIWUOCkGlNV2tW
	2EbsZPe+staj9BUA27k8RxE++kVG6+iBEaQAAccPrjen6Q4zDvgTWsUA2WqgJcrb
	2UCi3z90SgGCiexbwpsSq+L/+ah1UoR2VHQW+BonIdQzL13RBZG9H6RskI1lSZRS
	ff7IiPx3//NOcm1ZPOtnI6uneqnjEWTmsEZaRVwcEJazYdgOrnkC3Rf60q7uIWsK
	L9geg==
X-ME-Sender: <xms:rjIvaBDBGWTSgXGDozXVenZ3c5RyETSn3CwGwUG46T3IvUAhXNhZPA>
    <xme:rjIvaPivIeWzRT1kRjuPPruciSXUci082-ni2TmwZR4Gat9EXAQmuin1wu_zen5Q1
    GCjE69t2X0AKI3yYn8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeiudelucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghf
    ufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomh
    hpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghr
    nhepkeffuedtveekjeeukefgleejgeetleduueetudefudehfefhheefleehheffffekne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggr
    rhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepuddtpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrihhordhlihhmohhntghivghl
    lhhosegrmhgurdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtph
    htthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehlvghnsgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhr
    tghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgt
    phhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rjIvaMkUcRNNIXPA26nbK9gDsRTYhOCo0PXAQKIR1zzw9xpUIai9jw>
    <xmx:rjIvaLzbAZwvQsclg4XYwfA7A9UVO-cuGDBCBnLZt-mI5pgagntpZA>
    <xmx:rjIvaGQ7ye2q6i0g7dxPwI7Q10y0C8sTyjrsUy_mqvBA4_nv6awCCg>
    <xmx:rjIvaOa9IANsRWgLmGgYWbWQpQzvD2vTs1M6sBCw-B5h3O9HLjTIcA>
    <xmx:rjIvaNRD4BJ0IM-AtoxPHvife5VJC8uQPaGjM7cHfmib7AsLHqOg4fTo>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 689DD2CE005D; Thu, 22 May 2025 10:20:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1cac82e440972a10
Date: Thu, 22 May 2025 10:20:10 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Len Brown" <lenb@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Arnd Bergmann" <arnd@arndb.de>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Message-Id: <83d4fd6f-805f-4b96-b772-70aa55c8c1f9@app.fastmail.com>
In-Reply-To: <20250522141410.31315-1-alexghiti@rivosinc.com>
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi platforms
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_072034_768002_F351DBE2 
X-CRM114-Status: GOOD (  18.45  )
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

On Thu, May 22, 2025, at 10:13 AM, Alexandre Ghiti wrote:
> The platform profile driver is loaded even on platforms that do not have
> acpi enabled. The initialization of the sysfs entries was recently moved
> from platform_profile_register() to the module init call, and those
> entries need acpi_kobj to be initialized which is not the case when acpi
> is disabled.
>
> This results in the following warning:
>
>  WARNING: CPU: 5 PID: 1 at fs/sysfs/group.c:131 
> internal_create_group+0xa22/0xdd8
>  Modules linked in:
>  CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           
> 6.15.0-rc7-dirty #6 PREEMPT
>  Tainted: [W]=WARN
>  Hardware name: riscv-virtio,qemu (DT)
>  epc : internal_create_group+0xa22/0xdd8
>   ra : internal_create_group+0xa22/0xdd8
>
>  Call Trace:
>
>  internal_create_group+0xa22/0xdd8
>  sysfs_create_group+0x22/0x2e
>  platform_profile_init+0x74/0xb2
>  do_one_initcall+0x198/0xa9e
>  kernel_init_freeable+0x6d8/0x780
>  kernel_init+0x28/0x24c
>  ret_from_fork+0xe/0x18
>
> Fix this by checking if acpi is enabled before trying to create sysfs
> entries.
>
> Fixes: 77be5cacb2c2 ("ACPI: platform_profile: Create class for ACPI 
> platform profile")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/acpi/platform_profile.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
> index ffbfd32f4cf1..b43f4459a4f6 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -688,6 +688,9 @@ static int __init platform_profile_init(void)
>  {
>  	int err;
> 
> +	if (acpi_disabled)
> +		return -EOPNOTSUPP;
> +
>  	err = class_register(&platform_profile_class);
>  	if (err)
>  		return err;
> -- 
> 2.43.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
