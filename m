Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E408C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 07:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2+hfj/QjsiTKeaXk5XZc83yrRUsdqzWZN2XW1fTQeM=; b=G8GDi8/0YIqdC2
	tpMbm99ZKtJFveifKYsV2RkVmj4hEKo18l/YhqDjco2NKmuDZVxA0jscZ7tBYPhi6Tajt1mU7Uv+g
	i3ggu4REDNmezibPaD3e42cUA+IgiKiap92ipTiamR8/4LD+TOL3TIugmYc0bdhRwtptrkP3fbQHb
	A9k5RkvrHueNwNHgqtSxO0zoYCg9kIdidMyRp+IOF/Mt7XOtwLOgdGxRy33Ro5ge/pnFH2OojzUou
	diYiL1dquNPObUK5dfYYoxPHQ8yyq0hn7q6jvXG4ixN63SuSPVV5U64EqMb+1/a+OaR60V87aaTGC
	iRE034KyVvUhbnutplmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBol-0000000FxAj-33PB;
	Fri, 12 Apr 2024 07:59:27 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBoh-0000000Fx9e-19RE
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 07:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712908754; bh=gE4UiwTwaZDj/y1D5EUtDgaY6Zh1vXQNUMpz2cuxwAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xEwa/Ep3xHHdUpWbnTVISIBFeSWxE1P6Sg0uH3paR222MDQCFU0COeDOnDaVBngdn
	 PRTmL0FZ0hPbRwzfvZMppPSzUxEzlUmBdl1drYskKc+93RZOv370BagSdtlSPWiOTU
	 feFzeF2lkWQ4ifkN9u+HF3Oz6ltGZHirgYCMHWpA=
Received: from Yangyus-MBP-2.lan ([219.141.235.82])
	by newxmesmtplogicsvrszb16-0.qq.com (NewEsmtp) with SMTP
	id EC914EF9; Fri, 12 Apr 2024 15:59:09 +0800
X-QQ-mid: xmsmtpt1712908749tdf3a543a
Message-ID: <tencent_C7B10C572AA62E84ABF1818F52904DFBCA05@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYSkUDCWdovIJbdRXTBoHzZJsvwt/KXGLaYIhohNB5cj0rYEUis96
	 B4MM6TnQVwXI2teG/zqPf7QLeagvsUXP6EbnNy9qolyR9ELDaoSLqfDbvFRFcbJlB/iD5rMJ9VQL
	 BYIm9j6ZMzkEMYi2rBL+HNQTe14yvQDPCMP+M5dAmsER4GAnvbKQ6UbMmFn4GsCxq5tNswy0MQq3
	 Fg4+5yXSzL8spvZrhJ5Qp8uaUZ75dAZQbcoZUS14AeaGVZr3NhdV84/4kmLApm812Uot2P7Bn+62
	 ej9Efp6uCT6MYtcSmL0EFrypwsGhfdOWWRsajYsFm0PeuS4essy+9qmWx9daFEf+L65E+AeazfPb
	 fzWBwwfGwwBG0wi1f4/CsZycnu5pkpfOyQkhY+kcmRZfbu1Gkhl+FF7UcINAkL5YT/OJWNRtbloZ
	 ZHimNhLvPfkV4KcUoUdFOcsgIKH3QFrknB8eVQVzVni+fp/dt6m1A5s0CXmRH/u21PqGMpDD1v4t
	 Bb0nfLd2E4t/83uYzpsIPlC5ImX3Fa8l2d7vRlUY2R4+3qr7LHm2gmJ2SEC1HziZg3riTNqSxfWo
	 eCgpOk2Q+qdsnsqY+no26TbRo7wOtbXEJk+PCX/2/8k3q1QHM7MsCCteJ46cziMtCBqdXdSYOxo5
	 XWgAJdVR3VV+Uwrs9u8HZ3XfdATJM0Ra9Nm367Ufj9SndZt7QXpWNJIPgAhhM5ekM1/xbETn6VRA
	 xc06JjhXx65doC6pPQS2ZmLLC+K5FEjCzWVB+lNvToaB+Dk6ziIhMJ4QUCfsh3/JUhViB8+BxD+4
	 uuWNq+DTTx+/6D3rYvBavNdmvllhqNu5xx+TXgkFgwXwthGhGqCyI5yq37uuwnDJmcDV/EoZmKRq
	 mohN2+X8WTJWyG2yKqRito/2dPLFs5u7tr7pU14ee1Fa5+aK57UpPSZJ/etfgJfTUWHAfx4OMSHs
	 In2CnKWj+2S1VqQr9x7SM3++aLdp4ILAwjcw6ERWctsWMLIEImFt3I/hiHOB/G1yhgM2sj4VLkLS
	 PEMj6SRBBmnAu7lPOw
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: ebiggers@kernel.org
Cc: andy.chiu@sifive.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	hongrong.hsu@sifive.com,
	jerry.shih@sifive.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	phoebe.chen@sifive.com
Subject: Re: [PATCH v3 05/10] crypto: riscv - add vector crypto accelerated ChaCha20
Date: Fri, 12 Apr 2024 15:59:08 +0800
X-OQ-MSGID: <20240412075908.68485-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240122002024.27477-6-ebiggers@kernel.org>
References: <20240122002024.27477-6-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_005924_399009_38866F0C 
X-CRM114-Status: GOOD (  11.00  )
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

On 2024/1/22 08:19, Eric Biggers wrote:> From: Jerry Shih <jerry.shih@sifive.com>
> 
> Add an implementation of ChaCha20 using the Zvkb extension.  The
> assembly code is derived from OpenSSL code (openssl/openssl#21923) that
> was dual-licensed so that it could be reused in the kernel.
> Nevertheless, the assembly has been significantly reworked for
> integration with the kernel, for example by using a regular .S file
> instead of the so-called perlasm, using the assembler instead of bare
> '.inst', and reducing code duplication.
> 
> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Hi, Jerry Shih and Eric Biggers,

Since this implementation is derived from OpenSSL, I have an issue on
OpenSSL about this chacha20 implementation using Zvkb [1] and see a fixes
PR by Jerry Shih [2].

I wonder will kernel need to port those fixes to handle the non-multiple
block length of the chacha20 cipher? If yes, we should port it immediately
to catch up with the v6.9 release if we can.

[1] https://github.com/openssl/openssl/issues/24070
[2] https://github.com/openssl/openssl/pull/24097

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
