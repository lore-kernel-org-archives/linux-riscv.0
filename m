Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DE3C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmKdepdEto/qhyinkD7QQ7232WTeAlSTG7gKL6voyb0=; b=x0ARY7MVreALPJ
	yGZ4uB18lrZgWblicx2pqyzEKizRWy/h/oU8yT6OH6y8VXYradEG+EkX+be1ESycUJPkxe2p6PGb1
	fdIO3ueDJJz8mHEfp6SWU3/c3MFcxjRJkhF+fXPD+e7LYJbwvUcv0Apwa2c5ccwrFW9r4yvOsITjq
	AZEElPyljMFf5ejwMGbtdRhgL3TLhiLKgB3R18V44OU/jGoBG0/ii5kdaCoMjx+LwzR9zl3cfjVOl
	19dUpBuBL7GIZHd4uLuAl+XS2tds9zOk+2U8aky3HXb00ieXKO1u4hppDXoc84eZU4G484dXAzkxE
	T/DWFhYQ23YIfFQUXzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD0OS-0000000A3rP-3EFS;
	Fri, 31 May 2024 11:25:56 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD0OO-0000000A3pH-1a1G
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 11:25:55 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-36db3a124f3so7113025ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717154750; x=1717759550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRu+fvt96wDh21HWdZk+AUFYcHjCXJ/UFo9OhBPmYL4=;
        b=cMw6EcGuJmYqqbqGJBdSNqUcK+kRYoCiWa78re1LHECG0PxbCpFDQQyP8N27ZwmssJ
         LV8TaBi9HpSZloSvyJHLrcDYYMvy9f8i/OLiGr5y4qiLUzEEnwnMdqOQ8nSakvIdodFF
         T0MLQkpacB7T2R7ZfxR2BVX11a5+hurwNZJC9C5bJ+rwhEr+TR01DNJbTwhqvDKLj/CJ
         fLBo2aX6DfpDEVp0TUQTsl17tIPTQbQVZXzcyQoqPtqBgJ4hDUFlUTb9yhcRvgIM8dxO
         s+NozQU/64qjl1XxhNT2BOj0TZKohxMcrgZPnUEOUJkoBr6oPzxKahG/umoowUEtPq98
         XVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717154750; x=1717759550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRu+fvt96wDh21HWdZk+AUFYcHjCXJ/UFo9OhBPmYL4=;
        b=oMVXGVhD4RyaVIyAZyAJkZatQH8vrNn3N1Pi402tItdd9gaUz4XX6yd26n5WR5lFUe
         BYn1grjyg+LiLj2POAy7dpIGZMWDChPcRAcfscDlH2eal6C2eHY4upwfmdbNSvKx9KAN
         06Q5R8TjDtj/Qcsqc5+pesFFKeDUJuX8LUNzyHlxWoOqKXPInXmrMEMdcBfDiYLlG0NY
         JV2nlBMpus/VMn8ItRfSBGuU3mWDI8PMn+UNMcTX1SPfow5bFkEFwMMcY6c8yjdNjPfO
         rUBsVJRo4bitYexNOXuJ+6bTbcTBRikGEQfaMFJKapeRN9oKNkzUGAdXA9ChZCtTqU+9
         zbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Oia2cyi+jODyYX2gY6s4LIcdKPaNuz53JKtwsO1jeSGbyhMmGGXASkDPW9bhX9RZmzN6ovcwmTrDMsYancYalwaSX6hPw0sVUSvFNkmy
X-Gm-Message-State: AOJu0YwSGPZgno7CeKGXwdhvE4eEsTkmE6h9W7QDUpBi1du3PHk6u1vH
	ilmcutMIez1xfNj/vxTmT5ZMbWnugdVk6pHbMqDdOpNECCqdsqG9Lb0arfRa9HlCcfWMezOHHxi
	KOotugWi4OohRoTo76sO9tRW2FtCKMp3As9hEag==
X-Google-Smtp-Source: AGHT+IERmtusbSx5VguMq+IRGISAME3Fo9I1nHszmWxBFaYwO8ur28ukLLI5CchbhXRWskUNyQH3RjcBWJXIgZMDsHc=
X-Received: by 2002:a05:6e02:b27:b0:374:6472:d923 with SMTP id
 e9e14a558f8ab-3748b8fd182mr18921045ab.0.1717154750045; Fri, 31 May 2024
 04:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240411090639.237119-1-apatel@ventanamicro.com>
In-Reply-To: <20240411090639.237119-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 May 2024 16:55:37 +0530
Message-ID: <CAAhSdy3+q1aLgTro5N_UerXjaW7fTGxjpOPKkyR+-GMru-gZMw@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM RISC-V HW IMSIC guest files
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_042552_668535_6CF658CD 
X-CRM114-Status: GOOD (  11.71  )
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

T24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgMjozNuKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGV4dGVuZHMgdGhlIEhXQUNDRUwg
YW5kIEFVVE8gbW9kZXMgb2YgQUlBIGluLWtlcm5lbCBpcnFjaGlwCj4gdG8gdXNlIEhXIElNU0lD
IGd1ZXN0IGZpbGVzIHdoZW5ldmVyIHVuZGVybHlpbmcgaG9zdCBzdXBwb3J0cyBpdC4KPgo+IFRo
aXMgc2VyaWVzIGRlcGVuZHMgdXBvbiB0aGUgIkxpbnV4IFJJU0MtViBBSUEgc3VwcG9ydCIgc2Vy
aWVzIHdoaWNoCj4gaXMgYWxyZWFkeSBxdWV1ZWQgZm9yIExpbnV4LTYuMTAuCj4gKFJlZmVyLCBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMzA3MTQwMzA3LjY0NjA3OC0xLWFwYXRl
bEB2ZW50YW5hbWljcm8uY29tLykKPgo+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQg
aW4gdGhlIHJpc2N2X2t2bV9haWFfaHdhY2NlbF92MSBicmFuY2gKPiBhdDogaHR0cHM6Ly9naXRo
dWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4KPiBBbnVwIFBhdGVsICgyKToKPiAgIFJJU0MtVjog
S1ZNOiBTaGFyZSBBUExJQyBhbmQgSU1TSUMgZGVmaW5lcyB3aXRoIGlycWNoaXAgZHJpdmVycwo+
ICAgUklTQy1WOiBLVk06IFVzZSBJTVNJQyBndWVzdCBmaWxlcyB3aGVuIGF2YWlsYWJsZQoKUXVl
dWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjExCgpSZWdhcmRzLApBbnVwCgo+Cj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9hcGxpYy5oIHwgNTggLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhX2ltc2ljLmggfCAzOCAt
LS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAgICAg
ICB8IDM1ICsrKysrKysrKy0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgICAg
ICAgICAgICAgfCAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgICAgICAgICAg
ICB8ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxMTMgZGVsZXRpb25zKC0p
Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfYXBs
aWMuaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlh
X2ltc2ljLmgKPgo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
