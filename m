Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B88C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 03:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYQiRrOX/SHnprQ6KxZsqC0MnaEOAEx8Z23dULz6r98=; b=PpGH3qq6sekoaP
	j8OKSHXAWf55AAAQSjyNIuSWJZV8b62znjCZfDqLvnctYMPFQjtSFz5GMn0n57T8mq0Pt47z5Wphw
	vFEZK/ZhrNtRRDewcfqvc1H5K7N1MZ6vMboptiBJhxBgDkxWjt6KSihCwM52rlUToM6eJ8kLbzS46
	Nd0mx9TFevw3Ofz5mfcKMpmp7mjZ2G/Kbqsq/SWxKhJRgHwxlOJt66gsQD/9cRZUidjC9F3FC0pHX
	azZ8BTRYOwNgbfZs67KzXU+6P2yQuGINUuKoIV0i+q4+xCIIDfGLCs9KNKid0rY/nuS5fGjG6oSGB
	jL4Sic2cFmkVqC2+8lTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd28I-001uiI-8H; Sat, 09 Apr 2022 03:51:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd28E-001ugS-SJ
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 03:51:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso6816689wme.2
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 20:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hjV85bpMkNJuL8vvhI9IAAgoX1lYtvK7CB2b32NFcGE=;
 b=2WTmPakhdY7m3RR1J07Q3HKF1lUUw9xYcvbeLmdmCbGu1QsrzEF4yovjQ0w0PTqUP8
 ttUY4tWy+XJwxrc5eD98+gpJlyvafAhc5eahueerCdGExOWlMyceUC4SSm3BEAWLpoyX
 bsJdfVmNiSmv38SYHT3dlVZt/EStxBgDHN9WuZ3jj8tElkN2+eLulHgK4z+qjG6AuZEZ
 JEnEE39kL7T9irPQd/LL8aplExKzX14Ib9lV2E/eIugV2sd+u5TLYpsWJTBiU2ja4mYF
 UmQNAKfH6PykEeJvOrTXhKGFherqje+MPiA4F74VK9myrEuen1txu7tXO0Iqv2D/XgW3
 Wmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hjV85bpMkNJuL8vvhI9IAAgoX1lYtvK7CB2b32NFcGE=;
 b=q64fswDwrgcdKGWptwiSXTdbk9md5bTf7gWjGKRI2vmpdkPKab9qQrDauHbYcuC6wB
 iGLlkWZTHPJng0KEvRW44InBrJMf4M6zMCyu4Be2JAu7TEmnD4kdWFTExTD3GW04PNTu
 IRD54tfFf4Lq2F/KSezNbzFk+pw/MRdoxeQMsJZcqwwTKqKGi4ytBxh8NDzYS6vRkRRT
 2qv/hqM4QRGrkDRWviQYiCg0sAaH/MiW6EJq8rCrpFac1uE0IeUAurgU6NpAtetQLYQN
 8kDM4EAUgjQy3XbjF8JRgVKMNZs30xge9/9XBgzLinksqLJVRwICO3spbF+QkbzoVh75
 YDnw==
X-Gm-Message-State: AOAM532edthnXenMNDVuaxFaqacT73TMstngsOf4HuVoNzhSVMTOmvlO
 bk6hMX3uX2FCWgOF7rjDbOYZCLHIQNtvjeAEPW2+2A==
X-Google-Smtp-Source: ABdhPJyLzclFI9xwJ/UwHbG50eZvcrZ5NNZ72tDpou23WT/C53Yz/iLCM/pefwav/FSn5lluityAclN+tIZJY/VOdss=
X-Received: by 2002:a05:600c:1d04:b0:38c:ba2f:88ba with SMTP id
 l4-20020a05600c1d0400b0038cba2f88bamr19619710wms.137.1649476284108; Fri, 08
 Apr 2022 20:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220408092415.1603661-1-heiko@sntech.de>
In-Reply-To: <20220408092415.1603661-1-heiko@sntech.de>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 Apr 2022 09:21:11 +0530
Message-ID: <CAAhSdy0ZPH2a9D0jDNhp5OU2oRdvC-wZcu0Zjtcq9ZhMWcrMng@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: include missing hwcap.h into vcpu_fp
To: Heiko Stuebner <heiko@sntech.de>
Cc: Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_205127_201165_037BB81D 
X-CRM114-Status: GOOD (  15.69  )
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

T24gRnJpLCBBcHIgOCwgMjAyMiBhdCAyOjU0IFBNIEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gdmNwdV9mcCB1c2VzIHRoZSByaXNjdl9pc2FfZXh0ZW5zaW9uIG1l
Y2hhbmlzbSB3aGljaCBnZXRzCj4gZGVmaW5lZCBpbiBod2NhcC5oIGJ1dCBkb2Vzbid0IGluY2x1
ZGUgdGhhdCBoZWFkIGZpbGUuCj4KPiBXaGlsZSBpdCBzZWVtcyB0byB3b3JrIGluIG1vc3QgY2Fz
ZXMsIGluIGNlcnRhaW4gY29uZGl0aW9ucwo+IHRoaXMgY2FuIGxlYWQgdG8gYnVpbGQgZmFpbHVy
ZXMgbGlrZQo+Cj4gLi4vYXJjaC9yaXNjdi9rdm0vdmNwdV9mcC5jOiBJbiBmdW5jdGlvbiDigJhr
dm1fcmlzY3ZfdmNwdV9mcF9yZXNldOKAmToKPiAuLi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmM6
MjI6MTM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhyaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZeKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KPiAgICAyMiB8ICAgICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxh
YmxlKCZpc2EsIGYpIHx8Cj4gICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+IC4uL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZnAuYzoyMjo0OTogZXJyb3I6IOKA
mGbigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4gICAgMjIgfCAg
ICAgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgmaXNhLCBmKSB8fAo+Cj4g
Rml4IHRoaXMgYnkgc2ltcGx5IGluY2x1ZGluZyB0aGUgbmVjZXNzYXJ5IGhlYWRlci4KPgo+IEZp
eGVzOiAwYTg2NTEyZGMxMTMgKCJSSVNDLVY6IEtWTTogRmFjdG9yLW91dCBGUCB2aXJ0dWFsaXph
dGlvbiBpbnRvIHNlcGFyYXRlIHNvdXJjZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVi
bmVyIDxoZWlrb0BzbnRlY2guZGU+CgpJIGhhdmUgcXVldWVkIHRoaXMgZm9yIFJDIGZpeGVzLgoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmMgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9mcC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9mcC5jCj4gaW5kZXggNDQ0OWE5
NzZlNWE2Li5kNDMwOGM1MTIwMDcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9m
cC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9mcC5jCj4gQEAgLTExLDYgKzExLDcgQEAK
PiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAjaW5jbHVkZSA8bGludXgva3ZtX2hvc3QuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+
Cj4gICNpZmRlZiBDT05GSUdfRlBVCj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfZnBfcmVzZXQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+IC0tCj4gMi4zNS4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
