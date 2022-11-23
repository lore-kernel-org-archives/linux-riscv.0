Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD82C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 06:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYSX3fPUAqzpAL7KJFrcIA/RclMhnvHEnlkwi50rNnc=; b=glkoF34EP2ybnt
	EDOw3h/Su7rYk2ixEAbX3Dxvk0bdoJVLf5sSBnEN2kC32GMaUQ7XFu7/xF/kGio/G1V8qOvZgttKZ
	T1enx1QA7KIObk1kLxSAthaklWMQ0Ui+VNZ0aJDEHIr9h8qdSPXJSqs0iOKb1OtxyXWiwpyJeYolZ
	Yd1imvlAhGTlZltYuK0Yk1Iluf9tUu5lCfw79APao9WlQWpJVqKQtDX1QOoxbACxVftXw9K8JdiFF
	NHHadCASyLVA5/gvokM60GCmIm7ErNctyInDPTWz+jpIqA1drHQ5xfv4uEQWTSH+mIuRTCzHdthjS
	Us0Pyvfx3dvA2vFxpt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjL1-00Eki2-M6; Wed, 23 Nov 2022 06:34:27 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjDx-00EgGa-Ur
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 06:27:11 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 3CA2A32009DA;
	Wed, 23 Nov 2022 01:27:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 23 Nov 2022 01:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669184823; x=
	1669271223; bh=oHgSRmKeOusW4dOp27SLOKm9zx92qVB5j/X1Qijlkfs=; b=P
	CBPSeGKfMdJbciVtL9tEnAGoXcEr+ncp/EJqeGlGenbqn4lUW8FEA2lu/TE1cGnr
	XFeQegE+tCsrC64bAxVBaobrujzxW6txD/ceCnu59QL1G57myk2VPyXbgn1FlgfL
	qB/oiQ20X0MY1YWWndB9anUjJxtb0JOpiQBWaAM18FqIQ67Pvdrm8SIY0tYQzg9d
	R6igLCaIJ8wATNI6YY55LYCXl/YyxK+7ehoU/AMGqz9811VGO+l4esEH19fXtejQ
	mqnuahBFHUbF9b01s0vdPHpSyHWLDXJfkNxNwXoNdWYyUn9sYb/JdP0G5TKPXj1W
	4dwtSnvBMixvR03PJvFhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669184823; x=
	1669271223; bh=oHgSRmKeOusW4dOp27SLOKm9zx92qVB5j/X1Qijlkfs=; b=s
	fNUSfpRHqbkumGAdeYJmheGd5kHGpCLvK31tYiT24BZji//qvD0QxnTlz0e89qcU
	scOEUe/swxIpk920kQP2pHVBIMNLHJP+RG9MTFTpvqr8aRAGws+mo3/DA85Dblrf
	ma1O6GiC9A/IhVHBTMcthCbNdElvsmUhZaFFqmAAlevRkxn8MqojuZGeEW6FArl4
	S9zaeX4Kbxw8b6T9suWtJyOP9DCUnDXLf4BbPAqohLAbF0yUj1Vkqz9cxUUV4FO3
	N0iluIfAJNodjIe8eSavp5xF2VjTu5vqje+EQ0qW7FghiLkcpmf1uKNrken9gq9q
	kssnha+KiawbekSmSFNqQ==
X-ME-Sender: <xms:N719Y1sPz2KhrQx-uByegzVU7wx7-zNEc2BbCESzwYGhdO-tVVPHXg>
    <xme:N719Y-dnz3MJUaTlHiK98G7DswNCnnKIaGBDVVThXaf33MOPVmYtpvbi5-4IWegOn
    Ryyvrqx9mq6VVp_HQ>
X-ME-Received: <xmr:N719Y4wf_bjOpMi-QzqEA2v4uh9NYjp8zDnItCL7NTg9XiCKb4hhWhkZQCByan3cryDyCfGheuC9_Qqc8ui230xaoUtubigmQCk-v5CruLuY993WlPGGkyAFxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedtgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepjefgfffhudejfedtuedugeeutdetgfeiteffffehjeeugfeuvdeh
    jeetfedtffdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:N719Y8OiEfDlJrL6pOubnB0VRgXZvFNiOiHTBN2NAbUnAPRDGhx-pA>
    <xmx:N719Y19DxXHYa6r_oTD1RfHy90fufVqjCuzWdKFzlrUySKagDwo6CA>
    <xmx:N719Y8Wl_6kACXl4tJ4KrpP8i62xq3lNIzOsGIKnW-CHQ_6-Hnkjew>
    <xmx:N719Y8WzDmXkv3iVKNS-HfNL8M_n_jGlggNdo5bw-B1BsTUZF4ZLsg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 01:27:02 -0500 (EST)
Message-ID: <4e9a46e2-eaa2-04cb-8b95-2fe9a091a96d@sholland.org>
Date: Wed, 23 Nov 2022 00:27:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, conor.dooley@microchip.com,
 Conor Dooley <conor@kernel.org>, rafael@kernel.org,
 daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com
References: <mhng-6299f108-11af-4e70-9981-d7e7b3be0b9a@palmer-ri-x1c9>
 <57114829-c205-dece-abdb-1100947286d4@sholland.org>
 <CAK9=C2WLOa_zgboFE5UCgnwMB-kbWMAVtmXsBxoswqY63-5QHw@mail.gmail.com>
 <a591599e-d133-e19a-4898-5645c3862daa@sholland.org>
 <CAAhSdy2VdX9VivbuRhjN0cPXTi=nFWdiPwFs+hUv6iMqZu-q5g@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
In-Reply-To: <CAAhSdy2VdX9VivbuRhjN0cPXTi=nFWdiPwFs+hUv6iMqZu-q5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_222710_402513_5AF3F956 
X-CRM114-Status: GOOD (  21.10  )
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

On 11/23/22 00:10, Anup Patel wrote:
> On Wed, Nov 23, 2022 at 11:08 AM Samuel Holland <samuel@sholland.org> wrote:
>>
>> Hi Anup,
>>
>> On 11/22/22 23:35, Anup Patel wrote:
>>> On Wed, Nov 23, 2022 at 10:41 AM Samuel Holland <samuel@sholland.org> wrote:
>>>> On 11/22/22 09:28, Palmer Dabbelt wrote:
>>>>> I also think we should stop entering non-retentive suspend until we can
>>>>> sort out how reliably wake up from it, as the SBI makes that a
>>>>> platform-specific detail.  If the answer there is "non-retentive suspend
>>>>> is fine on the D1 as long as we don't use the SBI timers" then that
>>>>> seems fine, we just need some way to describe that in Linux -- that
>>>>> doesn't fix other platforms and other interrupts, but at least it's a
>>>>> start.
>>>>
>>>> We need some way to describe the situation from the SBI implementation
>>>> to Linux.
>>>>
>>>> Non-retentive suspend is fine on the D1 as long as either one of these
>>>> conditions is met:
>>>>  1) we don't use the SBI timers, or
>>>>  2) the SBI timer implementation does not use the CLINT
>>>>
>>>> And it is up to the SBI implementation which timer hardware it uses, so
>>>> the SBI implementation needs to patch this information in to the DT at
>>>> runtime.
>>>
>>> Rather than SBI implementation patching information in DT, it is much
>>> simpler to add a quirk in RISC-V timer driver for D1 platform (i.e. based
>>> on D1 compatible string in root node).
>>
>> It would be simpler, but it would be wrong, as I just explained.
>>
>> Only the SBI implementation knows if the SBI timer extension can wake
>> any given CPU from any given non-retentive suspend state.
> 
> The SBI implementation would derive this information from platform
> compatible string which is already available to the Linux kernel so
> why does SBI implementation have to patch the DTB and put the
> same information in a different way ?

It is not the same information. The SBI implementation also chooses, at
runtime, which timer hardware (CLINT, platform-specific MMIO timer,
etc.) is used to implement the SBI timer extension. The value of the
sbi-timer-can-wake-cpu property depends on this choice.

Using D1 as an example, there are two MMIO timer peripherals ("sun4i"
TIMER and "sun5i" HSTIMER) where the sbi-timer-can-wake-cpu property
should be set. But the property should not be set if the CLINT is used
by SBI.

It would be perfectly reasonable for the SBI implementation to claim one
of the wakeup-capable MMIO timers for itself, mark it as "reserved" in
the DT passed to Linux, and thus force Linux to use the SBI timer or a
native CLINT driver (C906 CLINT has S-mode extensions). Then the SBI
timer _would_ be capable of waking the CPU from non-retentive suspend.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
