Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF2AECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9e+TW74hVYboGw4GbxPxZQx+bhSSPZSfdAHOJQx86A=; b=Ye2Vc/qiOcvvTQ
	6J4AZN2QsnLWMPQMyX2d4Kna/3hnSSyKF1bceM0whP4YLnjkH30ecwIgEziPwHSfIT0+20dFAaroc
	TORkrRQb7m0ht45HhxIKS0490jt44QuJQEGf4NWG4HYLA2dTYMW/2VUbWziw830ZceEV8g53GjG92
	wEwJ73tJEsWavlXGjWTcLXTjtN1pS3MClvN/ds3ISFovkkqj9wJRxtMOHFo3Fcg8TRCMS/dEkz0Z+
	tbYOnlf6ZXW123DS0aTW3FEvBCpGS0dcAusf7iMZ/cM4Geh2toryxNusD4pf34LAXK10aewD+uk+T
	TTlCKRCTJBn2A9+K5/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obg2t-003gwh-UT; Fri, 23 Sep 2022 10:36:35 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obg2q-003gvH-Ve
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 10:36:34 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 4D303580B87;
	Fri, 23 Sep 2022 06:36:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 23 Sep 2022 06:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663929392; x=1663932992; bh=8ZYpe7XeT8
	FlyFC9e+LWprOH1EQh9rPAyx+toWGSAIg=; b=C0uKAyh5/Q80ptL9ZwKe7u9zK/
	TM43WoY/KFp1v96GL/LXevi4mnPDn5cM8WidNl4AaWH7GtrMWvyPih2+P2z9/CgB
	j/bGIqyGX+X3rNJM45dPySTWID3CPB3hYBrJRO+W1IeqRKkPnBRMYSlXGm1XaDS1
	LqysUf2Kd+FlQ6wYCIrNIcYpUtXAwJ9w5CpmvNqvtFqDyQiRAPp/M4gs7XxbR6WQ
	vXgg8sw2EwCgM76zEz7Bf3iAk6dxC6dKXzr/e+KFFQyaUXo4j6H5K5TOJBg+WQi9
	fzzZHpyE4GuyN560HNik92I53Z7SCEIMLnVx+VpJW1X3svXJEqlMc43Z5mmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663929392; x=1663932992; bh=8ZYpe7XeT8FlyFC9e+LWprOH1EQh
	9rPAyx+toWGSAIg=; b=Vhgvk9aOvM9/nEoVRkZG1553EhClsLuKcAzjL8h43FEd
	vh0go7loZThAxjYHy9AS1fAPH8lmd9XTgr9dfqGzhIjblIUhbln9ysWmjX8BWbsW
	e9EB+fkrpaRR2KGu2Mrc+5k3q4bhcmsnkB8krBIlCAZz0EVr5FzATyqMuWHU3vPb
	438vSrcCKzH5hcmENSb+j/LlSNE5Jf1B8IGFgQpSdGwMVsZwVbcAKO+GqQSNphoE
	VAH7gvGLjP+PjROM6MM6Y0vcFo8/YsDMsQ/rmyi9xBZJB9sdt+QJEUnwHTKgAxIc
	wY+1RMZ0V+J4UQIxYp2EevofZpFt71JY0GVBlKOjBA==
X-ME-Sender: <xms:L4wtYyidkLJr1-L1UrVFc0SMv175WTIs5fR5HvP_109YwAWELrMNMg>
    <xme:L4wtYzD2ms2Qc-7eWLcABiIx6I4WngeO3XAj9GuP2EIzD9-sCoTFVQpOceL6QGyzP
    RUFoQNQhYdrC9JbnWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefiedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:MIwtY6FKyk-mG8Fw30oh8S1_hRppzLPQsvaAeatX5iE-2PYDzXZjQQ>
    <xmx:MIwtY7TYfWd7fa8JTH7G-c6JretI6bIKLGDar51nNhZ2aXfQD9TGBg>
    <xmx:MIwtY_zAejuuPN6Tt8pNiElK5fWj_o2nRTBM2QwrSrYz5jM6cNAhiA>
    <xmx:MIwtY2mcf1lvM4J9Mt_dMEgqm1vhamyaumAyvngwqUMNTfjmjndtxw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DCAABB60086; Fri, 23 Sep 2022 06:36:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <45de6e04-b19b-4ffe-878e-6ba8123f2aef@www.fastmail.com>
In-Reply-To: <mhng-37586d5e-5576-448a-8d9c-4d277c252365@palmer-ri-x1c9>
References: <mhng-37586d5e-5576-448a-8d9c-4d277c252365@palmer-ri-x1c9>
Date: Fri, 23 Sep 2022 12:35:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Anup Patel" <apatel@ventanamicro.com>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Atish Patra" <atishp@atishpatra.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, anup@brainfault.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 mchitale@ventanamicro.com
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems
 with Svpbmt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_033633_102307_1C0FF4B0 
X-CRM114-Status: GOOD (  17.18  )
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

On Thu, Sep 22, 2022, at 6:35 PM, Palmer Dabbelt wrote:
> On Thu, 15 Sep 2022 19:24:55 PDT (-0700), apatel@ventanamicro.com wrote:
>>
>> On Tue, Aug 30, 2022 at 10:17 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>>
>>> Currently, all flavors of ioremap_xyz() function maps to the generic
>>> ioremap() which means any ioremap_xyz() call will always map the
>>> target memory as IO using _PAGE_IOREMAP page attributes. This breaks
>>> ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
>>> remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
>>> page attributes.
>>>
>>> To address above (just like other architectures), we implement RISC-V
>>> specific ioremap_cache() and ioremap_wc() which maps memory using page
>>> attributes as defined by the Svpbmt specification.
>>>
>>> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
>>> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>
>> This is a crucial RC fix. Can you please take this ?
>
> Sorry I missed this, I thought it was just part of the rest of this 
> patch set.  That said, I'm not actually sure this is a critical fix: 
> sure it's a performance problem, and if some driver is expecting 
> ioremap_cache() to go fast then possibly a pretty big one, but the only 
> Svpmbt hardware that exists is the D1 and that was just supported this 
> release so it's not a regression.  Maybe that's a bit pedantic, but all 
> this travel has kind of made things a mess and I'm trying to make sure 
> nothing goes off the rails.

I think generally speaking any use of ioremap_cache() in a driver
is a mistake. The few users that exist are usually from historic
x86 specific code and are hard to kill off.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
