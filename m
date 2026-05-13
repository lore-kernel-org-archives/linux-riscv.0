Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FF9CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDI3rt+qQW4Bf625rtNnfPTFc2Wa5wmQDC3zp4EwsYA=; b=ep8+94difbjfSl
	2V3Oiyh5ozwyB3anuLuemvEXVMlpvWtXNZiNL00Gs89YUZFNnr8dzTMyVJ0677KD/HbyIDH2zm2rm
	87QlQjQ8975BykCJ136t+3l9XVYkuB7k3RKusgKyYCotP+FCJVdD7wj45EqduSlKGujK3w7GBpUKC
	bP4enR+BoILSKidjOiFHkRT7N7xJt0KXRNof7lViziwzZTfmE6lisg+SX6yyYV5PM/08naq0TVHCQ
	2ezotcfvxAI5qwMHNnsqF0IS/itMF/qsnGuILxZfcMjQQ7uvl+UsYqr5BLaOToRk+oYPIci5zuMSr
	h2QtViAxA6Lm19xetpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCQV-00000003Coh-0TNY;
	Wed, 13 May 2026 16:27:15 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCQT-00000003CoB-1JC4;
	Wed, 13 May 2026 16:27:14 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 64DGEn1a2905667
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 13 May 2026 09:14:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 64DGEn1a2905667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1778688894;
	bh=kzc3j2nHoRxQd9M0vkzx/uZg5Iwn8WIixU3RTEBg+i4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ahhs2ZaNxCuIyTcDd/to/S7gqU6ft6zabx6TakulFhnIjDt8bXMJ0LGzYVyEfrxzF
	 EoSq1ir5sKEz+X8RiAhKD9hHd7SJ2OozMvt9/+9wrxu0pBvVJBlgjVq84smFg5PvWl
	 ODAygtu3MetLOSzf39fcORVc45KgUJxXa0B3c1WcYV/TBfKv8I2j2JZj6Oo7LMLnaS
	 F/w+6e9Kh9WjQd20++VspvTwbnc9Zogl0CKsAiiMu7QXkJbZu0hP9l3BvRBi3h/lIE
	 60H32//SMm5Gsh1hto9j6ldrE4pFtBClA6C9ESo0hnzWXYJCYw3OlK+u43GeYa68K6
	 OTz8RC1DMTHsw==
Date: Wed, 13 May 2026 09:14:44 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>,
        Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
        Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
User-Agent: K-9 Mail for Android
In-Reply-To: <20260512052230.2947683-2-hch@lst.de>
References: <20260512052230.2947683-1-hch@lst.de> <20260512052230.2947683-2-hch@lst.de>
Message-ID: <45B68AA3-36E2-4187-BD30-F4631C7F32C2@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_092713_358854_DFC029F8 
X-CRM114-Status: GOOD (  12.28  )
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

On May 11, 2026 10:20:41 PM PDT, Christoph Hellwig <hch@lst.de> wrote:
>While the RAID6 algorithm could in theory support 3 devices by just
>copying the data disk to the two parity disks, this version is not only
>useless because it is a suboptimal version of 3-way mirroring, but also
>broken with various crashes and incorrect parity generation in various
>architecture-optimized implementations.  Disallow it similar to mdraid
>which requires at least 4 devices for RAID 6.
>
>Fixes: 53b381b3abeb ("Btrfs: RAID5 and RAID6")
>Signed-off-by: Christoph Hellwig <hch@lst.de>
>---
> fs/btrfs/volumes.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
>index a88e68f90564..0b54b97bdad8 100644
>--- a/fs/btrfs/volumes.c
>+++ b/fs/btrfs/volumes.c
>@@ -159,7 +159,7 @@ const struct btrfs_raid_attr btrfs_raid_array[BTRFS_NR_RAID_TYPES] = {
> 		.sub_stripes	= 1,
> 		.dev_stripes	= 1,
> 		.devs_max	= 0,
>-		.devs_min	= 3,
>+		.devs_min	= 4,
> 		.tolerated_failures = 2,
> 		.devs_increment	= 1,
> 		.ncopies	= 1,

Yes, if anyone cares about < 4 disks for the RAID-6 case (or < 3 for the RAID-4/5 case), just use the RAID-1 code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
