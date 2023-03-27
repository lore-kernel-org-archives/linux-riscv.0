Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CC5C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrr+0mXB+RIp/7XgQjcN4tsM8kub/aD1vSglgxkxYsk=; b=mb3tRJFBMkquLH
	4ET1Ar8eXxXb/o5bcidZS7rwaHN++3Cy0GxTeZsNybfz2hs4hcKPjoPeeoA6syCTNk/2J1UH1ObAe
	hAC9blPf5F2WcY1qfdC5QgLqhWbJVL0Z9mY0/fFSJbSh2PmX4GTrz+NnhYxfwD2Glg70ueA0i/uIy
	U9+9lE5pzTx3TlLp2Da5EOkq7GCtDWx/uJA245G8DQZIcurPNBGt/dQKCDzlQ1UKN33lFBDCQ6Mfa
	UirUSlpktWB3jsGBGf9muVjM0Q4q2Xc6n3xbUSTWLGZAjxuNpeAvdpjFnocdYkXxNMYcA0/6a30J/
	iaA9pHHU2ez5ke9YG9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglkR-00ArEn-1q;
	Mon, 27 Mar 2023 12:14:51 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglkH-00Ar6F-25
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 12:14:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t10so35144268edd.12
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1679919278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV7l9gwzS8uQDvU8ghGXWk1DwKUvHBE9MrpysU0Lhqw=;
        b=cCLCI0wMW6IRrmquuFwWgV0/AtgncU+z6G0YwRGCKcPihYxqfjtEUP9PZFwIrsmigW
         VtZxXoT3CsK5aVgrLkaFP04/rxndWu5A0D+zj2F/oXxRRqjL/9qL3tUwo4qqjxrboSLC
         hAhmnuNeQTYq5qv17YcKG32fYUexBlRjb1vDJI/bxNPFOIot+Xi95OHKx0W/+W0zm+Js
         UDYjhTCiiuhDCL2kWG2AMsnUOOVd/pgT15aMbQP7fuvK7zWzVONVaNdSmZPmNBYpplzk
         KmoKrfdQVBQg82RyQiyYtLhIZ5C2/y3PhA327LsJxffMNrzKHZlte7+NcO8wTOpj1h3+
         a+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679919278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV7l9gwzS8uQDvU8ghGXWk1DwKUvHBE9MrpysU0Lhqw=;
        b=yTSMvn9bMtpSLBBjANCNmknyLoH1W6Qda5UmRfcLZNsYj5I39prFmTFLY3dh9RVB2I
         wxfWMmyNVe6zL+bpyEWDScV1CnkzAwx/63IKg2p6fiLWvPKJO2ftL/DBgTeMcvNQgJPz
         9nf7VFvWUTY7DcVgDqGEkzLrfnqHZPrj+sdcvwdVZTUPz9IOAr2xXw76YoFSRozHGf3w
         ff0PIwGcm/1+UpWw1Gsw3LBtSAQUzDIQR1fUGibzW1JCqrgl2exQbC9d6l9sd0JeOK9i
         UmzDJPIy9c5oRp98v0E4gUErT4TuxksCycEkej/i2g7FLHHtxVlKY66JRRFTyslHKkB7
         d/ZA==
X-Gm-Message-State: AAQBX9dgz47LwvFvZo6AcoJwynzfEabC+9HP3cPXTPFBJc5wcwJc9kWu
	tcmNUvtX0C4BcdCTO97Pm3DNcavE9eG/zFFk+w5Au141q8qfknrJU+g=
X-Google-Smtp-Source: AKy350YoU2vC7aokDmLDWrPj3cpvgmucjwtQQi8VTcpal+Pl/zZwRYz8X50BsBIvSx7RUVyUkJ/fyLGgiTzEnTe0gn0=
X-Received: by 2002:a50:9fef:0:b0:4fc:2096:b15c with SMTP id
 c102-20020a509fef000000b004fc2096b15cmr5975228edf.1.1679919277773; Mon, 27
 Mar 2023 05:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230324155421.271544-1-alexghiti@rivosinc.com> <20230324155421.271544-3-alexghiti@rivosinc.com>
In-Reply-To: <20230324155421.271544-3-alexghiti@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Mar 2023 17:44:26 +0530
Message-ID: <CAAhSdy3fMm5gVASMqfs7qMdUp7omZG5tKSeDCxvDA1YALPDiTA@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] riscv: Move the linear mapping creation in its own function
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051441_693614_6A2DE8D3 
X-CRM114-Status: GOOD (  17.88  )
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgOToyNuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBObyBjaGFuZ2UgaW50ZW5kZWQsIGl0IGp1c3Qg
c3BsaXRzIHRoZSBsaW5lYXIgbWFwcGluZyBjcmVhdGlvbiBmcm9tCj4gc2V0dXBfdm1fZmluYWw6
IHRoaXMgcHJlcGFyZXMgZm9yIHVwY29taW5nIGFkZGl0aW9ucyB0byB0aGUgbGluZWFyCj4gbWFw
cGluZyBjcmVhdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgpUZXN0ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDQyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9t
bS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IGluZGV4IGNjNTU4ZDk0NTU5YS4uM2Iz
N2Q4NjA2OTIwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiBAQCAtMTA4NiwxNiArMTA4NiwyNSBAQCBhc21saW5rYWdlIHZv
aWQgX19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCj4gICAgICAgICBwdF9vcHNfc2V0
X2ZpeG1hcCgpOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3ZtX2ZpbmFsKHZv
aWQpCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2UocGh5
c19hZGRyX3Qgc3RhcnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwaHlzX2FkZHJfdCBlbmQpCj4gIHsKPiArICAgICAgIHBoeXNfYWRkcl90IHBhOwo+
ICAgICAgICAgdWludHB0cl90IHZhLCBtYXBfc2l6ZTsKPiAtICAgICAgIHBoeXNfYWRkcl90IHBh
LCBzdGFydCwgZW5kOwo+IC0gICAgICAgdTY0IGk7Cj4KPiAtICAgICAgIC8qIFNldHVwIHN3YXBw
ZXIgUEdEIGZvciBmaXhtYXAgKi8KPiAtICAgICAgIGNyZWF0ZV9wZ2RfbWFwcGluZyhzd2FwcGVy
X3BnX2RpciwgRklYQUREUl9TVEFSVCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBfX3Bh
X3N5bWJvbChmaXhtYXBfcGdkX25leHQpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIFBH
RElSX1NJWkUsIFBBR0VfVEFCTEUpOwo+ICsgICAgICAgZm9yIChwYSA9IHN0YXJ0OyBwYSA8IGVu
ZDsgcGEgKz0gbWFwX3NpemUpIHsKPiArICAgICAgICAgICAgICAgdmEgPSAodWludHB0cl90KV9f
dmEocGEpOwo+ICsgICAgICAgICAgICAgICBtYXBfc2l6ZSA9IGJlc3RfbWFwX3NpemUocGEsIGVu
ZCAtIHBhKTsKPiArCj4gKyAgICAgICAgICAgICAgIGNyZWF0ZV9wZ2RfbWFwcGluZyhzd2FwcGVy
X3BnX2RpciwgdmEsIHBhLCBtYXBfc2l6ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBncHJvdF9mcm9tX3ZhKHZhKSk7Cj4gKyAgICAgICB9Cj4gK30KPiArCj4gK3N0YXRp
YyB2b2lkIF9faW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdfcGFnZV90YWJsZSh2b2lkKQo+ICt7
Cj4gKyAgICAgICBwaHlzX2FkZHJfdCBzdGFydCwgZW5kOwo+ICsgICAgICAgdTY0IGk7Cj4KPiAg
ICAgICAgIC8qIE1hcCBhbGwgbWVtb3J5IGJhbmtzIGluIHRoZSBsaW5lYXIgbWFwcGluZyAqLwo+
ICAgICAgICAgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZzdGFydCwgJmVuZCkgewo+IEBAIC0xMTA3
LDE0ICsxMTE2LDE5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF92bV9maW5hbCh2b2lkKQo+
ICAgICAgICAgICAgICAgICBpZiAoZW5kID49IF9fcGEoUEFHRV9PRkZTRVQpICsgbWVtb3J5X2xp
bWl0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVuZCA9IF9fcGEoUEFHRV9PRkZTRVQpICsg
bWVtb3J5X2xpbWl0Owo+Cj4gLSAgICAgICAgICAgICAgIGZvciAocGEgPSBzdGFydDsgcGEgPCBl
bmQ7IHBhICs9IG1hcF9zaXplKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgdmEgPSAodWlu
dHB0cl90KV9fdmEocGEpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIG1hcF9zaXplID0gYmVz
dF9tYXBfc2l6ZShwYSwgZW5kIC0gcGEpOwo+IC0KPiAtICAgICAgICAgICAgICAgICAgICAgICBj
cmVhdGVfcGdkX21hcHBpbmcoc3dhcHBlcl9wZ19kaXIsIHZhLCBwYSwgbWFwX3NpemUsCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBncHJvdF9mcm9tX3ZhKHZh
KSk7Cj4gLSAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgY3JlYXRlX2xpbmVhcl9t
YXBwaW5nX3JhbmdlKHN0YXJ0LCBlbmQpOwo+ICAgICAgICAgfQo+ICt9Cj4gKwo+ICtzdGF0aWMg
dm9pZCBfX2luaXQgc2V0dXBfdm1fZmluYWwodm9pZCkKPiArewo+ICsgICAgICAgLyogU2V0dXAg
c3dhcHBlciBQR0QgZm9yIGZpeG1hcCAqLwo+ICsgICAgICAgY3JlYXRlX3BnZF9tYXBwaW5nKHN3
YXBwZXJfcGdfZGlyLCBGSVhBRERSX1NUQVJULAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
IF9fcGFfc3ltYm9sKGZpeG1hcF9wZ2RfbmV4dCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgUEdESVJfU0laRSwgUEFHRV9UQUJMRSk7Cj4gKwo+ICsgICAgICAgLyogTWFwIHRoZSBsaW5l
YXIgbWFwcGluZyAqLwo+ICsgICAgICAgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3BhZ2VfdGFibGUo
KTsKPgo+ICAgICAgICAgLyogTWFwIHRoZSBrZXJuZWwgKi8KPiAgICAgICAgIGlmIChJU19FTkFC
TEVEKENPTkZJR182NEJJVCkpCj4gLS0KPiAyLjM3LjIKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
