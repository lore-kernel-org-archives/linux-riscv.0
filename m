Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3B8C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 22:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPYAu2vaRgGNka+FMdett06El1uh2HVkQndoRmOiMYc=; b=EIdrU0+ImBKqRr
	jvb+YzMKWZfMqI9zNeCaDgz2KAXR/p8dIGNLB0YWeVZvDPoMK2bXyfl6MC7KPzc+W8eIcM6ILnuWX
	5zjJpg1g3MkUhBm0NtcM58ETByuXDB8BWt80FmNvJaIzcX1Eq3zz84keOk3RRUu47N6G/uLjECGL2
	DkHaZ82nwnMH5EjNfPanFLp7Ea4pc17WxX95HvIx/oiBPF08O+qEKdOYhYb60KD1IwRSE8H17tRJ4
	jKZto808Gx2EMPZQ98hnhKEAf6iRnoszkJ6XmBIkzvMdvCaUuR3wfXvf1BCfhkhoOU9RKE7BQyc8S
	QHUtgps//EIPu4r3RfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkWE-008QxZ-F1; Wed, 13 Jul 2022 22:07:42 +0000
Received: from relay-us1.mymailcheap.com ([51.81.35.219])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBeFa-0053B8-P4
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 15:26:08 +0000
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 1585D200E6
	for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 15:16:31 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 349BB267CE
	for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 15:16:08 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id A989D40003;
	Wed, 13 Jul 2022 17:15:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 0A57E2A37A;
	Wed, 13 Jul 2022 15:15:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKa0_JsYQgeN; Wed, 13 Jul 2022 15:15:46 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Wed, 13 Jul 2022 15:15:46 +0000 (UTC)
Received: from edelgard.icenowy.me (unknown [59.41.163.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 3F308401DE;
	Wed, 13 Jul 2022 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1657725346; bh=Y2nH9P4lQd9MCR3ibpoDErgHg30yJR8WsNyQiLQQcnI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LGXGcFvpUIwwuv5s0jAN4DZ2KHePtfeo5GrfVTdeVDaYABtdN/qhFsbi1gX4d6PbB
	 iJSdRlj+drTxKqkj0YuAOx6ri7fzGlH+jnT0WJ/1nT59SciFDNmfq4BzohFYx8RZEe
	 aOU+qtxheODRZVckakLifKIqw6LY33dVCKiZTSk0=
Message-ID: <2303fc91e5110f22fc9ea6008fa4bbc77c1bdb13.camel@aosc.io>
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: add the missing monitor
 core
From: Icenowy Zheng <icenowy@aosc.io>
To: Conor Dooley <mail@conchuod.ie>, Emil Renner Berthing <kernel@esmil.dk>,
  Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Conor Dooley
 <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 13 Jul 2022 23:15:02 +0800
In-Reply-To: <20220711184325.1367393-3-mail@conchuod.ie>
References: <20220711184325.1367393-1-mail@conchuod.ie>
	 <20220711184325.1367393-3-mail@conchuod.ie>
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_082607_013982_3A7D4A5C 
X-CRM114-Status: GOOD (  18.41  )
X-Mailman-Approved-At: Wed, 13 Jul 2022 15:07:37 -0700
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

5ZyoIDIwMjItMDctMTHmmJ/mnJ/kuIDnmoQgMTk6NDMgKzAxMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
IAo+IFRoZSBKSDcxMDAgaGFzIGEgMzIgYml0IG1vbml0b3IgY29yZSB0aGF0IGlzIG1pc3Npbmcg
ZnJvbSB0aGUgZGV2aWNlCj4gdHJlZS4gQWRkIGl0IChhbmQgaXRzIGNwdS1tYXAgZW50cnkpIHRv
IG1vcmUgYWNjdXJhdGVseSByZWZsZWN0IHRoZQo+IGFjdHVhbCB0b3BvbG9neSBvZiB0aGUgU29D
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gLS0tCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNp
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2po
NzEwMC5kdHNpCj4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNpCj4g
aW5kZXggYzYxN2E2MWUyNmUyLi45MmZjZTViNjZkM2QgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3RhcmZpdmUvamg3MTAwLmR0c2kKPiBAQCAtNjcsNiArNjcsMjMgQEAgY3B1MV9pbnRjOiBp
bnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4g
wqAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRTI0OiBjcHVAMiB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInNp
Zml2ZSxlMjQiLCAicmlzY3YiOwoKT2gsIGJ5IHRoZSB3YXkgInNpZml2ZSxlMjQiIGlzIG5vdCBh
IGRvY3VtZW50ZWQgY29tcGF0aWJsZSBpbiB0aGUgRFQKYmluZGluZy4KCklmIHlvdSByZWFsbHkg
d2FudCB0byBhZGQgaXQgaGVyZSwgeW91IG5lZWQgdG8gYWRkIHRoZSBjb21wYXRpYmxlCnN0cmlu
ZyB0byB0aGUgRFQgYmluZGluZyBmaXJzdC4KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8Mj47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZpY2VfdHlwZSA9ICJjcHUiOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS1jYWNoZS1ibG9jay1zaXplID0g
PDMyPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkt
Y2FjaGUtc2V0cyA9IDwyNTY+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaS1jYWNoZS1zaXplID0gPDE2Mzg0PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJpc2N2LGlzYSA9ICJydjMyaW1hZmMiOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0gImRp
c2FibGVkIjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBjcHUyX2ludGM6IGludGVycnVwdC1jb250cm9sbGVyIHsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxl
ID0gInJpc2N2LGNwdS1pbnRjIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAjaW50ZXJydXB0LWNlbGxzID0gPDE+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsK
PiArCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjcHUtbWFwIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbHVzdGVyMCB7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGNvcmUwIHsKPiBAQCAtNzYsNiArOTMsMTAgQEAgY29yZTAgewo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb3JlMSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjcHUgPSA8JlU3NF8xPjsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgY29yZTIgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjcHUgPSA8JkUyND47Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiDCoMKgwqDCoMKgwqDC
oMKgfTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
