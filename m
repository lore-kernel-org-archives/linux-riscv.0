Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D87C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rQFX3WxQ742+rICjCbPaGCEhYme2JX1xlJ+PZemMs8=; b=cInjdcu0NNR1Cf
	6R9k/k6BEijdm7npdBQ1xYxXx0Z2G0OpXUAiMr8ZAIgn6hbuCyzuEOaCwrjUzSOVEyB1gqMEVawQa
	iHsRGoUuGviZ5lr2eRBOmpSh1llUXMavoKrcga7ukj6x0L2rV6TVHNq04I00pvLj7hW5s469aBkhY
	GIywbuPa2G/37jNu2riUTQB/B4NSNQMjNBBqMacXShvW5MzCNhTSkWNG4ni4JuRscJJc3ut2pS/XW
	dPl2ikEHO3715OwkIAFxKfbcodO+Jf9vR8Yw049uTqjuUYHLH6za+HzeqHdSVRctC6mKENaqVJWb3
	uU4gY2Jp8rO8VljxggAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucORi-0000000AE5t-06CP;
	Thu, 17 Jul 2025 13:14:46 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNKX-0000000A3sN-1WDp
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 12:03:19 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-87c04c907eeso13646039f.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752753796; x=1753358596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdczZfWBYlBsJGjMXmJfIpSAsQhEzzJLRKIMejj7UJA=;
        b=2lQu/+IMszzm720qgaZTR0yNVTYfoadBJEPbWJ/KSL6GZ2Gnam0CpL1/o2j78+yYgw
         IZiZO7aPdgCdKbUid5FDwv6v0Vjp7nUmFACobWMv56JCxJy6k8NAF/AERf0bV6B5CTsN
         cQL0hf8dI4RKLxAk/L1nb3dlwSm2iPG5ox0rhW69lGIpdsM1Rq/shoa6OjRA4z9a2QET
         xfkIgvAxB8B+IUTXHfCS+3H1OzhwITshk9xRl+GD1VeQU6KS+TxAhQAgLSgjHqKbZD1q
         FK6pyhcazFwpbmr0W0jhzfGoHTl0yQyfd2/KkImR16kBbL/URRCCwWf5mpPSZJsXQcPS
         iCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753796; x=1753358596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdczZfWBYlBsJGjMXmJfIpSAsQhEzzJLRKIMejj7UJA=;
        b=gzZGWVmfIVU08YIHN8pMJoS579oN82j88eI45qVQpCWIaor8KJUcswv/iMWJIF9QBO
         QD2QXmEq6FJlq9ZBgBtyehwZ9hFL1F4mItjx91sVrxlNhXZ82+KuR3QYETfuZeWjGyG+
         zVoEsUx+LI/YEfvMwg/s32f2NorIcu2DGs2oLVUnOaqNba2IWx5TZ53A80+DKaCFb1lQ
         11idMCHJmpULERJq0moKHefnyhA7ID/Evb4mB51OXTorg9i5n/nYGzqIi9Rzph6unaqe
         YAjk+ssh6d/SSUQ9i/a4SwVuT2k+16OIkWMW1j+pCRKlguDxk4Q8HK1IYAwzG8PB9WoT
         SPXw==
X-Forwarded-Encrypted: i=1; AJvYcCXjVgz2bLh6yHwz1svzhLVXUPX60oBqn8H73634mHr2a7djmvBKnrtbQ/NYsIxZP5+u3V7uE2lBMfYxUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YziF/ee8Z4rON0qBFW/71SkVeJapyPVsLaUGtIqlK2qi39lieOE
	gEyPGKmBbkao8ytAWZGsirqJjl6CQ0OQMCof6UHz0bKe/Z74PlIJj6QbKZYJVnMZu9ZzODMP0FI
	1t1RZBUVsElZnrcjovz/t2+eGTIkFp5AACsEkVgXvCA==
X-Gm-Gg: ASbGncuq7N+KrC10juu9uvDOm85z41NIbaBwj4kxlZZ3oWnI80XI2vY1aXA+8otL6F/
	Q3arOZwoysr5ELv/XPtECIJONJL9sIBb8quG1EsEUdgCaduzGsms7aRFW+qPstAhJExwrrVKBoN
	sgzELMolgIpOjwFjej/QLRXvOrzFcYV+YG2Ua4mfPjzNxI9dWR3BqYog6qvS4RmK/j26s10VJqq
	mGgwqUnDfYv9ag=
X-Google-Smtp-Source: AGHT+IEIPZpywuhs1CvUOSh4UNExbMIYSBBP4YpBBndeSSlxDKRJE4v/uEqa/SeaPqJ739w3Q/p24P3FjwMeUrY6uKw=
X-Received: by 2002:a05:6602:6016:b0:875:bc7e:26ce with SMTP id
 ca18e2360f4ac-879c2519d3amr647026439f.0.1752753796201; Thu, 17 Jul 2025
 05:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
In-Reply-To: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 17:33:02 +0530
X-Gm-Features: Ac12FXzaP5e6ToyKGdPw9vauuEDoz4G5gaSf7T3TkFpqI1hEBh5Tf1rGli--9AE
Message-ID: <CAAhSdy0BvhZ_TsaKEK3j+0kNQYRekVyfHOFh=eAkj2H7Znrm1g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_050317_521297_BB225B24 
X-CRM114-Status: GOOD (  15.54  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMzozMOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gVGhl
IGNhbGxlciBoYXMgYWxyZWFkeSBwYXNzZWQgaW4gdGhlIG1lbXNsb3QsIGFuZCB0aGVyZSBhcmUK
PiB0d28gaW5zdGFuY2VzIGB7a3ZtX2ZhdWx0aW5fcGZuL21hcmtfcGFnZV9kaXJ0eX1gIG9mIHJl
dHJpZXZpbmcKPiB0aGUgbWVtc2xvdCBhZ2FpbiBpbiBga3ZtX3Jpc2N2X2dzdGFnZV9tYXBgLCB3
ZSBjYW4gcmVwbGFjZSB0aGVtCj4gd2l0aCBge19fa3ZtX2ZhdWx0aW5fcGZuL21hcmtfcGFnZV9k
aXJ0eV9pbl9zbG90fWAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlz
Y2FzLmFjLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTcKClRoYW5rcywKQW51cAoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDEwODdlYTc0NTY3
Yi4uZjkwNTlkYWMzYmEzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjQ4LDcgKzY0OCw4IEBAIGludCBrdm1fcmlz
Y3ZfZ3N0YWdlX21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUZBVUxUOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBoZm4gPSBrdm1fZmF1bHRpbl9w
Zm4odmNwdSwgZ2ZuLCBpc193cml0ZSwgJndyaXRhYmxlLCAmcGFnZSk7Cj4gKyAgICAgICBoZm4g
PSBfX2t2bV9mYXVsdGluX3BmbihtZW1zbG90LCBnZm4sIGlzX3dyaXRlID8gRk9MTF9XUklURSA6
IDAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmd3JpdGFibGUsICZwYWdlKTsK
PiAgICAgICAgIGlmIChoZm4gPT0gS1ZNX1BGTl9FUlJfSFdQT0lTT04pIHsKPiAgICAgICAgICAg
ICAgICAgc2VuZF9zaWdfbWNlZXJyKEJVU19NQ0VFUlJfQVIsICh2b2lkIF9fdXNlciAqKWh2YSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtYV9wYWdlc2hpZnQsIGN1cnJlbnQp
Owo+IEBAIC02NzAsNyArNjcxLDcgQEAgaW50IGt2bV9yaXNjdl9nc3RhZ2VfbWFwKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+Cj4gICAg
ICAgICBpZiAod3JpdGFibGUpIHsKPiAtICAgICAgICAgICAgICAgbWFya19wYWdlX2RpcnR5KGt2
bSwgZ2ZuKTsKPiArICAgICAgICAgICAgICAgbWFya19wYWdlX2RpcnR5X2luX3Nsb3Qoa3ZtLCBt
ZW1zbG90LCBnZm4pOwo+ICAgICAgICAgICAgICAgICByZXQgPSBnc3RhZ2VfbWFwX3BhZ2Uoa3Zt
LCBwY2FjaGUsIGdwYSwgaGZuIDw8IFBBR0VfU0hJRlQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2bWFfcGFnZXNpemUsIGZhbHNlLCB0cnVlKTsKPiAgICAgICAgIH0g
ZWxzZSB7Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
