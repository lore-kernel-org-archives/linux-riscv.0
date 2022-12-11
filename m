Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ECAC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 17:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1peXtSYn8QGBbRPoYwzJxi6z5vr8ILAyVHRSRwYUn+A=; b=v86685pm/23CSv
	6iF5OJu/lpprQfCl0alsb6JebeYiebwjWUMdcwIDDEue5rTwe8d7N82OuxqXHUuDsBnexQO0588sM
	nmurNA+o7Oe9/i62PHWceb/H4xDW2yFnzR5HR76iaBDaX26xazr/EyJq7MA2oHvX4MJtu+Rrr99LP
	6caihZPrKOFWATxmHjHevWgMiUIxrgUwBA6+vOT5hrngPAQ9Z7w/IHtbzd5a1MJXfcJtvmso0VPeG
	oVlGhjIiJRnGwoDsdOWxM+b1G3bsfA2/sRkdP9/rN4oXXNRNahgjgvqE6rCrBJOXo0QHArJikW3x7
	Wf5wyXa6knRkNgmtJP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QGa-002hhJ-GJ; Sun, 11 Dec 2022 17:37:32 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QGO-002he4-Ay
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 17:37:31 +0000
Received: by mail-ej1-x629.google.com with SMTP id vv4so22709163ejc.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4M/rIkE9eBV7Z1IDBfWkyd3wCgnXuWYL9AvYZaRxNYU=;
        b=CjHcnJZB3n82HgSjX8tis5+ChCZugYGULUv/43D4AbmR0pcCJfiWCLtS6uf/epYMxa
         KtUvT9rBMJojUEAG/2Ont4ISTh7Y1mpwO/+bpAwquU9F5z8bAFkD2YM73aVPxp4fGM5g
         QKW+iL5YKiHN3rT4XvA1ot4vHkbmEP7QJtR/XcO6IaacfjtikHRvkHnkLM0RsQPGa55Y
         mHvVIIf1602V6qaD9/ZYCiEsX676tSjzKwLlv76pewrMKZ6MRO3wRIcc0adcPhFcxHTq
         AXqgW8aPtyc3uBEAVM8mahpcGf7WJ7VdlZnh6UhQTYbf9FCLYaHVB8WWtb/9WnAB+7nR
         NqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4M/rIkE9eBV7Z1IDBfWkyd3wCgnXuWYL9AvYZaRxNYU=;
        b=XGWqjt8wEzbxhey7+u/S0dqwm8O/zEgpvjRGjV1GL+irv6JwmWSp9N1JS+GzznB8SU
         6lx/INoIPO0aGf7TO1VtyAZgCNpJ+vt9PIH905872AVPyaH+EfnytINP/aMpqJg8VnCH
         AS0cGO/Zsfv4OZW8cUJ/Ge/P58u5UJWQflmivjbqqeQCe5gJnb7pzkW4Hxb1j2zYcVye
         z1w3h+4BdtENJfmHNx1BneK/UdvyaeMSHWlGwnKM0IuZ7ei92eIaN188j2CCeDZhOKvd
         Hn1/rkZCYuWF95EEt4TSup/PRjyZ2/zJgNHADCMjkl4pSZrXNAr2OWE55Z/lMloykK7G
         Y7jA==
X-Gm-Message-State: ANoB5pn1puW+sKBJSoKah4JX4sIzlJuj9b/vzghaqrQRxDFIZx7RfHYe
	gTYUWrxETqJ7C1yrnE3B5N9XVHnsU4ybAv93roA=
X-Google-Smtp-Source: AA0mqf6YQ+o7Bd51myOcnacoA1kmp7BYX0i9CB4XjGIbzwq+J1zwtFNpPRWzsuMNohfuhCiWiEaKDBBnDAwBdPzGGn0=
X-Received: by 2002:a17:907:11de:b0:7c0:e4b6:47a5 with SMTP id
 va30-20020a17090711de00b007c0e4b647a5mr16945941ejb.480.1670780238048; Sun, 11
 Dec 2022 09:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-10-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-10-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 11 Dec 2022 17:36:51 +0000
Message-ID: <CA+V-a8sEC0KJYuqhmBR+c2qYm6C=3MBL_pXZpkaVpbH8WLPErA@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] RISC-V: add U-type imm parsing to insn.h header
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_093729_930222_7BF19757 
X-CRM114-Status: GOOD (  10.62  )
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

On Wed, Dec 7, 2022 at 6:08 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Similar to other existing types, allow extracting the immediate
> for a U-type instruction.
>
> U-type immediates are special in that regard, that the value
> in the instruction in bits [31:12] already represents the same
> bits of the immediate, so no shifting is required.
>
> U-type immediates are for example used in the auipc instruction,
> so these constants make it easier to parse such instructions.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
