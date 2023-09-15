Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97552EE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0iqynttYsBPrkn9D1xeD7a4qYc8RJIr5FRlpiPrIEs=; b=gDmJDlbgqFc5CvlEKP9+jvKzhc
	Fdic15pugCI8OKd9xjcsh1w76kAmq+NjpSeWaIODPKmUKbic8L9zx0/vEvDlyXvYO5yL65E7cwk5y
	JkuiB+lpXuA/2RdvYIf1V5Qla9l1lUBaHwNK7NV2CAYiovntUqVC7dZVUF31IT/EZzPzvZFZirnAR
	m1lKhkuZ0Tg7ar3mb+OEblwy3yu09T9neG7Xa6OsCn7DZrvJZ/Pjp4ehdCFKbJSIBQ+9kJL3ljFkt
	ba9zeLPgujl2QP9QEyR+srsXHNylSOH1EA4xdGNfM+FmGpLMN+RBJ6z4ZJacVSkpA76sCw9A/VMUz
	sVG4JUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8AT-00AkAp-2y;
	Fri, 15 Sep 2023 12:43:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8AQ-00Ak9I-0W
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 12:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694781806; x=1726317806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mj5eYaq82hNMoxhsN8asXFIvsDdB/ZfUIlZ98+TAVAE=;
  b=bM7CWQvaHxmC7Z9a69+Mp5Leub6Xbmgtu0AnyQQbiY2SiHDqD+EPyOdu
   fyqg7FftHh5BwXptWnjACPeCe59wZ2uiKWEbJouA2hCJjzYGUdsRp2kDz
   isHNC+lAY+jnkY7XFintNd0Afn4LSslDT2XjwrAK9bFkKA0FljgLVkgiA
   1ltkRz+hOaxpdNM05BtaYoR4TKFElb4kTbkQhJAXpaSUhnNv67NfBcKli
   fIwYoEzIYPHXycdwpy82N2BEtYRm2v1fXIlggxucBiNPZKmR/8ZX1bj34
   kZp8EL66NP5GsrOyQMo+BdM0daE0Fyhr5gMJgq6TID9CcJl8n2UaSAVuf
   Q==;
X-CSE-ConnectionGUID: nKAwje6qR/irJC6a9X1Kjw==
X-CSE-MsgGUID: WQwjx2uVRreZCbEqWFG2MQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="asc'?scan'208";a="4861527"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2023 05:43:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 05:43:19 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 15 Sep 2023 05:43:13 -0700
Date: Fri, 15 Sep 2023 13:42:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Leonardo Bras <leobras@redhat.com>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <anup@brainfault.org>, <peterz@infradead.org>,
	<mingo@redhat.com>, <will@kernel.org>, <palmer@rivosinc.com>,
	<longman@redhat.com>, <boqun.feng@gmail.com>, <tglx@linutronix.de>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <rdunlap@infradead.org>,
	<catalin.marinas@arm.com>, <xiaoguang.xing@sophgo.com>, <bjorn@rivosinc.com>,
	<alexghiti@rivosinc.com>, <keescook@chromium.org>, <greentime.hu@sifive.com>,
	<jszhang@kernel.org>, <wefu@redhat.com>, <wuwei2016@iscas.ac.cn>,
	<linux-arch@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>, <linux-csky@vger.kernel.org>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <20230915-banana-undusted-ec336f45bc78@wendy>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-1ce4f391a14e56b456d88188@orel>
 <ZQQUQjOaAIc95GXP@redhat.com>
 <20230915-85238ac7734cf543bff3ddad@orel>
 <20230915-take-virus-1245c5dfed0a@wendy>
 <20230915-1c2b122672642e2cbcbaaaef@orel>
MIME-Version: 1.0
In-Reply-To: <20230915-1c2b122672642e2cbcbaaaef@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_054326_291674_13B0C5DB 
X-CRM114-Status: GOOD (  10.99  )
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
Content-Type: multipart/mixed; boundary="===============7183884328111506207=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7183884328111506207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RvlJFFFOtV+T3bcp"
Content-Disposition: inline

--RvlJFFFOtV+T3bcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > If this isn't being used in a similar manner, then the w has no reason
> > to be in the odd lowercase form.
>=20
> Other than to be consistent... However, the CBO_* instructions are not
> consistent with the rest of macros. If we don't need lowercase for any
> reason, then my preference would be to bite the bullet and change all the
> callsites of CBO_* macros and then introduce this new instruction as
> PREFETCH_W

Aye, I probably should've done it to begin with. Maybe there was some
other consideration at the time.

--RvlJFFFOtV+T3bcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQRRUAAKCRB4tDGHoIJi
0j/VAP4uDnBGaw45oL54jYmlkjZdGwkSRY+9gy2iMWgBfZ9esAD/Re3zn3/oL7dh
xOW3yDdXSJA0KVeV1pIWZvJl+hJhIwE=
=qlmN
-----END PGP SIGNATURE-----

--RvlJFFFOtV+T3bcp--


--===============7183884328111506207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7183884328111506207==--

