Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC22C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 01:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvfNA6CWmlBofVT6QZQ8QGEkrUOBZOhJIeUhYLcOTT0=; b=3e3m7tkzECGvNM
	2ch1BV1tm9m68v9wiTauLh/Zx4Zm5CwPtai5ov6OPl3rxjbvF7xh+Yxktf1Q1xmkddcqTblNKvmyb
	bX5eTZMX+ihY61+aXy/0/wPgYfIngUby+Mc2tc7YagLnxH9S/WU19TNkuLCHZwcOfnmyriwM0KZ9t
	a5Djd5ebzwqwGNJna3gnELJyJ6fWkLWNIvjh7AGQJ2jMhBhZviarmurWFlHkkji7cwXOXbAo2FmRP
	YmdczhDfO7QLDELac/kkuVEWPDfdUQoZtvF1YnHrjcMV1NL4yh9P1YRksgadc2htsvqDB6pezq/uZ
	AQyb/7ucsDTZINohP3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ0m4-00AfMn-BL; Tue, 29 Mar 2022 01:35:56 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ0m1-00AfM2-9m
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 01:35:54 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id t11so29150570ybi.6
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 18:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UUMDHkRP/8Kobp4SqOhIfI5YC+CFPdiLYdQuQeo5ONc=;
 b=ds3x1f5M4qmFLSp9i1Lf8czpJ2ro20lGW+k29/7Je9+ABb8oScKI06t0yhPbG8Kq0S
 bZ2C20GpcKLmlxeZ77SBo3m/MqXCjWS7JFdxV0Wci2OhW3/6zO7CJ+nvVx2R0k+tT3st
 0gtMwhXqWxJ3ULbDnuVyJjUJZl8hAKfQ4+TfMHPKff0ehsR8kziHfIJm/2vtl1SZxwEg
 bujOSANdLiz2pTHsXsWc/czK4ZHFCme4KtKuacXoO9ckL4brvR6p/6b56dTgWNuFYjhU
 ZcRJ3hqaw9b0IGS7tva0ZoQP8G+S7OTVCeTDp9BeBleuaSEu6XCKu+puegfofCW2t5r2
 ZSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UUMDHkRP/8Kobp4SqOhIfI5YC+CFPdiLYdQuQeo5ONc=;
 b=hmjjRi8dG4CyOhyQVGXm2HwDzPzDKLSUfcrIgKgHTd1YsqtyKpBR3pszezM5mwiyVf
 29C/xoXQjBg/pAcTZynsNmVnhXJGfgxZUfIbPkgHjc3c+M9xgp4/tvwo19Xa5HACWrly
 dAiTCObhUVawNB149ZFAIm8JStZuNh3zUqS/sOGLCoOJ+HmMMnaQRD9Hgo4ZYrf26R8y
 JM+H41EHU9fYLCzCm+MarpuPIIgv2mC9LrkFqGg3FujPoQpD7F4V8prJ/3SNcHPtfPF0
 TlkgtV6PJR5gji4uvQmtvVbE7AIq5030BknFCLn1um4Woek1MDz0KVXExweyKcNtRnWY
 cfjA==
X-Gm-Message-State: AOAM533MpBC28KI5hxLB0S5YhOpDiWuqyBIT8BFl9jB3jvdcUjLcjC6d
 0J4vPMrWcpbMbjYzi0ZbsAuU8hxdOuLI2W8v2D0=
X-Google-Smtp-Source: ABdhPJwMicyHr4xbXXojEjRJ03bg1BdpiBkV88I0GL3Zt5Cq/INEqoCBMdWWNfR7Tvl3MMcPhTbTsWgRwj+E1Je693A=
X-Received: by 2002:a25:d456:0:b0:633:6b35:bcf5 with SMTP id
 m83-20020a25d456000000b006336b35bcf5mr25408116ybf.239.1648517751767; Mon, 28
 Mar 2022 18:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com>
 <7cc9a7b5f7e6c28fc9eb172c441b5aed2159b8a0.1648461096.git.zong.li@sifive.com>
In-Reply-To: <7cc9a7b5f7e6c28fc9eb172c441b5aed2159b8a0.1648461096.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Mar 2022 09:35:40 +0800
Message-ID: <CAEUhbmUYZ=htiQUwiLZuBufj7=p6ATR752N+qUn-=Gy7Uz04Uw@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: dma-engine: sifive,fu540: Add
 dma-channels property and modify compatible
To: Zong Li <zong.li@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 krzysztof.kozlowski@canonical.com, Conor Dooley <conor.dooley@microchip.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Bin Meng <bin.meng@windriver.com>, 
 Green Wan <green.wan@sifive.com>, vkoul@kernel.org, dmaengine@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_183553_378470_AE8D478A 
X-CRM114-Status: GOOD (  10.50  )
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

On Mon, Mar 28, 2022 at 7:56 PM Zong Li <zong.li@sifive.com> wrote:
>
> Add dma-channels property, then we can determine how many channels there
> by device tree, rather than statically defining it in PDMA driver.
> In addition, we also modify the compatible for PDMA versioning scheme.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
