Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A501CC25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Zt4v38IJijolJZV6WDZiIzpd14VAW6wiRQOVP/EPhI=; b=i8slhWC0wq/Vws
	eF2ZN8uuRE1MIyCW5vZoDdcWEOk/0AT3EqKSqRT8ulzyJ5DOy8mIdUbcZrLaB2qOndKLg8ato+wkU
	KWUdBNfJ616T/auR9+c5LFK+euRWLRhcD/skVFxRO/cDzPdeLFNxGh6hivS/nZK5LWPltdEDMvkWG
	UZvxCAzlNEJGZ6NS0M0GQ5o475Sx0TvjcKBTcKwbeoN05gHnG4gIaLSBWDHYe9tfz4vHbY4qpYbPp
	W2GXtvbg35XbWac8Pxxemr/KCpaNhPR7ebZLuz9XuIj9/Logxo3uncHKFH3lU6JulWXp1pQctgO0y
	rusIkSXavNLxyaviG8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JrD-00000004Ebh-2iaq;
	Fri, 10 May 2024 06:35:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Jr9-00000004Eam-28Ic
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:35:50 +0000
Date: Fri, 10 May 2024 08:35:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wiWgwXZNUgYVT1P/WFHirbZXJDsaudwsuRNKyAlK2ok=;
	b=SSlw25eDytsAMiPK9m+dJ2SXFuQcqByVDNzD1tV9nuh39DHN9vqUZt51VWVAskuGNcDESn
	ztmFebpvF8RNYrYZsWuP9EtDWnTUODT2QuYonY7WabufV87j7KNvAmvKclXtbF0xKxV2Qz
	/j6L6m3xKx18AZ9BJcxMTUyIqUFDiG6RDLYw2uEuwSgpfyAf+ntWIhih2nUCzBpfw1WvBL
	GseN1BeiLWd/Q01I4mR5i3fglQHr8GxPq7hwy6TkeLOsZ/6tcN2FfemfzDXFvkJ+Fw+k5t
	j6sH1NAO4gENYO3OaC9tyB8Q4fYCXkm8gUiIbw+eRF4F5YDCYThX5vJ13Drw+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wiWgwXZNUgYVT1P/WFHirbZXJDsaudwsuRNKyAlK2ok=;
	b=TXVjyMoW8j4fu5MdczhZ1yVQwKOcnWrwxFr9fIBQppS3/LsD7p0B95utP1iiHD5tiHBQSb
	v7w2TeqBOZRU1hBg==
From: Nam Cao <namcao@linutronix.de>
To: Joel Granados <j.granados@samsung.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>,
	Andreas Dilger <adilger@dilger.ca>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"ndesaulniers @ google . com" <ndesaulniers@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tejun Heo <tj@kernel.org>,
	Krister Johansen <kjlx@templeofstupid.com>,
	Changbin Du <changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <20240510063544.cAHy0hF8@linutronix.de>
References: <20240418102943.180510-1-namcao@linutronix.de>
 <CGME20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4@eucas1p2.samsung.com>
 <20240429125230.s5pbeye24iw5aurz@joelS2.panther.com>
 <20240430073056.bEG4-yk8@linutronix.de>
 <0049995a-07d0-4aaa-abc7-5bfc0dc22ace@ghiti.fr>
 <20240430154238.nu6pebmdlpkxnk7q@joelS2.panther.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430154238.nu6pebmdlpkxnk7q@joelS2.panther.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_233547_723774_545A4675 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, Apr 30, 2024 at 05:42:38PM +0200, Joel Granados wrote:
> On Tue, Apr 30, 2024 at 10:37:59AM +0200, Alexandre Ghiti wrote:
> > The config shows that it is a XIP kernel that comes with its own 
> > limitations (text is limited to 32MB for example), so I'm not surprised 
> > to see those overlaps.
> > 
> > We already discussed the removal of randconfig builds on XIP configs, 
> > but IIRC it is not possible.
> 
> I just tested this going back until "2023-09-20 602bf1830798 (HEAD)
> Merge branch 'for-6.7' into for-next  [Petr Mladek]" and I still saw the
> overlapping errors.
> 
> Is this just something that happens always?

Alex is write that this is due to the 32MB size limit on XIP kernel. This
means build failure happens if too many configurations are enabled and the
kernel gets too large.

I just sent a series to lift the size restriction and fix this build failure:
https://lore.kernel.org/lkml/cover.1715286093.git.namcao@linutronix.de/

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
