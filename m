Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1596C5B572
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3F1wEWOQw9op9e3eKb0LXvpW7JFRIchUwcipM93I3U=; b=A9OwyrlJEwlYnl
	VI6Kl1DMZusGQyeJwh1V8N32hJVM0pH9PQ4unDHhHaVfEYjumFHRovH5gFOIHZ6PsCxgQuhR0tWgw
	gGRYQTolgjPEXgRy58wAdSbtBbcHO8rYRmU8tJ6/J+pPxe0lRHVxb7neUrZS5562miTlb4K3sbM3d
	MKDySc/B4gJSNncJz5oHL3cXKbi4LuUQBMJKgMztf02aOGTU6HKjuz5RmHC5wB3aXLsx24fKy9wwS
	FgsLY/VAPwLCp2OzRLnULMpEDr4rIB4IwfIr9uTW9YoHtjtwM5jSJIX/FOB1kaQZU9ANqK/mrh4z2
	t0YU3D6GHxFgQO63afOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvWkM-00000004b6S-2iSL;
	Sun, 16 Aug 2026 09:01:38 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvWkJ-00000004b65-0qcO;
	Sun, 16 Aug 2026 09:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786870889; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XLfLL1N+AnqzFwXg586xF8QAQR/Mn+TYzYl/q93grOfvO/GI6BT9ZNIw/JWKrz3qvs8fk5kZZlm0lZTVrhatTAm843g+BWIU3O26IKoGBg+EsZFNXh8iOPdbfxFVDNiL9Yv7+rtJWpaI4rq42rsOXtkqeSyaSMK2pKzieFIbDTE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786870889; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uC0rrKBJiyK6GKrZ7oOkFU15ENgVC1tzNfFlEDiLMFo=; 
	b=VT5G0Kxy5ieuaptmWnpawbmpfuqkIPj66/JDgmVGL9F1E2XFNiQ9Ahni+YdBLdTVzmp1zyfBNX0F9xVjUS+Z5olYHk9DuaUTYmOQnN9sjc3aZUjz8itTXCvrwpY/FrGGMd7PMmPhLDwFMQ06qWTVrZm5uj6AwL/gqs50aCSMsVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786870889;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Reply-To;
	bh=uC0rrKBJiyK6GKrZ7oOkFU15ENgVC1tzNfFlEDiLMFo=;
	b=jM0Lzegw6T4kcPJphd+ovvczrq7jLss4jh8upiRgtX6Dd8O8+kmInqknR1xOPjD4
	g8C2Dw4qXMMmzqr0NL0+HFBwpuXoknuIpjo8mlt6gpsWHOlAgEJrAD2JbnI/H7bH7mx
	AAewMjbMHQi1iJhyh9EMYZCgIm8ydAT8UpXxzF1I=
Received: by mx.zohomail.com with SMTPS id 1786870887237223.54892824363822;
	Sun, 16 Aug 2026 02:01:27 -0700 (PDT)
Mime-Version: 1.0
Date: Sun, 16 Aug 2026 17:01:16 +0800
Message-Id: <DKQ8V08O8TKD.QHLCPR9W40HE@pigmoral.tech>
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Guo Ren" <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Cc: <dlan@kernel.org>, <devicetree@vger.kernel.org>,
 <spacemit@lists.linux.dev>, <stable@vger.kernel.org>, "Guodong Xu"
 <docular.xu@gmail.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: fix IMSIC guest parameters
X-Mailer: aerc 0.21.0
References: <20260816074125.2105828-1-guoren@kernel.org>
In-Reply-To: <20260816074125.2105828-1-guoren@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_020135_593780_CE11ABDD 
X-CRM114-Status: GOOD (  20.86  )
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

Hi Guo,

On Sun Aug 16, 2026 at 3:41 PM CST, Guo Ren wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
>
> The initial K3 device tree used generic/placeholder values for the
> IMSIC guest configuration:
>
>   riscv,guest-index-bits = <6>;
>   riscv,num-guest-ids    = <511>;
>
> According to the SpacemiT K3 User Manual [1] these values are
> incorrect for the X100 cores:
>
>  - Hypervisor Extension: RVH 1.0, GEILEN = 8
>  - Advanced Interrupt Architecture (AIA):
>     - M-mode MSI: 512
>     - S-mode MSI: 512
>     - VS-mode MSI: 64
>
> Therefore:
>
> - S-mode IMSIC (simsic) only needs guest-index-bits = 3 (to cover
>   GEILEN = 8) and num-guest-ids = 63.
> - M-mode IMSIC (mimsic) does not implement guest interrupt files at
>   all, so the guest-related properties must be omitted.
>
> Although the KVM AIA driver will re-detect the actual number of guest
> interrupt files via hgeie and correct guest-index-bits at runtime, the
> device tree should still describe the correct hardware parameters.
>
> Update the device tree to match the silicon.
>
> [1] https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/08_cpu.md
>
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Cc: stable@vger.kernel.org
> Cc: Guodong Xu <docular.xu@gmail.com>
> Cc: Yixun Lan <dlan@kernel.org>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..4120eb0c4083 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1127,9 +1127,9 @@ simsic: interrupt-controller@e0400000 {
>  					      <&cpu4_intc 9>, <&cpu5_intc 9>,
>  					      <&cpu6_intc 9>, <&cpu7_intc 9>;
>  			msi-controller;
> -			riscv,guest-index-bits = <6>;
> +			riscv,guest-index-bits = <3>;

According to the IMSIC DT binding, riscv,guest-index-bits describes
the number of guest-index bits in the MSI target address, not the
number of guest interrupt files actually implemented by a hart.

On K3, the per-hart IMSIC stride is 0x40000 bytes (0x200000 / 8).
Therefore, riscv,guest-index-bits should remain 6, which satisfies the
per-hart stride formula specified by the AIA specification:

  2^(guest-index-bits + 12) = 2^(6 + 12) = 0x40000 bytes

KVM already handles the difference between the address space and the
actual number of guest interrupt files. It reads HGEIE to find the
actual number of guest interrupt files and uses the smaller value:

  /*
   * Number of usable per-HART HGEI lines should be minimum of
   * per-HART IMSIC guest files and number of bits in HGEIE.
   */
  if (lc)
          hgctrl->nr_hgei =
                  min((ulong)hgctrl->nr_hgei, lc->nr_guest_files);

I also tested this on K3. HGEIE returned 0xfe after writing all ones,
so the driver gets fls_long(0xfe) - 1 = 7 usable guest interrupt files.

>  			riscv,hart-index-bits = <4>;
> -			riscv,num-guest-ids = <511>;
> +			riscv,num-guest-ids = <63>;

This change looks good to me.

>  			riscv,num-ids = <511>;
>  		};
>  
> @@ -1168,9 +1168,7 @@ mimsic: interrupt-controller@f1000000 {
>  					      <&cpu4_intc 11>, <&cpu5_intc 11>,
>  					      <&cpu6_intc 11>, <&cpu7_intc 11>;
>  			msi-controller;
> -			riscv,guest-index-bits = <6>;
>  			riscv,hart-index-bits = <4>;
> -			riscv,num-guest-ids = <511>;
>  			riscv,num-ids = <511>;
>  			status = "reserved";
>  		};

For the mimsic part, I already sent a related fix earlier:
https://lore.kernel.org/linux-riscv/20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech/

If you would like, you can pick that patch and combine the two changes
into a v2, as Yixun suggested.

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
