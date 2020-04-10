Return-Path: <SRS0=2LB7=52=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B89C2BB55
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2020 19:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4404120769
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2020 19:16:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lGA8ru+7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dD5eh5Q3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZImRXK2e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4404120769
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv7iW9UAPEbptJQ7pxTuJ8mpCyBB8TXm9+xjBE0kLBw=; b=lGA8ru+77nrnV/
	TaUbfc0QMF4meR9MImq8fiiYeOfIHgXev3kzx7+Xpk5cJI57EZgut24Edpzaz7MCLsjLHlNV1g2mQ
	Dwdy5GQ3CK0d8ncPXl9BBJmxo8minwGaffqi6kOKaKGwG5Nr0ugPL093mvIJuGSpMxna+7Hb7ogv6
	yOmKT5wbk1INp++OgAqdeJfURZDbcQKeqG9TsD4mWL+HUZfLta3Zvn7CX71w96A4qYyF4K7pkFXMJ
	1UMm30Q/gVP+qAsDLOarQCs5565amy03REj+FjoxVAg4Lkf2iz47h9ndXSykW13oVgCLNLrP8O3dQ
	xIJiESisWc7hhv5bb2CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMz8v-0001Xp-SE; Fri, 10 Apr 2020 19:16:45 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMz8v-0001Xi-3V
 for linux-riscv@bombadil.infradead.org; Fri, 10 Apr 2020 19:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Cv7iW9UAPEbptJQ7pxTuJ8mpCyBB8TXm9+xjBE0kLBw=; b=dD5eh5Q3b9cEzELjpbBglt00Qa
 8d/mhr3eOyAGQaY+dEhcx+ZLdoBw4FpLOnX/ZFacuJp72rmx2N6T67ewrAiviMuUCnzx+709PhUsu
 MDL0SEHTTwpyF9cGFetggcFHE+tUsqMC8c5LAU7Vz4eYYPwrVOup8TwRWIu3eND4gly/+RHuZdMmz
 XQZuZUQx8iKXJ9iyWFF6oOq55QkscRbvKn4i46gNttdWngFUivPA70zM0MLKZ9NWoX6HGzo2o9cnv
 z4yYEdK8YQyxdDFUX4uzYbpBZdtQkveXtZNw2+ILHZXYBFP4Ei/oTbYdwhqEshAA9Uy/ftlRftyS8
 nmZd8D0Q==;
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMz8s-00034M-Ug
 for linux-riscv@lists.infradead.org; Fri, 10 Apr 2020 19:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586546182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cv7iW9UAPEbptJQ7pxTuJ8mpCyBB8TXm9+xjBE0kLBw=;
 b=ZImRXK2eISPkdK2mdP51X077s6DBUxlxRwug1ebb/muNQTrH0h3JQLq/YlM/p4QssytnS7
 rslKjNDaKfH3ZAd9z1TqTmq+iBIOdhTNnZokxcxjIEa/DI5eoGR20tEMbkx/JceWBHQrqg
 18+SZ8Fo+7lAYVQoeW9+v+ShE5+WwdU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-DwkXV7h7Nyy17Z8QhFxrdg-1; Fri, 10 Apr 2020 15:16:20 -0400
X-MC-Unique: DwkXV7h7Nyy17Z8QhFxrdg-1
Received: by mail-qt1-f199.google.com with SMTP id x56so2643335qtc.10
 for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2020 12:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mwSL4Svde7cDyREN44P4y94Qc6dx9Sv2bNY13UCrEho=;
 b=AVdMjvikMLcIGRY5MYXdOFbTP0x2h/pzeXxGEbc/oq+EO1ZYe+uFm3y/MunV6fyHT2
 qOG96s7hFb3cXRcTxXyeWlA9+acuuHSn2/1dZwXnDKc4XQ9U7srV5S3XnyGJjPf9yB55
 dv4HWvE/2brcJSTKzPotjn7RJjjVwAL4RBuOcSdxOh3kIg3NaQqk73Sq0wi4/ICiw2Q0
 adT3uUS86Y4cjk7xcdLHZhm+juEvQSvZ3AN0sJgzQvDxcpvvXQdF/2ogZxpgPIxEGQwA
 6IdBew0o8S1EtM7kEhqh1xhEn2uSsJPmPue9VJG8PabBrUr709rc+AKWIyeNItyTFxwO
 ancQ==
X-Gm-Message-State: AGi0Pubz1O+CCy2/jwgu5h6jPYGAi88kDreakDjuhopz2H0uq8ln48Ci
 RWtZSIEPRUvrfFuCVbweqFbEns7J64K5ZWUmxaQqBCTpf+RGejFcxtVL6Mb4zGN/ebJYxj2J9sZ
 sQSZwAnU1CKm8gHb97NMwZgffIs6a
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr5792462qka.329.1586546180416; 
 Fri, 10 Apr 2020 12:16:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypLiuHO8rQfrWs/w6IUs43Srn34pCDFpZie/ieWUpJNT3bX04my6S/Xtwb+5j5ZmCFgzwIqbpg==
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr5792202qka.329.1586546177111; 
 Fri, 10 Apr 2020 12:16:17 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id b13sm1590230qtp.46.2020.04.10.12.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 12:16:16 -0700 (PDT)
Date: Fri, 10 Apr 2020 15:16:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v2 1/4] hugetlbfs: add arch_hugetlb_valid_size
Message-ID: <20200410191613.GD3172@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20200401183819.20647-2-mike.kravetz@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 01, 2020 at 11:38:16AM -0700, Mike Kravetz wrote:
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hu=
getlb.h
> index 2eb6c234d594..81606223494f 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -59,6 +59,8 @@ extern void huge_pte_clear(struct mm_struct *mm, unsign=
ed long addr,
>  extern void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long add=
r,
>  =09=09=09=09 pte_t *ptep, pte_t pte, unsigned long sz);
>  #define set_huge_swap_pte_at set_huge_swap_pte_at
> +bool __init arch_hugetlb_valid_size(unsigned long size);
> +#define arch_hugetlb_valid_size arch_hugetlb_valid_size

Sorry for chimming in late.

Since we're working on removing arch-dependent codes after all.. I'm
thinking whether we can define arch_hugetlb_valid_size() once in the
common header (e.g. linux/hugetlb.h), then in mm/hugetlb.c:

bool __init __attribute((weak)) arch_hugetlb_valid_size(unsigned long size)
{
=09return size =3D=3D HPAGE_SIZE;
}

We can simply redefine arch_hugetlb_valid_size() in arch specific C
files where we want to override the default.  Would that be slightly
cleaner?

Thanks,

--=20
Peter Xu


