Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EA1C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHqbOXuR9NurKTLnSHyvbVs4B+zPuceW72cLOKhoIBY=; b=aVtwgC4Z9O+FsW
	5daXOOi7/rlULdxTGqYktYIjSMz+BoqShEYvwcLF7lSPucOuG1bbl6mAEOgSmM8m8fclh3HR1FVv8
	NH99x+Sxj9hXLYBsSwhuPEjFTWwFo0Hh5OPY9OaMqL8TfuRcSit7v3JSNiJW6ygewdmX7Wlzhfe9N
	9mIpkmr/786WpmYg6L70GZOpu2mTwFgyQBBJKRQwZKcJ8ROKZZm9j5n2rnFr8quXmRtcyrVOVO2SM
	BhKLzypiWIBE/hy5wiVWzv9b65GFXeJpzzcH/0YQaPWm64easUPKA+PN7yvKaJmL+hOo5+gEZKZ1p
	zMOd8OB0V7B7cApeKhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1p-00000005kJS-0j7D;
	Wed, 05 Jun 2024 11:42:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1k-00000005kDu-1YH7
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A53F5CE176A;
	Wed,  5 Jun 2024 11:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9B6C3277B;
	Wed,  5 Jun 2024 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587718;
	bh=cNH/faxi7/uMHF3i5ru1TGKN5bBuB3CG9oyUregFlwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fe2kjdHr8ojoEyfXhgZTloB0ifMmIHOiG5DKKusQ7Sy/pLVBqY69c3MDTz/IU9Zgo
	 MOhwVt+ahqsvED2Vp8J9R+Q8ubBgqynFng83NWmTihwz/P2ChTKelcdKT2bUChXFK9
	 XPcoo8c3N4IbEGXTynF+kAx7m1dH5G/PPGoikssoDmop+tc7FNpWuiccwDm0/0jsfe
	 H4f2dL3LvdfbCWfFtqsONnn/c9csqEX1jG6HQnp4UkSH/eCSeScKzEtuXeHHntRU0w
	 WP5qZvrd9lyHDBzgPM4+Zt64wDTLbmT3TRs6NhwxTl4SmXf6mkzAM5N7uV58/eSTTK
	 ItWw6ywddPduA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 09/11] virtio-mem: Enable virtio-mem for RISC-V
Date: Wed,  5 Jun 2024 13:40:52 +0200
Message-ID: <20240605114100.315918-10-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044200_815746_52A354FB 
X-CRM114-Status: UNSURE (   9.52  )
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
bmZpZyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcKaW5kZXggNjI4NDUzOGE4MTg0Li40MmE0OGFj
NzYzZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydGlvL0tjb25maWcKKysrIGIvZHJpdmVycy92
aXJ0aW8vS2NvbmZpZwpAQCAtMTIyLDcgKzEyMiw3IEBAIGNvbmZpZyBWSVJUSU9fQkFMTE9PTgog
CiBjb25maWcgVklSVElPX01FTQogCXRyaXN0YXRlICJWaXJ0aW8gbWVtIGRyaXZlciIKLQlkZXBl
bmRzIG9uIFg4Nl82NCB8fCBBUk02NAorCWRlcGVuZHMgb24gWDg2XzY0IHx8IEFSTTY0IHx8IFJJ
U0NWCiAJZGVwZW5kcyBvbiBWSVJUSU8KIAlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCiAJZGVw
ZW5kcyBvbiBNRU1PUllfSE9UUkVNT1ZFCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
