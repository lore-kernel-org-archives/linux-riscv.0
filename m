Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B71C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRYhLi3mNx+MG13LlQ0lTwBqBdUDjDsTszqLCD7/0/o=; b=lbHJuBlJ6YT6vM
	bvBRAatrrtlX0mn5ie5E77y7NkrWQu1n/Q9GqzLAvO/gvMzwhj6oMk6Ny1Kz4DEzNOvpyjjQK+9LY
	J3st9nUNK/kh09xx+5oD+57x/hBE31/erMx3zusnQACs9HuogoJIRyhrj6cUFGlWicj8q/kxA+VzQ
	wjR/zJKqW8D6oo8Q+kH80CLXiC7L7eWktSBr2ELF8XTzJ8rU5GIr8AuX9GLBB4p4q70PL933ZAEKv
	boUUVIfhKn0BAxu3c7yFk6V5N1iw66LrVZjWtIyqJtBs6N1TwFHmEzF56ouNELiVmn3rnP6mip+Hl
	0B4dScIPc7iYJ+gdLGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPbtI-0000000EyVy-3WF9;
	Fri, 05 Jul 2024 05:53:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPbtF-0000000EyV9-3UhF
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 05:53:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 366F940006;
	Fri,  5 Jul 2024 05:53:45 +0000 (UTC)
Message-ID: <adce9444-a6c4-4747-afec-d70af4a396d3@ghiti.fr>
Date: Fri, 5 Jul 2024 07:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: vdso: do not strip debugging info for vdso.so.dbg
Content-Language: en-US
To: Changbin Du <changbin.du@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240611040947.3024710-1-changbin.du@huawei.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240611040947.3024710-1-changbin.du@huawei.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_225350_037095_3A4A5276 
X-CRM114-Status: GOOD (  12.12  )
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

Hi Changbin,

On 11/06/2024 06:09, Changbin Du wrote:
> The vdso.so.dbg is a debug version of vdso and could be used for debugging
> purpose. For example, perf-annotate requires debugging info to show source
> lines. So let's keep its debugging info.
>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>   arch/riscv/kernel/vdso/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f7ef8ad9b550..960feb1526ca 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -45,7 +45,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
>   # link rule for the .so file, .lds has to be first
>   $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
>   	$(call if_changed,vdsold)
> -LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
> +LDFLAGS_vdso.so.dbg = -shared -soname=linux-vdso.so.1 \
>   	--build-id=sha1 --hash-style=both --eh-frame-hdr
>   
>   # strip rule for the .so file


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
