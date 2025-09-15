Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA94CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3PTS+AXC0l5K6rGxPIFxgTHzagQ0fvkqb9rGwhAc6U=; b=zkIAuS9elgF6QgJAuV40p2LKYh
	+AWFpNDjjiBTKOLg53jrYdnUMOOkUJrddByqEdE2bAgkyBKLosZW3OsITY6x6MILCEf/R38ZLLtV0
	BGL8d5qDiGrgOBL/inxv4eRuSoVQYfcrPI7rK+SPIPod59tr9fwNnTbd9aZdwZPL73NIKbYdjWIxe
	sd35hWc1MtbtMgvw5pX72xQ5YNx8Bde3e7D5eCSfFf8Mca29tIoQpB0Ap5VoRSHWWpgnNYZwNajTO
	E6Fmrx+Rbgmf04yAUkNIYpDTNFA3gHgcSMAV882zXordt33EgWdotjWXED4k+MKd2CBi5pnNN5+M5
	YVpVSEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCe2-00000005DFY-0QNF;
	Mon, 15 Sep 2025 17:05:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCdz-00000005DEr-3TSd
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 732A043FB6;
	Mon, 15 Sep 2025 17:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836BFC4CEF1;
	Mon, 15 Sep 2025 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757955935;
	bh=QCcSyLKtRBEpOKVEnWbAIl+bl/ydhsIKcxdyT8tetGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/zc5hBL1H1uKA4zJpx6r2zWCbmwpMbns8eHIZm3ik363b1+81TX9PT1Et+dcMVca
	 w5QytMmZb+apJkySW4bNBKMo6lJ3C6r0mxa9HhzqitrKeMYletMYV0wimqQwlVQoXQ
	 N6HxFlT+W1d3WFv+EgRZu2E7FypYIKsgnAr6I8ouQlHTgB7epnj7gUoxW7Zh4VeH4L
	 48iv8rQ0flOx/+9ZQi1ko6TpmEXZAgBJqVM/I5UYFPfiiqr0i+1sQJwdfZ7YYx4dYz
	 /bUezOy7NhnEmdEHrIp8RvW0e8uuL4z1ozgWA0KqTJhdZfbeEkNq5C3Ak9Jr90kdqW
	 vtLU5IWoHfkhQ==
Date: Mon, 15 Sep 2025 18:05:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V12 2/5] mm: userfaultfd: Add pgtable_supports_uffd_wp()
Message-ID: <20250915-borrower-crusher-7a9e9121a1b0@spud>
References: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
 <20250915101343.1449546-3-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20250915101343.1449546-3-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_100535_892131_3C63CC99 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Type: multipart/mixed; boundary="===============0582652217554917701=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0582652217554917701==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/gi+eTVpaGnrTG3f"
Content-Disposition: inline


--/gi+eTVpaGnrTG3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 06:13:40PM +0800, Chunyan Zhang wrote:
> Some platforms can customize the PTE/PMD entry uffd-wp bit making
> it unavailable even if the architecture provides the resource.
> This patch adds a macro API that allows architectures to define their
> specific implementations to check if the uffd-wp bit is available
> on which device the kernel is running.
>=20
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

According to patchwork CI for riscv, this doesn't build for 32-bit
defconfigs or the no-mmu defconfigs.

--/gi+eTVpaGnrTG3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhHWAAKCRB4tDGHoIJi
0g3AAPYyMr0sKk1q17lwf8rI9IXyUkgSilhSi7k0qTds4n0KAP4iPiualM+L6H88
quoylo0zyBkFOvt7aPxdrFyH/BhuAw==
=Y8mB
-----END PGP SIGNATURE-----

--/gi+eTVpaGnrTG3f--


--===============0582652217554917701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0582652217554917701==--

