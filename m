Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E17C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 21:58:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B372964FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 21:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B372964FAB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:From:Date:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AMrJrZQ7JuHlD1EnsjJriJqjyf+czGk9lfkI5Z7wdhE=; b=Xncv+YsApOmMeGZR6RZW+UNn+f
	Dcg1Jhn8jFlkmJO4jUKy0qVcRlyLlml4rDU1zXgaQSEgxuH8eXp7pVBjKnWwcIj95JkcGryayiQQ+
	/4E96rwNRuuhWHbO2Is4AgbjYPCPm2xtB6ucBw7E7F4BQG0J/ixiNLuWDSmPWfLvzYFA0Zs3PVjwX
	NuSaYmH6DfXpPKFn3Hr46WyHu2aNlJRfi6akac7Fz3fERd3IjBHW/sArxUvhyeSqzfVc8sOE0yK7i
	Q6kmZ6ihaiINN4+OixNGcji+kkFwHDXInJYI4fDvder1dRSZgzz/uFZmryQaPh3jiLRhMBHp3gor4
	k5W2Z+Tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK6q8-007rUO-MZ; Wed, 10 Mar 2021 21:58:00 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK4g9-007cn5-Jx
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 19:39:36 +0000
Received: from ATCSQR.andestech.com (localhost [127.0.0.2] (may be forged))
 by ATCSQR.andestech.com with ESMTP id 12AJ6HZN096465
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 03:06:17 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12AJ5QoI096340
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 03:05:26 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Thu, 11 Mar 2021
 03:05:28 +0800
Date: Thu, 11 Mar 2021 03:02:34 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: <linux-riscv@lists.infradead.org>
CC: <alankao@andestech.com>, <ruinland@andestech.com>
Subject: Re: [RFC patch 4/4] riscv: sifive: apply errata "cip-453" patch
Message-ID: <20210310190234.GB25175@APC301.andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12AJ5QoI096340
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_193934_272723_4C442988 
X-CRM114-Status: GOOD (  10.09  )
X-Mailman-Approved-At: Wed, 10 Mar 2021 21:57:58 +0000
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
Reply-To: 1615175897-23509-5-git-send-email-vincent.chen@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vincent,

Thanks for introducing the alternative mechanism to RISC-V, with which
vendors could provide fixes for each erratum in a more elegant way.

Somehow, I'm a bit sketchy about these parts of your proposal :

>     /* Exception vector table */
>  ENTRY(excp_vect_table)
>     RISCV_PTR do_trap_insn_misaligned
> -   RISCV_PTR do_trap_insn_fault
> +   ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),
> +           __stringify(RISCV_PTR do_trap_insn_fault_trampoline),
> +           SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
>     RISCV_PTR do_trap_insn_illegal
>     RISCV_PTR do_trap_break
>     RISCV_PTR do_trap_load_misaligned
> @@ -461,7 +466,10 @@ ENTRY(excp_vect_table)
>     RISCV_PTR do_trap_ecall_s
>     RISCV_PTR do_trap_unknown
>     RISCV_PTR do_trap_ecall_m
> -   RISCV_PTR do_page_fault   /* instruction page fault */
> +   /* instruciton page fault */
> +   ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),
> +           __stringify(RISCV_PTR do_page_fault_trampoline),
> +           SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
>     RISCV_PTR do_page_fault   /* load page fault */

As far as I can tell, `ALTERNATIVE(...)` seems a bit like a mixture of
ARM's version of ALTERNATIVE and `alternative_insn`. However, ARM's
ALTERNATIVE takes a vardatic macro and yours here doesn't, which makes
me wonder if another vendor needs to patch the same location as yours,
will they be able to multiplex the same probe ?


Secondly, I think it's a bit intrusive to patch directly on exception
vector table here.

I'm not sure about whether it's possible to introduce your alternative
probe inside do_trap_insn_fault() & do_page_fault(), do the inspection
the reason of trap (e.g. instruction/load/store page fault) there and
then, perform the software workaround.

If that's not feasible, maybe we shall make a new macro with a name
like "RISCV_TRAP_ENTRY" which encompass the alternative probes ?

Last but not least, is it possible that in the near future,
`alternative_if` macro family from ARM could be ported to RISC-V ?

Best regards,
Ruinland

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
