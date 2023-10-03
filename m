Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7617CE7AD72
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpnLvoAwMTm5TLsJfVkKMwZTP7g8/6eELmE2WMK0OZo=; b=iI4ZFCoCgpF/ZD
	C/mSNCiqtWOuCmvUMKrTPmSdVlr2QHkU61iaX5G2QC+e4WLEelVscCJlhJz1QBfWsYjpOntf++nsJ
	a3HDd6oZaANYSxsH5lEdFdZ4k4eI3heW78auv27LgBcwZv1J3Dax1WazCqQEvKzEcsYdepX4DnGdo
	Y5PIdMgIzZAQcEO8XavcnCvZTyQMCLZlsV/jrxHCA8XOaMWpKc+ydCzrkaw+zxbvQpoB9QIPawJ6x
	1mo0q9ceSs6LvAoAO9dU1drOVZjolHxgJ5K05LAfweZodVKBv4UIlIKeRONRR4b/h3rO8Taz4r2dR
	25VOKoWeSJcbTwmroEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhQx-00EtDx-1a;
	Tue, 03 Oct 2023 15:35:39 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhQu-00EtD9-1A
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 15:35:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 608734000D;
	Tue,  3 Oct 2023 15:35:23 +0000 (UTC)
Message-ID: <24b6ec5c-cf71-9d01-d624-ffba2e25eaf8@ghiti.fr>
Date: Tue, 3 Oct 2023 17:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH -fixes 2/2] riscv: Fix set_huge_pte_at() for NAPOT
 mappings when a swap entry is set
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
 <20230928151846.8229-3-alexghiti@rivosinc.com>
 <20230930-unnoticed-slacked-0bf5696cc265@spud>
 <96984fd2-2e3b-d861-5555-5b5a4e5c55d6@ghiti.fr>
 <20231002-unending-ether-1b9f73eb642c@spud>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231002-unending-ether-1b9f73eb642c@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_083536_537602_43ABE8EB 
X-CRM114-Status: GOOD (  29.64  )
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

Hey Conor,

On 02/10/2023 15:11, Conor Dooley wrote:
> On Mon, Oct 02, 2023 at 09:18:52AM +0200, Alexandre Ghiti wrote:
>> Hi Conor,
>>
>> On 30/09/2023 11:14, Conor Dooley wrote:
>>> On Thu, Sep 28, 2023 at 05:18:46PM +0200, Alexandre Ghiti wrote:
>>>> We used to determine the number of page table entries to set for a NAPOT
>>>> hugepage by using the pte value which actually fails when the pte to set is
>>>> a swap entry.
>>>>
>>>> So take advantage of a recent fix for arm64 reported in [1] which
>>>> introduces the size of the mapping as an argument of set_huge_pte_at(): we
>>>> can then use this size to compute the number of page table entries to set
>>>> for a NAPOT region.
>>>>
>>>> Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
>>>> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> Closes: https://lore.kernel.org/linux-arm-kernel/20230922115804.2043771-1-ryan.roberts@arm.com/ [1]
>>>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>> Breaks the build. Your $subject marks this for -fixes, but this will not
>>> build there, as it relies on content that's not yet in that branch.
>>> AFAICT, you're going to have to resend this with akpm on CC, as the
>>> dependency is in his tree...
>>
>> I see, but I still don't understand why -fixes does not point to the latest
>> rcX instead of staying on rc1?
> It's up to Palmer what he does with his fixes branch, but two thoughts.
> Doing what you suggest would require rebasing things not yet sent to Linus
> every week and fast-forwarding when PRs are actually merged.
> IIRC, Palmer used to do something like the latter, but IIRC he got some
> complaints about that and switched to the current method.
> At the very least, you should point out dependencies like this, as I
> figure an individual patch could be applied on top of -rc4 and merged
> in. Both Palmer and I have submitted things for b4 to improve support for
> doing things exactly like this ;)
>
>> The patch which this series depends on just made it to rc4.
> However, if you do not mention what the deps for your patches are
> explicitly, how are people supposed to know? The reference to the
> dependency makes it look like a report for a similar problem that also
> applies to riscv, not a pre-requisite for the patch.


You're right, I saw the dependency being merged so I thought it would be 
ok but I should have mention it. I have just discussed with Palmer, and 
I'll +cc Andrew to see if he can take that in his tree.

Thanks!

Alex


>
> Thanks,
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
