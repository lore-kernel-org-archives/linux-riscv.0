Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01676C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZhY8LwPmCIu9hS/ul+9rG6FzJz8N3k3NwbKdPJCxhY=; b=iBLN8FWLWh/8pE
	S5vSW2aFmoldW47XJRSmf7iqtEORyZbPCGMpl7relGg+uRbByi+Z0Mt7EyYYwhZexXuxTRp4/0n9v
	LJSDLkI3i6x3c7A9KiZ5RtHbzOvRkFrq06SgH0zG+0PX2tCkpchiuhzcSS1qTO6i3eAU7iqxra8fN
	cZUNaCizOgH05FYHdTcKZO3pJq2KUSL+9TWmkhUMZxYH3gyldAYyAEPqlhZelkpGD3zUzvZ8sBZNM
	Yeu9SReyUkuQrygW5inkfnn8xcc5o8N5EsCMjAgTd1601FCmEcO246dBsWsp5OohE4cE8F5GDJ+TN
	HTapEABp2bXksqVCKT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhAb-00000007pDg-1t4e;
	Fri, 22 Mar 2024 15:51:01 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhAY-00000007pCl-2cx0
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 15:51:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56be159c0b3so1064837a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711122656; x=1711727456; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymH0isND2p2l6PY2xAiE9bsR6I1sbj8UtQEUd2/RRag=;
        b=Y+h2qKQFH15PUgC8Kp6DEe7aYlzTsgDtBm1vC+tm/BxzL+eIcoV+i9xUe24kXeGzoY
         wyOCrjesGKx9Skj+Vku17PNdDQP4JSCzFP9htpar8YOt37cdKXDbNwdTqZ4f1/Pd/spS
         BgSVzId3GaagBwjfjoB4iDZ4LcLQXgK7qqcdekD2XCtGMl13r3oTqW1svZiMyu8kUXKu
         9fZdBaNVlzchUsyaM/B34oKmqLvIPBoAyadiTKT9IRDAJooHnsrsp/LQb4jcBrxjkOrX
         f5EfgsSF/3dPNkWjFe3dQ4q9vymj/ZLjKfFpBCKaHFeGPMyilqZjBPzDk4xbkl9zdZ3c
         iHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711122656; x=1711727456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymH0isND2p2l6PY2xAiE9bsR6I1sbj8UtQEUd2/RRag=;
        b=U9auqYEtClh4QMPU+UPzOKcmXReHzBFFDh8Cbb25cOo6TMzDLfUQzfTXvjqaS419BY
         bBq/iklnJaNzYFP9zkKPZavx5P19n+I3O/Lkf12SQdA1lny7so2C0VzKgbhYosF0bnfd
         WpZgMVEUhy7x5RkrLplyf89tmoyyKhloAy7gqteebQMpmg8I6Q0hcZ9vVf8kmuJR5QD9
         nmin9vJxXGzoObnEvkyZVGc+/cvSuIbEtE1StD8ViTblqPeVvfbvo/1B4zAExZFbv/0O
         GwbNzqXGE5SSb5Ey0UCGCikLQh7pamUoJ6NMcJHlX/7cVL7tOYL/TmoAhUwEVhin/PSv
         JwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa1Cr0l8af5jh8SHD6zaecafXihMyUY0l1gFsH5PQ2eD4bD66vv4TR1XGVsF37NPU9d0K+n56/ElUNeNFdVI1PE3/QctqUPe8HcyNMbEWx
X-Gm-Message-State: AOJu0YzZE365MtsWaA6WZBBk+QxRnku7UBBWCbyK7muHk7loyAKpwAPM
	2umJnzVfa4KrLx//A9RLMerLl/NkQPAefrebjrEELjvybcucNtZQxWF9dJvNdxR2awqp+T/5RUy
	Uaz56xuFYKrFR69rE90CbbVvJTtdMVJ3+MsH4Gw==
X-Google-Smtp-Source: AGHT+IGoGdY72aObM/cAbKff/8OaaVeRHOEWoCy27OSLuSued6Nc21UBKLW6w2cjyaK3f6fVjFszEGmEJ44oYiAqXj8=
X-Received: by 2002:a17:906:817:b0:a47:2ec5:57dd with SMTP id
 e23-20020a170906081700b00a472ec557ddmr101474ejd.72.1711122655848; Fri, 22 Mar
 2024 08:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com> <mhng-3e79924e-d965-4156-836d-19cc8fb8cafe@palmer-ri-x1c9a>
In-Reply-To: <mhng-3e79924e-d965-4156-836d-19cc8fb8cafe@palmer-ri-x1c9a>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 22 Mar 2024 16:50:44 +0100
Message-ID: <CAHVXubiosOMnUghsaG_zDyX4wPQ3QGY_UhsUO+PGWQ8v2tDbFw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: only flush icache when it has VM_EXEC set
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: cyy@cyyself.name, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org, 
	Andrew Waterman <andrew@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_085058_931306_5327DF02 
X-CRM114-Status: GOOD (  23.99  )
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

T24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMTo0OOKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAwOSBKYW4gMjAyNCAxMDo0ODo1OSBQU1Qg
KC0wODAwKSwgY3l5QGN5eXNlbGYubmFtZSB3cm90ZToKPiA+IEFzIEktQ2FjaGUgZmx1c2ggb24g
Y3VycmVudCBSSVNDLVYgbmVlZHMgdG8gc2VuZCBJUElzIHRvIGV2ZXJ5IENQVSBjb3Jlcwo+ID4g
aW4gdGhlIHN5c3RlbSBpcyB2ZXJ5IGNvc3RseSwgbGltaXRpbmcgZmx1c2hfaWNhY2hlX21tIHRv
IGJlIGNhbGxlZCBvbmx5Cj4gPiB3aGVuIHZtYS0+dm1fZmxhZ3MgaGFzIFZNX0VYRUMgY2FuIGhl
bHAgbWluaW1pemUgdGhlIGZyZXF1ZW5jeSBvZiB0aGVzZQo+ID4gb3BlcmF0aW9ucy4gSXQgaW1w
cm92ZXMgcGVyZm9ybWFuY2UgYW5kIHJlZHVjZXMgZGlzdHVyYmFuY2VzIHdoZW4KPiA+IGNvcHlf
ZnJvbV91c2VyX3BhZ2UgaXMgbmVlZGVkIHN1Y2ggYXMgcHJvZmlsaW5nIHdpdGggcGVyZi4KPiA+
Cj4gPiBGb3IgSS1EIGNvaGVyZW5jZSBjb25jZXJucywgaXQgd2lsbCBub3QgZmFpbCBpZiBzdWNo
IGEgcGFnZSBhZGRzIFZNX0VYRUMKPiA+IGZsYWdzIGluIHRoZSBmdXR1cmUgc2luY2Ugd2UgaGF2
ZSBjaGVja2VkIGl0IGluIHRoZSBfX3NldF9wdGVfYXQgZnVuY3Rpb24uCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4gPiAtLS0KPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDcgKysrKystLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jYWNoZWZsdXNoLmgKPiA+IGluZGV4IDNjYjUzYzRkZjI3Yy4uOTE1ZjUzMmRjMzM2
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gPiBAQCAtMzMsOCAr
MzMsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2RjYWNoZV9wYWdlKHN0cnVjdCBwYWdl
ICpwYWdlKQo+ID4gICAqIHNvIGluc3RlYWQgd2UganVzdCBmbHVzaCB0aGUgd2hvbGUgdGhpbmcu
Cj4gPiAgICovCj4gPiAgI2RlZmluZSBmbHVzaF9pY2FjaGVfcmFuZ2Uoc3RhcnQsIGVuZCkgZmx1
c2hfaWNhY2hlX2FsbCgpCj4gPiAtI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9wYWdlKHZtYSwg
cGcsIGFkZHIsIGxlbikgXAo+ID4gLSAgICAgZmx1c2hfaWNhY2hlX21tKHZtYS0+dm1fbW0sIDAp
Cj4gPiArI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9wYWdlKHZtYSwgcGcsIGFkZHIsIGxlbikg
ICBcCj4gPiArZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiArICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX0VYRUMpICAgICAgICAgICAg
ICAgICAgICBcCj4gPiArICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9tbSh2bWEtPnZtX21tLCAw
KTsgICAgICAgICBcCj4gPiArfSB3aGlsZSAoMCkKPiA+Cj4gPiAgI2lmZGVmIENPTkZJR182NEJJ
VAo+ID4gICNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcChzdGFydCwgZW5kKSBmbHVzaF90bGJfa2Vy
bmVsX3JhbmdlKHN0YXJ0LCBlbmQpCj4KPiBJJ20gbm90IHN1cGVyIHdvcnJpZWQgYWJvdXQgdGhl
IGJlbmNobWFya3MsIEkgdGhpbmsgd2UgY2FuIGp1c3QKPiBvcGVuLWxvb3AgYXNzdW1lIHRoaXMg
aXMgZmFzdGVyIGJ5IGF2b2lkaW5nIHRoZSBmbHVzaGVzLiAgSSBkbyB0aGluayB3ZQo+IG5lZWQg
YSBob29rIGludG8gYXQgbGVhc3QgdGxiX3VwZGF0ZV92bWFfZmxhZ3MoKSwgdGhvdWdoLCB0byBp
bnNlcnQgdGhlCj4gZmVuY2UuaSB3aGVuIHVwZ3JhZGluZyBhIG1hcHBpbmcgdG8gaW5jbHVkZSBW
TV9FWEVDLgoKSSdkIHNheSBZYW5neXUgaXMgcmlnaHQgd2hlbiBoZSBtZW50aW9ucyBpbiB0aGUg
Y29tbWl0IGxvZzogIkZvciBJLUQKY29oZXJlbmNlIGNvbmNlcm5zLCBpdCB3aWxsIG5vdCBmYWls
IGlmIHN1Y2ggYSBwYWdlIGFkZHMgVk1fRVhFQyBmbGFncwppbiB0aGUgZnV0dXJlIHNpbmNlIHdl
IGhhdmUgY2hlY2tlZCBpdCBpbiB0aGUgX19zZXRfcHRlX2F0IGZ1bmN0aW9uLiIuCklmIGEgcmVn
aW9uIGluZGVlZCBiZWNvbWVzIGV4ZWN1dGFibGUsIHRoZSBwYWdlIHRhYmxlIHdpbGwgYmUgbW9k
aWZpZWQKdG8gcmVmbGVjdCB0aGF0IGFuZCB0aGVuIHdpbGwgcGFzcyBpbiBfX3NldF9wdGVfYXQo
KSB3aGljaCwgYXMgWWFuZ3l1Cm1lbnRpb25zLCBkb2VzIHRoZSByaWdodCB0aGluZy4gT3IgYW0g
SSBtaXNzaW5nIHNvbWV0aGluZz8KClRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
