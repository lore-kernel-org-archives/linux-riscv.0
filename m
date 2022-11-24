Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7693C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ju5irkY3rX/xfUf1BW996kkJXWhszr80g5nU+XParK8=; b=MB4uNJxCi0Nc/Q
	F9wEkbGNW4u47iS5q+TJYy1WmSOwMnCcHw9Gm1nS2eqwQuSOorh3YeJJi2FbhCubJDSebnveILuDj
	FrUfrgDEu9LCR2MCPaXl8ln2w5p+ldm/I8ebazwaCqo6QxjvgcVnXDZzraQqW849Q0v/0URUHOMj/
	aavKMpUptOkeUPmO73jAtHQxLd4S7W91wG0qoxdQ9pXuGlrJ+/3L8G9BcVz9OKJWooGoq8CfophLX
	vcBce6cPku1zLYvBk5ZmtauvMgcavMBHgFQJ0DVjSuUzRjqcKUNkHExbzGOZ8zzx/ze1fhCjmhjUL
	jA09JNoboluu/d1R6TXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8OD-0070Hv-Dp; Thu, 24 Nov 2022 09:19:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8OB-0070Fr-AE
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:19:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so792954wmg.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21RtI83U3AWt3cyeCJ2XmHc2ruDDyw09Go561vbFieg=;
        b=7q/OaKPtQ4IeYxQHQaC4aOn7zrvJ3Yr8RQyWvwQwcRu0jouQ1mzKgLwVH1+4CtBlT0
         WqqJ97pJd1e6ipFHKwm0vRnNnfYpGlLhc2UVYB6Y3U09PlrX4FMMxevbcWyLBOcWWvdL
         YPv7ecnuSiy00N+7f+ChYRhSk6+HTph4f7mDMJbWkd6ugWorOzKjS6YqG0JAZHmStWk9
         LcfhTIxE312OlgUaD+s8Rvw/FR0tfahl+821ZbxKeb7qg4IZqU93u76IUVMvn9sRUgy/
         C7aBU3zL62yibHNI9wYEf0E3JQhpAIlj8kMyT9+IlFD31olty3dqCnVlvD1G4WzsbGzJ
         Ccgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21RtI83U3AWt3cyeCJ2XmHc2ruDDyw09Go561vbFieg=;
        b=BbZYZDAphLQPzxMJerKK9RxtDuA/AjQF4fRQ1PJ9UZs+/hz4ducv2du10E6AprhZ2E
         ThSXOUFwd/ogjl9wLT6lZGzXfyK2+7PaQZ84r9RN8cRW6zgXBYIIknD5sU/yXUrkATfc
         AvH8PdAX3fn3Zrwih1m00FKm6/ORezs5WXZ7Cv817JaJO357uOk9AVbhFQ5vXfOupq1k
         OdxHdUemSxKjgW1Rh3uc1tdQ2bAdYJAGO8GkAMCqKZxRZAEfLWpBaJC9aiQcqCDfyRnm
         mSJ0icOEW8TuJUXW2CX1e9/UaduLxlm/RCT9OprE98hWPtwloHVxYcUYUyUWMw+qYTrH
         +2mw==
X-Gm-Message-State: ANoB5pmQdxRLxNDfwVusShxSabRHni3XNGwBLHYDovHxXWSaYzjijoku
	bkS/0Mr97c3ynMbPd6iC/1oPMw==
X-Google-Smtp-Source: AA0mqf44COThVTh8STo2F/PdfE1hAhOPrq1SYQrMQOFcuboOXsdNStHJxfmCn7TEZsRRJCXahEuHCw==
X-Received: by 2002:a05:600c:3b04:b0:3cf:6fd8:95a4 with SMTP id m4-20020a05600c3b0400b003cf6fd895a4mr22693692wms.73.1669281560664;
        Thu, 24 Nov 2022 01:19:20 -0800 (PST)
Received: from vermeer ([145.224.92.100])
        by smtp.gmail.com with ESMTPSA id b10-20020adfde0a000000b0022e57e66824sm898859wrm.99.2022.11.24.01.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 01:19:20 -0800 (PST)
Date: Thu, 24 Nov 2022 10:19:16 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	linux-man@vger.kernel.org, Jiatai He <jiatai2021@iscas.ac.cn>,
	Heiko Stuebner <heiko@sntech.de>, Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <Y383FE6/w2sLd4I5@vermeer>
References: <YqYz+xDsXr/tNaNu@Sun>
 <YqY0aSngjI0Hc5d4@Sun>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqY0aSngjI0Hc5d4@Sun>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_011923_381884_DA9FD2A3 
X-CRM114-Status: GOOD (  13.87  )
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

Hi,

On Mon, Jun 13, 2022 at 02:46:01AM +0800, Hongren (Zenithal) Zheng wrote:
> This patch parses Zb/Zk related string from DT and
> output them in cpuinfo
> 
> One thing worth noting is that if DT provides zk,
> all zbkb, zbkc, zbkx and zkn, zkr, zkt would be enabled.
> 
> Note that zk is a valid extension name and the current
> DT binding spec allows this.
> 
> This patch also changes the logical id of
> existing multi-letter extensions and adds a statement
> that instead of logical id compatibility, the order
> is needed.
> 
> There currently lacks a mechanism to merge them when
> producing cpuinfo. Namely if you provide a riscv,isa
> "rv64imafdc_zk_zks", the cpuinfo output would be
> "rv64imafdc_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr_zksed
> _zksh_zkt"
> 
> Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
FWIW, after some rebasing:

Tested-by: Samuel Ortiz <sameo@rivosinc.com>

Cheers,
Samuel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
