Return-Path: <SRS0=e4j4=YK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA901FA372A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 10:39:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E4B021835
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 10:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bdpugdwv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E4B021835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=virtuozzo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hrvi3J8c610/tbPQUVeCbrpw0WQCoEwML6/O58ZsohA=; b=BdpugdwvBMdM7orxMV0cEFfYfd
	jcLuxHGbLXP/9V/chPay/xChWokSPcbhDy/A2CXaxK7OTtkgRwWYy1/B87CN1WV8NUJBNodqEd8oP
	3Ya1JeGvUeGkWmxJZHo9ok0BL+iynSI5u5CogYA+qutLkaF2nS23sPw4YkjgOgtl70C+HIhUzrCI6
	byQqZ0C2hKuJ840phQLrjYmDatv64JpnROY680XYHptMefphf1C5S6h15oE6XdPvdBRBQcgkE+ooJ
	n5mxKHwkKyebJhXEuLtiD9LC29QdX65dp2ZKYFtl6+fBIP79yinCER2cmXdTQbg4vZK5+3s+Y1CKx
	RXOh2ggQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL3C2-0000d2-Mz; Thu, 17 Oct 2019 10:39:42 +0000
Received: from relay.sw.ru ([185.231.240.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL3By-0000az-PM
 for linux-riscv@lists.infradead.org; Thu, 17 Oct 2019 10:39:40 +0000
Received: from [172.16.25.5] by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iL3Bf-0005sq-P7; Thu, 17 Oct 2019 13:39:19 +0300
Subject: Re: [PATCH v3 1/3] kasan: Archs don't check memmove if not support it.
To: Nick Hu <nickhu@andestech.com>, alankao@andestech.com,
 paul.walmsley@sifive.com, palmer@sifive.com, aou@eecs.berkeley.edu,
 glider@google.com, dvyukov@google.com, corbet@lwn.net,
 alexios.zavras@intel.com, allison@lohutok.net, Anup.Patel@wdc.com,
 tglx@linutronix.de, gregkh@linuxfoundation.org, atish.patra@wdc.com,
 kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <cover.1570514544.git.nickhu@andestech.com>
 <c9fa9eb25a5c0b1f733494dfd439f056c6e938fd.1570514544.git.nickhu@andestech.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <ba456776-a77f-5306-60ef-c19a4a8b3119@virtuozzo.com>
Date: Thu, 17 Oct 2019 13:39:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c9fa9eb25a5c0b1f733494dfd439f056c6e938fd.1570514544.git.nickhu@andestech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_033938_826972_8E620B88 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/8/19 9:11 AM, Nick Hu wrote:
> Skip the memmove checking for those archs who don't support it.
 
The patch is fine but the changelog sounds misleading. We don't skip memmove checking.
If arch don't have memmove than the C implementation from lib/string.c used.
It's instrumented by compiler so it's checked and we simply don't need that KASAN's memmove with
manual checks.

> Signed-off-by: Nick Hu <nickhu@andestech.com>
> ---
>  mm/kasan/common.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 6814d6d6a023..897f9520bab3 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -107,6 +107,7 @@ void *memset(void *addr, int c, size_t len)
>  	return __memset(addr, c, len);
>  }
>  
> +#ifdef __HAVE_ARCH_MEMMOVE
>  #undef memmove
>  void *memmove(void *dest, const void *src, size_t len)
>  {
> @@ -115,6 +116,7 @@ void *memmove(void *dest, const void *src, size_t len)
>  
>  	return __memmove(dest, src, len);
>  }
> +#endif
>  
>  #undef memcpy
>  void *memcpy(void *dest, const void *src, size_t len)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
