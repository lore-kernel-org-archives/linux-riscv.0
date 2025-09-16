Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4434CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 05:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lEnQ4pGrGuLUWac5qpHfjOK9Kzb1h5CGNTuqkGD1uo=; b=RgEYr9AIReSj6a
	4tAmNgrP2EPzg/UQWbGPST9bEMP8maZ5yfIhzZxUayIhOy+QmL74T7zJ1ruH1LYvE1vCtSGyb2I+o
	IIlVmBNe70LGhUkvC0AA3Q3NKrPowhJKHU19Z21DplQ9Tv1P6ZDglDrbylKNE5YGYjN2OWQ5YbXG+
	QfxRf5DvVWySedyH68L2uSDD3URUJ+5yYgki57IEkN5MTaMTfQKPvB7g8zxEwEy/0N6rjoJeJICOQ
	RWua5rWtEPiTiCIIncDKAGQWDN8/m/QQKAg9ALJqn0MttgyYZU0p3BXTAEp77aEWwccHD54waxYrv
	ErBLRk3TIr0Do+TkBr9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOOh-00000006pQe-2U0q;
	Tue, 16 Sep 2025 05:38:35 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOOe-00000006pPk-35Qq
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 05:38:34 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-423fbb45255so11100485ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 22:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758001111; x=1758605911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+WY6S8XVjX9ojiFBX/w421kmUHPYta2U/tJO3CWfRQ=;
        b=h4zlzzTL/q5MW8Bz3ofIBD80wRqKRTc4QrH7NRqC6vcz3h7IM4n8hHCADDNm4gDwbM
         q5YKa4+eOn+v6PEreZi/8h0HtbFlVffFlJ7uDZxM2zCGDGDcC3e1bL5TwIoXBBSzshMK
         io4aU6blyKIdVVcuMewnlLm20G+A0iw5BvMoo0AojvMFG4vFOWDUGquVCRL2T24/3/ys
         gyQOAsD/1qd1nYfjg/XCW5nTHPKYWRx49pG+kInkb2d+4G2TqtqW8TZBPZ1pS6BmAhk8
         pqFJlNtFknIxhX575/K9A97EIENdySr6c9V78QdCxXMt2EDDOZpC9Dw0/85pQjHtUzG+
         QJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001111; x=1758605911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+WY6S8XVjX9ojiFBX/w421kmUHPYta2U/tJO3CWfRQ=;
        b=qKiNUWGCwJixX2hm08yqmrkI7Bl2bvA5j+dKyJH+UtC7TGlNLgMHyVZrho0GZ47NVn
         igkRba4dKrylDrfmRrdFllh6UPLdN9Afeo/uHduem0eazfP6iumgtA50yHXyiYl3d3tK
         VStdm1h7D6RUqdtSVx50ncOZajYCVUs/rBPul6Uuk0YelWP1grw6A5DKxVYPTWg0Is0c
         s4TeaWZQ++YDngCvnLhN9VvsD+JSmDDdQwwmmGGJD07Ep43tcevkqnQ9RhV6qk3To21L
         XxmEfYR7N2oMtpZMw/jtKcIDXOVIiiGCeXnxZJAXzVif32dy+4hUSBs0mIpS3ZFd8xuz
         dS1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8aSKH+G0ROrh9pn1TPjFKxunGyUGI9muqysbGZPrIecvVMtC7Iyl5zds0uQf5SPpdih5h77KNUIXH2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpZSsl3OA3/gLjLAlur8zDWE8eE1MRUdUSCTt61q4EtHZtOWRf
	UDSaem21v3gND4Cq4ZAywaeotHAG0iVTU8PdU1cGt0106ulIzPwbEUCkgiCTJqGY7TjnDhME3cZ
	6PZ/rcWqGqJm9BX4cLN0ZyJ6/ARK/JKG+HggxhkE8QQ==
X-Gm-Gg: ASbGncte7pFlKR52jT2g0UcDvZGXwQioRNLv9viuS91Y59JwsmoBoGMKavUp8zM4lbF
	H6cnRV527KcmcPBRcRhOrEeDyM8fIWiPEkh5nq4q45xWTUPWBwR3HuY5y7s9Pxv0r6NxDG43j2R
	gfD8S4tKoDplGRP1OWkyrSKu0EkYNJxgbPmTmwQb3VSNzGuB6yWqWswhz1zt6T8oYeS7x1se/jH
	Y/fjApoMbedENCMKGF8C8PMx/LcEHh6aWN5j9YIr42mmV3jX7s=
X-Google-Smtp-Source: AGHT+IHEt+IV7wo/STForhbe+5Ighy2VX2akKFvAUd+sccpOkUTGCayf1IFAZQMilDDqxxtkhwZJapH5I41ohgtHAys=
X-Received: by 2002:a05:6e02:19ce:b0:412:fa25:dd4e with SMTP id
 e9e14a558f8ab-4209d40ff57mr142917585ab.1.1758001111530; Mon, 15 Sep 2025
 22:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250915053431.1910941-1-samuel.holland@sifive.com>
In-Reply-To: <20250915053431.1910941-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Sep 2025 11:08:18 +0530
X-Gm-Features: AS18NWBBYp29jcrefVqIqieCZ6Bs58izD3mGRcYk8wb5X3Ucta-UItSPTxLvHGw
Message-ID: <CAAhSdy1Gg+k5U8WoFGkJvv+0TSg9mrSVCj4JTHay29uUc1_exA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix SBI_FWFT_POINTER_MASKING_PMLEN algorithm
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_223833_049227_CB95489E 
X-CRM114-Status: GOOD (  21.84  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgMTE6MDTigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgaW1wbGVtZW50YXRpb24gb2YgU0JJ
X0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOIGZyb20gY29tbWl0Cj4gYWEwNGQxMzFiODhiICgi
UklTQy1WOiBLVk06IEFkZCBzdXBwb3J0IGZvciBTQklfRldGVF9QT0lOVEVSX01BU0tJTkdfUE1M
RU4iKQo+IHdhcyBiYXNlZCBvbiBhIGRyYWZ0IG9mIHRoZSBTQkkgMy4wIHNwZWNpZmljYXRpb24s
IGFuZCBpcyBub3QgY29tcGxpYW50Cj4gd2l0aCB0aGUgcmF0aWZpZWQgdmVyc2lvbi4KPgo+IFVw
ZGF0ZSB0aGUgYWxnb3JpdGhtIHRvIGJlIGNvbXBsaWFudC4gU3BlY2lmaWNhbGx5LCBkbyBub3Qg
ZmFsbCBiYWNrIHRvCj4gYSBwb2ludGVyIG1hc2tpbmcgbW9kZSB3aXRoIGEgbGFyZ2VyIFBNTEVO
IGlmIHRoZSBtb2RlIHdpdGggdGhlCj4gcmVxdWVzdGVkIFBNTEVOIGlzIHVuc3VwcG9ydGVkIGJ5
IHRoZSBoYXJkd2FyZS4KPgo+IEZpeGVzOiBhYTA0ZDEzMWI4OGIgKCJSSVNDLVY6IEtWTTogQWRk
IHN1cHBvcnQgZm9yIFNCSV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTiIpCj4gU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4g
SSBzYXcgdGhhdCB0aGUgUkZDIHZlcnNpb24gb2YgdGhpcyBwYXRjaCBhbHJlYWR5IG1hZGUgaXQg
aW50bwo+IHJpc2N2X2t2bV9xdWV1ZSwgYnV0IGl0IG5lZWRzIGFuIHVwZGF0ZSBmb3IgcmF0aWZp
ZWQgU0JJIDMuMC4gRmVlbCBmcmVlCj4gdG8gc3F1YXNoIHRoaXMgaW50byB0aGUgb3JpZ2luYWwg
Y29tbWl0LCBvciBJIGNhbiBzZW5kIGEgcmVwbGFjZW1lbnQgdjIKPiBwYXRjaCBpZiB5b3UgcHJl
ZmVyLgoKU2luY2UgdGhpcyBpcyBmaXhpbmcgYSBjb21taXQgaW4gcmlzY3Zfa3ZtX3F1ZXVlLCBJ
IGhhdmUgc3F1YXNoZWQgdGhpcwpwYXRjaCBpbnRvIHRoZSByZXNwZWN0aXZlIGNvbW1pdCBhbG9u
ZyB3aXRoIERyZXcncyBSZXZpZXdlZC1ieS4KClRoYW5rcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCAxNyArKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMKPiBpbmRleCBjYWNiM2Q0NDEwYTU0Li42MmNjOWMzZDU3NTk5IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX2Z3ZnQuYwo+IEBAIC0xNjAsMTQgKzE2MCwyMyBAQCBzdGF0aWMgbG9uZyBrdm1fc2Jp
X2Z3ZnRfc2V0X3BvaW50ZXJfbWFza2luZ19wbWxlbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4g
ICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0ICpmd2Z0ID0gdmNwdV90b19md2Z0KHZjcHUpOwo+
ICAgICAgICAgdW5zaWduZWQgbG9uZyBwbW07Cj4KPiAtICAgICAgIGlmICh2YWx1ZSA9PSAwKQo+
ICsgICAgICAgc3dpdGNoICh2YWx1ZSkgewo+ICsgICAgICAgY2FzZSAwOgo+ICAgICAgICAgICAg
ICAgICBwbW0gPSBFTlZDRkdfUE1NX1BNTEVOXzA7Cj4gLSAgICAgICBlbHNlIGlmICh2YWx1ZSA8
PSA3ICYmIGZ3ZnQtPmhhdmVfdnNfcG1sZW5fNykKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICBjYXNlIDc6Cj4gKyAgICAgICAgICAgICAgIGlmICghZndmdC0+aGF2ZV92c19wbWxl
bl83KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFS
QU07Cj4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19QTU1fUE1MRU5fNzsKPiAtICAgICAg
IGVsc2UgaWYgKHZhbHVlIDw9IDE2ICYmIGZ3ZnQtPmhhdmVfdnNfcG1sZW5fMTYpCj4gKyAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSAxNjoKPiArICAgICAgICAgICAgICAgaWYg
KCFmd2Z0LT5oYXZlX3ZzX3BtbGVuXzE2KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19Q
TU1fUE1MRU5fMTY7Cj4gLSAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsg
ICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9Q
QVJBTTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyAmPSB+
RU5WQ0ZHX1BNTTsKPiAgICAgICAgIHZjcHUtPmFyY2guY2ZnLmhlbnZjZmcgfD0gcG1tOwo+IC0t
Cj4gMi40Ny4yCj4KPiBiYXNlLWNvbW1pdDogNzgzNWI4OTJkMWQ5ZjUyZmI2MTUzNzc1N2FhNDQ2
ZmI0NDk4NDIxNQo+IGJyYW5jaDogdXAva3ZtLWZ3ZnQtcG1sZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
