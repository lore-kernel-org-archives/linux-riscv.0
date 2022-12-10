Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E920AC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 23:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRdTtabeIzr4OJXkhxHswzuZR7ZBZJQhlpdgyurisH8=; b=YLOiuFGi4r/TPk
	pJRnG67BrBDrE3MQf+AgU7sZm8VAIdPuPajQH8U7aVtzCsO4GjG1CpDIKy1cCO42UNgZKd5w6D9bn
	qXVhKsUzewSt+/BuGZ4fifYY7K366FbgAGfXqXTEsSkPqmsSzyNXkmf+jkinL+z8AIzTlsY5P/Vdh
	/4xsxGuaOkObhIbqSA+T0f8XGxgDiRB0UTD0BcMcuwBcr6m1OtPcLQj20oxsZ8hNJ1Obt/UjVbB/i
	eV9w08lToSUX7lulMN0YUkIv0UwLXc5msK4MuOtEZYfzwTEvegx6rGojZjcWKUO0ni3fmeTFvSzeK
	4hHs0Rhxely7su5NW8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p48xj-008g2k-8a; Sat, 10 Dec 2022 23:08:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p48xe-008ftJ-DH
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 23:08:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id d14so7935130edj.11
        for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 15:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YcBCam5R1geCv81LTWo0CywyVGAytaUpo4rZd0a7FMA=;
        b=VncMZtQ5cNNaeqiFh3r5c7O1wDu4HbfmjNNEvPujT2+35c5QEvbtOaA6TGhlKlHmk6
         RkiKXl1EhmPOZkCBi1AKJIV9QoUiW9fNmFrlfg+P+F8iaNnO8Q9EBSQe6MssMrSudQ9H
         63UH0c0mGU9ByZN0cXmQG86LBn60T/xPTfTgkveBTAPqw8C0N/+WPZo0xAeFsX3l1f2e
         otKZBKYmbYZNeFnrIUGCTuKJnNZ3XQZ8HCql5ukLArbxOUfpJ1PQzQi8P+8eeTjjeq6S
         vgJDMdL19+InJ6qxIRVzIussqqPjZNpDv5yivaXTWmZ+LOT05A9mTYjrLh6VcLdf7Cfl
         fSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcBCam5R1geCv81LTWo0CywyVGAytaUpo4rZd0a7FMA=;
        b=jqHkpw9gDO0LZDb2lBfUuDsp+nfshRvTdHVyUuSXdbgCXnw9cfGiF6imgHvyJpTYUf
         uaeDxM392ucdz/+tS+VwQBoEAau9Uw2P5UJ5D2KXVKbf72k/YBZvNJm7ip6c8fhC7/or
         7MfxqyTJm7xAg0RFf80cAE+4NhFkHRWWTnB8lfrRnVs+Jdef41afEvTRh9PG2yZkDg1d
         NESY2MRqB60sGFXrQPb0ROkNNPYKXhFtEcvbUQ1yptXxOcD5nQ4kRKD3ltYLy1GEy6ga
         H4br5qAjYHEnjkbYETlMWYX3SsLAeKUWmXFPbhOlvKtsfCAyttNwHKAKzyGeA3a7OhZr
         DqMw==
X-Gm-Message-State: ANoB5pnrhrunTYnBjGgpO4SgjG3JABGRinWccwZvkKGZf6aEYuKPWEFt
	WKhGp0wejotRmwd68ULtLfLUkRoK8b0mpJWPNic=
X-Google-Smtp-Source: AA0mqf4oyemrNBrjJUve7xRpC1Ix7xtaIHEWBRnmDmbYvyicf7xIblXhjYfz+u/ER6gCmEN6juTJ9FtZGHHGL87T9o0=
X-Received: by 2002:a05:6402:f:b0:468:56c3:7c8 with SMTP id
 d15-20020a056402000f00b0046856c307c8mr12745701edu.109.1670713728248; Sat, 10
 Dec 2022 15:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-5-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-5-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 10 Dec 2022 23:08:21 +0000
Message-ID: <CA+V-a8t+uTLExnB6iDSAB-d-CsXBdrmSUVrLqSr97tatP26qOg@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] RISC-V: add ebreak instructions to definitions
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_150851_696228_567C8B62 
X-CRM114-Status: UNSURE (   8.04  )
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

On Wed, Dec 7, 2022 at 6:08 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> kprobes need to match ebreak instructions, so add the necessary
> data to enable us to centralize that functionality.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
