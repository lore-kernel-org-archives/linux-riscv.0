Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE94AC001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 09:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=my83fAOaBK8runTuzqJDuw0ylAS3iq6qag2Utm2UmCU=; b=Re0To6CNRf6OC3cSBgH+AaSmz6
	Jo9ZOmR9sSykaWXsHQUgqdCGJSGJ/PLg0m+izmLvrsOXJ41yXyJZ3a7gtYDXvbbgvTt+v4UmIp+zG
	+lv0wx35WEN5Q4NTQjrUf/Kb94ORZnUP+svBC66MLA+d3ZYfRGPmyPT4hLc9loQf2s/DJRxXMrc6S
	Q6EiH8RQVtWLusGqDB+WbF7X+alh6fYY1VtxsaorVb9GysDlz5b/KxLZjuXB68qPqxzyZVcrIWCbO
	6KTfP/4Xw7aQDu2UR3wk50Z2RVFXf6z23weidhVl51kF+ae0PNkUQW+RybzGzwNzZJHvzWcIAi/0p
	BD1oc6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU26X-006zmu-2A;
	Thu, 10 Aug 2023 09:37:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU26U-006zmI-32
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 09:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691660234; x=1723196234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m6ICPZkOf1UsTTvF6tFwzpohSo09oSHLftw953wbMfM=;
  b=F5/Wo80JN1dFMZ9cFUl5HOhIldd2MKSjOKVLZyEDM3I7C/YRhyBa+/3i
   yDhr2HXtB/1ulUL7Fr/sh7VrJb5wGJdEhBtVv8wzqF8xSsk9FRSI5KOmW
   uSXxZh6eOvk5RHTuR0tftW8Cg6vis9163PL8+xWPzz3XVhhcM8VFuBMEB
   xA09jHc756v0KjfiyconKQfXGXLsvY6C33SznVl1oOVjFMcNG7W07LxKF
   roSV1rhFl5CCeV7QTf/evrdC7RcbC71XIDQSVUpQ8bcpDy5rIR4iLaOLv
   y79knBZOESrcJc/VQ6L8WvM2CqbvcqRuR2f9hd1Iog8g27/9zf+MjmHbJ
   A==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="229139309"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 02:37:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 02:37:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 02:37:10 -0700
Date: Thu, 10 Aug 2023 10:36:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <evan@rivosinc.com>,
	<apatel@ventanamicro.com>
Subject: Re: [PATCH 4/6] RISC-V: selftests: Statically link hwprobe test
Message-ID: <20230810-upturned-spout-8de932f34f90@wendy>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-12-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230809115516.214537-12-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_023715_040705_3D9C5F07 
X-CRM114-Status: UNSURE (   7.40  )
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
Content-Type: multipart/mixed; boundary="===============0375661398125336628=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0375661398125336628==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GapwcS/8BPpvYsSf"
Content-Disposition: inline

--GapwcS/8BPpvYsSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 09, 2023 at 01:55:21PM +0200, Andrew Jones wrote:
> Statically linking makes it more convenient to copy the test to a
> minimal busybox environment.

As that's mainly what I used for quick testing of stuff, this seems
helpful to me!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--GapwcS/8BPpvYsSf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNSvoAAKCRB4tDGHoIJi
0lz6AQCbMWTRe5afhJAW5vnigfYNrJQfBCTGJeQTy++fH9sQfwD+KKFYZnkv4hDn
tJNyACBGxDoN/vyCrQGeP1DeCCUIkQs=
=lb8u
-----END PGP SIGNATURE-----

--GapwcS/8BPpvYsSf--


--===============0375661398125336628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0375661398125336628==--

