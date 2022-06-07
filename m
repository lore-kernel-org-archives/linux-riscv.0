Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DF6C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQexPN7xLq87DhQjm6ZTiJ5svG9/QZevXWQFZyhYDuQ=; b=dfUYxCRxD45+Ae
	5yUlU9aGAqrTs8X3GmruSrEksKkYOXINvOK5t36m0rUK8d0dsFKAuw0gRlC9fZ4umQTXkZL+qLGII
	eYcxEB0jRBd5KC/KZgPjtW+nD5iZfzo/bO7/77QYxO4220aEQ2aKoei3JC83rxl53tkTv3TxE2eNs
	wqw8wqWjSL9Pe9/h2WnI8nildLwS9NIdugJxZOEOGreaSx+BfhaC2YR8KDD3aVOSjl1B3UUZYhYA7
	RmK1bpHZhmFxEG9k+9J8LUJymSCQXAt1H/aP1SN+Yl0vTOZyaYyMqcLbO4KDU/jo/gqS9a500Mohu
	iMcztBRXdMT/pLlOrTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyikF-00A1CB-Eo; Tue, 07 Jun 2022 23:36:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyikC-00A1BW-Mn
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 23:36:18 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nyik1-00033u-HB; Wed, 08 Jun 2022 01:36:05 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, Ron Economos <re@w6rz.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 1
Date: Wed, 08 Jun 2022 01:36:02 +0200
Message-ID: <827324415.0ifERbkFSE@diego>
In-Reply-To: <d7c8ee82-ce85-5d55-2865-4b610c9d3b9d@w6rz.net>
References: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9> <d7c8ee82-ce85-5d55-2865-4b610c9d3b9d@w6rz.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_163616_789637_142FC3A2 
X-CRM114-Status: GOOD (  23.77  )
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

Hi Ron,

Am Dienstag, 7. Juni 2022, 22:46:52 CEST schrieb Ron Economos:
> On 5/31/22 10:13 AM, Palmer Dabbelt wrote:
> > The following changes since commit 9282d0996936c5fbf877c0d096a3feb456c878ad:
> >
> >    csky: Move to generic ticket-spinlock (2022-05-11 11:50:15 -0700)
> >
> > are available in the Git repository at:
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-mw0
> >
> > for you to fetch changes up to 7699f7aacf3ebfee51c670b6f796b2797f0f7487:
> >
> >    RISC-V: Prepare dropping week attribute from arch_kexec_apply_relocations[_add] (2022-05-30 16:04:37 -0700)
> >
> > ----------------------------------------------------------------
> > RISC-V Patches for the 5.19 Merge Window, Part 1
> >
> > * Support for the Svpbmt extension, which allows memory attributes to be
> >    encoded in pages.
> >
> >
> > Heiko Stuebner (12):
> >        riscv: integrate alternatives better into the main architecture
> >        riscv: allow different stages with alternatives
> >        riscv: implement module alternatives
> >        riscv: implement ALTERNATIVE_2 macro
> >        riscv: extend concatenated alternatives-lines to the same length
> >        riscv: prevent compressed instructions in alternatives
> >        riscv: move boot alternatives to after fill_hwcap
> >        riscv: Fix accessing pfn bits in PTEs for non-32bit variants
> >        riscv: add RISC-V Svpbmt extension support
> >        riscv: remove FIXMAP_PAGE_IO and fall back to its default value
> >        riscv: don't use global static vars to store alternative data
> >        riscv: add memory-type errata for T-Head
> >
> An issue was found on the HiFive Unmatched with the 5.19-rc1 kernel. The 
> following warning occurs during boot:
> 
> riscv64 kernel: 
> ----------------------------------------------------------------
> riscv64 kernel: WARNING: Missing the following errata may cause 
> potential issues
> riscv64 kernel:         SiFive Errata[0]:cip-453
> riscv64 kernel:         SiFive Errata[1]:cip-1200
> riscv64 kernel: Please enable the corresponding Kconfig to apply them
> riscv64 kernel: 
> ----------------------------------------------------------------
> 
> I've manually bisected the problem to this commit:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff689fd21cb13098305bae3f8d0c0065df2e2fc1

hmm, on first glance I can't really see how that specific commit would
affect Sifive erratas. Patches directly before this one did change
alternative / errata things though.

(1) From looking at your output, it seems at least CONFIG_ERRATA_SIFIVE
is enabled as the general sifive errata code is running, but are the
individual erratas also still enabled in your config?
They're default=y forever and weren't touched by the svpbmt series,
but it'd be nice to know how the config looks, to see if the Kconfig
settings are strange somewhere


(2) Going from the list on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?h=ff689fd21cb13098305bae3f8d0c0065df2e2fc1

could you maybe check if it's really working with the parent of the
commit you found. (i.e. patches before the svpbmt addition).

Also just to be sure, it still works correctly with 5.18, right?


Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
