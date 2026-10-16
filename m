Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C77CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 00:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWMtUBeVkMezC3kUe3A5niDdE6Lterl569j3Jymcgvw=; b=tFF3KAMmTWNgFe
	8B7gbYJKSud34Qqz0T4XijGBEe3F+YWiPVaMv+vZDrFvE/xCJ7BiO4x01TxPfkurA3iFBSD6utG/G
	6CtSKtKk8JORBNZycRnMN+ZuZfn4CIjUssDXMV9EpidONv1eE/FF2P2tb8b9LsaHMiZTPJicXCMW6
	OdRJ3DgSa/aYHwsFgIct7UE6zZGZ9dqXMTEOnNzVSHPX/OX7tgioLHlVEm97yO+a4NOkmLDNBNdKo
	lftblhbh206Rh2mHQ2HFQWm/fLRS0RR+xFOMspU9pfOb1IE/LDwv9bazV29THibsw776JwA770oEj
	3j73EZ9l7MIvx602Nisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVMq-00000001aYu-1suN;
	Fri, 16 Oct 2026 00:00:12 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVMo-00000001aY6-1e3k
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 00:00:11 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-9178aabd30dso58133736d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 17:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108809; x=1792713609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QqEHOCux09a0Q8vXL7DmpuXdHbLuTIeeYNtJksyQERU=;
        b=GQTxvjFpEuOQXJRVIaUreJeLtNe4/S7LhP7dr8Me6riyUGa166mcOMF8Aog+XUH4jv
         T5dos/mRxtOyysN9sGXp9Bl4KSiVfLwKSWhjKJvNg69cQSqCC0nLxIbGFSAxTpGS+jD1
         eYoHAWTF2jEquh1x3C8HTglGubQ3IdF3go1mH+9IDqwy0Odt/ewTLfB5yWeMxRFs8Iql
         +at6pWtlZ7PrSBYCAaHee32B+4mA2EYHwcGhZgvA/zVI7ARkxywwUZROlHknFtE39Mdc
         D7aWqCfqvm3ZQWgK8yr4f1jhd4sFKJuMG6hyC+liXOOONw9Y16l9Q4DVPcnO7/A7zTij
         2XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108809; x=1792713609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqEHOCux09a0Q8vXL7DmpuXdHbLuTIeeYNtJksyQERU=;
        b=e/BEH9tcFyEBWRPLrBPfqvsnQu192gMI1Q+ymLPCGXZqH2w+sRrMNZCZSqnRkHVaAd
         bojpnI3BOP0a9rO6QW0NuSp775Z3LUj/p2kIGrIQeYHcSNSARqI9iBYP1LTsGQwQQ/4e
         ofocFi+WvyjT+PWx2Ob/8c2SiESumIbL6M/Kt004Rk8sBgvdSQmgeLMsvRMeUdrH69t0
         1gk50GGDeQqLf3COQmbwkaKbPKXIybWX6QmRsAfIe3emhgktY3qoaPkJmjG5yqAjA+87
         +rMCnNPn7qKFdIOc74OB+dMDq8D0x0ZYhwQZMPW+KzRa3k/vAEQd0iMn4k+at528IBUC
         azCw==
X-Forwarded-Encrypted: i=1; AKwUvBx/c32z1sy0dTlWZsFDEmySifCZuZc7Sd/gaAMs2QCLLHNN+iQXZYlXt8RFFxb6n5R+1gmBTqkzsI9G0Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLWD1WYhYFBjCSFuFw2H7NWmNkSxtcy7GxjiD8g/tC0rwXc9UBT
	qv8YRSCRTBa/BjZBAO8vDO+7jMAu2ekNDkhfIagu4NZxnyLRc1CHqvL1GTV0K7EleEA=
X-Gm-Gg: AYBFou0n6bxbhb2OEvASBJZrJT0rL9nNsYluTD7MtEFBx6hDpJZziYf8x9joPgFrMv4
	cIFvvXYOWSLcAqA3QhmLxiWiHZ99SNrvkfdYEp/WQk06GGKajaknnsAZ08qcHbp4qTSZvHY0w/7
	cs0URjV+Z/Q1WMUvS5QurkDm+2eMJZcgeOFzn+MxlBL1cYnpOVCH7qOyzwA9FyFa5lD9j/24l9c
	k8SRcfPC1a/5hD39qJ9RBzjHjpJKglus/SiyVzO155aQ2gRj5oPVJr61pGPnSOwSvEjjGEEWIV9
	fSQnh/BKotDo7UCybpxsEAogAacn/VRpuY0eb6j+dZ81hMCuFqfVWUGVURLecUrsXTISKUBYa1F
	LihYpT6P+IqQEls3fyEbDZD7mDseDD7qbelbCFQd3fyuESRe7WaDcJvfVE/qewzzn2h7y6o/3VY
	HepKSJvVNYCxLMaGAFeCVqN4zHvpGN3xHET/SynTCVWNB5HP7jolGpe/h2n/GznFdVz9TN6r0EB
	uzqw5l+2bS7jsQgb7d1XCw/wyC/0CWp76nhQ7MEwg==
X-Received: by 2002:ad4:5deb:0:b0:917:bbf1:5323 with SMTP id 6a1803df08f44-91b55793527mr367860846d6.38.1792108808237;
        Thu, 15 Oct 2026 17:00:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bce8918bdsm4228956d6.48.2026.10.15.17.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:00:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVMi-00000000H7g-17qS;
	Thu, 15 Oct 2026 21:00:04 -0300
Date: Thu, 15 Oct 2026 21:00:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Zhao Qingye <zhao.qingye@sanechips.com.cn>,
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [RFC PATCH 0/12] iommu/riscv: Add nested translation (vIOMMU)
 support
Message-ID: <20261016000004.GB14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_170010_435465_B8F91450 
X-CRM114-Status: GOOD (  12.73  )
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

On Thu, Oct 15, 2026 at 02:52:20PM +0800, Gong Shuai wrote:
> Add nested translation support to the RISC-V IOMMU driver, so a KVM guest
> with its own vIOMMU can own the first stage of a device context while the
> host keeps the second stage, and add the interrupt support. This is an RFC
> and comments on the design are welcome.

The iommufd parts looked reasonable to me

I feel some mild skepticism about all the MSI parts, it would be good
to get more of the interrupt stuff actually landed before posting this
again.

Please try harder on the commit messages, do not use AI to write them
like this. They need to explain why this patch exists and what problem
it is solving not some inscrutible description of what it contains.

You'll need other riscv people to help you with reviewing it.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
