Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B42CCF9FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xpfJNcyQBX8nuVXsd1yx2uP3BoNckTSgwHK3dneUM4=; b=BkIfWw+EtRWkoh
	7Mi4FRvx9snABfKT/YKPJu6d3f/XPLaOKDinSgZutXg84bwNwMQsu31oaaBN03uqqjqvJyAox/Qd5
	0RAJsaL5fYe0J/hKuDMOZtGi6NQUZsGRfUWn6yd2v+j2zXeAt/gS+tRqV1PfXoUi7jC/pMFwVOpUa
	Em+dDXRzACpkSdaEARs1ocozh1DrKj7zS25Yq6qMMo0WIW1gn07c1UIseVkgW+UbHef7XXfVNId/x
	wQxdbgoYE2PVlJNmJak89+nlJPLs740ipP5WEnYdKkyQ8ccZf2fMK2tSIlEwakGJNltcwKoLQ/BUI
	eJfyrf3tcxaGAnI9VXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvGa-0000000A099-1qCM;
	Mon, 03 Nov 2025 14:10:40 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvGX-0000000A07z-41CH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 14:10:39 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7c28bf230feso4865502a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Nov 2025 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762179037; x=1762783837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JaPI4TOwc8pcjpYKYQR9osF0pTwnJUqTyqEhiCHODo=;
        b=lBckqIDzlDXLhDuoWL53A40cIYdivtHEmmDyvkqCJO+dfWuL3kd0Tl4Zu66/Kv7BFi
         P1aXDY6HyRJnca2FYfLU0RSlN4PAUs0VsMmrVPFRgjW8WeUC7l/p1f8b7cxTelWY1ncl
         r21NqK1v1iuXqxMvi407+UgQlew9iluOmJQrN3lM72HBlU+hit3p1MZkSNFY6zVKk1Nc
         XoRR7RQLQndiqBWxHeBqfzMoat+8crokK5m6QJ3pJ85nQyQH391KVfCYfh1O1NJmRmaH
         LJAr/nsmcxf3TofMX+env25/GsdEACUnU8N6dS3blZ8NBr5uUtdjpqL04W/ipRICuQfS
         mN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762179037; x=1762783837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JaPI4TOwc8pcjpYKYQR9osF0pTwnJUqTyqEhiCHODo=;
        b=BGaa4/1Yf80MLCNc++jx3ZueM+xCPRo6z2QG1xVj5C9QybNCvENVBPsn4G4wWhOegz
         6sTLk7c2P6dumHko7i9Jt7bGFOnx98KOVVAuO6vfRpjyEiOAjYdxGtCUVvaYiWbMBwIS
         /9CJhGL4sk4J4Vk7kSFgUMN+TFrwMVSGxvz+6MbpGCWNhUmqh8MZNMZqd09NiUvZUbPU
         zqMN85+uNaSQhXHu1/FJUtCEYI1JiODHKJlfcqIVVLqTDuavUiu0scpmcqZ9tIoN9mP/
         GhEyUe97dtLEixLkYjjR+wVSrIFQT57nygTffOwBQezXZCaJZ4yTMpJtPGJkcAfUILtj
         4d7g==
X-Forwarded-Encrypted: i=1; AJvYcCUct2WkvejXZmEVwTDT2oBh7jJc47o0ns1AMnalkvmX6BOBIBLz3eikgExfO4ofXt1ROdhpbqGvy6wC+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YytQQ1g/xz6nM0UOkg9BrBxxG6ToS7YVl+keoQIkUGbAHRptNTv
	LN/mphWuhjOj0RnU3+iY6NOp8Q/RZcmKr14eMd00WxawDuwxF6KOj8iWYgqaUa6DItlxeCp2l8A
	Qh0ONAJ/aUaMruc5TUU2x3BmbvQDex578iQdYwe5PRg==
X-Gm-Gg: ASbGncuLSyVQcwDoUz8t/e7Tn+cKx/iY2WestR8DR58HQkqm4v3Th0NlNb8Gmc3tA3T
	zETpYpaUk9wJnXcMAHX+hFYRia5aKcVgXVWVD9u8I0CNR6Ys9YC6qteh4Vx0XRe0DVxE8tta4eb
	WD1u8gen45uiREAo/hZsMfEg3KrSjzxR6CewkGrM4eQkVtCVi+K+M5EV8NJIc+/KWCfBoPSqMU2
	zjBelxtHHBVJwV+Fy/p+SQMxON+y0ghUFQeD/h0SWv6+H/TeXiHnv/+H7n7seUkqlxm/8tFdD3C
	5MUka49q
X-Google-Smtp-Source: AGHT+IH003xd/z7vMYdYr/htcUUGBamI3Mhgf3J747VLZKVMmuby2I02PMB4X/i1lIibUxhRhuJgj0cQRxtddc4mmfo=
X-Received: by 2002:a05:6808:331a:b0:44f:8ccd:c489 with SMTP id
 5614622812f47-44f9538d80fmr5983206b6e.25.1762179036704; Mon, 03 Nov 2025
 06:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
 <20251027133431.15321-4-cuiyunhui@bytedance.com> <20251028-scallion-list-c8aa5f350286@spud>
 <DDTYKLFUE3M0.17GD0S4OSQG16@ventanamicro.com>
In-Reply-To: <DDTYKLFUE3M0.17GD0S4OSQG16@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 3 Nov 2025 22:10:25 +0800
X-Gm-Features: AWmQ_bnrk5zzhmENTE3zzUyyuY5snirkUQxon433_6W_9CsF90gdobpBao0iCQU
Message-ID: <CAEEQ3wk8w1q8Ujpq+6fyRPP+zqTy6_q22K-g681VZyVXstPaDg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] riscv: crash: use NMI to stop the CPU
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	atishp@rivosinc.com, cleger@rivosinc.com, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, songshuaishuai@tinylab.org, 
	bjorn@rivosinc.com, charlie@rivosinc.com, masahiroy@kernel.org, 
	valentina.fernandezalanis@microchip.com, jassisinghbrar@gmail.com, 
	conor.dooley@microchip.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_061038_186750_84028630 
X-CRM114-Status: GOOD (  13.91  )
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

SGkgUmFkaW0sCgpPbiBUdWUsIE9jdCAyOCwgMjAyNSBhdCA4OjM24oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0xMC0yOFQxMDo0
MjoxMiswMDowMCwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPjoKPiA+IE9uIE1vbiwg
T2N0IDI3LCAyMDI1IGF0IDA5OjM0OjMxUE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPj4g
Tk1JIGlzIG1vcmUgcm9idXN0IHRoYW4gSVBJIGZvciBzdG9wcGluZyBDUFVzIGR1cmluZyBjcmFz
aGVzLAo+ID4+IGVzcGVjaWFsbHkgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLiBBZGQgU0JJX1NT
RV9FVkVOVF9MT0NBTF9DUkFTSF9OTUkKPiA+PiBldmVudGlkIHRvIGltcGxlbWVudCBOTUkgZm9y
IHN0b3BwaW5nIENQVXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+PiAtLS0KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+PiBA
QCAtNDg3LDYgKzQ4Nyw3IEBAIGVudW0gc2JpX3NzZV9hdHRyX2lkIHsKPiA+PiAgI2RlZmluZSBT
QklfU1NFX0VWRU5UX0dMT0JBTF9MT1dfUFJJT19SQVMgICAweDAwMTA4MDAwCj4gPj4gICNkZWZp
bmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRCAgICAgICAweGZmZmYwMDAw
Cj4gPj4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9VTktOT1dOX05NSSAgICAgICAgICAg
ICAweGZmZmYwMDAxCj4gPj4gKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9DUkFTSF9OTUkg
ICAgICAgICAgICAgICAweGZmZmYwMDAyCj4KPiBUaGlzIGV2ZW50IGlzbid0IGRlZmluZWQgaW4g
dGhlIFNCSSBwdWxsIHJlcXVlc3QuCj4KPiBJIGFzc3VtZSBpdCdzIGEgcHVyZSBzb2Z0d2FyZSBl
dmVudCB0aGF0IHRoZSBwbGF0Zm9ybSBzaG91bGRuJ3QgaW5qZWN0Lgo+IElmIHdlIHdhbnQgdG8g
cmVzZXJ2ZSBtb3JlIGV2ZW50cyBmb3Igc29mdHdhcmUgdXNlLCB3aHkgbm90IG1ha2UgdGhlbQo+
IGdlbmVyaWMsIGxpa2UgU0JJX1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRD8KCklu
IGZhY3QsIGl0J3Mgbm90IGp1c3QgY3Jhc2ggTk1JLCBidXQgYWxzbyBzdG9wIE5NSSwga2dkYiBO
TUksIGV0Yy4gQW4KZXZlbnQgY2FuIG9ubHkgcmVnaXN0ZXIgb25lIFNTRSBoYW5kbGVyLiBJZiBh
bGwgdXNlClNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkVfSU5KRUNURUQsIHdlJ2xsIGhhdmUg
dG8gZXhlY3V0ZSBlYWNoCmRpZmZlcmVudCBOTUkgaGFuZGxlciBpbiBzZXF1ZW5jZSB3aXRoaW4g
dGhlIFNTRSBoYW5kbGVyLCB3aXRoIGVhY2gKTk1JIGhhbmRsZXIgY2hlY2tpbmcgZm9yIGl0c2Vs
ZiBpZiB0aGVyZSBhcmUgTk1JcyBvZiBpdHMgdHlwZSB0bwpwcm9jZXNzLgpJcyB0aGF0IHdoYXQg
eW91IG1lYW4gdG9vPwoKPgo+IFRoYW5rcy4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
