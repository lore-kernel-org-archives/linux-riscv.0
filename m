Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63187C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 19:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwcxU+ovvJT3ZqBAFtMb6cB1dsYnJK/27VQxySZo/yE=; b=fqXgdnX++ixe+k
	3H5kFuZCXZ7XlqTZh82KD7e2S68aIUPJTVmW5NO5FWWGPSNN9o3RPQxBSBG5In47i5tzxXVrMJxEm
	acpTSyb8jQbOZWswI8olLl6ONQtVqbpcVPg+BPUAQQdMWx8UJrzT4EucW7Z2Hr1fS4/Z6W98fV0eW
	aQRAp2cTFNXtYfZ22q5m+e0qL473FOjLVB6JlgJXf2GwgTvOOjpU6UTk7gwW4SRsPfFvVlFkbOLBo
	8L5bsm906BvxzJhJ5GJhPvbYrMYP6XajpHMrtodQrtc9SN2kTGiGhmKIo3xTJY9cjO34gB2P0SmNP
	AO/jGXhPmtqa+2YGXU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1regDi-00000002Gxy-1huy;
	Mon, 26 Feb 2024 19:00:58 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1regDe-00000002GwT-3msz
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 19:00:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5655c7dd3b1so5447980a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 11:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708974052; x=1709578852; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgDeNYPtaHXphy9wZiqDQWIOOTL9WIsvd8TA8aH6k08=;
        b=ROG1XP6xC4KgU5VWHEonfrMK7XTr8zurfZrYUelER11yjw9HhNgeG51zy79FUi0eqg
         dpXH1oBE/2l4NMUoME7BaV5Am6nsXU9WlmNXDa05nzwI/YACxFq7bdfq3zlp9WXKkAZw
         MAS7UY6UFZ5gLMzCy7tIJYvdh4g8Z+xSxXtGl+B9QnWE69EUz+Go2LL8zdsq7HMNuZzw
         MYH8N1Ve3XZ7BKoEP++JuNQ/GQT/a/MD42nJ7MxDT9qlRhGMRA/Iq9hnMomGibYai1gG
         cT+3Z+KWSoSe/uPOpc87TP/KeQ3WuqzDG7SFoWzOj+TOV838kFHbu4J6v5xGxMUWXez3
         lnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708974052; x=1709578852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgDeNYPtaHXphy9wZiqDQWIOOTL9WIsvd8TA8aH6k08=;
        b=iuAmdfLPzvrIu54IICZdnZk6YY4vEj6QCh9PWIc7qTyvvatcVWn7A9aMfgZkGbKth+
         +3eaS1oHk8jgET1ZzcrMQU8ccMGMq2RboV4aZW8XDTv032OGnaRRUUc/kVKd711P66lY
         KI5vPq1k9O672VS7cqewUTdYsIQTddXKj2nSLM0J7qtq+kd0zguryopCW5QuYjWJIXm6
         91Ck2yrRx72hlgDAHx2tSN6pJGQnu7uyOAaqcYWDVkyyy4A9JVuuZAH4/9Fixd6rTNua
         uhio5XAacz8adW2gYxyMECaOq5Ke6z0NS106jYOzjNowbKbJi/E6L3HK9YuX6pu6vALR
         1Hsg==
X-Forwarded-Encrypted: i=1; AJvYcCXmjGRqhhh3r84l7w1oOtL1I3A8nXxuTzdO7x98PIn/ibEQYC3/qjmPuBnM45rg4MU1Y4Om4D8TfuhBisqYLStUmcMjMTbEWFleVZ6AC5Qs
X-Gm-Message-State: AOJu0YxvE4qM3NQXcisVb68wRh0fuQN6ps64AbjktQXJzP7dnM6vvkxo
	0/0509l7ZmE9UP2FSiNDjbWXQbo0MdrTYZ5pLhVL4v5gy5RnnRo9OukyJC5fY46wr4Z6vkaaWzp
	c0LK3g+kMsFeP2KQyhJOdVHEkgGc=
X-Google-Smtp-Source: AGHT+IHzYNxDydGBNJcaanZENATz7wB4GJZT7IKZLQRNXyQ6ccmzVglFnGQNNFHku9P4xpXkWuF94YaxqF93GFs3rGQ=
X-Received: by 2002:a50:fc0b:0:b0:565:66df:b25a with SMTP id
 i11-20020a50fc0b000000b0056566dfb25amr7139438edr.17.1708974052421; Mon, 26
 Feb 2024 11:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20240226140649.293254-1-cleger@rivosinc.com> <40dee2c1-ff24-40b2-a13c-6934139ba869@sifive.com>
 <ea356036-5a0b-47ea-aafb-f9813cc6ec9b@rivosinc.com> <20240226-pajamas-okay-51e16426b0f5@spud>
In-Reply-To: <20240226-pajamas-okay-51e16426b0f5@spud>
From: Charles Lohr <lohr85@gmail.com>
Date: Mon, 26 Feb 2024 11:00:41 -0800
Message-ID: <CAGu26P_v9FjYq9Bncvfd-dBhdHQevvN3HpO1nqjA2hYFCpG7hg@mail.gmail.com>
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Damien Le Moal <dlemoal@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_110055_042145_3465D5C3 
X-CRM114-Status: GOOD (  19.09  )
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

V09BSCEgUGxlYXNlIERPIE5PVCBkZXByZWNhdGUgTk9NTVUuIEkgdXNlIHRoZSBOT01NVSBidWls
ZCBjb25zdGFudGx5CmFuZCBOT01NVSBMaW51eCBvbiBSSVNDLVYgaXMgdGhlIGF2ZW51ZSB1c2Vk
IGJ5IG1hbnkgRlBHQSBzb2Z0IGNvcmVzCmZvciBMaW51eCwgYXMgd2VsbCBhcyBzb21lIGxpbWl0
ZWQgc3lzdGVtcy4KCkkgZ2V0IG5ldyBjb3BpZXMgb2YgdGhlIGtlcm5lbCB3aGVuIHRoZXJlIGFy
ZSByZWxlYXNlcyBhbmQgdGVzdCB0aGVtCmZyZXF1ZW50bHkgdG8gbWFrZSBzdXJlIGV2ZXJ5dGhp
bmcgaXMgc3RpbGwgd29ya2luZyBhcyBleHBlY3RlZC4KCkZvciB1cyB3ZSBqdXN0IGRvbid0IGNh
cmUgYWJvdXQgWElQLiBJIG1lYW4gaWYgc29tZW9uZSBkaWQgcHVzaCBpdAp0aHJvdWdoIHRvIGZy
dWl0aW9uLCBJJ2QgYWxzbyB0ZXN0IGFuZCB1c2UgaXQsIGJ1dCBJIHVyZ2UgeW91IHBsZWFzZQpk
byBub3QgZGVwcmVjYXRlIHRoaXMuICBXaGlsZSBpdCdzIHNvbWV0aW1lcyBuZWVkZWQgYSBiaXQg
b2YgYQpjcmVhdGl2ZSBidWlsZCB0byBnZXQgZXZlcnl0aGluZyB3b3JraW5nLCBJJ3ZlIG5ldmVy
IG5lZWRlZCB0byBwYXRjaAphbnl0aGluZyBpbiB0aGUga2VybmVsIGJleW9uZCBwYXRjaGluZyBp
biBhIGN1c3RvbSBjb25zb2xlIGZvciBzZXJpYWwKb3V0cHV0LgoKSSBhbSBoYXBweSB0byBkaXNj
dXNzIHRoZSBwb3NzaWJpbGl0eSBvZiBtZSBhbmQgb3Igb25lIG9mIHRoZSBvdGhlcgpSSVNDLVYg
c29mdCAoRlBHQSkgY29yZSBwZW9wbGUgc3RlcHBpbmcgdXAgdG8gdHJ5IHRvIGJlIG1vcmUgYWN0
aXZlLApidXQgc28gZmFyIHdlJ3ZlIGp1c3QgYmVlbiB2ZXJ5IHdlbGwgc2VydmljZWQgYnkgdGhl
IGN1cnJlbnQgTk9NTVUKTGludXggc2V0dXAuCgpDaGFybGVzCgoKT24gTW9uLCBGZWIgMjYsIDIw
MjQgYXQgODowM+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBPbiBNb24sIEZlYiAyNiwgMjAyNCBhdCAwNDoyNToyNFBNICswMTAwLCBDbMOpbWVudCBMw6ln
ZXIgd3JvdGU6Cj4gPiBJIGd1ZXNzIEkgY291bGQgYWxzbyBtYXJrIFhJUCBhcyBkZXByZWNhdGVk
Lgo+Cj4gSSdtIG5vdCBzbyBzdXJlLCBwZW9wbGUgcmVjZW50bHkgYWRkZWQgWElQIHN1cHBvcnQg
dG8gUUVNVSAoYW5kIHNlbnQKPiBrZXJuZWwgZml4ZXMgaW4gRGVjZW1iZXIpLiBYSVAgaXMgYWxz
byBub3QgbmVhcmx5IGFzIG11Y2ggb2YgYSBwcm9ibGVtCj4gdG8gc3VwcG9ydCwgdGhlcmUncyBm
YXIgbGVzcyB0aGF0IGl0IGRvZXMgZGlmZmVyZW50bHksIHRoZSBtYWluIGJhcnJpZXIKPiB3YXMg
dGhlIGluYWJpbGl0eSB0byB0ZXN0IGl0IHdoaWNoIGlzIG5vIGxvbmdlciB0aGUgY2FzZS4KPiBU
aGF0IHNhaWQsIFhJUCBpcyBnb25uYSBraWxsIGl0c2VsZiBvZmYgSSBmZWVsIGFzIGl0IGRvZXMg
bm90IHN1cHBvcnQKPiBydW50aW1lIHBhdGNoaW5nIGFuZCB0aGVyZWZvcmUgaXMgZXh0cmVtZWx5
IGxpbWl0ZWQgb24gZXh0ZW5zaW9ucywgZ2l2ZW4KPiB3ZSB1c2UgYWx0ZXJuYXRpdmVzIGZvciBh
bGwgb2YgdGhhdCAoYWx0aG91Z2ggSSBzdXBwb3NlIGlmIHNvbWVvbmUgaGFzIGEKPiB1c2VjYXNl
IHRoZXkgY291bGQgbWFrZSBuYXN0eSBtYWNyb3Mgd29yc2UgYW5kIGltcGxlbWVudCBhIGNvbXBp
bGV0aW1lCj4gc3dpdGNoIGluIHRoZSBhbHRlcm5hdGl2ZXMgdG9vKS4KPgo+IENoZWVycywKPiBD
b25vci4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
