Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C277C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 20:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMIjrWmdvOOCWNYcmqJUanuD9MWoXvOy0M/RSgv4e78=; b=EbND4XL/sC5Mjq
	uTVPSmCAwLAtRp5rI8/tp9KM+2WfOO4CPvD557y1+dP3tbWNI0PPAumRvXtstAro6lweS0fXaMkIg
	+cuhe5bdo9O0brMhSFcfNrTEkBsT7+57AFWuyZhuvpsILpnGgy1FlTWmGNOsPRywcvckOGxu9LoxS
	ZknAzDZog6eWN9pLi7XqRa//ZwbJBfoJw3fGYAqyHycxShAhAz3osc+6VTQqeeAtC02OBvze3MVDJ
	xummClO7bS8gizraOnfoYvXh1LpkqgS1CXWh2MNI4cj3jlRoKpEsbE2rUpXk/RMjFxjKSk1C42fAY
	TOQS0mBrmIHr2CWYj0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4TCz-0045sm-Rx; Sun, 11 Dec 2022 20:46:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4TCw-0045nj-Hf
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 20:46:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id m18so23284437eji.5
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofUsYatJHKkBJOW44o5dMOGk+XoEwJHL7slFatsKKXY=;
        b=EwY/soJ3sqfqK473neYBzdCKAzNXo7i+sLYLfL6v1iYm/LhK6QlyPAbWyFzjGm2YF3
         UYmExBlrQEIkt8pejFUijbM4hsvUt2yMHJMYqcPJVcRQ9yq+rkDPp8zLRdK5+U1QXPsu
         hqlpUjSd+NzjlDMZdQC23f6cmFjYt+pK+LK3MySBWom1SxZfL1f2j9mTtK2wf4o/IzKt
         6NivkL+Wyn2bVcrGiW6HVgLfNt5aVCZvaJOoWjkdCpW4YfYzC2VJQwHLW8mhegI2GLz4
         r1iTqSyfM+hOR6avzX/iyu4/3SgRwuV1L93NtxV772+xspYZX8NXeoWeMzB3uNru7vBb
         CTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofUsYatJHKkBJOW44o5dMOGk+XoEwJHL7slFatsKKXY=;
        b=nm62Lfdvwq5+5duD977Z/yzYwZoF6oQlJlkbDCQcGK+Lb0Q69C+iKPz200Yw0eMGHQ
         xKt2koGu1ZHNT2szYNqTAKdRvrRkCBL9ZK0s8S90ZLkJtNuGP4uBrIklJ+fm8JxNlK9+
         IaeLpFo08WaM3LElQH3OsGHx+RrOSwJ53cva+sgoCPcpa5Zey/LXhqbrN+GBXh38yphf
         Oclh8J+bNuGO3TEGhwTMmZt8P1XrU1H2xMwnC9X4Q98PP216daAW/XA4jueQ7+Zc+u0p
         Zpcn4EI8nqT+UShBUJ71MnxXQ/d9XBCN/tCLa2PI0fS9fvrklYjop6mlh5ENkpha/Iym
         SfbQ==
X-Gm-Message-State: ANoB5pmUZ6XB2OZnGj7DM5J6UaJa2wTD6kU3JLP47+Il7BIero/cab7G
	mVj/v41/K25DGWRGU1OYvfWaxRwS5QBAv2OfnCA=
X-Google-Smtp-Source: AA0mqf7fwn82mt4ToAH+MMK3rDe/8f5qp5g/H6DkpuGE7t5Y08TdKVGj/5UdXB84dO+LHLi0B+w1dutdyOUy/HAULlw=
X-Received: by 2002:a17:906:2793:b0:7c1:174f:d69 with SMTP id
 j19-20020a170906279300b007c1174f0d69mr8277029ejc.447.1670791551070; Sun, 11
 Dec 2022 12:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-12-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-12-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 11 Dec 2022 20:45:24 +0000
Message-ID: <CA+V-a8uTdEjsGRG+Ao0JeVbfaHcJ5AnTUDOh-_yjmjRzb+jNDg@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] RISC-V: add helpers for handling immediates in
 U-type and I-type pairs
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_124558_627094_D0E5D29C 
X-CRM114-Status: UNSURE (   9.34  )
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

On Wed, Dec 7, 2022 at 6:09 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Used together U-type and I-type instructions can for example be used to
> generate bigger jumps (i.e. in auipc+jalr pairs) by splitting the value
> into an upper immediate (i.e. auipc) and a 12bit immediate (i.e. jalr).
>
> Due to both immediates being considered signed this creates some corner
> cases, so add some helper to prevent this from getting duplicated in
> different places.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 47 +++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
