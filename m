Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6E0C54788
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 13:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSAxPKcIWkhIGCEoLj9O8cUBpKKbZxoyVoms6qWZg7Q=; b=vWBMkD7ianeBZXqRXbZszaXBPK
	NvwowbcGOmkmmSL4syy+vt1YWzLPnFc109eGZbP4MSVU2GzKWZQg5/EShNbVZCCkDwYWHaewTEWUh
	slTqnhLeBD+TlYBTr6jlmpIVFqRRGxC+55Dr1E3gPy9QyCJ+On7LQQ35HTAgMFPY6OqWKjrXoH9E+
	v3r2X3iqmpSth0gJeVMVZJYDuDpWg0C6+7bYVJtCN4apV6X0pqnkoRGgAo+Zv+WJB5S6AzftZ37Cj
	+EvZ2N4Jd/JqZSpq40W8NrntfW7LDDhLbYK6ekFKjGgI3zOsam0QKXjC+wiCWNXszDBLEZ1UXx5kY
	uGjYylhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Cg-000000053WS-1UYX;
	Thu, 22 Feb 2024 13:33:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Cd-000000053Ut-1juu
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 13:33:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1D925CE22A9;
	Thu, 22 Feb 2024 13:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62395C433F1;
	Thu, 22 Feb 2024 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708608807;
	bh=ek76lcOHd6638oPTS6Co2oHesqGce0rC+wixg+GWnxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3e5etiaCTIf6mj5LJfPayGGRPCkqpzgVIw1FeLdsLBfQNoMAL/qYtEtGJibhp3oU
	 XvqjYzMm14iBcabQH9ixoP1adKlIOXGttkEhHZ12Rn+NE7gvkO0FpJV0Zyj8nQwHej
	 MjS2muDzwVxCuK7DRdg1nW1guor/t1KJ5KFDRVtVQGCSbEzRP9ZExfSI7/m4gQY7lu
	 IH2ENW1K8nf3rbsVt1oRT1ORFvOCs/E01MBBu4hQdhIY6WX6HFJELx88n+Vg8H2giH
	 DQ7AfczuUA1Y5ZtqJLYSw5zzQXVd8T4Ihv2M8i5skO8VC6v+6w6nuxJvbPeOJJ9KVr
	 TwOSG7d+bkkgA==
Date: Thu, 22 Feb 2024 13:33:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: rick.p.edgecombe@intel.com, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Message-ID: <6ad3e87a-25ab-4938-8d81-c5c609619586@sirena.org.uk>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-16-debug@rivosinc.com>
 <ZcJX2IJb0hOM5RF5@finisterre.sirena.org.uk>
 <ZdaZj0pqaVJiNOUg@debug.ba.rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <ZdaZj0pqaVJiNOUg@debug.ba.rivosinc.com>
X-Cookie: I have accepted Provolone into my life!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_053331_807557_98720C3F 
X-CRM114-Status: GOOD (  16.93  )
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
Content-Type: multipart/mixed; boundary="===============5037180176011142514=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5037180176011142514==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LxmbY0AjUg4WDPUw"
Content-Disposition: inline


--LxmbY0AjUg4WDPUw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 21, 2024 at 04:47:11PM -0800, Deepak Gupta wrote:
> On Tue, Feb 06, 2024 at 04:01:28PM +0000, Mark Brown wrote:

> > > +#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */

> > For arm64 I also added a SHADOW_STACK_SET_MARKER for adding a top of
> > stack marker, did you have any thoughts on that for RISC-V?  I think x86
> > were considering adding it too, it'd be good if we could get things
> > consistent.

> Please correct me on this. A token at the top which can't be consumed to restore
> but *just* purely as marker, right?

Yes, for arm64 we just leave a zero word (which can't be a valid token)
above the stack switch token, that does mean you can't exactly tell that
the top of stack marker is there unless there's also a stack switch
token below it.

> It's a good design basic with not a lot of cost.

> I think risc-v should be able to converge on that.

Great.

--LxmbY0AjUg4WDPUw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXTRUACgkQJNaLcl1U
h9ChLQf/TR/+XFN8k0dkmk90JLlGHu3WaTQM0wqbCtUC2FExSxw4JGFIeRSKnUum
10loLkMwAaklC1on36bhQcqVQ+qMOoVN0k9k+YJpi4iXFDo6LH95Z4Qwq37xUQOg
EI+FqbA6BiCGk1OVOHibZO51nBBmQuwO4c/MYT24AYyoR2/uk6OPE+G1Mm7K4/M6
zukeMbRS4LPn++luduEqROdMpJNdEBjeSELUQL8AjyUFemzG6ZlpojuJAvVNbVsN
COBlGD75skhCaSfor7bhAv3iKrr+htaWDZ3zwkPMjlufoZjwYBUb+h3A7eE2G2YF
wLkwHJN21WNLbqxqHXvjCFibtxling==
=mXRS
-----END PGP SIGNATURE-----

--LxmbY0AjUg4WDPUw--


--===============5037180176011142514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5037180176011142514==--

