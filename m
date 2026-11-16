Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202EC606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vb70mIvn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iUVFpe2M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kAppk3laMBm8vaackxubM42JoJV34pZvL9CggxJMCm0=; b=Vb70mIvnU3tAtnur8u28CJ9JDW
	KA3hjokAAZNYOxcZzErt+RWtOWY0MoVYvQMpcU/Xgs3oaE8x4OvQYpFUpATfMD1qZQqiFlCpsgYyT
	fWGeoqR4f1R1fp+/KdBujT9LGl1aI2u+QZdIaJTcej31YHqwaeUt6j8jKFRMldndJqGW7P1NtGWEx
	/dedz+v1azy3+d2EWJvCe7ouBwj7xYI+iYbA5ZRI/+ePETa7R9NwHPRg7XNlCkLDKXpsyS248tyTp
	eWpEMi/EGDIswP/jq8yzK9L8igXL7YGz6jov+SHPeiyRVT9ezpXd051jzMHkY4XbaGtF8wvT7KzrK
	Xs7uDdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuR5-000000023Qp-2lcm;
	Mon, 16 Nov 2026 10:59:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuR2-000000023Q8-3R4M
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 10:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794826778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJaN0b3PvIpi2y0OVrA15M2BP9AXuuHR0w2trP7Mx30=;
	b=iUVFpe2MDqBY24qq7TNrujtOA2oyDX5WQ9ujqKmSj00xd98bFF4DPrqsRH3iuSHoll1puh
	121kH2stIqQ4kOqwkru5Zc3ZtkFF9otDElptJ+p8van/H1X/KKHfQYRICvEk3YekKFakfj
	HjHdRSeGy1rAFNEDbwq4zvj3sVg0ojM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-vt7a3NN-PIqllJvmO_Z33Q-1; Mon, 16 Nov 2026 05:59:32 -0500
X-MC-Unique: vt7a3NN-PIqllJvmO_Z33Q-1
X-Mimecast-MFC-AGG-ID: vt7a3NN-PIqllJvmO_Z33Q_1794826770
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49d70f45b22so1113236f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 02:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826770; x=1795431570;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mJaN0b3PvIpi2y0OVrA15M2BP9AXuuHR0w2trP7Mx30=;
        b=voGidNNYviGCgP/lkJYJTnlNLv4O3l/K5qp0OQz7cm0btUZ/YeO6CYlkGN8tUAGc1K
         6szcvhdwz5K1NavDGh4HLdS1AZKZo9PapuC9YKOaqUyK9HYiglnEW1GFWR+hkRBD7pwR
         j1z2jx27bwaDvuD9fnhBSq+AmLjYYqHpqjXjJcs8VEFgkf8/BHLewKCa2OJ5shtrFG8x
         ISo3tbBI0jjnigXhrx0GsDR5j4lvuH/9HuSZoMJmJP4YzraiVdGnya5TXPSEbqxqeXp3
         chqiZ2//tJTo21aJxsHubtNCYiS92ekITAstJfGxIvNXDpfUtbDKVTFcba6HjP0OOHc5
         6INQ==
X-Forwarded-Encrypted: i=1; AL+hErF6SdMaRYdwfb2agPGgi3KQ95jJEkE4ejVn+mnA0SqxOYMuT8LOVvVoTOHycDkeQKw0eeJexgm/JIL4rQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+aQDDgPbNteqKQ+3/ST1XGIT6WsD2UGPymun0bkwT1/SV0+nlT
	M5J35bE9XHSmJY8S1qMBzIhqRF+eCOwMdn3OLGrPQOudQqNNNIckmpojx3OKZ5KT8c1u+dtggew
	oVCfPKwG54owNsuhhWwZNV1dkaP6Z/JZSRlZb+I9VeVAmdC4bcJYETrB11ZanphrZueXIgA==
X-Gm-Gg: AZFdTZc6HhfU786+CNT2vSm+h763LFxXLg9YHzBPsBeigZnWC5B25rI4u3rjfU086gx
	f/qPSuDxTzNR5YOCXasHZ8k0Qp0je+96PewkxWgZzKlq/azXLA94Q06Qn6Yj6IFDa7XxK5yE8y8
	2QtXrWFzrCUlc+IMf4ejesyGpGTz5lIe9T+nAxMTtHehZYE0sT+CbcnGmibGJFCr+c6igCQFhH5
	X/8BzZhAVj/NxEhQz1h1S4hh+sYVi3NjV4cN1CMMvrvrUyIm+PcVyd1TioRveeKJSmKH/0My+XP
	28Ptw8JZ++bIlmwuTiFeQ4QPoP+XE2tcyHh5KMVnQMdRUUP2PVuLZrsq9MQHb/lSlJxzoHeNAjH
	UWxxPzVBFHYKkVBTlvK2sOa9neV37qd7Q1QmYL6rY7T05ZdAAWEewl6oBGQ9OqXHGkfC7+DZuH3
	t9s18NdSDn0VoyCfSHW0ya/fh315Y7DYfWzykQcoo=
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr15496731f8f.46.1794826769911;
        Mon, 16 Nov 2026 02:59:29 -0800 (PST)
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr15496699f8f.46.1794826769302;
        Mon, 16 Nov 2026 02:59:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm20381961f8f.34.2026.11.16.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:59:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Borislav Petkov <bp@suse.de>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, Han Gao
 <rabenda.cn@gmail.com>, stable@vger.kernel.org, Han Gao
 <gaohan@iscas.ac.cn>
Subject: Re: [PATCH] firmware/sysfb: Avoid simple-framebuffer behind DT PCI
 host bridges
In-Reply-To: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
References: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
Date: Mon, 16 Nov 2026 11:59:27 +0100
Message-ID: <xlv1fqx1rqi8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9xwMEGjYuSIcDQiu6-p1zfTv6Rveof5gvO8siEMzkzo_1794826770
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_025940_930279_31E97EC3 
X-CRM114-Status: GOOD (  26.28  )
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

Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org> writes:

Hello Han Gao,

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

I think this is a workaround and it just works because sysfb does not add
a resource (using the platform_device_add_resources() helper) when adding
the platform data for the device.

> Tested on a HiFive Unmatched with EDK2 and a PCIe graphics card, and on
> QEMU.
>
> Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
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

I don't think this that much. I feel that is adding DT + PCI logic that is
platform specific. Instead, maybe what can be done instead is make the sysfb 
logic consistent between "efi-framebuffer" and "simple-framebuffer" platform
data setup.

That is, not add a IORESOURCE_MEM to prevent platform_device_add() to add it
to the global memory resource list. Instead, the framebuffer address + size
could be passed to the simpledrm driver through the simplefb_platform_data.

The simpledrm driver then could claim the memory at probe time, which is what
efidrm does as well.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
