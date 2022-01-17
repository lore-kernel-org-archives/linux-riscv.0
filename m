Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F75C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQxXfNbuGxvAnRWKyq5O+AWqyFTBDD/i2+AY12+HelI=; b=V3Nf+1oNKvbfsW
	StPhEG01LMNR+b+qQEA2E1TDdtsjxEqb7UquR8E9Ub1tqPNDoxedulRYhC0N8rFaXFHZLi8/2E4QF
	NFMAzB+f2tQDmNs1Ufvt3ZX2d2/jXESAeomGnWL4PQ+N+tvdjLXZi69Yn58lHr3u5yd0sXmu79tfa
	74Xi6eZlVlIscCNhQSoyO9aHKwajr1Z64y/zPe19YiAlmWWah8rSrtH8AQTtSmQzTqkKMWwLcJyor
	sdbJZLbTjuqizOQ2xXzucc9+adiliLs1MpARWQDjtBCp0M6mOsNQ7CufkdpqzTqg1zvXGdoYLWdZt
	jIuZfC+HOqrS15eh6hYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9X03-00G7mf-O8; Mon, 17 Jan 2022 18:45:03 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9X01-00G7lx-GH
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 18:45:03 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Jd16c6SP6z1sBRH;
 Mon, 17 Jan 2022 19:44:56 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Jd16c5b3Nz1qqkD;
 Mon, 17 Jan 2022 19:44:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yAyQBqVNOg00; Mon, 17 Jan 2022 19:44:55 +0100 (CET)
X-Auth-Info: 6yrrApfIdi+Pa6rB0TFqHFfqBzCaMiodpWYtpMFLLDvTgJdENNqTN4W7MsunQFt1
Received: from igel.home (ppp-46-244-183-111.dynamic.mnet-online.de
 [46.244.183.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 17 Jan 2022 19:44:55 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 731E82C389F; Mon, 17 Jan 2022 19:44:54 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Florian Wagner <florian.wagner@nextsilicon.com>
Cc: paul.walmsley@sifive.com,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org,  yaron.dinkin@nextsilicon.com
Subject: Re: [PATCH 1/1] RISC-V: Change signature header field to use
 `.ascii` instead of opcode
References: <20220117173941.3798325-1-florian.wagner@nextsilicon.com>
 <20220117173941.3798325-2-florian.wagner@nextsilicon.com>
X-Yow: They collapsed....  like nuns in the street... they had no teen appeal!
Date: Mon, 17 Jan 2022 19:44:54 +0100
In-Reply-To: <20220117173941.3798325-2-florian.wagner@nextsilicon.com>
 (Florian Wagner's message of "Mon, 17 Jan 2022 18:39:41 +0100")
Message-ID: <878rve6w2h.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_104501_713444_F3FDF1A8 
X-CRM114-Status: GOOD (  11.08  )
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

On Jan 17 2022, Florian Wagner wrote:

> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index f52f01ecbeea..931b63464b90 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -48,7 +48,7 @@ ENTRY(_start)
>  	/*
>  	 * This instruction decodes to "MZ" ASCII required by UEFI.
>  	 */
> -	c.li s4,-13
> +	.ascii "MZ"

The comment above no longer makes sense.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
