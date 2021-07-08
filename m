Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3611DC07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 11:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA4D6146D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 11:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA4D6146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKgoqDTZiYjBMcVTTW8mHryh+LpNZnXkxuYVQR2r6M4=; b=Mvw/YOA9SzSI7GbTEER15sZkmY
	7lZLMRIWLxp9D9HvUblubp9X9+8wpgdy0Jf/SOW/2QbGWziA6CcmvS8qZ7/YHRgMhATQOhNaZZ0sb
	GcfmfG2ajDM0sghk9G6hLS0FO0vAy8YA5MUsBAaAM++ViTbj7w121h0KMzj2Uo+2iylE1/3ascP4N
	ALaJO+oPVxnHjNNpnMDSsVXPKPDFZJvJPpYTDVQMlgur+JgHViKkRDvlllXL8fbo6d5YTqjUn+bIC
	cbPwigSMDcG2H669f1ZMLM6vcXq/jBjCZjCisEtnv0TvgjVSp6k1bIM1+f8OdnGn1SL4tRXfiuGCj
	xzCM35xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1SQS-00GlAM-5p; Thu, 08 Jul 2021 11:42:40 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1SQ0-00Gl1A-7X
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 11:42:14 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1B799240009;
 Thu,  8 Jul 2021 11:42:02 +0000 (UTC)
Subject: Re: [PATCH -fixes] riscv: Fix PTDUMP output now BPF region moved back
 to module region
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <mhng-fe8bcaf3-d184-4584-99f5-6ea4b9144934@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <b2922513-e542-d8c0-a29d-a8990d838479@ghiti.fr>
Date: Thu, 8 Jul 2021 13:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mhng-fe8bcaf3-d184-4584-99f5-6ea4b9144934@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_044212_473516_260684E5 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 7/07/2021 =E0 01:16, Palmer Dabbelt a =E9crit=A0:
> On Thu, 24 Jun 2021 05:17:21 PDT (-0700), alex@ghiti.fr wrote:
>> BPF region was moved back to the region below the kernel at the end of =

>> the
>> module region in commit 3a02764c372c ("riscv: Ensure BPF_JIT_REGION_START
>> aligned with PMD size"), so reflect this change in kernel page table
>> output.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>> =A0arch/riscv/mm/ptdump.c | 4 ++--
>> =A01 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
>> index 0536ac84b730..22d6555d89dc 100644
>> --- a/arch/riscv/mm/ptdump.c
>> +++ b/arch/riscv/mm/ptdump.c
>> @@ -98,8 +98,8 @@ static struct addr_marker address_markers[] =3D {
>> =A0=A0=A0=A0 {0, "vmalloc() end"},
>> =A0=A0=A0=A0 {0, "Linear mapping"},
>> =A0#ifdef CONFIG_64BIT
>> -=A0=A0=A0 {0, "Modules mapping"},
>> -=A0=A0=A0 {0, "Kernel mapping (kernel, BPF)"},
>> +=A0=A0=A0 {0, "Modules/BPF mapping"},
>> +=A0=A0=A0 {0, "Kernel mapping"},
>> =A0#endif
>> =A0=A0=A0=A0 {-1, NULL},
>> =A0};
> =

> Thanks, this is on for-next.

As this fix was for 5.13, I add stable in cc.

Cc: stable@vger.kernel.org # v5.13

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
