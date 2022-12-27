Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5C4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fwpi282+W5tGu7FJhsDzmsAwzYPhsW/3miOtjeH6o2Y=; b=j18i+yg4e/7MUR7g67M8V90tzf
	kntDwD3dA0Ywv4grfMfoCoPoZw8kTT+vi8uUp1qmKg4LovxHRKTnRp1ZPZ36zjlyB+ebr02+wfbgy
	HFoAC7U5PUNwPzL0aTjL/ph5VxK+evNGk6S6jh4Rk03g/63kDCTaf3sL33gSnb7LxqKr8581eyIRt
	IlRmcsvOVK/OYJ+sA+l7O7iIBQJSHLiocrx38sksB19JfKu95FFetk6NVLM6ALoJIie37TKQ5MM51
	IdKSTfhssREtxUe/5oQAcd98uE64ZdCcBKF9T0R0Oh64VZLcLfiVoBHm+/xGniXfjNbRqW29i94f9
	aGUcMp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8xZ-00CoU6-HF; Tue, 27 Dec 2022 12:21:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8v2-00CnFZ-1B
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 12:18:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E179B80F93;
	Tue, 27 Dec 2022 12:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C8AC433D2;
	Tue, 27 Dec 2022 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672143533;
	bh=X+nWZewsPZi5jNva7XDOfTTkTv/8B1D3eHlqIFDb1U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiOXFuLegsNSE6MQHX1/c5nNMDWtt+Va/LS6d7WmXx3Pb1M2vIzqknOm2J3l6peC2
	 fZsEiPu0sSAOtq/OIjwL5mnxC9XHwR8CWTqSPeT19UwPbPjNVcqj5vh+mKuHeC0Wop
	 ZauEtBY6rfLgzhJhBw85cEkumJEqQXDPvYagpeB55YZ825ueE+H6mCynICheDqYCZV
	 RKH9Rnin6xpUAJvUYA0KjLrwrzUWi46sHx0Vkhouzmo4r9LFSocwfl4uJMpd5vnF9u
	 d/TB4wbKqNcH9wwkOpx6IkvwhuUx5INH+jzyuFUYaAZhRpj+Awt00PIHtxJwkHv04V
	 RszDDPbEz+pxQ==
Date: Tue, 27 Dec 2022 12:18:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: errata: fix T-Head dcache.cva encoding
Message-ID: <Y6riqKjhKhDqPp8d@spud>
References: <20221227020258.303900-1-uwu@icenowy.me>
 <CAJF2gTSGvEnTqEqR9f+zU8T3VS8FoCtsgSk=9hz6cWxAL630zQ@mail.gmail.com>
 <2c3bf520dec7e368f5b98d7c17811f027921dfa8.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <2c3bf520dec7e368f5b98d7c17811f027921dfa8.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_041856_298198_8F36A779 
X-CRM114-Status: UNSURE (   9.28  )
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
Content-Type: multipart/mixed; boundary="===============0399563204104121027=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0399563204104121027==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cA3k6P0AnyBAVulW"
Content-Disposition: inline


--cA3k6P0AnyBAVulW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Icenowy,

I can't find this patch on lore or patchwork, (although the replies made
it). Would you please resend it once the discussion has died down?

Thanks,
Conor.


--cA3k6P0AnyBAVulW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6rimQAKCRB4tDGHoIJi
0gfVAQDWi8TDIgS+3ggBNtzQLu6IvFpAh32T0jjw1ehKU703UAD+Je2ehtZz4KXC
yRPdYcnr5urETjAbgmqNytV0BXf92wc=
=kYz1
-----END PGP SIGNATURE-----

--cA3k6P0AnyBAVulW--


--===============0399563204104121027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0399563204104121027==--

