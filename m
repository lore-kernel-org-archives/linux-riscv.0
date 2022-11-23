Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18353C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 05:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayMQpcD2GSUwfPatHGbekFGJald7DC3Mb6KplgNNEPU=; b=vUk8nJS8Y4z8v5
	tjotA9IqRg33Ve5YBaPoEZtPTArExSePVrsgbjq67qcfGFjUQMtbPVaM0kwl2c3B+bmmN0TBiVcww
	XcHJpduVtHJw9BEvQROxy4P6qisTXVUKqEKnwNS9we7n1HLn4Gzongno9pjle2Z8L66DN4ara2pKn
	8vfo5Vx3Jo2cfTeKnQHxwjV174efER0/xtjj57tD+DebTSZ8isKb2qxecapUwKEYmpy9qY/7aB+//
	8e+H5JWUMzzejml6tCDOsvjcE2I+su9iT6/Zmd6J3cJ9e/2xkh7NSNoW2PqIeqW7U9xp51KchuATK
	VC7TtBpLCMVCONmhyLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxiTN-00EMDt-IW; Wed, 23 Nov 2022 05:39:01 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxiSm-00ELhF-LB
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 05:38:26 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id AD25D5C013A;
	Wed, 23 Nov 2022 00:38:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 23 Nov 2022 00:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669181903; x=
	1669268303; bh=b+lrH+QMj1sidBK3NzEoHaF2wilAWh8S7o4I69zVMpk=; b=c
	Psy6wTltwsDiZuEhfF6aDH2A7TEWAsJD6BfAGsgNpi58OummEuI1MytdBNUq26dm
	PTwtupwXDgN4QfF0mwjG3lgl46c+qWqAE7fElqqFJpTS+r/y0ou4ynW7Rb5rEibP
	9Uo3GaEwP0mYrKCAse8ey0FS4unu7VP6KbXA8oPGqEV58GD1SGdR557/NWWmEOHU
	YfnmHd3aQQMH82vJUsw9Vy85N04Fy2dF26RGttee4ExV0QGJyormQyItIZ+JUD5Q
	GJ7sGGzLhezSvdEMkQ77eOTikP994vTW+BvWrl1WaZxOUjhALP5/F3SJgwzJCqai
	OPiEdkrb2BaJbqc8vewbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669181903; x=
	1669268303; bh=b+lrH+QMj1sidBK3NzEoHaF2wilAWh8S7o4I69zVMpk=; b=M
	IxBMiyqJjBxAjJX9w/ZtRVb/kyGpe+tDUIu4V+7QinA2TwAbqLFcg9WHP5oWi2R8
	IHGTuwwMPqq2cwmgZOkeTNv3BCGWLmms5SGVtB6EtSTbMubid3pjftwUOyQBW8Eq
	b4ncuHpx/SX7+tYxaPi5YGgfkq0xvlW2goHmjUKQlozHYQS4aV8c1gVda8dbaTb4
	EHi3iwmtBklLItezSSpmloY+EWYLwxnPu4Q7t7752zRufkw++e0CyID8P9ePzfrj
	2aIg2Q+jZMae8ml5mKDsYsMF4foy/Zbs/sJSG8BSi9khxF+tOTI/sj5Smv39iVv9
	TRKaZqfgtdYQSYdgzRpyA==
X-ME-Sender: <xms:z7F9Y1biPa51tdIDlLKFnkl6xiMgNCkKeU4TdqSMbbsq0Sw5_NEIHQ>
    <xme:z7F9Y8a-8EwTP1ZQUNdndpT-tCZHqHN2xcIiwSAzHlHcQHB9iNN6GgAeoNcFiEu1f
    81pZr37_6AQmIKGyg>
X-ME-Received: <xmr:z7F9Y392z5emSsGk03SxUXn8D8lFjFkYjm2I2XsxzPHEi3MCt7oV6jOiAZWUCHYNUMSwduBhsZoDu-vTX6e4qtUc-VMeeva0_QREB3Vsomqh2llIVBiDDkZOFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedtgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:z7F9Yzr6wqs1evL-Xx_ulLBHTlyRPi29wcZuhWHxEifiwBI2QADWPA>
    <xmx:z7F9YwprkISaCtLOc-SuY2LH38Ga8BJIytmCMui-coqHF_wsQhgtmQ>
    <xmx:z7F9Y5QrxwujqUQV0ALXbdg_i-27kfcQpB7GWkR9yAjHmPQUN1emmQ>
    <xmx:z7F9Y1RLjwmuuYfxAwrLoPErs42jb9dGki_zD5bu_VkPDF22iGR2Vw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 00:38:22 -0500 (EST)
Message-ID: <a591599e-d133-e19a-4898-5645c3862daa@sholland.org>
Date: Tue, 22 Nov 2022 23:38:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, conor.dooley@microchip.com,
 anup@brainfault.org, Conor Dooley <conor@kernel.org>, rafael@kernel.org,
 daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com
References: <mhng-6299f108-11af-4e70-9981-d7e7b3be0b9a@palmer-ri-x1c9>
 <57114829-c205-dece-abdb-1100947286d4@sholland.org>
 <CAK9=C2WLOa_zgboFE5UCgnwMB-kbWMAVtmXsBxoswqY63-5QHw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <CAK9=C2WLOa_zgboFE5UCgnwMB-kbWMAVtmXsBxoswqY63-5QHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_213824_813686_0D6767BF 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Anup,

On 11/22/22 23:35, Anup Patel wrote:
> On Wed, Nov 23, 2022 at 10:41 AM Samuel Holland <samuel@sholland.org> wrote:
>> On 11/22/22 09:28, Palmer Dabbelt wrote:
>>> I also think we should stop entering non-retentive suspend until we can
>>> sort out how reliably wake up from it, as the SBI makes that a
>>> platform-specific detail.  If the answer there is "non-retentive suspend
>>> is fine on the D1 as long as we don't use the SBI timers" then that
>>> seems fine, we just need some way to describe that in Linux -- that
>>> doesn't fix other platforms and other interrupts, but at least it's a
>>> start.
>>
>> We need some way to describe the situation from the SBI implementation
>> to Linux.
>>
>> Non-retentive suspend is fine on the D1 as long as either one of these
>> conditions is met:
>>  1) we don't use the SBI timers, or
>>  2) the SBI timer implementation does not use the CLINT
>>
>> And it is up to the SBI implementation which timer hardware it uses, so
>> the SBI implementation needs to patch this information in to the DT at
>> runtime.
> 
> Rather than SBI implementation patching information in DT, it is much
> simpler to add a quirk in RISC-V timer driver for D1 platform (i.e. based
> on D1 compatible string in root node).

It would be simpler, but it would be wrong, as I just explained.

Only the SBI implementation knows if the SBI timer extension can wake
any given CPU from any given non-retentive suspend state.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
