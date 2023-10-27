Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A1AC25B48
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 23:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLYvthNeNEZC419H6ORd2s0K87Tnp8KpVUcAz22f748=; b=RZDJS/3EPV6wzY
	etvK2TtxXy84y4i2EDH6vzVxmKTR3VnW73sY0wCJtHUGXIRPnpaW4c7qeGMTxsTyHV+u34qezDXpM
	HlKP6zb5nP3v8UtTMpGxgfXpKK9cKb3ZyhpQqiMN4E4TadDnOZ4BZopO7R6T2d/2St284Z8P8dUE7
	4yb/ahvS6HYaCHDjfyLBf0q5j01KnXX4Fl3YsROJJREYNRscPLHXWe4F4/jetIz6Jmp0MoGGpsPcr
	2obwd4ymCHBQ1nBvFxNYlWiPNptIPbK6LXfYEKMDp0FasZuLIgdJyWwdZUHA8AnqNgCRpXuK9jGPw
	SH2uw7w9y6bSEUx63OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVyp-00HM9K-0m;
	Fri, 27 Oct 2023 23:11:03 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVyk-00HM7g-2c
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 23:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Aiw3atUCBnwgKNjOyjIprjoAJkJHCnLAHdffktGkr7w=; b=jEeP1VubOumA8I5tSAeXitLq9S
	XIjPJuii+LyAYcPZzu/YyatcPaREiQsauZJpKoDR8tKyT6Ry5XSpXFU7MnpsF5aF0pnga1UiB12O9
	blIxP8KjQ8abli6qVNuqcpd09O9gvHbqO8ADxmPKJHqhfeQwjvX6vWeOXcBBJDfx0PH8yWGzHxfna
	09cFAhe45cuJAfv31j2naLwl81N6OvJLVjsbZDDdY96DlRwu7uSWsqY7A/SIDbx6dNUI+8Fmwsq2I
	3A0oRt+eyWSv5DJs6Jvslfb/QF96Kyg4bbcmV1c9fz9cl9p25bnoedefZPNeN6OAosGDVOzuw6ZHx
	UdsrziBg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVyO-006mQG-2S;
	Fri, 27 Oct 2023 23:10:36 +0000
Date: Sat, 28 Oct 2023 00:10:36 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8 1/5] asm-generic: Improve csum_fold
Message-ID: <20231027231036.GM800259@ZenIV>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
 <20231027-optimize_checksum-v8-1-feb7101d128d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027-optimize_checksum-v8-1-feb7101d128d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_161058_854801_4611AF92 
X-CRM114-Status: UNSURE (   9.02  )
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

On Fri, Oct 27, 2023 at 03:43:51PM -0700, Charlie Jenkins wrote:
>  /*
>   * computes the checksum of a memory block at buff, length len,
>   * and adds in "sum" (32-bit)
> @@ -31,9 +33,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
>  static inline __sum16 csum_fold(__wsum csum)
>  {
>  	u32 sum = (__force u32)csum;
> -	sum = (sum & 0xffff) + (sum >> 16);
> -	sum = (sum & 0xffff) + (sum >> 16);
> -	return (__force __sum16)~sum;
> +	return (__force __sum16)((~sum - ror32(sum, 16)) >> 16);
>  }

Will (~(sum + ror32(sum, 16))>>16 produce worse code than that?
Because at least with recent gcc this will generate the exact thing
you get from arm inline asm...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
