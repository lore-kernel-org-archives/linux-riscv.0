Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B72C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 14:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB7596103A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 14:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB7596103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRlhD8nQN5G4bRyVJ0NcoLRvGhhqfBDQYB2IXyVi5e8=; b=K+mqeLTbZjqb15
	FqR7QyEj2DyWR/z/1Df6S5o1wzGCiRATPFEqTz2WFrZ7kK/mrGob2vAXzM705ARRnZY52zdkbiuwk
	VI7KoS1d4Zty1yLpodRu1KpCFZKJ+CApEVAoVesoHd8n7LaNSnEKYX8ScMIvTjLqwEYIYSF25DaZ+
	HhjyHE3D8ExOg7SZZ2u7UmVhv26izn8KfpxHjpe4ik1pkT6YN5d0NeJzUO8CAgIpFJjofVBkbmzG4
	yslef1fUsCorc02caIHm4oVsn5IU3nDaLXe/Ra6LhSBet8e0O14IwxFhzIrs1pnClq4bJTH+jLpJ+
	A13EY8ZixhYXni59+MSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJG7V-00AKSE-AM; Thu, 26 Aug 2021 14:12:41 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJG7P-00AKQ1-0Y
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 14:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=PwPdTMkZZMVwu4jau4Iu8OhLTyCA5Uyt5p
 LWWepOgFk=; b=VcyN4UoUV+vPpbVr1PU0cmQBTJJ7N64TgTDTZTDLt+uQ+2y3AE
 N9M1ONap8hnmqjmCkZuE0nDifoTZ/DbJ5+KzkN74TvzM3oQ084Qvc26mBeJBjovS
 3LSrtrF3Nm6dM+mUbD4QM14iYECEXLhkqKgQCaSbBIKpIC6p8br5OFpSg=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBXLv9CoSdhqJ3GAA--.14367S2; 
 Thu, 26 Aug 2021 22:12:19 +0800 (CST)
Date: Thu, 26 Aug 2021 22:06:00 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: improve __ex_table section handling
Message-ID: <20210826220600.4759900b@xhacker>
In-Reply-To: <mhng-1d66757a-1be0-4e46-8bbc-0568ceddfeb3@palmerdabbelt-glaptop>
References: <20210809012509.4983c1d6@xhacker>
 <mhng-1d66757a-1be0-4e46-8bbc-0568ceddfeb3@palmerdabbelt-glaptop>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBXLv9CoSdhqJ3GAA--.14367S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1UXFWxWFyDXr43KF45Wrg_yoW8ur43pr
 4Ykw1qkr15CF1kZasrK34jgry8uw4agr1rGryrG348Wa4UXFW0qr17ta4aka1qyFWfJF18
 ZF4kGFyUCw4UA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxUgg_TUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_071235_747385_E28EBE3F 
X-CRM114-Status: GOOD (  24.93  )
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

On Wed, 25 Aug 2021 23:47:02 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> On Sun, 08 Aug 2021 10:25:09 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> >
> > Enable BUILDTIME_TABLE_SORT to sort the exception table at build time
> > then move exception table to RO_DATA segment.
> >
> > Jisheng Zhang (2):
> >   riscv: Enable BUILDTIME_TABLE_SORT
> >   riscv: Move EXCEPTION_TABLE to RO_DATA segment
> >
> >  arch/riscv/Kconfig                  | 1 +
> >  arch/riscv/kernel/vmlinux-xip.lds.S | 1 -
> >  arch/riscv/kernel/vmlinux.lds.S     | 4 ++--
> >  scripts/sorttable.c                 | 1 +
> >  4 files changed, 4 insertions(+), 3 deletions(-)  
> 
> This seems reasonable, but it's failing for some configurations (at 
> least tinyconfig) saying there is no __ex_table.  I'm not entirely sure 

Nice catch! tinyconfig in riscv means NOMMU which indicates no __ex_table at all.
It seems we have to only enable BUILDTIME_TABLE_SORT for MMU case.

will send out V2 soon.

Thanks

> how that comes about, as we've got them for futexes and uaccess.
> 
> Maybe the right thing to do here is to fix scripts/sorttable.c so it can 
> handle files with nothing to sort?  I think it's just as simple as a 
> successful early out like this
> 
> diff --git a/scripts/sorttable.h b/scripts/sorttable.h
> index a2baa2fefb13..207ddeddb506 100644
> --- a/scripts/sorttable.h
> +++ b/scripts/sorttable.h
> @@ -294,8 +294,9 @@ static int do_sort(Elf_Ehdr *ehdr,
>                 goto out;
>         }
>  #endif
> +       /* If there is no __ex_table section there is no work do to. */
>         if (!extab_sec) {
> -               fprintf(stderr, "no __ex_table in file: %s\n", fname);
> +               rc = 0;
>                 goto out;
>         }
> 
> I'm not entirely sure though -- my logic is essentially just "there's no 
> __ex_table, so there's nothing to sort, so just don't try".
> 
> All the configurations I can actually boot have an __ex_table, so I'm 
> not sure how to test that.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
