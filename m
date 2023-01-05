Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123FBC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 19:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z86IyhTzfZMO8n8lurRjfEfmOS+9XNegBH0N4V+WS94=; b=NbSKq+5Y0Z2np+
	HxFP/DT09ldPZLjf8UKIjivgX2koUt9Lj3jFhpAD8sHTPzdKCwZqeKCvVlpgEMug1+8Kh4UdGo7Cg
	bKB3bzV7olDUDLwedkTtNzEciZwFeYv+iRqFUenVM1iFW1vSeZ0kM8WXi+mRcqkECMzYcdJ6DRdyj
	dqSPUEkcW7mFtl7CRGN3i2XXvToFvhrkXUStCjWX3RS7yf6l9DSEH0obDSN+whCxsm8pWGwckBT7l
	a4eexXDrJnOrEZNw3cV5c6fldP4vWY2NOz2r5VUujBHiOVu19lQi1xiavXdBJOMYxROiTMUe5g0r4
	4VPf/FFIc/hWMzHgZcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWDj-00EF8q-R4; Thu, 05 Jan 2023 19:48:11 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDMR8-009TF8-6y; Thu, 05 Jan 2023 09:21:33 +0000
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Nngv62wn5z1s89H;
	Thu,  5 Jan 2023 10:21:06 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4Nngv558R4z1qqlR;
	Thu,  5 Jan 2023 10:21:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id BAUSzBWqsYNC; Thu,  5 Jan 2023 10:21:03 +0100 (CET)
X-Auth-Info: ULmWuHDbYpDzw7fgn9yZLoIMWYSx2BoKlnKiH1/oFq17cjDTOLj3zE3OV4yRXdz9
Received: from igel.home (aftr-62-216-205-97.dynamic.mnet-online.de [62.216.205.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu,  5 Jan 2023 10:21:03 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 881052C126D; Thu,  5 Jan 2023 10:21:03 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,  linux-arch@vger.kernel.org,
  linux-kbuild@vger.kernel.org,  linux-kernel@vger.kernel.org,  Ard
 Biesheuvel <ardb@kernel.org>,  Thorsten Leemhuis
 <regressions@leemhuis.info>,  Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  linux-riscv@lists.infradead.org,  Dennis Gilmore <dennis@ausil.us>,
  Albert Ou <aou@eecs.berkeley.edu>,  Arnd Bergmann <arnd@arndb.de>,
  Jisheng Zhang <jszhang@kernel.org>,  Nicolas Schier <nicolas@fjasle.eu>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  llvm@lists.linux.dev
Subject: Re: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
References: <20221226184537.744960-1-masahiroy@kernel.org>
	<Y7Jal56f6UBh1abE@dev-arch.thelio-3990X>
	<CAK7LNAQ-MWhbiTX=phy3uzmNn+6ABZmi49D6d1n1-k-jxcQzgA@mail.gmail.com>
X-Yow: BEEP-BEEP!!  I'm a '49 STUDEBAKER!!
Date: Thu, 05 Jan 2023 10:21:03 +0100
In-Reply-To: <CAK7LNAQ-MWhbiTX=phy3uzmNn+6ABZmi49D6d1n1-k-jxcQzgA@mail.gmail.com>
	(Masahiro Yamada's message of "Thu, 5 Jan 2023 12:22:50 +0900")
Message-ID: <87fscp2v7k.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_012122_439446_DA78C1C2 
X-CRM114-Status: GOOD (  13.45  )
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

On Jan 05 2023, Masahiro Yamada wrote:

> I do not understand why 99cb0d917ffa affected this.
>
>
> I submitted a fix to shoot the error message "discarded section .exit.text"
>
> https://lore.kernel.org/all/20230105031306.1455409-1-masahiroy@kernel.org/T/#u
>
> I do not understand the binutils commit either,
> but it might have made something good
> because EXIT_TEXT appears twice, in .exit.text, and /DISCARD/.

I think the issue is that the introdution of a second /DISCARD/
directive early in script changes the order of evaluation of the other
/DISCARD/ directive when binutils < 2.36 is used, so that the missing
RUNTIME_DISCARD_EXIT started to become relevant.  As long as /DISCARD/
only appears last, the effect of EXIT_TEXT inside it is always
overridden by its occurence in the .exit.exit output section directive.
When another /DISCARD/ occurs early (and binutils < 2.36 is used) the
effect of EXIT_TEXT inside the second /DISCARD/ (when merged with the
first) overrides its occurence in the .exit.text directive.  The
binutils commit changed that because the new /DISCARD/ directive no
longer affects the order of evaluation of the rest of the directives.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
