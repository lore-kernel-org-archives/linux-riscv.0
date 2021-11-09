Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB8EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 10:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D072B6115B
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 10:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D072B6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSyMWrfdNiW+b+Q0wDy8zsMMiRP78a4pA6Ats36aqY4=; b=jME7Tsi0haoMTJ
	M8bCpVjwwY6oDhFGzLSoVfOdz5TE9EKw3/2TrZRHPDuUWiYwUCLy+CQJAcSgIDUl+hQ1ezb9R/Xyq
	KKe/+OWq3ckVSY6quWrrCVwTnnq9G/s53FkAD0qOb8LMfAUVkNbrYquXGOBsivy0ppr7lySDD9hMg
	bdpO5GIZU3Tq/smThQWTXV2Qui0AKrqulPme6imP4hf17NMPvQeRwKtSs3IwW8xMgMu9YJ0cTqgaZ
	mL4Ew4IWL9lspjiKn8hbhdM5YQlDF5A90kHEejxFK5SDUCQsF/CEmDBCxcOw3PKxAFBfute+KiekP
	eaauVQOb/cmyjkZS7wgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOSF-001YiE-1K; Tue, 09 Nov 2021 10:34:15 +0000
Received: from smtp1.tecnico.ulisboa.pt ([2001:690:2100:1::15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkORs-001YaK-LS
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 10:33:58 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4620F600542B;
 Tue,  9 Nov 2021 10:26:00 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id hnrB0xPeHVIE; Tue,  9 Nov 2021 10:25:57 +0000 (WET)
Received: from mail2.tecnico.ulisboa.pt (mail2.ist.utl.pt [193.136.128.12])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id AA6166005C39;
 Tue,  9 Nov 2021 10:25:57 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1636453557;
 bh=nwXJSM4wunq2bwnbpV9zr1hdbtnfGoDzz2gci2CRIiQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PlISkIPuhOWaNZ+2NY03eUlT41ab/DOTXb1/E/AUtjBV9wxqS3SlxHEFJxfEPSg68
 s8n9+UkF2CaWno9o25MhZtKjAyGO3Wix3vFFjqg6Xl4ryjZrWwyJy/BXRufGaAeE+c
 x6ECIwSYYKV+E7Uc9XcImVJtAfab8qV7c1eKroS0=
Received: from localhost.localdomain (unknown
 [IPv6:2001:8a0:fa2d:4500:215:5dff:fe40:101])
 (Authenticated sender: ist181713)
 by mail2.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 80CB456007A;
 Tue,  9 Nov 2021 10:25:57 +0000 (WET)
From: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?=
 <joao.mario@tecnico.ulisboa.pt>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: [PATCH 3/4] RISC-V: Added generic pmu-events mapfile
Date: Tue,  9 Nov 2021 10:25:54 +0000
Message-Id: <20211109102555.16381-4-joao.mario@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_023352_948524_F5C91C4A 
X-CRM114-Status: GOOD (  11.77  )
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

VGhlIHBtdS1ldmVudHMgbm93IHN1cHBvcnRzIGN1c3RvbSBldmVudHMgZm9yIFJJU0MtViwgcGx1
cyB0aGUgY3ljbGUsCnRpbWUgYW5kIGluc3RyZXQgZXZlbnRzIHdlcmUgZGVmaW5lZC4KClNpZ25l
ZC1vZmYtYnk6IEpvw6NvIE3DoXJpbyBEb21pbmdvcyA8am9hby5tYXJpb0B0ZWNuaWNvLnVsaXNi
b2EucHQ+Ci0tLQogdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3Yg
IHwgMTQgKysrKysrKysrKysrKwogLi4uL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5l
cmljLmpzb24gIHwgMjAgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNCBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2Fy
Y2gvcmlzY3YvbWFwZmlsZS5jc3YKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3BtdS1l
dmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24KCmRpZmYgLS1naXQgYS90b29scy9w
ZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdiBiL3Rvb2xzL3BlcmYvcG11LWV2
ZW50cy9hcmNoL3Jpc2N2L21hcGZpbGUuY3N2Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uNmExYWI0MjA5MzM0Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvcGVyZi9w
bXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YKQEAgLTAsMCArMSwxNCBAQAorIyBGb3Jt
YXQ6CisjCU1JRFIsVmVyc2lvbixKU09OL2ZpbGUvcGF0aG5hbWUsVHlwZQorIworIyB3aGVyZQor
IwlNSURSCVByb2Nlc3NvciB2ZXJzaW9uCisjCQlWYXJpYW50WzIzOjIwXSBhbmQgUmV2aXNpb24g
WzM6MF0gc2hvdWxkIGJlIHplcm8uCisjCVZlcnNpb24gY291bGQgYmUgdXNlZCB0byB0cmFjayB2
ZXJzaW9uIG9mIG9mIEpTT04gZmlsZQorIwkJYnV0IGN1cnJlbnRseSB1bnVzZWQuCisjCUpTT04v
ZmlsZS9wYXRobmFtZSBpcyB0aGUgcGF0aCB0byBKU09OIGZpbGUsIHJlbGF0aXZlCisjCQl0byB0
b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi8uCisjCVR5cGUgaXMgY29yZSwgdW5jb3Jl
IGV0YworIworIworI0ZhbWlseS1tb2RlbCxWZXJzaW9uLEZpbGVuYW1lLEV2ZW50VHlwZQpkaWZm
IC0tZ2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5q
c29uIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29u
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMDEzZTUwZWZhZDk5Ci0t
LSAvZGV2L251bGwKKysrIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3Yt
Z2VuZXJpYy5qc29uCkBAIC0wLDAgKzEsMjAgQEAKK1sKKyAgeworICAgICJQdWJsaWNEZXNjcmlw
dGlvbiI6ICJDUFUgQ3ljbGVzIiwKKyAgICAiRXZlbnRDb2RlIjogIjB4MDAiLAorICAgICJFdmVu
dE5hbWUiOiAicmlzY3ZfY3ljbGVzIiwKKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUgY3lj
bGVzIFJJU0MtViBnZW5lcmljIGNvdW50ZXIiCisgIH0sCisgIHsKKyAgICAiUHVibGljRGVzY3Jp
cHRpb24iOiAiQ1BVIFRpbWUiLAorICAgICAgIkV2ZW50Q29kZSI6ICIweDAxIiwKKyAgICAgICJF
dmVudE5hbWUiOiAicmlzY3ZfdGltZSIsCisgICAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUg
dGltZSBSSVNDLVYgZ2VuZXJpYyBjb3VudGVyIgorICB9LAorICB7CisgICAgIlB1YmxpY0Rlc2Ny
aXB0aW9uIjogIkNQVSBJbnN0cnVjdGlvbnMiLAorICAgICAgIkV2ZW50Q29kZSI6ICIweDAyIiwK
KyAgICAgICJFdmVudE5hbWUiOiAicmlzY3ZfaW5zdHJldCIsCisgICAgICAiQnJpZWZEZXNjcmlw
dGlvbiI6ICJDUFUgcmV0aXJlZCBpbnN0cnVjdGlvbnMgUklTQy1WIGdlbmVyaWMgY291bnRlciIK
KyAgfQorXQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKLS0gCjIuMTcuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
