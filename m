Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54658CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI1tWQcvydQca6gkFQaZH9mdbI+nBzvqhxVzlaD4s5s=; b=RGVCWoX1GNcO/raw9lxFHbKBJh
	u2NWDY5YNy7iH5xH18Nk3N+vXoTIBUU5/HH04bhHYZ/BL4Ig4vjMGcC9dsmJ6VSEoVW0PT/H0hnx3
	LggO8E2ibke9ZWAbkWYFa4alJ5vCr1DVtQpwqe1tCgu3VHGzZBCH9kdDDwATCYHf33FB+VeV0XggJ
	Yr5BRgJLCRiqPgjtRqimQdoTzof/sCTJ267dI7MF7HUc8H4VHl+FNbV0Xjuxf6a4P37xvMh5Yjzr+
	rsCY0DUmaAoDIsQNrTZPwv7rdC3mjY+6mtwsOmLCx+40vorf3KrKjy72KBjv0X98k5YPdb7KkYT+0
	UoT9vsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL5-00000000J1e-3mSt;
	Thu, 18 Sep 2025 15:14:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL5-00000000J17-0Dyd
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e37jPrqR9E8heaYU5Fw0c1p4mhM/UmeLs+VMIVzgSZE=; b=aznqumSVUcZ+94splT66a4kmGK
	QbrtkAT5OKPKw8gEtzR2t6LfM2j/zTVhbHUE6mpqKy77QmWkgjsPbAZFq/aEIdvTY2BKgfoeDTsf3
	lX3ow4w85F5jW4Fw64zah3ZJWJfP7zzT+GZ4+yWWHDYo4U/wIUT0lrJ98DJltA9HY0XqXJgj7JGxw
	yKbjmEimyPHtdy58KqIEfbE11zrBkjQQDCkqF6gsRxOFMfRrNoL7w4UD8Qj4O15pga6TwN4/odNef
	Ov4XArTSYhqfj3TWvt/wjr/zb5z9lCPxtCy0L2dzZaafPfZqbFJw3XXAL4SQFdFar64zJL813Z7uZ
	87jEcd5g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL2-00000007d2L-00my
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AB034451D;
	Thu, 18 Sep 2025 15:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84D7C4CEE7;
	Thu, 18 Sep 2025 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208460;
	bh=e37jPrqR9E8heaYU5Fw0c1p4mhM/UmeLs+VMIVzgSZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyx37ooMvHHb8c2sv5ewsfpuJtmCBzSabR83O1NgTFpdz8Z/WZ2OJfpZPLSHPAOTj
	 f26qGMh6giX3o7w25KYRJjZZlZYAyKI0w5E4csToLEmUKG7ymqX5vZN4kNtOYsYJuK
	 aZiouhU6Yheg0iQC0Kqk/TbZpTdCBCJde0+fOjJONutiDEGcx6nB/8KQCOoBrM62Ex
	 ucKITNtFN4+nAw1QHFF5cbsY2wcvDQhIcOpoK14AEFv1j+ymWVNhIR2tgVKTv4pbxf
	 FsrwjSN8lBpLrKgUDlWA0P1+wfg0R10wopAEqZCgvdRgEsox15caWrQjvlsmO/FROT
	 3hY+hk1liNTfg==
Date: Thu, 18 Sep 2025 16:14:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH V14 6/6] dt-bindings: riscv: Add Svrsw60t59b extension
 description
Message-ID: <20250918-hamburger-dyslexia-4f28f632ba2e@spud>
References: <20250918083731.1820327-1-zhangchunyan@iscas.ac.cn>
 <20250918083731.1820327-7-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20250918083731.1820327-7-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_161424_258409_BF196185 
X-CRM114-Status: UNSURE (   6.46  )
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
Content-Type: multipart/mixed; boundary="===============6576974007817572980=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6576974007817572980==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FffgZ+UbWyVNp4c4"
Content-Disposition: inline


--FffgZ+UbWyVNp4c4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--FffgZ+UbWyVNp4c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwhxAAKCRB4tDGHoIJi
0iAsAQD7ScZJcmETkRnAWwXKaeLSK+AK6nQi41/FAWzfFHlGdwEA7piCtUIt1/yB
fVjprhuNZVfc3qSe20i1DS2O+/jVCgw=
=VlWO
-----END PGP SIGNATURE-----

--FffgZ+UbWyVNp4c4--


--===============6576974007817572980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6576974007817572980==--

