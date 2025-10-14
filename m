Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25417CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7CUOMTM1v3pksNBAdH8qA4WFn4Sj4xpwRd47Y4a+/0=; b=O5xKnLVKaxLHRe
	BQZS2JBk1FZb/M42Y482CGi4YdKwhCIW2rg4YdVQGezxuu2rx1Y9IdSGd9TtjAXVWHgSpD5rPa5dg
	Ua+QnqS//LuYffeFAvnhrjnfTcFZ1ar54nDz2TO3BVgk6Ezhclhsa8dTdkmXxDYW3a6/FlFf9/awm
	OawqlmcOrN2/Ro3JMfqnIGBXx2t6EEyNgwhbBvbZgFua69JNfmHUCmgo+Xmn3tj/Yd6PSLpovaGyr
	C/PeQKqHbR4sju7CO0M626P6fftQhw8rZjGmWzcClQL5v1U3hsVTt9UAt86CzKOr+7AktYAOhYX5q
	8bIk0zAD03jUIuLPB3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej2-0000000GO61-07Cj;
	Tue, 14 Oct 2025 13:06:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eix-0000000GNyZ-0B3D
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:05:57 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmWsgXe/EUJlh3Oqic3jAEqEyRP4824MK4HzVDJVrYI=;
	b=L6TpQNh7Vb8hlDonYQwENXkD64j52H59yc/Kb8VjJ6hEGCsGrURA/TSoLYPqPKPy+v7+CF
	i5QpAoY/QaDuIQtziFgIqe3wuE7blMwjVWQ3xuxQYy9vzsoiT1LWrkdUbSOTZ8sR1FjDtZ
	fKLXrqO7/b4QvE/vyglIm6iTxIzdRvaA7+7nv32D75VtEcv9SS4GfR8Fw5lhnzsd8BRwuR
	7F87BGld5J/KWnpMWzEXYt03tOWSrAxX1xUG9y/pDcBeAlVS9SaqFzm53ra9MB+ObiCjID
	9AVH20CII2f5VWgO0tZAZwwbzbhuWa4CIEyVtaoyndKBAsU9wOXROlw3UyK1HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmWsgXe/EUJlh3Oqic3jAEqEyRP4824MK4HzVDJVrYI=;
	b=C8AAY+K/Vpov18nnCiOgJypH4XE/Z4j8vzRNImlx/xoZGX4JCR77rgTkUawUW8aIh3iarf
	XBuD81oOW8Hum1DA==
Date: Tue, 14 Oct 2025 15:05:16 +0200
Subject: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1486;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=IDhCA1BagrOzAKjk7RuNtb+m/Zg87sOWHgJNO4N/lzs=;
 b=2GBDxIG9QU3kONJteRcQFaut1ha2ZM7A46rDztSe+RBbZ/fhVoTctHwgcHlR3TApjkzsEu0sX
 faVc067JB5BDIb+TLHZhVg0TdYAJhlc1qUyldatX+RhG2bGSRhmA55P
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060555_220338_7805BC3E 
X-CRM114-Status: GOOD (  12.98  )
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

SXQgaXMgcG9zc2libGUgdGhhdCB0aGUga2VybmVsIHRvb2xjaGFpbiBnZW5lcmF0ZXMgd2Fybmlu
Z3Mgd2hlbiB1c2VkCnRvZ2V0aGVyIHdpdGggdGhlIHN5c3RlbSB0b29sY2hhaW4uIFRoaXMgaGFw
cGVucyBmb3IgZXhhbXBsZSB3aGVuIHRoZQpvbGRlciBrZXJuZWwgdG9vbGNoYWluIGRvZXMgbm90
IGhhbmRsZSBuZXcgdmVyc2lvbnMgb2Ygc2ZyYW1lIGRlYnVnCmluZm9ybWF0aW9uLiBXaGlsZSB0
aGVzZSB3YXJuaW5ncyB3aGVyZSBpZ25vcmVkIGR1cmluZyB0aGUgZXZhbHVhdGlvbgpvZiBDQ19D
QU5fTElOSywgdG9nZXRoZXIgd2l0aCBDT05GSUdfV0VSUk9SIHRoZSBhY3R1YWwgdXNlcnByb2cg
YnVpbGQKd2lsbCBsYXRlciBmYWlsLgoKRXhhbXBsZSB3YXJuaW5nOgoKLi4uL3g4Nl82NC1saW51
eC8xMy4yLjAvLi4vLi4vLi4vLi4veDg2XzY0LWxpbnV4L2Jpbi9sZDoKZXJyb3IgaW4gL2xpYi8u
Li9saWI2NC9jcnQxLm8oLnNmcmFtZSk7IG5vIC5zZnJhbWUgd2lsbCBiZSBjcmVhdGVkCmNvbGxl
Y3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwoKTWFrZSBzdXJlIHRoYXQgdGhl
IHZlcnkgc2ltcGxlIGV4YW1wbGUgcHJvZ3JhbSBkb2VzIG5vdCBnZW5lcmF0ZQp3YXJuaW5ncyBh
bHJlYWR5IHRvIGF2b2lkIGJyZWFraW5nIHRoZSB1c2VycHJvZyBjb21waWxhdGlvbnMuCgpGaXhl
czogZWM0YTM5OTJiYzBiICgia2J1aWxkOiByZXNwZWN0IENPTkZJR19XRVJST1IgZm9yIGxpbmtl
ciBhbmQgYXNzZW1ibGVyIikKRml4ZXM6IDNmMGZmNGNjNmZmYiAoImtidWlsZDogcmVzcGVjdCBD
T05GSUdfV0VSUk9SIGZvciB1c2VycHJvZ3MiKQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59z
Y2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBzY3JpcHRzL2NjLWNh
bi1saW5rLnNoIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jYy1jYW4tbGluay5zaCBiL3NjcmlwdHMvY2Mt
Y2FuLWxpbmsuc2gKaW5kZXggNmVmY2VhZDMxOTg5ODlkMmFiMmFiNjc3MmM3MmQ4YmI2MWM4OWM0
ZS4uZTY3ZmQ4ZDdiNjg0MWU1MzM0MTA0NWIyOGRjNTE5NmNjMTMyN2NiZSAxMDA3NTUKLS0tIGEv
c2NyaXB0cy9jYy1jYW4tbGluay5zaAorKysgYi9zY3JpcHRzL2NjLWNhbi1saW5rLnNoCkBAIC0x
LDcgKzEsNyBAQAogIyEvYmluL3NoCiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
CiAKLWNhdCA8PCAiRU5EIiB8ICRAIC14IGMgLSAtbyAvZGV2L251bGwgPi9kZXYvbnVsbCAyPiYx
CitjYXQgPDwgIkVORCIgfCAkQCAtV2Vycm9yIC1XbCwtLWZhdGFsLXdhcm5pbmdzIC14IGMgLSAt
byAvZGV2L251bGwgPi9kZXYvbnVsbCAyPiYxCiAjaW5jbHVkZSA8c3RkaW8uaD4KIGludCBtYWlu
KHZvaWQpCiB7CgotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
