Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE624C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aN6tkqI1AUcyRqxeYENcW8UP7a09VUXeDN5/qiVw1U4=; b=nJaa6LQ+iR+07a
	ztJDFCxsOfkiVtHlHYaIUKQ6L8gtkpHvvtBPSZZoH3sA3GVNu339XVoo/Hg42Ah1Q4v80wTEwbRVa
	94ArYxkPu16p7GhvX+ftY6Ql9sk5WjdiFHI6gbwmeq126Ac36vyfgEPiNbRlUwA5nWW1BfPZvijLL
	3i4KeOxrrUgd58fyaou0aTizvFQ8fvsQZGL349NlXLJ44S9lFdBLz4SV0MzZ9A/XpPdNjy/RhC0Na
	0woqDowGsnD7mjfKS3n8oXYmAyOiRz4sv0gb6LN7xrPxrZ+4abxVQNv9Qg2nQl8Otytf/WelIO/A9
	xy1N6+wMmkM8MDkx2DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE51P-002ihR-1C;
	Fri, 15 Dec 2023 10:02:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE51M-002igb-0L
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 10:02:17 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5cd68a0de49so182125a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 02:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1702634533; x=1703239333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXyJbk2cqyX20aohZjN0F4Xli2SubkR+gZdBJV7wcH8=;
        b=o8lOLH5ClQuGNDq8kntIr7HJBQYsOPPgdCIglstk7wThxuSMtVQyn90SBFY0gWXNwB
         1Q6JkWftWBcpOE8wr14xAJBSH6XfPelmyTecWkDqAskyiNV8FpzQkqjMk+nd8Kfny43x
         O4uup7C6SQpTri4BfEtntKju3XUecYveEzCooGjbomGFCsXwKdtZcNZ2pLbOmsUlC4gv
         5v3GLLxGzKosIVJVWIekk+JOs2tLQ8mb3Hit56HI4f2wvaIUOUei0Th5m/YrI9abOzQ8
         eAd4ldS46dgMgT50ycUbpJh2hWA3Wwl9MY/e0HFU086DkjkUrBGOiO7Va4V3lJ4jNGY6
         ccpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702634533; x=1703239333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXyJbk2cqyX20aohZjN0F4Xli2SubkR+gZdBJV7wcH8=;
        b=YqseGR9LTjiTbYESr/pV3gjz06jeL1mnAk9p7c/jrw3pCwqlFmeHv3RjqPRhO/l76V
         d7QXUJHrlBIf4OPioQnIsz0ZKl3DALlkzrEqEeRsxCNM/pg9ekY6pngX1WB1UttW3gjF
         K8u5Kn18lpYF9c04yuZTlxBJAAc5DFNpI4HGY4NOlw9zN9zxIiIvTmBBMOYLFi7R8UMC
         jWvj0wBMj/fOqxzB+q+uiupwXoyv4vuv8jGhrhqiiI5o7ljDHNI+FtyLcFpsVxTW5mJe
         17aU3vGiwxH5d/IFAwi2WUDehOUHHXZWHOwdVQF/8ArJZVxGouVpQEx6tZ4GtRymvlE6
         eQcQ==
X-Gm-Message-State: AOJu0YycQ1SN5CBnRRijLAtWaK3hkNU9BE7Ua1bMA+hViqJOPEFnQn5X
	VULugtRf3QYHwO1y5PD3ezWEe+Fw7ee+WggPkulG3Q==
X-Google-Smtp-Source: AGHT+IHYA1xHp4lkOd1cCBALEFt0tY88icNCqMBZdHPqehqnfxzKl3xfuFkUXsO7UTy0nxhjaaNQsn4lPh3Pj50GGXU=
X-Received: by 2002:a17:90b:2792:b0:285:8d5c:9114 with SMTP id
 pw18-20020a17090b279200b002858d5c9114mr7926991pjb.19.1702634532837; Fri, 15
 Dec 2023 02:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu> <20231124-3934c1b3c4b6dc3f076b0f9a@orel>
In-Reply-To: <20231124-3934c1b3c4b6dc3f076b0f9a@orel>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 15 Dec 2023 11:02:01 +0100
Message-ID: <CAEg0e7hfM9Pb+CoUXQ_Hw_tkWv-XG9VwS-g74-rcva3j_wODrA@mail.gmail.com>
Subject: Re: [PATCH 0/5] tools: selftests: riscv: Fix compiler warnings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_020216_150616_998D88B2 
X-CRM114-Status: GOOD (  14.13  )
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

UGluZy4KSXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSB0aGVzZSBjb21waWxlciB3YXJuaW5ncyBm
aXhlZCBiZWZvcmUgdGhlIHJlbGVhc2UuCgpPbiBGcmksIE5vdiAyNCwgMjAyMyBhdCAxMDo0MOKA
r0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24g
VGh1LCBOb3YgMjMsIDIwMjMgYXQgMDc6NTg6MTZQTSArMDEwMCwgQ2hyaXN0b3BoIE11ZWxsbmVy
IHdyb3RlOgo+ID4gRnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJA
dnJ1bGwuZXU+Cj4gPgo+ID4gV2hlbiBidWlsZGluZyB0aGUgUklTQy1WIHNlbGZ0ZXN0cyB3aXRo
IGEgcmlzY3YzMiBjb21waWxlciBJIHJhbiBpbnRvCj4gPiBhIGNvdXBsZSBvZiBjb21waWxlciB3
YXJuaW5ncy4gV2hpbGUgcmlzY3YzMiBzdXBwb3J0IGZvciB0aGVzZSB0ZXN0cyBpcwo+ID4gcXVl
c3Rpb25hYmxlLCB0aGUgZml4ZXMgYXJlIHNvIHRyaXZpYWwgdGhhdCBpdCBpcyBwcm9iYWJseSBi
ZXN0IHRvIHNpbXBseQo+ID4gYXBwbHkgdGhlbS4KPiA+Cj4gPiBOb3RlIHRoYXQgdGhlIG1pc3Np
bmctaW5jbHVkZSBwYXRjaCBhbmQgc29tZSBmb3JtYXQgc3RyaW5nIHdhcm5pbmdzCj4gPiBhcmUg
YWxzbyByZWxldmFudCBmb3IgcmlzY3Y2NC4KPgo+IEkgYWxzbyBwb3N0ZWQgWzFdIGEgY291cGxl
IGRheXMgYWdvIGZvciB0aGUgZm9ybWF0IHdhcm5pbmdzLCBidXQsIGFzIHRoaXMKPiBzZXJpZXMg
YWxzbyBpbmNsdWRlcyBydjMyIGZpeGVzLCB0aGVuIHdlIGNhbiBkcm9wIFsxXSBpbiBmYXZvciBv
ZiB0aGlzLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTEyMjE3MTgy
MS4xMzA4NTQtMi1ham9uZXNAdmVudGFuYW1pY3JvLmNvbS8KPgo+IEZvciB0aGUgc2VyaWVzLAo+
Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4K
PiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
