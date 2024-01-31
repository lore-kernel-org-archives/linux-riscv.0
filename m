Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A127C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrwf6MXHQSmLKGfpg956TboMRwqMfpCwdZFQaMvMM0Q=; b=xi1x33fTH+ezKw
	jwaJ49osoTGsRYuOIGn9dJTtvTYMURPQPGgMo8ArO0eLVHKhLlDtUD49GjNgryWgJFJWNwccX6tZT
	szgXYJxWDJ5xp7qNlfG1/oBDCL47V8Y7vJifbpnu2tvkMruFO0vAkcYZW3sjCbc0pHl8GtSP1L9hV
	dABz+XidcCIzJi7hz5l7VN4hQ0yquuzPWlWLZcS3g/6Dw7qlidStV4ov0mPhdOk60OrHbt5xnVnVB
	IFA33MN29xwIvqYqRO2ZGdHqVKvASRiKWa6ZnSJFOXRq+BpSwIJUVhp75RF6nsJhXhELa0AYr/8P6
	X1VzZlFUUQAK5O7GMosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVGWA-00000005Fw2-21cL;
	Wed, 31 Jan 2024 19:45:06 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVGW7-00000005Fug-122O
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 19:45:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d057b6df2aso2993021fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 11:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1706730301; x=1707335101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKbN+uel/8rBQ84eELsNs2WhqFyCvHjvoEFIVVMI1l4=;
        b=D9WFa7YgNC0u/7XNIjB83g7a4/hAIPk4awzv5shPDxalvHaN+WS8hxjk2xYrCTSaqo
         oZg6g78s3vsLuBNbjsiKccGTUZECzyqHN2ng06Ydo3vffUL7bY3eaJjSMP+J5AIO+Grw
         0ZJCKIWJFSXm17y0Tgn7Sqy2OJq+nKhV9BuDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706730301; x=1707335101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKbN+uel/8rBQ84eELsNs2WhqFyCvHjvoEFIVVMI1l4=;
        b=C5hLWzvWP/AWVPG3Gp8VtQAGjCcpaYGjnbJmfoz3e3GdCjOuWtLd/QJ0Ss6uIiXBb4
         +G1tX2MuygDFLw02UuNDPl1XZMCO2ik9GU2GcHPd7oXoCdn8Syk/fB5Pdrkl3Opjc8H+
         +S6AhR2vFDMVFKeQr8iee9US9js9YcsP7alk1Z5sPDhf9f+MnUnXxh/55HeMVYjhKkvQ
         jiOZ/EyVba57vgZf8vTKGloM8bmmtAGkq0Meiqr0XWflYeEBLqPxyCUduwKnPcJRcRRe
         WihTiQqUY406uoZHk27UgxkNZNmimKO7c1dz1D3mZTL+soiPh35kNjYMbIob3kk03Eah
         l3ZA==
X-Gm-Message-State: AOJu0YyW42BSEZiI/3Mf9FR2kl1dKIsJ5SjM0LR7RM7fNBXsDvVHwN9z
	QIxdsye3OjFRTpyEZV5CmlI+KGZJxnsALC5OgnidiOOh9Uo60HX7L7FNvaAQPvsKcUjmeCZ8htr
	jVnTC22sYoNvjp318in4Da20jp7fL2ySrfqXK
X-Google-Smtp-Source: AGHT+IH9kN97WztANS1sHAkn2GCgfqpbOR1mEuLJji6ReztKeKMlwP9mEGNsNGKj78xQKHc8NA/EahXEYI0MsWbJqsc=
X-Received: by 2002:a2e:9f52:0:b0:2cf:1c39:86eb with SMTP id
 v18-20020a2e9f52000000b002cf1c3986ebmr1906704ljk.31.1706730300498; Wed, 31
 Jan 2024 11:45:00 -0800 (PST)
MIME-Version: 1.0
References: <20240131120511.200338-5-ajones@ventanamicro.com> <20240131120511.200338-6-ajones@ventanamicro.com>
In-Reply-To: <20240131120511.200338-6-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 31 Jan 2024 11:44:49 -0800
Message-ID: <CAOnJCULJA4P4FhQv5uB-huw==oe1rLZ4dFevbVMzyTemYZnXEA@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: paravirt: steal_time should be static
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_114503_430458_C5B942F8 
X-CRM114-Status: GOOD (  14.02  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNDowNeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gc3RlYWxfdGltZSBpcyBub3QgdXNlZCBvdXRzaWRl
IHBhcmF2aXJ0LmMsIG1ha2UgaXQgc3RhdGljLAo+IGFzIHNwYXJzZSBzdWdnZXN0ZWQuCj4KPiBG
aXhlczogZmRmNjhhY2NjZmM2ICgiUklTQy1WOiBwYXJhdmlydDogSW1wbGVtZW50IHN0ZWFsLXRp
bWUgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFu
YW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3BhcmF2aXJ0LmMKPiBpbmRleCA4ZTExNGY1OTMwY2UuLjE1YzVkNDA0OGRiNSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXJhdmlydC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcGFyYXZpcnQuYwo+IEBAIC00MSw3ICs0MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNl
X25vX3N0ZWFsYWNjKGNoYXIgKmFyZykKPgo+ICBlYXJseV9wYXJhbSgibm8tc3RlYWwtYWNjIiwg
cGFyc2Vfbm9fc3RlYWxhY2MpOwo+Cj4gLURFRklORV9QRVJfQ1BVKHN0cnVjdCBzYmlfc3RhX3N0
cnVjdCwgc3RlYWxfdGltZSkgX19hbGlnbmVkKDY0KTsKPiArc3RhdGljIERFRklORV9QRVJfQ1BV
KHN0cnVjdCBzYmlfc3RhX3N0cnVjdCwgc3RlYWxfdGltZSkgX19hbGlnbmVkKDY0KTsKPgoKClJl
dmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCj4gIHN0YXRpYyBi
b29sIF9faW5pdCBoYXNfcHZfc3RlYWxfY2xvY2sodm9pZCkKPiAgewo+IC0tCj4gMi40My4wCj4K
CgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
