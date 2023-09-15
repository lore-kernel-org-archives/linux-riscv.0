Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BFAEED600
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qfg9DJl9hxhPBTfeXIxpQl1YwD0t2Ly1KSdovndVdJE=; b=Lk36p7lk59o/+i
	ZnVuuusNgAXFf9FnRQpxh2g+0i0kNH3jnfbjA8IhiMe0xmG25n6bQhBl5txsMXawjgeXNxrngqBkB
	FYw+k+lXxadE3TdWI7add2vyZjWz9aw+rliwt8lq0feO+7SmWe/69NNPn4vniDaKEgdvMsF/uE0P7
	7dd9Nt27tonPolxCJ1uDR/J1+zhyqoHNjxmRoWliMiA55HNiC5qjP//Rbg/iwUrOaCYWxE1wzV570
	KQ/Ln0mXrueul75bHWIWcWEgFBIQgfI/1N/UslFsEHIXck20UZpiZhGltKPF7b2726pwuvyUbeVzX
	wbFn0do1Ow4a2VRYasrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAM7-00Aw8J-2H;
	Fri, 15 Sep 2023 15:03:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAM4-00Aw7w-2N
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:03:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2D2D620A6;
	Fri, 15 Sep 2023 15:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAC4C433C8;
	Fri, 15 Sep 2023 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694790215;
	bh=UtY3Y7r9znKWxNJDaZ5ltW/b+hC2P2B8V/VhuUu8pkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ne/aH+FqERho8uP8TYtT4xl5rClVk1+AgqInqI+Ngw9OWuKsmalkSvAGsGsxXanSl
	 PCQBMZwKUde2FomJm48t9Ez3yWTDkTmPiYFc+h5vAVraAPNj3OAUIraTovluJKwjkg
	 HW3SP1ed4Mruwi1rL2mZbGJD0PnM+pQ08LJf2csDZ3SlHK/a7G15lvkO69a/4acByr
	 t/w/S6eknf7CjRaD5I0aB9bnU0QLlfBjS7Oeu84QQ86ng9BawZKApuv2+R8ELgg1G8
	 YIJ9AJdSuGgLJEXQj/tEpz7Z/dJbo2uwho5Ywf5VbCCywZU71eZi+qWR4RUTtYpXGK
	 HPvytPLGspJOQ==
Received: (nullmailer pid 3729895 invoked by uid 1000);
	Fri, 15 Sep 2023 15:03:32 -0000
Date: Fri, 15 Sep 2023 10:03:32 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add T-HEAD C920 compatibles
Message-ID: <20230915150332.GA3719864-robh@kernel.org>
References: <20230915072333.117991-1-wangchen20@iscas.ac.cn>
 <20230915-muster-viability-93d7d4ec2b49@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915-muster-viability-93d7d4ec2b49@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_080336_840365_761B4709 
X-CRM114-Status: GOOD (  16.56  )
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

On Fri, Sep 15, 2023 at 03:11:43PM +0100, Conor Dooley wrote:
> On Fri, Sep 15, 2023 at 03:23:33PM +0800, Wang Chen wrote:
> > The C920 is RISC-V CPU cores from T-HEAD Semiconductor.
> > Notably, the C920 core is used in the SOPHGO SG2042 SoC.
> > 
> > Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> > Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> 
> I figure this is missing a From: or Co-developed-by line.

From: (author) as 2 authors for 1 line change is questionable.

The sender's email should be the last S-o-b. So like this:

From: Xiaoguang Xing <xiaoguang.xing@sophgo.com>

...

Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>


> 
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index 38c0b5213736..185a0191bad6 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -47,6 +47,7 @@ properties:
> >                - sifive,u74-mc
> >                - thead,c906
> >                - thead,c910
> > +              - thead,c920
> >            - const: riscv
> >        - items:
> >            - enum:
> > -- 
> > 2.25.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
