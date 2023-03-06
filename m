Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B6C678D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04W0Oy/eY/HM/YFEA2t8ZNe2oi/EGN0Eh2jGq5j6crg=; b=SkD/aIEoU5lUmY
	pG2begwW6f4KY8+Xxu9964wSy3tkdlUt/Da4I17KyaJ831QtVJluYwa3bJkXKxbSd8Ff/x+02PQ8t
	0ZBYAW2H4pi2OXEihRlmmPqk9Sj2FH45sowVJ911J/BHnshiTHtt8ojuvuoN4xSAvbxqxpnqCLeb4
	tuwQWBermIK5qCqVKVJfXMyN8Pu18nxnE3ldiZGsJ/n5Pl/VNl1NfGrUtGxBzMgvcx8Jc4vjPfTpI
	N5axf7l+TMAfEr+gqWTjP/zeKqKY+VQAzTRAEpzdfobYyFf1P0hIb/f7DHeLbvB1iTLuiUXUD8EIt
	OXiSo/vVEm1beN/KI+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAIP-00CkdU-I2; Mon, 06 Mar 2023 12:50:29 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAII-00CkbB-UI
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 12:50:25 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A8DB641262
	for <linux-riscv@lists.infradead.org>; Mon,  6 Mar 2023 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678107016;
	bh=d2FO6hgRo1/CyYGbMaXcyRawdkBhbAyeEbODmnEKOYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mDIxZOESufSewx++o0wABV1RYET7QQnhha9MaKtthYt3id2aeHsIJBaD08GIfeRsG
	 E4Xpo3joKrNr3uksLOwPn8OfLN8YEBrQvAwE3ZaUL0qFdimqqkY266/FwST0UidT1L
	 58jKgLfQmLKQWu7hqzx3RvX1kKyxiRWt18p/OHzW4hSDvPXLBS9p12TG0ek+cdMwIc
	 fFI2dqDoB/h6UJteCO/0OX7MhNtYfw/cPConCLfIunbL4Ij+9OR1vVIc8StVHmZhko
	 Lt0clEGq1AfEfopGVRBM1aRaNv+AqkV6e74fcZZhcu8eXuSA36pwkOvVazKbapxpdz
	 AKgfwSsSzCb/w==
Received: by mail-qk1-f197.google.com with SMTP id q25-20020a37f719000000b00742bfdd63ecso5274450qkj.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 04:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678107014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2FO6hgRo1/CyYGbMaXcyRawdkBhbAyeEbODmnEKOYk=;
        b=xuKthdIn+gp314oQ3XUZzOyAUDpvL6oE8vaFOxygFaVSSjCtZioQmjJGPov9kykF1q
         Pt8kexxE4+jATxZI4FvlNPwXLSvX+T0Uw85wNQHuheKR4I1ifMpLf7NpM9b8o0Y21VBn
         aFT821/1vP6J06FM/jXmR83pSslzhlUsZlyrlxNVu+wr8Ie9FfNqeLjSR/GPa8BlT0iL
         DkMeAthP3RbRGxhp0Dg7gKbJeyIjFExgct9v47qBGhKIcSZTxNccxK5q/GXI+MQEiD93
         F3fJpBKgyxhK2ox+DEmsTqp9EUolQdUx3rs+p7rVmRQyh0IOWifuBgoNGwQQ1khJJ/RY
         4lFA==
X-Gm-Message-State: AO0yUKUvYNfrt7ZcJOBWltHmnVRY48jkrBDTbtOfq4WHqP3lXqrMJz7y
	HQWnVc9HoznnfkSFpM3OsLV1a0gValkFtcvASeuTtpYqu1tkIw+d7YRgLS9NImFoeTQN7FkfWr0
	COThceZGPZVrvmPjjUsyqpp2Muo6xCV0QFl/5tEsq/2zLbNKJAhTwbd+pfGJHCecKIRaPMjfb
X-Received: by 2002:a05:620a:683:b0:721:5339:2c89 with SMTP id f3-20020a05620a068300b0072153392c89mr2976776qkh.7.1678107014172;
        Mon, 06 Mar 2023 04:50:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8VDmld3IafE+F3+OAwGB0W9Ba396r29jEuJpBrZUfobArOivBqdPyWCDAeND+TO5St5FaQQof4K7nfLDg0Cb8=
X-Received: by 2002:a05:620a:683:b0:721:5339:2c89 with SMTP id
 f3-20020a05620a068300b0072153392c89mr2976761qkh.7.1678107013895; Mon, 06 Mar
 2023 04:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-9-samin.guo@starfivetech.com> <CAJM55Z-3CCY8xx81Qr9UqSSQ+gOer3XXJzOvnAe7yyESk23pQw@mail.gmail.com>
 <bc79afab-17d1-8789-3325-8e6d62123dce@starfivetech.com>
In-Reply-To: <bc79afab-17d1-8789-3325-8e6d62123dce@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 6 Mar 2023 13:49:57 +0100
Message-ID: <CAJM55Z8zYUQc33r9tJB1du-FSp+uDf40720taMuGTuPcPU+aZg@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] net: stmmac: starfive_dmac: Add phy interface settings
To: Guo Samin <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_045023_413556_204CD36F 
X-CRM114-Status: GOOD (  41.35  )
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

T24gTW9uLCA2IE1hciAyMDIzIGF0IDA0OjA3LCBHdW8gU2FtaW4gPHNhbWluLmd1b0BzdGFyZml2
ZXRlY2guY29tPiB3cm90ZToKPiDlnKggMjAyMy8zLzQgMDo1MDo1NCwgRW1pbCBSZW5uZXIgQmVy
dGhpbmcg5YaZ6YGTOgo+ID4gT24gRnJpLCAzIE1hciAyMDIzIGF0IDEwOjAxLCBTYW1pbiBHdW8g
PHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToKPiA+Pgo+ID4+IGR3bWFjIHN1cHBv
cnRzIG11bHRpcGxlIG1vZGVzcy4gV2hlbiB3b3JraW5nIHVuZGVyIHJtaWkgYW5kIHJnbWlpLAo+
ID4+IHlvdSBuZWVkIHRvIHNldCBkaWZmZXJlbnQgcGh5IGludGVyZmFjZXMuCj4gPj4KPiA+PiBB
Y2NvcmRpbmcgdG8gdGhlIGR3bWFjIGRvY3VtZW50LCB3aGVuIHdvcmtpbmcgaW4gcm1paSwgaXQg
bmVlZHMgdG8gYmUKPiA+PiBzZXQgdG8gMHg0LCBhbmQgcmdtaWkgbmVlZHMgdG8gYmUgc2V0IHRv
IDB4MS4KPiA+Pgo+ID4+IFRoZSBwaHkgaW50ZXJmYWNlIG5lZWRzIHRvIGJlIHNldCBpbiBzeXNj
b24sIHRoZSBmb3JtYXQgaXMgYXMgZm9sbG93czoKPiA+PiBzdGFyZml2ZSxzeXNjb246IDwmc3lz
Y29uLCBvZmZzZXQsIG1hc2s+Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTYW1pbiBHdW8gPHNh
bWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+ID4+IC0tLQo+ID4+ICAuLi4vZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtc3RhcmZpdmUuYyAgfCA0NiArKysrKysrKysrKysrKysrKysrCj4g
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RhcmZpdmUuYyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0YXJmaXZlLmMKPiA+
PiBpbmRleCA1NjYzNzgzMDZmNjcuLjQwZmRkNzAzNjEyNyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdGFyZml2ZS5jCj4gPj4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RhcmZpdmUuYwo+
ID4+IEBAIC03LDEwICs3LDE1IEBACj4gPj4gICAqCj4gPj4gICAqLwo+ID4+Cj4gPj4gKyNpbmNs
dWRlIDxsaW51eC9tZmQvc3lzY29uLmg+Cj4gPj4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2Uu
aD4KPiA+PiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ID4+Cj4gPj4gICNpbmNsdWRlICJz
dG1tYWNfcGxhdGZvcm0uaCIKPiA+Pgo+ID4+ICsjZGVmaW5lIE1BQ1BIWUNfUEhZX0lORlRfUk1J
SSAgMHg0Cj4gPj4gKyNkZWZpbmUgTUFDUEhZQ19QSFlfSU5GVF9SR01JSSAweDEKPiA+Cj4gPiBQ
bGVhc2UgcHJlZml4IHRoZXNlIHdpdGggc29tZXRoaW5nIGxpa2UgU1RBUkZJVkVfRFdNQUNfCj4g
Pgo+IEhpLCBFbWlsLCBUaGVzZSBkZWZpbml0aW9ucyBjb21lIGZyb20gdGhlIGRhdGFzaGVldCBv
ZiBkd21hYy4gSG93ZXZlciwgYWRkIFNUQVJEUklWRV8gRFdNQUMgaXMgYSBnb29kIGlkZWEuIEkg
d2lsbCBmaXggaXQsdGhhbmtzLgo+ID4+ICBzdHJ1Y3Qgc3RhcmZpdmVfZHdtYWMgewo+ID4+ICAg
ICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4+ICAgICAgICAgc3RydWN0IGNsayAqY2xrX3R4
Owo+ID4+IEBAIC01Myw2ICs1OCw0NiBAQCBzdGF0aWMgdm9pZCBzdGFyZml2ZV9ldGhfZml4X21h
Y19zcGVlZCh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgc3BlZWQpCj4gPj4gICAgICAgICAgICAg
ICAgIGRldl9lcnIoZHdtYWMtPmRldiwgImZhaWxlZCB0byBzZXQgdHggcmF0ZSAlbHVcbiIsIHJh
dGUpOwo+ID4+ICB9Cj4gPj4KPiA+PiArc3RhdGljIGludCBzdGFyZml2ZV9kd21hY19zZXRfbW9k
ZShzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+ID4+ICt7Cj4gPj4gKyAg
ICAgICBzdHJ1Y3Qgc3RhcmZpdmVfZHdtYWMgKmR3bWFjID0gcGxhdF9kYXQtPmJzcF9wcml2Owo+
ID4+ICsgICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOwo+ID4+ICsgICAgICAgc3Ry
dWN0IHJlZ21hcCAqcmVnbWFwOwo+ID4+ICsgICAgICAgdW5zaWduZWQgaW50IHJlZywgbWFzaywg
bW9kZTsKPiA+PiArICAgICAgIGludCBlcnI7Cj4gPj4gKwo+ID4+ICsgICAgICAgc3dpdGNoIChw
bGF0X2RhdC0+aW50ZXJmYWNlKSB7Cj4gPj4gKyAgICAgICBjYXNlIFBIWV9JTlRFUkZBQ0VfTU9E
RV9STUlJOgo+ID4+ICsgICAgICAgICAgICAgICBtb2RlID0gTUFDUEhZQ19QSFlfSU5GVF9STUlJ
Owo+ID4+ICsgICAgICAgICAgICAgICBicmVhazsKPiA+PiArCj4gPj4gKyAgICAgICBjYXNlIFBI
WV9JTlRFUkZBQ0VfTU9ERV9SR01JSToKPiA+PiArICAgICAgIGNhc2UgUEhZX0lOVEVSRkFDRV9N
T0RFX1JHTUlJX0lEOgo+ID4+ICsgICAgICAgICAgICAgICBtb2RlID0gTUFDUEhZQ19QSFlfSU5G
VF9SR01JSTsKPiA+PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4gKwo+ID4+ICsgICAgICAg
ZGVmYXVsdDoKPiA+PiArICAgICAgICAgICAgICAgZGV2X2Vycihkd21hYy0+ZGV2LCAiVW5zdXBw
b3J0ZWQgaW50ZXJmYWNlICVkXG4iLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIHBsYXRf
ZGF0LT5pbnRlcmZhY2UpOwo+ID4+ICsgICAgICAgfQo+ID4+ICsKPiA+PiArICAgICAgIGVyciA9
IG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9maXhlZF9hcmdzKGR3bWFjLT5kZXYtPm9mX25vZGUsCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3RhcmZp
dmUsc3lzY29uIiwgMiwgMCwgJmFyZ3MpOwo+ID4+ICsgICAgICAgaWYgKGVycikgewo+ID4+ICsg
ICAgICAgICAgICAgICBkZXZfZGJnKGR3bWFjLT5kZXYsICJzeXNjb24gcmVnIG5vdCBmb3VuZFxu
Iik7Cj4gPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+ICsgICAgICAgfQo+
ID4+ICsKPiA+PiArICAgICAgIHJlZyA9IGFyZ3MuYXJnc1swXTsKPiA+PiArICAgICAgIG1hc2sg
PSBhcmdzLmFyZ3NbMV07Cj4gPj4gKyAgICAgICByZWdtYXAgPSBzeXNjb25fbm9kZV90b19yZWdt
YXAoYXJncy5ucCk7Cj4gPj4gKyAgICAgICBvZl9ub2RlX3B1dChhcmdzLm5wKTsKPiA+Cj4gPiBJ
IHRoaW5rIHRoZSBhYm92ZSBpcyBiYXNpY2FsbHkKPiA+IHVuc2lnbmVkIGludCBhcmdzWzJdOwo+
ID4gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKGR3bWFjLT5kZXZfb2Zfbm9k
ZSwKPiA+ICJzdGFyZml2ZSxzeXNjb24iLCAyLCBhcmdzKTsKPiA+Cj4gPiAuLmJ1dCBhcyBBbmRy
ZXcgcG9pbnRzIG91dCBhbm90aGVyIHNvbHV0aW9uIGlzIHRvIHVzZSBwbGF0Zm9ybSBtYXRjaAo+
ID4gZGF0YSBmb3IgdGhpcy4gRWcuCj4gPgo+ID4gc3RhdGljIGNvbnN0IHN0cnVjdCBzdGFyZml2
ZV9kd21hY19tYXRjaF9kYXRhIHN0YXJmaXZlX2R3bWFjX2poNzExMF9kYXRhIHsKPiA+ICAgLnBo
eV9pbnRlcmZhY2Vfb2Zmc2V0ID0gMHhjLAo+ID4gICAucGh5X2ludGVyZmFjZV9tYXNrID0gMHgx
YzAwMDAsCj4gPiB9Owo+ID4KPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0
YXJmaXZlX2R3bWFjX21hdGNoW10gPSB7Cj4gPiAgIHsgLmNvbXBhdGlibGUgPSAic3RhcmZpdmUs
amg3MTEwLWR3bWFjIiwgLmRhdGEgPQo+ID4gJnN0YXJmaXZlX2R3bWFjX2poNzExMF9kYXRhIH0s
Cj4gPiAgIHsgLyogc2VudGluZWwgKi8gfQo+ID4gfTsKPiA+Cj4gPiBhbmQgaW4gdGhlIHByb2Jl
IGZ1bmN0aW9uOgo+ID4KPiBIaSBFbWlsLCBZZXPvvIx0aGlzIGlzIHVzdWFsbHkgYSBnb29kIHNv
bHV0aW9uLCBhbmQgSSBoYXZlIGNvbnNpZGVyZWQgdGhpcyBwbGFuIGJlZm9yZS4KPiBIb3dldmVy
LCBnbWFjMCBvZiBqaDcxMTAgaXMgZGlmZmVyZW50IGZyb20gdGhlIHJlZy9tYXNrIG9mIGdtYWMx
Lgo+IFlvdSBjYW4gZmluZCBpdCBpbiBwYXRjaC05Ogo+Cj4gJmdtYWMwIHsKPiAgICAgICAgIHN0
YXJmaXZlLHN5c2NvbiA9IDwmYW9uX3N5c2NvbiAweGMgMHgxYzAwMDA+Owo+IH07Cj4KPiAmZ21h
YzEgewo+ICAgICAgICAgc3RhcmZpdmUsc3lzY29uID0gPCZzeXNfc3lzY29uIDB4OTAgMHgxYz47
Cj4gfTsKPgo+IEluIHRoaXMgY2FzZSwgdXNpbmcgbWF0Y2hfZGF0YSBvZiBzdGFyZml2ZSxqaDcx
MTAtZHdtYSBkb2VzIG5vdCBzZWVtIHRvIGJlIGNvbXBhdGlibGUuCgpVZ2gsIHlvdSdyZSByaWdo
dC4gQm90aCB0aGUgc3lzY29uIGJsb2NrLCB0aGUgcmVnaXN0ZXIgb2Zmc2V0IGFuZCB0aGUKYml0
IHBvc2l0aW9uIGluIHRob3NlIHJlZ2lzdGVycyBhcmUgZGlmZmVyZW50IGZyb20gZ21hYzAgdG8g
Z21hYzEsIGFuZApzaW5jZSB3ZSBuZWVkIGEgcGhhbmRsZSB0byB0aGUgc3lzY29uIGJsb2NrIGFu
eXdheSBwYXNzaW5nIHRob3NlIHR3bwpvdGhlciBwYXJhbWV0ZXJzIGFzIGFyZ3VtZW50cyBpcyBw
cm9iYWJseSB0aGUgbmljZXN0IHNvbHV0aW9uLiBGb3IgdGhlCm5leHQgdmVyc2lvbiBJJ2QgY2hh
bmdlIHRoZSAybmQgYXJndW1lbnQgZnJvbSBtYXNrIHRvIHRoZSBiaXQgcG9zaXRpb24KdGhvdWdo
LiBJdCBzZWVtcyB0aGUgZmllbGQgaXMgYWx3YXlzIDMgYml0cyB3aWRlIGFuZCB0aGlzIG1ha2Vz
IGl0IGEKbGl0dGxlIGNsZWFyZXIgdGhhdCB3ZSdyZSBub3QganVzdCBwdXR0aW5nIHJlZ2lzdGVy
IHZhbHVlcyBpbiB0aGUKZGV2aWNlIHRyZWUuIEVnLiBzb21ldGhpbmcgbGlrZQoKcmVnbWFwID0g
c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKGRldi0+b2Zfbm9kZSwKInN0YXJm
aXZlLHN5c2NvbiIsIDIsIGFyZ3MpOwouLi4KZXJyID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21h
cCwgYXJnc1swXSwgN1UgPDwgYXJnc1sxXSwgbW9kZSA8PCBhcmdzWzFdKTsKLi4uCgpBbHRlcm5h
dGl2ZWx5IHdlJ2QgcHV0IGRhdGEgZm9yIGVhY2ggZ21hYyBpbnRlcmZhY2UgaW4gdGhlIHBsYXRm
b3JtCmRhdGEgaW5jbHVkaW5nIHRoZSBzeXNjb24gY29tcGF0aWJsZSBzdHJpbmcsIGFuZCB1c2UK
c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfY29tcGF0aWJsZSgic3RhcmZpdmUsamg3MTEwLWFvbi1z
eXNjb24iKTsgZm9yCmdtYWMwIGZ4LiBUaGlzIHdheSB0aGUgZGVwZW5kZW5jeSBmcm9tIHRoZSBn
bWFjIG5vZGVzIHRvIHRoZSBzeXNjb24Kbm9kZXMgd29uJ3QgYmUgcmVjb3JkZWQgaXMgdGhlIGRl
dmljZSB0cmVlIHRob3VnaC4KCkBBbmRyZXcgaXMgdGhpcyB3aGF0IHlvdSB3ZXJlIHN1Z2dlc3Rp
bmc/Cgo+ID4gc3RydWN0IHN0YXJmaXZlX2R3bWFjX21hdGNoX2RhdGEgKnBkYXRhID0gZGV2aWNl
X2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ID4KPiA+PiArICAgICAgIGlmIChJU19FUlIo
cmVnbWFwKSkKPiA+PiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPiA+
PiArCj4gPj4gKyAgICAgICByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgcmVnLCBt
YXNrLCBtb2RlIDw8IF9fZmZzKG1hc2spKTsKPiA+PiArfQo+ID4+ICsKPiA+PiAgc3RhdGljIGlu
dCBzdGFyZml2ZV9kd21hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+
ICB7Cj4gPj4gICAgICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0Owo+
ID4+IEBAIC05Myw2ICsxMzgsNyBAQCBzdGF0aWMgaW50IHN0YXJmaXZlX2R3bWFjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gICAgICAgICBwbGF0X2RhdC0+YnNwX3By
aXYgPSBkd21hYzsKPiA+PiAgICAgICAgIHBsYXRfZGF0LT5kbWFfY2ZnLT5kY2hlID0gdHJ1ZTsK
PiA+Pgo+ID4+ICsgICAgICAgc3RhcmZpdmVfZHdtYWNfc2V0X21vZGUocGxhdF9kYXQpOwo+ID4K
PiA+IFRoZSBmdW5jdGlvbiByZXR1cm5zIGVycm9ycyBpbiBhbiBpbnQsIGJ1dCB5b3UgbmV2ZXIg
Y2hlY2sgaXQgOigKPiA+Cj4gVGhhbmsgeW91IGZvciBwb2ludGluZyBvdXQgdGhhdCBpdCB3aWxs
IGJlIGFkZGVkIGluIHRoZSBuZXh0IHZlcnNpb24uCj4gPj4gICAgICAgICBlcnIgPSBzdG1tYWNf
ZHZyX3Byb2JlKCZwZGV2LT5kZXYsIHBsYXRfZGF0LCAmc3RtbWFjX3Jlcyk7Cj4gPj4gICAgICAg
ICBpZiAoZXJyKSB7Cj4gPj4gICAgICAgICAgICAgICAgIHN0bW1hY19yZW1vdmVfY29uZmlnX2R0
KHBkZXYsIHBsYXRfZGF0KTsKPgo+Cj4gQmVzdCByZWdhcmRzLAo+IFNhbWluCj4KPiA+PiAtLQo+
ID4+IDIuMTcuMQo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KPiAtLQo+IEJlc3QgcmVnYXJkcywKPiBT
YW1pbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
