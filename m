Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22DDEF99E1
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8opmm/LArddv9imDy1Dukp5DsbzNeMmZCJSR0ngbNBI=; b=nvv1/r0vscjEGk
	lGqG6dEHir0PUNFwtXxc1ekLxJM6s020/JX++wC8TmYjzh3vwsEGLnmsNcTr2hNQgawsSkB4+rFOe
	3ft166WQafEnjrE0C8BpUYrh1pJXB3W0610ssUnOxkzcUro1nKwTa1XzzPq46r1qJl4F6i0YmA6D0
	sQDsGKixbpchbtKs6PxW0oJ/Ala8hb0o5bogK+bHJ7AQvINB/cKsHCmmrHGnc7eywnwa9rzgPs1Rl
	Qvg14cCxY4BSmypdCX5vB+nQFo6OeQXARlUK1vio9Nwax1n8iFWdCsuX2OyEzl7gzy4wDe+6PTq+o
	8aNSQ2aS0ddVrKAprstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAAp-00000004Mt6-14i6;
	Sat, 14 Feb 2026 07:34:39 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAAm-00000004Msk-2psd
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 07:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771054470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O3xkBsmvUUGVE6MPJ2x4vGD3WvxiXEtYjPP08hVChjzMP9gA128Y5voKgQRvYHxS+GCOvmORFgK3bzDC8/PIxGhOy7dnYjGhcHUtA+s7SeZm5LR3/C43hbcckLlvThLqxFoeOGK2g5aZjexYtcaPuS0naqyh84Iw9iLh7CC6fco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771054470; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pM6bTMNAFnyU/zKrNO+5TSixuYCPTcb6KSxrsSYYe3E=; 
	b=DL0DFa709rlvu92eCWYUyZ61m/2OuHbuwubEUAPfWkxuWMDuNyMfL+j6WXVFzVlbNmm0SV/35cj+uYtDNFzB42Tf3jeTnD22d2BCsGgZ8/L0q2I7SMdOf1zwMx4zXV3DphRJf7rLt1/jaLsEA3fHUkq+MHR20fO0w5GmD9EhnjM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771054470;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=pM6bTMNAFnyU/zKrNO+5TSixuYCPTcb6KSxrsSYYe3E=;
	b=Iaq3DiBl8+D9WwNSCmlpskHtxMvJnkQLKEwKA1ZkJLSHz8/ciy8pXUzZwKqnAglF
	N2G5kIWBGAMVI+OdGqOEmrteHBmo3SlVhIiruIE2xVDqZeqgcqUUHOwHakI4Fc9skWb
	RbUxuhVJTbICUHkG6v1y8COucLYH3dhkBqWqY0Fw=
Received: by mx.zohomail.com with SMTPS id 1771054462340716.7059044973032;
	Fri, 13 Feb 2026 23:34:22 -0800 (PST)
Message-ID: <283d631f-7cc6-4ec6-9946-5e2120625150@zohomail.com>
Date: Sat, 14 Feb 2026 15:34:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] riscv: canaan: Add support for K230 clock
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <aYNwmqEjvfAahGA+@duge-virtual-machine>
 <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
 <aZAXJOHqrhKh8kd5@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aZAXJOHqrhKh8kd5@duge-virtual-machine>
Feedback-ID: rr0801122753ccd28fa625a4e6683ab79700006a9588579c34442f57bbc5c1a8a289cc5692f38152f1735391:zu0801122727f5c2f7473ee10d47df4dbc000007157993794f1914e991f67fb45e4e3edd0e5b302aced720c7:rf0801122cef56d2341015e9602836b5bb000090f4beeda16d79f5273a2d6adc11df22df92fb15acd57be80f044d50f053:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_233436_779697_203E8FAB 
X-CRM114-Status: GOOD (  11.31  )
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


On 2026/2/14 14:33, Jiayu Du wrote:
> On Sat, Feb 14, 2026 at 12:37:24AM +0800, Xukai Wang wrote:
>> On 2026/2/5 00:15, Jiayu Du wrote:
>>> On Fri, Jan 16, 2026 at 09:26:18PM +0800, Xukai Wang wrote:
>>>> This patch series adds clock controller support for the Canaan Kendryte
>>>> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
>>>> PLLs and an external pulse input, with the controller managing these
>>>> sources and their derived clocks.
>>>  
>>> Hi, Xukai. Currently, the k230 initial series and the patch 3 of the
>>> pinctrl series has been in the linux next. So if possible, you need
>>> to rebase your clock series onto the latest linux-next.
>>>
>>> Then I will proceed with the development based on your v11 of the
>>> clock series.
>> I've rebased my patch series to `linux-next` (20260212). I noticed that
>> the patch which updated the `k230.dtsi` format has been merged into
>> `linux-next`.
>>
>> Consequently, I've updated the `prerequisite-patch-id` for my series
>> from `deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc` [1] to
>> `9a2d01f55574b538dad572e193f81c44661f0853` [2]. Is this change correct?
> Junhui Liu's commit `8cfdbd5e207d434a6e924eb81092874177f97536: riscv: dts:
> canaan: k230: Add b ISA extension`, also modified k230.dtsi. I'm not
> sure if you noticed this.
>
So, should I use `8cfdbd5e207d434a6e924eb81092874177f97536` as the
`prerequisite-patch-id` instead of
`9a2d01f55574b538dad572e193f81c44661f0853`?
>> Link:
>> https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/
>> [1]
>> Link:
>> https://lore.kernel.org/linux-devicetree/20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn/
>> [2]
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
