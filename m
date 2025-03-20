Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1DFC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhK08NI+M8QZDSmPOs+t2PS+tnJ720OdpINfd93ghLc=; b=AWphvnWfZ9m/Ll
	5E2n1SL6a9xO/sg+plfPzPFiqCwOc1bqWTib98Nh01zgzJbcBb2MrstLhRLA0D3/97/Sl/4VMStL+
	1HE5GLGMakztUV+i1Yf4MtYnGkzw1SOC7OI8FfX/JXxCFy/aZVlPXKbwZJM4vVSyAIyIVsMdEou2M
	9scUNki5C1xKviOC3aalCAWyHtaKmVy1I/MeS67ibY5ZvipGJ3hvjLqoL/HcdxsPIV+VkImIshc4c
	pVLsjTqh6wnh7FaP6j5zX10rkFACcOrVfiitqdtH+SPlmgq0/BLZOaGfL9/Mx2Wx4lnU50VwRGXrB
	ad7cTOpGQm0m7RjDYcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvF0Q-0000000C7EY-3coQ;
	Thu, 20 Mar 2025 12:28:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEyJ-0000000C6vC-2BAN
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 12:26:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso5092355e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742473562; x=1743078362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8ZNXPFVzOU94mt6m9mbPGIBWqdibsgDwCTGYVYUKFE=;
        b=wShEFx4ifmdDNtF5pUMHFRyVSsdOIHeIWqtEkaslbJxT8hkHck7aWyOYUhOW5mG1aM
         TnGX6oXdWxh46PLuUjuMWUPF/gJ8MtqXNmjipRTyDT0+mDzzua5B2EU2sIykGO/lCPlP
         dE2TZ2xQFTn74oaAXslFmCOjm8GNx3GAXISqEv1izmy92oBFFaqSaOEiRT2UewfQcPjr
         5ZVwT/yeop/tOv6O2oSyi9EezKLtbPH0aaWHmT2tnyPycaRjQgY0pYIWw3cAXLEoeIa/
         Z25Hqb6CMo48ljLoVx+aygxM9c8EL7fSZTWoqPiuKJsGrLEDwOlRq1BDeNLeJmLK12Gt
         3KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473562; x=1743078362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8ZNXPFVzOU94mt6m9mbPGIBWqdibsgDwCTGYVYUKFE=;
        b=tyAMGqEvWSo5J75alvbrybdgTm11M/dBfqQNnz37B0ufNMwAielsjQSs6690feWAuN
         raeh6IH3l2IQXwB/xkipI/3awSxiWv/aCQbGcYcTG6eaNzWGj0/tXC6smO4Srp8N/xED
         VWcTStLdt44dWzRysaXNjcOJ7OX9BFUaQiKVLtTPSI+5K3eOnJU1/N8fvkq90cTLLBkJ
         +97kGq0MJclxMAqeHWhXE6G/Si1x1yOAmzUEF1jSo/EULmu+bdmjo1WMbPsNyWj0CVJE
         /CMYm183MZzwkcnwLx9BiZ5RFy1n+ezmEUvrA8PvS5A3btFWRd6uQs3ZLORRHhxDq0Fh
         foCw==
X-Forwarded-Encrypted: i=1; AJvYcCXmo5jLABAAR5lsZpAFtlrm1UtsCnxAEdDtM1+pJZOphK8IxN4O9sn0UV1fcGsNVLVmAn7Ws0/9cypOjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+uWlZ9Ff+jEPf6dixaYPgqbh/RUta7cJJ4tzHuEgSJBXH1TTA
	L2egrYaTY5nxUVHRQL1yFRvvmTWfNNN/WSWwxLh+mUyy6gltoyV1e3f7gjuu2F1qVO1mhQvJV5d
	cGh8=
X-Gm-Gg: ASbGncuXhauoFTqQgN0OLlj9swu4zHMRq7FZeDoViqkMYp/jTHtWIQpRjgyTrBSeXWO
	XGmQqZZU7XNMo6Q48Zo0R7bZodZ/stvQeIuzzC/aNpgBwCyTxULWvnTh16HcbsWGYrho56WE4Ve
	0r0U0u7gu8/QY0S1uyrOKPEz9gSCMOXWQqOWZUum/F4eyeH3LOFvRCJ0GDC1szgbJUMdv058C66
	SBPxno+VdIv3bOTXZJvxojAf5kPo9qaSQzMu0gblmCIlMwPsDA6LJqdlfGx/fzwXE1kQsIdQCXo
	YmuCDrqhLKC8FL6Ufx5sTgeh73gNmbZailp+uBX+4ZOH5+CLT75+5JY0GEW6Ss+y48EStyUw9t6
	22KXrDoMOhAK9JQ==
X-Google-Smtp-Source: AGHT+IFnoeXcjNAxgR/nncQsW47FJFX+8xYUDmI97yV8HuiwXCeccO5v+DsUKuiyYhZi6nrc3nxEYg==
X-Received: by 2002:a05:600c:4503:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43d437c330fmr74088995e9.15.1742473561773;
        Thu, 20 Mar 2025 05:26:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35ecsm23914546f8f.16.2025.03.20.05.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:26:01 -0700 (PDT)
Message-ID: <8115698f-3cf7-4a6a-83cf-9dc288c84ee0@rivosinc.com>
Date: Thu, 20 Mar 2025 13:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <20250319-46b625cf8b771616d4c7c053@orel>
 <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
 <20250320-5f9612f1b503c79c9b185b10@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250320-5f9612f1b503c79c9b185b10@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_052603_689041_5C7574F4 
X-CRM114-Status: GOOD (  17.74  )
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

CgpPbiAyMC8wMy8yMDI1IDEyOjUyLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBNYXIg
MjAsIDIwMjUgYXQgMDk6MTY6MDdBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxOS8wMy8yMDI1IDE4OjA4LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBGcmks
IERlYyAwNiwgMjAyNCBhdCAwNTozMDo1OFBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+PiAuLi4KPj4+PiAraW50IGFyY2hfc3NlX2luaXRfZXZlbnQoc3RydWN0IHNzZV9ldmVudF9h
cmNoX2RhdGEgKmFyY2hfZXZ0LCB1MzIgZXZ0X2lkLCBpbnQgY3B1KQo+Pj4+ICt7Cj4+Pj4gKwl2
b2lkICpzdGFjazsKPj4+PiArCj4+Pj4gKwlhcmNoX2V2dC0+ZXZ0X2lkID0gZXZ0X2lkOwo+Pj4+
ICsJc3RhY2sgPSBzc2Vfc3RhY2tfYWxsb2MoY3B1LCBTU0VfU1RBQ0tfU0laRSk7Cj4+Pj4gKwlp
ZiAoIXN0YWNrKQo+Pj4+ICsJCXJldHVybiAtRU5PTUVNOwo+Pj4+ICsKPj4+PiArCWFyY2hfZXZ0
LT5zdGFjayA9IHN0YWNrICsgU1NFX1NUQUNLX1NJWkU7Cj4+Pj4gKwo+Pj4+ICsJaWYgKHNzZV9p
bml0X3NjcyhjcHUsIGFyY2hfZXZ0KSkKPj4+PiArCQlnb3RvIGZyZWVfc3RhY2s7Cj4+Pj4gKwo+
Pj4+ICsJaWYgKGlzX2tlcm5lbF9wZXJjcHVfYWRkcmVzcygodW5zaWduZWQgbG9uZykmYXJjaF9l
dnQtPmludGVycnVwdGVkKSkgewo+Pj4+ICsJCWFyY2hfZXZ0LT5pbnRlcnJ1cHRlZF9zdGF0ZV9w
aHlzID0KPj4+PiArCQkJCXBlcl9jcHVfcHRyX3RvX3BoeXMoJmFyY2hfZXZ0LT5pbnRlcnJ1cHRl
ZCk7Cj4+Pj4gKwl9IGVsc2Ugewo+Pj4+ICsJCWFyY2hfZXZ0LT5pbnRlcnJ1cHRlZF9zdGF0ZV9w
aHlzID0KPj4+PiArCQkJCXZpcnRfdG9fcGh5cygmYXJjaF9ldnQtPmludGVycnVwdGVkKTsKPj4+
PiArCX0KPj4+PiArCj4+Pj4gKwlyZXR1cm4gMDsKPj4+Cj4+PiBIaSBDbMOpbWVudCwKPj4+Cj4+
PiBUZXN0aW5nIFNTRSBzdXBwb3J0IHdpdGggdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jp
c2N2L3NiaV9wbXVfdGVzdAo+Pj4gbGVkIHRvIGFuIG9wZW5zYmkgc2JpX3RyYXBfZXJyb3IgYmVj
YXVzZSB0aGUgb3V0cHV0X3BoeXNfbG8gYWRkcmVzcyBwYXNzZWQKPj4+IHRvIHNiaV9zc2VfcmVh
ZF9hdHRycygpIHdhc24ndCBhIHBoeXNpY2FsIGFkZHJlc3MuIFRoZSByZWFzb24gaXMgdGhhdAo+
Pj4gaXNfa2VybmVsX3BlcmNwdV9hZGRyZXNzKCkgY2FuIG9ubHkgYmUgdXNlZCBvbiBzdGF0aWMg
cGVyY3B1IGFkZHJlc3NlcywKPj4+IGJ1dCBsb2NhbCBzc2UgZXZlbnRzIGdldCB0aGVpciBwZXJj
cHUgYWRkcmVzc2VzIHdpdGggYWxsb2NfcGVyY3B1KCksIHNvCj4+PiBpc19rZXJuZWxfcGVyY3B1
X2FkZHJlc3MoKSB3YXMgcmV0dXJuaW5nIGZhbHNlIGV2ZW4gZm9yIGxvY2FsIGV2ZW50cy4gSQo+
Pj4gbWFkZSB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8gZ2V0IHRoaW5ncyB3b3JraW5nLgo+Pgo+
PiBIaSBBbmRyZXcsCj4+Cj4+IERpZCBzb21ldGhpbmcgY2hhbmdlZCByZWNlbnRseSA/IEJlY2F1
c2UgSSB0ZXN0ZWQgdGhhdCB3aGVuIGl0IHdhcyBzZW5kCj4+IChQTVUgKyBzb21lIGtlcm5lbCBp
bnRlcm5hbCB0ZXN0c3VpdGUpIGFuZCBkaWRuJ3Qgc2F3IHRoYXQuIEFueXdheSwgSSdsbAo+PiBy
ZXNwaW4gaXQgd2l0aCB5b3VyIGNoYW5nZXMgYXMgd2VsbC4KPiAKPiBJdCBkZXBlbmRzIG9uIHRo
ZSBrZXJuZWwgY29uZmlnLiBDb25maWdzIHRoYXQgZG9uJ3QgaGF2ZSBtYW55Cj4gYWxsb2NfcGVy
Y3B1KCkgY2FsbHMgcHJpb3IgdG8gdGhlIG9uZSBtYWRlIGJ5IHNzZSBjYW4gd29yaywgYmVjYXVz
ZSwKPiBpaXVjLCBhbGxvY19wZXJjcHUoKSB3aWxsIGdldCBpdHMgYWxsb2NhdGlvbiBmcm9tIHRo
ZSBwZXJjcHUgYWxsb2NhdG9yJ3MKPiBmaXJzdCBjaHVuayB1bnRpbCB0aGF0IGNodW5jayBmaWxs
cyB1cC4gVGhlIGZpcnN0IGNodW5jayBpcyBzaGFyZWQgd2l0aAo+IHRoZSBzdGF0aWMgYWxsb2Nh
dGlvbnMuCgpNYWtlcyBzZW5zZSAhIFRoYW5rcywgSSdsbCBsb29rIGF0IGl0LgoKPiAKPiBUaGFu
a3MsCj4gZHJldwo+IAo+Pgo+PiBUaGFua3MgIQo+Pgo+PiBDbMOpbWVudAo+Pgo+Pj4KPj4+IFRo
YW5rcywKPj4+IGRyZXcKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3Nl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zc2UuYwo+Pj4gaW5kZXggYjQ4YWU2OWRhZDhkLi5mNDY4
OTM5NDYwODYgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zc2UuYwo+Pj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc3NlLmMKPj4+IEBAIC0xMDAsMTIgKzEwMCwxMiBAQCBpbnQg
YXJjaF9zc2VfaW5pdF9ldmVudChzdHJ1Y3Qgc3NlX2V2ZW50X2FyY2hfZGF0YSAqYXJjaF9ldnQs
IHUzMiBldnRfaWQsIGludCBjcAo+Pj4gICAgICAgICBpZiAoc3NlX2luaXRfc2NzKGNwdSwgYXJj
aF9ldnQpKQo+Pj4gICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9zdGFjazsKPj4+Cj4+PiAtICAg
ICAgIGlmIChpc19rZXJuZWxfcGVyY3B1X2FkZHJlc3MoKHVuc2lnbmVkIGxvbmcpJmFyY2hfZXZ0
LT5pbnRlcnJ1cHRlZCkpIHsKPj4+ICsgICAgICAgaWYgKHNzZV9ldmVudF9pc19nbG9iYWwoZXZ0
X2lkKSkgewo+Pj4gICAgICAgICAgICAgICAgIGFyY2hfZXZ0LT5pbnRlcnJ1cHRlZF9zdGF0ZV9w
aHlzID0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGVyX2NwdV9wdHJfdG9f
cGh5cygmYXJjaF9ldnQtPmludGVycnVwdGVkKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdmlydF90b19waHlzKCZhcmNoX2V2dC0+aW50ZXJydXB0ZWQpOwo+Pj4gICAgICAg
ICB9IGVsc2Ugewo+Pj4gICAgICAgICAgICAgICAgIGFyY2hfZXZ0LT5pbnRlcnJ1cHRlZF9zdGF0
ZV9waHlzID0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmlydF90b19waHlz
KCZhcmNoX2V2dC0+aW50ZXJydXB0ZWQpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwZXJfY3B1X3B0cl90b19waHlzKCZhcmNoX2V2dC0+aW50ZXJydXB0ZWQpOwo+Pj4gICAg
ICAgICB9Cj4+Pgo+Pj4gICAgICAgICByZXR1cm4gMDsKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZS5jIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9yaXNj
dl9zc2UuYwo+Pj4gaW5kZXggNTExZGI5YWQ3YTllLi5mZWYzNzUwNDZmNzUgMTAwNjQ0Cj4+PiAt
LS0gYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZS5jCj4+PiArKysgYi9kcml2ZXJz
L2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZS5jCj4+PiBAQCAtNjIsMTEgKzYyLDYgQEAgdm9pZCBz
c2VfaGFuZGxlX2V2ZW50KHN0cnVjdCBzc2VfZXZlbnRfYXJjaF9kYXRhICphcmNoX2V2ZW50LAo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0KTsKPj4+ICB9Cj4+Pgo+Pj4gLXN0YXRpYyBi
b29sIHNzZV9ldmVudF9pc19nbG9iYWwodTMyIGV2dCkKPj4+IC17Cj4+PiAtICAgICAgIHJldHVy
biAhIShldnQgJiBTQklfU1NFX0VWRU5UX0dMT0JBTCk7Cj4+PiAtfQo+Pj4gLQo+Pj4gIHN0YXRp
Ywo+Pj4gIHN0cnVjdCBzc2VfZXZlbnQgKnNzZV9ldmVudF9nZXQodTMyIGV2dCkKPj4+ICB7Cj4+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9yaXNjdl9zc2UuaCBiL2luY2x1ZGUvbGludXgv
cmlzY3Zfc3NlLmgKPj4+IGluZGV4IDE2NzAwNjc3ZjFlOC4uMDZiNzU3YjAzNmIwIDEwMDY0NAo+
Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9yaXNjdl9zc2UuaAo+Pj4gKysrIGIvaW5jbHVkZS9saW51
eC9yaXNjdl9zc2UuaAo+Pj4gQEAgLTgsNiArOCw3IEBACj4+Pgo+Pj4gICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+Cj4+PiArI2luY2x1ZGUg
PGFzbS9zYmkuaD4KPj4+Cj4+PiAgc3RydWN0IHNzZV9ldmVudDsKPj4+ICBzdHJ1Y3QgcHRfcmVn
czsKPj4+IEBAIC0xNiw2ICsxNywxMSBAQCBzdHJ1Y3QgZ2hlczsKPj4+Cj4+PiAgdHlwZWRlZiBp
bnQgKHNzZV9ldmVudF9oYW5kbGVyKSh1MzIgZXZlbnRfbnVtLCB2b2lkICphcmcsIHN0cnVjdCBw
dF9yZWdzICpyZWdzKTsKPj4+Cj4+PiArc3RhdGljIGlubGluZSBib29sIHNzZV9ldmVudF9pc19n
bG9iYWwodTMyIGV2dCkKPj4+ICt7Cj4+PiArICAgICAgIHJldHVybiAhIShldnQgJiBTQklfU1NF
X0VWRU5UX0dMT0JBTCk7Cj4+PiArfQo+Pj4gKwo+Pj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfU1NF
Cj4+Pgo+Pj4gIHN0cnVjdCBzc2VfZXZlbnQgKnNzZV9ldmVudF9yZWdpc3Rlcih1MzIgZXZlbnRf
bnVtLCB1MzIgcHJpb3JpdHksCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
