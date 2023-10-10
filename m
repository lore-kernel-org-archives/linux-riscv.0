Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B39CD98CA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrCAZ//084uaOFJeJlpeouKKnVG5w1xa88BTqqTPq6o=; b=A1G+ijS3ytyEw7
	vX2w/p2j/mSEjOEnId3NceiljhoIWiW8Rj6DGVMLsnBxvUrU1l2c9qI3xKLcjUofo86HtGpsGBifw
	Vyixu/U529qPrMi+tXxi7w+4mMKlteOUXOk1oDVqIDjGTVOHHxfedL+weKDNsJxYhJjZWUoFvYHvy
	VqDnkPI1QHOjhzw2bBeqIOHBJFeELxyVH3xEkcFXQ0QWmsF1mYK/ImhNg4U4UWUrsQCPeEKRMHCh4
	8ErxFLWzPb8HRauopeh7bEiDb+SN//hPlLwwllgrnROvp4rnI4QzWTawK1/L2vMAxbNNTgBJm/Nqk
	guT9lmrNmWRvFwDMLOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqL7h-00EFVx-0P;
	Tue, 10 Oct 2023 22:22:41 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qqL7a-00EFUa-0R;
	Tue, 10 Oct 2023 22:22:34 +0000
Date: Tue, 10 Oct 2023 15:22:34 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: j.granados@samsung.com
Cc: willy@infradead.org, josh@joshtriplett.org,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Guo Ren <guoren@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v3 0/7] sysctl: Remove sentinel elements from arch
Message-ID: <ZSXOqoCRH0PiBiIG@bombadil.infradead.org>
References: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
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

On Mon, Oct 02, 2023 at 01:30:35PM +0200, Joel Granados via B4 Relay wrote:
> V3:
> * Removed the ia64 patch to avoid conflicts with the ia64 removal
> * Rebased onto v6.6-rc4
> * Kept/added the trailing comma for the ctl_table arrays. This was a comment
>   that we received "drivers/*" patch set.
> * Link to v2: https://lore.kernel.org/r/20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com

Thanks! I replaced the v2 with this v3 on sysctl-next.

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
