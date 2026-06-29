Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001AEC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 11:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/Ix+K4pPUcTja+vD+z/y3ceoOIlTwO2o6dFZ1EJu+4=; b=ijFbtcmaKD0NmP
	mIy3nZoDiDTBOcA/8IWff57L6ncxUK5HEN7YmMHomhBpYg2La4yQN6Z873CAsr667ldEO0rJM93uC
	ahLzRjeJKikHxafirjcnO33UdnsbWKPYMEfeBa+l4cCUtd5qgNDfoNhCnaatj0j+cX3laUA5X3Gyj
	7HWm+o4iRYuhtjOIJUoFwtA/leDvf3soElHBzUy6lreZUty3AYMlEDSE1lOkHiWzOUXoKR9int+Lw
	5PBIH7HSI0lV1svpFkJGtRnVyPXXWE6y+OWN4JlFplXrnq7iBdT+bJKtN98X9ETxgcTcRyzzLtk03
	45xycT96s6Q5XQedF4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9vA-0000000EOce-2ny7;
	Mon, 29 Jun 2026 11:13:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9v9-0000000EOcP-2MSw;
	Mon, 29 Jun 2026 11:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98BA560008;
	Mon, 29 Jun 2026 11:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6531F000E9;
	Mon, 29 Jun 2026 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731578;
	bh=II6UFmS/kZBk86eBwc2++62peQEiQa8YkmG82Y63ygs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YK/8dN9y+lJGv9+y5AfOEXUWUafvy1CPBci2prcfSZcbGSx74/vxgjKXHzh0yAKAC
	 IsglvZmbRrH0SJZP3vnZhOLO7RWJodTrVLSxrjAIKABiCyhsXkJYXISx2AWi06IOp+
	 lX/xmQ7cD8V/jt2TwgiUDh4acL+V6RzIXPVjWL/cEyGQ4wvlytEGsoX1TyYwfcEomn
	 gzRoy6aMtwF2Ll6fK65lAMkBPWCWUjX5Vr5Y2LWTIyXi80CVFk1XelkiBj+9pORW3d
	 8ZCvAX8eStZA491T1hS5wuIwVZ2r1b/Oqc7cS1ox/xBR6ZLo/BILF6SRX/3SRCfuUs
	 eMjJTWNR2oB3A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: Tao Liu <ltao@redhat.com>,  kexec@lists.infradead.org,  pjw@kernel.org,
	palmer@dabbelt.com,  aou@eecs.berkeley.edu,  alex@ghiti.fr,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>, linux-integrity@vger.kernel.org,
	linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in
 machine_kexec_prepare
In-Reply-To: <CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com>
	(Baoquan He's message of "Fri, 26 Jun 2026 16:04:37 +0800")
References: <20260529032739.13264-2-ltao@redhat.com>
	<CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
	<CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com>
Date: Mon, 29 Jun 2026 13:12:54 +0200
Message-ID: <2vxzh5mlk3bd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

K0NjIElNQSBtYWludGFpbmVycwoKT24gRnJpLCBKdW4gMjYgMjAyNiwgQmFvcXVhbiBIZSB3cm90
ZToKCj4gQWRkIGtleGVjIE1MIHRvIENDLgo+Cj4gT24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNzo0
NuKAr0FNIFRhbyBMaXUgPGx0YW9AcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Cj4+IEtpbmRseSBwaW5n
LCBhbnkgY29tbWVudHM/Cj4+Cj4+IFRoYW5rcywKPj4gVGFvIExpdQo+Pgo+PiBPbiBGcmksIE1h
eSAyOSwgMjAyNiBhdCAzOjM14oCvUE0gVGFvIExpdSA8bHRhb0ByZWRoYXQuY29tPiB3cm90ZToK
Pj4gPgo+PiA+IEEgTlVMTCBwb2ludGVyIHJlZmVyZW5jZSBpc3N1ZSBpcyBub3RpY2VkIGluIHJp
c2N2J3MgbWFjaGluZV9rZXhlY19wcmVwYXJlLAo+PiA+IHdoZXJlIGltYWdlLT5zZWdtZW50W2ld
LmJ1ZiBtaWdodCBiZSBOVUxMIGFuZCBjb3BpZWQgdW5jaGVja2VkLgo+PiA+Cj4+ID4gVGhlIE5V
TEwgYnVmIGNvbWVzIGZyb20gc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9pbWFfa2V4ZWMuYzoKPj4g
PiBpbWFfYWRkX2tleGVjX2J1ZmZlcigpLCB3aGVyZSBrYnVmIGlzIGFkZGVkIGJ5IGtleGVjX2Fk
ZF9idWZmZXIoKSwKPj4gPiBidXQga2J1Zi5idWZmZXIgaXMgTlVMTC4KPj4gPgo+PiA+IEZpeCB0
aGlzIGJ5IHNpbXBseSBhZGRpbmcgYSBjaGVjayBiZWZvcmUgY29weS4KPj4gPgo+PiA+IFNpZ25l
ZC1vZmYtYnk6IFRhbyBMaXUgPGx0YW9AcmVkaGF0LmNvbT4KPj4gPiAtLS0KPj4gPiAgYXJjaC9y
aXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlYy5jIHwgMyArKysKPj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L21hY2hpbmVfa2V4ZWMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+PiA+
IGluZGV4IDIzMDZjZTNlNWYyMi4uZDgxZDU3NmY5Y2I1IDEwMDY0NAo+PiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L21hY2hpbmVfa2V4ZWMuYwo+PiA+IEBAIC00MSw2ICs0MSw5IEBAIG1hY2hpbmVfa2V4ZWNfcHJl
cGFyZShzdHJ1Y3Qga2ltYWdlICppbWFnZSkKPj4gPiAgICAgICAgICAgICAgICAgaWYgKGltYWdl
LT5zZWdtZW50W2ldLm1lbXN6IDw9IHNpemVvZihmZHQpKQo+PiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+PiA+Cj4+ID4gKyAgICAgICAgICAgICAgIGlmIChpbWFnZS0+c2Vn
bWVudFtpXS5idWYgPT0gTlVMTCkKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPj4gPiArCj4KPiBUaGlzIGlzIGEgZ29vZCBmaXgsIG1heWJlIHdlIGNhbiBhZGQgY29kZSBj
b21tZW50cyB0byBleHBsYWluIGl0IGFzCj4gYmVsb3csIGp1c3QgZm9yIHJlZmVyZW5jZS4KPgo+
ICAgICAgICAgICAgICAgIC8qCj4gICAgICAgICAgICAgICAgICogU29tZSBzZWdtZW50cyAoZS5n
LiBJTUEpIHJlc2VydmUgc3BhY2UgYnV0IGhhdmUgbm8gYnVmZmVyCj4gICAgICAgICAgICAgICAg
ICogbG9hZGVkIHlldC4gU2tpcCB0aGVtIGFzIHRoZXkgY2Fubm90IGNvbnRhaW4gYW4gRkRULgo+
ICAgICAgICAgICAgICAgICAqLwo+IEFuZCBpcyB0aGVyZSBhbnkgb3RoZXIgcGxhY2Ugd2hlcmUg
dGhlIHNpbWlsYXIgaXNzdWUgZXhpc3RzPyBlLmcgb24gTG9vbmdBcmNoPwo+Cj4gT3RoZXIgdGhh
biBhYm92ZSBjb25jZXJucywgdGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lOgo+Cj4gQWNrZWQt
Ynk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgoKWWVhaCwgdGhlIHBhdGNoIExHVE0gdG8g
bWUgdG9vLgoKQWNrZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgoK
QWx0aG91Z2ggSSB0aGluayBJTUEgY2FuIG1ha2UgdGhpcyBhIGJpdCBlYXNpZXIgdG8gdW5kZXJz
dGFuZC4gRmlyc3QsIGluCmltYV9hZGRfa2V4ZWNfYnVmZmVyKCkgaXQgc2hvdWxkIHNldCBrYnVm
LmJ1ZmZlciB0byBOVUxMIGFuZCBrYnVmLmJ1ZnN6CnRvIDAgZXhwbGljaXRseSBpbnN0ZWFkIG9m
IHVzaW5nIGtleGVjX2J1ZmZlciBhbmQga2V4ZWNfYnVmZmVyX3NpemUKd2hpY2ggYXJlIGluaXRp
YWxpemVkIHRvIE5VTEwgYW5kIDAsIGJ1dCBuZXZlciB1cGRhdGVkLiBVc2luZyB0aGUKdmFyaWFi
bGVzIGhlcmUgYWRkcyBhbiBleHRyYSBsZXZlbCBvZiBpbmRpcmVjdGlvbi4KCkFsc28sIHBlcmhh
cHMgd2Ugc2hvdWxkIGFkZCBhIGNvbW1lbnQgaW4gaW1hX2FkZF9rZXhlY19idWZmZXIoKSBhYm91
dApob3cgdGhpcyBhbGwgd29ya3MsIHNpbmNlIHdoZXJlIHRoZSBJTUEgYnVmZmVyIGxpdmVzIGFu
ZCB3aGVyZSBpdCBnZXRzCnVwZGF0ZWQgaXQgZmFpcmx5IGNvbXBsaWNhdGVkIGFuZCB0b29rIG1l
IHNvbWUgdGltZSB0byBwaWVjZSB0b2dldGhlci4KCi0tIApSZWdhcmRzLApQcmF0eXVzaCBZYWRh
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
