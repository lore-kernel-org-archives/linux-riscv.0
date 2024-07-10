Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2773C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLDv8vOwPupBGKoacI2jd4b/1hB20f6XzhLxGrghpzI=; b=tGKxi8kJ2aZ5ZH
	Z65Bigzflkocl3NsBcmrh87pdw/j13ZefadRXRdvipx4eoqefEjVTyNfdI/EiQIWLaPqn5ZzU98tn
	gxKDavfueyhE4AugDSl1oKSRrqkHrX/BE5sALei5VKQxTTayERy/SekXwkiUokYjrYKKuPso4IAqv
	ehi0t5X63H+pH/H1Ea+nZ4B1hFiFiVHXRmMdj4FrVYokro0pbsLSiI7OmrM5ufhyqLEbmY2gXjHQ+
	sgPaQvBvK4fIgtSCIYu/3GpLs2jN0FJKygGBVqdf8+Zi5WnQoJiFcTsvchKsxlG26EU6HnQplW/M7
	SBFoEAInVnCUMSCgoa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYbE-0000000As2T-1Y4g;
	Wed, 10 Jul 2024 14:47:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYao-0000000Arvh-4AuG
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 14:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720622809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0B/GOXyDiDPobMKu9T39XhvhD9Emiwu5J8K0qpzzRbA=;
	b=RnyhkE8LmXF1Tx9y4Vdu/EvsxVmggHCmeXGjKIFuucWXvdlJVk/hYibhwCvhn4gO1R7Lci
	4GGTgj3yJgibROr1Ky+qMJhWR+dP/i/SgA+KuEX3Z00zwh5JZlt7BAG4g9KoIQ1leHNjQu
	b/aBr9Y9eKICRQUpA2bPr4OKIB+y26c=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-oR9bB0KuOl2lUtfs5HZtvA-1; Wed, 10 Jul 2024 10:46:47 -0400
X-MC-Unique: oR9bB0KuOl2lUtfs5HZtvA-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-25dfe05e1e9so885422fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 07:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720622807; x=1721227607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B/GOXyDiDPobMKu9T39XhvhD9Emiwu5J8K0qpzzRbA=;
        b=E+z1uEXe6NQKyWpnPKlhyvlUFjW5DCKT0SJyvFayItcA7pFpQqa5p2WzJbtvdi+i3l
         so02K4O8QdC111/qceMSqR9KmFbFq0yVem5U0Y92yJPPUr75pZexnqkHSNlXmo0oBcLV
         PjeiU5Khn/qrXF2BXQvfkLgqDfZsvoP/pviqu4wYyHo4LC+9ALh4XTtXeCaGZy05AElI
         fvFBk6DikkS+wX+JftTtZeDSru51RlIAy58ag6OZqnb0PXziHxfqi+F8PaC/GoOa8g/1
         BA05ig8MHK6jQNRDf9z046L+ZENQLq6pIwRhxnM6wLMnFmuQzaBqwY0DMsUV8Tbx2VUy
         Xq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUd9lVIqdzM9mtCh+GsWxEkf4IvQjCsAAGVPn3ewmUaJ4pjQbNySRvl9lBJoBfLZ0o6CRp1lUSlbfxa+1HxiklwTe6kvO0xrAH7F0ep6LNM
X-Gm-Message-State: AOJu0YzcUkww4iiAAaHCQXs+BRNHrUP7LATZPaVT/ETy3xkiZksH0m2h
	gUKLxAB5lvQwBdMsJHht4Auh1BNc4enOGUR509+zurathFZ3mozRbdQ3VzyRVBJf8K2pqGFsN4w
	zAvBtEnNlAHrctCzwlsSmxqRnkWaQ610drH4fXDMK0YFah+6dswMTCGUIvAuOud0GTw==
X-Received: by 2002:a05:6358:7e14:b0:1aa:b631:bb2b with SMTP id e5c5f4694b2df-1aade07845emr713969055d.1.1720622806516;
        Wed, 10 Jul 2024 07:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0y9zwD/aGVYQuTTBcTiddjmn7jGBDMebvGdtIe8mQ9GpJ1Q6oiwz8/EvOQSuu1JQaMwDGBQ==
X-Received: by 2002:a05:6358:7e14:b0:1aa:b631:bb2b with SMTP id e5c5f4694b2df-1aade07845emr713966455d.1.1720622806155;
        Wed, 10 Jul 2024 07:46:46 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61baa257esm17481816d6.146.2024.07.10.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:46:45 -0700 (PDT)
Date: Wed, 10 Jul 2024 10:46:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
Message-ID: <Zo6e1ILgDn6nuhGC@x1n>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
 <f69941b076bf8fec89b6bec5573fdb79483c2a75.1720597744.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <f69941b076bf8fec89b6bec5573fdb79483c2a75.1720597744.git.christophe.leroy@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_074651_155680_28540C04 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 10, 2024 at 09:51:22AM +0200, Christophe Leroy wrote:
> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_leaf() in include/asm-generic/pgtable-nopmd.h
> 
> Do the same for p4d_leaf() and pgd_leaf() to avoid getting them
> erroneously defined by architectures that do not implement the
> related page level.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Added pXd_leaf macro as well in asm-generic/pgtable-nopXd.h to cohabit with the fallback
> ---

Thanks.  I'd drop the inline functions, but no strong opinions.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
