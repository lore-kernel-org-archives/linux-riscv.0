Return-Path: <SRS0=QQKM=YI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9BAECE587
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2019 07:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA422089C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2019 07:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f5Qsxxpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA422089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kVKi2JU5lE0KSyxAVdUIVrZmCiAHd52R8sNdfTYD00=; b=f5QsxxpgKaCNCx
	fExwb41llRb6ryQx/8hu6bgJMaNy07AV/tfaAMwN5CAHd71/TUxXmvwTQ579qPhxSHSs2kI0QIcB4
	a00u5JnuDQRIdErci19cl88lagaFGjeZGy3aQ7zPTGhB7Nw1rYcbb+S/NFhldRgbLjOfFEgE9fxjK
	sQ+DdXC3d9IThswH7yBe/DyWjGHaxzVVjDBOexx2/4YO0vT2aK7Wb84FVa1lyXKlG93NAhPZ5Cu+J
	bluV7HS7OhEO1pwQi22oeXE5MyyNwvz4xtDdXKd3tlCI2dOWXcs8NosXtR2AYMawYURAqS6/itrsj
	R3W/i6DP8It+mirJ4sLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKHZW-0005NQ-N2; Tue, 15 Oct 2019 07:48:46 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKHZT-0005MF-F6
 for linux-riscv@lists.infradead.org; Tue, 15 Oct 2019 07:48:44 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC376B657;
 Tue, 15 Oct 2019 07:48:41 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH v6 14/14] riscv: Make mmap allocation top-down by default
References: <20190808061756.19712-1-alex@ghiti.fr>
 <20190808061756.19712-15-alex@ghiti.fr>
 <208433f810b5b07b1e679d7eedb028697dff851b.camel@wdc.com>
 <60b52f20-a2c7-dee9-7cf3-a727f07400b9@ghiti.fr>
 <daeb33415751ef16a717f6ff6a29486110c503d7.camel@wdc.com>
 <9e9a3fea-d8a3-ae62-317a-740773f0725c@ghiti.fr>
 <d9bc696aa9d1e306e4cff04a2926b0faa2dc5587.camel@wdc.com>
 <4192e5ef-2e9c-950c-1899-ee8ce9a05ec3@ghiti.fr>
 <d27c8eac16d1cc4d5ca139802b4d0cdd2dbbca11.camel@wdc.com>
X-Yow: BARBARA STANWYCK makes me nervous!!
Date: Tue, 15 Oct 2019 09:48:40 +0200
In-Reply-To: <d27c8eac16d1cc4d5ca139802b4d0cdd2dbbca11.camel@wdc.com> (Atish
 Patra's message of "Tue, 15 Oct 2019 00:31:37 +0000")
Message-ID: <mvmv9sqfnzb.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_004843_646605_D26CF479 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infr,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "alex@ghiti.fr" <alex@ghiti.fr>, "jhogan@kernel.org" <jhogan@kernel.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ralf@linux-mips.org" <ralf@linux-mips.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paul.burton@mips.com" <paul.burton@mips.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "hch@lst.de" <hch@lst.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Okt 15 2019, Atish Patra <Atish.Patra@wdc.com> wrote:

> Nope. This is only reproducible in RISC-V Fedora Gnome desktop image on
> a HiFive Unleashed + Microsemi Expansion. Just to clarify, there is no
> issue with OpenEmbedded disk image related to memory layout. It was a
> userspace thing.

Does it also happen with any of the openSUSE images?

https://download.opensuse.org/ports/riscv/tumbleweed/images/

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
