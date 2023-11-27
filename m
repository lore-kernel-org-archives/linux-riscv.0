Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C467FC07D5A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KmRyP72n6Q//iYdY5lfJEaMHyMPX+/WERiB5qWRexs=; b=mNpWh/sGA2ome1
	oDCiAIuXEJAH+OlojzfayERxZ6Dpe2gX9zzRe36WRfN3dK+08WuNW0hTAMbYM30P4rqiEyRGMGKoQ
	sbwhFOCTon3fO50HM2E+PGqw/H1CcfEHfZJU+VSj4M7Z7Rxz1bu9tAJvbdaSBqkrxPs/FR7jWJ5uY
	7dFLPsWyf4ON+nuFtplK0sLgGkEGYIPKhU1xO2OyEoB41moowSbFcZM1J4vVZYnLbLo9B4zRuVqK1
	sOxXcR9E7rFPZx6L50cNFix9KEuFaKLzQRqOfX3EqmeIyGquVFVEWl2cti+pvYm0hGTxa/NmPA/jH
	M32Z1m19rOkelwM0uSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z4M-0027qq-0p;
	Mon, 27 Nov 2023 10:42:26 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z4J-0027q4-0H
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:42:24 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Sf2GB1VjKz1qtrG;
	Mon, 27 Nov 2023 11:42:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4Sf2GB03Yzz1qqlc;
	Mon, 27 Nov 2023 11:42:09 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id tm617zSg7y19; Mon, 27 Nov 2023 11:42:09 +0100 (CET)
X-Auth-Info: +DnrhnZblEGlOzb3XeBn1Jt2rs2WUKWMccr42/2aPU5JxxGUkqgQeHc3hbITbzys
Received: from igel.home (aftr-62-216-205-201.dynamic.mnet-online.de [62.216.205.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 27 Nov 2023 11:42:09 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id CE2AA2C1CD6; Mon, 27 Nov 2023 11:42:08 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Ron Economos
 <re@w6rz.net>,  Samuel Holland <samuel.holland@sifive.com>,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Safely remove entries from relocation list
In-Reply-To: <20231122-module_linking_freeing-v3-1-8e9e412a3305@rivosinc.com>
	(Charlie Jenkins's message of "Wed, 22 Nov 2023 15:31:41 -0800")
References: <20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com>
	<20231122-module_linking_freeing-v3-1-8e9e412a3305@rivosinc.com>
X-Yow: Are we live or on tape?
Date: Mon, 27 Nov 2023 11:42:08 +0100
Message-ID: <87bkbfzddr.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_024223_292407_CC3EF999 
X-CRM114-Status: UNSURE (   8.87  )
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

On Nov 22 2023, Charlie Jenkins wrote:

> @@ -683,17 +700,29 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
>  
>  	if (!found) {
>  		rel_head = kmalloc(sizeof(*rel_head), GFP_KERNEL);
> +
> +		if (!rel_head)
> +			return -ENOMEM;
> +
>  		rel_head->rel_entry =
>  			kmalloc(sizeof(struct list_head), GFP_KERNEL);
> +
> +		if (!rel_head->rel_entry)
> +			return -ENOMEM;

This leaks rel_head on error.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
