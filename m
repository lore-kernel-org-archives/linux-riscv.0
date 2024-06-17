Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFD1C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OirOSOVFSEhl5wRu+7oJcZpNhODwkO1WwQ6BrlizH9M=; b=u5oOSJB1P+HMIT
	L5wDt0aMFfK66rNgjyquaMj+BVfYu20GccQplj3HzDShkmn5gpI52rjgzJuF9mfIzGKZlT4C2KMPr
	nLusxH0DQVtFGWXGA+40CkgwtRvKDWLvvfF34NfY7ArhsxtK8IB/Y0Jxj2O/Z8Q5KOw/xpxn7Nb1d
	CS5gw5XZNGH2uLG1pBB+ARqj2BUQ/mTcLKp9ggj8h4/Q+Wu3wTj1NaGuvVMVh6OcQvxc2X//Nz1WH
	ZiBU0eBmXek8tTQc6ybPj4UBTbjfXU7vd+NBNdv2fq7Bc+TZDJNtRBO36vou4Eg9nga8uhWgR7ICr
	FjkEPbOeGz3LIl8IlaHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBy4-0000000Ajid-2obb;
	Mon, 17 Jun 2024 13:00:16 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBy1-0000000AjgZ-2ZF4
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:00:15 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-254d001d03dso2057814fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718629208; x=1719234008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46zSmqD3K+3c/eVUF/duMfr7ptrzqcpK4Q9s/Mtw+rI=;
        b=hiNQvaVxoXzgkZTQzVdid8lqL0Bq6U2lvNNFAb7fS4BDYtoDx6NLxz7DFZkilsA3tc
         YrVYjexg6XbT4hVsWcJForc/F0N7XzFXkBN/yv1UYWarrjyN3am1rZYw2+sFUq33RKNs
         KE0pEh5BCeZzELmjkJmqkrgrv2g/MRaDsiGCymwG7IJt8p0B613NgVYEtd148h7jS6df
         6bAv+pk9ASR+d8QkI0itd7af2JZUdsH4gclCWn6UVlOIzHAEObSgObMCNkN8oIePp20V
         e/NHEgnsr2/DdYOBN4Ln5ddPcxiAnLbmnkMGfFj5oANPmcKmUvVotV9vU2AYxppckoLo
         rGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629208; x=1719234008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46zSmqD3K+3c/eVUF/duMfr7ptrzqcpK4Q9s/Mtw+rI=;
        b=jEdFsEgONKV3eFl2WY+vA9MF/UXAeknYcMp9OJWn72CUZX7DzVsvfmsq03m69E2WSa
         rVZ2KY/Zwa0v9FVIjfCwCC9DYbqDuo98m2HQxdXHjDKGl4g/e83jCiIk2jgp6VT3nmcx
         r8+PJzl8NumZZBAaplqYeEkrRDRUisW0zBRaUUlFUJc5voY7MiKYL1h6SG082WTnfbyh
         XKdI9n1LBaN4j7RPuu7Ho+6kMPhhUJ9ppkikUwgd1fhGRIFpULbC7RHjUbYWOcjZQ1i2
         kWHMVnvngfoej/iAG+WXP13jChy4G7ByddKGl8Cqdw5LoNrTVK0AUuxAZ3gM4EBBIoIe
         yLCA==
X-Forwarded-Encrypted: i=1; AJvYcCWeWC/RadTgGRH8dx1XxSs2+HNWyGIckw5DmOMYUDj24C3jHB8Q10q4Nysm+xYlzrLmN/aLsYjrX1KWkX5rpMECUgSch3WvI9/Do7UZk7qr
X-Gm-Message-State: AOJu0Ywx8gznSzCwzyDeDXjAUu6eBiBBX860lwjT9swE9RPNSqbSwKje
	idVG1j8BdJfwM6PPkSPyL2nR4AXphW1pYjaIOcqysLwOOi7ySAIUfSf2TS8jJOBfB5+WxW/neRS
	mCpNuvBoG8azgwGkSZKZ6X6cBs/htdJzdvrQPJw==
X-Google-Smtp-Source: AGHT+IHsNyUY/qarXvooq9ynIKp95jpjsz6YkpPDRb/NSBM/IJmvJSy6eAGghbyK8AYhLF+R8aQIRjyQLfKHpRcsUbs=
X-Received: by 2002:a05:6870:718a:b0:24f:dad3:97c with SMTP id
 586e51a60fabf-25842b1e8e7mr10850521fac.46.1718629208466; Mon, 17 Jun 2024
 06:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240523111322.19243-1-cuiyunhui@bytedance.com>
 <20240523111322.19243-3-cuiyunhui@bytedance.com> <CAEEQ3wnE+8FXXf76zapqNnC5vruoR9C-y0qjjFw47cHYP57MmQ@mail.gmail.com>
 <CAEEQ3w==wueTSDvEtJe+t7jamH2ERxta4uPLUFVwX2ueRLJ3Bw@mail.gmail.com> <ZmLohXMgGrIvL7s7@sunil-laptop>
In-Reply-To: <ZmLohXMgGrIvL7s7@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 17 Jun 2024 20:59:57 +0800
Message-ID: <CAEEQ3wkCkvNMd5QKcZkvxygoJ2HK+g=cQqag0re+HkE9R2Y4sA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND v5 3/3] RISC-V: Select ACPI PPTT drivers
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jeremy.linton@arm.com, Jonathan.Cameron@huawei.com, 
	pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_060013_982913_6B3B571C 
X-CRM114-Status: GOOD (  19.59  )
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

SGkgU3VuaWwsCgpPbiBGcmksIEp1biA3LCAyMDI0IGF0IDc6MDHigK9QTSBTdW5pbCBWIEwgPHN1
bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBIaSBZdW5odWksCj4KPiBPbiBGcmks
IEp1biAwNywgMjAyNCBhdCAwNDo0NDozNlBNICswODAwLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4g
SGkgU3VuaWx2bCwKPiA+Cj4gPgo+ID4gT24gTW9uLCBNYXkgMjcsIDIwMjQgYXQgODo1MeKAr1BN
IHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
SGkgUGFsbWVyLAo+ID4gPgo+ID4gPiBHZW50bGUgcGluZyAuLi4KPiA+ID4KPiA+ID4gT24gVGh1
LCBNYXkgMjMsIDIwMjQgYXQgNzoxM+KAr1BNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEFmdGVyIGFkZGluZyBBQ1BJIHN1cHBvcnQg
dG8gcG9wdWxhdGVfY2FjaGVfbGVhdmVzKCksIFJJU0MtViBjYW4gYnVpbGQKPiA+ID4gPiBjYWNo
ZWluZm8gdGhyb3VnaCB0aGUgQUNQSSBQUFRUIHRhYmxlLCB0aHVzIGVuYWJsaW5nIHRoZSBBQ1BJ
X1BQVFQKPiA+ID4gPiBjb25maWd1cmF0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQt
Ynk6IEplcmVteSBMaW50b24gPGplcmVteS5saW50b25AYXJtLmNvbT4KPiA+ID4gPiBSZXZpZXdl
ZC1ieTogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+ID4gPiAtLS0KPiA+
ID4gPiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2Nv
bmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiA+IGluZGV4IGY5NjE0NDljYTA3Ny4uYTll
YmVjZDcyMDUyIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiA+
ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiA+IEBAIC0xNCw2ICsxNCw3IEBAIGNvbmZp
ZyBSSVNDVgo+ID4gPiA+ICAgICAgICAgZGVmX2Jvb2wgeQo+ID4gPiA+ICAgICAgICAgc2VsZWN0
IEFDUElfR0VORVJJQ19HU0kgaWYgQUNQSQo+ID4gPiA+ICAgICAgICAgc2VsZWN0IEFDUElfUkVE
VUNFRF9IQVJEV0FSRV9PTkxZIGlmIEFDUEkKPiA+ID4gPiArICAgICAgIHNlbGVjdCBBQ1BJX1BQ
VFQgaWYgQUNQSQo+IE5JVDogSSB3b3VsZCBhZGQgdGhpcyBwcmlvciB0byBBQ1BJX1JFRFVDRURf
SEFSRFdBUkVfT05MWS4KCk9rYXksIEkgd2lsbCB1cGRhdGUgaXQgb24gdjYuCgo+Cj4gPiA+ID4g
ICAgICAgICBzZWxlY3QgQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVAo+ID4gPiA+ICAgICAgICAg
c2VsZWN0IEFSQ0hfRU5BQkxFX0hVR0VQQUdFX01JR1JBVElPTiBpZiBIVUdFVExCX1BBR0UgJiYg
TUlHUkFUSU9OCj4gPiA+ID4gICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfU1BMSVRfUE1EX1BU
TE9DSyBpZiBQR1RBQkxFX0xFVkVMUyA+IDIKPiA+ID4gPiAtLQo+ID4gPiA+IDIuMjAuMQo+ID4g
PiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gWXVuaHVpCj4gPgo+ID4gQ291bGQgeW91IHBs
ZWFzZSByZXZpZXcgb3IgYWNrIHRoaXMgcGF0Y2hzZXQgYWdhaW4/IFBhbG1lciBkaWQgbm90IHJl
c3BvbmQuCj4gPgo+ID4gTGluazoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjQwNTIzMTExMzIyLjE5MjQzLTMtY3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20vVC8KPiA+
Cj4gTXkgYmFkLCBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IEkgaGFkIEFja2VkIGFs
cmVhZHkuIFRoZSBzZXJpZXMKPiBsb29rcyBnb29kIHRvIG1lIGV4Y2VwdCB0aGUgbml0IGFib3Zl
Lgo+Cj4gUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+
Cj4gVGhhbmtzLAo+IFN1bmlsCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
