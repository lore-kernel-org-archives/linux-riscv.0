Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55759C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwLqSuPeUTe9tCTDUBMnQXazzoh9NcXi9mAYP/LwB18=; b=zdLI/ACkPy71T0
	keV6CXCeifnbHxUB+KOPTMyynxJSh+U++vPhqjoo0Ac1niOza7OwyKuTemrZQAYRcACLynbkGMUIy
	OsEl/mVjr7G2ClOrIXGLpVVme4pLHOTKrLflggZRcGrUsjWcp85Q9SvjEae6mrCu6l3FJfIqGCzB/
	vT4d2kVAsqgSVuXBTpC1C78nQuPt1fbARdUQlrA3rh+BK2eDm4GZV4kc1dhJBUZHGqJ9xzyuNSDn/
	kdbWCLvy09HhTmfKSqbxKU4FbRU/fGlpMrrtcqTHtCcdomOK/Y8uwolNHSqKc2Pgmfc/S/dkbl6bq
	OuUKZk7A+QrTNdNpnm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJY28-00ELds-30; Mon, 14 Feb 2022 09:52:36 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXjW-00EG5O-5y
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 09:33:28 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4JxzYC2nmmz1sb42;
 Mon, 14 Feb 2022 10:33:19 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4JxzYC1Pw7z1qqkB;
 Mon, 14 Feb 2022 10:33:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 4A6rFkojWdYt; Mon, 14 Feb 2022 10:33:13 +0100 (CET)
X-Auth-Info: 3pXtXEblWigUp5dC0ALx0wnK0waqMMj3wTwQrNh+E7nq00Dn+vM/9Ec1zbIoMOOV
Received: from igel.home (ppp-46-244-178-131.dynamic.mnet-online.de
 [46.244.178.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 14 Feb 2022 10:33:13 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 07A512C39FF; Mon, 14 Feb 2022 10:33:13 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Ard Biesheuvel <ardb@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Atish Patra <atishp@atishpatra.org>,
 linux-efi@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Anup Patel <apatel@ventanamicro.com>,
 stable@vger.kernel.org,  Sunil V L <sunilvl@ventanamicro.com>
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
 <877d9xx14f.fsf@igel.home>
 <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de>
X-Yow: LOU GRANT froze my ASSETS!!
Date: Mon, 14 Feb 2022 10:33:12 +0100
In-Reply-To: <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de> (Heinrich
 Schuchardt's message of "Mon, 14 Feb 2022 10:24:22 +0100")
Message-ID: <87y22dvllz.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_013322_425247_FAA07420 
X-CRM114-Status: GOOD (  13.96  )
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

On Feb 14 2022, Heinrich Schuchardt wrote:

> On 2/14/22 10:12, Andreas Schwab wrote:
>> On Jan 28 2022, Sunil V L wrote:
>>
>>> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
>>> index 380e4e251399..9c460843442f 100644
>>> --- a/drivers/firmware/efi/libstub/riscv-stub.c
>>> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
>>> @@ -25,7 +25,7 @@ typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
>>>
>>>   static u32 hartid;
>>>
>>> -static u32 get_boot_hartid_from_fdt(void)
>>> +static int get_boot_hartid_from_fdt(void)
>>
>> I think the function should be renamed, now that it no longer returns
>> the hart ID, but initializes a static variable as a side effect.  Thus
>> it no longer "gets", but "sets".
>>
>
> set_boot_hartid() implies that the caller can change the boot hart ID.
> As this is not a case this name obviously would be a misnomer.

Then I guess a different, more fitting name needs to be found.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
