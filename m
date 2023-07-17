Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042CFEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fbevqf95qVLjMSmKdzwYc9lDeF6gdjOnxe1dBHaxxlM=; b=F6qlWPc6w5c+wj
	e81e6N2Kv643FcDe9QNjiRIXs2ofCMgrz9RSLYr9Ht44dumSGJpAH+Opesp8cPsiylaEOtOw7NTjN
	k0KkD+hBqxAeqZv1UAIln85kK/bCf0wuyE8VkKa/8EChR9WmTGDbDRJIW5NyYo4KLm0sWft8LkAXe
	W1YIAm7PmXQcEDmIjEnez28vuMKu8YcK4dLrmSvFtR6H3VklTCJeDCLV8KSN0NvJW+6aj0CiLOrPL
	jqfZxW/wWMoJkf1hjDhHyNLy+IPoNc2w7gJ9PF2Z9m/HNKeD+qf6ls+Er8MySPmx/YEXfkp5lu/Aw
	76yEvcBPlm+OCbVvQCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLMdB-003tP2-2d;
	Mon, 17 Jul 2023 11:43:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLMd0-003tL5-0U;
	Mon, 17 Jul 2023 11:43:06 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4Kqp1Psbz67Lnh;
	Mon, 17 Jul 2023 19:39:34 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 17 Jul
 2023 12:42:48 +0100
Date: Mon, 17 Jul 2023 12:42:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James
 Morse <james.morse@arm.com>, "Suzuki K Poulose" <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, "Oleg Nesterov" <oleg@redhat.com>, Eric
 Biederman <ebiederm@xmission.com>, "Kees Cook" <keescook@chromium.org>, Shuah
 Khan <shuah@kernel.org>, "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs
 Nagy <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 04/35] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <20230717124247.00001f1c@Huawei.com>
In-Reply-To: <20230716-arm64-gcs-v1-4-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
	<20230716-arm64-gcs-v1-4-bf567f93bba6@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_044300_964746_265D2F90 
X-CRM114-Status: UNSURE (   8.16  )
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

On Sun, 16 Jul 2023 22:51:00 +0100
Mark Brown <broonie@kernel.org> wrote:

> Add some documentation of the userspace ABI for Guarded Control Stacks.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
Hi Mark,

Nice document.  All I could find on a first read was one typo...

...

> +7.  ptrace extensions
> +---------------------
> +
> +* A new regset NT_ARM_GCS is defined for use with PTRACE_GETREGSET and
> +  PTRACE_SETREGSET.
> +
> +* Due to the complexity surrounding allocation and deallocation of stakcs and

stacks

> +  lack of practical application changes to the GCS configuration via ptrace
> +  are not supported.
> +


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
