Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2429C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 04:21:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7243861130
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 04:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7243861130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=m3C+MC51J8xbpCQldG3rQVRATc79ubRvUWb9zvqpwRs=; b=c+otu4llrhF1/MfHlYCClqUzUC
	8lpoiDzIUU/qxvxw3n9qgBagIUPbjKKgDJppS+tSpYsJH8DkEhPVADn2YCoRapXKjxC1Cj1wFB6Uj
	5GXGWACxnWUYvO8mPf2f/0/u68P3KoppBZVtaobhgBspfoJkCyNtAXgzoVOR/NMYD66UAquVgXCse
	JlO3hNDkGqnF/sioBKccgYFJAKx2O2yg3kLAWPZAJ26vjnyaZT3SOHdaZMt8qmWrExEiUeJi91rlp
	QR17//KzsRZ/VaUyeZeoMiIcUHBCzuY+mbIdf4n0x59mhaPimHIEbnUMuM2wd38u7VBus1FMhWzC7
	q4XFWdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1masF1-001VQZ-7u; Thu, 14 Oct 2021 04:21:15 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1masEy-001VPp-9p
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 04:21:13 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8EE74580E8C;
 Thu, 14 Oct 2021 00:21:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 14 Oct 2021 00:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=u
 qzOZZz/9vc/TqZeIFjYvMXtaliYQ5uBgCj+mfMcLxk=; b=lWV2Cka9t1PKMYuyf
 ofDip9RtHUqtnB/80isuPb0hEvPO+MRhBBqmxHTnIJ6wGNlml4ZpTZgi68O3CenU
 w4J0NPIFiWgBbx/3PJcfO7dBHiO1RfV2d8JoLQvNh8i82rxsbJ8bcwpLxmuMvJ0r
 ohmOfgF92mzMP3jmgV9oxNBBYtsISjET4MHuZFgvjwLAMlCykkW3pzjEKgvYAVL4
 qnJJomscyOcyfRAlQCTvhmqqr2rNBYsMj60nbN8CK/ITILZvCdGHi9E87hPUSrZA
 KZOvT5PfE/abacvpQpBn1bZVK926Sa5qtWCnLgjtSHww5wtYiIjUO5nUb+EIfyLl
 4dcTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=uqzOZZz/9vc/TqZeIFjYvMXtaliYQ5uBgCj+mfMcL
 xk=; b=mfhJaY4uAJ6gAdEusHNedUEk+Mnk5hHnaGWnCSC7RiL4yTzqOISpb1iL3
 MlCLnUoMRa9XD3BHE9JIC8RSQfOTymLfi7wQ11uBMz2wzwGwS6ED/35uMIndAI4s
 jB1Pzo2V5Ck1y651ZLUcXfAA99uz+Rm0zBP47D1vVLO7fwnc4kP8zJd/RoFA6/wl
 Dr7CK/+s/9gcD6Ah6MValXgF3F2pP1qGS5w5YMob+nMU2p8UORtybjJK5Jf6pqyf
 fxaVA43lHQCp7a0SAaGoo1vwwJz0pCuS7KCBZ9i4+jQ+6Pbu/KfcHt7gO1crYT+p
 OgouDbhMs3ksZJNFq/S3cjyRppj1Q==
X-ME-Sender: <xms:MrBnYXqgNcyfesEY5VAekg5z7i44BH7TDnBgMnW5b7vDP_0HLH9jUw>
 <xme:MrBnYRoMcSUYLI9xUg_mIJYG-uLiMgjqmV3ruiGFo-5Hm6glsB8ga8oTyluxRo3rU
 TL9Q3HVuUqXhzRgvw>
X-ME-Received: <xmr:MrBnYUPbWS1LQhICO3HS0tfHIuAUYmqjOXQB14LqCEf1RUMtae5GIwLUA8qhTrbBzAgA748gnX8JV1WZ2hXXAvqnxVB--SIo5H9g0maNuWKUAxqYt2pB1a3iEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduuddgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepvddttdejieduudfgffevteekffegffeguddtgfefkeduvedukeff
 hedtfeevuedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:MrBnYa7554oYAxmUaI9FdzofPzlq135aKSfXYxzp3ckCW3VwZCzjMw>
 <xmx:MrBnYW5nw9uYCfEtdR62N8M4oW6w_vTNm6sbeYO99ZjbGCN1qHXTjA>
 <xmx:MrBnYSh6bl-Yh5QrDDhYUs-e3j-ekfGINqEKujaemXcyRqhm_WY_tA>
 <xmx:M7BnYTyxqgHfKjg83eNpaNoeSph4PTnuP2TFQEaqCxLVaXsLck6Neg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Oct 2021 00:21:06 -0400 (EDT)
To: Guo Ren <guoren@kernel.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
References: <20211013012149.2834212-1-guoren@kernel.org>
 <4245323.jvX0RauA9x@diego>
 <CAAhSdy29WAXfBz6Ag-kAjNo_uhJO+AuC0e-UyWhwhaCmrw7pjw@mail.gmail.com>
 <4027415.QZv1u5a1DM@diego>
 <CAJF2gTTDZ0QjY9JL=U61=ubWrGWVOe2VBbW6hgzsHqsePgN0Ww@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
Message-ID: <693a609c-4278-84ab-8a9b-448936bb13d0@sholland.org>
Date: Wed, 13 Oct 2021 23:21:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTDZ0QjY9JL=U61=ubWrGWVOe2VBbW6hgzsHqsePgN0Ww@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_212112_577265_22E27914 
X-CRM114-Status: UNSURE (   7.06  )
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

On 10/13/21 7:49 AM, Guo Ren wrote:
>>>>>>>>        - const: sifive,plic-1.0.0
>>>>>>>
>>>>>>> The PLIC DT node requires two compatible string:
>>>>>>> <implementation_compat>, <spec_compat>
>>>>>>>
>>>>>>> The C9xx PLIC is not RISC-V PLIC so, the DT node should
>>>>>>> be: "thead,c900-plic", "thead,c9xx-plic"
>>>>>>>
>>>>>>> You need to change "- const: sifive,plic-1.0.0" to
>>>>>>> - enum:
>>>>>>>     - sifive,plic-1.0.0
>>>>>>>     - thead,c9xx-plic
>>
>> isn't XuanTie the series containing the c906 and c910?
> XuanTie contain two CPU series:
> riscv: c906, c910
> csky: c807, c810, c860
> 
>> So maybe
>>         thead,xuantie-plic
>> for the spec compatible.
>>
>> So doing in full
>>         compatible = "thead,c906-plic", "thead,xuantie-plic"
> How about:
> compatible = "allwinner,d1-plic", "thead,c900-plic"

To follow the <family>-<soc>-<device> pattern of existing Allwinner
compatibles, the first string should be "allwinner,sun20i-d1-plic".
Otherwise, this looks to me like the right thing to do.

Regards,
Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
