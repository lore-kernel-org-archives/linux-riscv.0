Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C47C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 11:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vI5EFFmAmM/8ZogLhXIOr0AhnwE9UXYBtEFhEGRUnDQ=; b=DrpRGgsR4zefle
	ALbYS+maKpxbS7UEh2e31AnKBLdewQXYuTEGRY3Mgp5hhC6ARNoKs2F5fi8hrnhyMTfRLGro/739V
	BLKdW6L3yhFiDFHhvJav//B2e49FPBJLC0+J0xmdiV7nMaasYLNUFbMnvz+SZ6ZpDVyRdwRSe6x4J
	mnfwrUVeWjtYOZ74kFu8eKs30bx9R7faC9kV1lc9iAVZM+T8xdjhwxRGpxQPd8ZRuk7h3wl+xcJfp
	2uZw5EP+qSwwKY/l7nJOqqWaTXW9We67fdaI8Qy74gCXp/es/jWzbDc1xCcqlccrJBb85yDHEAMRg
	6iWlvh68+J8CWpVZOy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nzo-0000000HKzq-1HAr;
	Tue, 21 May 2024 11:49:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nzd-0000000HKq0-1jmC
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 11:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3ACE621B6;
	Tue, 21 May 2024 11:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D227C4AF09;
	Tue, 21 May 2024 11:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716292160;
	bh=kYHsD4H/RUxm26ELjeG4CcFUjPg7NPg0mup/+DL8qlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AE2HJc/Zo839RiPkn077HFAru7fuQ3IdqockYIAAK4zrgbbEvq7k/6D1z1skg/3ef
	 RBh4dJwbAkn6gux0u6dNld3GBZYMx2VqFWHEMI0zvFmccCkrfEHAR2ddpZ24phAuqa
	 mI0SCQ+ctgny3cFlc2/TsvQRGX/sEZoIceuOrAT0CeIc90szt7ePzoutW/5i4kLtFF
	 qDWUDAGevJg9PqJeLprnBHn6L2mH7CMZnVN2piLag+A9h5W2rL/rpWPDEtL+u7oND2
	 9e7GTMsDYuPcl9ftqfNlKcpfbLlW30egyyPtb5iTFjfLza91IxsO77cTeetIR+UAPT
	 cyOonut+Y4MSA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 8/9] virtio-mem: Enable virtio-mem for RISC-V
Date: Tue, 21 May 2024 13:48:29 +0200
Message-Id: <20240521114830.841660-9-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521114830.841660-1-bjorn@kernel.org>
References: <20240521114830.841660-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_044921_789546_F214E882 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKTm93IHRoYXQgUklTQy1W
IGhhcyBtZW1vcnkgaG90cGx1Z2dpbmcgc3VwcG9ydCwgdmlydGlvLW1lbSBjYW4gYmUgdXNlZApv
biB0aGUgcGxhdGZvcm0uCgpBY2tlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhh
dC5jb20+ClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
LS0tCiBkcml2ZXJzL3ZpcnRpby9LY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vS2Nv
bmZpZyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcKaW5kZXggYzE3MTkzNTQ0MjY4Li40ZTVjZWJm
MWI4MmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydGlvL0tjb25maWcKKysrIGIvZHJpdmVycy92
aXJ0aW8vS2NvbmZpZwpAQCAtMTIyLDcgKzEyMiw3IEBAIGNvbmZpZyBWSVJUSU9fQkFMTE9PTgog
CiBjb25maWcgVklSVElPX01FTQogCXRyaXN0YXRlICJWaXJ0aW8gbWVtIGRyaXZlciIKLQlkZXBl
bmRzIG9uIFg4Nl82NCB8fCBBUk02NAorCWRlcGVuZHMgb24gWDg2XzY0IHx8IEFSTTY0IHx8IFJJ
U0NWCiAJZGVwZW5kcyBvbiBWSVJUSU8KIAlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCiAJZGVw
ZW5kcyBvbiBNRU1PUllfSE9UUkVNT1ZFCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
