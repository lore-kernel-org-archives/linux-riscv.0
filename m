Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04AEC678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JMjahm5WNeu6+UIBPxiUuVeq/oDjdzlSTiZf5t889k=; b=sfbE59gdBCgJ/e
	5z9xrB4okS8LCgsvpeYpnlY4Ba9KOL1daCMpNLENO7qiL2vfHCKSCdmZz+h+gtVGYk+EqnyGe/uHl
	XIJr1lkHN6/9KlsF6BKZG1KCyzd0xesD6Gh5JyoNgptBtFZred/wjNz/LxisnXYcZ9Y0YtYJo3J9l
	ehvaC07Ctvag4Pk9D97sD6HIhaWgI4Dz6HS/J2cy0FKV3Fusn0QfL3N/TZUMp2+AQ+vCRSP1GXDDP
	xW3slHDz7+N7Ax5GpiPWnGNpfjPABe1TMMjyMba9V4kQZjRucwcwIinZRz03eDhpFgvYyexvAFyDK
	uBFIXaUU3lfQTyQbSEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXMO-000OD0-68; Tue, 07 Mar 2023 13:28:08 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXDd-000K5F-M5
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 13:19:07 +0000
Received: by mail-vs1-xe33.google.com with SMTP id d7so12283055vsj.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 05:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678195142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5m6abGkwWanCk5tXnPK6IBB9qAUGfHHMPcuCUbVfTg=;
        b=gjxhQLjQyHjyXYHITiaCxJgBBBmqGHoGtpr7wyBx1Cy0wfs9oziMmE515Uub30S448
         kiBn91qGIrMCaNIs/yxuLLERhmXOUiykPqp1T2NfSdiz+lQS9E17XhLTfCfA0tf0reyb
         OXh1Z2CsBRnxD/kWLZIIaEFdwm1BItg8KiRnH26FQ+wWnMwu23u3KcR/1BAhNDXo9Ql3
         fgRSjZYQD+C34g4cg4YJlH1XJXm39TXOIJ6vHM8LTLTxOtqZiC4DH6TBJmpHFqIa/IJY
         O3tIuPuB0zQGPLIXg7rpi/63lwHngjsRIk4LtYo73bc/2BfzXMy65EJ3Lc3kdTBLmBLR
         /AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5m6abGkwWanCk5tXnPK6IBB9qAUGfHHMPcuCUbVfTg=;
        b=s/kiOzLNQf3vYksZsjEK+9gRZuivWYCpkarYG758qsiIRNtNu+HPtBZmp+G7w+PK/K
         YqCtCpTVz5bu5GghU2AXiOk3w2HrF8Tks7rAmXteqP3BYb3rEG9FjqrJjnQht8+Gi/rY
         HvmALSg3NzlRXIdHVtG9OQXwNpcNvzCvVq+U+WoA/1tqYZS+np27iKrgXh0VrxkJo3jx
         78e+vk30Us3i5393aiDABrxY3U/zbx6+oYoJ8Pt4nEcoRzx9pRyG1yfDWr0g1EFWBsuK
         SSqIAZeNiT4QJIzibfHjzbPFC9Gnh3eK+bnpaWUgmZMCsX45M14IxrLbeY1MDRkgum1u
         vheg==
X-Gm-Message-State: AO0yUKWihVOR5T2o9vH4YEZCvJTSS3haYXblFNPDQCZOgSvB4LgucTV1
	ukrHkTYjcIvtrA2Mb405T5p/WQ6/kiZtPwDoSVmpjg==
X-Google-Smtp-Source: AK7set/GX/xiuSrXgm/VSXdm3XOKRQlcqt5GoDWrcqRz8bpvNT1xmGeGz7BxwViubLWMgjrcrgo06F+QVhbprsjXRwY=
X-Received: by 2002:a67:ead9:0:b0:411:ffe1:9c6 with SMTP id
 s25-20020a67ead9000000b00411ffe109c6mr9687569vso.0.1678195142179; Tue, 07 Mar
 2023 05:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20230301082552.274331-1-alexghiti@rivosinc.com>
 <CAK9=C2XAOKbyrbOnDP1GzW1VyO-f-V-oEVcp+PhGHeHKFh4C6A@mail.gmail.com> <CAHVXubj9sCEuANsVe0N7YRMg8OPx_eALZfy0vERKU9P6QUDM0Q@mail.gmail.com>
In-Reply-To: <CAHVXubj9sCEuANsVe0N7YRMg8OPx_eALZfy0vERKU9P6QUDM0Q@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 7 Mar 2023 18:48:48 +0530
Message-ID: <CAK9=C2XDkgZuaxO1fOWCxyCsGgiD=B_O4DmuAPwEhC65Mck9eA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051905_766883_DD2FDE27 
X-CRM114-Status: GOOD (  23.57  )
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

SGkgQWxleCwKCk9uIFR1ZSwgTWFyIDcsIDIwMjMgYXQgMTI6MjLigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIE1v
biwgTWFyIDYsIDIwMjMgYXQgNTozM+KAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWlj
cm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE1hciAxLCAyMDIzIGF0IDE6NTbigK9QTSBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBUaGlzIHBhdGNoc2V0IGludGVuZHMgdG8gaW1wcm92ZSB0bGIgdXRpbGl6YXRpb24gYnkgdXNp
bmcgaHVnZXBhZ2VzIGZvcgo+ID4gPiB0aGUgbGluZWFyIG1hcHBpbmcuCj4gPiA+Cj4gPiA+IGJh
c2UtY29tbWl0LXRhZzogdjYuMi1yYzcKPiA+ID4KPiA+ID4gdjY6Cj4gPiA+IC0gcXVpZXQgTExW
TSB3YXJuaW5nIGJ5IGNhc3RpbmcgcGh5c19yYW1fYmFzZSBpbnRvIGFuIHVuc2lnbmVkIGxvbmcK
PiA+ID4KPiA+ID4gdjU6Cj4gPiA+IC0gRml4IG5vbW11IGJ1aWxkcyBieSBnZXR0aW5nIHJpZCBv
ZiByaXNjdl9wZm5fYmFzZSBpbiBwYXRjaCAxLCB0aGFua3MKPiA+ID4gICBDb25vcgo+ID4gPiAt
IEFkZCBSQiBmcm9tIEFuZHJldwo+ID4gPgo+ID4gPiB2NDoKPiA+ID4gLSBSZWJhc2Ugb24gdG9w
IG9mIHY2LjItcmMzLCBhcyBub3RlZCBieSBDb25vcgo+ID4gPiAtIEFkZCBBY2tlZC1ieSBSb2IK
PiA+ID4KPiA+ID4gdjM6Cj4gPiA+IC0gQ2hhbmdlIHRoZSBjb21tZW50IGFib3V0IGluaXRyZF9z
dGFydCBWQSBjb252ZXJzaW9uIHNvIHRoYXQgaXQgZml0cwo+ID4gPiAgIEFSTTY0IGFuZCBSSVND
VjY0IChhbmQgb3RoZXJzIGluIHRoZSBmdXR1cmUgaWYgbmVlZGVkKSwgYXMgc3VnZ2VzdGVkCj4g
PiA+ICAgYnkgUm9iCj4gPiA+Cj4gPiA+IHYyOgo+ID4gPiAtIEFkZCBhIGNvbW1lbnQgb24gd2h5
IFJJU0NWNjQgZG9lcyBub3QgbmVlZCB0byBzZXQgaW5pdHJkX3N0YXJ0L2VuZCB0aGF0Cj4gPiA+
ICAgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcywgYXMgYXNrZWQgYnkgUm9iCj4gPiA+Cj4gPiA+
IEFsZXhhbmRyZSBHaGl0aSAoMik6Cj4gPiA+ICAgcmlzY3Y6IEdldCByaWQgb2YgcmlzY3ZfcGZu
X2Jhc2UgdmFyaWFibGUKPiA+ID4gICByaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0
aGUgbGluZWFyIG1hcHBpbmcKPiA+Cj4gPiBJIHRyaWVkIHRoaXMgc2VyaWVzIGJ1dCBpdCBpcyBn
ZXR0aW5nIHN0dWNrIGFmdGVyIHJlYWNoaW5nIHVzZXIgc3BhY2UuCj4gPgo+ID4gRG9lcyB0aGlz
IHNlcmllcyByZXF1aXJlIHNvbWUgb3RoZXIgZGVwZW5kZW50IHBhdGNoZXMgPwo+Cj4gTm8gaXQg
c2hvdWxkIG5vdC4gTGV0IG1lIHRha2UgYSBsb29rOiB3aGF0J3MgeW91ciBjb25maWcgYW5kIHRo
ZSBiYXNlIGNvbW1pdD8KClBsZWFzZSB0cnkgdGhlIGFsZXhnaGl0aV90ZXN0IGJyYW5jaCBhdDoK
aHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0CgpDb21waWxlIHRoZSBrZXJuZWwg
d2l0aCBkZWZjb25maWcgYW5kIGxhdW5jaCBRRU1VIGFzIGZvbGxvd3M6CnFlbXUtc3lzdGVtLXJp
c2N2NjQgLU0gdmlydCAtbSAxRyAtbm9ncmFwaGljIC1iaW9zCm9wZW5zYmkvYnVpbGQvcGxhdGZv
cm0vZ2VuZXJpYy9maXJtd2FyZS9md19qdW1wLmJpbiAta2VybmVsCi4vYnVpbGQtcmlzY3Y2NC9h
cmNoL3Jpc2N2L2Jvb3QvSW1hZ2UgLWFwcGVuZCAicm9vdD0vZGV2L3JhbSBydwpjb25zb2xlPXR0
eVMwIGVhcmx5Y29uIiAtaW5pdHJkIC4vcm9vdGZzX3Jpc2N2NjQuaW1nCgpJbiB0aGUgYWJvdmUg
Y29tbWFuZCwgcm9vdGZzX3Jpc2N2NjQuaW1nIGlzIGEgYnVzeWJveCBiYXNlZCByb290ZnMuCgpS
ZWdhcmRzLApBbnVwCgo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IEFudXAKPiA+Cj4gPiA+Cj4gPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCB8IDE5ICsrKysrKysrKysrKysrKysrLS0K
PiA+ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLQo+ID4gPiAgYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jICAgICAgfCAxNiAr
KysrKysrKysrKysrKysrCj4gPiA+ICBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAgICAgICB8IDEx
ICsrKysrKy0tLS0tCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjM3LjIKPiA+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
