Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08A3C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tzx4zqPFcT4QkcE+8gBa1IufqjHgltjGlC6JR5Xg0/I=; b=j6KM2ypPfsQMXsypI58I4L3OYd
	8/rUak4kGR7RQDT82oVsJZi057/rilHDc6z6RxkJEktMxx037QprBd8cbfjkotDMqx2TlMoEEHGC9
	a1G0ATaXqr6d7bEF6SKd4pZmFimejUhgaxqgfWmbgkz5i0A9lqU2OYZc5Qdc437gRyIxrxjKrKJ7k
	2RKE3o1plOxJ/JqdpMUrrnFYGCe00760Xm+//dsupzbM1dLAqlLXgMhik/27RKYn7g70RWtwozAWj
	a5RlO2WstTObvp9XrSZRoTxpHAdDN2/HPpMkInqfKED4P4/RAf4dbVQhIo8b6J5RfYnqN1Fl7msOg
	RA1Rg01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNe7-00FNDU-FL; Fri, 14 Oct 2022 16:34:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNe4-00FNC1-El
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 16:34:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id b5so4743347pgb.6
        for <linux-riscv@lists.infradead.org>; Fri, 14 Oct 2022 09:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg5pQy557rgh/UO1fUkx1LopoXeltqwqYWSNSnJV9tw=;
        b=L+ysN48IkcHV/DTusk0VGPnnipxl1TNcLFFrBViN0QxqsI3v3IOk6iQoVwNg3suaeG
         kAEESl+I8JUVQVTlMIvJQqgoqhyuGIpXv6TTwjMZa/Itcax9LufHZArtvQxBP8O+kKps
         utDCXooX4ceE/M1ub+buryuKzqFwcz3CY8P+lJexkcQHiobVBTBGKY+vIPL7jaqUR9Zi
         26rsAGxGQNxc+wHoxRnfXMjlX8CQEVmpxEnAJdnj15ZG6LwZxJp0gEx7dT4pTU47ngHf
         NvswhC5bbWog2IO1vXZWMCeFzzy47IxZPy4uLg8mFCBZ2/mwmjVMc0UwdzEYyCIn9XYz
         DG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg5pQy557rgh/UO1fUkx1LopoXeltqwqYWSNSnJV9tw=;
        b=5iv8LseEa3QjgJFXKi3nRn/LNG7GDT9VSdjW1FlIpYfF79u6Kd+MrkV3eubdCUsovl
         aZCVPuiQywuPLrzM8WOH1XhjL1EW03t222IPv4mGfJZS1hT5pePnAWfP2lqmHY6inb0k
         0GFnW82Sa1yHIXayN/IaphdpTa1EFB1B5r8uLQjaUMjgJJS+fEVaDOjDMf59MXGby9AJ
         y0xXFsqu8n3vGf9+m7bDJFvrYZoSSY3E3YuIqi73eW2ZGJ9L2Nc0575muxDXKM5Bidr+
         LyBQqD5E7RZkcweT9fYoLBsjcEgzPPJNp0maoZLySyRgoeQdkVpwczfY7eA1Q6y0WS96
         PVFg==
X-Gm-Message-State: ACrzQf3bo9npwvZ3Ms6KuT1mW4DuqopK5nMuSJhNIQaEq8dIc9s6fc58
	gkkKZvdJgzt9QVdC1AN1w2JwhFCepGn/FQ==
X-Google-Smtp-Source: AMsMyM4ZTFUWEeu7Khu7dChK8UlLV3oyyue5Ou7Oz+LOEhGx3FqvsMVXH4bOk0hD6LfXe71yHnoASQ==
X-Received: by 2002:a63:90c1:0:b0:45f:c9a7:15c3 with SMTP id a184-20020a6390c1000000b0045fc9a715c3mr5215910pge.304.1665765285443;
        Fri, 14 Oct 2022 09:34:45 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u188-20020a6260c5000000b00540e1117c98sm1914118pfb.122.2022.10.14.09.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 09:34:44 -0700 (PDT)
Date: Fri, 14 Oct 2022 09:34:44 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Oct 2022 09:34:53 PDT (-0700)
Subject: Re: [PATCH v1 1/1] riscv: mm: add missing memcpy in kasan_init
In-Reply-To: <CAOnJCU+n4gvyj=a=JjGMkC4PXHLNWt-_a9aqtp61XHCD-8UYHA@mail.gmail.com>
CC: panqinglin2020@iscas.ac.cn, alex@ghiti.fr, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-0175869a-0c5e-4e7b-ace1-30387ef2b158@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_093448_523852_1421C01B 
X-CRM114-Status: GOOD (  27.43  )
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

On Sun, 09 Oct 2022 23:49:36 PDT (-0700), atishp@atishpatra.org wrote:
> On Sun, Oct 9, 2022 at 1:31 AM <panqinglin2020@iscas.ac.cn> wrote:
>>
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Hi Atish,
>>
>> It seems that the panic is due to the missing memcpy during kasan_init.
>> Could you please check whether this patch is helpful?
>>
>> When doing kasan_populate, the new allocated base_pud/base_p4d should
>> contain kasan_early_shadow_{pud, p4d}'s content. Add the missing memcpy
>> to avoid page fault when read/write kasan shadow region.
>>
>> Tested on:
>>  - qemu with sv57 and CONFIG_KASAN on.
>>  - qemu with sv48 and CONFIG_KASAN on.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>> ---
>>  arch/riscv/mm/kasan_init.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> index a22e418dbd82..e1226709490f 100644
>> --- a/arch/riscv/mm/kasan_init.c
>> +++ b/arch/riscv/mm/kasan_init.c
>> @@ -113,6 +113,8 @@ static void __init kasan_populate_pud(pgd_t *pgd,
>>                 base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
>>         } else if (pgd_none(*pgd)) {
>>                 base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
>> +               memcpy(base_pud, (void *)kasan_early_shadow_pud,
>> +                       sizeof(pud_t) * PTRS_PER_PUD);
>>         } else {
>>                 base_pud = (pud_t *)pgd_page_vaddr(*pgd);
>>                 if (base_pud == lm_alias(kasan_early_shadow_pud)) {
>> @@ -173,8 +175,11 @@ static void __init kasan_populate_p4d(pgd_t *pgd,
>>                 base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(*pgd)));
>>         } else {
>>                 base_p4d = (p4d_t *)pgd_page_vaddr(*pgd);
>> -               if (base_p4d == lm_alias(kasan_early_shadow_p4d))
>> +               if (base_p4d == lm_alias(kasan_early_shadow_p4d)) {
>>                         base_p4d = memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
>> +                       memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
>> +                               sizeof(p4d_t) * PTRS_PER_P4D);
>> +               }
>>         }
>>
>>         p4dp = base_p4d + p4d_index(vaddr);
>> --
>> 2.35.1
>>
>
> Yes. This patch fixes the boot issue for me with Kasan enabled on v6.0.
>
> Tested-by: Atish Patra <atishp@rivosinc.com>
>
> Thanks for the patch. Few nit comments:
>
> You can drop the message addressed to me in the commit text.
> Usually, that should be after the last sign off between two  "---"
>
> As conor suggested, there should be a Fixes tag[1] in the commit text.
>
> [1] https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html#:~:text=A%20Fixes%3A%20tag%20indicates%20that,versions%20should%20receive%20your%20fix.

I've got this on not-for-next in a cleaned up state, so no reason to 
resend just for these.  It also fixes my boot issues, but it's not quite 
passing the smell test right now.  I've looked at this a few times and 
every time I do I manage to convince myself that there's a bunch of 
issues in these kasan initialization routines, but my attempts to clean 
them up just result in more breakages.  So I think there's something I 
don't quite get about this yet.

I'll try and find some time this weekend to dig into this further, 
hopefully it's just all the merge window interrupts that are preventing 
me from getting anywhere.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
