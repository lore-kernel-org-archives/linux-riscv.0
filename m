Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD555D68BD5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 03:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sYF9enNgK1BKPOJ3AO2bayZg6zyTFspJRzceFcRd+o=; b=vDTvKlBxiky/NF
	6Vyj2Uv5BWY0bnZlJbi0432S8EEEZkqWcXJkv6I2/7SN4aUEck08FRV16m/x7PwHiNppIR4SIHwRx
	ogVHj7TDJcuihAxP9GgQhAYdX7NIXg9MOSDC9k5dOj+aNTFXx0YxSnpAftzVhnOgM2YDh03A2Nudt
	AarwY1+htJlIwtxpiaJMih1NN0rJtiCxmhVypi2xTTdbZWuEW/dE5sJy0mJwM0NEJpgbi8F44+w6u
	Fs2opC9ApZZt0ZvspM8oAEWGGIgcnZt9RtEPLqf6m8urjFdayB5r48sdIyTiJzlLmi7iWky76iTK5
	DdAbvPcTfg6UtBzBD+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWRd-0000000D1Yr-0877;
	Mon, 22 Dec 2025 03:18:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWRZ-0000000D1YS-3r7r
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 03:18:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a137692691so40965935ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Dec 2025 19:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766373525; x=1766978325; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSEX9YgmDGq6W//WwbZ+YmPko80Tijktgs830EHMcng=;
        b=YtZsxpkgxLPSZG9J5sGQGysif9Zz/v5ndeYyEcUYeTKFeuC0AQYhGgBHEuIXRpNXmU
         HXc9Z2DRJ/gPjjh30nR/EAzj2kDUO8L6b5gpArhLVHt70NEXGNGr6wVNnGGUVwM6+GmT
         VdmJvWjvEo6LOwnhhqZ7/GmmjlmHBC+FL8PYPx9vve3skPLX7vXmeq+aogakzeOaDXsy
         gmhGZxr9a7Nb9PLqFnad3nmvBprN9X2WabGToiLu5buNN1PVWP3wM/boRyqnz849V9+u
         2o80azQPpaylK3l/oW31XHQeP4FB6zDXP2o3ARrD/b7HITrItst4R+qtJbxjqTYlxyIJ
         d4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766373525; x=1766978325;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSEX9YgmDGq6W//WwbZ+YmPko80Tijktgs830EHMcng=;
        b=nH5DxlO/SxsRMivOZsbyiw/nBBLJWEgB1mZCgPcNTv8s0r7nEJV+1bjQMC8yCKEM/l
         Jh9k8nOS1yKgSL6AM9OlVmxma1xspm1x8YRjxjyTWU8v5UMNbEle45RqBuxA2fK6mnzR
         q30B7roJtkLaEr96510CQqv/wUbSNQlQLV7XibQzTg9DsUwXHNC+GuORZLF0bfydM1GP
         rA+1QclTm6WmE2aUAz0AT27gNynD7iG+LjTO/QuY3Yf/7r6s5MG9f4Lk8V44H2as6OFv
         l3aOfBJ9WnQvCdeCSg5nEgXHDRyW6eIxTtL4RhF9CmamQXT8V5mTA/HxQmqvq3Ot6ej4
         Z5rA==
X-Forwarded-Encrypted: i=1; AJvYcCU6FKZRGqCFESQEe4LuKVlYndbtez2T/91Rcpdt14A2yUSgXtmW48fGmH0fZ2liEjsD92QdML35KY65dA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9LiuD48F+rkcgd08zweZBbVqQIBxcHvd+/1cRBcZREJkBJqnE
	DyYxJPwR75itG8j1GjmgBS3O0PWuGIITNA9Xy923l6gqueC/MyjS8cPp
X-Gm-Gg: AY/fxX7fkrv0RsTSLg+CUDpDNsXC84TdqP11R3rGww1RJI8bhv97S3d96INt4L2y1I3
	QpsHiWrCWL94uRxDdrKoUMW3WeuFd0kyJs6ag0LJtmt2ySPz8tV7Rk2pi7pgfjjLyTxvl7E0rZw
	KrIBtU8uFSK8qcynX5nGKqYXlCm7m3lOYBJrdR8f1KJC/W6Sj2L32GLs2cW3caDYPaBQzHLXPSv
	B3zLF2jmzbS+qdp2U3bjDizIiTCGl/8RQKD6WGWbRh5iLEm8H0iCFd0eHEpgP2LKrBYcwMdfo7I
	+pz+p+rUwppMMKy4g4snJhPyc44RkBJAbuoIaDUrhWwaqGBaSM0ChfMcILGzk059Y2918dsJahc
	NlPe71HP0X9jG+rTDRlE/ptv/ssbTRv0IDed89iQaueaM+pF9ISv/3D73PjMu+jNWjupvb7MwY/
	M9kAs=
X-Google-Smtp-Source: AGHT+IE25cnCTvyNKTbDCfkrMSOXNApuJseJLU6aD26Xlbt6oCT43145DxEBaionq8+6wAvphhVpBg==
X-Received: by 2002:a17:902:d488:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a2f2202ccamr90870945ad.4.1766373524799;
        Sun, 21 Dec 2025 19:18:44 -0800 (PST)
Received: from dw-tp ([171.76.84.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm79699845ad.80.2025.12.21.19.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:18:44 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
In-Reply-To: <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
Date: Mon, 22 Dec 2025 08:42:25 +0530
Message-ID: <87fr93ky5i.ritesh.list@gmail.com>
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com> <87a4zcml36.ritesh.list@gmail.com> <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_191845_968758_7F78DF69 
X-CRM114-Status: GOOD (  16.64  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

"David Hildenbrand (Red Hat)" <david@kernel.org> writes:

>> Coming back to the fixes tag. I did mention a bit of a history [2] of
>> whatever I could find while reviewing this patch. I am not sure whether
>> you have looked into the links shared in that email or not. Here [2]:
>> 
>> [2]: https://lore.kernel.org/linuxppc-dev/875xa3ksz9.ritesh.list@gmail.com/
>> 
>> Where I am coming from is.. The current patch is acutally a partial
>> revert of the patch mentioned in the fixes tag. That means if this patch
>> gets applied to the older stable kernels, it would end up bringing the
>> same problem back, which the "Fixes" tagged patch is fixing in the 1st
>> place, isnt' it? See this discussion [3]...
>> 
>> [3]: https://lore.kernel.org/all/b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com/T/#m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae
>> 
>> ... So, IMO - the right fixes tag, if we have to add, it should be the
>> patch which moved the hpage_shift initialization to happen early i.e. in
>> mmu_early_init_devtree. That would be this patch [4]:
>> 
>> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464
>> 
>> Now, it's not really that the patch [4] had any issue as such. But it
>> seems like, that the current fix can only be applied after patch [4] is
>> taken.
>> 
>> Do we agree?
> I think we should document all that in the cover letter, an describe 
> that this partial revert is only possible after [4],

Yes, I agree. Let's add the above details in the commit msg.

> and that that must 
> be considered when attempting any kind of stable backports.

Sure. I would prefer if we change the Fixes tag to the one which I
pointed in above [4] (with explaination in the commit msg). However I am
still ok if we would like to retain the existing fixes tag and show [4]
as a dependency.


-ritesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
