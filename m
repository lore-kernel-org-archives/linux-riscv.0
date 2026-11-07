Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51E606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 17:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AapMqnem;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H5ztWKaV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bOYkh6lFwYiF8zAvlC6EBreVaZbZw7s//1NkLSTWh6A=; b=AapMqnemPEXgDRjiYBBnbTc/NX
	0rQTCSSJkt8B8l4MO5b9xcFVcF/0unXSy5e36PlqPTWglFUuIV4ONCA0Uqd6NTspGO+ycMGx6jGt6
	+e1DkgsX72M/FBV2yOnXSOIRPmkFi0mic6IwD6v0Ksy6ugh96/BuXQ15o534/idDrSMCILuE6hIMN
	7OWTn+Jvj03NuSv7NeaOGyVOas+zmngycvqMckVKg2ycYTFWpW4tmosTi1TG6HfnWUfouDAMBBqKt
	VBNEgZQHIsUziUn+dtQklQVC0SedCOkElNGLASe2aWrabblPoioiqLwPn8MPZ3XIWkNRyycVKuyqW
	/aXGMVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkMj-0000000F6a2-27ce;
	Sat, 07 Nov 2026 17:38:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkMd-0000000F6ZS-3bEd
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 17:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794073081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z24fIgrg332IE6A60r7YoNBcp+hbvJa6DyUXEc2zlxA=;
	b=H5ztWKaV7PH/3Ved7RuKZSru+bN6CAalPIaoK9/gW+tAimk3TDf2lLH1AHK05UJVovSvwy
	kfw/4zucOQw/YE7873fOkagR3Q8dhP0T7x45klS12ReDjZuouCHVpyAGxCHV8xdNu9YoNN
	yXTgpul8DerW4mKN0MN+RYZlcm6OPiQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-A9O4RHjmOVS4eChUa64eFA-1; Sat, 07 Nov 2026 12:38:00 -0500
X-MC-Unique: A9O4RHjmOVS4eChUa64eFA-1
X-Mimecast-MFC-AGG-ID: A9O4RHjmOVS4eChUa64eFA_1794073080
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b35b88a9d1so7494347b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 09:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073080; x=1794677880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z24fIgrg332IE6A60r7YoNBcp+hbvJa6DyUXEc2zlxA=;
        b=umeqi1hRM7TSGB0WcvGgTetVwRz2Mi2CpxxCRmwZoASXs2+548yTpFF5sL4FC6y0EH
         e04u3+dKtQ/KDRl9RIeJ85k559eMLr5vwu71VXKK1B5BL3hi2FL7zPJUbN++gjfznbTN
         x86Y/hn9SsI3gH5k72OjEdrrgF2q6bG6TtkVyq8XCQMIMzJTA6NZxUWTjdxasMrvwaYC
         eMA0R6qfpdhK5JgVNBqgnO0Eyz1jyg1Hyn0Ma9jScFU9zD85EQgAOeSe+906lcxKqgFp
         vKPvKNAtU6Y8S9LSSDUXlpB32oIc3WYa5tW4EVcWMMsl52e9kXmg5B8/5/pojIHk5QUp
         QkMA==
X-Forwarded-Encrypted: i=1; AL+hErFLGwC+GnlrmtDJ6xIlP+67Dkd0hPVlGGReQf1T4EXiZTRFS4V8KZHKFLIHlnAMdlL5q2SfZxQSJdqbog==@lists.infradead.org
X-Gm-Message-State: APuU4Z8UTed2QZU1p+/M1Cgta7QQzPCHUehE8SdE7W/ZHos+TxEaqMTN
	0eZwMKb9UbynSxwygPLKuDFhPq2usqQlf+XfZHxItM3+z7vrJCcq2HkUSDzJe0DQqYKFLCTv+OA
	ppkPjKcRjAD+o3ziHzvds8qFjhmpZZ38SqpularUR1Fed9V9NQGjLbhxyB/2ch0M6BTWUWQ==
X-Gm-Gg: AYBFou3fIB81qai7U4IJa36Q2y2aItdqsw8n0sspBFBhAPtn8QYRj39fq/fjcx9MLu/
	g53avAHMyi8kGlKEAQs8Jv3SPa/Yb/oY5AL7Bv/lj/L0Ri40aJnPb6RWHO+fH4TSyBHDwarurnx
	KZhViBy22BQ4r4A1e8cyYnNdUiA0SMMyKpxFqh83+BBbej6+2fGDkiIcjPL0v80gmlBYT7Qopvf
	HxJyyVFOn2E6LxuVRAb65m10E03awISBrl9HQ5cN2EdIKSe9CBCvT5RQYC0UwP9UAJF8quGT3zc
	i+Q69xrejQbmPJD0CZTVbScJ3LqGrHhcc4Fv0NG/nC75pn/pIqT6bqvatWDJsKYkey9TAPXHzLY
	IraSKkpVljvjz222CxSkV03UM
X-Received: by 2002:a05:690c:dc3:b0:8b0:ecb2:883a with SMTP id 00721157ae682-8b341b65934mr35021087b3.62.1794073079857;
        Sat, 07 Nov 2026 09:37:59 -0800 (PST)
X-Received: by 2002:a05:690c:dc3:b0:8b0:ecb2:883a with SMTP id 00721157ae682-8b341b65934mr35020987b3.62.1794073079453;
        Sat, 07 Nov 2026 09:37:59 -0800 (PST)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f525fsm44439167b3.5.2026.11.07.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:37:58 -0800 (PST)
Date: Sat, 7 Nov 2026 12:37:56 -0500
From: Jennifer Berringer <jberring@redhat.com>
To: gaohan@iscas.ac.cn
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Borislav Petkov <bp@suse.de>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
	stable@vger.kernel.org, Xincheng Ji <jixincheng@ultrarisc.com>,
	Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH] firmware/sysfb: Avoid simple-framebuffer behind DT PCI
 host bridges
Message-ID: <20261107173756.1d273aa5@redhat.com>
References: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GyEs7aWopaQ_A2cZWKM4jP7H9x_sDsxTWhpkTI4Tq48_1794073080
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_093803_968916_719B0AA7 
X-CRM114-Status: GOOD (  31.14  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sat, Nov 07, 2026 at 04:46:40PM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> With SYSFB_SIMPLEFB, sysfb registers a simple-framebuffer device that
> claims the framebuffer memory when it is added. On DT systems, the PCI
> host bridge may probe later and then fails to claim its memory window.
> On QEMU RISC-V virt with EDK2, a bochs-display and pci-host-generic
> built as a module:
> 
>   [    0.703813] pci-host-generic 30000000.pci: resource collision: [mem 0x40000000-0x7fffffff] conflicts with BOOTFB [mem 0x40000000-0x403e7fff]
> 
> In that case, register an efi-framebuffer device instead. It claims no
> memory before it probes, and commit 64c8a0cd0a53 ("efi/arm: Defer probe
> of PCIe backed efifb on DT systems") makes it wait for the host bridge.
> 
> Tested on a HiFive Unmatched with EDK2 and a PCIe graphics card, and on
> QEMU.
> 
> Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---

This issue also affects UltraRISC DP1000 boards such as Milk-V Titan.
For that system, a2d4a2d2479b ("clk: ultrarisc: Register DP1000 clock
provider earlier") was recently added to clk-next and can serve as a
workaround to make its pci driver be able to initialize before sysfb,
but only if both the clock and pci drivers are built in rather than
built as modules.

I confirmed that your patch resolves the issue on Milk-V Titan even when
building with CONFIG_PCIE_ULTRARISC=m, making a PCIe graphics card able
to initialize and function without issue. CC'd the ultrarisc developers.

Tested-by: Jennifer Berringer <jberring@redhat.com> # Milk-V Titan

> In QEMU, efifb takes over with SYSFB_SIMPLEFB and efidrm without it.
> With pci-host-generic built in, simpledrm is still used.
> ---
>  drivers/firmware/efi/sysfb_efi.c | 16 ++++++++++++++++
>  drivers/firmware/sysfb.c         |  8 +++++++-
>  include/linux/sysfb.h            |  6 ++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index 2338de73c62c..5c2cb87178ff 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -421,6 +421,22 @@ __init void sysfb_apply_efi_quirks(struct screen_info *si)
>  		dmi_check_system(efifb_dmi_swap_width_height);
>  }
>  
> +/* Returns true if the EFI framebuffer is in a DT PCI host bridge window */
> +__init bool sysfb_efifb_behind_dt_pci(const struct screen_info *si)
> +{
> +	struct device_node *np;
> +
> +	if (si->orig_video_isVGA != VIDEO_TYPE_EFI || !IS_ENABLED(CONFIG_PCI))
> +		return false;
> +
> +	np = find_pci_overlap_node();
> +	if (!np)
> +		return false;
> +
> +	of_node_put(np);
> +	return true;
> +}
> +
>  __init void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd)
>  {
>  	if (si->orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 8833582c1883..8853a74560b9 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -164,8 +164,14 @@ static __init int sysfb_init(void)
>  		goto unlock_mutex;
>  	}
>  
> -	/* try to create a simple-framebuffer device */
> +	/*
> +	 * Try to create a simple-framebuffer device. It claims the memory
> +	 * when it is added, so a DT PCI host bridge that probes later would
> +	 * fail. Use an efi-framebuffer device there; it waits for the bridge.
> +	 */
>  	compatible = sysfb_parse_mode(si, &mode);
> +	if (compatible && !parent && sysfb_efifb_behind_dt_pci(si))
> +		compatible = false;
>  	if (compatible) {
>  		pd = sysfb_create_simplefb(si, &mode, parent);
>  		if (!IS_ERR(pd))
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index ed23d6516223..b136fdebc746 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -95,6 +95,7 @@ static inline bool sysfb_handles_screen_info(void)
>  
>  extern struct efifb_dmi_info efifb_dmi_list[];
>  void sysfb_apply_efi_quirks(struct screen_info *si);
> +bool sysfb_efifb_behind_dt_pci(const struct screen_info *si);
>  void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd);
>  
>  #else /* CONFIG_EFI */
> @@ -103,6 +104,11 @@ static inline void sysfb_apply_efi_quirks(struct screen_info *si)
>  {
>  }
>  
> +static inline bool sysfb_efifb_behind_dt_pci(const struct screen_info *si)
> +{
> +	return false;
> +}
> +
>  static inline void sysfb_set_efifb_fwnode(const struct screen_info *si,
>  					  struct platform_device *pd)
>  {
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261107-sysfb-dt-pci-efifb-d73b08ded4b2
> 
> Best regards,
> --  
> Han Gao <gaohan@iscas.ac.cn>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
