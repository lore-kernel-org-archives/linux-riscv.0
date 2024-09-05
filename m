Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D67BCE7A96
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 20:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxPHHjOuBwofpP8fSJ9SXiDffspyLwPMud85lvDwPhE=; b=40ZaLAWEVyjyvq
	HgMUTr8caUH2Y2b9jzHqAkQBHTbiWNtvXN3fvaiNQG02WCTR72Bp4TtgUjKdPA6+R25spyKB/pwE4
	NYUhNvyRlQztTj7rlNtuVC2mAvM551I9pAG9t3aXMTFN/pnVbL0enHag04VHYdxiPH6qudlwpZbz4
	vG3CZ2o2kCoJhEyzQmiapAPfZk9SdfGKe1STJVzxsgRZzedd4G+cC2J8+0t+kME63s1EVnYD0uTUi
	PSeNHQllkBhj+sTRtx5eK0gf+aDuh0gSPbew9fusWZH7u2EP/q6QqBJR0eW6HsUUlWfS5UmGmfW6T
	Pd+9Vqy9Xcg/RmUCIxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smIy4-00000009jbl-23Na;
	Thu, 05 Sep 2024 20:20:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smIy1-00000009jb5-3wUz
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 20:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52CA85C5D5D;
	Thu,  5 Sep 2024 20:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674DDC4CEC3;
	Thu,  5 Sep 2024 20:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725567632;
	bh=WNTKcbBoP3yzp4k548lRNhojlPboqlXEMOGGTo3NcgQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WXtwAExfJEeJNm1MsUalbDl2XLmIPmnUcG4E5rZok3mplUU8MpDwZBrC1kr+7fQ+1
	 lo1CwP0DJE/qJy3AiwsE+qlusFQ+kBZxjRAqTpD3smQEYs5iy+XH9zxuiFKPqJ69m/
	 f3eMqoq9QmnAYg0hD/v1BT2t31YYDKZkLWI6jbyHAM4ydwVp4gDolxFtgRN/ms/hag
	 XnTn+o2TXtv3023EBMTElGS2uZ4ioQsU2+1rRRMj6huHJtE4/qSS6bxeThmXNFrBk0
	 PEz96UduTGJ26munzXiQr7pZfS0vPkvWcIjvpJ4l8hqJZfVNwU2lZUHX+rW+A9H2yF
	 31K9oTivEiD7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71E883806654;
	Thu,  5 Sep 2024 20:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 00/10] Local vmtest enhancement and RV64 enabled
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172556763330.1833779.11043836271169244932.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 20:20:33 +0000
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
In-Reply-To: <20240905081401.1894789-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com,
 bjorn@kernel.org, puranjay@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, palmer@dabbelt.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_132034_070831_AFA95822 
X-CRM114-Status: UNSURE (   9.17  )
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

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu,  5 Sep 2024 08:13:51 +0000 you wrote:
> Patch 1-3 fix some problem about bpf selftests. Patch 4 add local rootfs
> image support for vmtest. Patch 5 enable cross-platform testing for
> vmtest. Patch 6-10 enable vmtest on RV64.
> 
> We can now perform cross platform testing for riscv64 bpf using the
> following command:
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,01/10] selftests/bpf: Adapt OUTPUT appending logic to lower versions of Make
    https://git.kernel.org/bpf/bpf-next/c/dc3a8804d790
  - [bpf-next,v3,02/10] selftests/bpf: Rename fallback in bpf_dctcp to avoid naming conflict
    https://git.kernel.org/bpf/bpf-next/c/a48a43884cdd
  - [bpf-next,v3,03/10] selftests/bpf: Prefer static linking for LLVM libraries
    https://git.kernel.org/bpf/bpf-next/c/67ab80a01886
  - [bpf-next,v3,04/10] selftests/bpf: Limit URLS parsing logic to actual scope in vmtest
    https://git.kernel.org/bpf/bpf-next/c/0c3fc330be6d
  - [bpf-next,v3,05/10] selftests/bpf: Support local rootfs image for vmtest
    https://git.kernel.org/bpf/bpf-next/c/2294073dce32
  - [bpf-next,v3,06/10] selftests/bpf: Enable cross platform testing for vmtest
    https://git.kernel.org/bpf/bpf-next/c/d95d56519026
  - [bpf-next,v3,07/10] selftests/bpf: Add config.riscv64
    https://git.kernel.org/bpf/bpf-next/c/897b3680484b
  - [bpf-next,v3,08/10] selftests/bpf: Add DENYLIST.riscv64
    https://git.kernel.org/bpf/bpf-next/c/c402cb85802f
  - [bpf-next,v3,09/10] selftests/bpf: Add riscv64 configurations to local vmtest
    https://git.kernel.org/bpf/bpf-next/c/b2bc9d505499
  - [bpf-next,v3,10/10] selftests/bpf: Add description for running vmtest on RV64
    https://git.kernel.org/bpf/bpf-next/c/95b1c5d17832

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
