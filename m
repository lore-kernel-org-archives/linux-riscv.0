Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE59ECD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWYU+iaj1ud9W45tRUa3AKmRjAXOtfkqbSZOtsz+CNY=; b=nK8OuukWSYKvLo
	KFzayh07pqZU09/PfHZeZLEuoDA2llswnN0B8opqHt3HAfpgdWPmFkErVhpgdYtHlOyRdikeAtmRk
	JOZ4CiBCDqC6k3rCFZr2nKGc8VzuZhCuA0zK7Ro1zEUBc7Xm/DDU1/OAc3m23so6KbqcYB4v6SYjr
	CYfsYkXx2WYzcRheAbje6S9l37ElsgzZSlXZ1SqjCLLztUW8Un8VIYheYEwYNwGhTNwz2bsJFzgLK
	7y76uuUDuy7bXnmtvAgy356xut9TaYT8UusRCPDB//RCgldpUDiHlBodUTmo6fzlaDdM/7uWBRgOb
	xZDaIEOT6kBOisSEvtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfL3-0000000EOyT-0Ycv;
	Wed, 03 Jun 2026 06:44:29 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfL1-0000000EOxV-0va6
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 06:44:28 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2c0b944f6edso35182945ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469066; x=1781073866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=Tm2zaBjqFP+AKAM0RDuKDBA0tt9Wlk2DOYPfSWZGzDUVrYebpqzpho3pxypHLRXNVE
         TEkI6JIVcib5KzKBXCnXlh3vithxdz6akpHnreIpZMlazNHp0veHCbAoW9kninqbO9Mh
         YdT1lyQJIgHMj2Zzjeaxh7KB5hs1rSX3tsfOX3z7r6vGfWH0hSI4xU4asaqEwNnEeuZz
         VaD/OiX298VZY2NBk+zP5qGb64silE04skLy2lIb3PruNXYX/qNlHPf0nTpAioVQfM2/
         b6XQ+77dnXXThRJm7en41AzUB7nzzzMbeO0aSTVJgO+L7+TlY9QMvzU2q1lb52szZ9NK
         zgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469066; x=1781073866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=J90IJz4+F5yPb6PBfo+JAfN7xRwv9J7wpWHxlcNgFeBa2K4c3dgVzPj9LA3N1X9Sd+
         SADM+/4TPOTrGv9/N3/e5bdUuYC9bQJpdH7nYlzBnwH4LB+iEouKvgFGkZr77LLkobCg
         vpBKqfL1T39b1l1JsEID8jxBq635KkjoA7qqwyB1xLVVP8nk9w+EK8Xd+hYmZUtF/Mw/
         s2iqcwB8wnsz25LYrAp+ocplZBX+S3kQhaaF090u16boZo5D9RqlEoeUWWQn1TEH6Q9c
         6AEne5yjc0frBftKyDCq1pNksdZOYqTK3WOGaMWNa1aCbQLCyehhyHpSATlvTWVQyvQM
         KNgw==
X-Forwarded-Encrypted: i=1; AFNElJ/TrtQIurdQLzLOyAxLC359lQgl66UWizOP9yGtTDszPX8AgYoPm130/KyRlET79tJcXDTa+QLuzfCzKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKALdxn0nL3ZQ+nhKdWaA+rgrZtBdv1tkqRA5SDFYzBlv+4qRj
	/+u7frpZnYh4R578rLz2gq8RCFj/Od9FaSZtH9gwiMKXxI147E/IvUJd
X-Gm-Gg: Acq92OHbFhD1wMG9h9RyvswTj+/UneFLLTeSB7mR7Ev37qtTGzOAbaI2yR/JwHW0kJO
	5ydiKxoMKHar3GIg8DpWagbSI5mMGg29HrLEYWDBlYAvZCOusE+Cc5OTB9d/57mjHzTs3/tasof
	bGN7d0pyAqG33AafP06DwwH/yXDN+V7Iur1bKvxfXEibSvSLKwJQtcHpSrKN7gdm0uY0Pg77F8a
	PBVRk9YekhXXoee/PvgBE9oxS9a3tOGvvG3f58M8+3s+md+BGBqqu/WT0JUxTkAhvTVCsk7UiFh
	F2USeUIX4+zpXasuv5d5mTcgy+bCBSfhHbCip1LLPG3+9Z4R20SelywaIYHUXlFZP9EI3v5fH9P
	gsyxzzZycoRSasYb1BSfsQaLHzbNYj1yGRI3LHeB3AjSDeev5flNkL9hwsfcYDBag4mP56W9kRF
	XQQXupYOdy+XOOSmgyJNTzztGTE6w+F4nYx/4Mmsd3gQ==
X-Received: by 2002:a17:903:298c:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1644dbfbamr22648805ad.37.1780469065484;
        Tue, 02 Jun 2026 23:44:25 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm13674395ad.59.2026.06.02.23.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 23:44:24 -0700 (PDT)
Message-ID: <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
Date: Wed, 3 Jun 2026 14:44:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-4-chenwandun1@gmail.com>
 <20260602162450.GA442759-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260602162450.GA442759-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_234427_293628_75EFE198 
X-CRM114-Status: GOOD (  22.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA2LzMvMjYgMDA6MjQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDI3LCAy
MDI2IGF0IDExOjI5OjA5QU0gKzA4MDAsIFdhbmR1biBDaGVuIHdyb3RlOgo+PiBGcm9tOiBXYW5k
dW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPj4KPj4gVGhlIGdsb2JhbCBwb2ludGVy
ICdyZXNlcnZlZF9tZW0nIGNvbnRpbnVlcyB0byByZWZlcmVuY2UgdGhlCj4+IHJlc2VydmVkX21l
bV9hcnJheSB3aGljaCBsaXZlcyBpbiBfX2luaXRkYXRhIGlmCj4+IGFsbG9jX3Jlc2VydmVkX21l
bV9hcnJheSgpIGZhaWxzLiBvZl9yZXNlcnZlZF9tZW1fbG9va3VwKCkgaXMKPj4gZXhwb3J0ZWQg
Zm9yIHBvc3QtaW5pdCB1c2UsIHRoYXQgd291bGQgZGVyZWZlcmVuY2UgZnJlZWQgbWVtb3J5Cj4+
IGFuZCB0cmlnZ2VyIGEgdXNlLWFmdGVyLWZyZWUuCj4+Cj4+IFNvIHJlc2V0IHJlc2VydmVkX21l
bV9jb3VudCB0byAwIHdoZW4gYWxsb2NfcmVzZXJ2ZWRfbWVtX2FycmF5KCkKPj4gZmFpbHMuCj4+
Cj4+IEZpeGVzOiAwMGM5YTQ1MmEyMzUgKCJvZjogcmVzZXJ2ZWRfbWVtOiBBZGQgY29kZSB0byBk
eW5hbWljYWxseSBhbGxvY2F0ZSByZXNlcnZlZF9tZW0gYXJyYXkiKQo+IEZpeGVzIHNob3VsZCBj
b21lIGZpcnN0IGluIGEgc2VyaWVzLgpVbmRlcnN0b29kLCB3aWxsIGRvIGluIGZ1dHVyZSBzdWJt
aXNzaW9ucy4KPgo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhp
YW5nLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYyB8IDIwICsr
KysrKysrKysrKysrLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL29mX3Jlc2VydmVk
X21lbS5jIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYwo+PiBpbmRleCAzMTNjYmM1N2Fh
NDUuLjZkNDc5MzgxZmYxZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9t
ZW0uYwo+PiArKysgYi9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jCj4+IEBAIC02OSwyOSAr
NjksMzEgQEAgc3RhdGljIGludCBfX2luaXQgZWFybHlfaW5pdF9kdF9hbGxvY19yZXNlcnZlZF9t
ZW1vcnlfYXJjaChwaHlzX2FkZHJfdCBzaXplLAo+PiAgICAqIHRoZSBpbml0aWFsIHN0YXRpYyBh
cnJheSBpcyBjb3BpZWQgb3ZlciB0byB0aGlzIG5ldyBhcnJheSBhbmQKPj4gICAgKiB0aGUgbmV3
IGFycmF5IGlzIHVzZWQgZnJvbSB0aGlzIHBvaW50IG9uLgo+PiAgICAqLwo+PiAtc3RhdGljIHZv
aWQgX19pbml0IGFsbG9jX3Jlc2VydmVkX21lbV9hcnJheSh2b2lkKQo+PiArc3RhdGljIGJvb2wg
X19pbml0IGFsbG9jX3Jlc2VydmVkX21lbV9hcnJheSh2b2lkKQo+PiAgIHsKPj4gICAJc3RydWN0
IHJlc2VydmVkX21lbSAqbmV3X2FycmF5Owo+PiAgIAlzaXplX3QgYWxsb2Nfc2l6ZSwgY29weV9z
aXplLCBtZW1zZXRfc2l6ZTsKPj4gICAKPj4gKwlpZiAoIXRvdGFsX3Jlc2VydmVkX21lbV9jbnQp
Cj4+ICsJCXJldHVybiB0cnVlOwo+PiArCj4+ICAgCWFsbG9jX3NpemUgPSBhcnJheV9zaXplKHRv
dGFsX3Jlc2VydmVkX21lbV9jbnQsIHNpemVvZigqbmV3X2FycmF5KSk7Cj4+ICAgCWlmIChhbGxv
Y19zaXplID09IFNJWkVfTUFYKSB7Cj4+ICAgCQlwcl9lcnIoIkZhaWxlZCB0byBhbGxvY2F0ZSBt
ZW1vcnkgZm9yIHJlc2VydmVkX21lbSBhcnJheSB3aXRoIGVycjogJWQiLCAtRU9WRVJGTE9XKTsK
Pj4gLQkJcmV0dXJuOwo+PiArCQlnb3RvIGZhaWw7Cj4+ICAgCX0KPj4gICAKPj4gICAJbmV3X2Fy
cmF5ID0gbWVtYmxvY2tfYWxsb2MoYWxsb2Nfc2l6ZSwgU01QX0NBQ0hFX0JZVEVTKTsKPj4gICAJ
aWYgKCFuZXdfYXJyYXkpIHsKPj4gICAJCXByX2VycigiRmFpbGVkIHRvIGFsbG9jYXRlIG1lbW9y
eSBmb3IgcmVzZXJ2ZWRfbWVtIGFycmF5IHdpdGggZXJyOiAlZCIsIC1FTk9NRU0pOwo+PiAtCQly
ZXR1cm47Cj4+ICsJCWdvdG8gZmFpbDsKPj4gICAJfQo+PiAgIAo+PiAgIAljb3B5X3NpemUgPSBh
cnJheV9zaXplKHJlc2VydmVkX21lbV9jb3VudCwgc2l6ZW9mKCpuZXdfYXJyYXkpKTsKPj4gICAJ
aWYgKGNvcHlfc2l6ZSA9PSBTSVpFX01BWCkgewo+PiAgIAkJbWVtYmxvY2tfZnJlZShuZXdfYXJy
YXksIGFsbG9jX3NpemUpOwo+PiAtCQl0b3RhbF9yZXNlcnZlZF9tZW1fY250ID0gTUFYX1JFU0VS
VkVEX1JFR0lPTlM7Cj4+ICAgCQlwcl9lcnIoIkZhaWxlZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9y
IHJlc2VydmVkX21lbSBhcnJheSB3aXRoIGVycjogJWQiLCAtRU9WRVJGTE9XKTsKPiBUaGVzZSBw
cmludHMgY291bGQgYmUgbW92ZWQgdG8gJ2ZhaWwnLiBQZXJoYXBzIGluc3RlYWQgb2YganVzdCBw
cmludGluZwo+IGFuIGVycm9yIHZhbHVlLCB5b3UgY2FuIHJldHVybiB0aGUgZXJyb3IgdmFsdWUg
aW5zdGVhZCBvZiBib29sZWFuLgpXaWxsIGRvLCBjb25zb2xpZGF0aW5nIHByX2VycigpIHVuZGVy
ICdmYWlsJyBhbmQgY2hhbmdpbmcgdGhlIHJldHVybiB0eXBlCnRvIGludC4KPgo+IElmIHlvdSBy
ZXNwaW4ganVzdCB0aGlzIHBhdGNoLCBJIGNhbiBwaWNrIGl0IHVwIGZvciA3LjIuCkJlZm9yZSBJ
IHJlc3BpbiwgSSdkIGxpa2UgdG8gZmxhZyBhIGRlcGVuZGVuY3k6CnBhdGNoIDA1LzA3IGluIHRo
aXMgc2VyaWVzIGJ1aWxkIG9uIHRoZSBzaWduYXR1cmUgY2hhbmdlIGludHJvZHVjZWQgYnkgdGhp
cwpwYXRjaCAoInRoZSB2b2lkIC0+IGJvb2wgcmV0dXJuIHR5cGUgY2hhbmdlIG9mIGFsbG9jX3Jl
c2VydmVkX21lbV9hcnJheSgpIikKCkNvdWxkIHlvdSBsZXQgbWUga25vdyB3aGljaCBvZiB0aGUg
Zm9sbG93aW5nIHlvdSdkIHByZWZlcjoKYSkgVGFrZSBwYXRjaCAwMyBhbG9uZSB2aWEgeW91ciB0
cmVlIGFzIHlvdSBzdWdnZXN0ZWQsIGFmdGVyIGl0IGxhbmRzLCBJJ2xsCiDCoCDCoHJlc3BpbiB0
aGUgcmVtYWluaW5nIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMuCgpiKSBLZWVwIHBhdGNoIDAzIGlu
IHRoZSB2NCByZXNwaW4gb2YgdGhlIGZ1bGwgc2VyaWVzLCByZW9yZGVyZWQgdG8gdGhlIGZyb250
CiDCoCDCoHBlciB5b3VyIGVhcmxpZXIgY29tbWVudC4KCkJlc3QgcmVnYXJkcywKV2FuZHVuCj4K
PiBSb2IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
