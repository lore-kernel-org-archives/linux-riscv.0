Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEFBCAC597
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iAIcjHTnioQMVr8TpuGO5HKmB79iS0WB5vHizBJ5izM=; b=Rb1QLRNWg1mSqw
	7qG2KQhuWvQUaZKs76+fwjpzhIkk1ztpptawdkFBAdMexSncFeV7K1DfDX64kb8roEAaJALlfYLLr
	5++DeEgq5cAtiSlaISfH6h8Prp2C1mGuc4LxirRXenbwH0WPQcRNJZYgsaO5mMCCvUtmkS3wwFBuE
	waW3jQ7gZD2wanfD/jCHVdSrK5RTUbApjl26OwY6MXZDzhZgu9Jwl/Fzcv0KaLkn2Vt+p3Yb8csI/
	n+2eNmij1kj5vxdntKNWKaw1EwgVqaEXQLaKbrRnq5tjVEI2c6bD3/NKPc5kj7D5sPzwCGd6vLzgM
	s/5UEo14RI1mExJR9kKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqd5J-00000006hNI-1PLg;
	Tue, 17 Sep 2024 18:37:57 +0000
Received: from mail.clii.com.cn ([218.247.4.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqd5G-00000006hMU-3Yo9
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 18:37:56 +0000
Received: from cnlic.org.cn (unknown [156.0.213.15])
	by mail.clii.com.cn (Server) with ESMTPSA id 4X7Vql1Qqbz8Br6
	for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 02:36:50 +0800 (HKT)
From: Martina. M SCHULT <cace@cnlic.org.cn>
To: linux-riscv@lists.infradead.org
Subject: Guten Morgen
Date: 17 Sep 2024 19:36:49 +0100
Message-ID: <20240917193649.5E69146AE3B1AF40@cnlic.org.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_113755_064712_A5E57CBC 
X-CRM114-Status: UNSURE (  -0.69  )
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
Reply-To: m.martinasch@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

R3V0ZW4gTW9yZ2VuLAoKCgpNZWluIE5hbWUgaXN0IE1hcnRpbmEgTWFyaWFuYSBTQ0hVTFQsIGRl
dXRzY2hlciBIZXJrdW5mdC4gSWNoIApsZWlkZSBhbiBlaW5lciBzY2h3ZXJlbiBLcmFua2hlaXQs
IGRpZSBtaWNoIHp1bSBzaWNoZXJlbiBUb2QgCnZlcnVydGVpbHQ6IEhpcm50dW1vci4KCkljaCB2
ZXJmw7xnZSDDvGJlciBlaW5lbiBCZXRyYWcgdm9uIGRyZWl6ZWhuIE1pbGxpb25lbiAKYWNodGh1
bmRlcnRmw7xuZnppZ3RhdXNlbmQgRXVybyAoMTMuODUwLjAwMCBFdXJvKSwgZGVuIGljaCAKenV2
ZXJsw6Rzc2lnIHVuZCBlaHJsaWNoIGFuIGVpbmVuIERyaXR0ZW4gZsO8ciBkZW4gdm9yZ2VzZWhl
bmVuIApWZXJ3ZW5kdW5nc3p3ZWNrIHdlaXRlcmdlYmVuIG3DtmNodGUuIEljaCBoYWJlIGVpbiBV
bnRlcm5laG1lbiwgCmRhcyBhdXMgYW5kZXJlbiBMw6RuZGVybiBpbXBvcnRpZXJ0LiBJY2ggaGFi
ZSBtZWluZW4gTWFubiB1bmQgendlaSAKZW50esO8Y2tlbmRlIEtpbmRlciBiZWkgZWluZW0gdW5n
bMO8Y2tsaWNoZW4gQXV0b3VuZmFsbCB2ZXJsb3Jlbi4KCkljaCBtw7ZjaHRlIElobmVuIGRpZXNl
biBCZXRyYWcgYW5iaWV0ZW4sIHVtIElociBQcm9qZWt0IHp1IApmaW5hbnppZXJlbiB1bmQgZGll
IGFtIHN0w6Rya3N0ZW4gYmVuYWNodGVpbGlndGVuIE1lbnNjaGVuLCAKS3JlYnNiZWhhbmRsdW5n
c3plbnRyZW4gdW5kIGRpZSB3ZW5pZ2VyIFByaXZpbGVnaWVydGVuIHp1IAp1bnRlcnN0w7x0emVu
LCBkZW5uIG1laW5lIFRhZ2Ugc2luZCBnZXrDpGhsdC4KIAoKVmllbGVuIERhbmsgZsO8ciBJaHJl
IEFudHdvcnQsIGRhbWl0IGljaCBtZWluZW0gTm90YXIgbWVpbmUgV2FobCAKZGVzIEJlZ8O8bnN0
aWd0ZW4gbWl0dGVpbGVuIGthbm4uCiBCaXR0ZSBiZWFjaHRlbiBTaWUsIGRhc3MgU2llIGhpZXIg
ZWluZSBFLU1haWwgc2VuZGVuIGvDtm5uZW46IAptLm1hcnRpbmFzY2hAZ21haWwuY29tLAoKCklj
aCB3ZXJkZSBtZWluZW4gVmVybcO2Z2Vuc3ZlcndhbHRlciwgZGVuIE5vdGFyIFBpZXJyZS1MdWMg
Vk9HRUwsIArDvGJlciBtZWluZSBTcGVuZGVuZW50c2NoZWlkdW5nIGluZm9ybWllcmVuLgoKIAoK
QXVmcmljaHRpZy4KIApNYXJ0aW5hLiBNIFNDSFVMVAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
