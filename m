Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD5CD1118D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 00:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6wwrzZqy56TUW+h3mNQ3vvZIqQLJ5h3uHX8Pg4ebtE=; b=qhPPkpVFnMMxqC
	rvgD88iHXwOuMM73TTSr5W4fqIZBvR1ItcgpzAoo8EEJiBohzZhk8N5dqcA5jTlHVo594yFq93hQ3
	YIYq8e/kOj77qqX2cqcgj1ucR38nAnoWA/e4u+fnhcoXzLeEYwHbDWh1nPoAg8Ic5VdfjgyjEPkHf
	qhN7DXSmGLlgGHc47AF0EzB5sjtzLBeSb9EvwTQhx0p5yZpU6J1nD/8rQcirlgNK+bzeysfOCU8Q+
	OKsS53Rw/ZyLy1snNXeIUgrZIROqV2Qow6AVSc9kPtreo+GtnJO6+Ee1K8uRv3Ajgn7tjFT8C0ANx
	0fgEFgw7vvnVQ8OpdZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQCi-0000000Foo4-1nOC;
	Thu, 27 Nov 2025 00:49:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQCg-0000000Foni-312N
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 00:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C33D9408A8;
	Thu, 27 Nov 2025 00:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B885C4CEF7;
	Thu, 27 Nov 2025 00:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764204585;
	bh=wS8EVxR6YX2P5yfvi9alZyf7r7Sl51mfZ6kFOeOmBmI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rXPYIhklTxIiLyCDyhxyeHHU5ZBJjqxgbp8nS/Iu0fF5lJv8kW9QKfTKOkP1qbTsL
	 zSOL6s9vJZ78fvpYVbJoOzwvH35EIBkpsK8MhEPFK6AwT1/iuG2nl8/ENOjtTT/bL/
	 ybJjF3LsTiubj5CidvjIV2VZxxkT++qZ1pQaAIdob/XyoeFEtws+SFMKATCZtutZxR
	 BQa6j6amENy0VDu1G7rGMiD/qFfn+xeEfC4pQxJzh/6WbUuJjyPiJlFkn09N5TIHno
	 5n2/ps6A+i8UyMO2KOl7CVrc0EAao10ZKfPPO3NqB2jIPWDbi3J6K9hKdkCP+vJ77v
	 HII24ulEsng0A==
Date: Wed, 26 Nov 2025 17:49:43 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] riscv: Introduce support for hardware
 break/watchpoints
In-Reply-To: <20250710125231.653967-3-hchauhan@ventanamicro.com>
Message-ID: <0b77ac0f-a18f-e577-ff92-98ddd1d2bed8@kernel.org>
References: <20250710125231.653967-1-hchauhan@ventanamicro.com> <20250710125231.653967-3-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164946_778060_39EE0DF4 
X-CRM114-Status: UNSURE (   6.70  )
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

On Thu, 10 Jul 2025, Himanshu Chauhan wrote:

> RISC-V hardware breakpoint framework is built on top of perf subsystem
> and uses SBI debug trigger extension to
> install/uninstall/update/enable/disable hardware triggers as specified
> in Sdtrig ISA extension.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Talking with Anup, it sounds like you're planning an updated version of 
this one, so will hold off on it.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
