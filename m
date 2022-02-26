Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBF7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 00:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Mime-Version:References:Message-ID:
	Date:Subject:From:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=KdpDd5H2u6R8ZrdxtS9/n3aib+NLdWOSLcHjzispKqg=; b=MtNI/mhqPHf5jk
	eDH91SZ98HcpurbmdMdUnjpCFAJOPhzPCkADnKfzq4CcP4mYvZw4sdi+2m1O38HqDDwf23uo+nMnO
	t0mNqSfGUvbKiHXZHn+pKcU5fkWl1Seo3SCaufIA0m77etBBFHnzGOZJMOSvBtAhiEgcp7Z3rYQIx
	4YWxP9crZCBu9VwUITEqiIULd8PFM9/vUaEt+yJ+ivSd1iqD8vvHm2l0xfzrzU/w1v4immIJnv3cc
	mkNsibUdrIWqYPDc8JdoT3cAb/BXelFHbYXW7O9LJs5yn9JCyVgWMsYDs76Ze+J+yuIl4hFfgY1yq
	/DAYna0/oHcCRD+jPPyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOUA7-00APx6-I9; Mon, 28 Feb 2022 00:45:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOUA5-00APwu-RD
 for linux-riscv@bombadil.infradead.org; Mon, 28 Feb 2022 00:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Cc:Content-Type:Mime-Version:
 References:Message-ID:Date:Subject:From:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
 bh=TCWzbcb4zD/ItOYJ8Yl4or6XPsPicfTDmWNHiZfZNsk=; b=joLlK3IPDzB7D51fP6BxYdHjdY
 QN2HGRWmJ1fup80Zxu/Rgg97qQmqdCwZB0AmG0SXCreevfuiXQo5dCJw9KTzYF66TbzFkG+oeDchz
 G2MuPobc9wB7Y2yVXvxWLwbGK3EZHX+AsrOuZbIVF8ZCaFDhPK/U8f1HZn2y/mwF2e+kED3NaiFuV
 LXBENAyZBinLloCNIzAha6FfZZoylEqgZvjPfOTmNgGRawnQn9iLhF9/oCsJCb3Eh6wJB2TdRIx/t
 zJHXTpxsqUbrpvv9/B5e6msvU+WFEEyOIzAxGLPKlWNkI06lW1t/3Z1QUU8ZDmejYuuUj5i53wcLf
 EVPHifmw==;
Received: from ciao.gmane.io ([116.202.254.214])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOUA2-00DjKY-3z
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 00:45:12 +0000
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glpr-linux-riscv@m.gmane-mx.org>) id 1nOU9u-00089o-FZ
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 01:45:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-riscv@lists.infradead.org
From: Samuel Bronson <naesten@gmail.com>
Subject: Re: [PATCH v3 1/8] riscv: Avoid unaligned access when relocating
 modules
Date: Fri, 25 Feb 2022 23:48:41 -0500
Message-ID: <87zgme6xna.fsf@DESKTOP-5JD7O8D.localdomain>
References: <20220224152456.493365-1-kernel@esmil.dk>
 <20220224152456.493365-2-kernel@esmil.dk>
Mime-Version: 1.0
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Cancel-Lock: sha1:mColZ0E90tcqhrcGvi1sG17CQfs=
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_004510_246413_A3EFA669 
X-CRM114-Status: UNSURE (   7.22  )
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

Emil Renner Berthing <kernel@esmil.dk> writes:

> With the C-extension regular 32bit instructions are not
> necessarily aligned on 4-byte boundaries. RISC-V instructions
> are in fact an ordered list of 16bit native-endian
> "parcels", so access the instruction as such.

Hold on a minute, this is what it says in my copy of the Unprivileged
ISA:

,----
| RISC-V base ISAs have either little-endian or big-endian memory systems,
| with the privileged architecture further defining bi-endian operation.
| Instructions are stored in memory as a sequence of 16-bit *little-endian*
| parcels, regardless of memory system endianness.  Parcels forming one
| instruction are stored at increasing halfword addresses, with the
| *lowest-addressed parcel holding the lowest-numbered bits* in the
| instruction specification.
`----
[Emphasis mine.]

In other words, the parcels are little endian, and they're arranged in
little-endian order.  System endianness doesn't matter, it collapses to
plain old little-endian.

(I'm really not sure why they describe the ordering in such a
round-about way; I assume that's the source of the confusion here?)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
