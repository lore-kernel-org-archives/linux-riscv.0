Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C1FC00A5A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTvFOE1P4aX+OtPdIvgJrkwpvMsHWqHQPKaqdB+M9jA=; b=VJTJ76B4WIx6g7
	Ju5hh4j7+75RrmE/qYGksjCH8syITK8XIkdkRabLGrVESu6cj20SHbGVvs/P0fyO4asJh/h1a+cAn
	NQqWby1jKqbc6cDHe5i84qnDFJbvFpNMa4c13iTSeilAoYtm1c5Nj0bgtkVehb7JLMhP20UwW+zVO
	1uy2rMzfcS1RanshxVWyUgQXtWZJbUNc78yTRfOU/KvjJMkeDxBu2qE0UMTH4XFkIKLQMnHJX7VoR
	K8rby7S0Ablf/Frf4yYkM/f+pag5F9od26xygCPwjJfhziD3Iz5oY7FTNQGIhIvRWyh0qc+ZTV0Ax
	cQO/jLIA1FTTrD2cZ4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPfc-003wIE-6i; Thu, 19 Jan 2023 07:49:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPee-003vus-5v
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 07:48:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9265261BA6;
	Thu, 19 Jan 2023 07:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD978C433F0;
	Thu, 19 Jan 2023 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674114491;
	bh=x+6hysZetLjXNJoPmPem8KkgdCayvnvdD0vD47hnXTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OCKr7WQy84g91clObcCPN4ujLE8G6ryfwyrIb5kQIjfphSjUsiJwo8tCw/cjD6DMa
	 bVtPv9K1Gig0mN0oAsG2pyKregWutfWQ37Hx4kc3B95uR0V/nTMMJU6VkcnluddWi7
	 oXpAwRGF5pQnalavt9hFymGUXIwrnDHCdxCs1tYcuAZMLF98Mda1apRykl3jicBKA8
	 cerShorkhdTiuHpSQCh/dO/yDv2KjkxGcMUN0V4YKB6tqaB4Er3hd3Nl6a2rkdp44T
	 P6H6mED9rtxyyE9FBsrDmSpLN4hFGddeBxEKvwB0gn7ARk+aKnjWk1R9I4MrFwJz5S
	 wjIykZaESbsjg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] riscv: Add instruction dump to RISC-V splats
Date: Thu, 19 Jan 2023 08:47:37 +0100
Message-Id: <20230119074738.708301-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230119074738.708301-1-bjorn@kernel.org>
References: <20230119074738.708301-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_234812_408287_A96D2567 
X-CRM114-Status: GOOD (  15.68  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQWRkIGluc3RydWN0aW9u
IGR1bXAgKENvZGU6KSBvdXRwdXQgdG8gUklTQy1WIHNwbGF0cy4gRHVtcCAxNmIKcGFyY2Vscy4K
CkFuIGV4YW1wbGU6CiAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwCiAgT29wcyBbIzFdCiAg
TW9kdWxlcyBsaW5rZWQgaW46CiAgQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRh
aW50ZWQgNi4yLjAtcmMzLTAwMzAyLWc4NDBmZjQ0YzU3MWQtZGlydHkgIzI3CiAgSGFyZHdhcmUg
bmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQogIGVwYyA6IGtlcm5lbF9pbml0KzB4YzgvMHgx
MGUKICAgcmEgOiBrZXJuZWxfaW5pdCsweDcwLzB4MTBlCiAgZXBjIDogZmZmZmZmZmY4MGJkOWE0
MCByYSA6IGZmZmZmZmZmODBiZDk5ZTggc3AgOiBmZjIwMDAwMDAwNjBiZWMwCiAgIGdwIDogZmZm
ZmZmZmY4MTczMGIyOCB0cCA6IGZmNjAwMDAwN2ZmMDAwMDAgdDAgOiA3OTc0Njk3Mjc1NjM2NTcz
CiAgIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDMwMzAzMDMyNzAzOTNkNmUgczAgOiBmZjIw
MDAwMDAwNjBiZWUwCiAgIHMxIDogZmZmZmZmZmY4MTczMjAyOCBhMCA6IDAwMDAwMDAwMDAwMDAw
MDAgYTEgOiBmZjYwMDAwMDgwZGQxNzgwCiAgIGEyIDogMDAwMDAwMDAwMDAwMDAwMiBhMyA6IGZm
ZmZmZmZmODE3NmE0NzAgYTQgOiAwMDAwMDAwMDAwMDAwMDAwCiAgIGE1IDogMDAwMDAwMDAwMDAw
MDAwYSBhNiA6IDAwMDAwMDAwMDAwMDAwODEgYTcgOiBmZjYwMDAwMDgwZGQxNzgwCiAgIHMyIDog
MDAwMDAwMDAwMDAwMDAwMCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAw
MDAwCiAgIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiAw
MDAwMDAwMDAwMDAwMDAwCiAgIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAw
MDAwMDAgczEwOiAwMDAwMDAwMDAwMDAwMDAwCiAgIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6
IGZmZmZmZmZmODExODYwMTggdDQgOiAwMDAwMDAwMDAwMDAwMDIyCiAgIHQ1IDogMDAwMDAwMDAw
MDAwMDAzZCB0NiA6IDAwMDAwMDAwMDAwMDAwMDAKICBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAg
YmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgogIFs8ZmZm
ZmZmZmY4MDAwMzUyOD5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHgxNgogIENvZGU6IDg2MmEg
ZDE3OSA2MDhjIGE1MTcgMDA2OSAwNTEzIDJiZTUgZDBlZiBkYjJlIDQ3YTkgKGMxMWMpIGE1MTcK
ICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KICBLZXJuZWwgcGFuaWMgLSBu
b3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwYgog
IFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMKICAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBu
b3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwYiBd
LS0tCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0t
LQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKaW5kZXggNTQ5YmRlNWM5NzBhLi5mYmRjZGJjNzkyZDMgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAt
MjksNiArMjksMjcgQEAgaW50IHNob3dfdW5oYW5kbGVkX3NpZ25hbHMgPSAxOwogCiBzdGF0aWMg
REVGSU5FX1NQSU5MT0NLKGRpZV9sb2NrKTsKIAorc3RhdGljIHZvaWQgZHVtcF9rZXJuZWxfaW5z
dHIoY29uc3QgY2hhciAqbG9nbHZsLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwljaGFyIHN0
cltzaXplb2YoIjAwMDAgIikgKiAxMiArIDIgKyAxXSwgKnAgPSBzdHI7CisJY29uc3QgdTE2ICpp
bnNucyA9ICh1MTYgKilpbnN0cnVjdGlvbl9wb2ludGVyKHJlZ3MpOworCWxvbmcgYmFkOworCXUx
NiB2YWw7CisJaW50IGk7CisKKwlmb3IgKGkgPSAtMTA7IGkgPCAyOyBpKyspIHsKKwkJYmFkID0g
Z2V0X2tlcm5lbF9ub2ZhdWx0KHZhbCwgJmluc25zW2ldKTsKKwkJaWYgKCFiYWQpIHsKKwkJCXAg
Kz0gc3ByaW50ZihwLCBpID09IDAgPyAiKCUwNGh4KSAiIDogIiUwNGh4ICIsIHZhbCk7CisJCX0g
ZWxzZSB7CisJCQlwcmludGsoIiVzQ29kZTogVW5hYmxlIHRvIGFjY2VzcyBpbnN0cnVjdGlvbiBh
dCAweCVweC5cbiIsCisJCQkgICAgICAgbG9nbHZsLCAmaW5zbnNbaV0pOworCQkJcmV0dXJuOwor
CQl9CisJfQorCXByaW50aygiJXNDb2RlOiAlc1xuIiwgbG9nbHZsLCBzdHIpOworfQorCiB2b2lk
IGRpZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgY29uc3QgY2hhciAqc3RyKQogewogCXN0YXRpYyBp
bnQgZGllX2NvdW50ZXI7CkBAIC00Myw4ICs2NCwxMCBAQCB2b2lkIGRpZShzdHJ1Y3QgcHRfcmVn
cyAqcmVncywgY29uc3QgY2hhciAqc3RyKQogCiAJcHJfZW1lcmcoIiVzIFsjJWRdXG4iLCBzdHIs
ICsrZGllX2NvdW50ZXIpOwogCXByaW50X21vZHVsZXMoKTsKLQlpZiAocmVncykKKwlpZiAocmVn
cykgewogCQlzaG93X3JlZ3MocmVncyk7CisJCWR1bXBfa2VybmVsX2luc3RyKEtFUk5fRU1FUkcs
IHJlZ3MpOworCX0KIAogCWNhdXNlID0gcmVncyA/IHJlZ3MtPmNhdXNlIDogLTE7CiAJcmV0ID0g
bm90aWZ5X2RpZShESUVfT09QUywgc3RyLCByZWdzLCAwLCBjYXVzZSwgU0lHU0VHVik7Ci0tIAoy
LjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
