Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7EBC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XiXKD4ACVRbIYrIvwRnKfQiGaMQn5MXoNifXoH8JNM=; b=HAA44elK2h85kn
	g7pXmKgGrrpRD5htmYFwxBpeQZNFu34kUFjNfyEa4WbuFA1zztr8mIXlVD3lXzyD9kMVIIPjmeH2K
	dZm76jq1WBnpqSKSNP/EWtwajYMQkK8hElk5OIXouraSkBFizisL/euhsDdM8vGRUVMrp3E3smupN
	PLbr/zjotfa+5tz0dLiV87KlKRSTzZznpcEkUTzPvZ5xGKf1OVXKA87TEMXB1f9skKwQjriA/cbZN
	Px6Gg/oB4suiWS4XJ2JOTlWBE8YTr/T7gaBG+gPf8OLo2pEMaTkJ3ndnjrKYRjdCr7fdAbDvEXwKN
	JV4yqxqSTAG468rZI3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtHV-0000000BInM-07hT;
	Thu, 27 Jun 2024 17:51:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGt-0000000BIJA-3VeB;
	Thu, 27 Jun 2024 17:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78309CE339B;
	Thu, 27 Jun 2024 17:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B55CC2BD10;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510656;
	bh=gOn5wCkQoaz4jCvDxmaxx4Rr4gNeBfnRgSNDr4QSj8U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IIYJcPU97Y+PRAS/+YU/5ccbncoZV1uCz57lAqil+V1ijTPByVKGTQFMqmdIktpow
	 mgUXuwPMGB0hxBKAEtQcmsJRe0kgoK0G4CxAqoS4UnqOc+s7QEYIHK2kt44seSLDnZ
	 Gh7dIhAcmLSHgaptDShKUVITRiz/vLPn0qdyGC0znkbWHWytZ7ePFuuj2lU7mHIg0F
	 X0+78irzHOMSVd8cMwuP/4tg088CmEcvevRxvvPs6wzwg65cMt+rL64nQ95qH5Tx37
	 GB4x63Y5pxbKsGJf0RlDoEvN+uEIHgUB3AusDoc3p6pdooB0KA3nJdCVz0InBkVSKv
	 iBdVjZUdtNUDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5FC7EC43445;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v7 00/16] Add support for a few Zc* extensions,
 Zcmop and Zimop
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951065638.6762.17635047001193885957.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
References: <20240619113529.676940-1-cleger@rivosinc.com>
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, anup@brainfault.org, shuah@kernel.org,
 atishp@atishpatra.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105100_408683_DC29C081 
X-CRM114-Status: GOOD (  10.64  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 19 Jun 2024 13:35:10 +0200 you wrote:
> Add support for (yet again) more RVA23U64 missing extensions. Add
> support for Zimop, Zcmop, Zca, Zcf, Zcd and Zcb extensions ISA string
> parsing, hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have
> been left out since they target microcontrollers/embedded CPUs and are
> not needed by RVA23U64.
> 
> Since Zc* extensions states that C implies Zca, Zcf (if F and RV32), Zcd
> (if D), this series modifies the way ISA string is parsed and now does
> it in two phases. First one parses the string and the second one
> validates it for the final ISA description.
> 
> [...]

Here is the summary with links:
  - [v7,01/16] dt-bindings: riscv: add Zimop ISA extension description
    https://git.kernel.org/riscv/c/a57b68bc315c
  - [v7,02/16] riscv: add ISA extension parsing for Zimop
    https://git.kernel.org/riscv/c/2467c2104f1f
  - [v7,03/16] riscv: hwprobe: export Zimop ISA extension
    https://git.kernel.org/riscv/c/36f8960de887
  - [v7,04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
    https://git.kernel.org/riscv/c/fb2a3d63efef
  - [v7,05/16] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
    https://git.kernel.org/riscv/c/ca5446406914
  - [v7,06/16] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
    https://git.kernel.org/riscv/c/e9f9946cad7b
  - [v7,07/16] riscv: add ISA extensions validation callback
    https://git.kernel.org/riscv/c/625034abd52a
  - [v7,08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
    https://git.kernel.org/riscv/c/ba4cd855839d
  - [v7,09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
    https://git.kernel.org/riscv/c/0ad70db5eb21
  - [v7,10/16] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
    https://git.kernel.org/riscv/c/d964e8f2ae65
  - [v7,11/16] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
    https://git.kernel.org/riscv/c/d27c34a73514
  - [v7,12/16] dt-bindings: riscv: add Zcmop ISA extension description
    https://git.kernel.org/riscv/c/700556a73bc7
  - [v7,13/16] riscv: add ISA extension parsing for Zcmop
    https://git.kernel.org/riscv/c/164d644059cf
  - [v7,14/16] riscv: hwprobe: export Zcmop ISA extension
    https://git.kernel.org/riscv/c/fc078ea317cc
  - [v7,15/16] RISC-V: KVM: Allow Zcmop extension for Guest/VM
    https://git.kernel.org/riscv/c/29cf9b803e6e
  - [v7,16/16] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
    https://git.kernel.org/riscv/c/e212d92d1a86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
