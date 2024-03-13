Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E7AC54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 00:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kE/j53hzV2Ir+5VfIy9eugoJGiRNUoTRkQo9i9DtvB0=; b=ELQMj7wz590ykt
	XOrYf1PTrTRhBIkNDtJt3pov8wdM9cGqkbrYzWXdyePmhIQQN0kicQYKf17C9ToDp0g/EO2P3dDxt
	tTc2nRAn2qlOjiz0rCh64FwZrEDgu5l52E1QBTUIcmSyaEadbPAqgi5R7rM1XRhhIuJ+FJ+aDniXD
	Y55VJBw/J6w514woRtgUuRyo6dsVB5K4O8k7r2PNIzSIIr78XFsz8xHuV94YrMaBOj9LrwOAhRII5
	AoVJavNzxW3DG5C30zz9/S5s+VR5G4mh/mFmRk3YiaSGDu9I7Plr/ySngfOK+ayl4MOU58DLEVrbi
	GrrHBufvqmaRpdE+oVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkC5F-000000083hs-376T;
	Wed, 13 Mar 2024 00:03:01 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkC5C-000000083hC-1sgc
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 00:03:00 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d459a0462fso18307691fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 17:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1710288176; x=1710892976; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LXIQ2t9B9tlKxIFmVpIbsuvM0fdiRMQcnpUCijHCX0=;
        b=QSLbEYMklFcfuOa6NOUVK7vhaGy+h1AK8qgVQcKmXI5JCcd79KQfXieSklf77lOYy3
         9Arve3i7LUWKJsTmihBCuVPTCkQkITN62wx0SwjRbH4ufoyB7JKW7P1siYvIkVsHz87N
         7eyelIW3uVt4K9ytY4paM3U6S7S/+mONtvD2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710288176; x=1710892976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LXIQ2t9B9tlKxIFmVpIbsuvM0fdiRMQcnpUCijHCX0=;
        b=VNwDBdErZj10moLKeZ/nfn/3prb3oAFrG36ZW+w/UCIoZ7E587roZxJUaiY1twK7/u
         8hf0+jjhIYiVqT/2RaU3Mi+PhfKLG7uDmPNGN5rHJYk8vuGvVlxZ+rWQH8ZwAK+86tx8
         DLSevtiJL+mdeZbILE2aPsXOB7w+fr7hqZtGJ0qoutvom5q0M8Iv0LmyFdZFoYS9rvFU
         ruTaA+KC/JDNqmXzcuSqw0RUuO2WuQ3alb4hGnz4NSmoSNIsCL0OxMedp9CXaIqzBR1T
         y3AhAgp3R7nRpvorRH+pC5OP6gH11e6Y1Hu4cL5TSLQb0w+HinCgZJJsCpYYc6VH8lx4
         U1VQ==
X-Gm-Message-State: AOJu0YxkNIBQKWezBfcTonIRv2DTmuDv7AMf5ePtcUeetPY+Bozmg6fT
	uT6N0fG5eSELyxyfgIMWBBfUambq74Nh5vgHPlpobo143GeuAmuUYQn5outXxfUlTi3LRmlJDJA
	6UFDgSN3WWlKyvumWsD+C0v0yvwgc+DUzq6ct
X-Google-Smtp-Source: AGHT+IGZsATRpTX776OjpN4lHr4il4qWuaFbIiIYmDKSYv0NfG7GzWk0CuC1f/PjbueJu2m8uzSbrVyk/ai5dTwfQoY=
X-Received: by 2002:a2e:9bd4:0:b0:2d2:50ba:e5b6 with SMTP id
 w20-20020a2e9bd4000000b002d250bae5b6mr7186845ljj.10.1710288175940; Tue, 12
 Mar 2024 17:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn>
In-Reply-To: <CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Mar 2024 17:02:44 -0700
Message-ID: <CAOnJCUK7OMq97y__M98G1r24zQFQbkyNgxrVdj5tVFJF6znXrA@mail.gmail.com>
Subject: Re: RISC-V PMU driver issue
To: =?UTF-8?B?6Zu35Y2a5ra1?= <garthlei@pku.edu.cn>
Cc: linux-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_170259_077488_A51283EC 
X-CRM114-Status: GOOD (  13.95  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgNzo0OeKAr1BNIOmbt+WNmua2tSA8Z2FydGhsZWlAcGt1
LmVkdS5jbj4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBJIGFtIGhhdmluZyBwcm9ibGVtcyB3aXRo
IHRoZSBSSVNDLVYgUE1VIGRyaXZlci4gVGhlIG92ZXJmbG93IGhhbmRsZXIgb2YgbXkgY3VzdG9t
IHBlcmYgZXZlbnQga2VybmVsIGNvdW50ZXIgc2VlbXMgdG8gcmVhZCBhbiBpbmNvcnJlY3QgdmFs
dWUgZnJvbSB0aGUgZXZlbnQuCgpJZiBJIHVuZGVyc3RhbmQgeW91IGNvcnJlY3RseSwgeW91IGhh
dmUgYSBjdXN0b20ga2VybmVsIGNvdW50ZXIgZm9yCnRoZSBwZXJmIGV2ZW50ID8gQ2FuIHlvdSBl
eHBsYWluIHRoZSB1c2UgY2FzZSBmb3IgdGhhdCA/Cgo+IEl0IHNlZW1zIHRoYXQgdGhlIGlzc3Vl
IGxpZXMgaW4gdGhlIGZ1bmN0aW9uIGByaXNjdl9wbXVfZXZlbnRfc2V0X3BlcmlvZGAsIHdoaWNo
IHNldHMgYHByZXZfY291bnRgIHRvIGEgbmV3IHZhbHVlIGJ1dCBkb2VzIG5vdCBtb2RpZnkgdGhl
IHVuZGVybHlpbmcgaGFyZHdhcmUgY291bnRlci4gV2hlbiBgcGVyZl9ldmVudF9yZWFkX3ZhbHVl
YCBnZXRzIGNhbGxlZCBsYXRlciBpbiB0aGUgdXNlci1kZWZpbmVkIG92ZXJmbG93IGhhbmRsZXIs
IGByaXNjdl9wbXVfZXZlbnRfdXBkYXRlYCB3aWxsIHVwZGF0ZSB0aGUgYGNvdW50YCBmaWVsZCBh
Z2FpbiBiYXNlZCBvbiB0aGUgdW5tb2RpZmllZCBoYXJkd2FyZSBjb3VudGVyIHZhbHVlIGFuZCB0
aGUgbW9kaWZpZWQgYHByZXZfY291bnRgIGZpZWxkLCB3aGljaCBjYXVzZXMgYW4gaW5jb3JyZWN0
IHJlYWRpbmcuCgpXaGF0IGRvIHlvdSBtZWFuIGJ5IHVzZXIgZGVmaW5lZCBvdmVyZmxvdyBoYW5k
bGVyID8gVGhlIG92ZXJmbG93CmhhbmRsZXIgcmVnaXN0ZXJlZCB2aWEgdGhlIGN1c3RvbSBwZXJm
IGV2ZW50IGtlcm5lbCBjb3VudGVyIHdoaWNoIGdldHMKaW52b2tlZCBmcm9tIHBlcmZfZXZlbnRf
b3ZlcmZsb3cgPwoKPiBJIG5vdGljZWQgdGhhdCBvdGhlciBQTVUgZHJpdmVycywgc3VjaCBhcyB0
aGUgQVJNIG9uZSwgd3JpdGUgdG8gdGhlIHVuZGVybHlpbmcgY291bnRlciBpbiB0aGVpciBzZXRf
cGVyaW9kIGZ1bmN0aW9ucywgd2hpY2ggcHJldmVudHMgdGhlIHByb2JsZW0uIEhvd2V2ZXIsIHRo
ZSBSSVNDLVYgU0JJIHNwZWNpZmljYXRpb24gZG9lcyBub3QgaGF2ZSBzdWNoIGFuIEFQSSB0byB3
cml0ZSB0byBhIGNvdW50ZXIgd2l0aG91dCBzdGFydGluZyBpdC4gVXNpbmcgYGxvY2FsNjRfcmVh
ZCgmaHdfZXZ0LT5wZXJpb2RfbGVmdCkgPD0gMGAgZGlyZWN0bHkgYXMgdGhlIGd1YXJkIGNvbmRp
dGlvbiB0byBwbGFjZSBgcmlzY3ZfcG11X2V2ZW50X3NldF9wZXJpb2QoZXZlbnQpYCBhZnRlciBp
dCBzZWVtcyB0byB3b3JrLCBidXQgSSBhbSBub3Qgc3VyZSB3aGV0aGVyIGl0IGNhbiBjYXVzZSBv
dGhlciBpc3N1ZXMuCgpOb3Qgc3VyZSB0aGUgZXhhY3QgY29kZSBwYXRoIHlvdSBhcmUgcmVmZXJy
aW5nIHRvLiBZb3UgZG9uJ3Qgd2FudCB0bwppbnZva2UgIHJpc2N2X3BtdV9ldmVudF9zZXRfcGVy
aW9kIGlmIHBlcmlvZF9sZWZ0IDw9IDAgPwoKPgo+IFRoYW5rIHlvdSwKPiBCb2hhbiBMZWkKCgot
LSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
