Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A39C27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYL8V3wBDJrSFvD5944rWegmVY8qSncTfSrIz90gVAQ=; b=qexk9AKAfJf26S
	6OdboeVicT48opNCzRbmDZoXKWau479VkxVupQ6pPa423+eFGm2ijUw60tv5I5qE2MDIZzo+7fl2M
	HPyn6wH3i5P509uz/yfKBhUun+8icG2bs12IPI7WXvwQNLD9bgDx5s/HANHfZC+ZWT79FYIrtGkMD
	37iyTzz7TYv0FXH1BjItymtoth7A7GBe/JrhEv+Ak+E7AQ7Ebpb3qwdzmKBTpS4WEt1RLtTV5+gxR
	U52NqwW1dCjhndSlko+yffNEwu+3jFD/iJu3FIqD7syRAux5nYcza1+aBAyS5nFo1NXALr3pHHakb
	xng0zjOAvbfMSk2BbW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXLq-0000000DdJT-2EbQ;
	Fri, 07 Jun 2024 11:01:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXLm-0000000DdIp-2SDR
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 11:01:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7041082a80aso363722b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717758095; x=1718362895; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DI5Qf78GNH3tyySodkUT6XiaCdZX8TQYwnH9rITzZzQ=;
        b=QooQxUVeK/6HjovlZi37ItzNZKSYhHJprIAJqHXMHXJ+XxQCJATxGLdzXUzODlCLBK
         GkNAht0/Y469+nXzzQu9jW8NpaEi+1cFaCTKAtRdy9VkGz5DmzjnwSUCR0MhWqo5eXOy
         mkmNN/AkJVolf6ttvVbufeafiSzf4C0rFWDLVZFK4NOEgWQohp1OMfAxjnWrWMiIE5ab
         t8sV0yFmtjL4pp416foJ0zm9QJDVY68Cv9JZTGGOdOLB+/6By4RVZtL4Rgjteb2QyQRr
         gEKJ7GzH0vFgcU8cOKUnUuUEcFxDXcq+7QZ/p+QcSvsB0SJnXwkyS+sbfT7+i8Xoer+7
         yExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717758095; x=1718362895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DI5Qf78GNH3tyySodkUT6XiaCdZX8TQYwnH9rITzZzQ=;
        b=qtRuag+EFL7RfzULM5cvg40aFWgMkOW+nnswBKnSycY9SjFnb6Lb+rSPvs8TcRIAbX
         ljTRvOvmGGLZiIhUQx1tJ8ioEOjiY4fL7gHlzH2+s/xFM8wPpw0qkTgcEIgQXdTmEoYs
         GdLM+Q+IopmsFH11Q0xfpNzzf9jGggcyiahj5fle09dZRIt4LrQpba5taeMuB3+qaXFt
         uDnA6f2hjapW3eBFNCkWCKrNjfmlYtXWTNQ7m4c/YtDj47ftajReOSovzACY8JbThD+0
         sLAZKd9sWMyD9KmKKg4Rj8+BZ6EbCFFJ3wgcqjXj0Bp/ksLL9y5M9G2l5gfrUlVr8jMu
         FLNg==
X-Forwarded-Encrypted: i=1; AJvYcCX05Zdfi6om9qh0S/uClww8lsmhKMr86lGtXNwuGRrxXaa1lGyM1VOPZtlX68+ik6OsU60H0IydWGF+KpjDm5u/Pfv4VA+IScAw7y/hPVoQ
X-Gm-Message-State: AOJu0YwJbc/lapbVylOgR4qO+1Al0KEpO2CJNMXy9HbAsWrIZiX7pIpI
	QfO0J5E9BCdn65HiPI801XniMWtgFrmjdkK8hGnXQmSakPUWx5WHZNNKKxAriD0=
X-Google-Smtp-Source: AGHT+IEb2Nma4FnB/zziymAMKluh4Fz3EE1abFeJCDOUaSefKlw97fNpT7MhuwmeNDFnkSZNMABPCw==
X-Received: by 2002:a05:6a00:982:b0:6f0:f54a:4e7a with SMTP id d2e1a72fcca58-7040c61952bmr2257589b3a.2.1717758095122;
        Fri, 07 Jun 2024 04:01:35 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd4951ffsm2371289b3a.131.2024.06.07.04.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:01:34 -0700 (PDT)
Date: Fri, 7 Jun 2024 16:31:25 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com,
	sudeep.holla@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH RESEND v5 3/3] RISC-V: Select ACPI PPTT drivers
Message-ID: <ZmLohXMgGrIvL7s7@sunil-laptop>
References: <20240523111322.19243-1-cuiyunhui@bytedance.com>
 <20240523111322.19243-3-cuiyunhui@bytedance.com>
 <CAEEQ3wnE+8FXXf76zapqNnC5vruoR9C-y0qjjFw47cHYP57MmQ@mail.gmail.com>
 <CAEEQ3w==wueTSDvEtJe+t7jamH2ERxta4uPLUFVwX2ueRLJ3Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w==wueTSDvEtJe+t7jamH2ERxta4uPLUFVwX2ueRLJ3Bw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_040139_523762_ECEBD2BA 
X-CRM114-Status: GOOD (  18.87  )
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

SGkgWXVuaHVpLAoKT24gRnJpLCBKdW4gMDcsIDIwMjQgYXQgMDQ6NDQ6MzZQTSArMDgwMCwgeXVu
aHVpIGN1aSB3cm90ZToKPiBIaSBTdW5pbHZsLAo+IAo+IAo+IE9uIE1vbiwgTWF5IDI3LCAyMDI0
IGF0IDg6NTHigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGkgUGFsbWVyLAo+ID4KPiA+IEdlbnRsZSBwaW5nIC4uLgo+ID4KPiA+IE9uIFRo
dSwgTWF5IDIzLCAyMDI0IGF0IDc6MTPigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFmdGVyIGFkZGluZyBBQ1BJIHN1cHBvcnQgdG8g
cG9wdWxhdGVfY2FjaGVfbGVhdmVzKCksIFJJU0MtViBjYW4gYnVpbGQKPiA+ID4gY2FjaGVpbmZv
IHRocm91Z2ggdGhlIEFDUEkgUFBUVCB0YWJsZSwgdGh1cyBlbmFibGluZyB0aGUgQUNQSV9QUFRU
Cj4gPiA+IGNvbmZpZ3VyYXRpb24uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBD
dWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogSmVyZW15IExp
bnRvbiA8amVyZW15LmxpbnRvbkBhcm0uY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogU3VkZWVwIEhv
bGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L0tj
b25maWcgfCAxICsKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmln
Cj4gPiA+IGluZGV4IGY5NjE0NDljYTA3Ny4uYTllYmVjZDcyMDUyIDEwMDY0NAo+ID4gPiAtLS0g
YS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+
IEBAIC0xNCw2ICsxNCw3IEBAIGNvbmZpZyBSSVNDVgo+ID4gPiAgICAgICAgIGRlZl9ib29sIHkK
PiA+ID4gICAgICAgICBzZWxlY3QgQUNQSV9HRU5FUklDX0dTSSBpZiBBQ1BJCj4gPiA+ICAgICAg
ICAgc2VsZWN0IEFDUElfUkVEVUNFRF9IQVJEV0FSRV9PTkxZIGlmIEFDUEkKPiA+ID4gKyAgICAg
ICBzZWxlY3QgQUNQSV9QUFRUIGlmIEFDUEkKTklUOiBJIHdvdWxkIGFkZCB0aGlzIHByaW9yIHRv
IEFDUElfUkVEVUNFRF9IQVJEV0FSRV9PTkxZLgoKPiA+ID4gICAgICAgICBzZWxlY3QgQVJDSF9E
TUFfREVGQVVMVF9DT0hFUkVOVAo+ID4gPiAgICAgICAgIHNlbGVjdCBBUkNIX0VOQUJMRV9IVUdF
UEFHRV9NSUdSQVRJT04gaWYgSFVHRVRMQl9QQUdFICYmIE1JR1JBVElPTgo+ID4gPiAgICAgICAg
IHNlbGVjdCBBUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGlmIFBHVEFCTEVfTEVWRUxTID4g
Mgo+ID4gPiAtLQo+ID4gPiAyLjIwLjEKPiA+ID4KPiA+Cj4gPiBUaGFua3MsCj4gPiBZdW5odWkK
PiAKPiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyBvciBhY2sgdGhpcyBwYXRjaHNldCBhZ2Fpbj8g
UGFsbWVyIGRpZCBub3QgcmVzcG9uZC4KPiAKPiBMaW5rOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjQwNTIzMTExMzIyLjE5MjQzLTMtY3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20vVC8KPiAKTXkgYmFkLCBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IEkgaGFk
IEFja2VkIGFscmVhZHkuIFRoZSBzZXJpZXMKbG9va3MgZ29vZCB0byBtZSBleGNlcHQgdGhlIG5p
dCBhYm92ZS4KClJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNv
bT4KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
