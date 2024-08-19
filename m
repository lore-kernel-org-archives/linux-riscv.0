Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59286C5472C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzBrwg2qreaZnNvhKTnTr1zbwqCC71gzvN+RuSrk34s=; b=qlI8/J95OUI2qg
	s/hKt4PHjqO/DrkqBSLlfarsvHHZWMMad7dglgUvb0wm7juWi+XnJZIrKviQLIUYNaw7bmMhNcOBy
	O57pmVeiF1ln6jwFtV5J+YxpGAK2vXSpJIjch72ONDYd8YozRtQO6dbwf/3hZS0kdFqIy2bvFLfwA
	tdfstaKfGtL+CgxrwRckxkp9E56woQwsnhl7w5x6S3Ayo7VY4sfXmhYAQhH/S0KOvX3AA4uG+zwIA
	Ses/ePlFcySpjC1QXQ5y7bzU/D/F1wzhYdZDNTlg2v8neHNZhhbfPtS5yYQnpm0nQKBd5HCX2ybgK
	OmNU8/zpz4yKUvGdme8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6R1-00000002RPl-2a2S;
	Mon, 19 Aug 2024 17:44:51 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6C9-00000002Pii-1Cbx
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 17:29:31 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4f524fa193aso3622581e0c.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724088567; x=1724693367; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTBF8xRO+6dr+B02W+DX5fAQu1yZkaocLrasHJ3WzbU=;
        b=mY2efqBf6+ZpDO2eREFfXn+XQdKGcJLdMM6lgfligjSntWvusLcjR12fGLkEJrkF0G
         ihgKrckZXxugvMFyX05A9qCqpJ858viXIK7YxbceV4nYCDraOCCLxuwJEpOk2GYoUFQb
         KeCovey3yVRjSRjhv043g/fMwI37VWyHMFBJ4PSrbwaOkCUh6YugpvNnYehIARy845by
         +1Nb2/8UAAY2LayG6FfoyB2+A2fPSkbFaMkwJJd7a5nNK8tZJjdvpXBB0Q3aPl81BNmI
         zE5lh534PL/gKSjh9E767DeNpkLUazVwcZWWuvrmOH8ZXtLbmbSPB+Dnt4w2HgKFLN+J
         dFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724088567; x=1724693367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTBF8xRO+6dr+B02W+DX5fAQu1yZkaocLrasHJ3WzbU=;
        b=q9FkY+6J9RbMKKpktqRw3KEaFUNR70kHdHbTplllkJgV1fJMM3X3+01uYKBzANskT6
         r/hjitYOWajOu0iZq/x/zlJ9cU8vaB3vzzO3umIykSrzwWLyiELgojMbm4U5u8dhHYji
         eAtGIhwFb2tH6YKHq3L9he1WrZcTllkwuZwtXQQx38JBCchY/19T0Rios3QzuR9w+SHq
         v+9VboczuNaDqC2G3ZFPbe4Yt/qr4JMNKlq5wTGItUWG4ncviTinRHclA7Fm7khnafJA
         0PbUhKZJfvsfUpbH+yCwjBBB8Rnt/t4xeJEbsGunjYJoXwEsOyQtgw04LPivd3Zovc5i
         2dZw==
X-Forwarded-Encrypted: i=1; AJvYcCXGpPzdy9+jbpysXLpoBtapSgRY1zk7XGUdBpjR5u4zqUV5mCE7GhZS8Yq+pGDDGJ4MduAUL0baOpThqtYTon03lCPS8WYjsjOcrdLMUips
X-Gm-Message-State: AOJu0Yz8AJMQ7BNce0Fr6jzDyUV5z0JMhazrhxeFYYcDIHm+zokiLNiT
	DsCtPt6TnjaTuahSM24L/jb6M06vPXbDGRvMaTipEZuzUtp4nxsZqsux172fJupFf1CbJuTgmc0
	ya3zFVTNdAmJpsUkK0tPbS34w6LzglVHBuvUYvQ==
X-Google-Smtp-Source: AGHT+IE5C25rMYlYJ9rNhDYQ9jQen34MSS+PvWtWf/qOkX3gU+Sjvd7JiPq70UYyNTDu5toD9RYEGxZa8dQkUNbwjUw=
X-Received: by 2002:ac5:c393:0:b0:4f5:2849:598d with SMTP id
 71dfb90a1353d-4fcd672d202mr327117e0c.4.1724088567062; Mon, 19 Aug 2024
 10:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240817075629.262318-1-mikisabate@gmail.com>
In-Reply-To: <20240817075629.262318-1-mikisabate@gmail.com>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 19 Aug 2024 13:29:16 -0400
Message-ID: <CALSpo=ZsZWNm_cXG_4GXyZ9invSS_eKH=9Q-mdoM2XV=HwzOXA@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: export Zicntr and Zihpm extensions
To: =?UTF-8?B?TWlxdWVsIFNhYmF0w6kgU29sw6A=?= <mikisabate@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_102929_576505_B93C9049 
X-CRM114-Status: GOOD (  17.97  )
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

T24gU2F0LCBBdWcgMTcsIDIwMjQgYXQgMzo1OOKAr0FNIE1pcXVlbCBTYWJhdMOpIFNvbMOgIDxt
aWtpc2FiYXRlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgWmljbnRyIGFuZCBaaWhwbSBJ
U0EgZXh0ZW5zaW9ucyB0aHJvdWdoIHRoZSBod3Byb2JlIHN5c2NhbGwuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBNaXF1ZWwgU2FiYXTDqSBTb2zDoCA8bWlraXNhYmF0ZUBnbWFpbC5jb20+Cj4gLS0tCj4g
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA2ICsrKysrKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgMiArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdw
cm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiBpbmRleCAz
ZGI2MGEwOTExZGYuLjViYjY5Yzk4NWNjZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdw
cm9iZS5yc3QKPiBAQCAtMTg4LDEwICsxODgsMTYgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBk
ZWZpbmVkOgo+ICAgICAgICAgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJB
ZGQgY2hhbmdlcyByZXF1ZXN0ZWQgYnkgVmVkCj4gICAgICAgICBkdXJpbmcgc2lnbm9mZiIpCj4K
PiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNOVFJgOiBUaGUgWmljbnRyIGV4
dGVuc2lvbiB2ZXJzaW9uIDIuMAo+ICsgICAgICAgaXMgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4g
dGhlIFJJU0MtViBJU0EgbWFudWFsLgo+ICsKPiAgICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0VYVF9aSUhJTlRQQVVTRWA6IFRoZSBaaWhpbnRwYXVzZSBleHRlbnNpb24gaXMKPiAgICAgICAg
IHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBm
cm9tIGNvbW1pdAo+ICAgICAgICAgZDhhYjVjNzhjMjA3ICgiWmloaW50cGF1c2UgaXMgcmF0aWZp
ZWQiKS4KPgo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJSFBNYDogVGhlIFpp
aHBtIGV4dGVuc2lvbiB2ZXJzaW9uIDIuMAo+ICsgICAgICAgaXMgc3VwcG9ydGVkIGFzIGRlZmlu
ZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsLgo+ICsKPiAgICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX0VYVF9aVkUzMlhgOiBUaGUgVmVjdG9yIHN1Yi1leHRlbnNpb24gWnZlMzJ4IGlzCj4g
ICAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBW
ZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaAo+IGluZGV4IGI3MDZjOGU0N2IwMi4uMDk4YTgxNWIzZmQ0IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gQEAgLTcyLDYgKzcyLDggQEAgc3RydWN0IHJpc2N2
X2h3cHJvYmUgewo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pD
RiAgICAgICAgICAgKDFVTEwgPDwgNDYpCj4gICNkZWZpbmUgICAgICAgICAgICAgICAgUklTQ1Zf
SFdQUk9CRV9FWFRfWkNNT1AgICAgICAgICAoMVVMTCA8PCA0NykKPiAgI2RlZmluZSAgICAgICAg
ICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQVdSUyAgICAgICAgICgxVUxMIDw8IDQ4KQo+ICsj
ZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ05UUiAgICAgICAgKDFV
TEwgPDwgNDkpCj4gKyNkZWZpbmUgICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklI
UE0gICAgICAgICAoMVVMTCA8PCA1MCkKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQ
RVJGXzAgICAgNQo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJ
R05FRF9VTktOT1dOICAgICAgICAoMCA8PCAwKQo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRCAgICAgICAoMSA8PCAwKQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYwo+IGluZGV4IDhkMWI1YzM1ZDJhNy4uMzBhZWRlMWM5MGZmIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gQEAgLTExOCw2ICsxMTgsOCBAQCBzdGF0aWMgdm9pZCBo
d3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+ICAgICAgICAgICAg
ICAgICBFWFRfS0VZKFpLU0gpOwo+ICAgICAgICAgICAgICAgICBFWFRfS0VZKFpLVCk7Cj4gICAg
ICAgICAgICAgICAgIEVYVF9LRVkoWlRTTyk7Cj4gKyAgICAgICAgICAgICAgIEVYVF9LRVkoWklD
TlRSKTsKPiArICAgICAgICAgICAgICAgRVhUX0tFWShaSUhQTSk7CgpDb25vciwgZG8gd2UgY2Fy
ZSBhYm91dCBvcmRlcmluZz8KCkFja2VkLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMu
Y29tPgoKPgo+ICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAgICAgICAgICAgKiBBbGwgdGhl
IGZvbGxvd2luZyBleHRlbnNpb25zIG11c3QgZGVwZW5kIG9uIHRoZSBrZXJuZWwKPiAtLQo+IDIu
NDYuMAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
