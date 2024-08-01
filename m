Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D51BC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TpfKfzITAZpgNTZVItgr106dByI1ApOTN3QE4lhbQ34=; b=A+3Sz4Cd+JF7idXg9QAciKTflZ
	JeqkYoOgLLYerUQsBC6WtUt5Vpq/aa8ujeT2+Xf0gTOn1K9Xd3YRMaFNb5Lxs89f8JKahR1bmNQNM
	tLgzkDlXEQCncqWHikgrptXsQd97xdEEMepK/844xcRcKbD/vAGyMtNFwDNU1zavTtEF9hAIdxYYH
	sUUstAWGZtkWkCwmqc3JsUF0KJMYx/36pVd2vMqIAgOnDu4jRWbjXI3TosNEQD3vp7YIm9D+i+ML5
	1163NkP+PRvtTvDdgGVDSfWPCpWdpdFEAq/c4Ik3HyQZHKzoKMQqlz0oXrfPHo/dYfoPamkk27g0F
	2pLLFpYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZUz8-00000005CzX-0hPV;
	Thu, 01 Aug 2024 12:32:46 +0000
Received: from fhigh3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZUo3-000000057VP-2nS3;
	Thu, 01 Aug 2024 12:21:21 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D4B64114ABE8;
	Thu,  1 Aug 2024 08:21:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Thu, 01 Aug 2024 08:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722514877;
	 x=1722601277; bh=vV5sdXdNa6xlWYqVfiBfR5jLSm7orJ7WB4HwS9PkwUI=; b=
	LZulTTntvqxgZy5gZdPvC12YoS0nkXO6ut3gaH6T82/hDmBlnapzVpoLVTOyfdkG
	nK/qs0CngjcmukeN+RERJiZsE+aaUkdiO5fMLckMyiIGhO5wiB39AoGi9du2F2kJ
	WunqfIlP3+roqGsMDa7F31JFOVc4B6XOxWvxjU5+mgnjZwXOg4bEFg+7TXOi3qK6
	o1ab/S92hbxHryCxFWCvkhfeENJTZqHP8q6UpTi/szlwyyvr4lfifdlEDqGJVRFr
	7/nJ2qzo11ebmRdAF2Ej6wGByXTvmNsqL+O97lt7SaAMAxero74W52VQ5sbIbyQP
	jhi21kUMmJBpa4lo9BNMlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722514877; x=
	1722601277; bh=vV5sdXdNa6xlWYqVfiBfR5jLSm7orJ7WB4HwS9PkwUI=; b=U
	T2UZhbzClosovJY9C/1iusT39oRq/ULwnER14Tozi3+S1sCTQC3vbwy3EfG6EaUd
	RPtFaAvp4pI+6VID852NkjC6ZFWyfhdoJTUIOp6zyMmixsNG5DHA6rEkFBv7IiGr
	Zwu4BuWmn9tpD6HuzLmM1bDv0Jm5AegqMRN/3ryVrDGlCrX8MJLJQPPu3GvXfEOB
	u0RYo9fahdpaMKOFgZN36zWH6qg921ISdxG1EkrjFLZNoCq3GzTZsA4VsE+mPUiM
	DYFDEcY63+7nRMOCIgjKlnPKp+1LjV34le0G6/8I0+K94sJGaszKWISb61bTi+ZJ
	DmcwUyvvmT5K4Avg6sz/g==
X-ME-Sender: <xms:vX2rZrxMNds7rJoaDzGPkTywNnZLv0WBLwA2baA2XTzTPnf1iO3hQw>
    <xme:vX2rZjSw6EVCJ_B4hNUaFQOllUaEiDZUuqCrNgGo2VGxDwQSgoBxf_paCaTJjm66r
    AQgE3976NjqYjue8JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeekgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:vX2rZlUWslECp0g2ozp_uLXMzrZG6L0gNwC7s4_A-ZZxMiZzRDikyQ>
    <xmx:vX2rZlhMI1qcQJuJHxeGKABPwaFp4exD4-cbLkj-sFUjn6eoTWrj-Q>
    <xmx:vX2rZtBVAgV8gSBNem1bcLWXKyShKPi2gpJbToGrHoqfHINjkNA9Bg>
    <xmx:vX2rZuIFvje9Dfn1aAWbexWiDSiw3TuLbJZu9kpD8dxq4j6zWWmGiw>
    <xmx:vX2rZv1YvwP_b1AMFG2i72yw_lvMYajM8S0Bt8rq6FIHVQ_De0rjuNXg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 95B78B6008D; Thu,  1 Aug 2024 08:21:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 01 Aug 2024 14:20:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Schwab" <schwab@suse.de>, "Florian Weimer" <fweimer@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Catalin Marinas" <catalin.marinas@arm.com>
Message-Id: <838053e0-b186-4e9f-9668-9a3384a71f23@app.fastmail.com>
In-Reply-To: <mvmh6c4fors.fsf@suse.de>
References: <87sevoqy7v.fsf@oldenburg.str.redhat.com>
 <mvmh6c4fors.fsf@suse.de>
Subject: Re: syscall.tbl refactoring seems to have dropped definition of
 __NR_newfstatat on arm64 and riscv (64-bit) at least
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_052120_012062_9E1FBFA1 
X-CRM114-Status: GOOD (  10.02  )
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

On Thu, Aug 1, 2024, at 13:47, Andreas Schwab wrote:
> On Aug 01 2024, Florian Weimer wrote:
>
>> It's been repported that __NR_newfstatat has gone missing from the UAPI
>> headers.
>
> It has actually been wrongly renamed to __NR_fstatat.

Ah, I see what happened now, this was part of a semi-automated
conversion from the old format and I incorrectly split up the
entries between 32-bit and 64-bit.

There is another bug in the same entry, since in the meantime,
we have also decided to make newfstat/newfstatat unconditional
again for all 64-bit architectures, and this hasn't made it into
the new syscall.tbl format. This one is only important for
loongarch64.

I'll fix up both ASAP, thanks a lot for the report!

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
