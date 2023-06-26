Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7D3EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 19:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fwsX5+X8gCihgO7dwVp7hEU/qKdMRgHUqYPognex+c=; b=pXg9NlkD0HnF/R
	h/qduyroJeHp3zDe1+/XB7lSMIzNFY36ljpa7kGsSeW4fmetTf8Twdlk0L1t2UO738ez+1kUaXR9K
	EmsdnEXWBhrkgJMwIkc7mlilfTsnUcb6aOK5RyU+Wb0luVv3XqmaJjRQYPuFoDLv8KHnUP2Aq1LhJ
	zO/RP+RNS62vbeeLkYEFCOrrZI40xWhobPbHFD2Wy7H72YPKG/7g3whDWeHaqKZV854lJEIHonJdi
	WsAUUWzZY5pKhbEzA2MYPhwr2ouIYIVWsL4L3QeXvks6OGJyUTirvUCovneDoTOrbXqSt2vYhlosm
	TQlMGJkdMEOfr2/OY21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDsDG-00Ax06-0W;
	Mon, 26 Jun 2023 19:49:26 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDsDD-00AwzN-1V
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 19:49:25 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f875b267d9so5217510e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 12:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687808959; x=1690400959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YM/3jytDSw5aCGEFIsFzQqRvaDLcL3uFF5ne8/Vpng=;
        b=rMvt5DOa+d5Ev5t6uxa2w3H7fN1E2vJqXHCzpIonlVWY9h+igGLjmlZap8F+vkqtfQ
         79RaVl6dSRLrmiu06nwDUzUSon2uM3LeanriiR/CYMO7edw3M6BvR09M46AovO3JXaL7
         OFtOfbEyiNBrVuVv5xg5uo8kii5Nywg04nYGSciIqIf4MW6D9LuAszTbpu1RLonGsO0C
         OF4MgCAqHnfcuC5jhTXDosFecrA8UB2gxJ9dfWHn6KFckVjjTyoOqdegIjAUzb2tc2RT
         YAdVdwIFZQsNtTbOrkrCAP+xl06QBopBxyhgNtPQaqOXhD2EUxKVJAzR4Pwx2/G5Oem5
         E2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687808959; x=1690400959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YM/3jytDSw5aCGEFIsFzQqRvaDLcL3uFF5ne8/Vpng=;
        b=D/xR3rb8mxdB2b0lcpEwVTLQYjWT3WTNXXDKB2cQCifJRGi4nTflDuHS72wctxu/VE
         kvtEhZs12+gYB8B30iFPU6UuKhfy99h+MeOmcjhcmOBlz3ICm1v65BG+8QLej1FJV4mT
         uFFQ6DFPYtsR+8tqLOz0qdtXtLa5BZp0BB3DWN0GASpVGMNVcfmnMpjk+8hpx7TiI3mV
         wgc0dY0VCJ5B/a+dSGnj8snJM+qvk6fulqLj+OwBDJ1UVRTi5RS30y6IKar6c/93TAPl
         YBsSuS0EGbG4Avx7tjqCDfWKOZkGQThM0qRXvc5K3N8eCD/vqw6VLJKtD4mm7YxseksV
         NNDw==
X-Gm-Message-State: AC+VfDwTkRkdZABt55ppOmtFNsJ47lVeMLaFrtK2SfLGJLV8ffY1ORj0
	5uO+wJ0M0fNsHGtnsvFM2R04/5ii8w8eDYRTNtb6tg==
X-Google-Smtp-Source: ACHHUZ6avkdLR+FgKz1qS04UPjaf9BSA07AhepW4v7HvSFw74n2Fsq9w2aB6inJFNBV5gr+Rt0Rv48bZvLGzKw/tTEk=
X-Received: by 2002:a05:6512:3b8e:b0:4fb:744e:17db with SMTP id
 g14-20020a0565123b8e00b004fb744e17dbmr3081195lfv.1.1687808958688; Mon, 26 Jun
 2023 12:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222016.3742145-1-evan@rivosinc.com> <tencent_817CE182DEDA938E03B848314821098D4408@qq.com>
In-Reply-To: <tencent_817CE182DEDA938E03B848314821098D4408@qq.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 26 Jun 2023 12:48:42 -0700
Message-ID: <CALs-Hsv+iS055GUJdotYxmn5ST9y9yT7P1PiG4DLPU+rzPO20A@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Probe for misaligned access speed
To: Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_124923_503837_DA380173 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, palmer@rivosinc.com, conor.dooley@microchip.com, guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org, corbet@lwn.net, jeeheng.sia@starfivetech.com, masahiroy@kernel.org, greentime.hu@sifive.com, shosie@rivosinc.com, lizhengyu3@huawei.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, samuel@sholland.org, leyfoon.tan@starfivetech.com, paul.walmsley@sifive.com, heiko.stuebner@vrull.eu, apatel@ventanamicro.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, xianting.tian@linux.alibaba.com, palmer@dabbelt.com, andy.chiu@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdW4gMjQsIDIwMjMgYXQgMzoyMuKAr0FNIFlhbmd5dSBDaGVuIDxjeXlAY3l5c2Vs
Zi5uYW1lPiB3cm90ZToKPgo+IEhpLAo+Cj4gVGhhbmtzIGZvciBkb2luZyB0aGlzLgo+Cj4gT24g
Ni8yNC8yMyA2OjIwIEFNLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gSSBkb24ndCBoYXZlIGEgbWFj
aGluZSB3aGVyZSBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93LCBidXQgSSdkIGJlCj4gPiBp
bnRlcmVzdGVkIHRvIHNlZSB0aGUgcmVzdWx0cyBvZiBib290aW5nIHRoaXMgc2VyaWVzIGlmIHNv
bWVvbmUgZGlkLgo+Cj4gSSBoYXZlIHRlc3RlZCB5b3VyIHBhdGNoZXMgb24gYSAxMDBNSHogQmln
Q29yZSByb2NrZXQtY2hpcCB3aXRoIG9wZW5zYmkgcnVubmluZyBvbiBGUEdBIHdpdGggNzJiaXQo
NjRiaXQrRUNDKSBERFIzIDE2MDBNSHogbWVtb3J5LiBBcyB0aGUgcm9ja2V0LWNoaXAgZGlkIG5v
dCBzdXBwb3J0IG1pc2FsaWduZWQgbWVtb3J5IGFjY2VzcywgZXZlcnkgbWlzYWxpZ25lZCBtZW1v
cnkgYWNjZXNzIHdpbGwgdHJhcCBhbmQgZW11bGF0ZWQgYnkgU0JJLgo+Cj4gSGVyZSBpcyB0aGUg
cmVzdWx0Ogo+Cj4gfiAjIGNhdCAvcHJvYy9jcHVpbmZvCj4gcHJvY2Vzc29yICAgICAgIDogMAo+
IGhhcnQgICAgICAgICAgICA6IDAKPiBpc2EgICAgICAgICAgICAgOiBydjY0aW1hZmRjCj4gbW11
ICAgICAgICAgICAgIDogc3YzOQo+IHVhcmNoICAgICAgICAgICA6IHNpZml2ZSxyb2NrZXQwCj4g
bXZlbmRvcmlkICAgICAgIDogMHgwCj4gbWFyY2hpZCAgICAgICAgIDogMHgxCj4gbWltcGlkICAg
ICAgICAgIDogMHgyMDE4MTAwNAo+Cj4gcHJvY2Vzc29yICAgICAgIDogMQo+IGhhcnQgICAgICAg
ICAgICA6IDEKPiBpc2EgICAgICAgICAgICAgOiBydjY0aW1hZmRjCj4gbW11ICAgICAgICAgICAg
IDogc3YzOQo+IHVhcmNoICAgICAgICAgICA6IHNpZml2ZSxyb2NrZXQwCj4gbXZlbmRvcmlkICAg
ICAgIDogMHgwCj4gbWFyY2hpZCAgICAgICAgIDogMHgxCj4gbWltcGlkICAgICAgICAgIDogMHgy
MDE4MTAwNAo+Cj4gfiAjIGRtZXNnIHwgZ3JlcCBVbmFsaWduZWQKPiBbICAgIDAuMjEwMTQwXSBj
cHUxOiBVbmFsaWduZWQgd29yZCBjb3B5IDAgTUIvcywgYnl0ZSBjb3B5IDM4IE1CL3MsIG1pc2Fs
aWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiBbICAgIDAuNDEwNzE1XSBjcHUwOiBVbmFsaWduZWQg
d29yZCBjb3B5IDAgTUIvcywgYnl0ZSBjb3B5IDM1IE1CL3MsIG1pc2FsaWduZWQgYWNjZXNzZXMg
YXJlIHNsb3cKClRoYW5rIHlvdSwgWWFuZ3l1ISBPb2YsIHRoZSBmaXJtd2FyZSB0cmFwcyBhcmUg
cXVpdGUgc2xvdyEKLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
