Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27EEC5AD7B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdHQttt2CfY5fQn55CRkh65EhgODVxvEI/wEN15RWgw=; b=eGtcN3mCD8w2dV
	+l3HWf7pFE3c0s8+aPEbcjEknxOFeE/A/V3RNArmF/SP79b9bxUx8BHyAXci0zF4e6o6cxDxra+7l
	nt72iu864zih/cxcLNNsryPc+BMuukgS33zFGBw5+i5LtPYCS945ffVAi/1ejylMbwzG50NIhY5FH
	rfVG6ayCXdHuIs6F7SwXdm3uweZjdKF9UJ/vGwAIxwsxAZcy80fWg6If4Idx9IWgclhW1HPPNRfj6
	EnF5H46cXqtC2QlcEH33Df+rU8Ua713nLyxw/zVGq0EBnwmpBe93afEQeCoDTkyVi5niF6UrdFPcZ
	gop4q8Um3oITyY8CX8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtc9y-0000000DA1j-2n1F;
	Tue, 11 Aug 2026 02:24:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtc9w-0000000DA1P-0Vg6
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 02:24:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d0407aedd6so27614255ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 19:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786415047; x=1787019847; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viXXO3YBsu1Fz8lBiMsjk2TVrG0h/+p2a3sGOEyRNlQ=;
        b=CswGKUQ5gaiXqnULCeyVlmaL1uij10yAZthTIqsiHS6Ve6xI+eBQKP9xSZ22wHYV/Q
         XzrWiXL3wMoxspS+V1gkuc5MKmookEXSgJhCJ+WAt27NyMcvK2kNZI3mtqQjJBbAO9gL
         4A2NDbSE65jaopSW3MHH+YHX+YdBGeBQZW+a7pJHepYUmrf8AE4U8JOsZloPmIJa6AlD
         pgKE0U5MadnXhW+S2oNWFyE+vHm0BsFjJtJEOh74qFQRzsf1FFoh2z4gMeCsQmwGlY6L
         glcPMhSSssNvOow2cD1Wt69w7FdQ0ErKnXRqyRBgh0q7C8prc9sTmWZ5OhYC5iEtNozn
         +Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415047; x=1787019847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viXXO3YBsu1Fz8lBiMsjk2TVrG0h/+p2a3sGOEyRNlQ=;
        b=pA+s9ZTZVDGv9L0YwyXV4b6rSxi8v8phH1IeU90OHan2Py6LzgoiMWGtHaWHuA/ib+
         EZIRGFZ91KdB6l+IqryDeY8os5NC9acwO9JphyAzKq4SPY0/gn4XpsmLNh5M3Syby2Ea
         qU+b5PTCAJboOzUrZX13j1bP3vlfgR3lX6kJ1K+osLsEuDmrkFo5Eg6UDw6ReM+XzsU2
         h1rsQdZUgBGAkhEPwkXWuZgO/GwqicCetD8PK5h1XnGfsb6srs6ccmB2942k0CDqpueT
         koqR6rF35m3HIpNC2/iZnFBWXPelF99SDmHqQL1iizkfHOIHa1wJt4uGPtDi+hmysao+
         qo6A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5oq4OE2nRuCxE2F8+D/9RPCB10l4bKMx8Xk0/2gKHB99/PsIR5gHVzzx89ByDFvs+7tHiwVraLYKwnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YziQS5laRFVVx3wej39zfpXVV7XriXYbaahTxswBQN5ffBLw7QI
	CT4WEMiNR6hDukIpplKRO+Clonnbd2xP8u3P8L0gTiFxUQkZfHoK1xGljv0iM2zcays=
X-Gm-Gg: AR+sD12jXSRF7EiQpYJFfKvZZ9ldRrx/Rb5PcIXSq3bTKuoNFtqBbw7tSlk3cuY64mF
	HL4AD4iTxmGuXA7U4mgWdAze/u/Si4rIAlKVM17HJJqiPWqrZ6YCfLvuwFZNQcefV2sOdVRW6iY
	GwE9D8Ue71+kguuuJVqFVdu7rTSH38pZFpqktTiKRUy7GuA+kAAiIJQ0NYMcnIZWrsibIT6r3lS
	62cWns1nmUdhrx7r353hb8pq5O2CfnuPBMxYYb8Z6Zj5EydSmAAqUxixX+PF/+WILIF/FUmBcY6
	896P/8Gts1uSW9n8CzayVVE0tpKhEEJlYUUrHP1Z8F7uEq8COycqNL6XpIczKJvKf6tuwllZ2IE
	Q8NTk1QN/TEXKhapvH5b7OzZs6DyLAfc4XGLHfFS0oFHZw1fiQwBmK8I8nmfkLeMpV0HJhVP2r3
	RfYTMu/yvUi8B+r+X1pBQxrGTngh35eidkLjz9Pm8wFzoW7t2A5rZa3yHneeU=
X-Received: by 2002:a17:90b:2649:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-392cc937909mr6926858a91.9.1786415046953;
        Mon, 10 Aug 2026 19:24:06 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d4051b98sm1572918a91.1.2026.08.10.19.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:24:06 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:23:56 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Message-ID: <anqHvJrZQZmAj+ul@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-2-peter.lin@sifive.com>
 <20260810-penpal-aluminum-772319e5fc10@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810-penpal-aluminum-772319e5fc10@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_192408_176891_46763C9B 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Aug 10, 2026 at 05:25:08PM +0100, Conor Dooley wrote:
> On Thu, Jul 30, 2026 at 12:39:06AM +0800, Yu-Chien Peter Lin wrote:
> > Add DT bindings for five RISC-V Worlds ISA extensions
> > that implement World ID tagging for hardware-enforced
> > context isolation. Also, add checks for extension
> > dependency requirements.
> > 
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 2b0a8a93bb21..7a57191a0293 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -193,12 +193,35 @@ properties:
> >              ratified at commit d70011dde6c2 ("Update to ratified state")
> >              of riscv-j-extension.
> >  
> > +        - const: smlwid
> > +          description: |
> > +            The standard Smlwid extension for M-mode control of lower
> > +            privilege World ID via the mlwid CSR as ratified at commit
> > +            TBD ("TBD") of riscv-worlds.
> 
> 
> btw, when you send a v3 of this please mark it RFC, since you're using
> placeholders here for the commit hashes of the extension being frozen.

Sure, will do.

Thanks,
Peter Lin

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
