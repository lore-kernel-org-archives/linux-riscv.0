Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A66C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNUGi3iABnzUNMkfXeUCoe/+ilBhBVZ09j4WSkYqVZQ=; b=Usmma0//QxAjjM
	dr9v2c5xfQ7YuqenCCzMY94j5G0gK2f9AN8+bRKHl3LIpK9GeInwOjKkm5UVSnSNJCXvodoA4W2U0
	WsF/Fi+Z2GiE3NRxcrAdN2PldnjHaFpYIe5Ozpuyd9zZO5dBSY1IvsS7aM5biX/C5hTPqYPsuGza1
	MkatqpmpfluTunGG55zxPYCFE3HgqH8kaF5EcC1G9c/NZXkjbgX4ztVnhwbHvZ8GGWilctHXijGtz
	dTykyVQtgw2TZiBOmYQPRZoFyhD3bjBGuEjn4QtvQ7IqmqEcv2jfndImNhLOhhBD9gzFSu403HMeO
	+Sg7kBfJvr82SfVtaG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZg2-0000000B28g-0oHN;
	Wed, 10 Jul 2024 15:56:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZfx-0000000B27p-313S
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 15:56:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-58c947a6692so8253018a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720626971; x=1721231771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISPkngAyeCTHdiiqdfhGRhrD7gcMn5QvhxpyUZ/8MrQ=;
        b=2Ou/xJ5ApAMVHfv2wFjn9qO+7a+GksnS1aFY/z/rhtMJzml7ZPG8q8DBCmQDwpJyGu
         0YwVw8cWegirbCwY2vzWZaxo73DVGkUVwjcG1VB/nKbXPbUp46AR0LVgXcQaIGp4z5G7
         lPcehtmzUmV3gf9TnZ1zzyVPMbACJCRDDcIO1X23QsPnAuiaElXws9jD1h6fN1W73kWc
         6PftIwUb64YVezDsro2jjNl1fYF5zByxX5cPzK7xK4F5AIV+4FtXa/hpWESPFs+c4aq3
         7ThCua9fPVhceCtDVoFIjeZ6YT9YwMkTMxJnzNcwLNSVCR9PX2JjSXBYFIBNZkDa+JPt
         1ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626971; x=1721231771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISPkngAyeCTHdiiqdfhGRhrD7gcMn5QvhxpyUZ/8MrQ=;
        b=kOS8WT1hrp5SBN64hheH6AK5WYByPE4/IdCAem7tYjuw1dNbsp26Vr8kuUNcXh2U5L
         lSSrKnYtb50/SDz9oNsem4L91w4iHUm4PeyuN+DotmcBd2ZDpMIzfygUW/ufmIkcSUbQ
         fADUr/LUedKftW+ofazWS+8NQ3FKoMgNNMWtcV30OjeJozETb0uCoHc3OokljKRrss51
         CN0zee/rftzOH1k90h71mGNmwhTxKImrXBx9/GZeEmsMGwiPHpiOktPpC1CR0mpNZSST
         ymfgqNqiZYf6Bjo647QY7Kau8ZoWACANOnhcFnJvBz4KMDMMX+r+91CIJ9otoZQsc9vM
         166A==
X-Gm-Message-State: AOJu0YzmhR+4mixm44VufQfqWci+YFZsFD8xIVhPnP1K8VAu0ZDbr5dC
	gGvdGbaRD3xREp0UbCv9cvFMnkH7HvzE9wR8j80kA48i6MYJvWbyv2VKJOAqndOMHWyl54rUKZ3
	0Zlh4pfEkUY7ouCLkqbcT8lxEGmAd7hnZp9oq2Q==
X-Google-Smtp-Source: AGHT+IHs4uU/4yOkk+bzRj18biX0XTt2Rbdp+dHRjb7JtDRHUJObhcKGm+ZUnkDr1LXg3IpCyRDMKsne4rSn0QUuPgI=
X-Received: by 2002:a17:906:e950:b0:a77:e1c2:3ab with SMTP id
 a640c23a62f3a-a780b884b52mr389055966b.50.1720626971164; Wed, 10 Jul 2024
 08:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240625005001.37901-1-jesse@rivosinc.com> <20240625005001.37901-4-jesse@rivosinc.com>
In-Reply-To: <20240625005001.37901-4-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 10 Jul 2024 08:55:35 -0700
Message-ID: <CALs-HsvE9PzTrhVO0umh3KaJuLQLdk-h8sYKBg7XA4a-MXAmOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] RISC-V: Check scalar unaligned access on all CPUs
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_085615_320361_97E778AF 
X-CRM114-Status: GOOD (  21.89  )
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

T24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgNTo1MeKAr1BNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gT3JpZ2luYWxseSwgdGhlIGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWRfYWxsX2NwdXMgZnVuY3Rpb24KPiBvbmx5IGNoZWNrZWQgdGhlIGJvb3QgaGFy
dC4gVGhpcyBmaXhlcyB0aGUgZnVuY3Rpb24gdG8gY2hlY2sgYWxsCj4gaGFydHMuCj4KPiBGaXhl
czogNzFjNTRiM2QxNjlkICgicmlzY3Y6IHJlcG9ydCBtaXNhbGlnbmVkIGFjY2Vzc2VzIGVtdWxh
dGlvbiB0byBod3Byb2JlIikKPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gVjEgLT4gVjI6
Cj4gIC0gTmV3IHBhdGNoCj4gVjIgLT4gVjM6Cj4gIC0gU3BsaXQgcGF0Y2gKPiAtLS0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMjMgKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4gaW5kZXggYjYyZDVhMmY0NTQx
Li44ZmFkYmUwMGRkNjIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4g
QEAgLTUyNiwzMSArNTI2LDE3IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtc3RhdGljIGJvb2wg
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1KQo+ICtzdGF0aWMgdm9pZCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqdW51c2Vk
KQo+ICB7Cj4gKyAgICAgICBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+ICAgICAgICAg
bG9uZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1
KTsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdG1wX3ZhciwgdG1wX3ZhbDsKPiAtICAgICAgIGJv
b2wgbWlzYWxpZ25lZF9lbXVfZGV0ZWN0ZWQ7Cj4KPiAgICAgICAgICptYXNfcHRyID0gUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV047Cj4KPiAgICAgICAgIF9fYXNtX18gX192b2xhdGls
ZV9fICgKPiAgICAgICAgICAgICAgICAgIiAgICAgICAiUkVHX0wiICVbdG1wXSwgMSglW3B0cl0p
XG4iCj4gICAgICAgICAgICAgICAgIDogW3RtcF0gIj1yIiAodG1wX3ZhbCkgOiBbcHRyXSAiciIg
KCZ0bXBfdmFyKSA6ICJtZW1vcnkiKTsKPiAtCj4gLSAgICAgICBtaXNhbGlnbmVkX2VtdV9kZXRl
Y3RlZCA9ICgqbWFzX3B0ciA9PSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQpOwo+
IC0gICAgICAgLyoKPiAtICAgICAgICAqIElmIHVuYWxpZ25lZF9jdGwgaXMgYWxyZWFkeSBzZXQs
IHRoaXMgbWVhbnMgdGhhdCB3ZSBkZXRlY3RlZCB0aGF0IGFsbAo+IC0gICAgICAgICogQ1BVUyB1
c2VzIGVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzIGF0IGJvb3QgdGltZS4gSWYgdGhhdCBjaGFu
Z2VkCj4gLSAgICAgICAgKiB3aGVuIGhvdHBsdWdnaW5nIHRoZSBuZXcgY3B1LCB0aGlzIGlzIHNv
bWV0aGluZyB3ZSBkb24ndCBoYW5kbGUuCj4gLSAgICAgICAgKi8KPiAtICAgICAgIGlmICh1bmxp
a2VseSh1bmFsaWduZWRfY3RsICYmICFtaXNhbGlnbmVkX2VtdV9kZXRlY3RlZCkpIHsKPiAtICAg
ICAgICAgICAgICAgcHJfY3JpdCgiQ1BVIG1pc2FsaWduZWQgYWNjZXNzZXMgbm9uIGhvbW9nZW5l
b3VzIChleHBlY3RlZCBhbGwgZW11bGF0ZWQpXG4iKTsKPiAtICAgICAgICAgICAgICAgd2hpbGUg
KHRydWUpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cj4gLSAgICAgICB9
CgpUaGlzIGNodW5rIHdhcyBtZWFudCB0byBkZXRlY3QgYW5kIHJlZnVzZSB0byBydW4gb24gYSBz
eXN0ZW0gd2hlcmUgYQpoZXRlcm9nZW5lb3VzIENQVSBpcyBob3RwbHVnZ2VkIGludG8gYSBwcmV2
aW91c2x5IGhvbW9nZW5vdXMgc3lzdGVtLgpUaGUgY29tbWl0IG1lc3NhZ2UgZG9lc24ndCBtZW50
aW9uIHRoaXMgY2hhbmdlLCBob3cgY29tZSB5b3UKZGVsZXRlZCBpdD8KCgo+IC0KPiAtICAgICAg
IHJldHVybiBtaXNhbGlnbmVkX2VtdV9kZXRlY3RlZDsKPiAgfQo+Cj4gIGJvb2wgY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQo+IEBAIC01NjIsOCArNTQ4LDEx
IEBAIGJvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQo+
ICAgICAgICAgICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3MgcmVxdWVzdGluZyBzdWNo
IGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKPiAgICAgICAgICAqIENQVS4KPiAgICAgICAgICAqLwo+
ICsgICAgICAgc2NoZWR1bGVfb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZCk7Cj4gKwo+ICAgICAgICAgZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4gLSAgICAgICAg
ICAgICAgIGlmICghY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChjcHUpKQo+ICsgICAg
ICAgICAgICAgICBpZiAocGVyX2NwdShtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KQo+ICsg
ICAgICAgICAgICAgICAgICAgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPgo+ICAgICAgICAgdW5hbGln
bmVkX2N0bCA9IHRydWU7Cj4gLS0KPiAyLjQ1LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
