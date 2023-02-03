Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74F4C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StdyNk2f9N6c+VmmS3B4ANZapGAudkcRurISiNL0av4=; b=FKuurqiFwlYBzw
	3mL9dFRde9vTm9h5V3Uu8FFA37G97K0O6ul9+NBavBv0dqGY5p+voYw8+oSYLz6QPhLU5NkxyhlIF
	SYonT/jl6rCeHPKZXHc+YQCbqdofcV0efkYChT4cKp8+/lqSFLh1NyqUWztd1+F9I0ON8e6vFkSE3
	rOQEedk/yqPBNJurKRWMyHgZoAQdeb3/nkPHmMU8Zh7fHT8kBXVPGPRpcB0+619pLxznPlU2QrSEW
	y5dGzwHM0HURCu3L55w6jLzlQZub6cPaCw8bVhK475hpqEbQxhQzgujC/mH/vYMM1xWRGz1oHWS1W
	8mBbtjXChb5zNjyNsbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqZ9-000o6r-1Q; Fri, 03 Feb 2023 07:32:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqZ5-000o5i-Kz
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:32:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C9673B82964;
	Fri,  3 Feb 2023 07:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB62C433EF;
	Fri,  3 Feb 2023 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675409572;
	bh=SFtEV6CVrQMvkRZgR6xt+WcrXmhr70qQXTyN9Ci6QTI=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=h9c6tlZQfM8I0CgHIPafabPLB7wzRCNnk5EBfL+9k0+J0UdBMlTdCflRPu6U0QKTl
	 VRo0E/FrJJoI+5hisg6eVRDvwmMgcvFP8lkNND1lLsVxqGcJ/hI66vqaLBb5jtOB+u
	 yi6p91e7E4mO7opx9Wi4ODt1YKaoqdTaqpqqfa9rfkvWUxB/JObWYhad+HuY2UsQvA
	 Xu0SnWCXnjVb9VhwGGvwbXuMSUCpTldOM881XOvRAtSPd4VeIvalrK1XlNLMWCVjz6
	 p0vWhyE53yun2cyIOhjkm4ylGH22kllBiprdvFE2YZCmsBZhqt4kiUpJ311p4lE0s2
	 l8KGr+jUiNMTw==
Date: Fri, 03 Feb 2023 07:32:47 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] Documentation: RISC-V: Define Xlinuxs{s,m}aia
User-Agent: K-9 Mail for Android
In-Reply-To: <20230203001201.14770-1-palmer@rivosinc.com>
References: <20230203001201.14770-1-palmer@rivosinc.com>
Message-ID: <17CF439E-8933-4358-987B-85352DCAE4DD@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_233255_854810_1BBDC3AE 
X-CRM114-Status: UNSURE (   9.93  )
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



On 3 February 2023 00:12:01 GMT, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>The AIA specification was only partially frozen, but provides no way to
>refer to the subset of behavior that has been frozen.

Ahh, wonderful.

>It seems like
>there's not a whole lot of interest in the non-frozen behavior, so let's
>just define an extension that only consists of the frozen behavior

>
>Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>---
> Documentation/riscv/extensions.rst | 10 ++++++++++
> 1 file changed, 10 insertions(+)
> create mode 100644 Documentation/riscv/extensions.rst
>
>diff --git a/Documentation/riscv/extensions.rst b/Documentation/riscv/extensions.rst
>new file mode 100644
>index 000000000000..c12bd3780520
>--- /dev/null
>+++ b/Documentation/riscv/extensions.rst
>@@ -0,0 +1,10 @@
>+.. SPDX-License-Identifier: GPL-2.0
>+
>+Custom RISC-V Extensions
>+========================
>+
>+* The `Xlinuxsmaia` and `Xlinuxssaia` extensions coorespond to the standard

Typo: correspond

>+  `Smaia` and `Ssaia` extensions as defined by version 1.0-RC2 of the RISC-V
>+  Advanced Interrupt Architecture (AIA) specification, with the difference that
>+  chapters 5 (Duo-PLIC) and 9 (IOMMU Support for MSIs to Virtual Machines) do
>+  not exist.

Perhaps this document needs an intro section specifying what you expect to go in it.
Is this for any custom stuff, or just places where Linux has to work around RVI?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
