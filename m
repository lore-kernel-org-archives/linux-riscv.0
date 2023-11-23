Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD192C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRUjk3Ww7dOIToxqYuwMq8NjyATX3L+lTc4OCRLgTFo=; b=CCuZ7lAuzG2Wwi
	bpaLN1UQYWO6YBwJqPK3If87ywwA//P437KgVAcdZVw4JRlUgpU4P03ZBsF5AaDAsjCHSdYyZVTeD
	MI21U4ndmciojam9qVKJJQQ6KFuZdQ8OxSvZg1GideRkOXZKxAF0zb+HRJrA5wNhYPbC2RjNdcLld
	rYl8mWDR8Ciq/92ct3yW7R0sGcDGP2Jb5tPIh0Z/5vhCksiDO0PR9n33hD7SaQbsOFVfltGgkZ740
	zqeqXHYeTD/XPIfYp/CP2HCXr6ArwUz40WtwNiU7Apb7kH40caKsjFsJ68HIbVRR7UorqUsEJoN/N
	AiS8ITen+HCdZ1xax9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r676m-004P6j-1i;
	Thu, 23 Nov 2023 10:38:56 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r676j-004P3i-2O
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 10:38:54 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5b9a456798eso455659a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700735929; x=1701340729; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtWJos9eJonIZMcnZ3qHTztIEX4OrKTTJCiVLASavc8=;
        b=US0MsMNhRlV3XfxXeN3JUzc+aBW62g0K2vThDS7wuEby/S6r/xCDiT68MD/MVCoKNg
         ZvlPYpAFbKRc8cwEb1nLzzfO9xm09jVY5wZcskJtuEmGxUghJ9Uq6h8tyVs1B5KygxW1
         7LLD7hnhR5kYKZFfR2p90KTDZsUwNx1/pVBfmuzAYw3ATMtb5AF1if4U5r44wr6ggBq5
         Kab8YDpwcbt+U9CiJ7L9PHo45HOEGQndXx9GbAFekstrzKmWudKwh3iV5xOmQTGgRES2
         axsJa+jlVNoD/1fzMiiFP4w1PTHRybpQVNtEdoYPmUsAZPSz4h9uzFOtXU6rOTS/TftN
         mF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735929; x=1701340729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtWJos9eJonIZMcnZ3qHTztIEX4OrKTTJCiVLASavc8=;
        b=nj74ksq2CddwuooFpSUR4cGPFyq/h82TbuvZEHe6JLij2iyUbOS022ZGpuoWqwW1nX
         a2MnLAbOmTdJ1On9T+vefWKCmZmZZV/QldbypqXEcEywaa6alOMwZJsqyMgTCTqwARmp
         i4ww59gCzQS22kJ8Z7ixqlbfJYypoGICoGpDVIwfgRZp9fwhFt+HkGEnyutmmoMPulKv
         8twAyKXHSXqGviIXWUAvHS8axnmVnAZ/iFH8co2e03WjnFhI5qR0eFrMY3OFrv5tMTTK
         9TROUCcD7+oDBg+GvH0B1mWa2wbZn396JLR0JxtteAlEBLWsloxW9D99ZE/w0s078Yvr
         JS7Q==
X-Gm-Message-State: AOJu0YwTWwol22y27IdZmeFk+99JbPayhi3qlvNxqVbdPQeJlJVwqqIY
	XnssTzDoNEVpl/RANVcqLKK8fP83+fkPgOAeZYPguw==
X-Google-Smtp-Source: AGHT+IHvryOzXWmfb9qEZWfYxLmtqn4CX5rtr/8r6s4TMLtNZgUWu2Uht2WYKwskvoiWScCKfk/YfcsxnyZ6UyDhj40=
X-Received: by 2002:a05:6a20:be9c:b0:187:200a:713f with SMTP id
 gf28-20020a056a20be9c00b00187200a713fmr3721171pzb.23.1700735928664; Thu, 23
 Nov 2023 02:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-2-apatel@ventanamicro.com> <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
In-Reply-To: <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:08:36 +0530
Message-ID: <CAK9=C2U9aJDDd0JUhRqyLCF3dfyY5QBUrgyH+PKsT+pUKiB1xQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_023853_776072_C0635C42 
X-CRM114-Status: GOOD (  17.07  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgNDowNuKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDIzLTExLTE3
IDk6MzggUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgZnVuY3Rpb25zIHNiaV9jb25zb2xl
X3B1dGNoYXIoKSBhbmQgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpIGFyZQo+ID4gbm90IGRlZmluZWQg
d2hlbiBDT05GSUdfUklTQ1ZfU0JJX1YwMSBpcyBkaXNhYmxlZCBzbyBsZXQgdXMgYWRkCj4gPiBz
dHViIG9mIHRoZXNlIGZ1bmN0aW9ucyB0byBhdm9pZCAiI2lmZGVmIiBvbiB1c2VyIHNpZGUuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
Cj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCA1ICsrKysrCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+
ID4gaW5kZXggMDg5MmY0NDIxYmM0Li42NmYzOTMzYzE0ZjYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCj4gPiBAQCAtMjcxLDggKzI3MSwxMyBAQCBzdHJ1Y3Qgc2JpcmV0IHNiaV9lY2FsbChp
bnQgZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBsb25nIGFyZzAsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBhcmczLCB1bnNpZ25lZCBsb25nIGFyZzQsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmc1KTsKPiA+Cj4gPiArI2lmZGVmIENPTkZJ
R19SSVNDVl9TQklfVjAxCj4gPiAgdm9pZCBzYmlfY29uc29sZV9wdXRjaGFyKGludCBjaCk7Cj4g
PiAgaW50IHNiaV9jb25zb2xlX2dldGNoYXIodm9pZCk7Cj4gPiArI2Vsc2UKPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgc2JpX2NvbnNvbGVfcHV0Y2hhcihpbnQgY2gpIHsgfQo+ID4gK3N0YXRpYyBp
bmxpbmUgaW50IHNiaV9jb25zb2xlX2dldGNoYXIodm9pZCkgeyByZXR1cm4gLUVOT0VOVDsgfQo+
Cj4gIlRoZSBTQkkgY2FsbCByZXR1cm5zIHRoZSBieXRlIG9uIHN1Y2Nlc3MsIG9yIC0xIGZvciBm
YWlsdXJlLiIKPgo+IFNvIC1FTk9FTlQgaXMgbm90IHJlYWxseSBhbiBhcHByb3ByaWF0ZSB2YWx1
ZSB0byByZXR1cm4gaGVyZS4KCkFjdHVhbGx5LCBJIGhhZCAtMSBvdmVyIGhlcmUgcHJldmlvdXNs
eSBidXQgYmFzZWQgb24gR3JlZ0tIJ3MKc3VnZ2VzdGlvbiwgd2UgYXJlIG5vdyByZXR1cm5pbmcg
cHJvcGVyIExpbnV4IGVycm9yIGNvZGUgaGVyZS4KCkFsc28sIGFsbCB1c2VycyBvZiBzYmlfY29u
c29sZV9nZXRjaGFyKCkgb25seWwgZXhwZWN0IGEgbmVnYXRpdmUKdmFsdWUgdXBvbiBlcnJvciBz
byBiZXR0ZXIgdG8gcmV0dXJuIHByb3BlciBMaW51eCBlcnJvciBjb2RlLgoKPgo+IFJlZ2FyZHMs
Cj4gU2FtdWVsCj4KPiA+ICsjZW5kaWYKPiA+ICBsb25nIHNiaV9nZXRfbXZlbmRvcmlkKHZvaWQp
Owo+ID4gIGxvbmcgc2JpX2dldF9tYXJjaGlkKHZvaWQpOwo+ID4gIGxvbmcgc2JpX2dldF9taW1w
aWQodm9pZCk7Cj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
