Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35538C83F03
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 05:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5WAPUONAcJy5g3IPvi8WWeKojLbiylWLLlo8ubGLvI=; b=2zxBZheC+106tL
	vVMVYPZ4xqhmLRld1vNeoobF+HQ6fERCYQwuJdFCw3bLvJMjJxEVT49TD8e8+6sJ5TaoRgIxu8A0F
	f9+TGrVFG9F/1SGPEHaOTWZ6JeeLcZjQr3Z+0qX/HwwCZvaf9JKykf0wYN/PI7WIWuEaDaynHKWqr
	DPZbAgYQB7EmUS+GiCSsB6VABDlrHLV8dMepvyo+HimTYPjs0HcLXjPVS6TC3Amb9J9ye0aFG0eW7
	2yW88MDnQj/auOZBAQ4McJdcmk1f9ZHUpSmPXvmgvYsyypK9zFZrWevHmBcwcbXXH6XuR+vpMubRU
	gCPp2p/rJJWB5WQZr7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNMD-00000007aYL-22dR;
	Wed, 09 Jul 2025 05:28:37 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNMA-00000007aWt-3HRC
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 05:28:36 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4a77ffcb795so48061461cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Jul 2025 22:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752038913; x=1752643713; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmTUuBucPnJJtTwohcG1cSiuqeCooajCyx13/5KvFME=;
        b=ilZFkR+4dvl+S1lwtmvbnnR80qUJJkUuqdzdGLmPQS25jmt1TvXDnCJeSPAM7AHHpf
         2okp+CMybEW4bcVxC8CQiajj4Fcy17SZfEAyGSYf9UugKVqEYv1YdGWPBxY6Ft0+6jXS
         haaAgzavKtSJp/NOuqskGQLABJLOh2q0iYy5IPjgSwSGKXaJdifXr1frhyeKlpgzgM8D
         AZpV+UEisc/xNY52EBudUuR6P4BfkG7zWMceQnCeU+JuSp/tZOev2/Xw9T+XVX9X3ZI1
         ZJrVUST1mYRgRRuuzGqu8mEmHRuqbymUMKA2qVk8TGg5V//HFsSQH8fOmyScRhqREaES
         DfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752038913; x=1752643713;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmTUuBucPnJJtTwohcG1cSiuqeCooajCyx13/5KvFME=;
        b=ZnLEE/1m127obAtU+YKVwCjm8T/N+hGTrT/nWDQpcptCpBUf9ponsznqyvoEDkZiBl
         Zjx3kUSQR9EHBGMy9IgS1gjg6iSoUuSl5eo0agi0L5RBk+0zO6zo1QY1o5rAjH9k5xFX
         htNWISrJN898qlP4CvkqA5gu3YM9J3QFnFpm4vhk7td2+Qed4Bk5S62BfjnCbi4F2tuL
         Vc9htxhSW8ZEuj2ukpxUCjxQrr2wj1UvzHqaTYVdaNykvWxC8PLeIvHuSHWLVE5hiMR8
         OTJrf7KoxhwPxFFZChxKSwD0PhLK2KgR42++CiEdAqoMB8R7H1hmSwvlPI1A3/zTI9cd
         OctQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqODMDo882jWc3NOBndhrQE3KCXSdUJRjh4oM/4KdJltbqk3EXNcAvbI0H0s+ehtPkBhB4/jPVUFYvSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YysY0modt4Jm5ctb0seQdJ3SwqD1AqIt2jD63W7UJrWYSRh9TlX
	LxiqzAYw+AvBw1jEwdXZr715fHme+kqe0Qy0+Mlk2cT5A429K4bOS8H2
X-Gm-Gg: ASbGnctvGxRa5BBDhzZ3UMIAWmyraLUb5MB0xSPu3hLsDjBJ2KeOe/xIILdMj4fIRB6
	eZNbSGQOf5cLxOdXbeliSa/zG3QIFqbzbOWyHM1wEhVtR97atg76aRsjvoiB6VpIjZhvFPKLiu8
	TZRXcYxlw4MpcY0roySdPh8Z2KxYowcimDvA2744+5Oakl3jnoaFMOtQwE0VD4jWS69OBu/cPsc
	bwdsXlgygnPsCQ23Bj4HGLlAeiLyNoZpqh6AV/hSxiWzAYFO51Ta3rt8Nl6ECGSCFK9R3nTpzLs
	G/2SLa8KDay5sJ+lzWjPr2sjzQdf+En7Qiu3RAbkgcpsIDp70iPJnf0iU6OXy37h+dUMZDhHktf
	hCjA=
X-Google-Smtp-Source: AGHT+IGb4zyDMgc3aL8iisihI2BiI+6TLsoLVISX2Ir5g30xcL9nrjPG9mF0sxeGZCC9YuroHjICyQ==
X-Received: by 2002:a05:6214:3107:b0:700:bce1:495a with SMTP id 6a1803df08f44-7048b8bd8cemr18045456d6.1.1752038912844;
        Tue, 08 Jul 2025 22:28:32 -0700 (PDT)
Received: from smtpclient.apple ([38.45.64.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d50e14sm86453156d6.74.2025.07.08.22.28.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jul 2025 22:28:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] riscv: mmap(): use unsigned offset type in riscv_sys_mmap
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
Date: Wed, 9 Jul 2025 13:28:18 +0800
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 alex@ghiti.fr,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <EDA763D9-2FA6-4F0F-9855-01D59E340A52@gmail.com>
References: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
To: liu.xuemei1@zte.com.cn
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_222834_832288_B481376E 
X-CRM114-Status: GOOD (  19.46  )
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



> On Jul 7, 2025, at 19:34, liu.xuemei1@zte.com.cn wrote:
> 
> From: Jessica Liu <liu.xuemei1@zte.com.cn>
> 
> The variable type of offset should be consistent with the relevant
> interfaces of mmap which described in commit 295f10061af0 ("syscalls:
> mmap(): use unsigned offset type consistently). Otherwise, a user input
> with the top bit set would result in a negative page offset rather than a
> large one.
> 
> Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/kernel/sys_riscv.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index d77afe05578f..795b2e815ac9 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,7 +10,7 @@
> 
> static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> 			   unsigned long prot, unsigned long flags,
> -			   unsigned long fd, off_t offset,
> +			   unsigned long fd, unsigned long offset,
> 			   unsigned long page_shift_offset)
> {
> 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
> -- 
> 2.25.1
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
