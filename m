Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8068D78333
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 17:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFeoWscFseV136CLrnUAPbIAAmO+hQpGD7KkoacrtK0=; b=ETfCDZ3zurSrGg
	6zRyP1RH3mA6rKpP35jBo4x76rGK4En3Wc9z57yOtXDg2pM79m6TOJoCQ4lliuURdn3HeSFyOkOkd
	3sgQfW7O6+yWczh/+rBk/oCjSwXiAeIxptrnwS/calG/b8pfV9JKO68CIhm81DGbZ4YkTgPBzCFdo
	vapu3qrYFPs9knh6pVy7vJEfDu0Y3LDcKsL+9Y4IZhENb1BBIYeLog/djfmMog0NUS6TMEGuNBLNM
	YviYw2tIs3YRzfnKhe+Gz9Af/Cax9uTZn2w2uwage3x+be5UzvlD8Tzvc3mPGkiRzQ/Ndiwz76eAf
	WetAgIcRL/4UzIDjWyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9vK-00000006yRQ-2ssj;
	Mon, 02 Dec 2024 17:09:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9vJ-00000006yRD-1VB7
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cpKdHiiuzM8ZH8CD9dHmnmIUvqiQGdzEFboKYrXQQK0=; b=dq6y3C1+jeW6VDdfkFOSoD3kG5
	2EzwqK0oapwhch6yIBMbAUv0+LUXE4BhbTtFHyUqHKDkk8j0iCzk4cy0xIZc36aPBqy4BOKfK+E9U
	lRrsL4EINTzc/up//rRcjearsG66hCwu1xwqsP9pgljJeEI7RbLpIxJcJv84qxqFitqf7QASs9sT/
	ZOcWy3/xiIIGhc9DP2XJS/yLZzBrCvaWYl8gt2u1dhMYTjNaAX4KqhUMoiHeKBNfwsIvJTmG7qA7Y
	ObdibN+ciyHlgoY9ik4Arzrme6Q8BMw22z2qqAUYueLN9aIEApjPSJIZXV+2p9HDhSA+d1zbOaqAr
	vyX/UHeA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9vF-00000002Cbo-3KU1
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 17:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 260715C4968;
	Mon,  2 Dec 2024 17:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8909BC4CED1;
	Mon,  2 Dec 2024 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733159357;
	bh=1MIF/Rz+w/8n8gkgkZK0WmGUfmdVogWP/KTCz4K+XSE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b8wqpA1FVRlRHZjD5aEKzJrkJsVocrS7CF2wRPl/iB6OtpKw5gnNKCw3ry17YHyXD
	 PRX5vpQiXfwdEv9ZTiWF6XxpmiBa9OaoBBSZPsAS6yhsrFCxnvTTwQdBIcMBeoVS9z
	 U0MyNhIl81f3XCa+Xd/e2qiPtUQP4sxJJdiwzIRpAEZ978Y+yVIy/2V9c82bgUmdk9
	 UTTmOkR1thx6m7KdXku17tCkW8BfOld5e0B3hVSkaEVHI0Q4kglOytHhmEW63bi6Jb
	 Kx4KvWaZGX3qp5/v15bMxpruJuRpXOcT5YGDEI1t1N6HFhnEXnItEgZ+GyIqf/xycW
	 eyxph1gDL9zkg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org
Cc: ajones@ventanamicro.com, palmer@dabbelt.com, Ben Dooks
 <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2 1/3] riscv: ptrace: add regs_set_register()
In-Reply-To: <20241201102759.221176-2-ben.dooks@codethink.co.uk>
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
 <20241201102759.221176-2-ben.dooks@codethink.co.uk>
Date: Mon, 02 Dec 2024 18:09:15 +0100
Message-ID: <87ser62ero.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_170922_130305_EC19AF69 
X-CRM114-Status: GOOD (  15.27  )
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

QmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiB3cml0ZXM6Cgo+IFNpbmNlIHdl
IGhhdmUgcmVnc19nZXRfcmVnaXN0ZXIoKSBhbmQgd2UgY291bGQgdXNlIHRoZSBzZXQgY291bnRl
cnBhcnQKPiBmb3IgdGhpbmdzIGxpa2UgZml4aW5nIHVwIHRyYXBzLCBhZGQgcmVnc19zZXRfcmVn
aXN0ZXIoKSB0byBzZXQgYSBwdF9yZWdzCj4gdmFsdWUgZnJvbSBvZmZzZXQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Cj4gLS0tCj4gdjI6
Cj4gICAtIGZpeGVkIEFuZHJldyBKb25lcycgc3VnZ2VzdGlvbnMgZm9yIGNvbW1lbnRzCj4gLS0t
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmggfCAyMCArKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3B0cmFjZS5oCj4gaW5kZXggYjViMGFkY2M4NWMxLi40NWM1MDNiNTkyYzggMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcHRyYWNlLmgKPiBAQCAtMTQzLDYgKzE0MywyNiBAQCBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgcmVnc19nZXRfcmVnaXN0ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gIAly
ZXR1cm4gKih1bnNpZ25lZCBsb25nICopKCh1bnNpZ25lZCBsb25nKXJlZ3MgKyBvZmZzZXQpOwo+
ICB9Cj4gIAo+ICsvKioKPiArICogcmVnc19zZXRfcmVnaXN0ZXIoKSAtIHNldCByZWdpc3RlciB2
YWx1ZSBhdCBpdHMgb2Zmc2V0Cj4gKyAqIEByZWdzOglwdF9yZWdzIHRvIHdoaWNoIHJlZ2lzdGVy
IHZhbHVlIGlzIHNldAo+ICsgKiBAb2Zmc2V0OglvZmZzZXQgb2YgdGhlIHJlZ2lzdGVyLgo+ICsg
KiBAdmFsdWU6CXZhbHVlIHRvIHNldCByZWdpc3RlciB0bwo+ICsgKgo+ICsgKiByZWdzX3NldF9y
ZWdpc3RlciBzZXRzIHRoZSB2YWx1ZSBAdG8gdG8gYSByZWdpc3RlciB3aG9zZSBvZmZzZXQgZnJv
bSBAcmVncy4KPiArICogVGhlIEBvZmZzZXQgaXMgdGhlIG9mZnNldCBvZiB0aGUgcmVnaXN0ZXIg
aW4gc3RydWN0IHB0X3JlZ3MuCj4gKyAqIElmIEBvZmZzZXQgaXMgYmlnZ2VyIHRoYW4gTUFYX1JF
R19PRkZTRVQsIHRoaXMgd2lsbCBpZ25vcmUgdGhlIHdyaXRlLgo+ICsgKi8KPiArc3RhdGljIGlu
bGluZSB2b2lkIHJlZ3Nfc2V0X3JlZ2lzdGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICsJCQkJ
ICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+ICsJCQkJICAgICB1bnNpZ25lZCBsb25nIHZhbHVl
KQoKSG9iYnkgaG9yc2Ugd2FybmluZyEgSWYgeW91J3JlIHJlc2VuZGluZyBmb3IgZHJldydzIGNv
bW1lbnRzLCBwbGVhc2UgdXNlCnRoZSBmdWxsIDEwMCBjaGFycyEKCkJqw7ZybgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
