Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC997606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWsC0pfI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=mdWwyzmu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WuArQmNM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=odAcZ504iqNJnKRys4MV06XkIx/P2H5QhacHFtkSee4=; b=OWsC0pfIgiRoqRmYWH+bS75HoY
	ARA65zdLwx4r4aN8smKERisJ32mQAWJUcWnHfDy8UxZxUdRrmByG5RiylS+b8TTMLPY0+C5S4bAV+
	042eVwLgJD8uJNNnVRNu+zRK0dYOjUg/Brgljw3wfQijfmWDn9ffgkr4wepvrmM2uLvnIktbnkDiu
	AoDZmLNmC1I+uvQhC9inbr8Bj4lpaNp7xFBShxADzr4jruQ3KoTxPM3fceTTtBEpDkceSnYfolJpY
	7A+lGWxNrarmzFR/AY8KgO/NmHI8QeIq3gXca9ga2RLOYI+Cevsa6bXtBjwTze1NB5xdaDs1r0MIQ
	Chnga70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPST-00000009E6e-45jE;
	Thu, 29 Oct 2026 12:42:17 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPSQ-00000009E5y-1iHM
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 12:42:16 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 6F60B1D000AF
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 08:42:12 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 29 Oct 2026 08:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793277726;
	 x=1793364126; bh=d66C6wv4DLzU4mI043VbebszTBlofQJOPgwX8Cd6dwM=; b=
	mdWwyzmuwDTzAvUsxCtWbuMCcTKNS4bJzaY2TEeIJrI7yuOx+1wIj7unZryo+WQB
	XMhpAa1cMaIixs85Y+pZ+n39ksYgSfcGdeTl3QocE/6oFU1GZY+wWZJLzfe5UPrj
	RlxUCaMP7bE6IEXHdu8grAu0AcWetmyHunksqNFfzkLCI7Mi6CwHhTAwJfKHXDPe
	e3Z3SzujDe5G9YaWhA5JuHlyJF3CeRwS3L84HJBtOJaKKfJNPa4hQooyxJgcnCYK
	XcvcxgL6r9Aif9Qgzzu0gvkovzR2Br2DU0YiTbeCmmpo+VlJuyfkkaEsu3ahM2y6
	ees+Y8fHHDuDkAduUCqpWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793277726; x=
	1793364126; bh=d66C6wv4DLzU4mI043VbebszTBlofQJOPgwX8Cd6dwM=; b=W
	uArQmNM2TdA/7IGGj8PR5oVaLYbgV0+e6zFBBnA/tb2D3vszfX+Wbo1Z+KKtli5l
	gAJ6+abnCgQPC7ansT10lcjTIsfVjbCLd6NNYM4126zLf3AuuVJLtl7ZdOS2cmPl
	tQLHLq+QaKTG3B86cdjNS4+1kCjLLctfMiEdEf1qd9PXhFxtY+TUxcNBReuC5T8z
	mrrh0V/Bq5LBWCuiFzDv3BREQFjfiH6EUL9YojdnM5ViGUn3UGG9TJmIXLQc5ngp
	pYQOUfQrGIQREYDkjxMVSb1n4QaDPTZQdRs/W4bi/h4C3iYSv+qw9s3et/4JUeYz
	c+mj6fwLRpDOhjJDAj2Mw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793277726; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:l7Hqk0VROUpeTnCP6gN/EyerlKn19jFp/14i16wYxrpGtAa
	xtQZLJXkQiE/jCjl1uThXO+DpVFSpVJ9zpBhyJFxfXU34DkA0P7NE0qlSEUN6Ta2
	WkyFnCuoWaD2eeogWFCq+mAdiYAoT7FymyTfPVANt6HYHEx0LBSdeuD/9brCyV2/
	aE96qp8eS0gxI10o4jb6PdHLlawo5bvssK8wkMm53tcnPMlizL7YqVQH38H6i+hX
	+BrxTSR0t5TDy/rB5Eob03wLaTN27w6vYw9GAzT5VJ07TXIpmY5bbvbJON39jCqj
	mzz6K2CRpMfph2zofnVPc0fYYYFOU3OK/ql75MA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:pa8id8lezNHZnkKCJdOaeGBTdvPO8v5XG/p8liF/bjw=:zS2WM14JlEd46YHq+76lHPH8OxosPMsFWFrHE0AZa5U=;
X-ME-Sender: <xms:GD_jars-SiAZ94GhE4p5hGsN425X319VhlpSOuAvB0LAROqjAyGhDA>
    <xme:GD_janSL602wCkOQBa2SEr4zFhG4eIMO8EKrbNAwWQFXh8GcwITo-tvIXnuq3t91s
    2LNX1sux-UXIYBpnlfhlpQplJRFIWpWAEkb5bnqK5fMK67C7I5OS9EI>
X-ME-Proxy-Cause: dmFkZTF1xeXukoYxtIemiSr7RmgPQKVnIlQT+D5fkGBom82nl7QChx9FOS7mWdlUT9+ErJ
    kw8oCVFb8WcQicGskO3E4Bh8+FW6iiADuk0vexDdjlt6X6rnIPM/vaAWSAPvg7m32O14hd
    4D6mdwnuYRucC5ycg1z5ZC0g+33fkdixQJ9HuIlbPD33vvSXXoIUXMZOQMIkhblzBPz2Vn
    7Ha5MO8EXCdb4tOozCTfzfSXc6MQGpeRgufwg7Qs3KqpNn/Vbvhv7sWjDtPhqOMGV2TXho
    fhLYxhQuYIqSHePKOBrv13qC0NDIX5Uce4IQBcqlvqWT7EvTBRwO0UPSz2t1/wqZMVf5Cn
    SeLTQy1cF4VBH0fDdeKaDRkjA/3wX1svU9lp9S8/oBjK8016WKz/aMHS6UQ5HgnaN0bY6t
    xaibeWvLblU9HiJXGCl4QjQq8Q7Qr1N1Mbuia8GstGHix762UveSr7WaxKt5RQDa94+WKT
    REql0mFBWF+Zk4InDt1jMYAGzfcfJowE47U6LsU0UVP+dwSwIpxwH0G2GqUD6rwOC1twnu
    6nOMfTmidcHMDvAxPUsoJqNL/9IqnryByrUiikyPrZUsuxmBlyw/HoV37yo32VLdxhBvep
    VBZx4EE37nNZMEGfrSEVJvVvvB/Rv5Ojdcee0+nR3b5Z1dC+aT0kKBQp/2Cw
X-ME-Proxy: <xmx:Gj_jaqSh7hEkubgpWYjB74-ubspQz37C-J7HMabAvLe7G8X6oqIluA>
    <xmx:Gj_jaj7N-fx7uAIOncAl0IKrd2aD2t_4ZwXY3qeB0UT0gsn4Nj8pzg>
    <xmx:Gj_jak3WLme5pxtj055C-QzyS0Ylbif5tgmetW7xpsnzy4QLdxNDzA>
    <xmx:Gj_jagkJWBtj3aPUQBTOXlRTD9KYjJd5p28VQdS-a5WImaSxJDjchg>
    <xmx:Hj_jauxjz1r3cHXoIDfeJxPTV9VljSckPEplyQ2UGA_vJLqeDvPhijTu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 014FC32A0099; Thu, 29 Oct 2026 08:41:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Auj5kB-x7wqJ
Date: Thu, 29 Oct 2026 13:41:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Huth" <thuth@redhat.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Alexandre Ghiti" <alex@ghiti.fr>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Message-Id: <f7533c95-8b42-4154-b76b-7d0dfb56148c@app.fastmail.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
Subject: Re: [PATCH v5 00/13] treewide: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_054214_761760_1EDC8EF7 
X-CRM114-Status: GOOD (  14.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026, at 08:48, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers (and
> also other compilers like Tiny-C or PCC) define the macro __ASSEMBLER__
> automatically already when compiling assembly code, too, so some kernel
> headers are using __ASSEMBLER__ instead. With regards to userspace code,
> this seems also to be constant source of confusion, see for example these
> links here:
>
>  https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>  
> https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>  https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>  https://github.com/riscv-software-src/opensbi/issues/199
>
> To avoid confusion in the future, it makes sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurrences of __ASSEMBLY__ into __ASSEMBLER__ and
> finally removes the -D__ASSEMBLY__ from the Makefiles.
>
> I split the patches per architecture / maintained subsystem to ease
> the review, and I also split the uapi headers from the normal ones in
> case we ever decide that uapi needs to be treated differently from the
> normal headers here and the patches would need to get reverted.

I have started an asm-generic branch[1] for 7.5 based on today's mainline
snapshot and applied the series. I'll rebase once more after -rc1 is
out to ensure this can be tested in linux-next.

Thanks a lot for getting this finished!

     Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/log/?h=asm-generic

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
