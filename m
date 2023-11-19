Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF63C072A2
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2dZZ0SlFbm/xyBO9nrJs5edsVJlkb7zStcUI+BT7CU=; b=1gRr53wUvK/ses
	zbB9jKOWmJbKjRvjOzlG9Q8ISGBvT1emXm9pNwz3lrjLkNyERqbzLx0VI/O6idMI0XHeaOWhL+7fa
	0XamZBxMtERt7f2OovhtttTb2STtGdjaU7Mp9yYLQcm0xwZE9r/ttknSH0QLj4jyTxjQibKTnZlxL
	Z5M7m2uPXc5sD8v39ZgNf5sOpNlsBDBZgRgHbS2//xGANZWq3nxqXplmuRerVdg8vrtbOLCETWdkq
	tsvYMjgInyOHfee1inarQHiynJWtvsqCRTj2VI4wE683FXV34eWt+jId2xUdC7rm4o6VsOPu0+5q/
	G8SHLtiF2DlDhX+vSwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4eQ0-009o0r-18;
	Sun, 19 Nov 2023 09:48:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4ePw-009o09-2h
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 09:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4A66DB80B6B
	for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 09:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA159C433D9
	for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700387317;
	bh=NjMYq6MXExBDl+vrWIECnV0UHI7pr37FEC8+gej0u7Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qwFZRBx3aGzsQHXpkNY9FSJTOkNMeUA9qJ51SEgGqqxx6gqWQEjzrpsbqlX3dCPZ3
	 SZ/XoypuTa1u293pvnms/mnlm0OXRD1yQWHaAW3uuP0aIblYwJ/BLsiAmUgMY4g3B9
	 +mNmvaRNv6TO2Ag2Xt/Q4K106fAQ81+ev03Zt0bPWPuK+7IW2Zu2aWXD/h7tS4VVgL
	 4EFb9TPJX8qbKLtnLO/08SZfNBw3uKnyMMjJkBmfPAx5ZAzuFgtmSjSjL4y8XjQcuG
	 2MXSxNARFs+Om8pTzWSe5DJ1cPKVPmGZ+Nt/4k/JF5sxmGmx+wWx1xN7t1CajfCq5B
	 wr+q4VBI6fGYg==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-58a01a9fad0so1725668eaf.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 01:48:37 -0800 (PST)
X-Gm-Message-State: AOJu0YwdIbfX9hxv/Pz8Oq8eZSQain7CPoqLebyKbbrxO90LZ1EyD8AU
	4l7ma/rAQsZxsu/aAzGU+5Gb808ahyS7uvbnxkI=
X-Google-Smtp-Source: AGHT+IE6z+tvXHg886wAuoJeQkv9GmDqBKixE2HKcHXdclxIDcR3F1pTaGC/sbGwRWTxFE+xaf9fwKPDcuprbmIbL+4=
X-Received: by 2002:a05:6808:7:b0:3b2:f335:63dc with SMTP id
 u7-20020a056808000700b003b2f33563dcmr4153063oic.23.1700387317182; Sun, 19 Nov
 2023 01:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20231119053737.2367955-1-masahiroy@kernel.org>
In-Reply-To: <20231119053737.2367955-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 Nov 2023 18:48:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNARb=gBLRuWiaviryMvVYWL0yF_OxdSKnMr7Gjt2s3J2hw@mail.gmail.com>
Message-ID: <CAK7LNARb=gBLRuWiaviryMvVYWL0yF_OxdSKnMr7Gjt2s3J2hw@mail.gmail.com>
Subject: Re: [PATCH] riscv: add dependency among Image(.gz), loader(.bin), and vmlinuz.efi
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Simon Glass <sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_014841_174494_9FE9DE86 
X-CRM114-Status: GOOD (  18.95  )
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

T24gU3VuLCBOb3YgMTksIDIwMjMgYXQgMjozN+KAr1BNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhp
cm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQSBjb21tb24gaXNzdWUgaW4gTWFrZWZpbGUgaXMg
YSByYWNlIGluIHBhcmFsbGVsIGJ1aWxkaW5nLgo+Cj4gWW91IG5lZWQgdG8gYmUgY2FyZWZ1bCB0
byBwcmV2ZW50IG11bHRpcGxlIHRocmVhZHMgZnJvbSB3cml0aW5nIHRvIHRoZQo+IHNhbWUgZmls
ZSBzaW11bHRhbmVvdXNseS4KPgo+IENvbW1pdCAzOTM5ZjMzNDUwNTAgKCJBUk06IDg0MTgvMTog
YWRkIGJvb3QgaW1hZ2UgZGVwZW5kZW5jaWVzIHRvIG5vdAo+IGdlbmVyYXRlIGludmFsaWQgaW1h
Z2VzIikgYWRkcmVzc2VkIHN1Y2ggYSBiYWQgc2NlbmFyaW8uCj4KPiBBIHNpbWlsYXIgc3ltcHRv
bSBvY2N1cnMgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6Cj4KPiAgICQgbWFrZSAtaiQobnBy
b2MpIEFSQ0g9cmlzY3YgSW1hZ2UgSW1hZ2UuZ3ogbG9hZGVyIGxvYWRlci5iaW4gdm1saW51ei5l
ZmkKPiAgICAgWyBzbmlwIF0KPiAgICAgU09SVFRBQiB2bWxpbnV4Cj4gICAgIE9CSkNPUFkgYXJj
aC9yaXNjdi9ib290L0ltYWdlCj4gICAgIE9CSkNPUFkgYXJjaC9yaXNjdi9ib290L0ltYWdlCj4g
ICAgIE9CSkNPUFkgYXJjaC9yaXNjdi9ib290L0ltYWdlCj4gICAgIE9CSkNPUFkgYXJjaC9yaXNj
di9ib290L0ltYWdlCj4gICAgIE9CSkNPUFkgYXJjaC9yaXNjdi9ib290L0ltYWdlCj4gICAgIEda
SVAgICAgYXJjaC9yaXNjdi9ib290L0ltYWdlLmd6Cj4gICAgIEFTICAgICAgYXJjaC9yaXNjdi9i
b290L2xvYWRlci5vCj4gICAgIEFTICAgICAgYXJjaC9yaXNjdi9ib290L2xvYWRlci5vCj4gICAg
IEtlcm5lbDogYXJjaC9yaXNjdi9ib290L0ltYWdlIGlzIHJlYWR5Cj4gICAgIFBBRCAgICAgYXJj
aC9yaXNjdi9ib290L3ZtbGludXguYmluCj4gICAgIEdaSVAgICAgYXJjaC9yaXNjdi9ib290L3Zt
bGludXoKPiAgICAgS2VybmVsOiBhcmNoL3Jpc2N2L2Jvb3QvbG9hZGVyIGlzIHJlYWR5Cj4gICAg
IE9CSkNPUFkgYXJjaC9yaXNjdi9ib290L2xvYWRlci5iaW4KPiAgICAgS2VybmVsOiBhcmNoL3Jp
c2N2L2Jvb3QvbG9hZGVyLmJpbiBpcyByZWFkeQo+ICAgICBLZXJuZWw6IGFyY2gvcmlzY3YvYm9v
dC9JbWFnZS5neiBpcyByZWFkeQo+ICAgICBPQkpDT1BZIGFyY2gvcmlzY3YvYm9vdC92bWxpbnV6
Lm8KPiAgICAgTEQgICAgICBhcmNoL3Jpc2N2L2Jvb3Qvdm1saW51ei5lZmkuZWxmCj4gICAgIE9C
SkNPUFkgYXJjaC9yaXNjdi9ib290L3ZtbGludXouZWZpCj4gICAgIEtlcm5lbDogYXJjaC9yaXNj
di9ib290L3ZtbGludXouZWZpIGlzIHJlYWR5Cj4KPiBUaGUgbG9nICJPQkpDT1BZIGFyY2gvYXJt
NjQvYm9vdC9JbWFnZSIgaXMgZGlzcGxheWVkIDUgdGltZXMuCgoKClRoaXMgc2hvdWxkIGJlICJP
QkpDT1BZIGFyY2gvcmlzY3YvYm9vdC9JbWFnZSIuCgoKSSBzdWJtaXR0ZWQgYSBzaW1pbGFyIHBh
dGNoIGZvciBhcm02NC4KCkkgY29weS1wYXN0ZWQgc29tZSBwYXJ0cyBvZiB0aGUgY29tbWl0IGRl
c2NyaXB0aW9uLAp0aGVuIG1pc3NlZCB0byBhZGp1c3QgaXQuCgoKCgoKCgoKCj4gKGFsc28gIkFT
ICAgICAgYXJjaC9yaXNjdi9ib290L2xvYWRlci5vIiB0d2ljZS4pCj4KPiBJdCBpbmRpY2F0ZXMg
dGhhdCA1IHRocmVhZHMgc2ltdWx0YW5lb3VzbHkgZW50ZXIgYXJjaC9yaXNjdi9ib290Lwo+IGFu
ZCB3cml0ZSB0byBhcmNoL3Jpc2N2L2Jvb3QvSW1hZ2UuCj4KPiBJdCBvY2Nhc2lvbmFsbHkgbGVh
ZHMgdG8gYSBidWlsZCBmYWlsdXJlOgo+Cj4gICAkIG1ha2UgLWokKG5wcm9jKSBBUkNIPXJpc2N2
IEltYWdlIEltYWdlLmd6IGxvYWRlciBsb2FkZXIuYmluIHZtbGludXouZWZpCj4gICAgIFsgc25p
cCBdCj4gICAgIFNPUlRUQUIgdm1saW51eAo+ICAgICBPQkpDT1BZIGFyY2gvcmlzY3YvYm9vdC9J
bWFnZQo+ICAgICBPQkpDT1BZIGFyY2gvcmlzY3YvYm9vdC9JbWFnZQo+ICAgICBPQkpDT1BZIGFy
Y2gvcmlzY3YvYm9vdC9JbWFnZQo+ICAgICBPQkpDT1BZIGFyY2gvcmlzY3YvYm9vdC9JbWFnZQo+
ICAgICBQQUQgICAgIGFyY2gvcmlzY3YvYm9vdC92bWxpbnV4LmJpbgo+ICAgdHJ1bmNhdGU6IElu
dmFsaWQgbnVtYmVyOiAnYXJjaC9yaXNjdi9ib290L3ZtbGludXguYmluJwo+ICAgbWFrZVsyXTog
KioqIFtkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL01ha2VmaWxlLnpib290OjEzOiBhcmNo
L3Jpc2N2L2Jvb3Qvdm1saW51eC5iaW5dIEVycm9yIDEKPiAgIG1ha2VbMl06ICoqKiBEZWxldGlu
ZyBmaWxlICdhcmNoL3Jpc2N2L2Jvb3Qvdm1saW51eC5iaW4nCj4gICBtYWtlWzFdOiAqKiogW2Fy
Y2gvcmlzY3YvTWFrZWZpbGU6MTY3OiB2bWxpbnV6LmVmaV0gRXJyb3IgMgo+ICAgbWFrZVsxXTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiAgICAgS2VybmVsOiBhcmNoL3Jp
c2N2L2Jvb3QvSW1hZ2UgaXMgcmVhZHkKPiAgICAgR1pJUCAgICBhcmNoL3Jpc2N2L2Jvb3QvSW1h
Z2UuZ3oKPiAgICAgQVMgICAgICBhcmNoL3Jpc2N2L2Jvb3QvbG9hZGVyLm8KPiAgICAgQVMgICAg
ICBhcmNoL3Jpc2N2L2Jvb3QvbG9hZGVyLm8KPiAgICAgS2VybmVsOiBhcmNoL3Jpc2N2L2Jvb3Qv
bG9hZGVyIGlzIHJlYWR5Cj4gICAgIE9CSkNPUFkgYXJjaC9yaXNjdi9ib290L2xvYWRlci5iaW4K
PiAgICAgS2VybmVsOiBhcmNoL3Jpc2N2L2Jvb3QvbG9hZGVyLmJpbiBpcyByZWFkeQo+ICAgICBL
ZXJuZWw6IGFyY2gvcmlzY3YvYm9vdC9JbWFnZS5neiBpcyByZWFkeQo+ICAgbWFrZTogKioqIFtN
YWtlZmlsZToyMzQ6IF9fc3ViLW1ha2VdIEVycm9yIDIKPgo+IEltYWdlLmd6LCBsb2FkZXIsIHZt
bGludXouZWZpIGRlcGVuZCBvbiBJbWFnZS4gbG9hZGVyLmJpbiBkZXBlbmRzCj4gb24gbG9hZGVy
LiBTdWNoIGRlcGVuZGVuY2llcyBhcmUgbm90IHNwZWNpZmllZCBpbiBhcmNoL3Jpc2N2L01ha2Vm
aWxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVs
Lm9yZz4KPiAtLS0KPgo+ICBhcmNoL3Jpc2N2L01ha2VmaWxlIHwgMiArKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmls
ZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiBpbmRleCA1Y2JlNTk2MzQ1YzEuLjFkNmVkMjdlMGEy
YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9N
YWtlZmlsZQo+IEBAIC0xNjMsNiArMTYzLDggQEAgQk9PVF9UQVJHRVRTIDo9IEltYWdlIEltYWdl
Lmd6IGxvYWRlciBsb2FkZXIuYmluIHhpcEltYWdlIHZtbGludXouZWZpCj4KPiAgYWxsOiAgICQo
bm90ZGlyICQoS0JVSUxEX0lNQUdFKSkKPgo+ICtsb2FkZXIuYmluOiBsb2FkZXIKPiArSW1hZ2Uu
Z3ogbG9hZGVyIHZtbGludXouZWZpOiBJbWFnZQo+ICAkKEJPT1RfVEFSR0VUUyk6IHZtbGludXgK
PiAgICAgICAgICQoUSkkKE1BS0UpICQoYnVpbGQpPSQoYm9vdCkgJChib290KS8kQAo+ICAgICAg
ICAgQCQoa2VjaG8pICcgIEtlcm5lbDogJChib290KS8kQCBpcyByZWFkeScKPiAtLQo+IDIuNDAu
MQo+CgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
