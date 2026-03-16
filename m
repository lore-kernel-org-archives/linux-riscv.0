Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB602F53D6E
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4T19+leHGReMu0PljLctcTF6ItZSTw/BnyRD5dG3PAA=; b=Hb0/I76Zkcsyz4
	Bf1nrA+CSwAG2lFJRxr3IEkzh1bSDQlLl8SU2/EpSASnHQWwdt0PDYjsRTxbnWQtqdciEB1uXTCzM
	oJ1MU9eGhnUyJv8se9+2dP4DeBFEw8tUpT9iIsf9Y71sAeDqSO9yTzBkUpXElIWbb3wmNvX+xEZqj
	/UucxrnPggRE94i/tNfLSJRfTZZ1UclSpaF8+lv+GoZQuaaP+wrnVic2/qpE79HdhlHD+yQIiy/oc
	TyqSLQtkIzUtZyNojKkwQeui8VdzGA/RwXqivT9fr5DVE/CUcSQbvvbGcpuVKGSxUMiY9bqiRvv4e
	5J3FIPn5CFcIsNa3bhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AZO-00000004Q9T-1Bip;
	Mon, 16 Mar 2026 16:13:30 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AZL-00000004Q8w-1e67
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 16:13:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id D5E9968BEB; Mon, 16 Mar 2026 17:13:13 +0100 (CET)
Date: Mon, 16 Mar 2026 17:13:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>, Chris Mason <clm@fb.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Sterba <dsterba@suse.com>, Heiko Carstens <hca@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Li Nan <linan122@huawei.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [linux-next:master] [xor]  ebbbf58989:
 BUG:KASAN:slab-out-of-bounds_in_xor_gen_avx
Message-ID: <20260316161313.GA20842@lst.de>
References: <202603131751.7ba6ffc8-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202603131751.7ba6ffc8-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_091327_595762_DF7FBE8A 
X-CRM114-Status: UNSURE (   9.68  )
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

Note that this is the v1 series, and this is the case that Eric
mentioned and which thus got fixed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
