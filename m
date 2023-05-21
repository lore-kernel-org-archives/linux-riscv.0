Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057A4C87FE1
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C6Q3V+sEKUnpC0MwBOnfQUxdCNlwtTOI+lOQyycVB7w=; b=XDFPQF1dDGHvne
	ujY9/j5j8CnfbbG3YiDpbsU1g2ijY3+o2vpn2uIINFBaH3eEu6fkASJMp4l5sfEhZc9cAOboxrmqs
	K9Lme06Vxj82fkJxIJv7FWp30DTnXrs+mq8wZ8mvXPixeDn4hKD5g6+lJ+LSEgF4Sm5xL3ohWxRQ5
	30Jdyoi1UNWC8x6eyIJtatgAW+4//qg9UWQG1B+yIRnLTgU5o0Qj+yUHW9LIEPV4VC2+2Gw99qTVx
	S4/kXCcWSwy1bVV3fyNfvRKNxzIaR4rPdD+QZ7v3i/EYJrZ8ZJ29IR5reiMIbYB8vZeYFOx7dPurq
	skI1sAyJOl3T7sFlULDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0hX7-003nNS-1U;
	Sun, 21 May 2023 11:47:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0hX3-003nLZ-1Y
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 11:47:26 +0000
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q0hWu-0008T6-Os; Sun, 21 May 2023 13:47:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-kernel@vger.kernel.org,
	christoph.muellner@vrull.eu,
	David.Laight@ACULAB.COM,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
Date: Sun, 21 May 2023 13:47:13 +0200
Message-Id: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_044725_524098_AC1F624F 
X-CRM114-Status: GOOD (  11.62  )
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

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1PgoKWmF3cnMgWzBd
IHdhcyByYXRpZmllZCBpbiBub3ZlbWJlciAyMDIyIFsxXSwgc28gSSd2ZSByZXN1cnJlY3QgdGhl
IHBhdGNoCmFkZGluZyBaYXdycyBzdXBwb3J0IGZvciBzcGlubG9ja3MgYW5kIGFkYXB0ZWQgaXQg
dG8gcmVjZW50IGtlcm5lbApjaGFuZ2VzLgoKQWxzbyBpbmNvcnBvcmF0ZWQgYXJlIHRoZSBuaWNl
IGNvbW1lbnRzIERhdmlkIExhaWdodCBwcm92aWRlZCBvbiB2Mi4KCgpDaGFuZ2VzIHNpbmNlIHYy
OgotIFJlYmFzZSBvbiB0b3Agb2YgNi40LXJjMQotIEFkYXB0IHRvIGNoYW5nZWQgYWx0ZXJuYXRp
dmVzIEtjb25maWcgaGFuZGxpbmcKLSBBZGFwdCB0byBjaGFuZ2VkIGNwdWZlYXR1cmUgZXh0ZW5z
aW9uIGhhbmRsaW5nCi0gQWRkcmVzcyByZXZpZXcgY29tbWVudHMgZnJvbSBEYXZpZCBMYWlnaHQK
ICAtIGJldHRlciBoYW5kbGluZyBmb3IgMzIvNjRiaXQgY2FzZXMgKGxlc3MgaWZkZWZlcnkpCiAg
LSBsZXNzIG1hY3JvcyBjYWxsaW5nIG1hY3JvcwogIC0gZG9uJ3QgZHVwbGljYXRlIF9fc21wX2xv
YWRfcmVzZXJ2ZWRfcmVsYXhlZCBpbgogICAgX19zbXBfbG9hZF9yZXNlcnZlZF9hcXVpcmUKCkNo
YW5nZXMgc2luY2UgdjE6Ci0gRml4aW5nIHR5cGUgY2hlY2tpbmcgY29kZSBmb3IgMzIvNjQtYml0
IHZhbHVlcwotIEFkanVzdG1lbnRzIGFjY29yZGluZyB0byB0aGUgc3BlY2lmaWNhdGlvbiBjaGFu
Z2UKLSBBZGRpbmcgImRlcGVuZHMgb24gIVhJUF9LRVJORUwiIHRvIFJJU0NWX0lTQV9aQVdSUwoK
ClswXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtemF3cnMvYmxvYi9tYWluL3phd3Jz
LmFkb2MKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi16YXdycy9jb21taXQvOWZm
NTRmN2U3ZmNkOTVjZjFiMTExZDJlNTQyNzZmZjExODNiY2QzNwoKQ2hyaXN0b3BoIE3DvGxsbmVy
ICgxKToKICByaXNjdjogQWRkIFphd3JzIHN1cHBvcnQgZm9yIHNwaW5sb2NrcwoKSGVpa28gU3R1
ZWJuZXIgKDEpOgogIHJpc2N2OiBkb24ndCBpbmNsdWRlIGtlcm5lbC5oIGludG8gYWx0ZXJuYXRp
dmUuaAoKIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmggfCAgMSAtCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2JhcnJpZXIuaCAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmggfCAxNCArKysrKysKIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVs
L2NwdS5jICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyAgICAgICB8ICAxICsKIDcgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKLS0gCjIuMzkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
