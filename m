Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DE7CE7B08
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faeqSDWAazCN3Bh+0pP+XSGPwFja46uz03vprSaTiig=; b=loyhWCvLcqQHuhruGgoI3oM7CR
	yGn13nbL3aaAz/aoYksjnTG3DvHKX5hx3jGdx3FqR1/TOu78IhWdPQNZ6AUkN5pXZxdqBz/vskKID
	aw9iAEceWagVN9HoURtGpkWOdiHb85snszxEPCwThDTt3jyQY08hkBqNj7UnKuPSYJPs1BSrYEst+
	B7a2yT5jhLzP+J4SdzRPiFflOUtz2PH5w3PLNpKio4zra0u4dRpRAaZo4yYUsIIbnDGNlR5M2SmBN
	sQNLUe26GTe9VM1E0Z9DXVpWjdRkauLHAOxnlMfGJtPHSSjZxNfJ6SvYDHBDtTcJVjlm+QezwGrQ2
	7HiUG35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllrD-002ZLQ-14;
	Thu, 28 Sep 2023 07:54:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllrB-002ZKe-0K
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 07:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695887685; x=1727423685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GpWFegTBp5yM6JLEFMqHTeSyrLm5zh8808vJewdHfc=;
  b=mNgQXYoUm1YYaRD+FEzo9iMFZBFtVtBJbWD8/ky4JZqCDTiAuq0HCC7r
   a+f9xPUkjGyFOcfyXzsBh78lrxAJla90BvepGaZwLqi7JJ1u4PPJTtEgH
   Uh0y2TR2UurNpYT/T8LT88jd8cm0RYzBYcyFdVid4ScrsC5e05usMMuUy
   NkKPibuxl2Dls2GWcmOzigR8tPkYO48ZdRNfMhqWxImozJx02okpo4deF
   6U0TmRjfLlhRxXmtKKGINo6IRCmAVogDua0AiYLYyaHAFta2qrM04liDb
   UBT3It/USVEPxw+0xbUjMFvL0vO3ORMHu3H4fopiNJoGXmVqVCkzEYQIc
   g==;
X-CSE-ConnectionGUID: NCgEknYGQJG6l7MApLDYcw==
X-CSE-MsgGUID: AmcurO+sTECrDbDybSnNWQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="asc'?scan'208";a="7033221"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2023 00:54:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 28 Sep 2023 00:54:35 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 28 Sep 2023 00:54:33 -0700
Date: Thu, 28 Sep 2023 08:54:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: Conor Dooley <conor@kernel.org>, <aou@eecs.berkeley.edu>,
	<chao.wei@sophgo.com>, <devicetree@vger.kernel.org>, <guoren@kernel.org>,
	<jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 00/11] Add Milk-V Pioneer RISC-V board support
Message-ID: <20230928-character-shelve-f772d9a1b493@wendy>
References: <cover.1695804418.git.unicornxw@gmail.com>
 <20230927-ebony-duress-44ff45d3d253@spud>
 <CAHAQgRC2xeqUu4mDZRJd3brcPNT4KovX65rNE7YXm+ku0+eERg@mail.gmail.com>
 <CAHAQgRDz=Gp45ZkyW1fZiZW7+EyxDzbqKkc56XOpCpZ7x1rJeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHAQgRDz=Gp45ZkyW1fZiZW7+EyxDzbqKkc56XOpCpZ7x1rJeQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_005445_309068_6EBD124C 
X-CRM114-Status: UNSURE (   7.95  )
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
Content-Type: multipart/mixed; boundary="===============2596443318076300045=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2596443318076300045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5m1Bn1GZfbMYs4+k"
Content-Disposition: inline

--5m1Bn1GZfbMYs4+k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 03:48:24PM +0800, Chen Wang wrote:

> hi, Conor, one more question, what base should I take for next v4? I'm
> still using 6.6-rc1 and I see 6.6-rc3 has been released out.

-rc1 is fine :)

--5m1Bn1GZfbMYs4+k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRUxHAAKCRB4tDGHoIJi
0oD/AP0Sg9cSFzJ4QG75QErZq87bCwS0txflO7nbtQ3XXqmgDAD7BSNsq/j/huEa
GV3lZI3TpSoBOy8Hd1I0DnhdXqTPWQA=
=z7qG
-----END PGP SIGNATURE-----

--5m1Bn1GZfbMYs4+k--


--===============2596443318076300045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2596443318076300045==--

