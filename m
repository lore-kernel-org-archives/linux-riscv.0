Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BEEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0IPDzLJPLkVDN06TzlWTdC5Mf7XWdsGKp/QKJ5KuQ0=; b=ej1ZARSwKd8bys
	X4mSboC44OZ9E1gWbuwGgCCRNmU3SGLYHnBSqLjAm5tfIA1g5uwZEp7WjhzMi9JtopnO0u0Kxe6Af
	vkmBjQYtxB4w0U/Z2rnlcDbAZXKunarUYV35axfoYBtxuIuKrKGIkAkUMyGakOnEYcDSAtNNm6xq0
	QlfTBUt6c5Ton2yEg/SIukb4Ul4feP1u5g5fBdpYPr/Qs5DsGmhFCAOWlv2SAYtcvsUX4Kp3Q63km
	RHNKBHJ1PckB0VqvMFHJ3MCrzQA4+sB1Z2wTGGfPmy5JZ861xVO3HBasJrkqLElcoUAJ5v1ACpf0Q
	hZm+gYGdXre733gm2eNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHrDT-0012ys-OP; Wed, 09 Feb 2022 17:57:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHrDO-0012xh-Gb
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 17:57:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2F830CE2250;
 Wed,  9 Feb 2022 17:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBE7C340E9;
 Wed,  9 Feb 2022 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644429430;
 bh=iOxYp/R4z6NyCd4CMctrHVzFrNaRVI37GlqDqEU6psI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gQbP413M18GeHBjrV/vjinZHhOzGZMJZ6pHXdH/yNQLJ675oDAEskxhGDuqhftcSS
 ROlfUZvpjGqjojoJZ85WrCEardNq5D3mMhQDJSzsLO1gH1+Wf8mm4XI2O446r8TmJl
 uTBLjK2DBH8l0wSBzm8XNFzRDlFIW4YFeOSonQd9RxpoFxLHMq3iNCEekd6J/xzAwB
 eecKsemaKrIU95miFZupeAkvItH4v/aoCPxU8wzm2KE3aSUHFi6XdYdUWEoZHdKSJC
 9AMzp8Qcth27749Vdhr8WxgRuyf185fo3c2F+5lD16DF8uIIykAxbJMpzFLQgBOC0h
 bmTTmkqZ4HYWA==
Date: Thu, 10 Feb 2022 01:49:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v6 00/14] riscv: support for Svpbmt and D1 memory types
Message-ID: <YgP+n5OMhQPSbICV@xhacker>
References: <20220209123800.269774-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_095714_930849_4DBD2D82 
X-CRM114-Status: GOOD (  27.65  )
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

On Wed, Feb 09, 2022 at 01:37:46PM +0100, Heiko Stuebner wrote:
> Svpbmt is an extension defining "Supervisor-mode: page-based memory types"
> for things like non-cacheable pages or I/O memory pages.
> 
> 
> So this is my 2nd try at implementing Svpbmt (and the diverging D1 memory
> types) using the alternatives framework.
> 
> This includes a number of changes to the alternatives mechanism itself.
> The biggest one being the move to a more central location, as I expect
> in the future, nearly every chip needing some sort of patching, be it
> either for erratas or for optional features (svpbmt or others).
> 
> The dt-binding for svpbmt itself is of course not finished and is still
> using the binding introduced in previous versions, as where to put
> a svpbmt-property in the devicetree is still under dicussion.
> Atish seems to be working on a framework for extensions [0],
> 
> The series also introduces support for the memory types of the D1
> which are implemented differently to svpbmt. But when patching anyway
> it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the same
> location.
> 
> The only slightly bigger difference is that the "normal" type is not 0
> as with svpbmt, so kernel patches for this PMA type need to be applied
> even before the MMU is brought up, so the series introduces a separate
> stage for that.
> 
> 
> In theory this series is 3 parts:
> - sbi cache-flush / null-ptr
> - alternatives improvements
> - svpbmt+d1
> 
> So expecially patches from the first 2 areas could be applied when
> deemed ready, I just thought to keep it together to show-case where
> the end-goal is and not requiring jumping between different series.
> 
> 
> The sbi cache-flush patch is based on Atish's sparse-hartid patch [1],
> as it touches a similar area in mm/cacheflush.c
> 
> 
> I picked the recipient list from the previous version, hopefully
> I didn't forget anybody.
> 
> changes in v6:
> - rebase onto 5.17-rc1
> - handle sbi null-ptr differently
> - improve commit messages
> - use riscv,mmu as property name
> 
> changes in v5:
> - move to use alternatives for runtime-patching

Hi,

another choice is using static key mechanism. Pros: no need to coding
in asm, all in c.

To support new arch features, I see other arch sometimes use static
key, sometimes use alternative mechanism, so one question here would
be which mechanism is better? Any guide?

Thanks in advance

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
