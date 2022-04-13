Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B09C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2wmtXOWcY9D12cGBRK4W11xhOw77pyjeON/cZOSFRU=; b=P6tXUO4gv9mqPI
	ON28WTZty/e8WmtkXPt14Y0RNkWYgTDGNJGNvej/I+FMbhXgJHG2TCU679A5kAJSN9vEXdboxnPo0
	JW66uiXyp0o7KPyJCx7WCqNpq07ySivU5LR4XQSSs0mAok/Hn2PZ35TNzl4oJhI1AJWxlQgORCFQg
	vz3feX4VZq7aAJ65jrzTspCvd4SV6xh7QYN5cPYK4IJjdX8+KrZgC2ItuC46N818Gpg/bkHI49Xll
	tsVPqua+WLLhMqVxIvdTJsQw9S/bncYA78qFtvEueJjV8fkDg2g7tvZnci6WqbH5X1/eznWS0cm+I
	82zAz3/5PwgjrWkT36GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ26-000Flp-6j; Wed, 13 Apr 2022 09:11:26 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ23-000Fkv-39
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:11:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id p18so832591wru.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98UsXQix7jmh2cjHZ+lRGQpOdqdEegIRaK/uMV/eJ28=;
 b=iVK5UmVvCHhETfmtz2Qc+ZHtQcwLys6z2ZXcKFnORfL+TAUKnWFCasQFj4X/XBAtUu
 MTxinFP+6r4X88OLlV/7jz/M6eaqdHncUrrLxNBQIo6zEaqjn1RcdzhSGbNxOvU2uioP
 s68RG0sX988OCW6p/Go3qeRNJmWMGflCB/pulvnjJZSqvyRVd6NdBvPqYpmqctvPDtbw
 BgsVrFxGYWGdJQz6vrBt1+oRgZPcAZ32bAnkfALV4SKxNxC7i5taGxb/dAWT+jr4GmvP
 EmnO4/lWNUrzNApzvN+z4h7Fscw4G8hoDErt4ieBR5BTiGwR4jMcTLn9O4vSG8731rUo
 bnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98UsXQix7jmh2cjHZ+lRGQpOdqdEegIRaK/uMV/eJ28=;
 b=UBi2Dv03UH+Svj13yS85i3yQGHyQbuDCIjSq8Znh8K7ZHpvovj2ns36X/ISPSqIKBu
 banhkuFYLW2361QX7gEXXIBKOzwpouktGYBmZ/Z9hcNDdlfZh2zN7xmSD28ngRRWRpzG
 PxsVitzYKOppbp3/fJIQJRbBFAahJPD0ohcghejIEs/uT1jaX9G4r3opoILVXQlwTQRO
 ctoryn+c4cXD2d5S5R790RBW9B0UFQe3e9e3TpvEhAWUa3FJ3QDik0Lkshr9JGiFTici
 s0l4Gh6xeYSjqMV4UK9awPjIW8lP2NB9Pd7ziwibyZL4vEjN5ofhpBmiDlbwdDREJZYQ
 2eng==
X-Gm-Message-State: AOAM53369ZpdtS9vIH+u6U7iyphJMX7NVvIaHmlHKOyOkDXMGZkxWTz+
 GVD7Eg5HN9HG+aXKcIsT4anjOaFe75k02cZRWw12lQ==
X-Google-Smtp-Source: ABdhPJyVZBhXbYYrZDmje6PtSvknj4BB+HRS34vLJXFflzTnZA27yZJtw2C9C/1QutOiBbxWkfGYC+mTgT/Zwe/cM/s=
X-Received: by 2002:adf:e84a:0:b0:207:a697:462c with SMTP id
 d10-20020adfe84a000000b00207a697462cmr11096993wrn.312.1649841081615; Wed, 13
 Apr 2022 02:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-10-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-10-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:11:09 +0200
Message-ID: <CAAeLtUDkODLd55EWWKj8PS2sh_TjEO_LDSFik9djgb5BLDJMBw@mail.gmail.com>
Subject: Re: [PATCH v9 09/12] riscv: add RISC-V Svpbmt extension support
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, 
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, 
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, 
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com, 
 Wei Wu <lazyparser@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
 Bill Huffman <huffman@cadence.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_021123_169886_9C1B1443 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, 13 Apr 2022 at 05:03, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Svpbmt (the S should be capitalized) is the
> "Supervisor-mode: page-based memory types" extension
> that specifies attributes for cacheability, idempotency
> and ordering.
>
> The relevant settings are done in special bits in PTEs:
>
> Here is the svpbmt PTE format:
> | 63 | 62-61 | 60-8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
>   N     MT     RSW    D   A   G   U   X   W   R   V
>         ^
>
> Of the Reserved bits [63:54] in a leaf PTE, the high bit is already
> allocated (as the N bit), so bits [62:61] are used as the MT (aka
> MemType) field. This field specifies one of three memory types that
> are close equivalents (or equivalent in effect) to the three main x86
> and ARMv8 memory types - as shown in the following table.
>
> RISC-V
> Encoding &
> MemType     RISC-V Description
> ----------  ------------------------------------------------
> 00 - PMA    Normal Cacheable, No change to implied PMA memory type
> 01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
> 10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
> 11 - Rsvd   Reserved for future standard use
>
> As the extension will not be present on all implementations,
> implement a method to handle cpufeatures via alternatives
> to not incur runtime penalties on cpu variants not supporting
> specific extensions and patch relevant code parts at runtime.
>
> Co-developed-by: Wei Fu <wefu@redhat.com>
> Signed-off-by: Wei Fu <wefu@redhat.com>
> Co-developed-by: Liu Shaohua <liush@allwinnertech.com>
> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> [moved to use the alternatives mechanism]
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Drew Fustini <drew@beagleboard.org>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Wei Wu <lazyparser@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Lustig <dlustig@nvidia.com>
> Cc: Greg Favor <gfavor@ventanamicro.com>
> Cc: Andrea Mondelli <andrea.mondelli@huawei.com>
> Cc: Jonathan Behrens <behrensj@mit.edu>
> Cc: Xinhaoqu (Freddie) <xinhaoqu@huawei.com>
> Cc: Bill Huffman <huffman@cadence.com>
> Cc: Nick Kossifidis <mick@ics.forth.gr>
> Cc: Allen Baum <allen.baum@esperantotech.com>
> Cc: Josh Scheid <jscheid@ventanamicro.com>
> Cc: Richard Trauben <rtrauben@gmail.com>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
