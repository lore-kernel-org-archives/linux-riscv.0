Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4D6C46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r971lHeXhZfAQnAYGt6VdtxvnhPS9ad7fPSelcwz1wc=; b=fNYTUXp35zuNA8
	Q8biES/zxTv9B9rD+aC2MYjw0v2rNQDnDzfcNuw/e85mupjW4+G9xfGrNIsUUidb5cT+1tM/HEfMD
	4Lit+XnBxXQVMjEFMQbM/8FCnejXFBbedWIpaNN+B2JzietdmBf6oI2ockuXsvMj0lQq1hRn1mNoS
	/DzuepqiHVADNG+KcFkHR6yJ2gxoIdRLxpfR1XvUP9SdPILtlMuGvxVJtYTcJodr4AVgYgz1zV2Sc
	HnbhOV4lOiV8MspZygf9Co7GdueeSJGAXj0zyHq1YSylSpN2Tb6d4LKvndfJkQlHAtwx0FRNR6q+G
	pABUb2O5SAdLhQcvJVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcp2-000ELX-1c; Tue, 03 Jan 2023 08:39:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCclJ-000CTI-5k
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:35:10 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pCclC-00050A-Ej; Tue, 03 Jan 2023 09:35:02 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH RESEND 2/2] riscv: errata: prefix T-Head mnemonics with th.
Date: Tue, 03 Jan 2023 09:35:01 +0100
Message-ID: <5641668.DvuYhMxLoT@diego>
In-Reply-To: <20230103062610.69704-2-uwu@icenowy.me>
References: <20230103062610.69704-1-uwu@icenowy.me> <20230103062610.69704-2-uwu@icenowy.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_003509_293306_46B999EA 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 3. Januar 2023, 07:26:10 CET schrieb Icenowy Zheng:
> T-Head now maintains some specification for their extended instructions
> at [1], in which all instructions are prefixed "th.".
> 
> Follow this practice in the kernel comments.
> 
> [1] https://github.com/T-head-Semi/thead-extension-spec
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
