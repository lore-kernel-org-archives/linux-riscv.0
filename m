Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92561C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 18:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2rrpVvFOal9V6yjgZtoyZZG4SN1yXorEcYoGnoVGUA=; b=SDJEuxfpF+6Dcr
	Ao8r/IvyzC4BTXN2r4e0klzvQMAAJnZa4rYiF9USK3cdYwphQ75/u5bxZ2G8seGQK+cCCHo40xinZ
	FG7mfs9aYj3TAa2de2wPQBsl67SH0bi66aAcGzN1y/ZxdsupdTS/ZGLJqTlUHEKb4+HKsKjoKKWg5
	U8eQzbKhIGfuLsg0JcDqB/KvPQr/kAvNvRM7EZpcq2R6yboJOxIvyaUYa0GdUmrGpSQatBE1ciXy8
	6HcBmhPp2jB7Rmw4Hvsy2aMRB8TCU3w5o0V2NVI4oCGcO4h9m16d0gR/cp189AgLTSGHfiATajFXQ
	EJROjleGb9DrIjCDAsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsXj-005eSO-Kq; Tue, 19 Apr 2022 18:25:39 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsNY-005Z5y-Uz
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 18:15:10 +0000
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-e2afb80550so18414390fac.1
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 11:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0f5ESvk5no91Evc+VlvCmzhRMl9OaSk9/2vAcz9fKzU=;
 b=VYOKEJHBjpPZEQEEZT4XrGlhlnmoFS+gyNul+ekn0ZJ3Fdf4MCQZAkauv3HPCJ5TYw
 iy6Zo4OXth5lt2hjQJI7vJnC7Pwgs6pZJSl+e2xRYxM9NWqkk3xHWdtURire20ruU4EX
 aIQgt/27CSC5pA9uVbSvNbfieM7F9M4qEAvpraEJia8eZ0dRmK7hS7WNLf+1lS5oGHC5
 oY3o8ZNXU10/OWbVYHlMWuuS3tURAykmemiXNiKJ3WKKi/zvaURS0ItObbXEol5T8egY
 7ytUmhZDCwonPRdnm6PDQ6jGVt4ZC5KrAD35Yx/SAdxPReWfntvNiH0pTMDsDlq15mZv
 XVtA==
X-Gm-Message-State: AOAM531FZMHGs+PfSsXvPWm89dbCXjRVuFtC8kEfbNX/tZiUt8ymlWLC
 24W5uh3NttV4jsliC+Q4BPvGFKDVxQ==
X-Google-Smtp-Source: ABdhPJx2f2P2BP0Gu7JNPZo5Y3Y1oiwvqFlWJ5xIXkYbqjgRJvbsWsN4AozuJdoJQCM/Km1ZXLDIXw==
X-Received: by 2002:a05:6870:51c9:b0:da:b3f:2b75 with SMTP id
 b9-20020a05687051c900b000da0b3f2b75mr9133260oaj.276.1650392106357; 
 Tue, 19 Apr 2022 11:15:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j5-20020a4a9445000000b00329dab1a07fsm5694911ooi.17.2022.04.19.11.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:15:05 -0700 (PDT)
Received: (nullmailer pid 3086196 invoked by uid 1000);
 Tue, 19 Apr 2022 18:15:05 -0000
Date: Tue, 19 Apr 2022 13:15:05 -0500
From: Rob Herring <robh@kernel.org>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] dt-bindings: riscv: Add mmu-type riscv,sv57
Message-ID: <Yl78KUfJcu40U5Fj@robh.at.kernel.org>
References: <20220414151639.1359969-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414151639.1359969-1-niklas.cassel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111509_046807_792C87FF 
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

On Thu, 14 Apr 2022 17:16:38 +0200, Niklas Cassel wrote:
> sv57 is defined in the RISC-V Privileged Specification document.
> 
> Additionally, commit 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
> changed the default MMU mode to sv57, if supported by current hardware.
> 
> Add riscv,sv57 to the list of valid mmu-type values.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
