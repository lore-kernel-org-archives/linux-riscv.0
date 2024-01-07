Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1658C47074
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jan 2024 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbCOvDf8z2Hc69mCxMIOjjQEnP762GvYdGhWC4k9Uz0=; b=d/rnvBzcfzQHKA
	VsmvINPxIGaOz8hhNB+UGzSiDTJ0K32x32HjgvAS/7JkB6lHMpsE6u3ZvxCrhzuqRyu4cyz4Dupxf
	AWUYmCwscqU5z3sZg4Lvz6DM2UYvVJyg8Jq7a/GS8Uf3S4h75fNJsV8r7D0rKWyrLpwTDTkT/iuoH
	yzsj9iqDoMBFyDL66otJGcY9hIdSJzuVX+r0mWblOD3t434Uz6AFt2i1wDoIiHMXv8KFeHIA0Bhal
	jQ2FwRrDH8GWCBvk70RQnZn7NZKYEnLaPWjjJgRYkJr5UCPSof7YHNVMEKBfOf53WvkdMSQGb8PAI
	TslgdQBsOh6uLttbITCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMTfV-0036fb-0z;
	Sun, 07 Jan 2024 13:58:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMTfS-0036ef-0B
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jan 2024 13:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704635901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kAWVwfaNjpLshEWYFcR9bmtF8nNUppRn3hitAUVt2zE=;
	b=Vr04ZOyLV55Opa2x1Kinf86zuibBmYTOiRbShvt3g9S3MYKHi0BTx7tgObUG6fsGzDyebE
	9N6cx9XsNqsUAYDjjj87JtbmLp5DFvO7UkqlnrcW7r7oYt/WAtpnsQg6nhCXBmvggm/p4Y
	MPW2t9Qr0KC8e3ynJ1BRiuWf+jZwX8c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-tYf8LWUjPHCsHwWvnvmvTw-1; Sun,
 07 Jan 2024 08:58:15 -0500
X-MC-Unique: tYf8LWUjPHCsHwWvnvmvTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C466029AC003;
	Sun,  7 Jan 2024 13:58:14 +0000 (UTC)
Received: from localhost (unknown [10.72.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9ECD5190;
	Sun,  7 Jan 2024 13:58:13 +0000 (UTC)
Date: Sun, 7 Jan 2024 21:58:10 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, kexec@lists.infradead.org,
	hbathini@linux.ibm.com, arnd@arndb.de, ignat@cloudflare.com,
	eric_devolder@yahoo.com, viro@zeniv.linux.org.uk,
	ebiederm@xmission.com, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/5] kexec_core: move kdump related codes from
 crash_core.c to kexec_core.c
Message-ID: <ZZqt8uXV6TwMiH32@MiWiFi-R3L-srv>
References: <20240105103305.557273-2-bhe@redhat.com>
 <202401061800.3XPSaPsa-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202401061800.3XPSaPsa-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_055822_164796_127DFE3E 
X-CRM114-Status: GOOD (  15.79  )
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

On 01/06/24 at 06:59pm, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.7-rc8]
> [cannot apply to powerpc/next powerpc/fixes tip/x86/core arm64/for-next/core next-20240105]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_core-move-kdump-related-codes-from-crash_core-c-to-kexec_core-c/20240105-223735
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240105103305.557273-2-bhe%40redhat.com
> patch subject: [PATCH 1/5] kexec_core: move kdump related codes from crash_core.c to kexec_core.c
> config: x86_64-randconfig-104-20240106 (https://download.01.org/0day-ci/archive/20240106/202401061800.3XPSaPsa-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061800.3XPSaPsa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401061800.3XPSaPsa-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/string.h:11,
>                     from include/linux/bitmap.h:12,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/smp.h:13,
>                     from arch/x86/kernel/crash.c:18:
>    arch/x86/kernel/crash.c: In function 'fill_up_crash_elf_data':
> >> include/linux/overflow.h:293:23: error: invalid application of 'sizeof' to incomplete type 'struct crash_mem'
>      293 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \

Thanks for reporting.
This is the same as the one reported and fixed in below link:

https://lore.kernel.org/oe-kbuild-all/ZZpmP5QeH+VigqXw@MiWiFi-R3L-srv/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
