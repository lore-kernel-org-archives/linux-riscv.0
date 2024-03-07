Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B4C54E49
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nxL2WgH8BBfkQ2ym0cRJaXixMXbs8m9TKNOZlZSJ9E=; b=36Ygiyj6sZA8kAHgI48sDtC7l+
	9/cjM2Y0e06jK2XcLu8hDS5YjedDYh0WKtL4tYzQ6g5hca5wmGmCphwIhzJ8eb7sbLfLktqXEil+w
	DSxRZF5Wsx5nDr3NP+zWG5t1zCCsSv0r9nqQuuGakL5I3vGEyagUBwf+Q0sXfqGB7Kn5YuiIxfvv2
	nFJ6QgZFU/jGs1knWL6NIg2gGoEXp70ULZiOI18ZTauK2i6PRZZMqu47ymXrTVJNl8ax8+Z6pdST8
	x9bxmPfzy4yC3Si4le4pzT+fXdLphczX/pHEhuTFTamMxQjnUXkwUrA2pDhd3wo5lN70Cv4+/egoP
	kfvmPN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri94T-00000003cDV-2mfL;
	Thu, 07 Mar 2024 08:25:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri94Q-00000003cC7-1DDT
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 08:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709799942; x=1741335942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=enCse7dbdQXNzTOxJ1nbIU4FpLfhxhz5LWnaFVXaicE=;
  b=WQvWS/Tx+tMDMaa65dFzc2J54lXkXRKZBp3grbrNhwP/m6KkNHswIv1S
   O9Zx2VNmLBhgWUkC1BMGwLDoLAEyeJY/TX0hKpIU4XCFz8E48/TZPr9vU
   ZUbdyg8hF37P4rtCRZg4bd0OX7E3OZ4MtaAcNGzY1AqUh408gN4ov3T7J
   7eiILSu1lKOuAu7Tin85641iG+Txo6NcNQbNdhBE6Ba6GQVDB5wuR7gd4
   glwuSf0M351kZNS4PoSnxbBHkPYYzcfdS0p6Xe4EDs8T/GGccoJgi5X/G
   bpvgVrM4/KfT7VM5LLql1RN0/RYFt5IycG9oMB9I5YEaj3OcqxOUVerX/
   A==;
X-CSE-ConnectionGUID: kAZEeyzJTe2x8LD+/3TGaw==
X-CSE-MsgGUID: sdgDN0UeSoumQpAx3OOG4Q==
X-IronPort-AV: E=Sophos;i="6.06,210,1705388400"; 
   d="asc'?scan'208";a="18986441"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2024 01:25:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 01:25:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 01:25:21 -0700
Date: Thu, 7 Mar 2024 08:24:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v7 4/4] riscv: Set unaligned access speed at compile time
Message-ID: <20240307-defraud-antonym-407fc29261d1@wendy>
References: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
 <20240306-disable_misaligned_probe_config-v7-4-6c90419e7a96@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240306-disable_misaligned_probe_config-v7-4-6c90419e7a96@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_002542_550831_CA572008 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============6519339088166009780=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6519339088166009780==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iUWIDEsf5AaiYg6s"
Content-Disposition: inline

--iUWIDEsf5AaiYg6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 06, 2024 at 12:00:04PM -0800, Charlie Jenkins wrote:
> +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS))
> +		if (unaligned_ctl_available())
> +			return RISCV_HWPROBE_MISALIGNED_EMULATED;
> +		else
> +			return RISCV_HWPROBE_MISALIGNED_SLOW;
> +	else if (IS_ENABLED(CONFIG_RISCV_SLOW_UNALIGNED_ACCESS))
> +		return RISCV_HWPROBE_MISALIGNED_SLOW;
> +	else if (IS_ENABLED(CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS))
> +		return RISCV_HWPROBE_MISALIGNED_FAST;
> +}
> +#endif

Isn't this just
static u64 hwprobe_misaligned(const struct cpumask *cpus)
{
	if (IS_ENABLED(CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS))
		return RISCV_HWPROBE_MISALIGNED_FAST;

	if (IS_ENABLED(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS) && unaligned_ctl_available())
		return RISCV_HWPROBE_MISALIGNED_EMULATED;

	return RISCV_HWPROBE_MISALIGNED_SLOW;

}
?
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

The kconfig stuff looks ~good to me, I wanted to make one comment about
the wording of a sentence I wrote being pretty meh, but I think it's
time to let go there...


Cheers,
Conor.

--iUWIDEsf5AaiYg6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZel5xQAKCRB4tDGHoIJi
0pPlAPwKe8nxyNXBCUxArQriqoMFYmNKeb0YDkPKt4MH66EXlAD7BfOP6iDRPpa/
qDkpTdHvENUdrS09wUiH9vE93smHeww=
=xXdV
-----END PGP SIGNATURE-----

--iUWIDEsf5AaiYg6s--


--===============6519339088166009780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6519339088166009780==--

