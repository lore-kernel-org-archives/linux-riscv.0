Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B80606A338
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T8sjeT1T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFLd/QbJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DbhBQgBmPTuRi7JBoqBLT2VNUxot/V5VCscyjzWXZI4=; b=T8sjeT1T40lS9xWt8rtrY/tDAP
	gechsnE8RYpQsfVcrACFZHY0xKDTWh+BEruQEjtt8u1BVp648jxOufXhyR/GhaEcp6IIBMq1oaV7a
	CPMNQnmV5w1UloQ7J1fYGCm8K7ktPf+7ZltRPa9+y1wyJqAWqEcFVw9k6rih9cIzhBDzEo5kAcdPZ
	p/DCOwb+rImC3bzPjvPp5W0K4d+BMgcKzvDEcQqj8YZ9N2Jq6Pcm7QcsbxKFp3RO6rWiwBKpnHXmN
	sU22VeDpOKrtmYgZKv2GOZ/+CKNtfFSK/NEe/994yN8E8Nv5+qyAmiZR/fCsLpGXeYR1YnG2NHY5D
	7E30Adcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRree-0000000D1Bq-2HeI;
	Fri, 13 Nov 2026 13:49:24 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRreY-0000000D1A5-2QUv
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:49:22 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3712b6d9843so926083eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794577758; x=1795182558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=xFLd/QbJp6b7HyIt/ygE5cmAWshRUSXzSr5MJTNiqjPjD2RQzriLaoda1Jk6yFVNMT
         YhqrE/xX7wtSockgcaPStDe5CiMVXJUbeV/xbVN1zwu7GAu7IKAOJH8BG/CvMFlCghUr
         YuCcVDWIk2UvEFxUktwNvW1vPcPecqNn60P3l8D1lsDTpq0aA133nwD/TFZV69RYJg2F
         7HvukEzxN4TR/69xrzgD6tXe5KFgn8auALRiGpgakX6ucsBUeOChc+IndQVM1Ok0SYAB
         Vj29mR0tV/sBeLVark8xOvMBHfMSNsGql4vs/CVAKlynCkVsvcyNBrZ0Qi+PaIbwGZ5F
         sxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577758; x=1795182558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=LG6/PkgzWbiIEkhHik1arIPJdCtdMcbp+dPTTI7/vlBZ8+HukinBhsftMrGdjJodLf
         g5bJ2eRUuzg4R7iFRdquRHIxvZRayCveBcNgW7UoxHcN6wUoDoI6fbfa2EwMKtRKoVPl
         oO3vAkcU2zVV5rJB8cq9+Ci8UoHbi4Fg0s0+CSNuFfyudh1BhNheVoAlnoV/Z/70bzcy
         ui2Bh/D7Mgb2WIKSi5wZhI7HBOs84auUHvTu/Ee2VkMRNO9pnqA6VBAF0upZRu9vst+v
         wgJvm5JMwvD9fDpxnkVsTp5un+fsC0+nnBof7YrRLomtCjiJeOjJLSdB/Q6nn0ElVO2b
         ClUg==
X-Forwarded-Encrypted: i=1; AL+hErHN6UKESD2A4dnjxNPW6WHHPznAuB+vNg1vjrKpHpklcoc92N5VxLaQocJnlOlbmVGdkw6z8hYvPyoX+A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8p+dvplWhrkqf2fl55ur4V/MZOpfZIIU/SnLk1GAEQtzvcHwsL
	Q23s4mnt6TCiC/QG+aIY1Va1EkcHzGmM4ok0UKDgdbBMeT/uLpb6Hdkn
X-Gm-Gg: AYBFou1uXZgVMIKm0KSPH516y9t/WEC/qfsUf9KLyvC9YWUnGYqsl3v3JfgwcTlReJY
	ziQBaVUfSBaIE8R0aP8wjkrQxgqma8JMnr9Czs9xqOtg5trxWw6IgimCyOy9wPJ9tr43NnAZQEg
	9OBQswADkE6HeRbgVzfZOsylUUrUac1IpPBxiplD9sEUMCEc+jpSp9grgWUp7KELW7v8kPDiZPc
	Ec6OHZECE7BoVLKZXHcX7FJ+xNwSELWEi/pT4lhgZJTCiXnDOzk5+yJD0TF4qvK2BEqcf98J6Nw
	iS7SqJQT0s6FYrXFtb+jkNondANPMnXPssniVZdi8QrN/K060XFDzL7l2zofDyOy3g3egyCEATg
	+M7+lLQ7gN5zBMFucDj99se4X5yJxHbnDbycZP5lMP8Gc1AGvUry9UR9ZIq9JxjyGsIo00EUUW8
	poFVcd/ANMC0wz141YYMoAzC1MSJofDEx70j3Y5Ipq24NVeRyoqLJd1kNPxchzZx0BCPVN07ybS
	ju6QM/V5AiIV7kL5uQlg/kOqPywhGj4blZMawkcwQ2GbLWEJ8MLo9ihWCEYoNPnVwVTZxeLidXi
	AMx6c77eF1COM6H2rXMT3X72/RjzBg==
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr2170730eec.38.1794577757517;
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm8381252eec.7.2026.11.13.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Date: Fri, 13 Nov 2026 21:49:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <7xzpzkw5qmt3xb3ezo2sii6tnfraetwooh2l6dl4svclvbn43o@uvm7uyhz4bck>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
 <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_054918_634801_4CCC834F 
X-CRM114-Status: GOOD (  24.36  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 12:15:54PM +0000, Troy Mitchell wrote:
> On Fri, 6 Nov 2026 14:05:24 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3
> > eFuse controller. These banks contain temperature calibration
> > parameters and other configuration data.
> The rest of the window holds the root key and the SSK, which is why
> only these two banks are exposed. Please say so here and in a comment
> above k3_efuse_keepouts.

I will add this explanation to the commit message and above
k3_efuse_keepouts.

> 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve
> > reads from the snapshot and use keepouts for the remaining register
> > ranges. Keep the AES_WTM clock enabled and its shared reset deasserted
> > while the provider is registered.
> Why keep the clock on? Reads are served from the snapshot and nothing
> touches the hardware after probe.
> 
> Tested on CoM260:
> - clock on only around the snapshot: probe and unbind/bind work, the
>   clock stays off (AES_CLK_RES_CTRL 0x00c30050), same bank 0/7 data.
> - this patch: unbind gates the clock and asserts the reset
>   (0x00c30070 -> 0x00c30040), rebind reads the same data.
> - this patch: 3s of WTM_RST or of clock gating leaves the shadow
>   values and FUSE_READY unchanged.

I will disable the clock after taking the snapshot, before registering
NVMEM. It only needs to be enabled while accessing the hardware in probe.

> 
> [...]
> >
> > +	depends on COMMON_CLK && RESET_CONTROLLER
> Not needed, both APIs have stubs.

I will remove these dependencies.

> 
> [...]
> >
> > +#define K3_EFUSE_REG_SIZE		0x400
> > +#define K3_EFUSE_BANK_SIZE		0x20
> > +#define K3_EFUSE_BANK0_OFFSET	0x104
> > +#define K3_EFUSE_BANK7_OFFSET	0x190
> Nit: the last two are not aligned with the others.

I will align them with the other definitions.

> 
> [...]
> >
> > +	if (resource_size(res) != K3_EFUSE_REG_SIZE ||
> > +	    res->start % sizeof(u32))
> No need to validate DT here. Drop it and use
> devm_platform_ioremap_resource().

I will drop the resource checks and use devm_platform_ioremap_resource().

> 
> [...]
> >
> > +	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
> This asserts the reset on unbind, rmmod and probe failure. The fuse
> data survives, but WTM_RST resets the whole GEU (FUSE_SCLK_DIV_CNTR
> went back to its boot value). The driver does not need the block after
> the snapshot, so use devm_reset_control_get_shared() and only
> deassert it.

I will use devm_reset_control_get_shared() followed by an explicit
reset_control_deassert(), leaving the shared reset deasserted on teardown.

> 
> [...]
> >
> > +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> [...]
> > +			put_unaligned_le32(val, efuse->data[bank] + i);
> Please poll FUSE_READY (GEU_FUSE_STATUS bit 1, offset 0x184) before
> taking the snapshot, and fail the probe if it never sets.

As you clarified, the automatic shadow load at power-on does not set
FUSE_READY; it is only set after a software-triggered reload. I will
trigger a reload through GEU_CONFIG bit 22 before polling READY, and
fail probe if the poll times out.

I tested this sequence on my COM260 Kit: probe succeeds and both banks
match the data read with v1.

Thanks,
Jiayu Du



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
