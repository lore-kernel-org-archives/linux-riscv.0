Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA3DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 20:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvJBZJ508NgXqh6bQhpjTWQCed4xpQX+IAHeXDpzFIE=; b=a2kABJuU1LPMXO
	Gex7Pcv0eZojvQ4R7/XZ6+eJaGnoMfFlPyirigtvFry2sDOeTd03BykgdP9wfGgMxPk6ho2T8m1fa
	DVb1J7qoeU8eDpHwbluoeWQghg+f4O+TYFKaF1uKsi9a/jc0MMIcJJD+ownzvVNzN6gUAuyOzdQoA
	OY0980MJ0tZ4wZ5lHT8urfnggjOgW1+7yYHMaywEweYMV5rgL5Nvx7+R4AIUWYWgm2yhoqKLMpwB/
	abXk+2fm+M44KkoSJWikRZ+cwFcx87KMh7uOTR4TNJrioMWnRCTkj3Uj+lXjoQo9m8AJcrCdDmODm
	NqEomFhf+e5UjGG0buUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oufeR-004SC1-MN; Mon, 14 Nov 2022 20:01:51 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oufeO-004Rit-KO
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 20:01:50 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 48A305C0126;
	Mon, 14 Nov 2022 15:01:46 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 14 Nov 2022 15:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1668456106; x=1668542506; bh=Uh4z82OeeJ
	CY391PJMB2O6cIWSrN9pN0bMGVUehX9XA=; b=aKGLZqiSzyEWA8uEYG1SGfBvbK
	bjVDHEDNxslnST5sk6dHdrS+HhPhlBCTpmAbXJo5PtsbkOpaU5fNWuU0ARIp1/GO
	7wtyNDYBTOIXyK7LHKX27DRpuqfP/L2/2KvlSftBDaqdjckFf18lIKi9OfslShbG
	+SCmRlLFXp9IDgRK0Grb8esXn7QJGzvKx/QX5P/3ABuQK+/BcxmxwmDXb6K+8Qg3
	jpcONup5G41oOMuYTqAfFAbsXxK9Xr+WfsLh1nENt3jJ+zM13wyM5Wu2392y01Km
	VlOexpHP4GPllSb97uRcCX7AfzjwPx11yJvmGabNndbyGCSF/M0z3Uw3IXPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668456106; x=1668542506; bh=Uh4z82OeeJCY391PJMB2O6cIWSrN
	9pN0bMGVUehX9XA=; b=YpkLj2IG49Fu+K/t9iPppTyqdqSDRQ27magfNoYSjM+B
	+Pm/l5fwgMtL0AAs+vAos2KI1+iIJ/MXZmeZQikFlZd/5BZ7Za8ibuAPqoxvIW2B
	5Y5y4B+Fp/ag6nmagRTUDoACXMas2oqiaT0HvJr8PG5JCvkAEmr3D5dWd78W0m2X
	HL2yPP+nX0yEN8YIq7jsJC53lTazzGUZkEWofsHuKNuZmE0YmNnE8uoRGH7Cbbwn
	q31ACXYt2HJhx70LABFOHx4VYSnmqyGqxlvNSGsJMVeDBn36Jc01ilmHptcV0MoZ
	m725sgrR2mB7QRR1Jzqk6kcykfxKv5PE0Aqqw0VlaA==
X-ME-Sender: <xms:qZ5yY0-IN-hGQhxi-NUgBAzV31_qaRyXrXPDhvkKKspdoUmr996tbg>
    <xme:qZ5yY8sf5jb7_5c7mnk8jkEfud37ra5E_84BJdDD-8n2LYeeQPaVvOhPNAyRRgrG0
    vendEVtTXhjKArC6PY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:qZ5yY6BDEHFmwQ3-tCTUEMtKFXsOaeGFcuHrqMfTjkR1V8a5VFzn-Q>
    <xmx:qZ5yY0f3ER0Y3FiQT-0qdU-452w_pnMpfsLazqyZbyA3UJXpqa8KSA>
    <xmx:qZ5yY5PXh0gpPV3WBZwNOnVpzOYBnhf0CRny-0ElqsUqWeYZGBV8jA>
    <xmx:qp5yY-lW53LRVty6PD00DMViHNCdudwyqtLmEuVnPoaoeA4Io2wWEw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 65B7CB60089; Mon, 14 Nov 2022 15:01:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <c2de4e7a-9e17-4cc5-8891-baa5a8040e43@app.fastmail.com>
In-Reply-To: <1634d6c4-40fa-1298-efa2-c606b1e57fd7@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-9-stillson@rivosinc.com>
 <1634d6c4-40fa-1298-efa2-c606b1e57fd7@rivosinc.com>
Date: Mon, 14 Nov 2022 21:01:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vineetg@rivosinc.com>,
 "Chris Stillson" <stillson@rivosinc.com>
Cc: "Greentime Hu" <greentime.hu@sifive.com>,
 "Vincent Chen" <vincent.chen@sifive.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, guoren <guoren@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Andy Chiu" <andy.chiu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v12 09/17] riscv: Add ptrace vector support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_120149_005738_8AACD46C 
X-CRM114-Status: GOOD (  11.39  )
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

On Tue, Nov 8, 2022, at 02:38, Vineet Gupta wrote:
>>   static const struct user_regset_view riscv_user_native_view = {
>> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
>> index c7b056af9ef0..5a5056c6a2a1 100644
>> --- a/include/uapi/linux/elf.h
>> +++ b/include/uapi/linux/elf.h
>> @@ -439,6 +439,7 @@ typedef struct elf64_shdr {
>>   #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>>   #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>>   #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
>> +#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
>>   #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>>   #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
>>   #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
>
> I think we should break this one out as a seperate patch to be applied 
> independently, avoid merge conflicts (but this file doesn't change much 
> anyways. @Arnd or is it ok to carry with riscv change ?

I only saw this by accident, sorry for not replying earlier. Yes, please
keep it in this patch and merge it through the riscv tree.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
