Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F88EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vqd79mR9zZYHu6evcOCVzeM5HVM1EmOWHZFjJDN3Rw0=; b=YD4yEGj80eDOMC
	c6tW+3ZgmTtUoOlGf1dZG0Hs4buc+uPMi3Zq9IwhsoRgdA3YBB2K1EntXSA42WN/xuJYs6+mGbHQu
	YkqCrwzXgZpm7fNSJ6RXAQMCAmRWjGqOijzE5o4wSod2WpKrm8nYgU/TalFnOhAilLhYDTztzkyqt
	pto7ZNvNOyB15bVscE0oPuhe74dQn5K5Wrr8OhVVSIGbO1MS+JwXFTxTbg7PRk2x/40keKyptn4Jx
	JCBY7usSZkode1FLDouTFy61O4YGRjSvOKZV9WnXRc7vlNNR0lIXYkAKOkiz87JiPtWXyF3snKV/2
	AxRUrnVrcITTCNA29qRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFar-001iDU-0H;
	Fri, 16 Jun 2023 19:58:49 +0000
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFam-001iB7-1u
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 19:58:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 0724612488
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 22:58:33 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id d_ORI9ILU2W9 for <linux-riscv@lists.infradead.org>;
	Fri, 16 Jun 2023 22:58:32 +0300 (EEST)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net [83.102.40.55])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id C1CF011EE0
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 22:58:32 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by luumupuu2.dnainternet.net (Postfix) with ESMTPS id A90DA2C61
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 22:58:31 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
Date: Fri, 16 Jun 2023 22:58:31 +0300
Message-ID: <7600111.eesqGedGrq@basile.remlab.net>
Organization: Remlab
In-Reply-To: <mhng-10fcb0a9-cf4a-4416-ae30-120838a45bdb@palmer-ri-x1c9a>
References: <mhng-10fcb0a9-cf4a-4416-ae30-120838a45bdb@palmer-ri-x1c9a>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_125844_810544_B42A2BDD 
X-CRM114-Status: UNSURE (   9.58  )
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

TGUgdG9yc3RhaW5hIDE1LiBrZXPDpGt1dXRhIDIwMjMsIDIzLjMzLjQ0IEVFU1QgUGFsbWVyIERh
YmJlbHQgYSDDqWNyaXQgOgo+ID4gVGhlIGtlcm5lbCBjYW5ub3Qgc2ltcGx5IGNsb2JiZXIgcmVn
aXN0ZXJzLCBhcyB0aGF0IHdvdWxkIGxpa2VseSBjYXVzZQo+ID4gZGF0YSBsZWFrYWdlIGZyb20g
a2VybmVsIHRvIHVzZXIgbW9kZS4gU28gaXQgaXMgdW5jbGVhciB3aGF0IHRoZSBiZW5lZml0cwo+
ID4gd291bGQgYmUKPiBXaGF0J3MgdGhlIGRhdGEgbGVha2FnZT8KClR5cGljYWxseSAiY2xvYmJl
cmluZyIgdGhlIHJlZ2lzdGVyIG1lYW5zIHRoYXQgeW91IGFyZSB3cml0aW5nIHNvbWV0aGluZyBl
bHNlIAppbiB0aGVtLiBJZiB5b3UgZG9uJ3QgcmVzdG9yZSB0aGVtIChvciBleHByZXNzbHkgcmVz
ZXQgdGhlbSB0byB6ZXJvIG9yIHNvbWUgCm90aGVyIGZpeGVkIHZhbHVlKSwgdGhlbiB5b3UgbGVh
ayBkYWF0YS4KCk9mIGNvdXJzZSwgaWYgeW91IGRvbid0IGFjdHVhbGx5IHVzZSB0aGUgcmVnaXN0
ZXIsIHRoZW4geW91IGRvbid0IGxlYWsgCmFueXRoaW5nIGluIHRoZW0uIEJ1dCB0aGVuIGl0J3Mg
dW5jbGVhciB3aGF0IHRoZSBiZW5lZml0IG9mIG1hcmtpbmcgdGhlbSBhcyAKY2xvYmJlcmVkIGlz
LgoKKC4uLikKPiBJdCdkIGhhdmUgdG8gYmUgYSBwcmV0dHkgc3BlY2lhbCBjYXNlOiBhdCBsZWFz
dCBpbiBsaWJzdGRjKysgYW5kIGdsaWJjCj4gdGhlIGZ1dGV4IGNhbGxzIGFyZSBiZWhpbmQgZnVu
Y3Rpb24gY2FsbHMsCgpUcmFkaXRpb25hbGx5LCBhdG9taWMgdmFyaWFibGUgbWV0aG9kcyBhcmUg
aW50cmluc2ljcywgd2hpY2ggcmVzdWx0IGluIGVpdGhlciAKaW5saW5lIG9yIG91dGxpbmUgQyBy
dW50aW1lIGNhbGxzICh3aXRoIHNvbWUgYWQtaG9jIEFCSSB0aGF0IGNsb2JiZXJzIHZlcnkgCmxp
dHRsZSkuIFRoZXkgY2Fubm90IGJlIEMgZnVuY3Rpb25zLCBzaW5jZSB0aGV5IGFjY2VwdCBwYXJh
bWV0ZXJzIG9mIHNldmVyYWwgCmRpZmZlcmVudCB0eXBlcy4KCmF0b21pY19ub3RpZnlfb25lLCBh
dG9taWNfbm90aWZ5X2FsbCwgYW5kIGF0b21pY193YWl0IG9yIGhvd2V2ZXIgdGhlaXIgCnN0YW5k
YXJkaXNlZCBuYW1lcyBlbmQgdXAsIHdpbGwgcHJlc3VtYWJseSBiZSBvdXRsaW5lcyBvZiB0aGUg
bGF0ZXIgdHlwZSwgdGhhdCAKanVzdCBoYXBwZW4gdG8gd3JhcCBmdXRleCgpIG9uIExpbnV4LgoK
QnV0IGFueXdheSwgaWYgdGhlIHNwZWMgc2F5cyB0aGF0IHJlZ2lzdGVycyBhcmUgY2xvYmJlcmVk
IGJ5IHN5c3RlbSBjYWxscyBhcyAKQmrDtnJuIHBvaW50ZWQgb3V0LCB0aGVuIHRoYXQncyB0aGF0
LgoKLS0gClLDqW1pIERlbmlzLUNvdXJtb250Cmh0dHA6Ly93d3cucmVtbGFiLm5ldC8KCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
