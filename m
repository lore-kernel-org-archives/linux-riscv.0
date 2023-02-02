Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AB2C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/O1HrH2RKxib22VVRYJYhPVSo4oe4piIAqXhcy71tQ=; b=b7p0U05WlGKYlNeTzOtdZ4xM9l
	dOpaO/yRU6b8ROlJn3Q9Sxrm6PHrJk9Ofs+iWMRz+ZwD37ygsgD68NSz4gbgIXhJTt/Io9qXdp4d/
	zaz1YumQdanbt6+cDABI9cbd4GvFVXHJVuCTdrwYcxOzcZu+ga689zEaRW4T7SrqNLSUK/tRhipHP
	5I20DRuRkUmLNrP/u7iBnZg57VtSpPMbncONS667a8ZPggDlcIoQrz/4/VNZyt6+1/nEEBNCY/zGw
	Px+2xGw7xI6EM93I6stfHor0Ni/2dV30+indmhO1/BNSZjn9ATg+NWo/cZSlG6HJTi9VP6zlOTRTP
	CQ05B4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVag-00F6b3-2L; Thu, 02 Feb 2023 09:09:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVac-00F6Za-8s
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 09:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675328946; x=1706864946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvQ1ErRDgv3I6gZTIV6p/uans2CYAUlZVIT84V7vf/M=;
  b=kgERE5ntkSzcY+EJ4vVb83/hUzX9PFoLmKXCydYPxgq23DgO7Yccbtel
   nBIHKAOAlDvFy5s8lleYm7bhvYDKyx7O5Bq0UT0JJuVNpGtV3bjTCK4Vv
   oODxa3te2ijaMOH4PreTS76tvdC8k3ITlqDPr6Lpd5mypnFLY+D9Qo/PQ
   iMCjEcHQ8iSgRjPP0/kasGPBN8nAbTUj5GNPfcSsHrsVGBUDLqoDpsveh
   qYuBWm12V28e1UuZG0Z444mmNwgR/v43rFSvd2gOB28o3E9grw/reY99H
   k2xlm5XlZ7ycmkg6S33+12GSTxl9d1sXBoT3BKHOfYg3zEWglbbB5+vAC
   w==;
X-IronPort-AV: E=Sophos;i="5.97,267,1669100400"; 
   d="asc'?scan'208";a="199047268"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 02:09:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 02:09:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 2 Feb 2023 02:09:02 -0700
Date: Thu, 2 Feb 2023 09:08:38 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liaochang1@huawei.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v6 09/13] riscv/kprobe: Search free registers from unused
 caller-saved ones
Message-ID: <Y9t9ljSEJtnr835Y@wendy>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-10-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20230127130541.1250865-10-chenguokai17@mails.ucas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_010906_377349_6BD45E23 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: multipart/mixed; boundary="===============8123324219553292745=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8123324219553292745==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aHQm0zwpXHrO71dn"
Content-Disposition: inline

--aHQm0zwpXHrO71dn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Chen,

Was looking at the insn manipulation code in 4/13 and noticed a minor
nit in this patch in the process.

On Fri, Jan 27, 2023 at 09:05:37PM +0800, Chen Guokai wrote:
> +/*
> + * Register	ABI Name	Saver
> + * x0		zero		--
> + * x1		ra		Caller
> + * x2		sp		Callee
> + * x3		gp		--
> + * x4		tp		--
> + * x5-7 	t0-2		Caller

I know it's just a comment, but this line here has a space before the
first tab that makes nvim unhappy.

Thanks,
Conor.


--aHQm0zwpXHrO71dn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9t9igAKCRB4tDGHoIJi
0iRMAP9UcWucUeNFvkwtiH1LHVHVWEqdLTuGy49K60zsCtS9uQEAtBfuqg0Ovlw3
ybWuIvRwhcGgmKIQ6dTMACFSeuUXYAY=
=qR8Q
-----END PGP SIGNATURE-----

--aHQm0zwpXHrO71dn--


--===============8123324219553292745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8123324219553292745==--

