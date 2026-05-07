Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2016CD343B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Sgv1hDL2TGg9V+8WWSdHHEVf+DeWBOUgLeGp4KXnhw=; b=QRsNif9XaFMuG9
	YXu4SoHsImligm8FSz7Vf2yehyPa1mwOnezsyE3l5NLcOM6d1NqNRbzAqsVnL3vKAdSB+aFx/Gxse
	qIn7lzwHKIFi2nr/Xf1ctJ+U4dflEYcMWLYMXPIpmvYj6Kv8eDjb/RfV5lMsOmzDHkfj4EdcW3vDb
	aLKFt7PZlTjKElxWNMVUpx8CzIlzdo93CrJT8aiBHkEAtiiMceLv54F/jm8P7eQSie1Cg1ngW75Gq
	xOAHVezribiD5j1lgBwh7KS/6ydKetzRSc7/l7/9w7XH1XyeH/JQW+ErJ+1gFWcum3Z3ua59J3yD9
	tPYrMmtDCKn/zDgwjoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtFF-000000032Zu-25Ro;
	Thu, 07 May 2026 07:34:05 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtFD-000000032Pp-3WCk
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 07:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778139203;
	bh=/z8CCUOGvHpoH70t6B2KPfC0Ot+ROjJINhi1y6OoEtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=mHW3m2xFnD4yJq4iGq2uvm+7qKA6RByUi07WaJyScVh+zMKU60zrjvz77U0avXbAz
	 GXP2dgzisy5ONOJpDVse4surR8a0mStPZo8MQ4DHkfrbmdVGGigS2hZfa/OpLxpp8n
	 XZ/IEhy5eNkkwbeHRctCnHs+uVmDs6djb2kvAtWY=
X-QQ-mid: zesmtpsz8t1778139194t8a4b4886
X-QQ-Originating-IP: fwNzxLjSkQR/NKe20e7jVejxzRqkcOcXghif0Al22BQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 15:33:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18142673450067718002
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] ASoC: spacemit: add K3 SoC support
Date: Thu, 07 May 2026 15:33:08 +0800
Message-Id: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNQQ6CMBBFr0JmbUk7Iogr72FYQBlkVArpAMEQ7
 i5gWL7k/fdnEPJMArdgBk8jC7duBTwFYOvcPUlxuTKgxlhHmKj3WTGKumBOaK46ieIYVrnzVPG
 0hx7Zn2UoXmT7bb0ZNUvf+u/+NJrNO6LpER2N0gorStOyMIZscf+wG6ZQutxSw31o2wayZVl+b
 Veg6rcAAAA=
X-Change-ID: 20260427-k3-i2s-52ae21807466
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778139191; l=1882;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=gaZkV3ycFARSrKwMTq79k40MPy9fuqRXNEp63djnpig=;
 b=RMN4TqCjAj/qHKBOyiM3CT2YI3t71uSVDl2c8KSTGZIcgTj7zJUVROQagnDLypbe485vsjhAQ
 u6pHPyo3UVdArpF+udPa+i/CTg7VDU53shKWgnjR3FVGa3JJ+xsX6eO
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mv9X8DgfILpCQX0R/ZKMYM6+C8N5p548Fr8LO16xFzx1INTEk0ex7IRf
	uI+WvY0QxsxBaEvax2aNpdnwJmSLZxu+TL4xtmMdLOVdNchzubM2AD2Iza9kBRNGPOYhWfF
	qJCBOTKL+DfDCxQOqiX2eQHytcizYFpW//pLdrIfkDiZVlA6qz9b7KyeNMCF3LcOowKQwSc
	ZtyioEr4VpMiPoaRvlSslryKfS34tnUsR+zdyNt+EURVi5OlStDiIKwXDAu1PUf/7640Y4/
	nnaWSShIm3evjs216e32w5zNeQQJZqvylxo7uO6sl+GhmRsfvZ6JG/Q/LT5F3XPZp5n8KBk
	su7YnpaBkqMkfvDKu9MQbA4x6i1hDQqp4TOSVajg6N3yhEehHEmgIWw0xicv1g03pQJJxPs
	dDxWVYZq+2zrsyG0XRDQIGaas+nYYgSSFKg6oMupFygSm6vuv+Yw0agpP6WF1JU/RQ9crML
	nOqIogQSe36HIjd4eJ7DT/JpfA73QsK6f7hiauze3hbVFPq3xJjrKBqC8PiOi0RPt10g7pR
	S9o7mnjrAuQl/gnl+vnbVVYKdSor49csDuzfRMtzPiY3/vL1NUxYKf0Oz1DRM8a1M6zI2p3
	4zJMNfjwK9zlwQKlly6e0cktBk93iu+aZnqraLF3O1tU0NO5tCuBX272Y6iXQj7vaZAPUD9
	fAcZCC+K8LbbLTxJaUhDcKhdX3fTcMAbBFDpL87OZJETLc/wypnZk8J4zNnstKLdce22Z54
	WiYgPwVMaC4omWwadfaMFmzh1fMiudOIQJ/FWOxmOYF/NKd+1FkPynOEfH1dIplt8Hd2qBp
	sy2JCj/Gr+XZFnSR8A5pkWQlXbzZJCxIwQ1fLFtfzzxDBqeFz7CZJSosu9Ijo9K9roAeubq
	nvmT28uIs5nh4RRZ5j7ZHjkjQ4FsTf2pI2uX4honvMnY9O2r5ERbamPrAkby2DZ0dSHlAJw
	eSXYva6sjEGmFuCIfhZx78Emm4zPfo/FcNwa7/4rb6Yyxc9tmcAkL2FZTGqnTjAT/M1JEzy
	LSdyzglxAi8kosq3liTcxpiHx4wSQQyoxPJyKAoH6uqRhRV7T+z4YvA4mk6Aoywwu5HTmN5
	hDBmeCONNqJnBIv+XE+bsHp+aNwGqyJiBXgmjniMdETIZJIBWAqM1Sk9WQQ7NurQV6eCUoV
	Vs34JWZxcdpyFyriul5lpR3a8fKIEh09lYkx
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_003404_743260_B13CE058 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgYWRkcyBLMyBTb0Mgc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWlUIEkyUyBjb250
cm9sbGVyIGRyaXZlci4KClBhdGNoIDEgYWRkcyB0aGUgZHQtYmluZGluZ3MgZm9yIHRoZSBzcGFj
ZW1pdCxrMy1pMnMgY29tcGF0aWJsZS4gVGhlIEszClNvQyB1c2VzIHRoZSBzYW1lIEkyUyBJUCBh
cyBLMSBidXQgcmVxdWlyZXMgYWRkaXRpb25hbCBjbG9ja3MKKHN5c2Nsa19kaXYsIGNfc3lzY2xr
LCBjX2JjbGspIHRoYXQgYXJlIHNoYXJlZCBhY3Jvc3MgbXVsdGlwbGUgSTJTCmNvbnRyb2xsZXJz
LgoKUGF0Y2ggMiBhZGRzIGRyaXZlciBzdXBwb3J0IGZvciBLMyBTb0Mgd2l0aCBhZGRpdGlvbmFs
IGNsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGlu
dXguc3BhY2VtaXQuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBEcm9wIGJ1ZyBmaXggcGF0Y2hl
cyAoMS0zLzcpIOKAlCBwYXRjaGVzIDItMyBhbHJlYWR5IG1lcmdlZCwgcGF0Y2ggMQogIHNwbGl0
IGludG8gYSBzdGFuZGFsb25lIHNlcmllcwotIERyb3AgZml4ZWQtc2FtcGxlLXJhdGUgcGF0Y2hl
cyAoNS02LzcpIOKAlCB3aWxsIGFkZHJlc3Mgc2hhcmVkIEJDTEsKICBjb25zdHJhaW50IGF0IHRo
ZSBBU29DIGNvcmUgbGV2ZWwgaW4gYSBzZXBhcmF0ZSBzZXJpZXMKLSB1cGRhdGUgY29tbWl0IG1z
ZyAoMS83KQotIEFkZCByb2IncyB0YWcKLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lk
LmxpbmsvMjAyNjA0MjktazMtaTJzLXYxLTAtMmZlOTlkYjExZWNiQGxpbnV4LnNwYWNlbWl0LmNv
bQoKVG86IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+ClRvOiBNYXJrIEJyb3du
IDxicm9vbmllQGtlcm5lbC5vcmc+ClRvOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpU
bzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgpUbzogQ29ub3IgRG9v
bGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgpUbzogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+
ClRvOiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KVG86
IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+ClRvOiBUYWthc2hpIEl3YWkgPHRpd2Fp
QHN1c2UuY29tPgpDYzogbGludXgtc291bmRAdmdlci5rZXJuZWwub3JnCkNjOiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzog
c3BhY2VtaXRAbGlzdHMubGludXguZGV2CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
CgotLS0KVHJveSBNaXRjaGVsbCAoMik6CiAgICAgIEFTb0M6IGR0LWJpbmRpbmdzOiBhZGQgU3Bh
Y2VtaVQgSzMgU29DIGNvbXBhdGlibGUKICAgICAgQVNvQzogc3BhY2VtaXQ6IGFkZCBLMyBTb0Mg
c3VwcG9ydCB3aXRoIGFkZGl0aW9uYWwgY2xvY2tzCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvc3BhY2VtaXQsazEtaTJzLnlhbWwgfCAzMSArKysrKysrKysrKysrKysrKy0tCiBzb3Vu
ZC9zb2Mvc3BhY2VtaXQvazFfaTJzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDM2ICsrKysr
KysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBmNThmMmUwMTM3YzIxMzJhMDhhMWFiNDI3MjBh
OTU0MGNmMDA5M2E4CmNoYW5nZS1pZDogMjAyNjA0MjctazMtaTJzLTUyYWUyMTgwNzQ2NgoKQmVz
dCByZWdhcmRzLAotLSAgClRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2Vt
aXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
