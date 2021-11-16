Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF6AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499696120F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 499696120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ab6JxG6emugqWLPKAZdabzJVJVSCnmpAf4zZD8pnlNE=; b=P8A7RSbXGFNz9Q
	LlaPyWypBLARqT4gnLgYm6utkIPb6cN5WLwbhc+4Okk8407uLYy7t/VkjlhqtY+KPOCQ67KIyyBhS
	Ye7F5V/P5eiDI3MuxQz9fUMRwikjZBIRNkvauByRWOt//37nt1uL6JA1BACQIvz6GZG9LNcEIuMDH
	ENPJJA9sYLKw2zbc+7nSUPQOwaLdj9A9wriu1RlwjoBRVff1+V8Wt00sDn30VH+669nDdpO0d2Dle
	ZetIjQjYGhn5/qfBqjDr6bYaGgsFqXn7MuQX2PCmBrpurLtPsf1HLnjXJRURSiQ1hA8BOzBvWiczc
	Uabf8/ZNjKASk69Oi6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn0hL-002Bie-FF; Tue, 16 Nov 2021 15:48:39 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn0hI-002Bep-2Q
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:48:38 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 34D246005C3A;
 Tue, 16 Nov 2021 15:48:18 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id 3KL_Xti7Zb0u; Tue, 16 Nov 2021 15:48:14 +0000 (WET)
Received: from mail2.tecnico.ulisboa.pt (mail2.ist.utl.pt
 [IPv6:2001:690:2100:1::4750:b5b4])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D36C46005C3B;
 Tue, 16 Nov 2021 15:48:14 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1637077694;
 bh=BUt3n9BzCCHEiumrAk8fSOpSQV2oFo7rA8gPyndev38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Bje/1opA/pF4ldNH2tj9MF03Z7GeE5qonlXy2bc7yXhiWPzAbC5mq03GpXswRRyQy
 Gck65ulrPRRzxU4h1om+Xbihir7l7yTIPtWLuEV8YnclStRLj5nWHVwzM727forFkw
 WBy7Js08Ga0vSuUPoD1pDkAqMFq2Lf+dH5s2oCts=
Received: from joaomariovmubuntu.Home (unknown
 [IPv6:2001:8a0:fa2d:4500:215:5dff:fe40:101])
 (Authenticated sender: ist181713)
 by mail2.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A60F856007F;
 Tue, 16 Nov 2021 15:48:14 +0000 (WET)
From: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?=
 <joao.mario@tecnico.ulisboa.pt>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org,
 nikita.shubin@maquefel.me, joao.mario@tecnico.ulisboa.pt
Subject: [PATCH v2 3/4] RISC-V: Added generic pmu-events mapfile
Date: Tue, 16 Nov 2021 15:48:11 +0000
Message-Id: <20211116154812.17008-4-joao.mario@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_074836_457203_C0C0D322 
X-CRM114-Status: GOOD (  11.11  )
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
MDAwMDAwMDAwMC4uNGYyYWExOTlkOWNiCi0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvcGVyZi9w
bXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YKQEAgLTAsMCArMSwxNCBAQAorIyBGb3Jt
YXQ6CisjCU1JRFIsVmVyc2lvbixKU09OL2ZpbGUvcGF0aG5hbWUsVHlwZQorIworIyB3aGVyZQor
IwlNSURSCVByb2Nlc3NvciB2ZXJzaW9uCisjCQlWYXJpYW50WzIzOjIwXSBhbmQgUmV2aXNpb24g
WzM6MF0gc2hvdWxkIGJlIHplcm8uCisjCVZlcnNpb24gY291bGQgYmUgdXNlZCB0byB0cmFjayB2
ZXJzaW9uIG9mIEpTT04gZmlsZQorIwkJYnV0IGN1cnJlbnRseSB1bnVzZWQuCisjCUpTT04vZmls
ZS9wYXRobmFtZSBpcyB0aGUgcGF0aCB0byBKU09OIGZpbGUsIHJlbGF0aXZlCisjCQl0byB0b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi8uCisjCVR5cGUgaXMgY29yZSwgdW5jb3JlIGV0
YworIworIworI0ZhbWlseS1tb2RlbCxWZXJzaW9uLEZpbGVuYW1lLEV2ZW50VHlwZQpkaWZmIC0t
Z2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29u
IGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMDEzZTUwZWZhZDk5Ci0tLSAv
ZGV2L251bGwKKysrIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2Vu
ZXJpYy5qc29uCkBAIC0wLDAgKzEsMjAgQEAKK1sKKyAgeworICAgICJQdWJsaWNEZXNjcmlwdGlv
biI6ICJDUFUgQ3ljbGVzIiwKKyAgICAiRXZlbnRDb2RlIjogIjB4MDAiLAorICAgICJFdmVudE5h
bWUiOiAicmlzY3ZfY3ljbGVzIiwKKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUgY3ljbGVz
IFJJU0MtViBnZW5lcmljIGNvdW50ZXIiCisgIH0sCisgIHsKKyAgICAiUHVibGljRGVzY3JpcHRp
b24iOiAiQ1BVIFRpbWUiLAorICAgICAgIkV2ZW50Q29kZSI6ICIweDAxIiwKKyAgICAgICJFdmVu
dE5hbWUiOiAicmlzY3ZfdGltZSIsCisgICAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUgdGlt
ZSBSSVNDLVYgZ2VuZXJpYyBjb3VudGVyIgorICB9LAorICB7CisgICAgIlB1YmxpY0Rlc2NyaXB0
aW9uIjogIkNQVSBJbnN0cnVjdGlvbnMiLAorICAgICAgIkV2ZW50Q29kZSI6ICIweDAyIiwKKyAg
ICAgICJFdmVudE5hbWUiOiAicmlzY3ZfaW5zdHJldCIsCisgICAgICAiQnJpZWZEZXNjcmlwdGlv
biI6ICJDUFUgcmV0aXJlZCBpbnN0cnVjdGlvbnMgUklTQy1WIGdlbmVyaWMgY291bnRlciIKKyAg
fQorXQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
