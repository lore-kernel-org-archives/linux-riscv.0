Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D7CEFCD93
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YGQxhqc1M58O+9urZJuPQALxZMuWecwV0MsFz5KhWQ=; b=Lw6xK0uHDXlsS9
	6tdkwnZZ99XwkZrtO5/hW5WP+owCDRgZBpBO8jmArWAUMiR+G2yp8H6UzvjFWWCgiInE84WGaI4Yk
	IOl2HDBHVEO3z32kf2zW/thUqhfvUCQgAykmBMUEiN3g5GDkHcFZ5N6wd0oBnq/y+TBNtCoFtU3Sv
	9XP53+nAbnzyLm0fQsw3RogH5ShxuKLOSLhKR7VziYB3LwU2RHkvnnSKeVqSCdmBxhqhgOIuPenuS
	R7BmmFDn2j0glQCsMVqCkNOzdNmRy292ht4JLWJMDRiwfHkm8mGroh79Yz99OtstU7hHaZdnDfg8j
	DFfF4KyyMcoVMs5VEYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXv1-000000076Lc-10Zi;
	Mon, 09 Mar 2026 10:32:59 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXuz-000000076Ko-0HrN
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 10:32:58 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-649278a69c5so9594981d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 03:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052375; cv=none;
        d=google.com; s=arc-20240605;
        b=RDfjKd2yzhD5pjfTIpGvl+H0Fe83x1BPZfX7dp1gl0iCUYrWRPcNzCYLljGI1ojS06
         w6WbGvD2y0uzH4gkZ5J8Mgj3A76CJBf+cWEczfOzTbVHfoKlCvbxXp/0nZ6MlZPZbM/a
         jTTCeo7L35Nzv7iXCEEa0PElPmgwRAgvUN/WQ18WoeupKv+RxPXYIyE6TLNpBI7UQT4/
         KQmNRnwmS2Ie6XdQhrxOggn6xfr/fqNb3kxwRu3nzKjem3HGSTb34jGFbdZV6CKWGStT
         tDr5LdRuK25GQMSkgvh+tn31Lv/e7KdoZJTQh7117sbCiyP/6PK7XWurgKP1UmrTJL6M
         y9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7R00jT9f/wF6nP47m5GBLd6PhCW+dAuP70evV4AQ3/g=;
        fh=ft0z5Rg0kpeafPh5nD84JDvJAm4ypdlmFs6mVmtea4Q=;
        b=VKLxjrHHeOyUSevdmsdFnZ7dWUnqPyq7lBhP4NJjl0HmnnfyDbB8kPFCYQMUxeDehW
         WYIHqrofVRdpuJ6GMadCFGl5hU2LMD256I56oEaJydFEjlYKvNxVJ05C25GCzKbEm+54
         AkHjqlxo3o69XwGVC/Hm6WXke9GWicyBCI4RYZugaP+whkhiwwOwN5HjZo4Y37H5Zfic
         6RVoeTlXdST53NDTukaYJSWRh3FetlcwGGs1xULaGpCjlFTTIWAzpAUd4zB14BXb8FcA
         zl5qKs2bTrGoiIC29fdN5PTFk6wnA7GmKtSilk2GHaK0Ml8x6IbFphHk0DzfedBvs2C1
         CtyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052375; x=1773657175; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7R00jT9f/wF6nP47m5GBLd6PhCW+dAuP70evV4AQ3/g=;
        b=SaFWJl1oRFX6kbLdFy4KcjuYPqqoUT5rRvx8o4uRynNfVsgB2eSL2TKjUu+jMX2yN6
         fNVRiDnfu/4b4VfQ7EQENWP6Ez/6P95rrGqhe+rk7xpGJ0FzqPYgyIhKvr7/M6cEL46w
         6cjQoT4PiWz/+PIOEu5oWWvjpteU36o6U4s4em69wbZS3kX1X5Va/mw25SvZzWN2kX6j
         DGcwpakdQXAG7RUQQHptBvZ7lK5Q0rItYoih2H9TDp2cepDjgpxL/CRglJIX0FAx/fmP
         HVIaDehk/CoWIEX4N0D/v4MxSPMQ+C4EJLi2gggGg8PenjqcHdGk7ejTb2BbpoUTNnZS
         v5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052375; x=1773657175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7R00jT9f/wF6nP47m5GBLd6PhCW+dAuP70evV4AQ3/g=;
        b=J3YtfeH8AFFZEvfATCUWpOm3dsQ6BuTlEu3sVDmGvBwqjCgb9+hbuTH0UlG/RqySg4
         bXfzQB9hoW8r3UpsZZ2g7tGJnt+rMx6Z1fjWTdIoYqIZSVXDNB2X58ME744rLH2X4xoB
         hW9otf4GvSZ5TSyGUDuRdSwvNGSAebFBO9uifZkcVFm8JZRk5J/wajCl5KHekG/X2Jzb
         FrO8e6u6xV14Uwzj4Ka1x+ZPjnemz3UrxOogSfPxGsd/syvB/ENcPfrwx4sX2y/wtmZV
         19DmBbMFsxsrWiuLot7fToTBz/V/F2dLNnDq2ycc9tQsrDy8e3wQHd8LEtam4e18EAkg
         +tKg==
X-Forwarded-Encrypted: i=1; AJvYcCWm1DJL0Vz5AZQfnEqqF4JOE3yNc48cWtIPifUoCYNt9J3cp7sOsKHdGYxqvZTZi8PTrq+n2FzzMYxTXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS1mthWyqEhuIL+SwxD3MYFoCIBJDnxoOT/G89ItgkA4R4RXxH
	iw11wvN4kBBct9OWY17gBTIKM/vR6CqI248UUytHQyQgQJwu6lAWIf5Z3HC8cdILmwfVzVbO7Mz
	ZXccnM3gBvPHVvupE/5ghj14V/b5QVDE=
X-Gm-Gg: ATEYQzxJObnplWIeUfva/vlSVZsew8IsFhpAfoEfNkHz2UgF6XtoCd27jqh788LrCfe
	siaU9WRv5zg7eRWtHnkPcfusvgjsWBzQMf1TTk8giVu46LM/88az1eeyUU+WM6qVC128l8R9X80
	4bBHbpakHOqbnyR4zXO1f8EZE1BCb/7/HuXQK9PHGJhlxjzsnkyyDy2QIcRrG0l6uh7A6RRp6Uk
	3LN6mxanPudDxpyzGwVbuodITUg3BigkSq1fEDfxucdIYcECTMf1VJM8HtllIan2enp5uXuNJRY
	CrsIYRw=
X-Received: by 2002:a53:ecd7:0:b0:640:dd02:a777 with SMTP id
 956f58d0204a3-64d142fedf4mr8471850d50.69.1773052375353; Mon, 09 Mar 2026
 03:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-2-89c219973c0c@gmail.com> <20260307022951-GKC302167@kernel.org>
In-Reply-To: <20260307022951-GKC302167@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 9 Mar 2026 11:32:44 +0100
X-Gm-Features: AaiRm50q4cIc_96jC1UTLpzV5oO0Bj-ABAK0PLIBWIjJCOYDycAu5o9P3q_6JjE
Message-ID: <CABdCQ=PWJKv9x-vXt1_jGgZK+XJzrY71PPECp2FttHrDjA_MYw@mail.gmail.com>
Subject: Re: [PATCH 02/10] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
To: Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_033257_157504_EC05053D 
X-CRM114-Status: GOOD (  20.15  )
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

RWwgc8OhYiwgNyBtYXIgMjAyNiBhIGxhcyAzOjI5LCBZaXh1biBMYW4gKDxkbGFuQGtlcm5lbC5v
cmc+KSBlc2NyaWJpw7M6Cj4KPiBIaSBJa2VyLAo+Cj4gT24gMTY6MTMgTW9uIDAyIE1hciAgICAg
LCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4gPiBFbnN1cmUgU0QgY2FyZCBwaW5zIHJlY2VpdmUgY2xv
Y2sgc2lnbmFscyBieSBlbmFibGluZyBwYWQgY2xvY2sKPiA+IGdlbmVyYXRpb24gYW5kIG92ZXJy
aWRpbmcgYXV0b21hdGljIGNsb2NrIGdhdGluZy4gUmVxdWlyZWQgZm9yIGFsbCBTRAo+ID4gb3Bl
cmF0aW9uIG1vZGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElrZXIgUGVkcm9zYSA8aWtlcnBl
ZHJvc2FtQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2Yt
azEuYyB8IDExICsrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jIGIv
ZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jCj4gPiBpbmRleCAwY2M5N2UyM2EyZjljN2Iy
ZjkzNzYzMThhOGE3ZWJiODYwNTcxNTA0Li5iNzAzYjc4MjgyZWQ4ZDg5MTgzYzgxNjQ3N2MxNDlj
MGE1NjU2MThhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5j
Cj4gPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKPiA+IEBAIC0yMCw2ICsy
MCwxMyBAQAo+ID4gICNpbmNsdWRlICJzZGhjaS5oIgo+ID4gICNpbmNsdWRlICJzZGhjaS1wbHRm
bS5oIgo+ID4KPiBbc25pcF0KPgo+ID4gKyAgICAgc3BhY2VtaXRfc2RoY2lfc2V0Yml0cyhob3N0
LCBTREhDX09WUlJEX0NMS19PRU4gfCBTREhDX0ZPUkNFX0NMS19PTiwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgU1BBQ0VNSVRfU0RIQ19PUF9FWFRfUkVHKTsKPiBBcyBJJ20gdGVz
dGluZyBvbiBCYW5hbmFwaSBGMyBib2FyZCB3aXRoIGVtbWMgY2hpcCwgdGhpcyBsaW5lIHdpbGwg
Y2F1c2UgdGltZW91dCBwcm9ibGVtCj4KPiBbICAgMjcuNjEzODA2XSBtbWMyOiBUaW1lb3V0IHdh
aXRpbmcgZm9yIGhhcmR3YXJlIGludGVycnVwdC4KPiBbICAgMjcuNjE2NTkyXSBtbWMyOiBzZGhj
aTogPT09PT09PT09PT09IFNESENJIFJFR0lTVEVSIERVTVAgPT09PT09PT09PT0KPiBbICAgMjcu
NjIzMDA3XSBtbWMyOiBzZGhjaTogU3lzIGFkZHI6ICAweDAwMDAwNDAwIHwgVmVyc2lvbjogIDB4
MDAwMDAwMDIKPiBbICAgMjcuNjI5NDI5XSBtbWMyOiBzZGhjaTogQmxrIHNpemU6ICAweDAwMDA3
MjAwIHwgQmxrIGNudDogIDB4MDAwMDAzYTYKPiBbICAgMjcuNjM1ODUzXSBtbWMyOiBzZGhjaTog
QXJndW1lbnQ6ICAweDAwMWNhMGEwIHwgVHJuIG1vZGU6IDB4MDAwMDAwMmIKPiBbICAgMjcuNjQy
Mjc3XSBtbWMyOiBzZGhjaTogUHJlc2VudDogICAweDAxZjcwMTA2IHwgSG9zdCBjdGw6IDB4MDAw
MDAwMzUKPiBbICAgMjcuNjQ4NzAwXSBtbWMyOiBzZGhjaTogUG93ZXI6ICAgICAweDAwMDAwMDBm
IHwgQmxrIGdhcDogIDB4MDAwMDAwMDAKPiBbICAgMjcuNjU1MTI0XSBtbWMyOiBzZGhjaTogV2Fr
ZS11cDogICAweDAwMDAwMDAwIHwgQ2xvY2s6ICAgIDB4MDAwMDAxMDcKPiBbICAgMjcuNjYxNTQ3
XSBtbWMyOiBzZGhjaTogVGltZW91dDogICAweDAwMDAwMDBlIHwgSW50IHN0YXQ6IDB4MDAwMDAw
MDAKPiBbICAgMjcuNjY3OTcxXSBtbWMyOiBzZGhjaTogSW50IGVuYWI6ICAweDAzZmYwMDBiIHwg
U2lnIGVuYWI6IDB4MDNmZjAwMGIKPiBbICAgMjcuNjc0Mzk0XSBtbWMyOiBzZGhjaTogQUNtZCBz
dGF0OiAweDAwMDAwMDAwIHwgU2xvdCBpbnQ6IDB4MDAwMDAwMDAKPiBbICAgMjcuNjgwODE4XSBt
bWMyOiBzZGhjaTogQ2FwczogICAgICAweDM1ZmMwMDgwIHwgQ2Fwc18xOiAgIDB4MDAwMDJmNzcK
PiBbICAgMjcuNjg3MjQxXSBtbWMyOiBzZGhjaTogQ21kOiAgICAgICAweDAwMDAxOTNhIHwgTWF4
IGN1cnI6IDB4MDAwMDAwMDAKPiBbICAgMjcuNjkzNjY2XSBtbWMyOiBzZGhjaTogUmVzcFswXTog
ICAweDAwMDAwOTAwIHwgUmVzcFsxXTogIDB4ZmZmNmRiZmYKPiBbICAgMjcuNzAwMDg4XSBtbWMy
OiBzZGhjaTogUmVzcFsyXTogICAweDMyMGY1OTAzIHwgUmVzcFszXTogIDB4MDAwMDA5MDAKPiBb
ICAgMjcuNzA2NTEzXSBtbWMyOiBzZGhjaTogSG9zdCBjdGwyOiAweDAwMDA0MDBkCj4gWyAgIDI3
LjcxMDk0MF0gbW1jMjogc2RoY2k6IEFETUEgRXJyOiAgMHgwMDAwMDAwMCB8IEFETUEgUHRyOiAw
eDAyMDgwMjA4Cj4gWyAgIDI3LjcxNzM2M10gbW1jMjogc2RoY2k6ID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBEcm9wIGl0IHdpbGwgbWFrZSBlbW1jIHdv
cmsgYWdhaW4uLiBidXQgSSdtIHN0aWxsIHVuYWJsZSB0byBtYWtlIFNEIGNhcmQgZHJpdmVyIHdv
cmssCj4gdGhhdCdzIHByb2JhYmx5IGFub3RoZXIgcHJvYmxlbQo+Cj4gSSd2ZSB0b29rIGEgbG9v
ayBhdCBjdXJyZW50IEszJ3Mgc2RoY2kgZHJpdmVyLCBhbGwgb3BlcmF0aW9ucyBvbiBTUEFDRU1J
VF9TREhDX09QX0VYVF9SRUcKPiByZWdpc3RlciBhcmUgdXNlZCBvbmx5IHdoZW4gZG9pbmcgdm9s
dGFnZSBzd2l0Y2ggd2l0aCBTRCBjYXJkLCBzbmlwIG9mIHRoZSBjb2RlIGZyb20gdmVuZG9yCj4K
PiAgICAgICAgIGlmIChob3N0LT5tbWMtPmNhcHMyICYgTU1DX0NBUDJfTk9fTU1DKSB7Cj4gICAg
ICAgICAgICAgICAgIC8qIHNkL3NkaW8gaGFzIG5vIHBoeSAqLwo+ICAgICAgICAgICAgICAgICBz
cGFjZW1pdF9zZGhjaV9zZXRiaXRzKGhvc3QsIFNESENfVFhfSU5UX0NMS19TRUwsIFNQQUNFTUlU
X1NESENfVFhfQ0ZHX1JFRyk7Cj4KPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAg
IC8qIHVzZSBwaHkgZnVuYyBtb2RlICovCj4gICAgICAgICAgICAgICAgIHNwYWNlbWl0X3NkaGNp
X3NldGJpdHMoaG9zdCwgU0RIQ19QSFlfRlVOQ19FTiB8IFNESENfUEhZX1BMTF9MT0NLLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNQQUNFTUlUX1NESENfUEhZX0NU
UkxfUkVHKTsKPiAgICAgICAgICAgICAgICAgc3BhY2VtaXRfc2RoY2lfY2xyc2V0Yml0cyhob3N0
LCBTREhDX1BIWV9EUklWRV9TRUwsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgU0RIQ19SWF9CSUFTX0NUUkwgfAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEZJRUxEX1BSRVAoU0RIQ19QSFlfRFJJVkVfU0VMLCA0KSwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTUEFDRU1JVF9TREhDX1BIWV9Q
QURDRkdfUkVHKTsKPiAgICAgICAgICAgICAgICAgLyogbW1jIGNhcmQgbW9kZSAqLwo+ICAgICAg
ICAgICAgICAgICBzcGFjZW1pdF9zZGhjaV9zZXRiaXRzKGhvc3QsIFNESENfTU1DX0NBUkRfTU9E
RSwgU1BBQ0VNSVRfU0RIQ19NTUNfQ1RSTF9SRUcpOwo+ICAgICAgICAgfQoKWW91IGFyZSByaWdo
dCwgU1BBQ0VNSVRfU0RIQ19PUF9FWFRfUkVHIHNob3VsZCBvbmx5IGJlIGNhbGxlZCBmb3IgU0Qg
Y2FyZHMKCj4KPiAtLQo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
