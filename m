Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CC4CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWzs7+nLMs+nDQrtooxNfDJSTrLpfYer5ljv+yC53c8=; b=JqzUvR+7PIiRZt
	eSiruloUyhrPN9ajLbSw45g4W+5tXg32uubHhAMZczlwmT3jXtasj72SufunyUkUPQ9K6wEzd/gxx
	Es9C1KBwQVuQW5Mws+fdL2F97s0x1KHO2buTLU8WZq3qqSnE2yWFwUMxkyANE0NVdmwVTneqMeP2X
	eeZa3jAy4LPAn7W8PNj59V7ChOoWD4/CrkMgPTmu5ro1TlfDWTVbR5flaoU77HJVD+ItOq1jrwB14
	rcmfE2Yvz7vcG2RBSVcH31nNbYnYcJLI26uROiD4NSEXmF76dlPvPzdSqceKWiKrQmyRpag7f6n+s
	6A2iW81279cHvkID8jkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPNw-00000002Wbd-3L0H;
	Tue, 19 May 2026 18:41:44 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPNr-00000002Waj-3jBi
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 18:41:43 +0000
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id POFCwRlwKshqQPPNpwSubL; Tue, 19 May 2026 18:41:37 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id PPNlwfCZXHcwePPNmwRYEo; Tue, 19 May 2026 18:41:34 +0000
X-Authority-Analysis: v=2.4 cv=Paj/hjhd c=1 sm=1 tr=0 ts=6a0caee0
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=7vwVE5O1G3EA:10 a=JfrnYn6hAAAA:8
 a=t9496tuAAAAA:8 a=8mfmMTAi5znwAunKICIA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=4wQ91nGE5lQcD7eh5OX0:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/sDILmZ2tgtSqicFqjmz5+6qL2wSJEKgFrdQuKcaHcY=; b=3UD1D5JByLHmoMBu5uPrFjzeAQ
	lSHbJdJLzjLrk9Wki1orVSw+21wo52yrDEIrMWbLqLKBmy6CjRW/tB9TIpIcFg0PBrcdwIdpmKaf4
	VXX6E8kqHe6LF9wYsJ7YCc8MC/Fj/5JVxcy6BU6kflr2504b2iizX42Qp3xT8kcs+aZZ8mz1bKEgC
	DW0DoZnm13OC/k6+qX05s7DGBhP0IyTOBCRiW27GLZX+vcuhwD/d6nQNqVKYp9sMQYY4oEPAX18kl
	nEiZ9unkMgdUKfoHPNATZfJ0TPMmTjRvSGTywWbJhg+P9rjnD8lzh/vvsbjuYauLow8sXDInqMA5r
	n8FIxaTw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:35124 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.2)
	(envelope-from <re@w6rz.net>)
	id 1wPPNl-000000020Q1-1fU8;
	Tue, 19 May 2026 12:41:33 -0600
Message-ID: <eec5f558-fd09-4f4a-9ae4-58fd261cfbfd@w6rz.net>
Date: Tue, 19 May 2026 11:41:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cfi: add generated vdso files to make clean
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: thecharlesjenkins@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260519-vdso_cfi_makefile-v1-1-c129daba59f5@oss.tenstorrent.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20260519-vdso_cfi_makefile-v1-1-c129daba59f5@oss.tenstorrent.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1wPPNl-000000020Q1-1fU8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:35124
X-Source-Auth: re@w6rz.net
X-Email-Count: 2
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMrUhiidRf3ul9XWCPHEzuY023Swa7bbKqDNnfmJpEMFiind78R7Lbdsajwmeiwt1reIHYk/jVpEQjjQ9nAg53KeUUt4Ce2IwkSt8xl0g9M4UKzUkZJx
 E5asy0qbeL8lDRyxTOMX4XMvDKbYgCdV0BK5+ROpZ6QsDloVpSdEuI35gPBo1rGUIHsFjt9aVwnjXc3lOes2g9xbmyYF3bV2/EM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_114140_013850_5604C033 
X-CRM114-Status: GOOD (  12.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/19/26 08:55, Anirudh Srinivasan wrote:
> The vdso files that are copied over from arch/riscv/kernel/vdso do not
> get cleaned up when make clean is run. Add a clean-files target to the
> makefile so that these files get cleaned up properly.
>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>   arch/riscv/kernel/vdso_cfi/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/vdso_cfi/Makefile b/arch/riscv/kernel/vdso_cfi/Makefile
> index 10292498b7657..906023fb5c27c 100644
> --- a/arch/riscv/kernel/vdso_cfi/Makefile
> +++ b/arch/riscv/kernel/vdso_cfi/Makefile
> @@ -20,6 +20,8 @@ $(vdso_S_objects): $(obj)/%.S: $(src)/%.S
>   $(vdso_c_objects): $(obj)/%.c: $(src)/%.c
>   	$(Q)cp $< $@
>   
> +clean-files := $(notdir $(vdso_c_sources)) $(notdir $(vdso_S_sources))
> +
>   # Include the main VDSO Makefile which contains all the build rules and sources
>   # The VDSO_CFI_BUILD variable will be passed to it to enable CFI compilation
>   include $(src)/Makefile
>
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260516-vdso_cfi_makefile-d59006f9d00d
>
> Best regards,
> --
> Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Already merged in Linux v7.1-rc1 commit 382cf7b75b05ee28b9ac2a27b6b8c7c4eb8910dc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
