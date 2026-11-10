Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40633606B51A
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GO448e8Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=DFsUbzxp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T2HWcyy2h55dgzhs/Ji9InTFLASA0kbqfKxjhHqIHK8=; b=GO448e8YmnQaEkJUTSIyZXO2Nb
	duY59J89/3eU4Miu84GOETF3AZAysmG1HobhDCOOsMa04I+Hku1KCeDizNJyPDEPr/hC3wnrpgTa3
	X/t0W6Bww55p1R+RI/DbLItRkQ/Zo95+c/Hw6BjHuO7H392lClbgnoPT9emXJ1C3MaDKLwtOcx4D6
	Mk++bunEnqGyGWAkhJcJPwxTuGeigH4d3y2Ilh8PLjJDLac+/9z55OopczeD69P3En3MACS9DXxcl
	7wHeCFSe67c5AQ/U41rg9axupB7ESlRBxrnXbpVIck644qaYT2MVS3O5SGDg19cK1eVN5gl1ENaR9
	u7J5T5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZh-000000030Z0-3I1D;
	Tue, 10 Nov 2026 07:47:25 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZd-000000030UN-2xKq
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:47:23 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 240EF20D4CAD;
	Tue, 10 Nov 2026 08:47:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 0151420DB5DB;
	Tue, 10 Nov 2026 08:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 0151420DB5DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794296840;
	bh=fNjwcRc0c7K0kuYsP00sMd8rDcxP9awGrVpi2PrAeZ8=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=DFsUbzxpxrZA/nv5eV6lqXYNzSYWT/6fvJ1DRQvL07nMNckxwsNyvD3jRPLClFCL5
	 LKx3YTToHkHBdyDjLTwtF5gb4AfleHGlbq+Otoh5NaLNyk5R6Vb948bpq2u25VQ8e6
	 QtjA1iAZqbSJyGwyPHpBzZESAZvO4nl8+YEYER5mpahFHWHio97im6yP4JCrQLXJSr
	 cfQGzurLptBRuCS3kprx++ppRmkUolZz52tDYzl/LDcnjmQzRPmDUrrm/Nyz/Fynzy
	 y+dXrQwZIjqVnR7cKGBjSbxNjUZEfMLPizSKCi6Ram+Bjt4MlDZu1SRs8Tzmu90wk5
	 cz7xI74oQOGIA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id WAM_3Wb2AiA5; Tue, 10 Nov 2026 08:47:19 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 04DD820D4CAD;
	Tue, 10 Nov 2026 08:47:18 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
Date: Tue, 10 Nov 2026 08:46:07 +0100
Message-ID: <20261110074607.363918-3-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110074607.363918-1-frederic.mahe@cirad.fr>
References: <20261110074607.363918-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234721_918531_FB7F6ABF 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEJQSS1GMyBoYXMgYW4gUlRMODg1MkJTIG1vZHVsZSB3aG9zZSBCbHVldG9vdGggcGFydCBp
cyBvbiBVQVJUMiwKd2l0aCBoYXJkd2FyZSBmbG93IGNvbnRyb2wuIEdQSU8gNjMgcG93ZXJzIEJs
dWV0b290aCBvbiBhbmQgR1BJTyA2NAppcyB0aGUgZGV2aWNlIHdha2UgbGluZS4KClRoZSBmaXJt
d2FyZSBjb25maWcgc3dpdGNoZXMgdGhlIFVBUlQgdG8gMS41IE1iYXVkLCBzbyB0YWtlIHRoZSBV
QVJUMgpjbG9jayBmcm9tIHRoZSA0OCBNSHogc2xvd191YXJ0MiBjbG9jay4KClRlc3RlZCB3aXRo
IGEgbGFwdG9wOiBzY2FuLCBwYWlyaW5nLCBhbmQgbDJwaW5nIGluIGJvdGggZGlyZWN0aW9ucywK
aW5jbHVkaW5nIGluY29taW5nIGNvbm5lY3Rpb25zIHdoaWxlIHRoZSBVQVJUIGlzIHJ1bnRpbWUg
c3VzcGVuZGVkLgpBbiA4LWhvdXIgc29hayAoYW4gSENJIGNvbW1hbmQgZXZlcnkgMjAgcykgc2hv
d2VkIG5vIGVycm9ycy4KClRoaXMgcGF0Y2ggd2FzIHByZXBhcmVkIHdpdGggdGhlIGhlbHAgb2Yg
YW4gQUkgYXNzaXN0YW50IChDbGF1ZGUpLAp3aGljaCBhbHNvIHJhbiB0aGUgdGVzdHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBGcsOpZMOpcmljIE1haMOpIDxmcmVkZXJpYy5tYWhlQGNpcmFkLmZyPgotLS0K
IGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIHwgMTUgKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKaW5kZXggNTgwMzVk
ODg2Li4yODBhZGM5ZGMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtYmFuYW5hcGktZjMuZHRzCisrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEt
YmFuYW5hcGktZjMuZHRzCkBAIC0zODMsNiArMzgzLDIxIEBAICZ1YXJ0MCB7CiAJc3RhdHVzID0g
Im9rYXkiOwogfTsKIAorJnVhcnQyIHsKKwlhc3NpZ25lZC1jbG9ja3MgPSA8JnN5c2Nvbl9hcGJj
IENMS19VQVJUMj47CisJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmc3lzY29uX21wbXUgQ0xL
X1NMT1dfVUFSVDI+OworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0g
PCZ1YXJ0Ml8wX2NmZz4sIDwmdWFydDJfMF9jdHNfcnRzX2NmZz47CisJdWFydC1oYXMtcnRzY3Rz
OworCXN0YXR1cyA9ICJva2F5IjsKKworCWJsdWV0b290aCB7CisJCWNvbXBhdGlibGUgPSAicmVh
bHRlayxydGw4ODUyYnMtYnQiLCAicmVhbHRlayxydGw4ODIyY3MtYnQiOworCQllbmFibGUtZ3Bp
b3MgPSA8JmdwaW8gSzFfR1BJTyg2MykgR1BJT19BQ1RJVkVfSElHSD47CisJCWRldmljZS13YWtl
LWdwaW9zID0gPCZncGlvIEsxX0dQSU8oNjQpIEdQSU9fQUNUSVZFX0hJR0g+OworCX07Cit9Owor
CiAmdXNicGh5MiB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKLS0gCjIuNDcuMwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
