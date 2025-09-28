Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38821CAC5B0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 02:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGFMNftJlyDUInKWHVuTacYTXecWjpVOY6NHJMbguvU=; b=a0+3VtF5WjtIXW
	C/wMxHip2KJBV0UIPJSQJisipX2k6clGgGRA1lhgAEwDa1rAqhNYp7DSBPMsxe2mofW6Wy4I5CeE+
	mot/fyOdO6WOQHK+9aXjw4ldr4fH3LM3RSpQHCCSlANszm8DeFC7+/j1ckgMJO/5K7OdicEVinUff
	VxZl7CPz+YFTRxkhFgH0ZxniUm274hXX3jEz5+ryidfcpsaR6vSfdKr7ZrNzoakLtPmEEN4ov1w/H
	DfQWkm2e4VvCmMt+DWZCnCuF9bLsb8YTxgY16pIxb+F4neVt5XEsKPySjoiosSfiXh/EWvDz7VZ3Q
	KPSF2W93IqFkycqR28Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gs4-0000000DHJF-2Lkf;
	Sun, 28 Sep 2025 02:10:40 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gs1-0000000DHGp-1oK0
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 02:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759025348;
	bh=r/UU5OjQlNOk+0xgcmwYt26dsbPN+MROc0DRiB48QgY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=VL0drR5+jAsP+/O5Q4IsDufaHhjYeQE0WVqymt6qLorw2NHW+iUlluDILqq4tcyWv
	 3qZdDTidT0lDpOXVus22POXbqofpp8Sn1R/ojJwRY4ONI9naNHICsAcynD9j4+mqcH
	 d6xjmoL75HYa+IZqqbA1tv7fOVsdQA4EtwvVSPb4=
X-QQ-mid: esmtpgz14t1759025340tfb5556f0
X-QQ-Originating-IP: OAcKHgODdTKKwX2NmUA8RS/mvctsKVecQ3y2vidb9Dk=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 10:08:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3441446003025408370
EX-QQ-RecipientCnt: 13
Date: Sun, 28 Sep 2025 10:08:58 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
Message-ID: <E15EF3B2FD46EFE7+aNiYuset7FKRo_4C@kernel.org>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
 <20250927220824.1267318-3-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250927220824.1267318-3-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MMnP0fEUKo/hsv56XtoweHVoiDlWlWwIc7F8yevwpLC1LIqZbeSwbKe/
	ut2cQn129vwhJXw73Y2k6B20CdaSrwVlAQri5Y0JjPKhZ6dJS/VdqtkX30/aGLHQ0QRotCY
	I3O182/z2Q9f6eaw4z1gKqNnIBamGEp4oVyowTbxFudlXNrWg3Kiz0kh7l4M90hujyt4JK9
	aO7wP4l+LIWlQTF+BzeWtIaMVqcwSLnWif9ZG59i8CaXWHt0Si9R+Ws74pwoh0o0nANiYim
	rlY0ncRwTDR4ubWI10kURGMQp3ThGxylQ28b7YF5FUpzBauAlDSsgnUyXijb+R2b8YLK6vq
	YO8bLiLOt3Z3R7Hf6gPV3kXh5fdSjiq4oY3AvDIM1jRAzinPbN5dj35yL4xmArq+xVJDYRV
	Ulgrpc9j5EIurKGpn9KOIfoDCoHVxh3kGqYbfikekrR4pw9xvnfGEh9S6zHW+9PGV/koDyw
	nAM2LERa2tlhAxjUCD3EZjAoGXCtBYkJ5uehddP+wWh9+RXmZD+5g3wZUBCQsyFJ/E3wD61
	xYnZ3XSEUPHmK9SBP4OrGjoXPMlH01iKn7Bo943rFLZwW++stXT7rqCX5nFK69PysC0mpB6
	nGcy4EwrZRHP88Jo6Oyxp4PjCWgRCAK3BnlDRb6DZc01CACClwlpst+laKy8ISSFWLygAMb
	P+CwzRmD0ATD+PoHyuOtz3dWvkpHDV5U6cM7Zgd7mmIfxUTw7G+P0ZLWsBzhef03Iso6PHf
	c6o2gEwBxeS/5kQH7A6/5JZpBGwWKk6GzmBctOWwJAvfM0SkaoOkR6Tp/Wb8IX1qv0obH9i
	u0/hzqLJkTUFKnWWRnVTaZrqeoAI8HmRfhkclMA/tsxe2BsbQAtFnvul9Gd8D/655AcpkFQ
	1rg9NMvQkuM2jTRXkdBHRqnSMPS2dMwK57Q1W9H7/iyHMb391gp7X66hN6MVzUfNz4qc2wN
	YeEkm4VfUqJl4cq3wWoGVw/Rmb58wMTuhUXfudbiqrweDOOHWPHEesFyJm2rAVscxLOVd9K
	W8EjrwvDMJEwP4w2pxFtiT8pT7juzswb45EYQCeNcBPgkYVrN8mnMxVrXo/R/JmLwKz2kId
	mY1zNx1JxoLbBqSUW8oDqM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_191038_323636_27B74527 
X-CRM114-Status: GOOD (  16.18  )
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

SGkgQXVyZWxpZW4sIFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFN1biwgU2VwIDI4LCAyMDI1
IGF0IDEyOjA3OjQxQU0gKzAyMDAsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+IEFkZCBhICJzcGFj
ZW1pdC1wMS1yZWJvb3QiIGNlbGwgZm9yIHRoZSBTcGFjZW1pVCBQMSBjaGlwLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KPiAtLS0KPiAg
ZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMu
YyBiL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMKPiBpbmRleCA2OTZiNjAyMDUxMjYwLi4y
ZTg2ZWZiMGM4MmI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMK
PiArKysgYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gQEAgLTk5LDYgKzk5LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHNwYWNlbWl0X3AxX3JlZ21hcF9jb25m
aWcgPSB7Cj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIHNwYWNlbWl0
X3AxX2NlbGxzW10gPSB7Cj4gKwl7IC5uYW1lID0gInNwYWNlbWl0LXAxLXJlYm9vdCIsIH0sCkni
gJltIG5vdCBzdXJlIGlmIHRoaXMgbmFtZSBpcyB0aGUgYmVzdCBmaXQgaGVyZS4KU2luY2UgdGhl
IGRyaXZlciBhbHNvIGltcGxlbWVudHMgcmVib290IGFuZCBwb3dlci1vZmYgZnVuY3Rpb25hbGl0
eSwKd291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGNhbGwgaXQgc3BhY2VtaXQtcDEtcG93ZXI/
CknigJlsbCBsZWF2ZSBpdCB1cCB0byB5b3UuCgpPdGhlcndpc2UsIExHVE0uCgpSZXZpZXdlZC1i
eTogVHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4gIAl7
IC5uYW1lID0gInNwYWNlbWl0LXAxLXJlZ3VsYXRvciIsIH0sCj4gIAl7IC5uYW1lID0gInNwYWNl
bWl0LXAxLXJ0YyIsIH0sCj4gIH07Cj4gLS0gCj4gMi40Ny4yCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
