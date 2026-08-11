Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D17C5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a96IJxdMhLxt6s5ceqQnIf6aNO0y4DBwcKzZY9AreUM=; b=QCSm3U536M0wTpIm2I9cVrgPWt
	/49nukBF2WQS690eWE+cNoM3/m0dIqYHIYXtTYOqUKk2dFjMjPIlWOvKOMQQN2GltUOycs6/0pLnO
	0/S7/xZi8l6QR2Y4dx1XbjPlCYj/QW7Fy9BoRZY8cqs2DWRKPgop1CMx3O2ED8Jaf4otXKntDuSfy
	XM5CBniCbUh1SFFTLhXvHYdGNZpdYCPFXR6PjpYDCGzfH0DbNDaPtGKmxrvla2Or6aploCjHDs60S
	0G0Nn/AWhf6zKSE6pdA0tiW7x6Ax8CggqzpdE+rxa5Z1aEdHN+RyVGyBISZS/C3FEm/DA/+Ap/QQe
	+//ps6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgpl-0000000DW16-0dol;
	Tue, 11 Aug 2026 07:23:37 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgpd-0000000DVxS-3W7o
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 07:23:36 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id A9FBA1D000D8;
	Tue, 11 Aug 2026 03:23:25 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 03:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786433004;
	 x=1786519404; bh=mjk1ikTnqhWU2IVb1PB06tteN87IAutrfgdViA1dE/4=; b=
	TWpq0SfabNoIxXy1lRgnDnPwqKSjN6ciYcKdNAzbHxKOOuhzH7C9py8zMpMqLjHC
	rZCghu7XFkus9YFVhoijJ/LzN5VSg8/DynFzH/PaBKNcJ9EjGZz5g2E+r2HzGFj/
	aUHCrQT70Ze/os6j9vlefETUKQSDrUq5BIInxtYXUg4AMvhJc48+uXFGGEhkYHYL
	CUMDc09GsN7kN5qNknzjWjU7cwMX0m+pkwiTv8L2guHLXSmmLMRt6BrHwnWGoqVH
	3M2JOflvWn0VerYpMeU+6Xm/O4xO35y6K7VjJxliXHsWeiUiziUCGKqQ19EpRIWl
	s+OOuqipaFWERf8xHSzCAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786433004; x=
	1786519404; bh=mjk1ikTnqhWU2IVb1PB06tteN87IAutrfgdViA1dE/4=; b=b
	sDJSeqgtmOScBjCb8XTffJzBY74HjJPa63yaxvrDM/SDl004hARLyMImuj9gGgMk
	mp79fRl973A6MQMxCWvNaKIJlqeyl06ZnKTVm87lb7DvEH/GG5W5RCv+tJrCzYoe
	YlJ+DauWp2xif6U/kuhPHZhls+qkPRhAq2znTtdPDgmg5tMj5TSdwk440Qk9stBG
	gL31tVVn7FNwHSTr38E0hKC/mNLLjFyFmh7cRiFd0gpancOhWpLuuMJblVT3b30W
	1V1o0Dv02dfjTbdBMUS5NnMdW4zm1Sidl+E9gGQ//gfXneYX3nZYi6Kh4FP7Ie63
	W2iakqr69TWimHsb13ctw==
X-ME-Sender: <xms:5816amKkDndRAz58JUrGwu7g4_Qjy6e42E7XVNHWQ09qyzM8VJeetw>
    <xme:5816ao_d0jp1m-XAFrPQPpkItrlboInUtsXi6BsGWZp5IUqSq4XQVdahJ3-m51jZ4
    YVYfei1IRf5BsiyRsp8O9G3NILc3tnWZIoVc9qMqOQhfcGfsaARSJwN>
X-ME-Proxy-Cause: dmFkZTGMr3IWyAVGu6yOYpUPK0kwBRhlEsSmLXG3AuksyBgrFESHsMjP2aED5rtj92h7az
    Cr3RHlGmVxk5BagZwbxXAP+1CRh9ahw+zTGc/OZJir6gP4AFiQK9l64ifkCKAP68hS6KkA
    LggdUjwk+/iTMC3n5Cf+8qk/Lcbwkh6pRHJnWEWro+th0J8gS0+K34ZBKzLQHbwhzDRtSX
    HIYJAqAcpfVPc1XjOksFo1LplybPGLIaq3+bciz8uOIPH52SW4pOHqUsAJeoeB52xtICqa
    piO38LAQVQu+4pflBs39mYzt5qVDSwCxyiQqc+AgrUiTFo3y0od7jD+1cZsNLbg8EJ0Edc
    5d/DpDHbIWqaCMouchUeFBWmTq52SBEc/D7fP3ln5JBhMb/LImxMY1ZfCK9Bxo3kOyhM0i
    URDskWmBz7yCBk/mH5OraLJk1BGXlpkrMTbzk5JpoGZA+kRD0Bbmz8vMDwXYvMHeEATl09
    h4a2nVUzg6zOTX8Qq9jlqQW3wpDOju8+06azVi8W5A4W/LSPtTCDblndgqZls9uF5DWSHU
    kUM0W0c89jZesKg1laszHtUAx5FZJKIDU6agUcFRlARy951nW61rYL+MjR0py9vxFkjEuZ
    oiEvWVfhcTUstoxKZoav78NbSUTn+fdpx829q/QOTR12UtjOtjvt3j3enShA
X-ME-Proxy: <xmx:6c16aqLKUz-OofDzAsboJ34rn9l0jCffYIftqbzwqEWhjwBpeoDQCw>
    <xmx:6c16auLQymhYyXu7M0VioLSrj_Vp1PGJCsvskmnmK0SPrOYZzKP5FQ>
    <xmx:6c16as5MIeUAuca1hfmGzL5cVAsTnGlRuWCVDaOMpc_SNd_Y_XJPAA>
    <xmx:6c16ageoyh6KkGBNoUb4kKru7C9945kMbZNAhKXGMMNCxYRR67LItQ>
    <xmx:7M16asKRK4dCcURaDshitfwZwoTuP7YBMQlt_LFrowlP32G5eDjHsz45>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 548F232A0066; Tue, 11 Aug 2026 03:23:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: APVFqOvuG48w
Date: Tue, 11 Aug 2026 09:22:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Yixun Lan" <dlan@kernel.org>, soc@kernel.org
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com>
In-Reply-To: <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
References: <20260802024052-KYC1424545@kernel.org>
 <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
 <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_002332_644322_7B06EB12 
X-CRM114-Status: GOOD (  12.81  )
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

On Tue, Aug 11, 2026, at 04:49, Troy Mitchell wrote:
> On Tue Aug 11, 2026 at 12:45 AM +08, Arnd Bergmann wrote:
>> On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:
>>
>>> Troy Mitchell (1):
>>>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
>>
>> This commit caused a build failure, so I reverted it for the 7.3
>> merge window:
>>
>>     Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Unexpected 'CLK_MPMU_I2S_SYSCLK'
>>
>> Please make sure that each pull request you send is free of
>> build failures and warnings and works on its own.
>>
>
> The missing macro has been merged here [1].
>
> Link: 
> https://lore.kernel.org/all/20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com/ 
> [1]

Right, the problem was that your patch to use the macro was
applied on a different branch that caused the build to
fail. Yixun Lan should have caught this problem and rejected
your patch before sending the pull request when doing
a 'make dtbs_check'.

This is a common problem with unstructured SoC devices:
If you can't just use the number from a datasheet, you
have to wait until the binding has been agreed and merged.

Earlier in the cycle this could have been resolved by
ensuring the binding change is used as the base for both
the clk driver and the dts branch, but now you'll have
to wait until after -rc1 is out to resend.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
