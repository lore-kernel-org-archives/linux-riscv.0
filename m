Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849A0EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCYsz9kbBjkGXtEkr0fU/ce1aJy8J8s+P1wQbKqXMQQ=; b=rHd+dWebHtRVw7
	IefuGNDOwbLxdDIf+uqdZ3OeMJqYQ5LpaQ0vU7BjIPJWta6NTD07MIuyllVmeoe7efcYz9BzlYJv6
	9NNLyW8uQXGgXyNyPtnwdqQZNlQMRFKL3oNIFQgqReUIBLK8UyRU5C0CE6VN5Yza+jYYqDgliUo6x
	Su1/JHjvM3icUAgwNkxcEGbsEnWZw5zbdZ0nCWFwbW0Rcf5VOHyCmNhSf4id8G3bZJENruOtr3t/Z
	A/IHwttEmVyqQ6MLXSuLpp+SRkq8NxWDWTe9qKWhHOh9TlfeBHEWSgVTDR/Wyo4Je3XCIFTIoO93D
	rPqE1G5cHc4AKl8iacig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWTE-008em8-1G;
	Sun, 25 Jun 2023 20:36:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWTA-008eky-3D
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 20:36:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31297125334so2136896f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 13:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687725383; x=1690317383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1QCxq2dS3A9zFHU0ctTjyuMeOoqHJBwt33K34S6GLs=;
        b=qDpWQG7/8gfvwva5nS8MBjW5kZT5z5d5g30QsNzoeLw3jdpHpmI7FldH+fNSwEUT11
         e/tp2C+Gnry2QtaoObwowWMRQoLd+K0kBk/2IuFav45hYSctyKKDkz/79qIUPk53XO7f
         41+3vtDJik1QXiWjNPlBCtUWI+f3ByK/KkKHdonPOioAQjEu058EUo7Cbobkh74j+rtE
         2+sVlRrM4yramIiq5HL20gjd2hWfAdT9Evb4+mEgxer9cMKeB2qa2y9wnwNylE1p24hr
         IsdsipkiR+vlTKXxf6kfpybXr7jhjs59tg76vxFbAHh25ibiHmk/m/jDT1dOCd1XSoFu
         KQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687725383; x=1690317383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1QCxq2dS3A9zFHU0ctTjyuMeOoqHJBwt33K34S6GLs=;
        b=bEoSpYpXuLsgMj7+JjIvqdpUa/PK8ueP1/TtsU0nNMKgOC4pPlAhl7qBBFjF9DhlH9
         FeGYYRI7/rPv3YarYWK/ByCQhBE4DUalQTLiIg41myx/l5qeeWgC+GjdXzfBLzVibb6O
         Lx4UroCJw0xxZ9RwvGyuCrSRYTlnrrVVphobNkuppFmHD1paI2pg/413Q3Lei9fFDn39
         M0jUiJbUKkiXi+1sjnJh8UcnuT5GViI2SeAGp+IsKe+yRr4I9Ylkkb2g9pHSFlXBElRb
         OzGGBoAEf451mUy75YzcyeEccZ/Y3Nplx7oCZVn73Wr288Quy0/FqkUlhF74qn6dAwJM
         F+ng==
X-Gm-Message-State: AC+VfDyy+zX9nDKR4iZ+ay2/+51ZD2vXyD4DvF3uJSvMnQ3xfo1gCoBW
	zEy0BDErvaEZ2bIHdhuJ13pVwBUwyD7Ja6Z/Jhi0HA==
X-Google-Smtp-Source: ACHHUZ64p9n/gQ4cEcP/GRL/TzccMkjLQQFYw4orjcfuoDJUzO0/9AprWI0Ofwdd4UQdovW4AvDwmtQwv5jpqsruS14=
X-Received: by 2002:adf:e5c7:0:b0:30a:e3bb:ba8b with SMTP id
 a7-20020adfe5c7000000b0030ae3bbba8bmr29849132wrn.29.1687725382689; Sun, 25
 Jun 2023 13:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Sun, 25 Jun 2023 22:36:11 +0200
Message-ID: <CAHVXubgJcGPq_uC6iJCLTys5J6Ooa1EYcfOhBjEQwYfd+baWxw@mail.gmail.com>
Subject: Re: [PATCH V1 0/3] Revert huge-paged linear mapping and its related fixups
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	robh+dt@kernel.org, frowand.list@gmail.com, ajones@ventanamicro.com, 
	mpe@ellerman.id.au, arnd@arndb.de, rppt@kernel.org, samuel@sholland.org, 
	panqinglin2020@iscas.ac.cn, conor.dooley@microchip.com, anup@brainfault.org, 
	xianting.tian@linux.alibaba.com, anshuman.khandual@arm.com, heiko@sntech.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_133625_298515_FBC52AE7 
X-CRM114-Status: GOOD (  22.67  )
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

SGkgU29uZywKCk9uIFN1biwgSnVuIDI1LCAyMDIzIGF0IDQ6MTDigK9QTSBTb25nIFNodWFpIDxz
b25nc2h1YWlzaHVhaUB0aW55bGFiLm9yZz4gd3JvdGU6Cj4KPiBXZSBoYXZlIGVuY291bnRlcmVk
IHRoZXNlIHR3byBpc3N1ZXMgYWJvdXQgaHVnZS1wYWdlZCBsaW5lYXIgbWFwcGluZyBzaW5jZSB2
Ni40LXJjMToKPgo+IDEuIEJ1ZyByZXBvcnQ6IGtlcm5lbCBwYW5pY2VkIHdoZW4gc3lzdGVtIGhp
YmVybmF0ZXNbMV0KPgo+IE9wZW5TYmkgW3YwLjgsdjEuMykgc2V0IHRoZSBQTVAgcmVnaW9ucyBh
cyAhbm8tbWFwLCBhbmQgdGhlIGNvbW1pdCAzMzM1MDY4Zjg3MjEKPiAoInJpc2N2OiBVc2UgUFVE
L1A0RC9QR0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpIG1hcHBlZCB0aGVtIGluIGxp
bmVhciBtYXBwaW5nLgo+IFRoZSBoaWJlcm5hdGlvbiBwcm9jZXNzIGF0dGVtcHRlZCB0byBzYXZl
L3Jlc3RvcmUgdGhlc2UgbWFwcGVkIHJlZ2lvbnMgcmVzdWx0aW5nIGluIGFjY2VzcyBmYXVsdC4K
Pgo+IFRoaXMgaXNzdWUgd2FzIHRlbXBvcmFyaWx5IGZpeGVkIGJ5IGNvbW1pdCBlZDMwOWNlNTIy
MTggKCJSSVNDLVY6IG1hcmsgaGliZXJuYXRpb24gYXMgbm9ucG9ydGFibGUiKS4KPiBCdXQgYXMg
QWxleCdzIFJGQyBhbmQgUm9iJ3MgcmVzcG9uc2Ugc3RhdHMgaW4gYW5vdGhlciB0aHJlYWQgWzJd
ICwKPiAiSGliZXJuYXRpb24gaXMgb25seSBvbmUgY2FzZS4gU3BlY3VsYXRpdmUgYWNjZXNzZXMg
Y291bGQgYWxzbyBvY2N1ci4iCj4gU28gdGhpcyBmaXhpbmcgY29tbWl0IHNlZW1zIG5vdCB0aGUg
cGVyZmVjdCBhbnN3ZXIgdG8gdGhpcyBpc3N1ZS4KPgo+Cj4gMi4gQnVnIHJlcG9ydDoga2VybmVs
IHBhbmljZWQgd2hpbGUgYm9vdGluZyAod2l0aCBVRUZJIClbM10KPgo+IER1cmluZyB0aGUgYm9v
dGluZyB3aXRoIFVFRkksIFVFRkkgTWVtb3J5IE1hcHBpbmcgb3Zlcndyb3RlIHRoZSBtZW1ibG9j
ay4KPiBUaGUgcGh5c19yYW1fYmFzZSB3YXMgc2V0IGFzIHRoZSBlbmQgYWRkcmVzcyBvZiBtbW9k
ZXJlczAgKGxpa2UgMHg4MDA0MDAwMCBmb3IgMjU2IEtpQiBtbW9kZXJlczBAODAwMDAwMDApLAo+
IHdoaWNoIHJlc3VsdGVkIHRoZSBWQSBiYXNlZCBvbiAyTS1hbGlnbmVkIFBBIHdhcyBub3QgMk0t
YWxpZ25lZCB1c2luZyB2YV9wYV9vZmZzZXQKPiAoUEFHRV9PRkZTRVQgLSBwaHlzX3JhbV9iYXNl
KSB0byB0cmFuc2xhdGUuCj4KPiBUaGUgYmVzdF9tYXBfc2l6ZSgpIGZyb20gY29tbWl0IDMzMzUw
NjhmODcyMSBkaWRuJ3QgY2hlY2sgdGhlIHZpcnR1YWwgYWxpZ25tZW50Cj4gYmVmb3JlIGNob29z
aW5nIGEgbWFwIHNpemUuIGFuZCB0aGVuIGEgIlZBIGhvbGUiIHdhcyBjcmVhdGVkIHdoZXJlIHBh
Z2UgZmF1bHRzIGFsd2F5cyBvY2N1cnJlZC4KPgo+IFRoaXMgaXNzdWUgd2FzIGZpeGVkIGJ5IGNv
bW1pdCA0OWEwYTM3MzE1OTYgKCJyaXNjdjogQ2hlY2sgdGhlIHZpcnR1YWwgYWxpZ25tZW50IGJl
Zm9yZSBjaG9vc2luZyBhIG1hcCBzaXplIiksCj4gQnV0IHRoaXMgZml4aW5nIGNvbW1pdCBoYXMg
YSBzaWRlLWVmZmVjdCAoInRoZSBwb3NzaWJsZSB0aGlyZCBvbmUiIGFzIEFsZXggc2FpZCBpbiB0
aGlzIHRocmVhZCkuCj4gVGhlcmUgYXJlIG51bWVyb3VzIFBURSBhbGxvY2F0aW9ucyBzbG93aW5n
IGRvd24gdGhlIGJvb3QgdGltZSBhbmQgY29uc3VtaW5nIHNvbWUgc3lzdGVtIG1lbW9yeSB3aGVu
IFVFRkkgYm9vdGluZwo+IChOb3RlIHRoYXQgaXQncyBub3QgaW52b2x2ZWQgd2hlbiBib290aW5n
IGRpcmVjdGx5IHdpdGggT3BlblNiaSwgd2hlcmUgcGh5c19yYW1fYmFzZSBpcyB0aGUgMk0tYWxp
Z25lZCBiYXNlIG9mIERSQU0pLgo+Cj4gSW4gbXkgdGVzdCwgY29tcGFyZWQgd2l0aC9vdXQgcmV2
ZXJ0aW5nIGJvdGggY29tbWl0IDQ5YTBhMzczMTU5NiBhbmQgY29tbWl0IDMzMzUwNjhmODcyMSwK
PiBJIG11c3Qgd2FpdCB+MjBzIGZvciB0aGUgbGluZWFyIG1hcHBpbmcgY3JlYXRpb24gYW5kIG1l
bV9pbml0X3ByaW50X2luZm8oKSByZXBvcnRlZCB+OE0gZXh0cmEgcmVzZXJ2ZWQgbWVtb3J5LgoK
SW5kZWVkLCBwaHlzX3JhbV9iYXNlIGlzIG5vdCBhbGlnbmVkIG9uIGEgMk1CIGJvdW5kYXJ5IHdo
ZW4gYm9vdGluZwp3aXRoIEVESzIsIElJUkMgdGhhdCdzIGJlY2F1c2UgdGhlIGZpcnN0IGNodW5r
IG9mIG1lbW9yeSBhdAoweDgwMDBfMDAwMCBpcyBtYXJrZWQgYXMgVUMgYW5kIGlzIHRoZW4gY29t
cGxldGVseSBldmljdGVkLgoKPgo+IFRvIGVsaW1pbmF0ZSB0aGlzIHNpZGUtZWZmZWN0LCBXZSBz
aG91bGQgZmluZCBhIHdheSB0byBhbGlnbiBWQSBhbmQgUEEgb24gYSAyTUIgYm91bmRhcnkuCj4g
VGhlIHNpbXBsZXN0IHdheSBpcyByZXZlcnRpbmcgdGhlIGNvbW1pdCAzMzM1MDY4Zjg3MjEgKCJy
aXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBpbmciKS4KPgoK
SSBkaXNhZ3JlZSwgdGhlIHNpbXBsZXN0IHdheSBpcyB0byBhbGlnbiBwaHlzX3JhbV9iYXNlIG9u
IGEgMk1CCmJvdW5kYXJ5LCBlaXRoZXIgYnkgYWxpZ25pbmcgdG8gdGhlIHVwcGVyIGJvdW5kYXJ5
IChhbmQgdGhlbiB3YXN0ZXMKbWVtb3J5LCBsaWtlIHdlIHVzZWQgdG8pIG9yIGJ5IGFsaWduaW5n
IHRvIHRoZSBsb3dlciBib3VuZGFyeSAoYnV0IEkKd2FudCB0byBtYWtlIHN1cmUgaXQgd29ya3Mp
LgoKSSdsbCBjb21lIHVwIHdpdGggc29tZXRoaW5nIHRvbW9ycm93LgoKVGhhbmtzLAoKQWxleAoK
Pgo+Cj4gVXNpbmcgUFVEL1A0RC9QR0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyB0byBp
bXByb3ZlIHRoZSBwZXJmb3JtYW5jZSBpcyBtYXJnaW5hbCBmcm9tIGEgcmVjZW50IHRhbGsgWzRd
Cj4gZnJvbSBNaWtlIFJhcG9wb3J0LiBPcGVuU2JpIGhhZCBtYXJrZWQgYWxsIHRoZSBQTVAtcHJv
dGVjdGVkIHJlZ2lvbnMgYXMgIm5vLW1hcCIgWzVdIHRvIHByYWN0aWNlIHRoaXMgdGFsay4KPgo+
IEZvciBhbGwgdGhvc2UgcmVhc29ucywgbGV0J3MgcmV2ZXJ0IHRoZXNlIHJlbGF0ZWQgY29tbWl0
czoKPgo+IC0gY29tbWl0IDMzMzUwNjhmODcyMSAoInJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFn
ZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpCj4gLSBjb21taXQgNDlhMGEzNzMxNTk2ICgicmlz
Y3Y6IENoZWNrIHRoZSB2aXJ0dWFsIGFsaWdubWVudCBiZWZvcmUgY2hvb3NpbmcgYSBtYXAgc2l6
ZSIpCj4gLSBjb21taXQgZWQzMDljZTUyMjE4ICgiUklTQy1WOiBtYXJrIGhpYmVybmF0aW9uIGFz
IG5vbnBvcnRhYmxlIikKPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvQ0FBWXMyPWdRdmtoVGVpb01tcVJEVkdqZHRORl92aEIrdm1fMWRISnhQTmk3NVlEUV9RQG1h
aWwuZ21haWwuY29tLwo+IFsyXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2VybmVs
LzIwMjMwNTMwMDgwNDI1LjE4NjEyLTEtYWxleGdoaXRpQHJpdm9zaW5jLmNvbS8KPiBbM106IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L3RlbmNlbnRfN0MzQjU4MEI0N0MxQjE3
QzE2NDg4RUMxQHFxLmNvbS8KPiBbNF06IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy85MzE0MDYv
Cj4gWzVdOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL29wZW5zYmkvY29t
bWl0LzgxNTNiMjYyMmIwODgwMmNjNTQyZjMwYTFmY2JhNDA3YTU2NjdhYjkKPgo+IFNvbmcgU2h1
YWkgKDMpOgo+ICAgUmV2ZXJ0ICJSSVNDLVY6IG1hcmsgaGliZXJuYXRpb24gYXMgbm9ucG9ydGFi
bGUiCj4gICBSZXZlcnQgInJpc2N2OiBDaGVjayB0aGUgdmlydHVhbCBhbGlnbm1lbnQgYmVmb3Jl
IGNob29zaW5nIGEgbWFwIHNpemUiCj4gICBSZXZlcnQgInJpc2N2OiBVc2UgUFVEL1A0RC9QR0Qg
cGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIKPgo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAg
ICAgICAgICB8ICA1ICstLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggfCAxNiAt
LS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgIHwgNDMgKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9tbS9waHlzYWRkci5j
ICAgICAgfCAxNiAtLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvb2YvZmR0LmMgICAgICAgICAgICAg
IHwgMTEgKysrKy0tLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNzcg
ZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
