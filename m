Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6550BE8181D
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 06:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKZxtRHHg8xcdA8757/V1vLpfGdruC5pelmGT0QPv8g=; b=15TAaIvxUJ+9zL
	0WqV3dSiD83OoLdvc1pPthHXaruY/UWHGcsDOfviMux7/26+haoBItL6F3sUZIC4Y8IPRh9JFsQcT
	QBLMWicAMMZJNOIyZaOGd2iWlc+LT2KURME75UR2PEBtVDTXV79QBKcbG026PdGNRBVlILbg2ihQs
	GUAtUshlmep/SSRSimp8Jd/+9IvvLHlJRePy9MFE4wIr8K6dyCG5yVamtupVhp9ukAe8GBM1X7Wkt
	yPpcPnqYgzpeZAfFqdAYN7mjV2dF/jgCggVjNLaImHH6Vl4gEv9xAjCTrAqX/lV6sF7EuLWYiTilz
	sGUHf5j3UAjqhvGTQvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql1Es-00FgMD-0m;
	Tue, 26 Sep 2023 06:08:06 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql1Ep-00FgLr-2H
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 06:08:04 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 85E0D32009F4;
	Tue, 26 Sep 2023 02:08:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 26 Sep 2023 02:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695708481; x=1695794881; bh=xZ
	//d5rAxIyL4DIO25l3Kqx9snAaHxvzdTIm60dV7fo=; b=k8GgK8b8bdbMrxec14
	vQF7AIOuOLxboNppmnLK9zaKi+d+Tp+yVgazv7sqFmNtdeP0aZyrlf2hB+9CyTyN
	Bxd1N65CUpF5BifXyNljwPU/YIJAYl8cEmqO9eW1ozNxx0StAkRpBJsp5R7EDOy3
	FVDekivSaQOYc5qjMWOJe79cnfv+KEySWlJ094MwFD1fYe9AtFT419Le66TH3vJS
	E2y7cYRgaD/RvN205GxckZuiYZ2JTGRiYZnv6SDpII80yMXXkEajwtcKgKWWqzNK
	vVHTE/5+Hwj8R9Qe888Dc/etYdGyczVAvk9/uNGBSGFRgL7TlnhQMY6CCmKac5/q
	jxuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695708481; x=1695794881; bh=xZ//d5rAxIyL4
	DIO25l3Kqx9snAaHxvzdTIm60dV7fo=; b=VGOMi6HnfP/cfR1kzW9zh1OSswSZv
	bKIiaa3E3Ar5x6E4b4QKSoqZ3FYSSs10iBjwp9sl7Wev0ChCekF3gGbCKH39kePz
	upTMKHZpcyO7pROwYUqN2j5eXZ7VWaj0rXuyvYr1v05qq/t0lTemD0UHnRkuxJh9
	uVe35RrBngFSnrTeZABHHKjP186/bfOc+BkMg259YYIeS0tXnIUQYq3vrnNuvOjU
	xWGOM82HD7sKxUoq/sjU2AmF57UgMjwe0/Thfr3oYK/oY2jMU2QMJEl/MkDxG7bK
	RbNtqegmLQoDj5AN0MYPtS74aYSHrMUXTg2BrqK+w9eSGeRC/akkkuqUQ==
X-ME-Sender: <xms:QHUSZajDXIX5_yCRxxvH7o-mrbsKQTdX0bAjIs3_kRQ9FyUIW5cH6A>
    <xme:QHUSZbBaHncRGc0IZDGhQ8qrMWwBalhH1sBWhKd9f9sClogo_5K9bcJarPYD7anHI
    a3D-seLtmR8uywxBGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:QHUSZSEVBy-pvO9Y3AXNe4lXaTCLCq_hUJWd92qLhYb_FVX1DN9JXw>
    <xmx:QHUSZTQRT8BIkEhcXeJlYjH-WpkB1XpfGY-DiRGJbms_dx66_HEGvQ>
    <xmx:QHUSZXzPUhtAkHMiX8NWg9APAPN0R3Yp1_t8Srl28f1J7bDpSaBa8g>
    <xmx:QXUSZffm2tqYl_AVYJWmXUiqNNcVNPAYcaep-TztM4cGFhvs4vNBKQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B0DEBB60089; Tue, 26 Sep 2023 02:08:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <862f42d7-b582-4d88-a9d2-f72ea5bfe903@app.fastmail.com>
In-Reply-To: <3042b32a13aecbf8f3c8bedee34a4ca8c7d7cb2e.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
 <3042b32a13aecbf8f3c8bedee34a4ca8c7d7cb2e.1695679700.git.falcon@tinylab.org>
Date: Tue, 26 Sep 2023 08:07:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, paulburton@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Willy Tarreau" <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Tim Bird" <tim.bird@sony.com>
Subject: Re: [PATCH v1 4/7] DCE/DSE: mips: add HAVE_TRIM_UNUSED_SYSCALLS support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_230803_779734_9F9F1350 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, Sep 26, 2023, at 00:40, Zhangjin Wu wrote:
> For HAVE_TRIM_UNUSED_SYSCALLS, the syscall tables are hacked with the
> input used syscalls.
>
> Based on the used syscalls information, a new version of tbl file is
> generated from the original tbl file and named with a 'used' suffix.
>
> With this new tbl file, both unistd_nr_*.h and syscall_table_*.h files
> are updated to only include the used syscalls.
>
>     $ grep _Linux_syscalls -ur arch/mips/include/generated/asm/
>     arch/mips/include/generated/asm/unistd_nr_n64.h:#define 
> __NR_64_Linux_syscalls	165
>     arch/mips/include/generated/asm/unistd_nr_n32.h:#define 
> __NR_N32_Linux_syscalls	165
>     arch/mips/include/generated/asm/unistd_nr_o32.h:#define 
> __NR_O32_Linux_syscalls	89
>
>     $ grep -vr sys_ni_syscall 
> arch/mips/include/generated/asm/syscall_table_*.h
>     arch/mips/include/generated/asm/syscall_table_n32.h:__SYSCALL(58, 
> sys_exit)
>     arch/mips/include/generated/asm/syscall_table_n32.h:__SYSCALL(164, 
> sys_reboot)
>     arch/mips/include/generated/asm/syscall_table_n64.h:__SYSCALL(58, 
> sys_exit)

My feeling is that instead of postprocessing the generated files,
it would be much better to make the elimination part of the
existing infrastructure that generates the files from syscall.tbl,
and finally change the include/asm-generic/unistd.h to the
same format, as we had planned for a long time.

I should be able to help out with that part.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
