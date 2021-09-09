Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1AFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 05:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D12A261131
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 05:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D12A261131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=comcast.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oGoitZvY7HEaoo5YG3Nz3zdm7HS9HIgT85nSdV2u1s=; b=g/ApQuI+wVGnH8cEN2gkeg+fjf
	cycOEOcMYu0xGiwnod3RMrcqrQPA+0WNpVR1dISLTRGPM17s9ce8TU5WiIgqTsjoYyN1mlR7eDvYD
	/cn5LPN2213rRE3MuApCboySZ2CoVgebHBROvyQArxYloUN7a/OQ7kNG9wuxm2LeXjpNsvtZh3FL+
	2IK0egSlfDtouf9p8jY7fvjdSbmqPDiCiH7lp70PT9QDi6jbEtHMXG9jjcdG3YinwSgKtbo0eAIak
	Fe7khIoyfNafjIzMBgd6L5Xlmfpe1TSgNym33MpgS5ccBKA9UqEhUzfc+2qGkZnHcYWCwiP16ag+/
	fqLgtocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOCLg-008DPZ-TS; Thu, 09 Sep 2021 05:11:44 +0000
Received: from resqmta-po-08v.sys.comcast.net
 ([2001:558:fe16:19:96:114:154:167])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOCLd-008DNP-Bs
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 05:11:42 +0000
Received: from resomta-po-12v.sys.comcast.net ([96.114.154.236])
 by resqmta-po-08v.sys.comcast.net with ESMTP
 id OCLAm0EJWArcZOCLIme2Dn; Thu, 09 Sep 2021 05:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1631164280;
 bh=oystJQKPfSMh33cVgzrK3+/ksD/HrMaCUgOL0qJ19n8=;
 h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
 Content-Type;
 b=q2WmxeEOQD20GC48RVCbFQ1BhPu0w/8oHbFjtv72uDhtefFz6ywRRAsxThYsA5gxD
 QCRG1c2L7X2m70oKBytKWLJ8MKRBszBgHIhlojtkx01qDbbuu+FbjjtMtVM7dtdI21
 xYlXeog6ns1rhTKaiQwhilImVlj+l1ifjOQb6lVeNkPHa4LeHn9CWZkyMzzK95NqIm
 u8+9kopovDBLg21ff19BEOz6oQ5jKaLspOB0KTwOOCNdYsgKBvhztXrWZluLnbcqEx
 pnukSmYwgmbnq+lYtBxDTgBLkj+wIfZ2OVZL52PwNDu1dVGTQi0mPfypa7Alo9BDkK
 Dn5D7DarYlS7A==
Received: from [IPv6:2601:647:4700:284:1e0c:aa38:8744:8d36]
 ([IPv6:2601:647:4700:284:1e0c:aa38:8744:8d36])
 by resomta-po-12v.sys.comcast.net with ESMTPSA
 id OCLEmsKh5ILMGOCLEm9Jyo; Thu, 09 Sep 2021 05:11:18 +0000
X-Xfinity-VMeta: sc=-100.00;st=legit
Subject: Re: [PATCH] riscv: set default pm_power_off to NULL
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
References: <20210907002847.111633-1-dimitri.ledkov@canonical.com>
From: Ron Economos <w6rz@comcast.net>
Message-ID: <31e42fe2-0a9b-6d2d-33fe-be66d516b9cf@comcast.net>
Date: Wed, 8 Sep 2021 22:11:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907002847.111633-1-dimitri.ledkov@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_221141_494492_2E9BCC6C 
X-CRM114-Status: GOOD (  18.68  )
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

On 9/6/21 5:28 PM, Dimitri John Ledkov wrote:

> Set pm_power_off to NULL like on all other architectures, check if it
> is set in machine_halt() and machine_power_off() and fallback to
> default_power_off if no other power driver got registered.
>
> This brings riscv architecture inline with all other architectures,
> and allows to reuse exiting power drivers unmodified.
>
> Kernels without legacy SBI v0.1 extensions (CONFIG_RISCV_SBI_V01 is
> not set), do not set pm_power_off to sbi_shutdown(). There is no
> support for SBI v0.3 system reset extension either. This prevents
> using gpio_poweroff on SiFive HiFive Unmatched.
>
> Tested on SiFive HiFive unmatched, with a dtb specifying gpio-poweroff
> node and kernel complied without CONFIG_RISCV_SBI_V01.
>
> BugLink: https://bugs.launchpad.net/bugs/1942806
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> ---
>   arch/riscv/kernel/reset.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index ee5878d968..9c842c4168 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -12,7 +12,7 @@ static void default_power_off(void)
>   		wait_for_interrupt();
>   }
>   
> -void (*pm_power_off)(void) = default_power_off;
> +void (*pm_power_off)(void) = NULL;
>   EXPORT_SYMBOL(pm_power_off);
>   
>   void machine_restart(char *cmd)
> @@ -23,10 +23,16 @@ void machine_restart(char *cmd)
>   
>   void machine_halt(void)
>   {
> -	pm_power_off();
> +	if (pm_power_off != NULL)
> +		pm_power_off();
> +	else
> +		default_power_off();
>   }
>   
>   void machine_power_off(void)
>   {
> -	pm_power_off();
> +	if (pm_power_off != NULL)
> +		pm_power_off();
> +	else
> +		default_power_off();
>   }

Works good here. Tested on HiFive Unmatched, Ubuntu 21.04 and kernel 5.14.2

Tested-by: Ron Economos <w6rz@comcast.net>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
