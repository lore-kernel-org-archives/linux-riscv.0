Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14377C5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlolsZx1K9bwiYdCTdOaX56SpsLpBIBiX/KfTNCqmtI=; b=oJi6R0QopRGLWX
	A0CaS+BUR/5mIQbZReXhdbOzksPcgTZqtKHizvdpFOvC7FcdejYPEdSgj3kimDUYinbCk0GFM02hf
	kRLAnC5Bs4OF7+4G3bqOzAdmvp1k0LnyOFTVqQMEBnLH1R8RAei8cjz1BfSUByY16T8ab18MWgz4Q
	hSI4fT2SWZTanvEv439BP324n8RM1On4keWlrIhu2SMQl1SK3LyBmCTYg/e3nOZlCFx5yMd4BfQwp
	v+mprl3epiKNEUaJjFR6teostcTbFcJ1SqAaNeO81yHNABC73VQzD1i3Z7J96+yjCSVzmPjTrXXUJ
	ejFRpQU+BeiXDy/SpJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siaop-00000007fwA-2xDE;
	Mon, 26 Aug 2024 14:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siao2-00000007fok-1Fts
	for linux-riscv@bombadil.infradead.org;
	Mon, 26 Aug 2024 14:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=; b=eOOBARJFx0N77i0Les6OCd2UZQ
	TucXeYFFe2y4qycc41toA+6WbW5e+PF9IL3uEPNHELtkpAXdQHeT0H+w1+UlSwaOdMHGRxMhGsYFp
	Bb37h/zemL0wUtDQPaDjMxJGfjsCCtavnOh8ZxvvWWuiCZubbQTKblR1eHk/ljadk58MEzLzsn4Ra
	lMv9R+kVuy6YEOTv8HYXXIwJ0M2M2x/R5LRCCPrOBUeuYcp5BXAe0382+liUEI3fDqG8YO1fNFW+d
	EK9LFdp3v2hefwXairbEb9b2AtIjspO5W6SSHjE81EeAM5wTE/OSfq47+amUgFkC7FDe2bbw75J/H
	TSDa+4mw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sianz-0000000AfUU-0u7e
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 14:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724682885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=;
	b=ASjHTVpIeCTSeGgid4jlaNZjwZpjL+AIUsYYQe5rFo8Ccg1aVGo926oYYaCdf0NLoixEKc
	7nJW68+t/lfkrJ5qwRyVujGWSaIuHl4rVe2qa18knxDIAmm3VlpJ6JdyDhxFpxtI6sOPAw
	Tk7UNpy+kRTmOh1n7vfE+og5BBon4fE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724682886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=;
	b=ggB39D5xR4X/ji5g2y9it2UOgX1nfp4GhJoDhVym0Rlz5J0/+LW2w3R/MK3/s1jWbbEnOf
	6Z/uot7+ApgbzuX//rvxUh5i2IpfoC8XyAW8+/qAWASKfk9JCS289LzIQ7Fn3hspkqIgUY
	1jZYxoSFEGrSiqKH8cZOYF++UKUQxkM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-7rgcnSQMNKqG1A76DNBAPg-1; Mon, 26 Aug 2024 10:34:44 -0400
X-MC-Unique: 7rgcnSQMNKqG1A76DNBAPg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6c181e15e90so17578376d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 07:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724682884; x=1725287684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=;
        b=D9DmBClq1uyL1z0CWjjrnv8TB8VKJTXMZ52DrdUAC09897Fik/lkl9W3Zg4H/pPCt8
         +utGxhkjMPgCbahdvcLL5aBeNO46TTf/uQj5BAOhNfBdoyuu7W8DdKrFbZcWoRlKNHgo
         QmJ1bvtmcR5sOpBbqEDhTeHyoJiEiPGV1gRIaf1Prxx+7gBeCaGyZzyDJemRjulF/ETL
         9WjVqWcIzMVM8SYR5BfhXvxjj+KMbGKR2qkPUXymjcBkOXjLzbeAJLflhA2dr9bBSM8p
         sjhvILlXyFLxKUi9MwfQORwzsuUQki/8xiGlYtRMKAnudpR3aEpuLnIoGKXWbJbzTfHg
         WNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw6q2/T6Tm4JwYOd0lH5IPGEp6BXHFiFH5zZoPw7Vg9fzat6Y3bu8V1iWpLbGP/6m1MbNiNT15IbHu4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdRCGuxyore9u1ju3PZWDR31b+FPMI2b0Qq01Gn97mel7U5H8y
	9atthg+6z0z+iIVepPgZDqRmgbrNzGUnocy2wXbFRiCW34p5mtCWHm+uHRGdxegwllt5Fn5K+uX
	oSRXGc21likZas3vmC5M6Xz5dfbJ/vIu2T1RaXI7iAaW9aXDBNNeHpL9ditI8OYqc9A==
X-Received: by 2002:a05:6214:4304:b0:6bb:a16d:279f with SMTP id 6a1803df08f44-6c16dcb7b2amr123089086d6.38.1724682883711;
        Mon, 26 Aug 2024 07:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJyXhGmqDSVXXp1D+XITrKt9Uq9T5JuT4lUbtmj8ua5Df7FPqa8sCBxKyCSdGvctdo+BxBQQ==
X-Received: by 2002:a05:6214:4304:b0:6bb:a16d:279f with SMTP id 6a1803df08f44-6c16dcb7b2amr123088766d6.38.1724682883376;
        Mon, 26 Aug 2024 07:34:43 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c184ce9034sm10939096d6.73.2024.08.26.07.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 07:34:42 -0700 (PDT)
Date: Mon, 26 Aug 2024 10:34:39 -0400
From: Peter Xu <peterx@redhat.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, "x86@kernel.org" <x86@kernel.org>,
	Alistair Popple <apopple@nvidia.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Message-ID: <ZsySf2F9djR5YVOr@x1n>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <20240717220219.3743374-3-peterx@redhat.com>
 <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
 <ZseOp7M9AmZtW4jw@x1n>
 <d3e4256f-253a-4a61-a83b-93f50ebabed8@cs-soprasteria.com>
MIME-Version: 1.0
In-Reply-To: <d3e4256f-253a-4a61-a83b-93f50ebabed8@cs-soprasteria.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_153451_429399_C0B050B5 
X-CRM114-Status: GOOD (  11.02  )
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

On Fri, Aug 23, 2024 at 06:19:52AM +0000, LEROY Christophe wrote:
> Why is an option needed for that ? If pmd_leaf() returns always false, 
> it means the arch doesn't support pmd mappings and if properly used all 
> related code should fold away without a config option, shouldn't it ?

It's not always easy to leverage an "if" clause there, IIUC.  Take the case
of when a driver wants to inject a pmd pfnmap, we may want something like:

  if (pmd_leaf_supported())
      inject_pmd_leaf(&pmd);

We don't have a pmd entry to reference at the point of pmd_leaf_supported()
when making the decision.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
