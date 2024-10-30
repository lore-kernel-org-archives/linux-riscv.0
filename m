Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD1D7497F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 08:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eb6SSpEgL+vC+kZsQpKwvXu9v+NG+mcAlAPZMaee0eg=; b=mMM8kzMu0smvwv
	hRLFUOk1LuTEniKzo+98gm8HiWaZY0ze8CyLa4ebn3W6FMYxY1BRmfVNlFlS8pJtoTjx7eFyWEGI/
	le4SgWf81R7XT6pVgMQhdpFpT+AKF3baPBIfj8FQYl1X66oPkGDb9Xn4pilK5F7YEet7PTIEjNMbZ
	pQ0XJ5Ef9n7KDFauPyCiZpGvXVMLCBppGSaUbVnMVvjRuMHmUh6s6t8DV28cJiQtQu3CqmXI6bla3
	oiurL4+SpcU23s2p/rlTt23DYyA7lIcSEsoI7LhWqvnRyrGC7oDvj3iMC0Gk8vvxF3RSVwYCKy765
	xOXdImzRsffflJgxytlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t648j-0000000HHm0-3Za2;
	Wed, 30 Oct 2024 08:33:17 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t648h-0000000HHji-1Kv4
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 08:33:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B1302000A;
	Wed, 30 Oct 2024 08:33:08 +0000 (UTC)
Message-ID: <7b4228ab-a645-4cb0-8f05-000aa78f5f27@ghiti.fr>
Date: Wed, 30 Oct 2024 09:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrea Parri <parri.andrea@gmail.com>, linux-kernel@vger.kernel.org
References: <mvm5xq44bqh.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvm5xq44bqh.fsf@suse.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_013315_529176_EC2ADB11 
X-CRM114-Status: GOOD (  11.57  )
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


Thanks for the patch!

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
