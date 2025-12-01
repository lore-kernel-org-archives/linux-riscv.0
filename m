Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC959D116F1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/0aDZsn7v0jqa1XzeOg0t2AB/U4upRbXf5JlKv+LBg=; b=YXrpFPJ928aDJp
	k62mGgZlTxX/Z3VvFETePPpqUwialpig5FdORvZSWcNM0VPluhpF5kJ+tdv2mADJ5BBZuYXjHjb6n
	qXixJrm50CWRtoDBIAyaU4qfVzGhjPYCo7/7l9R/wKKNUt1PoTQrLaJQ4acfxh6MHpvPa3BJ7nu7m
	LISKW+QkG/GyqXT5U8K2p9EH4nedaiqAYQUbhvuf+jTZ98aNjdty3kISyyun9+B7Co4n5kNjb9hKB
	jJ8AZwXgMrwK5xVLVFVLFOFLXdNY7PPK97AuTcEGw0ogWMmQgFQzFDYOpimrnutwx9yTikP6kAWi0
	z+4e9bKlPH7bwmRhmG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0CY-00000003DAu-1ZeV;
	Mon, 01 Dec 2025 09:28:10 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0CV-00000003DAH-2deQ
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 09:28:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fCj9Mj40Upz7olHyIbpNdyZOXDCrkRaNysKVGCWLnco=;
	b=0eIMpJ64gSzjJBAKdb/gW3vzgtjNhxT2kEU/aFpeW1C4d2YyyQU+VQOkgdXpBkq43XjBnYzyf
	ys+PxLhdZcnuORIjm7sQ9Rlb3sXGVBdR3ArakVAKlnN4IP8f74Qccgdolv1HhjyxxH3/bdJ6C7o
	GI+3XQk1V63igaUxWeTa5k0=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dKdmW3wFQznTVZ;
	Mon,  1 Dec 2025 17:25:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 325F4140276;
	Mon,  1 Dec 2025 17:27:54 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Dec 2025 17:27:53 +0800
Message-ID: <812ce4ef-16cc-6c75-f1b0-ee128dcf45f1@huawei.com>
Date: Mon, 1 Dec 2025 17:27:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] riscv: pgtable: Cleanup useless VA_USER_XXX definitions
Content-Language: en-US
To: <guoren@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<alex@ghiti.fr>, <charlie@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251201005850.702569-1-guoren@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20251201005850.702569-1-guoren@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_012808_138520_893C590D 
X-CRM114-Status: UNSURE (   7.93  )
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



On 2025/12/1 8:58, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> These marcos are not used after commit b5b4287accd7 ("riscv: mm: Use
> hint address in mmap if available"). Cleanup VA_USER_XXX definitions
> in asm/pgtable.h.
> 
> Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 5a08eb5fe99f..30d1ea93dde3 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -124,10 +124,6 @@
>  #ifdef CONFIG_64BIT
>  #include <asm/pgtable-64.h>
>  
> -#define VA_USER_SV39 (UL(1) << (VA_BITS_SV39 - 1))
> -#define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
> -#define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> -
>  #define MMAP_VA_BITS_64 ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
>  #define MMAP_MIN_VA_BITS_64 (VA_BITS_SV39)
>  #define MMAP_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_VA_BITS_64)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
