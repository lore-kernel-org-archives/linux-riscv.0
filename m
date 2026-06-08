Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FE3CD6E79
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bha9jNrVh5TlBTQrry+r/rtc8xNm1RCjAM1XOiN8jcg=; b=RYV1B/UrL+OuHj
	njpEWmHD2XhRGKQCkLVYFg5LxK0GdUSXRr1YCzNg9gmv1nwssY8OUQITpTkpgQLV5I0uGJVQe3HEu
	ySgrbnkWf2ifPiMduXdqnASz/Iq3jqdyQnFNhE+zTix79jX8K1QBkBK9iCMvQZ02ZHVq0QyqsBtAj
	NacC2C1NpQN0YRgVHMAxP5jrwPMR7XIkXrPg9fiM+92SsXPEicVSBa/rbVH3Jv8IbxLgfrWTf/Ay1
	FMcsunTjVudu2SEK6sdGoJJiJANMPu/gRB1ut/unSyyk9ahuzmQixecR1GadRZ/+AC7jVib8sCCEK
	Y3+mYpgpXVy1URCyHrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfDN-00000004IUN-0yui;
	Mon, 08 Jun 2026 19:00:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfDK-00000004ITl-2kCh;
	Mon, 08 Jun 2026 19:00:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FA2A43B45;
	Mon,  8 Jun 2026 19:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086C71F00893;
	Mon,  8 Jun 2026 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780945245;
	bh=BoJRT4fDwZJIZj1sKJWduqL1Uc3KtHVy4pz1d5Skq5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KfHoG14jTkmfniNdtVxNENuQMvpWd/NiZFxhjbAOH2qflTZKJQmKrpo5v28Wi+WAs
	 KVXrcoLV9U6kz2x6PapzUAFAESu9QX1LfppzjVC8N46Zjz4Z7sNH1yZ4d/WStaY/Db
	 /X0KZN7bD6W6UX1cOzLU6ci7UDbYfFPVdFgj4ieVJdmN5wwduOPBAUYDy3CVZ0PKTV
	 7jDWA8qALbwrzMysH63nL/ognc+jgZzyQkks66irzQLutLZp6uiVnUjco/Ovf8T61F
	 Hl+i3nfOLaRFfs63ImgogaFfuCOgrM1qeCvRY3e4N9d9jlLv5gNamEcIoZ6c2B1GDW
	 t1bYS9/awuJHw==
Date: Mon, 8 Jun 2026 22:00:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, bhe@redhat.com, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org,
	paulmck@kernel.org, leitao@debian.org, coxu@redhat.com,
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, osandov@fb.com,
	jbohac@suse.cz, cfsworks@gmail.com, tangyouling@kylinos.cn,
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com,
	adityag@linux.ibm.com, liaoyuanhong@vivo.com, seanjc@google.com,
	fuqiang.wang@easystack.cn, ardb@kernel.org, chenjiahao16@huawei.com,
	guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <aicRRrAmuCkTI68e@kernel.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>
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

On Mon, Jun 08, 2026 at 09:10:00AM -0700, Andrew Morton wrote:
> On Mon, 8 Jun 2026 15:34:49 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
> > The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> > and crashk_cma memory are almost identical across different architectures,
> > This patch set handle them in crash core in a general way, which eliminate
> > a lot of duplication code.
> > 
> > And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> fyi, AI review might have found a bunch of issues in arch-specific
> code, all of them pre-existing.

v15 grew to 23 patches because of them and Baoquan suggested to split the
fixes into a separate series.
 
> 	https://sashiko.dev/#/patchset/20260608073459.3119290-1-ruanjinjie@huawei.com

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
