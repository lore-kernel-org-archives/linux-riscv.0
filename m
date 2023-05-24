Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5703EC7EE26
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 00:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KUNReHIDMN7DAtO9wk/zu90t6N3oOdr5BrRk+tL6Yew=; b=qxf2X1i67nDeSHdjLMaM/qj7Uq
	BBIx47uqjZTz37X8jZchfRbuwcUZsl/WQN12DquJQKwGujP2o3azxHNlZIClbK2ESeew08kZXGcSx
	xNp6Rj/Yh/c3oGvqQo60bmDVAOjj2YlgnwyJgPNIzRnVZuuBGzpH4yO/DBICu2BADOT7zgGenOk02
	6JbaeZrcdTYKRr84Y6UXvam0O8fNMImLuIFHsC1onzeI2R2kpdFlg/IaHBgL5UrXdo38f0qZNM7Fe
	Ejg2IOXFvXtD7yNOanYpwir6wzwzAmiCQRt1xhN43xiaBbjDOYKpOAeFW7FXeBL2/YoCWOC/66YpN
	isn4w39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cGX-00Btif-04;
	Wed, 24 May 2023 00:22:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cGU-00Bth9-0L
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 00:22:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ae40dcdc18so2231775ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 May 2023 17:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684887724; x=1687479724;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvW5odmav81YCuU2xaxrVKZjDJTjkbhDO7IJyae5Ly0=;
        b=LS3sS8i6pcOP3Z/1u/W/pb1HW/gNPJV9pCBq9zXKwqnTKBoB9Y3l9XsoyYn0H4mYMt
         wycd6iPEdZsALvcUaSRDYknHogWQzUx5YuECRFRWelJviVYM3NWtOHNyllj5bPZrV4C2
         tlkFh8IEBwvI3SKEbM+QHEaIVvL9xxGveePO7+A/pBsQMechOyBwFGzvI+Vt9U6edYfW
         S90Otv7palIzLHfc7mMlbe+XO3fGj75NIqNnpsEk61c0ENR3iu4r13TUs8s/1Y88tGgU
         k1nVfll23GNpWJCtry6uI56Qx6aBduWvsKuUcPDE9CeRSs6f/NrcrBfyqWlgEuWoNi3w
         nsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684887724; x=1687479724;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvW5odmav81YCuU2xaxrVKZjDJTjkbhDO7IJyae5Ly0=;
        b=ZucAgvyiPmjfxITJzMbu7jSrpdF3DuULwaSHqeJUo3U76t+KrWi5RNafql4E6z7Frv
         tBjUsPAaxr5dC3dWxDaV6i0Vy+lsoCVgoIs/SMtfpuyPqKr03lXAqR98lzRAz1zezum0
         qKomRIkO7HE/g6ba/+alx2RapEpafvGx0Ut9hMvdB2mcNNnIXFNNEOZfZCLTRoRXzycQ
         o37WfloJ1+CFUzRir9tU2kK7mOHfcvmmHUEB+BLSlF7tNSIek5IgRxa67TbAIzVCL1MG
         pSJBIP10n7+3pjaz+xHBdnwbQd96M/DVlj+/sdizlxTPJwUIeYzA233whvp26Q2tUz/2
         Hs3Q==
X-Gm-Message-State: AC+VfDzUe6Gn9Jk5dF0RsFoS3uzcTJgz/gsFrxZR9qUselSs54VMC1+O
	P1Fs1laZKP3+Rhv9odYGlnBG9A==
X-Google-Smtp-Source: ACHHUZ7IhEOip6ee757qzLCooYkp+ZnG4A+THUuF1wxxUAgFkFu+d/JnFGBSydGfvXaf+AD5p2ehMw==
X-Received: by 2002:a17:902:c40d:b0:1ac:66c4:6071 with SMTP id k13-20020a170902c40d00b001ac66c46071mr17814804plk.57.1684887723916;
        Tue, 23 May 2023 17:22:03 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p1-20020a170902bd0100b001a24cded097sm7307340pls.236.2023.05.23.17.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 17:22:03 -0700 (PDT)
Date: Tue, 23 May 2023 17:22:03 -0700 (PDT)
X-Google-Original-Date: Tue, 23 May 2023 17:21:33 PDT (-0700)
Subject: Re: [PATCH -next v20 23/26] riscv: Enable Vector code to be built
In-Reply-To: <20230518-rented-jogging-b84c705f7d76@spud>
CC: andy.chiu@sifive.com, linux-riscv@lists.infradead.org, anup@brainfault.org,
  atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-4f11f1da-100c-452f-8717-e059d6e1d44b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_172206_141729_6DD450FC 
X-CRM114-Status: GOOD (  16.28  )
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

On Thu, 18 May 2023 10:31:37 PDT (-0700), Conor Dooley wrote:
> On Thu, May 18, 2023 at 04:19:46PM +0000, Andy Chiu wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>> 
>> This patch adds configs for building Vector code. First it detects the
>> reqired toolchain support for building the code. Then it provides an
>> option setting whether Vector is implicitly enabled to userspace.
>> 
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
>> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
>
>> Suggested-by: Conor Dooley <conor.dooley@microchip.com>>
>
> You can drop this tag if you respin, I just provided review comments ;)
> Also, it has an extra > at the end.
>
> Otherwise, I am still not sold on the "default y", but we can always
> flip it if there is in fact a regression.

It's definately the riskier of the options, but the uABI issue will only 
manifest on systems that have V hardware.  Those don't exist yet, so 
aside from folks running QEMU (who probably want V) we're only risking 
tripping up users on pre-release silicion -- and that's always a 
headache, so whatever ;)

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
