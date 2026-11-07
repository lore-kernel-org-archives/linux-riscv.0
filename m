Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E18606A32E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qSadLEy7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngQ+0km0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aRAoa80IIDm43zYEkp/DkNjktoPIfFM0XvGDANNDVzs=; b=qSadLEy7foGxdpgME2Rr+s3Gzw
	e311GOjMyPu6n1qFNwnFTtixoENTiw7keAXUJTTeEsPZMI+G2TvjkRp2ITxOklnN1rJ9XGrJTq/O7
	7cwHDbgAqW0sujcz3I6ct0QzRN1DP92qXBLxba1v5XvBvBUHpgVkreSN7m+aLgrrf2TezTv3k6P/F
	7UyDJ+pQCaH8qc4qOJZa5mP9rs8nVey6ftP+wHFkwper1jH2/Awo9SkHbed8/0Xz9i0Hyc/YLjYwi
	x3rxEi5rRzpzrjMUgOxtQi8jg4Z7pyr/quCC7VKUMbyOcG2RV2RDS8hmpYhH+0f6lpr66kxaxZCIf
	xbcnlqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrs-0000000F4ue-2tTU;
	Sat, 07 Nov 2026 17:06:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrm-0000000F4po-0RL6
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 17:06:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8280437C3;
	Sat,  7 Nov 2026 17:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0291F008A1;
	Sat,  7 Nov 2026 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794071169;
	bh=d+1eKfy6qMd6pKHF3ktaAO77sENSIIXeVFenlobzG6M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ngQ+0km01FtTsOLYUvJa12NnwczBsUZlZwfMOK1LO7ZjGX3viTT+tOfnQTLATB7E1
	 owqu52MjIgxs3+k6elYalG18nkLmMPCdesrcJY0/nQW68ByOvkxL2m8HBkWHalo4D7
	 pcg3SxlzqZsPsrC42L0qa/KT3xFT3xwvifrHbpalsTc/FXE+eOZEHbFuJVbcCWgDEl
	 WpvBRaLlhnOuX5v+kZMnVLMBIdx2pKGS5s3yfRDj2RtkHU/Xz3rnp98GiSVXam20uR
	 YGA1enYYfvvYAkSs+a5O1tCj/Em7goQqZAL7DbRvGhnebywiNk/q4KYE6htU1GKGsD
	 NaJ/1g8rtqQAQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Alex Elder <elder@riscstar.com>, 
 Encrow Thorne <encrow.thorne@linux.spacemit.com>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Bruno Banelli <bbanelli@gmail.com>, Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <20261106-spacemit-k1-pcie-fix-v2-1-6d74563b01d5@linux.spacemit.com>
References: <20261106-spacemit-k1-pcie-fix-v2-1-6d74563b01d5@linux.spacemit.com>
Subject: Re: [PATCH v2] PCI: spacemit: Ignore PERST# input in RC mode on K1
Message-Id: <179407116872.87432.14136333294569642589.b4-ty@b4>
Date: Sat, 07 Nov 2026 22:36:08 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ck9uIEZyaSwgMDYgTm92IDIwMjYgMTA6MTM6NTMgKzA4MDAsIEVuY3JvdyBUaG9ybmUgd3JvdGU6
Cj4gSW4gUkMgbW9kZSwgdGhlIEsxIFBFUlNUIyBwYWQgaW5wdXQgYWxzbyBhZmZlY3RzIHRoZSBs
b2NhbCBjb250cm9sbGVyLgo+IFdpdGhvdXQgUENJRV9JR05PUkVfUEVSU1ROIHNldCwgYXNzZXJ0
aW5nIFBFUlNUIyB0byByZXNldCB0aGUgZW5kcG9pbnQKPiBhbHNvIHJlc2V0cyB0aGUgUkMsIGxv
c2luZyBwcmV2aW91c2x5IHByb2dyYW1tZWQgcmVnaXN0ZXIgdmFsdWVzLAo+IGluY2x1ZGluZyB0
aGUgdmVuZG9yIGFuZCBkZXZpY2UgSURzLgo+IAo+IFNldCBQQ0lFX0lHTk9SRV9QRVJTVE4gZHVy
aW5nIFJDIGluaXRpYWxpemF0aW9uIHRvIHByZXZlbnQgdGhpcwo+IGZlZWRiYWNrLiBTZXQgaXQg
YmVmb3JlIHRoZSBmaXJzdCBEQkkgYWNjZXNzLCBzaW5jZSBQRVJTVCMgbWF5IGFscmVhZHkKPiBi
ZSBsb3cgd2hlbiBpbml0aWFsaXphdGlvbiBzdGFydHMsIGNhdXNpbmcgdGhlIGFjY2VzcyB0byBo
YW5nLgo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8xXSBQQ0k6IHNwYWNlbWl0OiBJ
Z25vcmUgUEVSU1QjIGlucHV0IGluIFJDIG1vZGUgb24gSzEKICAgICAgY29tbWl0OiBkNjA2YjBk
MTU2YzZlMzRkNzU0ZmFlMjBiMzFmNjlkNjYyZWIwNGU4CgpCZXN0IHJlZ2FyZHMsCi0tIArgrq7g
rqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
