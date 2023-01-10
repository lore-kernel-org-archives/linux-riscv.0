Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6936C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxTEE32F6dEWB6y+tZsbnlLLiQ9nBXCLEcOv6nQZ/3A=; b=bbKanNIZVscbND4yPDoTN4kLI+
	dPg/ZGrlK3jCqGt+VobSQkF/zoJCXLzlNFSJOfEqLjjNU6t12cZG9n29lZ36Hq9+DL8DKmvoYdbcB
	O5TPOtGyWnaxu3U3CWpY4t27MnyOg9tp1N8GWqLxgUpGvCVJdindgNeVYScwht0yuEKbMU+K0jtF/
	LVGAHY3ZTCPpYaSwuFFDmMpRCt0B76zMeO7oGfoA3kvhvCgbUmnik2npkTJ9hTO5V5Uxh8UNs2eoH
	it6VRW4+17ephxtQHSO9Pz6SProfQPsdM+EODzjJ3OX92UB2tMkEsoS6c0NfommRCSzfhwOhVeDpJ
	xjqAO1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAPR-005wc2-VJ; Tue, 10 Jan 2023 08:55:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAPO-005wZo-TH
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 08:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673340902; x=1704876902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mT6AhxB3XswKvtV8hOQeuwvtn4ZOP86c00eYWxqbNi8=;
  b=sBwIW/wqqy9O+D+VgHaF+Ys6RTqN0nc21+nMfEbaiAWEKSY9Q+CKMl00
   6zFB9pHB8L0IX2okf5eYneho58MNfXvIS3+5MbkW3bmozL2G8hC/jTmQA
   EnI6/z0kANXKcKwGy5v74FtsFMsWLGi/Fz7bRDqn/gy5OTegWtEYNXKyG
   bgPGrTP6UCTHn6TD4qbC4z/rDygHrew/5MgtLcoSnskESOG3X4yG5uLYc
   dzU+RVry36XsmBpBCPf0c6SrC+r/SljBRWFUaNAO0+SIzLDjTxOMXCIVe
   u6P0xR1mps1al9LNv39xWVKChTix7+tdWZ+NVQAL6pRpGdE3nR+ehOzMy
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; 
   d="asc'?scan'208";a="207100317"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jan 2023 01:54:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 01:54:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 01:54:55 -0700
Date: Tue, 10 Jan 2023 08:54:33 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Heiko Stuebner <heiko@sntech.de>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <christoph.muellner@vrull.eu>, <conor@kernel.org>,
	<philipp.tomsich@vrull.eu>, <jszhang@kernel.org>, Heiko Stuebner
	<heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 2/5] RISC-V: add helpers for J-type immediate handling
Message-ID: <Y70nyVNaThxJ+2nr@wendy>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-3-heiko@sntech.de>
 <20230110084425.wupytnd5juzowzme@orel>
MIME-Version: 1.0
In-Reply-To: <20230110084425.wupytnd5juzowzme@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_005502_974930_663BD912 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Type: multipart/mixed; boundary="===============7728079502051065899=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7728079502051065899==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ySvXosCXxWQh1odu"
Content-Disposition: inline

--ySvXosCXxWQh1odu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2023 at 09:44:25AM +0100, Andrew Jones wrote:
> > +	*insn |= (((imm & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) |
>                                                                         ^ RV_J_IMM_10_1_OPOFF
> 									(as pointed out by Conor)

> > +		  ((imm & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) |
> > +		  ((imm & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) |
>                            ^ RV_J_IMM_19_12_MASK

You'd think that having seen one I'd have picked up on the other one
being wrong too...


--ySvXosCXxWQh1odu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY70nxAAKCRB4tDGHoIJi
0pYpAQCjRYixzkcXRpyvY2w82yWgpg8faMu+jFNh321qgYxuSwEA8nUw3teNep9v
/kJpRWfiMtnqyeTVRBvPeGMRw4fHegM=
=d7Uw
-----END PGP SIGNATURE-----

--ySvXosCXxWQh1odu--


--===============7728079502051065899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7728079502051065899==--

