Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C10C19F4F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 23:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/akH9EQWfggp9KQqLbY1jYmCuiKJM3Qppbms0i/lD5k=; b=hJeizLaYGAxGqo
	oIxrzXaUAAgRD0pamhgHTa63ur+sLw8F0g1ZvoQPJAMNFbU2HlGI0GZzdAo7psjgi0oadqpfl2Ce7
	rYye2JmL5c0ZHfV1ZzEYJIlz97GfMxuF6KkzG4aL1JZO9fMhAEYbYg06u2fRpCKk30DZQutSakcVN
	cWULMhwMVuqlk2CxEU6KbK8/Te0jnSxBQgRA4BCy23VEuXjncppWys2qysaNsyN6XiOs+JOQJ16fc
	XefYFfnaRTub0AaHtOm/gaPYMsk9xQTT7S3LSjvT62M0S93K9rw8HcHxOOB6yWj7KdqnZqxMJM449
	rZHGVbmv9ac7AB4g7oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0852-0000000AXsA-2SMj;
	Thu, 25 Apr 2024 23:00:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s084w-0000000AXpa-3xCO
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 23:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D983C61BEF;
	Thu, 25 Apr 2024 23:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCDD7C2BD11;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714086031;
	bh=D8k06gnsNVMRGTY9SPsw6z9e/n7ev10N005gew8GPJA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LNd/HjNR/1Te60bNVBgQcAnpWBWzfg7bb5NEuteLpBWJKlP+ByjhJ9INjWMb6g3Dv
	 LJY2K7mqA6hshg1ZxNiumMtbcFEqWsZ6XwdentsDMp9ESQIFfvmJASU2GfBWQ9YHN8
	 CEFPOdiUwE+2zEgeW6PD/HSQr+SXuxVuz5ytKYw0bgQNeCw1fgtZzIFktG/ZRcyOiA
	 vf82m3WFWwVTRP0DNdryNzDUZpQMGf4MKxlF3qxHxyT0R5nPbOwW2PbVeYav3U6cOB
	 2dseTEtIXMshBhduqoGp9OvXbZlSwbt/ssVXTxoF7ttNKFbbgofjgqYl5rQ6OWik+w
	 XfGILvaMWOA0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C89D4CF21C0;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/9] Support Zve32[xf] and Zve64[xfd] Vector
 subextensions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171408603081.8761.8620733679475942661.git-patchwork-notify@kernel.org>
Date: Thu, 25 Apr 2024 23:00:30 +0000
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 heiko@sntech.de, guoren@kernel.org, conor@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, evan@rivosinc.com,
 cleger@rivosinc.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com, vincent.chen@sifive.com, greentime.hu@sifive.com,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, j.granados@samsung.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_160035_026552_9BA59424 
X-CRM114-Status: GOOD (  11.34  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 12 Apr 2024 14:48:56 +0800 you wrote:
> The series composes of two parts. The first part provides a quick fix for
> the issue on a recent thread[1]. The issue happens when a platform has
> ununified vector register length across multiple cores. Specifically,
> patch 1 adds a comment at a callsite of riscv_setup_vsize to clarify how
> vlenb is observed by the system. Patch 2 fixes the issue by failing the
> boot process of a secondary core if vlenb mismatches.
> 
> [...]

Here is the summary with links:
  - [v4,1/9] riscv: vector: add a comment when calling riscv_setup_vsize()
    (no matching commit)
  - [v4,2/9] riscv: smp: fail booting up smp if inconsistent vlen is detected
    (no matching commit)
  - [v4,3/9] riscv: cpufeature: call match_isa_ext() for single-letter extensions
    (no matching commit)
  - [v4,4/9] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
    (no matching commit)
  - [v4,5/9] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension description
    (no matching commit)
  - [v4,6/9] riscv: hwprobe: add zve Vector subextensions into hwprobe interface
    (no matching commit)
  - [v4,7/9] riscv: vector: adjust minimum Vector requirement to ZVE32X
    (no matching commit)
  - [v4,8/9] hwprobe: fix integer promotion in RISCV_HWPROBE_EXT macro
    https://git.kernel.org/riscv/c/5ea6764d9095
  - [v4,9/9] selftest: run vector prctl test for ZVE32X
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
