Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDB5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSY2PYFAvzQjaBxnw7RQqK+hIGFBswqaNWrnQ+RII3o=; b=2VBOaEGl1fNoD2
	T7VBm2iBf4MXIEexMB9C9Q12rD+IuGjhBk/VUoG9up4CyNxwlCSfftJ8OR0yzazEOX1mWuXSqHacD
	m9dhO7i7Erwb9wyiFX7wkDWWgOw9BdAi6w4AliyKwt7IR8KXBVSRKLQGNSmG69xYvrmEfBWnraEum
	XCLnsmGvnuDneUfEFsYX0RJPdSEhEoXt/s9zw5ugEtBj5zR1HSK7DYqyxj5EHSGAOYDkFbAshX5ho
	HRCDI9N5N43aaRzE9crWQOTSrLNeFHzQBcpI/Qusr8uUOifvUuQKit9ovE5KWZzphl4fNbivDgP60
	Cl92YjLd+egmb6aWHVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmX7q-00EoXY-LF; Thu, 05 May 2022 08:46:18 +0000
Received: from sym.noone.org ([178.63.92.236] helo=sym2.noone.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmX7o-00EoVu-Eh
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 08:46:17 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4Kv6jv5bGdzvjfm; Thu,  5 May 2022 10:46:11 +0200 (CEST)
Date: Thu, 5 May 2022 10:46:11 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH] riscv: Wire up memfd_secret in UAPI header
Message-ID: <20220505084611.tut66faep5r37r6c@distanz.ch>
References: <20220505081815.22808-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505081815.22808-1-tklauser@distanz.ch>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_014616_737756_ADE72CB8 
X-CRM114-Status: UNSURE (   7.88  )
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

On 2022-05-05 at 10:18:15 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
> Move the __ARCH_WANT_MEMFD_SECRET define added in commit 7bb7f2ac24a0
> ("arch, mm: wire up memfd_secret system call where relevant") to
> <uapi/asm/unistd.h> so __NR_memfd_secret is defined when including
> <unistd.h> in userspace.
> 
> This allows the memds_secret selftest to pass on riscv.
                  ^- this should say memfd_secret

I can fix it up in a v2 if needed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
