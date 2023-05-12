Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586A6C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwjhJe7PVjKk3EeO9qNaIVzyuxKu/JaEQkKV7ME+3Xg=; b=sRFKZC/QdqY+En
	tkerRYV9zbQs2DLA6aA+elNU5ZfS/j6R1a6XIxJPBit14AEhi3uv2J2/Luxb+LU+LkPjMZia/U8QM
	MK8pRQDk5VMLtr6rR9DOlFOomY8Zi8M6CexzlAgGPu/5aE7sm2DzmEIrpinYKdMGTckOnXboDPva8
	T3TTfjKCY81AV0FeBymd7KvlNpHCuSEmA+ybeXEkQGoTmTqhbC10A3xJLLzmY6dPYHFRzYnYdWFLR
	tNnlCcHcm4Au2w4WcRaUJYicMNC5NHwq+2FCqS+gAerfLb6FWLKIl4/h4PxtwdTm8DDm87CNXkLUz
	5Pqv59cpRIeUX7FZw1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDr-00CG4U-1e;
	Fri, 12 May 2023 14:58:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDo-00CG2V-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 14:58:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06B8965766;
	Fri, 12 May 2023 14:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF583C4339B;
	Fri, 12 May 2023 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683903495;
	bh=OlUUIHh8F/ikEn4ruOXdEkA3wElniYzLmKIr7MhQ0Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NcLbHLWxqI2bumvNceUzMAPv+C0Y746k1Jp/7tXA1GgJqday/8MB/23BL0VcKD2EF
	 l7sOoE8BAouxMF63X6G55suALJoO0H7hzI5XVSs9OXLwTPoBkriEnruif/KXQ3aW+/
	 SFMo23v3zgADZZc+8aPweKC+kX6VdWxTcQh0IOUvIyRD43+WepPIyPmdzGCt6wUJWx
	 R49ozGhEMEXMJZEifDbl4mVjzatCqLEVcObGNbLsH/wJ2aox1/STvfILMriazGRm51
	 mnOGBU56o6Scmd5rVB7pPYs1z+zlGd1OdAwUcUAL4VkEWtJlONEsexD186+SZnZ1pr
	 dXjChETIBrCjA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	virtualization@lists.linux-foundation.org,
	linux@rivosinc.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 6/7] virtio-mem: Enable virtio-mem for RISC-V
Date: Fri, 12 May 2023 16:57:36 +0200
Message-Id: <20230512145737.985671-7-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512145737.985671-1-bjorn@kernel.org>
References: <20230512145737.985671-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_075816_517285_24839A14 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKTm93IHRoYXQgUklTQy1W
IGhhcyBtZW1vcnkgaG90IGFkZC9yZW1vdmUgc3VwcG9ydCwgdmlydGlvLW1lbSBjYW4gYmUKdXNl
ZCBvbiB0aGUgcGxhdGZvcm0uCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Ci0tLQogZHJpdmVycy92aXJ0aW8vS2NvbmZpZyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlydGlvL0tjb25maWcgYi9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCmluZGV4IDBhNTNhNjEy
MzFjMi4uMzU4ZTc5ZWNlMTY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCisr
KyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcKQEAgLTExNyw3ICsxMTcsNyBAQCBjb25maWcgVklS
VElPX0JBTExPT04KIAogY29uZmlnIFZJUlRJT19NRU0KIAl0cmlzdGF0ZSAiVmlydGlvIG1lbSBk
cml2ZXIiCi0JZGVwZW5kcyBvbiBYODZfNjQgfHwgQVJNNjQKKwlkZXBlbmRzIG9uIFg4Nl82NCB8
fCBBUk02NCB8fCBSSVNDVgogCWRlcGVuZHMgb24gVklSVElPCiAJZGVwZW5kcyBvbiBNRU1PUllf
SE9UUExVRwogCWRlcGVuZHMgb24gTUVNT1JZX0hPVFJFTU9WRQotLSAKMi4zOS4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
