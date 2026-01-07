Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B9FCF6BF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BHgqeCiM2OvVwBl8itRhkpngHKpPjTFWs/ntwTZuWI=; b=ZF63aNz22+4OQS
	UUJJqjDROyn/j3OxuoaBD+U8iAvHwPFqR6Sl1CMpOSaHy9fW8ZjI/5J+YHFTIm2O/eOVUoEKP7xR4
	iQtynR2oG8j9PKg8Kthzd0TrrbJ/kWcuXAVzEbC2eYNLp0zEcs9mDIdgn6imJdvg+CaUSMT8DAwlB
	nuqWsHDj+CJypvQTlAUBPDGR1yCrJfqqrdObgtgRgVmQlgGT8eqJP8MzKvsrSmg9BCdHssl94dZGQ
	ytXFJRAHRPK5HHsc50RQWXEvWzur215hj3SWaGTnvNAGPKsbwLQjEcfaUgzKGNv9ti8jaJNW4BJBQ
	TOfxl5pE6W8NnWG3CT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNLp-0000000EEUN-2SMl;
	Wed, 07 Jan 2026 06:49:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNLm-0000000EETP-3SQ6
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 06:49:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso250799766b.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 22:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767768537; x=1768373337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2dZxNhKtlReqe44kHwkS5EfdRS63SDksuMbrc7UdcM=;
        b=DQ+P0JKFVpBxbwTBFQF0etjL8AzDD1HhHKc4Hy98FyFOUiGnGNFpSDaAaPtTzSHliJ
         NS0seRfN7LzMyy7PVkLMVpZ3wiRDHGPqyU+YselHYONVqMZnnUnx8W52zGDRxaN0xTYE
         Drean7o7QDrwH2HISv0M9xvJD/kA9v0CQIj42ozxpyKVGbweJ3AoXSr9modphQqCRV8M
         yMlFhTeD4yTt/g0WJ8y0weXw20SAfSTaQrvX9uweEUOocAjw69DgNbd8Nf/vacutk4kA
         j9xxuqcmGrw9QQ4gWAbB6cHVT2nznslapSrcECBZwc6yBNhs9pFTGIpV0EpoJsdRI46V
         VpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767768537; x=1768373337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n2dZxNhKtlReqe44kHwkS5EfdRS63SDksuMbrc7UdcM=;
        b=C6UZyc0TSnYq80tJl5HHCxrhBGf071RHJHallRLhG46MnTAig7LTbI0vPEhxwBL9d/
         0R+4tA1uVV49BTzfOZ8eqBpvf9rcTL/ptZNu8QQqQNjYR+spZBlc5BvFNo++8eYwUUEM
         dMM3qH7akDD6SHhwLgY88W4adq96wEsofGn3jhj1P+NQTaDoIY84pjzomChDmw/cMRan
         mZOkW/Sp85U7Mn4ydx9c+u56sN17kbZY/LB2R6ftVhVe9Z4QCEVdMFp/ewTphjPcKqFL
         glNPoZb2xgrgaJliFvUuwZU5+vmeVUq/ouhU9E3bSfqGSiEwIQRbTEZiYSg/wwr2sZfR
         qasQ==
X-Gm-Message-State: AOJu0YxM6RlKQwT0VXCriahaSk0LrXk+cSb98/z13Z8xUddIrEufK8Bk
	3a8Z/22bfVifFISIGJjHObzXwgSv6j0LEYeQ5rCVa7SIx3WTZynKPfZBV8o6dbMzN+nUr+0lhOt
	UT0OHOjYp4LXqaVrn8cxrynTFelFgnT0=
X-Gm-Gg: AY/fxX6nAyxMtznwJ5Yr9trGNng9PakQToHiKX3YFtM92JjCvOP2GLhzGzwPkUbiqQu
	L3kOeiAs2AjAsnVCXrojI5FSobt43W16YbWAZO7eAucAxg4Ffof8h/oEso9KwjSe4sEF/R2yiDq
	2lgUS3AqYcOrp0Aioa99PFnudzJ8HRwjZixFIVr3iP9f2gM0pktAM477nHiuFn8eFVXgBJDdmer
	wZPfXhANO1RWFNXKwSiDVugFFGaRb3ShtwiFL1WtJbT9w8qUh7etPym0uZGLZ1vDWZG
X-Google-Smtp-Source: AGHT+IHlHl6F+1PesRMRom/n6+M4H0wkWSAQIgWCSn+zd87MZSmdpIsPdYLUIFQ6/Yimgy7vWNmJx0VSiDGxGvsoJj0=
X-Received: by 2002:a17:907:9614:b0:b73:398c:c5a7 with SMTP id
 a640c23a62f3a-b844532ae73mr128020566b.41.1767768536654; Tue, 06 Jan 2026
 22:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-2-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-2-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 7 Jan 2026 00:48:45 -0600
X-Gm-Features: AQt7F2ofn7FJ7QlpZbnv9-A0r7YP0WHl3m9bO2687jsPenlET5_mYG982nUv5JE
Message-ID: <CAFTtA3Os3P9OC6yxBD6EO5e=FqmQq5dCYQVPXfs9Gpkix26bhA@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] riscv: ptrace: return ENODATA for inactive vector extension
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Ilya Mamay <mmamayka01@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_224858_878525_A99E7476 
X-CRM114-Status: GOOD (  19.92  )
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

T24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0eXVrZXZpY2ggPGdl
b21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBJbHlhIE1hbWF5IDxtbWFtYXlrYTAx
QGdtYWlsLmNvbT4KPgo+IEN1cnJlbnRseSwgcHRyYWNlIHJldHVybnMgRUlOVkFMIHdoZW4gdGhl
IHZlY3RvciBleHRlbnNpb24gaXMgc3VwcG9ydGVkCj4gYnV0IG5vdCB5ZXQgYWN0aXZhdGVkIGZv
ciB0aGUgdHJhY2VkIHByb2Nlc3MuIFRoaXMgZXJyb3IgY29kZSBpcyBub3QKPiBhbHdheXMgYXBw
cm9wcmlhdGUgc2luY2UgdGhlIHB0cmFjZSBhcmd1bWVudHMgbWF5IGJlIHZhbGlkLgo+Cj4gRGVi
dWcgdG9vbHMgbGlrZSBnZGJzZXJ2ZXIgZXhwZWN0IEVOT0RBVEEgd2hlbiB0aGUgcmVxdWVzdGVk
IHJlZ2lzdGVyCj4gc2V0IGlzIG5vdCBhY3RpdmUsIGUuZy4gc2VlIFsxXS4gVGhpcyBleHBlY3Rh
dGlvbiBzZWVtcyB0byBiZSBtb3JlCj4gYXBwcm9wcmlhdGUsIHNvIG1vZGlmeSB0aGUgdmVjdG9y
IHB0cmFjZSBpbXBsZW1lbnRhdGlvbiB0byByZXR1cm46Cj4gLSBFSU5WQUwgd2hlbiBWIGV4dGVu
c2lvbiBpcyBub3Qgc3VwcG9ydGVkCj4gLSBFTk9EQVRBIHdoZW4gViBleHRlbnNpb24gaXMgc3Vw
cG9ydGVkIGJ1dCBub3QgYWN0aXZlCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2JtaW5vci9i
aW51dGlscy1nZGIvYmxvYi82MzdmMjVlODg2NzVmYTQ3ZTQ3ZjljYzVlMmNmMzczODQ4MzZiOGEy
L2dkYnNlcnZlci9saW51eC1sb3cuY2MjTDUwMjAKPgo+IFNpZ25lZC1vZmYtYnk6IElseWEgTWFt
YXkgPG1tYW1heWthMDFAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBNYXR5dWtl
dmljaCA8Z2VvbWF0c2lAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJu
YWNAZ21haWwuY29tPgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgfCAxMCAr
KysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wdHJhY2UuYwo+IGluZGV4IGU2MjcyZDc0NTcyZi4uOWQyMDNmYjg0ZjVlIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvcHRyYWNlLmMKPiBAQCAtOTUsOSArOTUsMTIgQEAgc3RhdGljIGludCByaXNjdl92
cl9nZXQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsCj4gICAgICAgICBzdHJ1Y3QgX19yaXNj
dl92X2V4dF9zdGF0ZSAqdnN0YXRlID0gJnRhcmdldC0+dGhyZWFkLnZzdGF0ZTsKPiAgICAgICAg
IHN0cnVjdCBfX3Jpc2N2X3ZfcmVnc2V0X3N0YXRlIHB0cmFjZV92c3RhdGU7Cj4KPiAtICAgICAg
IGlmICghcmlzY3Zfdl92c3RhdGVfcXVlcnkodGFza19wdF9yZWdzKHRhcmdldCkpKQo+ICsgICAg
ICAgaWYgKCEoaGFzX3ZlY3RvcigpIHx8IGhhc194dGhlYWR2ZWN0b3IoKSkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gKyAgICAgICBpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1
ZXJ5KHRhc2tfcHRfcmVncyh0YXJnZXQpKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9E
QVRBOwo+ICsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBFbnN1cmUgdGhlIHZlY3RvciByZWdp
c3RlcnMgaGF2ZSBiZWVuIHNhdmVkIHRvIHRoZSBtZW1vcnkgYmVmb3JlCj4gICAgICAgICAgKiBj
b3B5aW5nIHRoZW0gdG8gbWVtYnVmLgo+IEBAIC0xMzAsOSArMTMzLDEyIEBAIHN0YXRpYyBpbnQg
cmlzY3ZfdnJfc2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ICAgICAgICAgc3RydWN0
IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnZzdGF0ZSA9ICZ0YXJnZXQtPnRocmVhZC52c3RhdGU7Cj4g
ICAgICAgICBzdHJ1Y3QgX19yaXNjdl92X3JlZ3NldF9zdGF0ZSBwdHJhY2VfdnN0YXRlOwo+Cj4g
LSAgICAgICBpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHRhc2tfcHRfcmVncyh0YXJnZXQpKSkK
PiArICAgICAgIGlmICghKGhhc192ZWN0b3IoKSB8fCBoYXNfeHRoZWFkdmVjdG9yKCkpKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICsgICAgICAgaWYgKCFyaXNjdl92X3Zz
dGF0ZV9xdWVyeSh0YXNrX3B0X3JlZ3ModGFyZ2V0KSkpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRU5PREFUQTsKPiArCj4gICAgICAgICAvKiBDb3B5IHJlc3Qgb2YgdGhlIHZzdGF0ZSBleGNl
cHQgZGF0YXAgKi8KPiAgICAgICAgIHJldCA9IHVzZXJfcmVnc2V0X2NvcHlpbigmcG9zLCAmY291
bnQsICZrYnVmLCAmdWJ1ZiwgJnB0cmFjZV92c3RhdGUsIDAsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfcmVnc2V0X3N0YXRlKSk7Cj4g
LS0KPiAyLjUyLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
