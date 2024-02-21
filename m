Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2488DC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1HU8FOykRA21CM55P26weQbvwTKGslXqQa/sz9B/18=; b=T1SqjHT3Nc8ibOY/S+U5XI1E+i
	9ePdZDJreb95QPWyzHFLgYkRCGNLtkr8nDrkrOJVrePDVk33VOBKDK1uBSyegT5hdDZM4GVnbDeQx
	XXUD4APAOuSgDp6JCMgQfSK9kiCk6wJDAz3DKNwSpKm4H15LKzvyzs1AUNtnWN3NxcXGo0IGg9y03
	ZLolsGz6Qx7SHsHEMqN6MZcbyDTOWRWkq1jF36NHIZo+xfSaHI92Y1o9cLNmorw1nHV/NItIXLPOr
	Yq4bHnF/rbNRtewZbDG1gT/UGBTdygfOKHEVtxCWYHcs7LpA9fsK/vTAINdwCDL0OCA3aEbbGQ+ze
	Onc/2NAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnwJ-00000001M8K-02se;
	Wed, 21 Feb 2024 14:51:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnwD-00000001M6L-2t0H;
	Wed, 21 Feb 2024 14:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 06B79CE1E05;
	Wed, 21 Feb 2024 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8107DC433C7;
	Wed, 21 Feb 2024 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708527066;
	bh=jR116JpyfvNBm06wmEVLlKKRHi5BQ5NesCFPXL2SImk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRDAvBZzYYuE5uEfs/DEtOe7zPNcnoZYbwSu75Up2HHOCiaYs3dPtA3OFeS3aPijj
	 cdCJEC4io72wTxOSQfnNvLnLW0c2gv6tih+AGJaN/cIIMfccENvgOGgW+Y4y73EviJ
	 /95XICjCmk7hF5YBUPHW0H5+53rvT5IPFuNh9DzIoo/B/iZuLVvbEAjqaT79MVu+SO
	 zoH5NBPAIyQheTU4QmU6vzAQxSV9MnS1mlP894VbFgkaw3S9I8y+HXI75doohUQtiO
	 LrWh102L8ZI7FGNYQCmOW2aK0zb6kqrnVpxfNYFRZM3L9sb8iFhtUia1zIniN3qzQ2
	 6qH0YCc10mUxQ==
Date: Wed, 21 Feb 2024 14:50:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Maxwell Bland <mbland@motorola.com>
Cc: linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
	agordeev@linux.ibm.com, akpm@linux-foundation.org,
	andreyknvl@gmail.com, andrii@kernel.org, aneesh.kumar@kernel.org,
	aou@eecs.berkeley.edu, ardb@kernel.org, arnd@arndb.de,
	ast@kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org,
	brauner@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, cl@linux.com, daniel@iogearbox.net,
	dave.hansen@linux.intel.com, david@redhat.com, dennis@kernel.org,
	dvyukov@google.com, glider@google.com, gor@linux.ibm.com,
	guoren@kernel.org, haoluo@google.com, hca@linux.ibm.com,
	hch@infradead.org, john.fastabend@gmail.com, jolsa@kernel.org,
	kasan-dev@googlegroups.com, kpsingh@kernel.org,
	linux-arch@vger.kernel.org, linux@armlinux.org.uk,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	lstoakes@gmail.com, mark.rutland@arm.com, martin.lau@linux.dev,
	meted@linux.ibm.com, michael.christie@oracle.com, mjguzik@gmail.com,
	mpe@ellerman.id.au, mst@redhat.com, muchun.song@linux.dev,
	naveen.n.rao@linux.ibm.com, npiggin@gmail.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, quic_nprakash@quicinc.com,
	quic_pkondeti@quicinc.com, rick.p.edgecombe@intel.com,
	ryabinin.a.a@gmail.com, ryan.roberts@arm.com,
	samitolvanen@google.com, sdf@google.com, song@kernel.org,
	surenb@google.com, svens@linux.ibm.com, tj@kernel.org,
	urezki@gmail.com, vincenzo.frascino@arm.com, will@kernel.org,
	wuqiang.matt@bytedance.com, yonghong.song@linux.dev,
	zlim.lnx@gmail.com, awheeler@motorola.com
Subject: Re: [PATCH 0/4] arm64: mm: support dynamic vmalloc/pmd configuration
Message-ID: <20240221-ipod-uneaten-4da8b229f4a4@spud>
References: <20240220203256.31153-1-mbland@motorola.com>
MIME-Version: 1.0
In-Reply-To: <20240220203256.31153-1-mbland@motorola.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_065109_963010_10DEEB32 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Type: multipart/mixed; boundary="===============0899923053486065935=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0899923053486065935==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+os/L6iBAa0yd7x"
Content-Disposition: inline


--r+os/L6iBAa0yd7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Maxwell,

FYI:

>   mm/vmalloc: allow arch-specific vmalloc_node overrides
>   mm: pgalloc: support address-conditional pmd allocation

With these two arch/riscv/configs/* are broken with calls to undeclared
functions.

>   arm64: separate code and data virtual memory allocation
>   arm64: dynamic enforcement of pmd-level PXNTable

And with these two the 32-bit and nommu builds are broken.

Cheers,
Conor.

--r+os/L6iBAa0yd7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdYNywAKCRB4tDGHoIJi
0gMuAP9F/qaVnaevMHMAFC79aMoA7T8MPtngzCYgeGKGkodjfwD+LfeSF0KgFWRs
XPWMo+0cR11PZYg4ErTvrYapXzyvsgY=
=uABL
-----END PGP SIGNATURE-----

--r+os/L6iBAa0yd7x--


--===============0899923053486065935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0899923053486065935==--

