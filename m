Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09816C25B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ydl8x36B2OpTBCPPJh+2mK9kkM0djzwEeN58ER0tjdQ=; b=Cxc3WyxjaJuSL0
	XS8UpocMmFPraRbYChjmBZOG94qyvKij09zzD6axVpMoJ76PNPGnfTvCoEkoW46qSTRiXdpjxbJAF
	glpLIb2bjF4aRXuU4dh0O3YUSKw4GaEDShpkeO3a48bEm+f2gMD4dKwcnDhLr96uTfw7k76QrymwC
	OYUq2kuGQDCINdCqblwTwc2uCaK/MSrB0QPNX0Wul4+5VmlB5YHVmanFVZAFJFLd5FX1TXVe/bFI7
	vjERIsge5IYWXoD1eGI5Y5jKzkltfHXDAaikhkwH/oAUzqc1yYRhKRIbQn9aE6sfuZK3kCxrmu7QS
	JEhjLzNQw/qhTGP8O+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6smg-0000000G7hm-1dmS;
	Tue, 14 May 2024 14:05:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sme-0000000G7fr-0wDE
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA8446125F;
	Tue, 14 May 2024 14:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83515C4AF08;
	Tue, 14 May 2024 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695535;
	bh=QKyUQtzdUFj7E7VWNazUrxKopSKCrJnxnXXoOO9I0K8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLn+SxlD8a96Vi/A8lM2sysKVhH0gslhMRcG6/RFuCTRCj2QJXz/7tp2j4DwGGwTh
	 3s6+5SUO1nIjpJAF+WtJvgA5aYItK96Sb3keVQ5qAfR9fAiDhQy59AoJmhOA2XrWK0
	 ayQTEDyQFC54D6M7YKYx+IH/4KGsZRVrjgQhbTKhXcfDLpAlCxTd0vf7jvzMqhg10D
	 FNo9crb1rFcLhNsxwlSJXLQJLbLFUx+Vn0fV6a2SnBO6Ql/K2f7S+Cub2+7EHXyNVt
	 uL67hybo+QeRgGEosWl6aS/r8OQD0+M4q/Pkdwp8hNvF8RE8kn0rk6udwYclskf6Ei
	 XJ5CR8WHHNG4w==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 7/8] virtio-mem: Enable virtio-mem for RISC-V
Date: Tue, 14 May 2024 16:04:45 +0200
Message-Id: <20240514140446.538622-8-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240514140446.538622-1-bjorn@kernel.org>
References: <20240514140446.538622-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070536_346020_265A54D9 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKTm93IHRoYXQgUklTQy1W
IGhhcyBtZW1vcnkgaG90cGx1Z2dpbmcgc3VwcG9ydCwgdmlydGlvLW1lbSBjYW4gYmUgdXNlZApv
biB0aGUgcGxhdGZvcm0uCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+Ci0tLQogZHJpdmVycy92aXJ0aW8vS2NvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlydGlvL0tjb25maWcgYi9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCmluZGV4IGMxNzE5MzU0NDI2
OC4uNGU1Y2ViZjFiODJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCisrKyBi
L2RyaXZlcnMvdmlydGlvL0tjb25maWcKQEAgLTEyMiw3ICsxMjIsNyBAQCBjb25maWcgVklSVElP
X0JBTExPT04KIAogY29uZmlnIFZJUlRJT19NRU0KIAl0cmlzdGF0ZSAiVmlydGlvIG1lbSBkcml2
ZXIiCi0JZGVwZW5kcyBvbiBYODZfNjQgfHwgQVJNNjQKKwlkZXBlbmRzIG9uIFg4Nl82NCB8fCBB
Uk02NCB8fCBSSVNDVgogCWRlcGVuZHMgb24gVklSVElPCiAJZGVwZW5kcyBvbiBNRU1PUllfSE9U
UExVRwogCWRlcGVuZHMgb24gTUVNT1JZX0hPVFJFTU9WRQotLSAKMi40MC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
