Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A21C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:30:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA1A6113D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA1A6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zCfHtsnvWQET2wAhyYnAR1H3/ea6PwlzeAsmQ5VBjJk=; b=ap9WOGxEceQRzxri8vZ6yYSn9
	o1Ftt5sgilUJIPRncTNWu2RPCzSS/bRUAa/5b+UbedJftCSm6Iy8OTfryLg+VSREZEWbGHoEvCHn7
	rOthYZqS6SUWtuUD0x0w6zANoHmGJEWn57CtcrNLRxy2XJZ7zizwjT9bGJ1vbGktFz/7k68ZJirm7
	GQTbMTfabzWVgErdoQhfa1myed/cTfd0xZ1P0wrSJVtLrdRjx1YddMQpN5NX6qaPgq7chuJ2W+rss
	C3S8zgLTG9EQkUlbR3GIfUSrnDwzEwbOUiSFmQENwPAROm4QluBN9YVFke3DC3wkVGewHXV5T595Y
	yqYTTHZmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXBQx-0005hf-6e; Thu, 15 Apr 2021 23:30:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBQN-0005bX-N6
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 23:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jw2PSbrXAEN39rMTtQwepRsUrzSF/PJDp6qJKD1maOQ=; b=eg7FqQENENvU5ngVotSa0zPjaC
 Yr/6zOAfeg8kc+mTNNtZOLnK3M4Cdx4I+4NhPczdLWLFJjSJ1egJ75PubRFYWTND0Yigx4QH3A4li
 SfvdPMnJgNXZQrMKwa6RHqT/dDATwqZvHp5Wb6Je6+hhOGRjt5YQwmy0xsvq6nou6lDAj42AYVDTD
 wyo7qNCzkRkatZ7lUvQrL+pKhA28Mba6RtNxuO4mm43vYfMihyZItwPn5o51OdriyDdKGEjCLD3bL
 YyU9hdUE8q/nOSfKhxwtMg4Z65Ro5dPEr7KUwHmANR+4gd+dgHC3L5BWa72BXjaK07hlf6qmXh2tv
 MUrZskWg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBQK-008ybN-Uo
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 23:29:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id 20so9018733pll.7
 for <linux-riscv@lists.infradead.org>; Thu, 15 Apr 2021 16:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jw2PSbrXAEN39rMTtQwepRsUrzSF/PJDp6qJKD1maOQ=;
 b=Fni1JOOo4PrUzlzK7TjMF4v5KQ8JMEB8GQFvJdoCIs85gQ7hkEMknpG3xaXPhS80Fg
 xJbRmZBxuaLCaLsDL4AVpD5/12galNW2GkHBhD13nBI/qZ+kzKtFLFCZKRtePFqUO/Re
 Zz++4+ACyGOOamm7Y7acj4xF6H4JSsTKL7jUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jw2PSbrXAEN39rMTtQwepRsUrzSF/PJDp6qJKD1maOQ=;
 b=knUJSgZABgfkeU9xrvDpbVLEvBeyGujJ6rw15BT3XP09zWL5yEnbb8DZ+NbIZ08EXr
 v4x2+njLYdjy7uv/xEC/EV73+71FO0p2jP9DjavkDVXjM2pcJ2jFbcc32TTf0DMFbJsr
 54QBbZCQCmj+uuoMi+0kxZy7XhMWRrrA/EzAdNgnDIPzbP5f/J8gme8u5Vo36viDLQG3
 olR9TRuHczAHqH0lVJ66owUZ61E4Dg04OVMZGn6HhkORKUEvYgMHBPOpOux2wIgP806Y
 fJkERl7NxwPtASszyNTd9cbAwiYvO0PEHz6xnwjY74S/vdJouiOA90PyZdjGuKYTJTRv
 KRhQ==
X-Gm-Message-State: AOAM5312ZEXYA7FIzzDGEPUAg0GMjyAXBWu9i+ESF3ZkHfThNpUacF8N
 1ir9w4zQuGoi3bV5zmOsvIWEZA==
X-Google-Smtp-Source: ABdhPJxSv6iVBSeJJdGrfMFvazb0EusrLGidlTGj83XpU/NnbzX7T+WOwAI5+RKJlavNfX48j0XS8Q==
X-Received: by 2002:a17:90a:6c88:: with SMTP id
 y8mr6713418pjj.38.1618529364161; 
 Thu, 15 Apr 2021 16:29:24 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-3f8b-a64e-9a27-b872.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:3f8b:a64e:9a27:b872])
 by smtp.gmail.com with ESMTPSA id nv7sm3342006pjb.18.2021.04.15.16.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 16:29:23 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/5] mm: ptdump: Support hugepd table entries
In-Reply-To: <f41a177a0fd5a71db616e586a9ec5c51102c6656.1618506910.git.christophe.leroy@csgroup.eu>
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <f41a177a0fd5a71db616e586a9ec5c51102c6656.1618506910.git.christophe.leroy@csgroup.eu>
Date: Fri, 16 Apr 2021 09:29:20 +1000
Message-ID: <87zgxzyvn3.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_162925_014868_5911B0A2 
X-CRM114-Status: GOOD (  18.01  )
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

> Which hugepd, page table entries can be at any level
> and can be of any size.
>
> Add support for them.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  mm/ptdump.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 61cd16afb1c8..6efdb8c15a7d 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -112,11 +112,24 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
>  {
>  	struct ptdump_state *st = walk->private;
>  	pte_t val = ptep_get(pte);
> +	unsigned long page_size = next - addr;
> +	int level;
> +
> +	if (page_size >= PGDIR_SIZE)
> +		level = 0;
> +	else if (page_size >= P4D_SIZE)
> +		level = 1;
> +	else if (page_size >= PUD_SIZE)
> +		level = 2;
> +	else if (page_size >= PMD_SIZE)
> +		level = 3;
> +	else
> +		level = 4;
>  
>  	if (st->effective_prot)
> -		st->effective_prot(st, 4, pte_val(val));
> +		st->effective_prot(st, level, pte_val(val));
>  
> -	st->note_page(st, addr, 4, pte_val(val), PAGE_SIZE);
> +	st->note_page(st, addr, level, pte_val(val), page_size);

It seems to me that passing both level and page_size is a bit redundant,
but I guess it does reduce the impact on each arch's code?

Kind regards,
Daniel

>  
>  	return 0;
>  }
> -- 
> 2.25.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
