Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753E3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 02:21:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A0061053
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 02:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40A0061053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmaY90po1Cg/+lNhB9xH/WQh5RZSzDxWsjK9LaAKyGI=; b=TwgLYpADnxKOhj
	q5qsWShHcvwWIV5NeTsitBi32vKq51IdNW2HfbB660wmAqGmhGr4Udtg9Shd5O5xGnEBiaenONpvv
	XsBS6ejSaZ6vyWYc1KrlCm354oS1ZpzPrTp/VeR7dhwZe2JdYxAuBT1p6ssmiQCFGmGPkHTUrYuVq
	l1C0rMJlPEN8RX1KjSgYGMwbbQYu5I0/As3qCeuoSQdFS3qdEEYtQZJsQT78HO43MfvNBbcSDlmQ+
	Fa1ZK+LLgYcEQCpokmRUMg4TB7mXPxQL2A+oPVM9DRujFVGK3xQSFGhRwQT5ynhk7hyRjqkCSXXuj
	m/GC4NM9gbUd2DcBfoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhjQj-000Gz3-7y; Tue, 02 Nov 2021 02:21:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhjQf-000Gxj-Pi
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 02:21:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61B626124C
 for <linux-riscv@lists.infradead.org>; Tue,  2 Nov 2021 02:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635819697;
 bh=Sh+E3vhcUYFTuSr5p8OLYai9a31WkvMD0XH84I6uVVk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jGvLS2mvwvbQjzIZdPfSQrOYwqj1joqIK71bIW9nPy+rNYFWVRAYzXRXGzXJQQLld
 HbhLIGOoecO+5AO2EiTGb9K83lonHTXmC9j9/qJ/4TnJTycWcWRoqVvt+tK1QNuboF
 bHxd/6eUveB7jjY4Kt9EZj1Gy7tHLyDQHKzKgoSB9QJayujftcJsE4CCpoDdirODGK
 NYo4JO1KAOPD/K3CJxy4U+/ABjwsjPuSkZUZCXjitWXwDFlZqsn4WGk4qNO8Q/MFoF
 zzK4O3H+cbpNCSrHhFP9HwY7y0NuFdMs9i3rPr73d48KmTQdc/2UBFy5DJL2EkHzW7
 Spkq22ZryELLA==
Received: by mail-vk1-f181.google.com with SMTP id g18so3552015vkg.6
 for <linux-riscv@lists.infradead.org>; Mon, 01 Nov 2021 19:21:37 -0700 (PDT)
X-Gm-Message-State: AOAM533Tf1jG8oTB2l0rY1AoPzTQqnLpw48ycdGIyF0C+p5Sn5vGnxeA
 WlzgpYhaTzjbxqWIAygb2k61F3TebZC1kaqgYiU=
X-Google-Smtp-Source: ABdhPJxL9iIZ+HGyalsZ8HcJwGeVT3uEvIXAyPennCwENsyNtPuJA9yWQJYWPYLFiyb/lwBb0ciA7KgQ5z3VEUDOr4E=
X-Received: by 2002:a1f:1844:: with SMTP id 65mr33732861vky.3.1635819696531;
 Mon, 01 Nov 2021 19:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-2-guoren@kernel.org>
In-Reply-To: <20211024013303.3499461-2-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 2 Nov 2021 10:21:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSDTXu7HsABTHfTbCd2TNpHBpzSMqYGh9Av8kzJ+6AOPw@mail.gmail.com>
Message-ID: <CAJF2gTSDTXu7HsABTHfTbCd2TNpHBpzSMqYGh9Av8kzJ+6AOPw@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] dt-bindings: vendor-prefixes: add T-Head
 Semiconductor
To: Guo Ren <guoren@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_192137_879930_FAC13E36 
X-CRM114-Status: GOOD (  13.14  )
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

Hi Rob,

ping? If there is no problem, could you help pick up this patch into your tree?

On Sun, Oct 24, 2021 at 9:33 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add vendor prefix for T-Head Semiconductor [1] [2]
>
> [1] https://github.com/T-head-Semi
> [2] https://www.t-head.cn/
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index a867f7102c35..f532a8830693 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1169,6 +1169,8 @@ patternProperties:
>      description: Terasic Inc.
>    "^tfc,.*":
>      description: Three Five Corp
> +  "^thead,.*":
> +    description: T-Head Semiconductor Co., Ltd.
>    "^thine,.*":
>      description: THine Electronics, Inc.
>    "^thingyjp,.*":
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
