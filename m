Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB2CDB466
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzU0p6vDWpoDjVccxZw63hLAClADk+7BQSESsSWQi6c=; b=Ye9rtDVegEu3whvs60KPF0CgzX
	OaHh6VOnsdrZMdJ2tKVoDCfpZTVvfg0d4Mav3jSbGuU6hDS8fEk+6RXnCJ7JTRBByGRjXemFFQGnN
	CtVVktIB/Wg8MoeSIJ2WT5bREqd3h2X1rkk1Xkpprry83e6yCsNSRClclOpcpSO0h7HOJfbK822JY
	Lj5qxbRUcgym9wiv0ehXuY8atJdhqxxlP/b8pbSSQH9SYe1ctlnbWzh9wqgSuhiRHtlrJYwz7L2jo
	zRLVsHNoAmFDS5pCjGFw5Yhg7Wyd1ePB5POY2QxceRmNaUq2N/7cOfF6r/EcR//AhALwDGDUiZvlc
	3fZsxGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warcC-00000003IBb-1P4w;
	Sat, 20 Jun 2026 09:03:48 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warc9-00000003IB9-3joE
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 09:03:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2515631b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jun 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781946225; x=1782551025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vnaC9u5H2wJSRqMHidcxYwZxkhPyhVvcFpavNr1emCs=;
        b=CZTsb1xjtG2TNhteS//hcgHzjVNNQKn+iildVpL2ukVRZTUYvxe9nWhzX6+l1oqPRh
         4dvJIBZbyViHeRtevsEbDMREnVWuIhLwicHeZ7ZH74+wtXp1EBSw8xWdEcCBj5Ce2yHs
         8KkjG6BG64O7I8o6MJjo03aUYTOhtD7Ii+AgmiRtR8qO/YFtUd/e0tm9xWmTnzVhEyBH
         XwYIZVn7NqKa+DpuNdNg9sgMEbrnNsCFyHymgBTCh/Tj8Z1ZSr+LrPQi92h/Bnvjy440
         zqq1fxAIykj8snjbhQVKids0fnoSLn9l6Mh5CeQ0CCpNpINbNjnVWGOBray3qIm4G8dj
         oeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781946225; x=1782551025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnaC9u5H2wJSRqMHidcxYwZxkhPyhVvcFpavNr1emCs=;
        b=iE90REr20xtbxQHRSm+KllRy+0nkdkqShtbwstPpPYlOcJ9PBOkbWQ09La+12O5gqE
         MT4kLcqrcrpCBbeQIITQ5UiZCjvNNZ5hqycp0/jnyBRYV757HRlHyaFpJs4F2gJFuwxx
         JMYYCeGxPek0HXWU5n3SPXu9Bt3fe6FFVTog20/lTfxnCIm+7A0Ughf5SjhW4anY2j3A
         tNlAikYVV10/+d7ptU20ixVVxHqyS7AZXXFdHUehjYCy05ONlsZRRYF2HowHO+5HCmgP
         IW1U76tpkCGG8cfkTM/UXepMhA/sPxKCDt280+1mIcfSZxnKl5YGUGNLZaIgytqDpCbW
         a7wA==
X-Forwarded-Encrypted: i=1; AFNElJ/vjNBkl6rLO4JvqaLAzkRv3l9D6sqdN0sH5Kj8kl3zF9tyEC0fasAoK0XxjdKC4Ch5BZQbp3yLM7Zl+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEYwXcLj82RMQhDF8jPf+Z/RtzLAi6xCdSrDus3WwWycnbBJcL
	sROWKMXmT4Y5HuAPej50XLpxDVtnYZTbr+U/5AmYzy3pevtFpVqzm+KB
X-Gm-Gg: AfdE7ck4n5mNxI6+GVURim75SjIfQjRAia8n4Vgexj0X36vVUGOril5AibiEADZkFqp
	3rghuZ3u2DwBF7sP+BFZYlyKKUscfEnt9yTIO+xsT192TP4l1PcnRPkKRedUHeU30Ck/r82h642
	O+0CBFk8W8aQL/Eb3F2/CzqOzw+IOGdkDLemqBwnkCYhP/fuFU4Xc8Ai6n9WakP+ZDbRVc6NP4w
	08Cz2Zd84tsRh8KVnLM25OVZ6wFTjBk4R6F4k2lljXfbutYy8U7Am6P31LRJtOew91BdWT7SHES
	PZ1GC2yP8MR8YIz0AOHQ46+UhECIYYQyZkv/dI1ZFalBYlNiQi8BEwLiD5SlwjhFbRdWdbvLZ6E
	aFIMlBPuU/kqEzLjap0byrH+Dh4OnVBHHqL4qVUjI5QkklXU55MhVfQ2v4XqC
X-Received: by 2002:a05:6a20:431a:b0:3b4:640e:f6b1 with SMTP id adf61e73a8af0-3bb32914066mr7723228637.10.1781946224670;
        Sat, 20 Jun 2026 02:03:44 -0700 (PDT)
Received: from localhost ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc374375csm1885419a12.13.2026.06.20.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 02:03:44 -0700 (PDT)
Date: Sat, 20 Jun 2026 05:03:36 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Guodong Xu <guodong@riscstar.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/5] riscv: dts: spacemit: set console baud rate on K3
 Pico-ITX board
Message-ID: <oktm3eodc7xk3cdvxtjudycofa2rgddczh77zz5neef5w2mzzd@sh46luoxt2ln>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
 <20260620062238.3199108-2-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260620062238.3199108-2-aurelien@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_020345_932233_FC06056F 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Aurelien,

On 2026-06-20 08:22, Aurelien Jarno wrote:
>Because the default console's baud rate is not set, defconfig kernels do
>not have any serial output on this platform. Set the baud rate to
>115200, matching what is used by U-Boot etc on this platform.
>
>Fixes: 7a6131804986 ("riscv: dts: spacemit: add K3 Pico-ITX board support")
>Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for the patch.

Reviewed-by: Guodong Xu <docular.xu@gmail.com>

>---
> arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>index b89c1521e6649..509cebc0c9568 100644
>--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>@@ -18,7 +18,7 @@ aliases {
> 	};
>
> 	chosen {
>-		stdout-path = "serial0";
>+		stdout-path = "serial0:115200n8";
> 	};
>
> 	memory@100000000 {
>-- 
>2.53.0
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
