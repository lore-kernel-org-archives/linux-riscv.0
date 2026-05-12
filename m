Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28626CD4F24
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ykyr59qIzSaAQ0nYIdnf4U9heFHZuT6bIl1pENgCIGk=; b=AWFR8d21JMNY9N
	PMHGsTjVkW/WXI6p2I7+7iNqgco+wpZ6zIjCOjazQIcZgbFCWyIHKsbe7A/y/p0cxp8bxdwA9Z/ZZ
	sWHUjfdDWCWutBNcbYWbAm0WqFGF9uFdMp2oq/DVWOWW7TkTuGI0WfP40puK7cFbVoqjIlspx/pIV
	Zy6uqTCBaiNoTrk1p61cCY3zEKRYmYVPheQvoECKXwh5nwzKYuC70ynb+4aME+OohVCHb8NOvkUTG
	NIACVbuj7o+XcwYQwH8w19rU7UbbrKq8e/Wl1QxLFod5+q7mqlEzI06wHU9KvpWz/jFPwqOqjvteg
	sYEYR10YBPxEbKulYz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmZJ-0000000GiqH-1ld2;
	Tue, 12 May 2026 12:50:37 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmZG-0000000GipN-3tS7
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 12:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=xqp9ISv23ekp1QjAZQxuydHpiWlMqt/FMfh3u7T4RJg=; b=iJY29+f8g3KLW7kS
	PuHFcowUUSSPesShf2xoKmpV1gm/XSTyUt2IwON9rBhUVUibpkKttyFT3KSDNp1UMOBx8okBleKQl
	rtzLzfoGc1V1M1LoEF6AyUq+sd+rX1CYFRnPtbPE5/aeZrdcVLODwcSYVcc6BlfO9z/bMMO3E4PfP
	M9SfsA26zEkM8jR/mY06uwjNExqTAOibfvMvQAN6vlgwzD0GhBiDX0ZF7qI9hEnITuHjiieyRYBMs
	BgAMNJPcP1SBRDSLjzf1hraaZLtaUx4HRwxGOxU4UBBE2QxyB9hpvDEl+2NYwK4x/FgIYUhpDS9CT
	zSVlRflswRdu+jDJnw==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wMmYk-0002Lo-H8; Tue, 12 May 2026 13:50:02 +0100
Message-ID: <7ba94699-33a1-471a-9cfa-12f214d6b5e4@codethink.co.uk>
Date: Tue, 12 May 2026 13:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: propagate insert_resource result from add_resource
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 Nam Cao <namcao@linutronix.de>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Klara Modin <klarasmodin@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Pu Lehui <pulehui@huawei.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yu-Chun Lin <eleanor.lin@realtek.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260512124628.300360-3-thorsten.blum@linux.dev>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20260512124628.300360-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_055035_044629_BC00BFD6 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/05/2026 13:46, Thorsten Blum wrote:
> Currently, add_resource() returns 1 on success, even though its callers
> only check for negative values. Instead, propagate the insert_resource()
> result from add_resource() to align with standard kernel return-value
> conventions (0 on success, negative errno on failure).
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   arch/riscv/kernel/setup.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index c89cc272440b..6e3d8acae71a 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -71,16 +71,14 @@ static struct resource *standard_resources;
>   static int __init add_resource(struct resource *parent,
>   				struct resource *res)
>   {
> -	int ret = 0;
> +	int ret;
>   
>   	ret = insert_resource(parent, res);
> -	if (ret < 0) {
> +	if (ret < 0)
>   		pr_err("Failed to add a %s resource at %llx\n",
>   			res->name, (unsigned long long) res->start);


Maybe just use %pR for the resource start/end here and avoid
the casting.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
