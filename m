Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83002D132A6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUSz7nD5zIyr5sruoxamL0Quq8PVDKSl1T6Qbil0mMA=; b=weWN/ch6AwllFl
	BbyQQZvZ5rZx52SEFfBzGknEvJnv3lFILcAqvJPJ6Ot3R3vcKaDrf0dGNjYHF7JWr0s1Y8Alb+yQr
	zK5LqDUW+l+NG9uBDlLHRmJCwtMQuWhxFUhhoMYxGBwZEeF+jkaoPtKqVZIwqThL+4IuhZQrq3jWR
	rnW3ye0+k41ynC0wh89n2DoI5Dxtnx5kImE+PE9wE2xCARtK6tsMncx3Aq+4DuwMcnE5aP539mHnE
	YNz8KG9opjTHojcRC0wtOFbLVnhqk2fNanSsnpZtA1FjBqb++4NIbWXA8ktRucrr457GHrtsS5tOz
	oefOKmZh1KxtsYvkWdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u57-0000000DHIO-0dpm;
	Mon, 04 Nov 2024 10:13:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tug-0000000DFMT-2E2a
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 10:02:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0667C0008;
	Mon,  4 Nov 2024 10:02:14 +0000 (UTC)
Message-ID: <d380fd10-ebc4-4d66-becb-13995372d41a@ghiti.fr>
Date: Mon, 4 Nov 2024 11:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrea Parri <parri.andrea@gmail.com>, linux-kernel@vger.kernel.org
References: <mvm5xq44bqh.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvm5xq44bqh.fsf@suse.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020222_738132_B0368726 
X-CRM114-Status: GOOD (  13.34  )
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

Hi Andreas,

On 07/10/2024 09:24, Andreas Schwab wrote:
> This is needed so that <asm/barrier.h> can find <asm/fence.h> on riscv.
>
> Fixes: 6d74d178fe6e ("tools: Add riscv barrier implementation")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   tools/include/asm/fence.h | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 tools/include/asm/fence.h
>
> diff --git a/tools/include/asm/fence.h b/tools/include/asm/fence.h
> new file mode 100644
> index 000000000000..917a173059a4
> --- /dev/null
> +++ b/tools/include/asm/fence.h
> @@ -0,0 +1,3 @@
> +#if defined(__riscv)
> +#include "../../arch/riscv/include/asm/fence.h"
> +#endif


After a discussion with Bjorn, it appears that he had already solved 
this issue with the following patch: 
https://lore.kernel.org/linux-riscv/20240927131355.350918-1-bjorn@kernel.org/ 
which we find cleaner. I have just tested his, and it indeed fixes the 
build error.

Unless you have any objection, we'll try to make Bjorn's patch into 
6.12-rc7 instead of yours.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
