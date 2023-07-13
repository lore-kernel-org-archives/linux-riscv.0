Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49F2C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWk/kAAXQs7p9XIGjkTnOAqIP8vkhlNPXiz/0zMWt/Y=; b=FKexFU8BSkSfKE
	TQ3jgv4NjvwO6rM0yjJvD2NoK8wk8/K9Q9eWk57Ix5o4pV4SYl9FZtl0RbBZvKIS2JhSpQUDK3DCG
	dYdNaYPu8MutJuTNIWaqgIJkfbHw2/sgjRzDr9+Z5QOdiVl97mAOUs/67gI84PBdhDO90PscJ5Htc
	RgsbCuMoxCPK9S3wKlhwmWmB91sNcJKAW9lgls1JwZKo6lZKX2BYkY/F55/QW0ciMe60ApOnJSYzJ
	4T86Vi1h4BngcpPslq+BNbR3WfvJw7Kl+R0scZ1axjFo2EU85MjYFrQDSyQpbnyVeNeVY4LmL6COF
	Q+BRXVjmFiUphMLN6faQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqwS-002GI5-2e;
	Thu, 13 Jul 2023 07:40:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqwP-002GGn-33
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 07:40:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA48861A2F;
	Thu, 13 Jul 2023 07:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33FFC433C8;
	Thu, 13 Jul 2023 07:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689234044;
	bh=ZeYQt5UvSlhe1NHH6yAx8d1WYyIsDq5HDEW6CSYAWPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EoK+UWr4IfpcsXelXoVTZ9cGRoRqml9D8UwN3K89TWkFQ7y2fwKN2Fm7WD/wY33+K
	 e4mr2cfZLPLBG/5Kk2AWHqHYwG1Pjs7HnF3y9XzaeF2w781hNI1tY6Qw2XZ5nW/oNf
	 EpRXACuRw3cu6A23FPlLs1nW7EWbXesVkfRnA4omLg62G5oBy9uFXSFloplQ2XqPW7
	 i0G/QcCLLUhi5q4IYUgFai0KwfCzUMTA88F/TMA31rarA42hdHevIk0gpF05Z+n1WE
	 XmtbvKsFqwPI0j4mFdPJO9ZbM3o8AjQ0/wjg/sndP5IvA/5mE7kn33TECEsrBlQg+F
	 6WtBKn2iaxvFQ==
Date: Thu, 13 Jul 2023 00:40:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20230713074042.GF2199@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711153743.1970625-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_004046_054207_E394DB7D 
X-CRM114-Status: GOOD (  14.36  )
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

On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This series provides cryptographic implementations using the vector
> crypto extensions.
> 
> v13 of the vector patchset dropped the patches for in-kernel usage of
> vector instructions, I picked the ones from v12 over into this series
> for now.
> 
> My basic goal was to not re-invent cryptographic code, so the heavy
> lifting is done by those perl-asm scripts used in openssl and the perl
> code used here-in stems from code that is targetted at openssl [0] and is
> unmodified from there to limit needed review effort.
> 
> With a matching qemu (there are patches for vector-crypto flying around)
> the in-kernel crypto-selftests (also the extended ones) are very happy
> so far.

Where does this patchset apply to?  I tried torvalds/master, linux-next/master,
riscv/for-next, and cryptodev/master.  Nothing worked.  When sending a
patch(set), please always use the '--base' option to 'git format-patch', or
explicitly mention where it applies to, or provide a link to a git repo.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
