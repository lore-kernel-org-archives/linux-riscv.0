Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FE9CD1296
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//A0ELfShQ9ivR0EdZ+Et9zjAEeN8oYb/8JUlJYLMRI=; b=T5UfO5oUuSMcCE
	LHOJZsFpBvfiLDyaM8fXgILHfBQcxaAAmY+8SzW4iGKuLjYaOhVJ/UNKWkTqQqT7idOhqM3ENwS/9
	21xv3xEduk35F8xMYAGNAuvRcKaRveNhWQ6a1gbYwjuzSWHkM1yhyv17ISt30sLKSsHaCollveV+/
	9XSiBviBz8TtsOZ8RAsyKAeOYrIhvDpz0zwx6n+G7bOiK9mVb02ZBbZ5ng5o3koqhqnGZSfZLGaDF
	4b3aUdmJlXMCq/3XLhNgBjf/vXLrVOGc05+IvMq0A/Afxr61Js/KCEfwGWKCGqkRhmgOXvO4Qm3Rf
	bCHDLZIm7mILxDIMuzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLm6-00000002UiD-1us9;
	Thu, 04 Apr 2024 12:00:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLm2-00000002Uen-2SSb
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 12:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712232053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfuooD1IfgatoIS7OAIU70Y79yHtd6slmR6Wd2lGo90=;
	b=ZJQO1LKQ4/YdGI4ahHtm0KHDzGiPpcFyi0D+eNTsS8jSj7xNYjiSNbeXK+IrEphm3v9lbN
	fwLRrKlox7Xa/HcduDl+D0NX1FxoGzfU4qYy2Hf5sd12bU+m543M7zAnw9W9k8zMs18K0d
	xgXaxFZjgJc/Gj5uUT2nryrwDpbzG/k=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-KGjhnxCEMtW9rlEmuRp-8g-1; Thu, 04 Apr 2024 08:00:51 -0400
X-MC-Unique: KGjhnxCEMtW9rlEmuRp-8g-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6992d40ea4aso1903716d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 05:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232051; x=1712836851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfuooD1IfgatoIS7OAIU70Y79yHtd6slmR6Wd2lGo90=;
        b=HNQ3B8yxZ4XyX5o+vXpnJGKYyanTN9ccY8pjC3cZpDOf0kq355gTIMnlCRT2C8Drzw
         YtHmPVOy9Tjq96DUMqlp4fDJhtfJ3eWNvmtBqXsaol+pggjs+WDdlkO7cqRG08hUocE3
         sqRtrFhoHEijrlqClzNfIMh/VTHgyEnN208aXGhtyiHyIIdOkTPTON+PYiWQ9+LGk50s
         Ax9kIb2lUi30TcqeuEpqhsLVbHyrXwNeZfzOAN/HhJewY+4FeMRqoSNVMu1cQBjEB5zF
         AhBkzQIVDHzo2GSjRKoVkoLOo5/yslNe50TQM6g0nuG8HsMhvrfrr4CMfqsPn6XWnQD0
         3g2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFBebCYDBpZdk0jSNOeOBRdZ8/zcnUZpSaGuqkLayivkuATggdin1OL5F1iC+R1lOJWMFzF8svz8ETVfLlAcx7AsD5dbJM/ar/tPGfvQoF
X-Gm-Message-State: AOJu0YxnicHsApW8cFt9yO9d2LrhPd/WqlEC9VuI3ukz3WXqDB7pbLDu
	6sFaLMSu7D6og8fcORbhC6pHo2JEoa9xvR49XC6Uucn49oOxs4JLaFSpBzDhPZhDJccNVsop8+F
	nSdKTM6tFOyaLJsNwCbclvJyOlkNmDrMrxKua8I0DWOHB8RpxvtUkB1xt7wshtVr/mw==
X-Received: by 2002:a05:6214:5007:b0:699:4d3:98dc with SMTP id jo7-20020a056214500700b0069904d398dcmr2122674qvb.0.1712232050895;
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMCWtQWiLpesBQTQo5kp7GWlhuKWfgLgdLeENDjrnl6Gj4+sgwXTUEXT7yElLHvch56DwpwQ==
X-Received: by 2002:a05:6214:5007:b0:699:4d3:98dc with SMTP id jo7-20020a056214500700b0069904d398dcmr2122629qvb.0.1712232050343;
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jf14-20020a0562142a4e00b006987021a724sm7171209qvb.118.2024.04.04.05.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
Date: Thu, 4 Apr 2024 08:00:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <Zg6WbzWkoLtbY2LZ@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <Zg2fEP4eEeLhgDwE@x1n>
 <20240404112404.GG1723999@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240404112404.GG1723999@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_050054_740643_047B220E 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Apr 04, 2024 at 08:24:04AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 03, 2024 at 02:25:20PM -0400, Peter Xu wrote:
> 
> > > I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> > > not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> > > at least
> > 
> > Yes, that sounds better too to me, however it means we may also risk other
> > archs that can fail another defconfig build.. and I worry I bring trouble
> > to multiple such cases.  Fundamentally it's indeed my patch that broke
> > those builds, so I still sent the change and leave that for arch developers
> > to decide the best for the archs.
> 
> But your change causes silent data corruption if the code path is
> run.. I think we are overall better to wade through the compile time
> bugs from linux-next. Honestly if there were alot then I'd think there
> would be more complaints already.
> 
> Maybe it should just be a seperate step from this series.

Right, that'll be imho better to be done separate, as I think we'd better
consolidate the code.

One thing I don't worry is the warning would cause anything real to fail; I
don't yet expect any arch that will not define pud_pfn when it needs
it.. so it can mean all of the build errors may not cause real benefits as
of now.  But I agree with you we'd better have it.  I'll take a todo and
I'll try to add it back after all these fallouts.  With my cross build
chains now it shouldn't be hard, just take some time to revisit each arch.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
