Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AC1C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yOt3b3l1HApMEA9UOtqB65f0boqC2OjZbTEsETI7QY=; b=pBT1ikWkd18gnC
	7CCctwUX76kqXBGTJMsc2dWwWnuPyjLIxsQPJfOkNQ7xa14t2sLQxc95GmTSTtFq679JkeMPc0Z85
	bQ1WTZiRDEPinpT9pKIy7uzHTiYXpBNtBoqsn2f98bfaFIHvDE4SDWjomO+oc9upJmlAjl6J+LBxZ
	+SMTmxNqYSadIM4XOD4ybyCCc77uC/ETraR+WvXkaqiEUTgqWg8yvwu2z6x3jFxvAg7TU7EZ3esJx
	I7CuzWU/qJS2F2ker3lqGJ8tpk72sZXgbbpdGqajzKul66MbXeAeZ07TTBff5u/dLbBsYoqaPruRh
	MoLPWLR1cfuLhXGzBWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rC46a-000VPo-0P;
	Sat, 09 Dec 2023 20:39:20 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rC46X-000VOe-0R
	for linux-riscv@lists.infradead.org;
	Sat, 09 Dec 2023 20:39:19 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 71AF13200A10;
	Sat,  9 Dec 2023 15:39:08 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 09 Dec 2023 15:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1702154347; x=1702240747; bh=nA
	pf9oaznILOB+bOEKeTCqS0+E9iMtrHOKNgiCZPnf8=; b=nqixXGn/qgsSYwLhji
	Pk7AHucq7sOmZ5xV7f8NxIs2Bypt/sSPfonlIOyX4uFw9IIBIM6UpabIKFU/Q1T8
	HbgPb7QPEtRtCQYUITouprUCXUaSWsXuMtO7e857eD70IEMB8OBC+krG2s1vJs11
	7JfXGnKuK1rngnVWnNGY5/kL2k6BYPZEOmozrh+VXB6/gq9ww0Dy1rhzUiCxgD0b
	ucaYhl5fYXWMeT0qDoqsr8PutI3Y0e5b0ved6rf22QA1h7RaaNOa5yhqb9OVCqtf
	dhMUGtv5PHnv8aslN6ks3TUDP2WlQN+84NtcQ13qsU2hK/mk/UWY6n+x6fSX5PPL
	RTfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702154347; x=1702240747; bh=nApf9oaznILOB
	+bOEKeTCqS0+E9iMtrHOKNgiCZPnf8=; b=E2Hu6Hkx16494KxIz37zzPeHrqHU+
	+Btk4U8HPNVSdxhLMyqzBmbU2tpsiOopPlbNXwlAxsj8B3ERm884+GYKcZN1dSGh
	oBhEAv6qDw1Oc1QWDow/Wy9Reeedk9TnS+KOf5x55mktCDMtR0c4eATojEMJX+in
	4Dmu24QPaDO/LPGQ9e63MGoTvRref3z/EWtqbmcdda6DNN+TC56B46VRvv0E6SEP
	Yy9XHxDN+lwLRvCSIT6mQFlVMP5vpThWwHOoBz2A0C/5poGI387xh8QeaN5N2TXk
	FUYBbKhnnnZvUGH9qofig10Qwo9RCUeC597NVh4CLEe6xukPow9f1lR3g==
X-ME-Sender: <xms:a9B0Zfib413GnDb6e0EhQlyXh3FlDQDG_60N50GrNnCK7lBniFD29w>
    <xme:a9B0ZcBUoJh4xwRwq63NclpFBCmJ4wHmvTqIlqRstuabLpbFqJ9RDx4tuTWQMtFrt
    SyKrxvqNWskA96ZS0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekkedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:a9B0ZfHtyKCEGLX6rLgXxfohUPPoYL6LBaZkICr7MwjshweRq9Lp3g>
    <xmx:a9B0ZcRBY5ifpZ1WJDTg0yFZh4Cdk7G_4HmdosGAuRLtG_oZXyZ3Tw>
    <xmx:a9B0ZczcTOQDZ-sdzQbvzdigiB-F_hJmDw_1OkEC4SdoYTJApDpyJA>
    <xmx:a9B0ZRIlkv02LwxHqcn9uTWdA1PQNbMzR3BKCsvozjcb9Azm7nczaA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 453DAB60089; Sat,  9 Dec 2023 15:39:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
In-Reply-To: <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
Date: Sat, 09 Dec 2023 21:38:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Dave Airlie" <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 "Pan Xinhui" <Xinhui.Pan@amd.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_123917_596841_B4073DD6 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
>> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
>>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
>>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
>>>> architectures. Enabling hardware FP requires overriding the ISA string
>>>> for the relevant compilation units.
>>>
>>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
>> 
>> :(
>> 
>>> Nathan, have you given up on these being sorted out?
>> 
>> Does your configuration have KASAN (I don't think RISC-V supports
>> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
>> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
>> or KCSAN in dml2")?
>> 
>> I am not really interested in playing whack-a-mole with these warnings
>> like I have done in the past for the reasons I outlined here:
>> 
>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
>
> I also see one of these with clang 17 even with KASAN disabled:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
> [-Wframe-larger-than]
> void dml32_recalculate(struct display_mode_lib *mode_lib)
>
>      ^
> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
>
> So I'm in favor of just raising the limit for these files for clang, like you
> suggested in the linked thread.

How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
in that function? That should also avoid the build failure
but give a better indication of where the problem is
if someone actually runs into that function and triggers
a runtime stack overflow.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
