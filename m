Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EDBC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6ge5PlhXyHdm9M/KCF9AHnhkWxj2a3usBQVV5OE0tw=; b=NePifcaTP7KYA6
	NJmlW+S9C6Kr5HgR//3Dy8dkclfCFwdFtNbmKp1wcuZNkbgB9uJ/IEGon62kBsUoEBc9iWzGZVugS
	3zSIQu2RdQ2w8r8ZQlRsIz03RNUQYtAu/T3xFhALwscBYviAReLEJL67H0Yk+VxNjf0L5ca8VKmUO
	hPLulkp70VtSUfzddPi210NCAg/BL7lrtMF9f2mYdlVpkD/ZLzt7W9EdZpMjVGncyTVBkI2ZL3EOi
	EMuLFH/S4KLSD5NfjOe2+Gxddyi/yN/AdmpmtT7p5kbtjoFIC+DKZzqX+Bc07xPRaCKsFWQHeRGLh
	NmG6YfZ0tr48zRbS+CBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJQt-00AMf8-0N;
	Wed, 17 May 2023 15:51:19 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJQq-00AMd3-1t
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 15:51:17 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-561a7d96f67so10759307b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1684338674; x=1686930674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/BiToevvpXZU69/oSETGaqYlCzMkDhIUSch995c2x4=;
        b=PxKg2pRCl/MeEqp5uvc8FI6+YOF8ZQ0EzboQ7hpfbuFJX3IIqChekL0/PSY6f6ZBkZ
         urHQTw8B9Qu+ZY/1vJzTnbXCr75YfIhdSyy686/eLISuhgZHB6UQ3EVsl6FD9v625A/w
         tjxES+HrRzg6bCh5g/2aKxK6aL5WAXk6n5hL6cNQ4DLvHOdkJN6i/f12VZINOcSbVDWY
         Ht8TqiZDvyXTZ0hs/EBmu3kHn7bK+REyjKbHcdjwjITX645yBU2SclzoGsnZb8Qs2uwx
         3eg3Vv2wpF9jKUnxeZFE5DWnz2u2DGzEAq8Ck0m/CDBEkeEBn1RCKj2gBMDNc7cK4SzS
         DFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684338674; x=1686930674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/BiToevvpXZU69/oSETGaqYlCzMkDhIUSch995c2x4=;
        b=FuNV9Mn5XPPMb3lCyfMylY5wvtuQUIFQoBKECaRiTXyP44yLuVFbbYLDVauIUpS/k6
         1UEbRkfyaSEIDVYnknvRIho4weXZbwYrpAf4d/ycCbC+ar5ZThPH6M/wUyunD96jhB0D
         TcVwDDLlz7AVMg9XgjsnrsIuDPUiHgssEzVrbxcGYLYGlyMeK+Zf+uD+dL+m3aGOdqY1
         zpOjZlwpMwdPIfhAkpv6FqEI4GwNO0uAwabpd48BxqNxRK+IuKlvr4DRkaQrcsk3injz
         oog+TtszxtKUq3Ns0Giuz2feC7SjLCZQ/SzEMzWTfN9eGlb/O67kux3GEgCbDBLx/70X
         UioA==
X-Gm-Message-State: AC+VfDy5obBM9CndQriod3o2VZPYG95vvtmBblvXZ9xcepD8WTo5xLWE
	HVj8xUlXXLpbvvgUJlh78N7L6Vgv6557iyhLWODa
X-Google-Smtp-Source: ACHHUZ7m7iuWUD5omxnx19xTgvLnN/+5Wgfo2oM56GLLAkTkIZomD+UUzUvvSVfeDFHavflonxguaAqx7fdYrFqY+DA=
X-Received: by 2002:a81:53c5:0:b0:55d:c2c3:fbb8 with SMTP id
 h188-20020a8153c5000000b0055dc2c3fbb8mr34245755ywb.40.1684338674184; Wed, 17
 May 2023 08:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230517131102.934196-5-arnd@kernel.org> <e1a07eed22cb33af2733bdffe42b09f0.paul@paul-moore.com>
 <83422cf8-5d77-4e2f-a854-c2b9a9a94d75@app.fastmail.com>
In-Reply-To: <83422cf8-5d77-4e2f-a854-c2b9a9a94d75@app.fastmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 May 2023 11:51:03 -0400
Message-ID: <CAHC9VhQZyxVhDb0uB-+q7H=e++yq0qEAZGssPjepgnZ3i3_pnA@mail.gmail.com>
Subject: Re: [PATCH 4/14] audit: avoid missing-prototype warnings
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, Eric Paris <eparis@redhat.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, audit@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_085116_792864_FC84778C 
X-CRM114-Status: GOOD (  14.23  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMTA6NTHigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPiBPbiBXZWQsIE1heSAxNywgMjAyMywgYXQgMTY6MzMsIFBhdWwgTW9v
cmUgd3JvdGU6Cj4gPiBPbiBNYXkgMTcsIDIwMjMgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+ID4gV2UgcHJvYmFibHkgc2hvdWxkIG1vdmUgdGhlIGF1ZGl0X3Nlcmlh
bCgpIGFuZCBhdWRpdHNjX2dldF9zdGFtcCgpCj4gPiBhd2F5IGZyb20gdGhlIHdhdGNoL21hcmsv
dHJlZSBmdW5jdGlvbnMsIGJ1dCB0aGF0IGlzbid0IHlvdXIgcHJvYmxlbS4KPiA+Cj4gPiBBbnl3
YXksIHRoaXMgbG9va3Mgb2theSB0byBtZTsgZG8geW91IGhhdmUgYSBwcm9ibGVtIGlmIEkgbWVy
Z2UgdGhpcwo+ID4gdmlhIHRoZSBhdWRpdC9uZXh0IGJyYW5jaCBvciB3ZXJlIHlvdSBob3Bpbmcg
dG8gaGF2ZSB0aGlzIGdvIGluCj4gPiB0aHJvdWdoIGEgZGlmZmVyZW50IHRyZWU/Cj4KPiBNZXJn
aW5nIGl0IHRocm91Z2ggeW91ciB0cmVlIGlzIHByb2JhYmx5IGJlc3QsIEFuZHJldyBjYW4gZWl0
aGVyCj4gcGljayB0aGUgb25lcyB0aGF0IG5vYm9keSBlbHNlIHRvb2ssIG9yIEkgY2FuIHJlc2Vu
ZCB0aGUgcmVzdC4KCkVhc3kgZW5vdWdoLCBtZXJnZWQgdG8gYXVkaXQvbmV4dCwgdGhhbmtzLgoK
LS0gCnBhdWwtbW9vcmUuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
