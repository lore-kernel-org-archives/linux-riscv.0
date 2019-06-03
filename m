Return-Path: <SRS0=uF1/=UC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441F3C04AB5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 17:32:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8C624520
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 17:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J4ec59z2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8C624520
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SusO8MXt4whk1XWKuX0Mdqu9sMuryMTEzi/Bvn9AGPs=; b=J4ec59z22m03WE
	9ywHpcHcCmNywl5fs30aBJiIDxq+eAXD6h4753uZMGbwbKDPnSRFKwgsRI8UPmgv1BvGjG6hanRYc
	C9bPE3zqjFQhvvC+see1BElMLnZlG7A3js4h16CDIzv0MSuW7Tr7OyNInKraoVK6MN5uJ9dXZIdg8
	wn+a5dmlWX0PH15iC3fNgKs5I/oLgclUJHceeU5kqMq50xEqiqYJrq31uk5szpqd2YULQPR/UXUzg
	S79JYXKj39C6xCX938PttIXBKWwTOEKW3/GEVXH7dVq58Kn3SMG7H/pbV0wQman8asaWZdMUfPofj
	3In5aMXwDvDfR8N7vLSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXqor-0004Du-Dm; Mon, 03 Jun 2019 17:32:25 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXqoj-00046J-My; Mon, 03 Jun 2019 17:32:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE60980D;
 Mon,  3 Jun 2019 10:32:16 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 A6BF63F5AF; Mon,  3 Jun 2019 10:32:13 -0700 (PDT)
Date: Mon, 3 Jun 2019 18:32:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4 02/14] arm64: Make use of is_compat_task instead of
 hardcoding this test
Message-ID: <20190603173210.GI63283@arrakis.emea.arm.com>
References: <20190526134746.9315-1-alex@ghiti.fr>
 <20190526134746.9315-3-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190526134746.9315-3-alex@ghiti.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_103217_752246_F8E6A9BB 
X-CRM114-Status: GOOD (  11.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 James Hogan <jhogan@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mips@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 26, 2019 at 09:47:34AM -0400, Alexandre Ghiti wrote:
> Each architecture has its own way to determine if a task is a compat task,
> by using is_compat_task in arch_mmap_rnd, it allows more genericity and
> then it prepares its moving to mm/.
> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Acked-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
