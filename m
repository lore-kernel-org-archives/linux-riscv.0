Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5354DC4829B
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Feb 2024 10:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYBa1SXU6Hn6uLFTzkgbOZn9qfR1hyPT3tUpa3ZQLtg=; b=wETvnstg9sed0a
	jq+p6aDJ6pcQBW7t6d6dXFmsFjywXzUdWYGYanw5PhXe1qiSIh+bLOFsiYc+crWcpD4tT0X+PmYeQ
	AzReouWRttiio/ejI2Lv11dlMPOFU2eIqkjwQh7nQNG1g/hgsImS9G/JxzFieqjC9G+Q7DNcuZOew
	K6ORwKDQzYxAiVNgNSs8mVJk6d97KczPV2/+0CcaGq4mjgtl7rSqLjByktctm3Qirr/BLm0kPwxJa
	W3TEl5M0yOQzwP/ydFY27yY1fwSFHNaCvber+njDwUmggrbp7ueR5Q5qGw27zt2/ugUSi+icnkJ68
	SjJgRepyQGQeEP10R8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZ78g-00000002cZF-3oT9;
	Sun, 11 Feb 2024 10:32:46 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZ78c-00000002cXK-43GY;
	Sun, 11 Feb 2024 10:32:44 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 2EB1F38A0673;
	Sun, 11 Feb 2024 10:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1707647542; bh=dLh7MlVuk355kto4z+2BT9WqRjzdR9Gl3cXp8/KeMec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jd9A54zXfJ1xQmZ6O4wlZ1OPR2ame5KhRLXD1s0iYIb4wB6Xn0HQgUWPgiBldl00Y
	 hCSRTlbzcMI60Kmn4XoYF2kxpck/0hCE7rZYYKrPwt/X+3cYZHsrncO9qnVfGUlAF+
	 D/hnz1QnoLFIbv2ONMvYSU0VAH+9MGB/unrU6CL9Q+sxRqS0n2pSvBaGJN8zwltopJ
	 FUqzFc+cNF9ovSkVbcnuLIgE6csHcCsRZy0xAODusFEpvhhyemV+WBWytlFmHK0O/d
	 mPEgZez+T/e6dItllz5fgVA+SOTZoAzOIPkZjTz4xU6nNkf55z5VjK1c+DLNg4uIXy
	 9+uy6gZKghfV6Cj/eLEQUWf3+BES12+z51bgbzdNVOlsJocPL1bsByECK80WcpCRAs
	 9CnruCSy6Y95CXJtbD34tYfIm6EakRvlIom6YzZDW+tDRdc1mgIz302UNgNrcv/m8x
	 NFnS34NbU5AUDgjDcPWrFhj8X+eUUdltEADHTXaxLWmSMjwjy8+NNAzY+DHurungbs
	 CH8eQc4ufGNqSmF28IUn6/pQ2oJ1zqI05MBrWFF49OQPLjf6F3Iv6XVX9GR0dgCRng
	 pY00VZciZ75yI1PtwTeDloj/tBy57e3g7zK6it+g/tDci0UbYey5vHApQLQcheT2Ha
	 rdf0UH3FDXjINE85+27U8oWI=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id M1aevNjCSz4D; Sun, 11 Feb 2024 10:31:41 +0000 (UTC)
Received: from xtex.localnet (unknown [103.84.217.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 11 Feb 2024 10:31:41 +0000 (UTC)
From: xtex <xtex@envs.net>
To: Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
Date: Sun, 11 Feb 2024 18:31:36 +0800
Message-ID: <2646117.S0smAIiGLA@xtex>
In-Reply-To: <CAK7LNAQPm7PXoKM+id25wX9AtVmmXvE7i8GrGB9etU__EMUwdg@mail.gmail.com>
References: <20240210074601.5363-1-xtex@envs.net> <ZcfoZKJHkdEh5JmV@fjasle.eu>
 <CAK7LNAQPm7PXoKM+id25wX9AtVmmXvE7i8GrGB9etU__EMUwdg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_023243_158991_70724BD5 
X-CRM114-Status: UNSURE (   8.59  )
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

On Sunday, February 11, 2024 7:35:35 AM CST Masahiro Yamada wrote:
> 
> The separate 'set -e' statement works for both cases,
> so I think this is safer, though it is kind of bike-shedding.

Thanks!
I also think it is safer to use 'set -e' in the case of 'sh install.sh',
 so I support not to use 'sh -e' in the shebang line. The planned V2 patch for 
this disappeared.

-- 
Zhang Bingwu @ Sun Feb 11 10:27:48 AM UTC 2024




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
