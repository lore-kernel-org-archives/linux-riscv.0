Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE50606A689
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MhII1r12;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZd942Yp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2BlNxe2Nylcp84sNn0h0bYbgcCyBxqKX/KHyGDQ5eU4=; b=MhII1r120VDIcLYTafA0s6zBre
	ZhqawEz4FwXaH//q41yeMcBxKqEOgRwas0/VR+Lbx8a2PC6/xeSAovMXLWLt29MQqU7Ou/1D+ICkn
	avSvHvy8HhBy6Ra0pJDh2CRuAeTfKAQox0hnr+WvlP1iFrLgPP8mbNHrHuKqK3vT2lWeuc6+uPdQ0
	0LPec9BYB/fHxHci0acYR8CVZn4F6EimNl4aeC8Vj0t6Xo4+g2jMRug7w2t8bIIAvppLvFPtOnc7C
	stqkSGcSaq6f7g8m3o8anj0Z58YeXBLXF5MZqPYRZSUsoiRbhYjwe66Viw/Hi1pbCIkt1QqOQnwfJ
	tSUoIQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8gp-00000009AFi-40p9;
	Wed, 25 Nov 2026 08:49:20 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8gn-00000009AEb-2HBQ
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 08:49:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so2762549a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 00:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596556; x=1796201356; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=cZd942YpW8uhTIsn7wswy/hu8kCG0poCDKCPDPE5oMidVTuZdNy8s5AEWEx0WZOqWc
         +6AFQ6JEvqCT2QLRGiIzJpoVaSZgw/qpUgXD+C76YhnmazoiTD43ChhoJcoZAlRtvo+A
         hH4RCdqcGF1708coHlVnQnosUUTUOtnuiuZ4C/SmELFS5M05NwUTTHMd8rtgf5TAsAzv
         L2RxWYmjwYHrNhp3IYSu+KDedf09s5dXIyReZ2J2Bd1ksjr/HJq1aJpeXkAjUHKJcTO9
         R2CHCFNuYALMNf5YXf4hfUvDGN6VAWULZpkHNGkaEGv62zIRpFYLvG7lINKSpbivIa0r
         7qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596556; x=1796201356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=ixtdDylfgUHUpLO7EEp2B34XE5I95scdSzQFBxIwA1Xr+wRHpSw7Vagv83ZD1lsUaf
         ZWMTKho20XuEYkqhJjJoz7S6AQXZ3tg/jiHr8IF2XuMed8Yx/OnD4jR86bSORa9Qlc0g
         jYLukvIyBXGs0i8bZfNEzhreVa2kCDqOA14kUj6ckk/TIsPBCwkj4ZVbRI0sIAgTzpZ0
         RJDgjcOzSBkrQVilnqOdFV/x97aWRZ79xMK4nxuTzWQZyFMhz0yHHAOvvst5zdctkz+F
         3jjC2ERz2qywtX3Al9U4Fl63o5Gi+KKnQsJ2jG7GMe/N5M95eIr4fUiQDxnwxvxwEdY0
         JSUg==
X-Forwarded-Encrypted: i=1; AL+hErF9DRfVAl6Ay7BcjXuFG8R+DFWIypGwPTbTprVGccHhD7KuLLS10GyT2fiGalqG0rFuqSjF4v0IVxj7Fw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/tZlszanJ2ck7wxgMs2w/Uhdn8xyR6wr/OzrGWQzLkiNjGdbmV
	9Nlj0rRGTI1aCoGn4/ZJmy1ANQqNDlXPC/XXyqZzNDgRxCGEKC5f8jvB
X-Gm-Gg: AZFdTZdfs9k+Sf84cYVDGglQdUOc6FjkfwXCtKnoCfpoOxbmncvjR/u/9X2UikVveZM
	3aIi24w2rqkIsEBo97V5Rv/JM7PeN7wopTLW8IkCHVNwKoQ6dJB0xlW7ZnrljWag7/AjqYDUd2d
	BEHOeSyGAw5M+vSB0wX/JkuHFbzvhsN3ajU5Pid/+JMtwfI9zpEyAXAN/ksoNOn/vHTYTteq9i2
	6dwqerjRfoubIebpJHVHYDKJ1qKpHJObp4bstV3jtMXOQvWowKB9W5ZyJK74HQFetekzwx2ISgO
	wtLTsExXWzwcKenobNTqo73OZecMtTlv13I6nbSTF5G4JsRLiLJdz/ov5Gx2pzuTNe9+tlwIRdA
	05nXzR5ImOr+K/vJGDjenCkBTPh+0psM6ZtW5rcAhCCsfKrZEL2H4P2GJKknPSak7FU/sqAmG1Q
	vLVsDU20ZYnYgSZg1ihbJnTzvZVCaR3fbA2kkPUeR6IjnnKmmarKqdYdfxIkAPBvkdGo17hsbN/
	+w/73AJtQfcHwJ0xLPnUc2Y3qvjDhW7DgDmDhOq8i7UNX5cG+ougV3iKmVoMDLhCU2vvCz4VOlh
	2Aq8fvG1WNsqMJLuLRVieoRfuw==
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr16316108a91.5.1795596556346;
        Wed, 25 Nov 2026 00:49:16 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28307740a91.3.2026.11.25.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:15 -0800 (PST)
Date: Wed, 25 Nov 2026 16:49:07 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <sifzfexbsbd2byrpynbv42habxgbrxgndaxqhsjgppyipfuivp@qvawoamxksfu>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-4-duge1256@gmail.com>
 <awYIF2ynf95-g5-W@aurel32.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <awYIF2ynf95-g5-W@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_004917_590698_A970A717 
X-CRM114-Status: GOOD (  21.67  )
X-Spam-Score: 2.8 (++)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:56:39PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add the K3 eFuse controller and NVMEM cells for the temperature
> > calibration data in bank 0 and bank 7.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index e89d2cc5ca8c..af1a758788ff 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
> >  
> >  		/* sec_i2c3: 0xf0614000, not available from Linux */
> >  
> > +		efuse: efuse@f0702800 {
> > +			compatible = "spacemit,k3-efuse";
> > +			reg = <0x0 0xf0702800 0x0 0x400>;
> > +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> > +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> > +
> > +			nvmem-layout {
> > +				compatible = "fixed-layout";
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@1c {
> > +					reg = <0x1c 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@ea {
> > +					reg = <0xea 0x2>;
> > +					bits = <4 8>;
> > +				};
> > +			};
> > +		};
> > +
> >  		mimsic: interrupt-controller@f1000000 {
> >  			compatible = "spacemit,k3-imsics", "riscv,imsics";
> >  			reg = <0x0 0xf1000000 0x0 0x10000>;
> 
> This looks all good to me. The offset and bits matches what is in the 
> vendor driver (after mapping each bank to the correct address).
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> 

Hi Aurelien,

Thanks for reviewing and testing. I'll include your tags in v4.

> Small nitpick, no need to fix it, but the vendor device tree also define 
> offsets for soc_die_id, soc_ver_id, soc_pack_id, soc_chip_id and 
> soc_svt_dro data. It might be useful to export (some of) them.

The downstream socinfo driver uses these cells. If I work on
upstream socinfo support, I'll add the relevant cells then.

Best regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
