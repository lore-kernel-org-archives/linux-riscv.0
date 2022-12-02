Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A19AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 09:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jP1gM6rI4s32NLdAvmac56LVTYDQ2PE334BuE7jmigI=; b=VzrjbHxn2CdVXq
	wbtC2QCt+WGOplhbP8E2ZJbZ5A2AH9PP+gY57pf3noOXplvI/QNMpWIokjD21UsIR0i7nxo5ejfDL
	xWReQRWS/ASk++YmGTVAGjQ6R+QjmNM7xka4iqeTHS1Hpn/PzeOxKHuSQCv77yXrUlXuqZV9qsqk9
	T/n4oJPbHqaUGN3Yiv1uTgEhqqr6wMPJCjCs35RYsC1FpdEjhVY7y1WRhIe/jMALiMH0tCzhEOQcl
	THwv2A3QzI8l4V/kfjRUuiCkPL/tLzi+tMFhslgrw9pBHU73kE0OEU2tzTakQiT1JEfM+pvTK6bTH
	brpwsdpq7ZKJBC1BuN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12VR-00F2lV-S7; Fri, 02 Dec 2022 09:38:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12VO-00F2iM-Qx
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 09:38:52 +0000
Received: by mail-ej1-x62d.google.com with SMTP id o13so10293426ejm.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 01:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJDjgBXpMszFeIAvqAsFvMh1NYdd/aFzFWK8zEmUqAM=;
        b=U9mb0G6OeUfsr7F5qkXSmk4SmSORG85/hynvQ3+ZvNSDVJJSF9UUp3dvjqnV8dN3AQ
         b8R7Epvw/vVnuKFZZBf5CX50e2YB3bNRbr1mX5J0Ko8RsXQ3c+73nnbWgmYfpAmNl+OP
         EfWByawDHJnTPX1QmdsVi2NPI+6qDT7QCHLa9n53KBCgCDH4mUUgHaz7DyJu+4xlzFeK
         RTu5Y8Xc6hZ/yg/OwmvtBWTpIEkMZtMdUJtXa7HIrm0xa7FpGRfSa8ixUoBojckvRZNN
         liIEKa3Cg7ntlatroMxJOSoU5rLmyMMZDXHw73yebWyq282HSXPnHCIXP8tYyA3PMOgB
         rUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJDjgBXpMszFeIAvqAsFvMh1NYdd/aFzFWK8zEmUqAM=;
        b=bKdBytIYoqV8PPSg4/1ONSBhIRR5fV1MqdTjY7jQfxlU0b5bqLz8kFKDXP2Fu7UNFs
         n9wjlhsVl3jNNRnRWIHrdh9dul1/bhWGPvanbfzxzY+hEcYIjBYrYmFv5bdHD+mRYo8Y
         3HgcEYMRnk95PXIMqfFS/TYqhHoVxcU3rlfrR5YCjcELqXJtWIro0JOjLeG8V01s2gBH
         VVGeCdciNxYwzGeFLtRuPKQwKvZkyDVRqIh5b7PiFZdQxjLQq40eNmWvrJT7u+bBhKQT
         RuUVF5KC5UAvmU4oTCSfIiFEYB1/D6hI/bDu5a/Aa7tR7gB8CTUQux0JoMCKfzvgmUao
         Y/dw==
X-Gm-Message-State: ANoB5plY2Ufp/MxMLxlM9QrCr/aX0tM1wOUgTEs7vQhDqYbADiXz8kCh
	DrBjzxORx34XRsMvHK4hDrvl8KAY/t5uUYkIupY=
X-Google-Smtp-Source: AA0mqf7FIABNiGeTLlM0hVvJiKrNKmFgn+etb0uKjE4IT1Q/r1PLThWQVRPMXCJk1tD3bz6ZJt+mnaCfzIV6oA0v5mI=
X-Received: by 2002:a17:906:9497:b0:7c0:cbc9:ab68 with SMTP id
 t23-20020a170906949700b007c0cbc9ab68mr635147ejx.155.1669973926567; Fri, 02
 Dec 2022 01:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y4k6ct+iA4j0NZgR@spud>
In-Reply-To: <Y4k6ct+iA4j0NZgR@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 Dec 2022 09:38:20 +0000
Message-ID: <CA+V-a8v5-nz_f-_P=L0miBPHOVAND-V8ed-tVttXV52nOJth6w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] AX45MP: Add support to non-coherent DMA
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_013850_910100_4FFD9A1C 
X-CRM114-Status: UNSURE (   9.82  )
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

Hi Conor,

On Thu, Dec 1, 2022 at 11:36 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hi Prabhakar,
>
> I'm going to mark this series as "Changes Requested" in patchwork since
> there's been quite a lot of commentary and it looks like Samuel & Heiko
> have both suggested some changes.
Sounds good, I am working on the changes requested.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
