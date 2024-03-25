Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEAFC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MZbleNIMwe7U6M4zX7Fqcr+QlABVc2sjJ7N7vpti8U=; b=UeDUIZwiKnze/8
	eETspdq/yJUr5jKNcwCs8BeD3lBa5/E+AeEGqjDbyRdV4G1hjdl3q0RdqmYDpoPIHojDPoVw9pLZd
	Kq3Fu/9S60VQyzg6Nc2+nBjtCQM9JkPqdxst65A4qJMTtm0qs7vQkrt+J2uFDLhqykEcUoslzP1HT
	CL4PWQWOCVPab6K16BYRS96FjufNZLrms6gIS71VKw41mDsulv4xxekBWBX3vkfupbUZhwIhu/ar/
	jYSLEYrymGx7Ps8MOSr3Jdqcgst1q5vU0hvKZkVHD8Si4yA7qCeID4KwrNRMZ1hKFJuwfyZHTCWJM
	Xlc7AVEk4oXWNQZI+WDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ror9b-00000001rWJ-3kc5;
	Mon, 25 Mar 2024 20:42:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ror9U-00000001rTS-3IAT
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2805F611A9;
	Mon, 25 Mar 2024 20:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB16C433C7;
	Mon, 25 Mar 2024 20:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711399359;
	bh=ygDBcH5zVAYII6sXhBLSOiW+myqvVjm/BPO9+LnLjmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhZ+MvtYCstCIuxVRYzQ8FexYu/4uM0L3OgJ/Ttw/5qqFtiOBZ1xTzFD3va+NfBn9
	 LVquBM1RoB3rdMc8BZ1tceiZfRmPkJo8Vbzow4hnQ14UX/F8J8MWFFuy3wPO4rjZiy
	 o9ZBAD+uP0hOwEPV2sGpJ2z4RQtdtAbw5vWypzCFdFjC3vDa2jbhpK0SdornUGy7tt
	 KGeu6ZwhY3juf26d5nfDhB2nKJ6uA9wdqmZv2v/1l3vc2dkYZ3HC0OoKY4yZfkYyLS
	 ipfFfHQexkWHK0QXdrzrctbJvBYUnqQZky6K4PwDwGSWCIxfL5nSUXC7mQwR85Esw1
	 AEPogmNFCnG6g==
Mime-Version: 1.0
Date: Mon, 25 Mar 2024 22:42:35 +0200
Message-Id: <D034FU5LXNT8.2QCBIDTQRB2S6@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-riscv@lists.infradead.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 <linux-modules@vger.kernel.org>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Subject: Re: [PATCH v3 2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
X-Mailer: aerc 0.17.0
References: <20240325203755.1811-1-jarkko@kernel.org>
 <20240325203755.1811-2-jarkko@kernel.org>
In-Reply-To: <20240325203755.1811-2-jarkko@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_134241_042134_48AB2EF0 
X-CRM114-Status: UNSURE (   8.70  )
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

On Mon Mar 25, 2024 at 10:37 PM EET, Jarkko Sakkinen wrote:
> Tacing with kprobes while running a monolithic kernel is currently
> impossible due the kernel module allocator dependency.
>
> Address the issue by implementing textmem API for RISC-V.
>
> Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
> Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

I think that for any use case it is best for overall good to realize it
like this. I.e. only create patch sets related to the topic that change
behavior for arch's that are in your heavy use. For me that mean x86
and RISC-V.

That is why I shrinked this from to focus into more narrow scope.

For microarch's more alien to one, it is just too easy to make sloppy
mistakes, which could cause unwanted harm. E.g. it is for best of
arch/sh that someone involved with that microarchitecture does later
on the shenanigans.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
