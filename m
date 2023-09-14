Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFEEEDE9A0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzbF/N2Mj9Fte6Uw8LgxxlU+yC1c0WrwA3Hj8CcuXdc=; b=hUqkY2PA0eAG7Fb6h0OgI8MrpL
	5nXgLrFMrCgiT++od/GP6PxnMeiO6gE3KVkLuOcUL0xSMBlQgDgvnOhIRBX7Ai5fkM4u6+/JF217i
	coWrsPpOytzt5HueIIZ1savJ/42LILiDOqglXWfEN2/G6LuvEOeyS34JM8oGzAv8jzvd+88KpV670
	3PwDB3zgnQjk5P4n8dZRb6GuybmSfF8z+A0hjqaabU2IEkPBYwNwFavFIRvAVW0ppmKce0k92K4og
	fFcgyC41JMpe3tRSMUWC2Mmo4xdeclkS7Pbz+SgNBGHJHTaSKN/0OGr1YW2wM62SmN7a0qqlJGbEq
	n5JdScyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj1y-007t7S-2r;
	Thu, 14 Sep 2023 09:53:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj1v-007t4W-2X;
	Thu, 14 Sep 2023 09:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694685179; x=1726221179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zsiz6QuHidta1MZIjKdX2IK5RrYiU1OXGZGUU7TjwBM=;
  b=PGgUYUSmWvTUK8lbOTp2rEq7DaFzwZkacaGawCiY80kC9U6sd6r2B4B/
   lbelidsVphFLlJ4fFKxj+POMeUN3MtAQb5MLzU734YVZr0SSoxWiHjR+t
   110mPWlqB7oxxoUWRf3QpQM4OK0Z7gPbJZZhhu/dKFuVpBGdeclg428PS
   Hcr1Vl4gGGFG8NuUl2FZzQ3UpX6EjmNkx1KUmlDk37rRQbaHKGSSBWQL/
   NtY7gQUU4myjrOJH8XQ6jlPrT3AfpwjCJ/8w+2fjd4/vgX4/704D1t2AV
   3bZRfCco/xB500S/hct2uqhgg8BW1lI2eMEh8Rneb0XWCpV9PC89v7HmK
   A==;
X-CSE-ConnectionGUID: jCeTh2jUTiuWpEOHIgZ08A==
X-CSE-MsgGUID: UY8Fpe7jT9qj55hJGpC4ZQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="asc'?scan'208";a="4801598"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2023 02:52:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 14 Sep 2023 02:52:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 14 Sep 2023 02:52:31 -0700
Date: Thu, 14 Sep 2023 10:52:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Haibo Xu <haibo1.xu@intel.com>, <xiaobo55x@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan
	<shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
	<oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Anup Patel
	<anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Sean
 Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov
	<vkuznets@redhat.com>, Vipin Sharma <vipinsh@google.com>, David Matlack
	<dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, Aaron Lewis
	<aaronlewis@google.com>, Thomas Huth <thuth@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
Message-ID: <20230914-reflector-preshow-786425ad7ae2@wendy>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-ee133dd5e804282ce28833d6@orel>
MIME-Version: 1.0
In-Reply-To: <20230914-ee133dd5e804282ce28833d6@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025259_830171_C54E0FC5 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: multipart/mixed; boundary="===============2095240735945445697=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2095240735945445697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QNGDKlO9qNzaNQl+"
Content-Disposition: inline

--QNGDKlO9qNzaNQl+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 11:36:01AM +0200, Andrew Jones wrote:
> > +static inline void cpu_relax(void)
> > +{
> > +#ifdef __riscv_zihintpause
> > +	asm volatile("pause" ::: "memory");
> > +#else
> > +	/* Encoding of the pause instruction */
> > +	asm volatile(".4byte 0x100000F" ::: "memory");
> > +#endif
> > +}
>=20
> cpu_relax() should go to include/riscv/processor.h

Can the one from asm/vdso/processor.h be reused, or are there special
considerations preventing that?

--QNGDKlO9qNzaNQl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQLXzgAKCRB4tDGHoIJi
0jRlAP0UeFru9d2hDB+V95CsBHvHieORe8d/jeHJTK7NMGIDgwD8Dqdge5VTTSyn
ljeYudKmUM0GDQOhOOq8DQG3G+sO5gM=
=uzJX
-----END PGP SIGNATURE-----

--QNGDKlO9qNzaNQl+--


--===============2095240735945445697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2095240735945445697==--

