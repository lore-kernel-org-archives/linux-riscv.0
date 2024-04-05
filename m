Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C71CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhlrmqFKyDvvL7VK7VF6jJ6tQphxMRCAM0itBcQ9IaM=; b=3vqeD2vuLXvyL/
	Uu8faNEI0Bz9hVuoXLpJk2mqH97solO26lMmbQNL6FuNBtU2AtAsMYSOfszFXg/LQpMAalhzXZoTi
	pdvKHGXPkmQoKySj+ePGGEeTW8dy3ONMa8C25oY4JUbvF+qzCH+x4KpTsWCjw70hIZt/3xn0ZCMAc
	POPsgdde4kldsX5FL/ne1STmRuS+dl5VL1Yc39SDKELyIjsXNwVLAZPUqfVtcoEamuMmVgtnsbpjS
	ukLzkF7rySz4Jk9PlWniOk34SKxZv+Fpkyj0gLupCLFSNhcKyybmaX/LxbHNRzPRr6kYPMnQw/2UT
	/QTh4Xf8g8mmxE1mRN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnS5-00000008FSn-0Vc4;
	Fri, 05 Apr 2024 17:34:09 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnS0-00000008FN0-2t6n
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 17:34:07 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dcc73148611so2708041276.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712338436; x=1712943236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3vmfqpd94g8+suqMPyLrxBzyLzdFpbPlGZ8DqHjkxQ=;
        b=ES1Nj8h5E4BD8oOqnyWrBeV6/xyQzpXBY583AFwLHUW98UKGkM9Zqwa1cSDUS+hD0s
         oobpk58O42ekDlfLRFaD2tuTxvbdWOsTjW3Y+eUIV2Dd96MN0HWsQy1wJJL3vN9UFBWS
         sh6C8QddhogdSYZ1tHbxHYB6bXBekL1BZBv4HXuUa1gLbQ9QFMvbJJFb3CDT9X9/iqzJ
         y5iwWC3qEe5Ccw2Ve/T84iuVz0j+yJy3ZRW9etsa9HBkm/arIwYY0cgP0hhCpWcYu4lB
         BXrXJJ4ZTZSSD9TwxRJE2tvN9u6Ki4ML+o/deuGQxJEvBahLRCSRGdoIiBarzSzy8jT5
         tB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712338436; x=1712943236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3vmfqpd94g8+suqMPyLrxBzyLzdFpbPlGZ8DqHjkxQ=;
        b=XIAE86r1aoemYtZEAIM9PduF8M4tov5yDIDqpXx2jWUcADaG2h4UxtP6rTypoQlRXd
         sb2LVY8BssAuhuDvqKdfOPI4piEtElMuDJqLascBQXxn1mHI0zVbijmc5Q8FPOfXtrsq
         Ex4+FaqJHDI2q2FudGJH0ctrUrXvlrfu3+ixtNC1Vy+JYBaDktaCr5tdRX9oobLmN9w2
         OeIHuG31nQ3H+xMpMtNaVu2byvmEF91M2ho4GX/T2MBNO0PDqyi/5ah2dzJgNLkhvuxL
         edXRpDqkaXxS+2Forj4psXsHEdfkx1ZhKvSLaB7TDyV6aIzUBpccAlT5UN9unDU5GmMz
         0wKA==
X-Forwarded-Encrypted: i=1; AJvYcCXZaahZfRXjAY87WKR2e/xgCFmJ0bD70/SSRpHe+/o5k3jjEIi+6tWPfAKVq83JuzQXbpJrV+RFKZeQuWHAphAO4J9mb/AxFZjmEspcFsoS
X-Gm-Message-State: AOJu0YzYmi6dY1UL7h7sKGw7yJE5OdZuqlZRNfjBS3vW9C1gCtKUmsYP
	kDVNgtj5iN1wxoxdxubSJ5vagQbYy9L3H4gxoqpUK0M+VW5kfyctwAlZH19x4bLc9K1QKM8IKxc
	tKFRkCJQxyl0rg+x9BbHGx3iQhye9c0MatFP4Hg==
X-Google-Smtp-Source: AGHT+IHnKrc4PwDyhWJPdfeFqqNSHEu/4FbT6H+bcXEG7hzOD320BvkD3M+wSU/pjaJrd/w5bdcvFXKhZ2+tWNjNqrs=
X-Received: by 2002:a25:f50b:0:b0:dda:a608:54bf with SMTP id
 a11-20020a25f50b000000b00ddaa60854bfmr1849823ybe.56.1712338435998; Fri, 05
 Apr 2024 10:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240404103254.1752834-1-cleger@rivosinc.com> <20240405-091c6c174f023d74b434059d@orel>
In-Reply-To: <20240405-091c6c174f023d74b434059d@orel>
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 5 Apr 2024 10:33:48 -0700
Message-ID: <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_103404_831291_781A73A3 
X-CRM114-Status: GOOD (  16.29  )
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

T24gRnJpLCBBcHIgNSwgMjAyNCBhdCA4OjI24oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEFwciAwNCwgMjAyNCBhdCAxMjozMjo0
NlBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPiBUaGUgWmltb3AgSVNBIGV4dGVu
c2lvbiB3YXMgcmF0aWZpZWQgcmVjZW50bHkuIFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydAo+ID4g
Zm9yIHBhcnNpbmcgaXQgZnJvbSByaXNjdixpc2EsIGh3cHJvYmUgZXhwb3J0IGFuZCBrdm0gc3Vw
cG9ydCBmb3IKPiA+IEd1ZXN0L1ZNLgo+Cj4gSSdtIG5vdCBzdXJlIHdlIG5lZWQgdGhpcy4gWmlt
b3AgYnkgaXRzZWxmIGlzbid0IHVzZWZ1bCwgc28gSSBkb24ndCBrbm93Cj4gaWYgd2UgbmVlZCB0
byBhZHZlcnRpc2UgaXQgYXQgYWxsLiBXaGVuIGFuIGV4dGVuc2lvbiBjb21lcyBhbG9uZyB0aGF0
Cj4gcmVkZWZpbmVzIHNvbWUgTU9QcywgdGhlbiB3ZSdsbCBhZHZlcnRpc2UgdGhhdCBleHRlbnNp
b24sIGJ1dCB0aGUgZmFjdAo+IFppbW9wIGlzIHVzZWQgZm9yIHRoYXQgZXh0ZW5zaW9uIGlzIHJl
YWxseSBqdXN0IGFuIGltcGxlbWVudGF0aW9uIGRldGFpbC4KCk9ubHkgc2l0dWF0aW9uIEkgc2Vl
IHRoaXMgY2FuIGJlIHVzZWZ1bCBpcyB0aGlzOi0tCgpBbiBpbXBsZW1lbnRlciwgaW1wbGVtZW50
ZWQgWmltb3BzIGluIENQVSBzb2xlbHkgZm9yIHRoZSBwdXJwb3NlIHRoYXQgdGhleSBjYW4KcnVu
IG1haW5saW5lIGRpc3RybyAmIHBhY2thZ2VzIG9uIHRoZWlyIGhhcmR3YXJlIGFuZCBkb24ndCB3
YW50IHRvIGxldmVyYWdlIGFueQpmZWF0dXJlIHdoaWNoIGFyZSBidWlsdCBvbiB0b3Agb2YgWmlt
b3AuCgpBcyBhbiBleGFtcGxlIHppY2ZpbHAgYW5kIHppY2Zpc3MgYXJlIGRlcGVuZGVudCBvbiB6
aW1vcHMuIGdsaWJjIGNhbgpkbyBmb2xsb3dpbmcKCjEpIGNoZWNrIGVsZiBoZWFkZXIgaWYgYmlu
YXJ5IHdhcyBjb21waWxlZCB3aXRoIHppY2Zpc3MgYW5kIHppY2ZpbHAsCmlmIHllcyBnb3RvIHN0
ZXAgMiwgZWxzZSBnb3RvIHN0ZXAgNi4KMikgY2hlY2sgaWYgemljZmlzcy96aWNmaWxwIGlzIGF2
YWlsYWJsZSBpbiBodyB2aWEgaHdwcm9iZSwgaWYgeWVzCmdvdG8gc3RlcCA1LiBlbHNlIGdvdG8g
c3RlcCAzCjMpIGNoZWNrIGlmIHppbW9wIGlzIGF2YWlsYWJsZSB2aWEgaHdwcm9iZSwgaWYgeWVz
IGdvdG8gc3RlcCA2LCBlbHNlIGdvdG8gc3RlcCA0CjQpIFRoaXMgYmluYXJ5IHdvbid0IGJlIGFi
bGUgdG8gcnVuIHN1Y2Nlc3NmdWxseSBvbiB0aGlzIHBsYXRmb3JtLAppc3N1ZSBleGl0IHN5c2Nh
bGwuIDwtLSB0ZXJtaW5hdGlvbgo1KSBpc3N1ZSBwcmN0bCB0byBlbmFibGUgc2hhZG93IHN0YWNr
IGFuZCBsYW5kaW5nIHBhZCBmb3IgY3VycmVudCB0YXNrCjwtLSBlbmFibGUgZmVhdHVyZQo2KSBs
ZXQgdGhlIGJpbmFyeSBydW4gPC0tIGxldCB0aGUgYmluYXJ5IHJ1biBiZWNhdXNlIG5vIGhhcm0g
Y2FuIGJlIGRvbmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
