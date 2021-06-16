Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C896DC48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:48:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853BA60C41
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 853BA60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EisHHmEQB8WRR/Q/62pIxcmYwnDaC8JVhcFEj6J/uN8=; b=Qxh45/7lz/YjBQ
	5cBXa/1bSXyPKwyDt6mvFcF9AxaT7FykcGqdWPknUywnbK6Nh6wV8ocsU+2b0HEAKcB+66KhWtbLC
	x1KlirxvvU/9eL/qaGFwNetQ6vR3jkJTpJ2au3QZvvQPe+ip5DbOiSNCjUcl9cNwODBJrf0vTEFeN
	ZJapIx4InDtKKTtUlqSWeG8YJy4gedtWAGZNjiCnYqQPc7EkSYnjPr3k3xBEaXVfo2im5fYy3ANA1
	Tq15Yo1iFscuJ6RHB+j0aynK7VHKAngGpPCoam2f3+FM98pI1m1KMAqJgHZbZrKusTU59kLARsO/N
	L1oSHHN3Bl1YmE7OcVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltWpz-006lT1-7g; Wed, 16 Jun 2021 14:48:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltWpj-006lRP-E4; Wed, 16 Jun 2021 14:48:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02DA8611CE;
 Wed, 16 Jun 2021 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623854879;
 bh=qwFzlNJ04k6sHwdqK2lPHiFKDvUxsyrimKNVrLGVNus=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qby2c0Y8M1BdfdI0P8Y9Vkrv3ExYp5AlpQWpoE4DCw7j1Eox1blM44LNeou7bniot
 UzGUO92nm6UF2bRM75adNuUOBX72v5FFaGct7m1gNa/X2AwlZ0lAaubbfXyA8OPodO
 ycqFDkCpBCkT27GTQGnm6QDD5GD+FiPKLpnymG8iEglWOL3JUMu10Q9xO28Rt8ABDr
 fdlkW3KCoYxtNjXQd4ukdrtX7E41wHuvg/zVDE3zZTKfCcDfK5D+Yn8z1EoztX5AEq
 DSiweBvfa8nlyetZsV9IuouU7cNtDa8y1NedLf0djZCM5lMyPcf4ZCYimcNTos9q5y
 crNhPVfpdeZCw==
Received: by mail-ed1-f48.google.com with SMTP id w21so3083580edv.3;
 Wed, 16 Jun 2021 07:47:58 -0700 (PDT)
X-Gm-Message-State: AOAM53205eotKeEfzCWSZHO/CWRilO916Kb9QjcdL6iyncScJYwteX0r
 rNd6q9N13KViYCqcRxGXI4EncwLPeBjy5gKC+w==
X-Google-Smtp-Source: ABdhPJz6uzVahBrIhJvzhgaD8yThinebto90daMlvuqzzG4qQ4bE0zduK+dYUvSlcpZgFhisvC9dMBrri3xqlqei3zU=
X-Received: by 2002:aa7:dc4c:: with SMTP id g12mr4860375edu.258.1623854877530; 
 Wed, 16 Jun 2021 07:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623780059.git.geert+renesas@glider.be>
 <bcc5c666f4ada9a8bbc26f559751f0da67f769f8.1623780059.git.geert+renesas@glider.be>
 <abadee118c1945c44d9bff7675b12ec4@mailhost.ics.forth.gr>
 <CAL_JsqLU7GWDxdnR2-Yd2vbj7w=5pNr_fFocDQgPbs17EpBG0g@mail.gmail.com>
 <bdfbf7cc997a10a94331d77332dbe88e@mailhost.ics.forth.gr>
 <CAMuHMdVRcN+y0kwxxEH8UGo6bRT9SvxRSLU8VzWJFx=yLQ5S0g@mail.gmail.com>
 <ef1a9a97e0238a0ff2d8e044487602a5@mailhost.ics.forth.gr>
In-Reply-To: <ef1a9a97e0238a0ff2d8e044487602a5@mailhost.ics.forth.gr>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 16 Jun 2021 08:47:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJgz=ixNAJProoVFmQXGEOsTYX=bXTdtf7RLQErL1VRg@mail.gmail.com>
Message-ID: <CAL_JsqKJgz=ixNAJProoVFmQXGEOsTYX=bXTdtf7RLQErL1VRg@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_074759_531646_899FD9F3 
X-CRM114-Status: GOOD (  13.46  )
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

T24gV2VkLCBKdW4gMTYsIDIwMjEgYXQgNDo0MyBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMjEtMDYtMTYgMTA6NTYsIEdlZXJ0IFV5
dHRlcmhvZXZlbiDOrc6zz4HOsc+IzrU6Cj4gPgo+ID4gSSBjYW4ndCBjb21tZW50IG9uIHRoZSBk
dXBsaWNhdGlvbiBvbiBhcm02NCwgYnV0IHRvIG1lLCAvY2hvc2VuCj4gPiBzb3VuZHMgbGlrZSB0
aGUgbmF0dXJhbCBwbGFjZSBmb3IgYm90aCAibGludXgsZWxmY29yZWhkciIgYW5kCj4gPiAibGlu
dXgsdXNhYmxlLW1lbW9yeS1yYW5nZSIuICBGaXJzdCBydWxlIG9mIERUIGlzICJEVCBkZXNjcmli
ZXMKPiA+IGhhcmR3YXJlLCBub3Qgc29mdHdhcmUgcG9saWN5Iiwgd2l0aCAvY2hvc2VuIGRlc2Ny
aWJpbmcgc29tZSBzb2Z0d2FyZQo+ID4gY29uZmlndXJhdGlvbi4KPiA+Cj4KPiBXZSBhbHJlYWR5
IGhhdmUgImxpbnV4LHVzYWJsZS1tZW1vcnkiIG9uIC9tZW1vcnkgbm9kZToKPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92NS4xMy1yYzYvc291cmNlL2RyaXZlcnMvb2YvZmR0LmMj
TDEwMTEKPiBhbmQgaXQgbWFrZXMgcGVyZmVjdCBzZW5zZSB0byBiZSB0aGVyZSBzaW5jZSBpdCBv
dmVycmlkZXMgL21lbW9yeSdzIHJlZwo+IHByb3BlcnR5Lgo+Cj4gV2h5IGRlZmluZSBhbm90aGVy
IGJpbmRpbmcgZm9yIHRoZSBzYW1lIHRoaW5nIG9uIC9jaG9zZW4gPwoKR28gbG9vayBhdCB0aGUg
dGhyZWFkIGFkZGluZyAibGludXgsdXNhYmxlLW1lbW9yeS1yYW5nZSIuIFRoZXJlIHdlcmUKb25s
eSAzNSB2ZXJzaW9ucyBvZiBpdFsxXS4gSSB3YXNuJ3QgaGFwcHkgd2l0aCBhIDJuZCB3YXkgZWl0
aGVyLCBidXQKYXMgSSd2ZSBtZW50aW9uZWQgYmVmb3JlIHdlIGRvbid0IGFsd2F5cyBoYXZlIC9t
ZW1vcnkgbm9kZS4KClJvYgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1r
ZXJuZWwvMjAxNzA0MDMwMjI2MDYuMTI2MDktMS10YWthaGlyby5ha2FzaGlAbGluYXJvLm9yZy8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
