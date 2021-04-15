Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DC8C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:13:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5760C61029
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5760C61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=95Im+KMeG1hl+0tsEPK3a1YZEVCd8PXaYXL+JtNSo6A=; b=oStKzzFm1el/IA2egkXB9vzyx
	baT8oUjpj0dVbD9RgRYn2KYjhbaUidWTgxO03aNts/kWMLlZUuc1+h6V/+bwn0jfiqadSxsJX0Qf9
	Ng8gFsRLJoixnGySfnkYo/bmrBH/bwhrMDUbHQWn87VLrBUin1p6UcDGHoJ5WEr3BWTicxm868LaA
	OQvoQWr6E9Im4+0E+0ZjRnqwNxuUXuaOeql8l9w5B6U+goXcc+rMVe6yE1tLB1O9V1aq89GF3q3Nx
	pfI/UbQwr3P/nnodoC+1yw657evFk31m0b8KaldYicf4+9ppW6/ZpsBjp7MwW0E89nA0X34siBBYx
	M1CKT3c0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXBB2-00026V-Fn; Thu, 15 Apr 2021 23:13:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBA9-0001mx-4D
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 23:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=quZmVxdkfveDUtpLM1NU/LuQrdZNONtDpXYzxh0MMQU=; b=NHPxUUlAdEEpNr8ijJLNjEkMWN
 vTq6K+2uPzQTRM7Tvo227e9u0e/Y7aqpvsZvJyj0bPANRWAtXM/AYjkK95vPvM4xfXj90zuNaRdWU
 lTtRHd8SzUzTYuQ/t2ptm46oD37ds6OujqsbEg9Hrs3aQ2O+tRNBhkbFNZCFHBA79AgLzDCtbI8B7
 hNDTHCKy1fHmEfKtI/o32O/X/z0BKa6cr+tbQMnjX1WfqImLAaej3+K+zM2nlTjrFJRFWygReoSrs
 e2P1UPA5kf/OPsP4P92YcEIPH/khuNOY3q/6140h7sB5AEvexWBoViEoW2DgUkoPwlPYVsgIeP+ct
 1hpLHamA==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBA6-008xml-Ie
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 23:12:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so5459866pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 15 Apr 2021 16:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=quZmVxdkfveDUtpLM1NU/LuQrdZNONtDpXYzxh0MMQU=;
 b=dlBNCIJGr0qL38amaMZRkug9NjLuSZKepOmlGO/a/0dku+GQVYqb2GS0jPTD9w2gLe
 mxyKCuERedST3RGnVbk4l07BD+E5BOSCp/2NFPvySo56I89CsE7aDSCbVRn53Jv8Ql5N
 hSp7xLsHsW85pUai/ansn/rQu7ZvTTszyfp0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=quZmVxdkfveDUtpLM1NU/LuQrdZNONtDpXYzxh0MMQU=;
 b=Iz3mTQSD+RSy419V/DoRmyQpW1iu9K90Hu68L3CIgSjg63RLMw7HIg7TJRRkzF+BJA
 RihnBV3KDpjpSrB3JBFDnm+rFpgm7WRc18GrwO4FI664mkafBRjyBx3iusASMRBjcQ1Y
 GU8SUq8A73IwURFyG+xvFhDzXa5auaRD5liQfzIEHi2GshPcyzshHYehs/dGn+3aINbj
 Tl28opw87lu2wVFBDrSF1vU+kSheGnlA7LqrWsvUYDB1YgSB1PFV7u/j4Z69hrzqQsWj
 GdDzCPE80WGFlWil0uGQ3mNd8zqoHMp/Al7b90yM9sfVL8+feGsHX9xpBZJVN1xH3mgs
 U8FA==
X-Gm-Message-State: AOAM531sD59sNVIC/nviXLx69G/3elEbqD+DC13q4yicRuNo3H9yIHAZ
 0uxmhY9C0KfpOMhQySeLtzZspw==
X-Google-Smtp-Source: ABdhPJxtoW/lfV/Z4uQg/42K/o4Py3SAIqP7jABAruwS7PxREUqkSHGAEbZJMX/djPbOm2w9XfP5tw==
X-Received: by 2002:a17:902:59d4:b029:ea:bbc5:c775 with SMTP id
 d20-20020a17090259d4b02900eabbc5c775mr6469026plj.11.1618528357637; 
 Thu, 15 Apr 2021 16:12:37 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-3f8b-a64e-9a27-b872.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:3f8b:a64e:9a27:b872])
 by smtp.gmail.com with ESMTPSA id x11sm3055779pfr.7.2021.04.15.16.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 16:12:37 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
In-Reply-To: <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
Date: Fri, 16 Apr 2021 09:12:34 +1000
Message-ID: <8735vr16sd.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_161238_636046_2DEA2A9F 
X-CRM114-Status: GOOD (  12.95  )
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

Hi Christophe,

>  static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
> -		      u64 val)
> +		      u64 val, unsigned long page_size)

Compilers can warn about unused parameters at -Wextra level.  However,
reading scripts/Makefile.extrawarn it looks like the warning is
explicitly _disabled_ in the kernel at W=1 and not reenabled at W=2 or
W=3. So I guess this is fine...

> @@ -126,7 +126,7 @@ static int ptdump_hole(unsigned long addr, unsigned long next,
>  {
>  	struct ptdump_state *st = walk->private;
>  
> -	st->note_page(st, addr, depth, 0);
> +	st->note_page(st, addr, depth, 0, 0);

I know it doesn't matter at this point, but I'm not really thrilled by
the idea of passing 0 as the size here. Doesn't the hole have a known
page size?

>  
>  	return 0;
>  }
> @@ -153,5 +153,5 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>  	mmap_read_unlock(mm);
>  
>  	/* Flush out the last page */
> -	st->note_page(st, 0, -1, 0);
> +	st->note_page(st, 0, -1, 0, 0);

I'm more OK with the idea of passing 0 as the size when the depth is -1
(don't know): if we don't know the depth we conceptually can't know the
page size.

Regards,
Daniel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
