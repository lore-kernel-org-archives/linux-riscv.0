Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC02C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 17:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+0moYv05tNovMlXOmbo80pVuhCHcPkXuh9llwPEsVBc=; b=uUuGvkkU6FYqcmXBWPwMAMm09h
	ixVtZkMHZUjlW+0v32bbtgIIzbafnhPZ+4dAOqyDSr140ydRDj3s312iHbRp+uJZLXfQlwL+5IyUH
	vOaCu4geAPFv4Hxr213acc1WlTXZ603vmIlVSh5d9oCWt/Bhtvr2uwtxJoSbw4PwHl7rEqpZqH9BH
	g/BbImlEBnNkcvTNINlESX4cRxizP7PZ2Yy3Kxnb7g3yoUitsfK5iI9W70izhrxMsExBgZYGz7XQa
	fRHJKrEYONBO9EQv/AOA1zwT07DNZ1xj10LDYgs3JGczdhXzUirX+bI5mOTgGYYT/ecitPh94qk3h
	9X+Ma0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r03hL-00HGSQ-2b;
	Mon, 06 Nov 2023 17:47:39 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r03hE-00HGQV-01
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 17:47:37 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so3022463a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699292849; x=1699897649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjiTCAPQ/Dvh52BiHkeWzErmU2ehyc+Vb2ES67exqnE=;
        b=rzrs983/2LObYFuLF1hQhEEDuhnReaie5OslJdKUkoy+eOxW9K2S6mskwvvlF66Qvn
         qbhcRdOrZbisoCdEi8TS7Dn5k3Wbro/TNTOeSJBPWiKKFnWPdcxXx0g4bYJfgjmOs3Jx
         9ziqvAoc61Vmy/bua6Hy+AL6OA9vUXCFQHNQL5iwA2xENZHrWAAqKjGtrGDBWw7cigae
         YpmK2f170QBCNCGcmAi74hjHuKU2fPXtPIy3Bd+TaQOjTg6LapdhZNfYSUy2Kip5PlJt
         G3Mjc1xbthg1pIp1xPKgEPeH1HSJda2nIsbovH/4i4JRmCn3ucoLUDxmTKi7+hD4EMBa
         Ih5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699292849; x=1699897649;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjiTCAPQ/Dvh52BiHkeWzErmU2ehyc+Vb2ES67exqnE=;
        b=KUvCXkdM5ROEaK+vXuKPX3r8YwQgHMZI/ZtcCnB6BnHpMBvcQLXUFbXaSsV1n/FDCH
         W7RDzkK02Lof15qCx0ljMOSKIxLtWDXP/4SXuDo2M0XJoFCN/zU2CHb67dwR+Q/KV9Ym
         uRwmkFF8LyNVsXWzc5bit2EzbY3aAxWfX55SUpW0J4PYdOAP8qVVZ236roZDPHbYwQCS
         0wcYiX38YkFtIzhkb0QWY0xrvfyPHcRYpjOmwKLTZxR6mkVIQ87k6M1uupGQbnLBVuB6
         wBcde+idXZzB20Zt/10t73NUqHs0SWrPaZcvXhTj432bxno5iEcIYjOoMlFKXeFMsyPa
         OeWQ==
X-Gm-Message-State: AOJu0YyAdRDm9z1DwzWkpbcy6jkuMFQFynSK3MHWc7mMXP+IuZBrjwal
	t2wcEo/XnoxiiNVgwbGjPd+Vpw==
X-Google-Smtp-Source: AGHT+IFHaQWxtub12aD9f9065e5oc0uXm1/nB/k434xLnQkRciT453rkxM4oCkVOVhn2njVQQYU0sw==
X-Received: by 2002:a05:6830:925:b0:6cd:8c8:1654 with SMTP id v37-20020a056830092500b006cd08c81654mr35325191ott.2.1699292849495;
        Mon, 06 Nov 2023 09:47:29 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id az5-20020a056830458500b006c4727812fdsm1340215otb.15.2023.11.06.09.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 09:47:28 -0800 (PST)
Date: Mon, 06 Nov 2023 09:47:28 -0800 (PST)
X-Google-Original-Date: Mon, 06 Nov 2023 09:40:24 PST (-0800)
Subject: Re: [PATCH v2 4/5] riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
In-Reply-To: <20231024132655.730417-5-cleger@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  anup@brainfault.org, atishp@atishpatra.org, ajones@ventanamicro.com, cleger@rivosinc.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cleger@rivosinc.com
Message-ID: <mhng-a152f6da-63a0-4863-a637-e6ee4f4fa4d7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_094732_067467_FAD6F15B 
X-CRM114-Status: GOOD (  18.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyNCBPY3QgMjAyMyAwNjoyNjo1NCBQRFQgKC0wNzAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPiBFTlRSWSgpL0VORCgpL1dFQUsoKSBtYWNyb3MgYXJlIGRlcHJlY2F0ZWQg
YW5kIHdlIHNob3VsZCBtYWtlIHVzZSBvZiB0aGUKPiBuZXcgU1lNXyooKSBtYWNyb3MgWzFdIGZv
ciBiZXR0ZXIgYW5ub3RhdGlvbiBvZiBzeW1ib2xzLiBSZXBsYWNlIHRoZQo+IGRlcHJlY2F0ZWQg
b25lcyB3aXRoIHRoZSBuZXcgb25lcyBhbmQgZml4IHdyb25nIHVzYWdlIG9mIEVORCgpL0VORFBS
T0MoKQo+IHRvIGNvcnJlY3RseSBkZXNjcmliZSB0aGUgc3ltYm9scy4KPgo+IFsxXSBodHRwczov
L2RvY3Mua2VybmVsLm9yZy9jb3JlLWFwaS9hc20tYW5ub3RhdGlvbnMuaHRtbAo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TIHwgMjggKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc3dpdGNoLlMKPiBpbmRleCBkNzRkZjhlYjRkNzEuLjhiMTg0NzM3ODBhYyAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TCj4gKysrIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zd2l0Y2guUwo+IEBAIC0xNSw3ICsxNSw3IEBACj4gIAkuYWx0bWFjcm8KPiAg
CS5vcHRpb24gbm9yZWxheAo+Cj4gLUVOVFJZKF9fa3ZtX3Jpc2N2X3N3aXRjaF90bykKPiArU1lN
X0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNoX3RvKQo+ICAJLyogU2F2ZSBIb3N0IEdQUnMg
KGV4Y2VwdCBBMCBhbmQgVDAtVDYpICovCj4gIAlSRUdfUwlyYSwgKEtWTV9BUkNIX0hPU1RfUkEp
KGEwKQo+ICAJUkVHX1MJc3AsIChLVk1fQVJDSF9IT1NUX1NQKShhMCkKPiBAQCAtMjA4LDkgKzIw
OCw5IEBAIF9fa3ZtX3N3aXRjaF9yZXR1cm46Cj4KPiAgCS8qIFJldHVybiB0byBDIGNvZGUgKi8K
PiAgCXJldAo+IC1FTkRQUk9DKF9fa3ZtX3Jpc2N2X3N3aXRjaF90bykKPiArU1lNX0ZVTkNfRU5E
KF9fa3ZtX3Jpc2N2X3N3aXRjaF90bykKPgo+IC1FTlRSWShfX2t2bV9yaXNjdl91bnByaXZfdHJh
cCkKPiArU1lNX0NPREVfU1RBUlQoX19rdm1fcmlzY3ZfdW5wcml2X3RyYXApCj4gIAkvKgo+ICAJ
ICogV2UgYXNzdW1lIHRoYXQgZmF1bHRpbmcgdW5wcml2IGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb24g
aXMKPiAgCSAqIDQtYnl0ZSBsb25nIGFuZCBibGluZGx5IGluY3JlbWVudCBTRVBDIGJ5IDQuCj4g
QEAgLTIzMSwxMiArMjMxLDEwIEBAIEVOVFJZKF9fa3ZtX3Jpc2N2X3VucHJpdl90cmFwKQo+ICAJ
Y3NycglhMSwgQ1NSX0hUSU5TVAo+ICAJUkVHX1MJYTEsIChLVk1fQVJDSF9UUkFQX0hUSU5TVCko
YTApCj4gIAlzcmV0Cj4gLUVORFBST0MoX19rdm1fcmlzY3ZfdW5wcml2X3RyYXApCj4gK1NZTV9D
T0RFX0VORChfX2t2bV9yaXNjdl91bnByaXZfdHJhcCkKPgo+ICAjaWZkZWYJQ09ORklHX0ZQVQo+
IC0JLmFsaWduIDMKPiAtCS5nbG9iYWwgX19rdm1fcmlzY3ZfZnBfZl9zYXZlCj4gLV9fa3ZtX3Jp
c2N2X2ZwX2Zfc2F2ZToKPiArU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3ZfZnBfZl9zYXZlKQo+
ICAJY3NyciB0MiwgQ1NSX1NTVEFUVVMKPiAgCWxpIHQxLCBTUl9GUwo+ICAJY3NycyBDU1JfU1NU
QVRVUywgdDEKPiBAQCAtMjc2LDEwICsyNzQsOSBAQCBfX2t2bV9yaXNjdl9mcF9mX3NhdmU6Cj4g
IAlzdyB0MCwgS1ZNX0FSQ0hfRlBfRl9GQ1NSKGEwKQo+ICAJY3NydyBDU1JfU1NUQVRVUywgdDIK
PiAgCXJldAo+ICtTWU1fRlVOQ19FTkQoX19rdm1fcmlzY3ZfZnBfZl9zYXZlKQo+Cj4gLQkuYWxp
Z24gMwo+IC0JLmdsb2JhbCBfX2t2bV9yaXNjdl9mcF9kX3NhdmUKPiAtX19rdm1fcmlzY3ZfZnBf
ZF9zYXZlOgo+ICtTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNjdl9mcF9kX3NhdmUpCj4gIAljc3Jy
IHQyLCBDU1JfU1NUQVRVUwo+ICAJbGkgdDEsIFNSX0ZTCj4gIAljc3JzIENTUl9TU1RBVFVTLCB0
MQo+IEBAIC0zMTksMTAgKzMxNiw5IEBAIF9fa3ZtX3Jpc2N2X2ZwX2Rfc2F2ZToKPiAgCXN3IHQw
LCBLVk1fQVJDSF9GUF9EX0ZDU1IoYTApCj4gIAljc3J3IENTUl9TU1RBVFVTLCB0Mgo+ICAJcmV0
Cj4gK1NZTV9GVU5DX0VORChfX2t2bV9yaXNjdl9mcF9kX3NhdmUpCj4KPiAtCS5hbGlnbiAzCj4g
LQkuZ2xvYmFsIF9fa3ZtX3Jpc2N2X2ZwX2ZfcmVzdG9yZQo+IC1fX2t2bV9yaXNjdl9mcF9mX3Jl
c3RvcmU6Cj4gK1NZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X2ZwX2ZfcmVzdG9yZSkKPiAgCWNz
cnIgdDIsIENTUl9TU1RBVFVTCj4gIAlsaSB0MSwgU1JfRlMKPiAgCWx3IHQwLCBLVk1fQVJDSF9G
UF9GX0ZDU1IoYTApCj4gQEAgLTM2MiwxMCArMzU4LDkgQEAgX19rdm1fcmlzY3ZfZnBfZl9yZXN0
b3JlOgo+ICAJZnNjc3IgdDAKPiAgCWNzcncgQ1NSX1NTVEFUVVMsIHQyCj4gIAlyZXQKPiArU1lN
X0ZVTkNfRU5EKF9fa3ZtX3Jpc2N2X2ZwX2ZfcmVzdG9yZSkKPgo+IC0JLmFsaWduIDMKPiAtCS5n
bG9iYWwgX19rdm1fcmlzY3ZfZnBfZF9yZXN0b3JlCj4gLV9fa3ZtX3Jpc2N2X2ZwX2RfcmVzdG9y
ZToKPiArU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3ZfZnBfZF9yZXN0b3JlKQo+ICAJY3NyciB0
MiwgQ1NSX1NTVEFUVVMKPiAgCWxpIHQxLCBTUl9GUwo+ICAJbHcgdDAsIEtWTV9BUkNIX0ZQX0Rf
RkNTUihhMCkKPiBAQCAtNDA1LDQgKzQwMCw1IEBAIF9fa3ZtX3Jpc2N2X2ZwX2RfcmVzdG9yZToK
PiAgCWZzY3NyIHQwCj4gIAljc3J3IENTUl9TU1RBVFVTLCB0Mgo+ICAJcmV0Cj4gK1NZTV9GVU5D
X0VORChfX2t2bV9yaXNjdl9mcF9kX3Jlc3RvcmUpCj4gICNlbmRpZgoKQWNrZWQtYnk6IFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
