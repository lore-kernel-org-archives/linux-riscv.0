Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B329EC83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ki9bVspAUeWfEg2BZ1bhVrT+UzElXM4USOl8r5fLbAc=; b=H8w9Xaem8nTPQy
	2RB7eIWXgUX0hn0djUpZxgzbPw97F+QIxmp+vTMM2hubGo5ung087s8nNzwsmM0SdgpPI2dsmgX9w
	DCUmBBdKJyxTylJGXMg27CKXDlEJfMWu/RLCe+WUWeJbUm9OUfHq1iY3MFR2SVESzVMXds7dl15ze
	WPN1ATInChaJ1rfOfe2I/PsuyXQopzDsth4XcqPf/j5HSgWfv56XprrBYHaTWbrXfa708eFWYiiB3
	C2sJW9khlwAUgbpmTRVd6lvJ/zF8O0mmRbVTZsIph6UaMNS5fAznBqtdvOzjUkJjrVUrSiJjkiiLo
	cleWjmGjMGqmzlHhMOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaLdi-008PI7-0h;
	Sun, 27 Aug 2023 19:41:38 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaLdd-008PGs-2u
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 19:41:36 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id CDA5D5C00ED;
	Sun, 27 Aug 2023 15:41:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 27 Aug 2023 15:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1693165289; x=1693251689; bh=g+
	iJPw5Gesu08go7evK/1w0iY0bRXNq6fueZB7pdiHA=; b=Yh0r6H2sjNz+QetRwE
	tdtHM3RhKhfzwg7AfQbNz6HhU6bHwBoX1koIF2YDKlTcYBAT5AMRUJqJ8fzzSCCE
	YcvwjrOWlJ9kvBLIgNZ0gPlPdVh3EdEzOQH3zcyXIbmP2mzys1qw5NIMRHfhf+mg
	5plnmY4tizE67Ry+iCkGIQA7vDiZ3poIbXIY4VyBhd0+bC0101GrTZYSeHghoP9t
	rfplb8NcgDeTE31FziDaAn1/S1L7ntnhgu+cId1nxB8RK6THNjBqZGezujNi6vj9
	AjJ+nxv5hStUQps7qrJCX36lls9hyx5P394HQhsv+84ObKeRhB4n07R+z8zrKGIi
	SBkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693165289; x=1693251689; bh=g+iJPw5Gesu08
	go7evK/1w0iY0bRXNq6fueZB7pdiHA=; b=vKqMqukya2R+qB28RxtqsQow7k/bI
	Ic1ZDzREhQcOi4CfqJ/bWVCiBBKrSMl98LBN6I9Ub4hIFlcTIyAh7URXfTSl9/Gn
	VS2eojzKN+Z2/BPvVebUBDDFqZaAG99FTF3WuRZG5F5uMkk3AeLhZCXB+E+DiF3G
	vcAnMOrr2US/B4GO94pIbjKfZJa+YY5BoQbSQd6rMPkWQAWISAnDCeQciU4nAJ45
	wIdOLJ2nN0PagEHdSiyy1slRk5fnUxjU+gJLb1tM97XlnPegAngew8YlthfhBzt0
	EEjQO+IAJ0lG9tCzK12npmYW6Mj5UtvUrh1K8Y50oJXBvsZt1/6rd34/w==
X-ME-Sender: <xms:6KbrZIolZxguYS0y3iZXdgKmCa6NcDItK4P4JMi-EUO-rlbcJ1goeQ>
    <xme:6KbrZOoT054gl5O2fOY5evoznBbcSeVzcT_VUXRwoc_4blVCI0K_Xf8kvz3kbHLKs
    FWhvcA6CiYNmHR9S7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefvddgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:6KbrZNMO3IJmHd-7yuPh9nIBKapz7iX76ROSuBYdGwEoTp2iDmzJEw>
    <xmx:6KbrZP5Na1ZxdWKnpB83baQj-x1UfChlQyCW0lD1FseWJDU7VwcVuA>
    <xmx:6KbrZH4tLppvl4T0A-daNHXfbJ4CJSjD9F2LmsuJJTtaNNp6BJjwaA>
    <xmx:6abrZGSnKF9g2nBMDqydrBrSLXkVQdL7G3VCzJT73VCGZWFX9rpCCQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4B87CB60089; Sun, 27 Aug 2023 15:41:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-647-g545049cfe6-fm-20230814.001-g545049cf
Mime-Version: 1.0
Message-Id: <945c3c18-8295-4013-90a8-279b26d0b445@app.fastmail.com>
In-Reply-To: <ZOsj9HROczmyaS2L@xhacker>
References: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230816232336.164413-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZOsj9HROczmyaS2L@xhacker>
Date: Sun, 27 Aug 2023 15:41:08 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jisheng Zhang" <jszhang@kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Christoph Hellwig" <hch@lst.de>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Andrew Jones" <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Samuel Holland" <samuel@sholland.org>, linux-riscv@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, guoren <guoren@kernel.org>
Subject: Re: [PATCH v3 2/3] riscv: dma-mapping: skip invalidation before bidirectional
 DMA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_124134_211086_26484720 
X-CRM114-Status: UNSURE (   9.92  )
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

On Sun, Aug 27, 2023, at 06:22, Jisheng Zhang wrote:
> On Thu, Aug 17, 2023 at 12:23:35AM +0100, Prabhakar wrote:
>
> The code could be simplified a lot since after this patch, the action
> is always "clean".
>

I think it's better to leave it at the elaborate version, as I still
want to merge my patch series to unify this with the other architectures,
and this would introduce a few compile-time conditionals in here.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
