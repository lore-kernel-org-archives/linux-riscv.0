Return-Path: <SRS0=G4ZZ=5T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265D5C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 15:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0646206F8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 15:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDAVbUKK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="OO+xU9Zj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0646206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/xm49Z++pPKUR61EZS+Ss5H1dGEkXCmYNh/ZHByg8BY=; b=vDAVbUKKpelynH
	JQCE5hVeA54lboJfYxzrbMbOrr5AqwkPKvO0pWeDHauBMw46VwXx2LXhR4xwHfQmrkkNEFdj4CljX
	rVF1GrPucWxfMoULtQZAcu2J+vB1309ADolRj+hnyRx8HufU57VFocPAuVPntPEzGvM/JjwlPij0E
	6+0WQ6CLml38RCwgUo1+CnezhV20D2DscVXChYSZcILEeteLJPb25zk4CSezbzG4s0JVeEZqiNzjj
	1fX47DbeghKDk7vY17jVPTuXdPkSvdoceKMYw0X3SFnZF5n+AgNp5htN3fxnqUQVrE9iirzW16DSo
	QZL6Tt6SrOyMxFY8hQpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKOdI-0006SK-M3; Fri, 03 Apr 2020 15:53:24 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKOdE-0006Mi-LI
 for linux-riscv@lists.infradead.org; Fri, 03 Apr 2020 15:53:22 +0000
Received: by mail-pj1-x1042.google.com with SMTP id k3so3101702pjj.2
 for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2020 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/xm49Z++pPKUR61EZS+Ss5H1dGEkXCmYNh/ZHByg8BY=;
 b=OO+xU9ZjWeXXBbbxY54oMK9qwQpE29KtSHVy55/UlQcomZeLThV9L5zZ2jkhnO/LaX
 mWOwjVeSSqF52W+F7oU42OZMvGz2m06+xM/mXl6YK2uU0R2TXYQcVCCdaPirZ9tcJ6Of
 k7lJp0LdY6iwI6zFWeCgs6UOhZzHDs4gRgi1uuMv4bhxufvGCDjSrW6QUJj886V7+YPW
 CY+DuxW1ixapCWIgtrcyaqakmCSBiK7qnVtO9m5CbORft4ufPleGpNufHUMyoQctmH5V
 STd4bg080tVmzFpXhSi9LfmGfB3f1ahWXQyH9xYeFjWYCrgbm1d7xrfZm5MSDMrE4Vgs
 yPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/xm49Z++pPKUR61EZS+Ss5H1dGEkXCmYNh/ZHByg8BY=;
 b=ov2K8W/0tPX5hVgd/rhTMoy8vbPzciLQIws4nOL8eh+t+yDYHbFHi752MSMBRIV5M2
 7TyqMF9xvsctFrRgojKltEpIFWQosryi3h2Wh4hSqRpHni1s6t4lqd+Ai/wVJoZxIP2t
 N+9m16SAL0LtPvw7CV/hVFKUwTxZYuHw77q3ePBlehksz4JR9b6HBA+xZIWEC4XHstWz
 7L5R3dEwczKmcN+/n4Nin+OBQ9015BCT/2mV1sdS9DfPsvfUGbYv3hc5nj9Z7cg8Vipy
 3QUNWS+FGA7MowEVVYffJDrfUbbEKbH1J885O2jluYe4rDs/03irLAgHyFYaG5tewcOX
 lp4Q==
X-Gm-Message-State: AGi0PubS6alPNFyxDPE+aMGjytf5TswNYDBj5O/AbnWyrYbPio+/pgSb
 9/ip5NI572zhsr1BlIL4IcO0qg==
X-Google-Smtp-Source: APiQypI5TwXVtJtEQDczHc+8pBRTgdZNzjuGiaQfEhTxLcFOZnq/2CVnVL92LFNHOX0GikIGpdRb1Q==
X-Received: by 2002:a17:902:7046:: with SMTP id
 h6mr7980617plt.250.1585929199901; 
 Fri, 03 Apr 2020 08:53:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 67sm5978019pfe.168.2020.04.03.08.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 08:53:18 -0700 (PDT)
Date: Fri, 03 Apr 2020 08:53:18 -0700 (PDT)
X-Google-Original-Date: Fri, 03 Apr 2020 08:51:17 PDT (-0700)
Subject: Re: [RFC PATCH 6/7] dt-bindings: riscv: Remove "riscv,
 svXX" property from device-tree
In-Reply-To: <20200322110028.18279-7-alex@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-264d030a-d77e-43b6-a2d8-d4598205e2af@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_085320_693793_DDFE9275 
X-CRM114-Status: GOOD (  15.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: alex@ghiti.fr, anup@brainfault.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 22 Mar 2020 04:00:27 PDT (-0700), alex@ghiti.fr wrote:
> This property can not be used before virtual memory is set up
> and then the  distinction between sv39 and sv48 is done at runtime
> using SATP csr property: this property is now useless, so remove it.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 04819ad379c2..12baabbac213 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -39,19 +39,6 @@ properties:
>        Identifies that the hart uses the RISC-V instruction set
>        and identifies the type of the hart.
>
> -  mmu-type:
> -    allOf:
> -      - $ref: "/schemas/types.yaml#/definitions/string"
> -      - enum:
> -          - riscv,sv32
> -          - riscv,sv39
> -          - riscv,sv48
> -    description:
> -      Identifies the MMU address translation mode used on this
> -      hart.  These values originate from the RISC-V Privileged
> -      Specification document, available from
> -      https://riscv.org/specifications/
> -
>    riscv,isa:
>      allOf:
>        - $ref: "/schemas/types.yaml#/definitions/string"

I'd prefer if we continue to define this in the schema: while Linux won't use
it, it's still useful for other programs that want to statically determine the
available VA widths.

