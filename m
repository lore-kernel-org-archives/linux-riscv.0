Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30804C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 00:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moCfV4ykraYbl4L5gCeYUP9Df2DLY4hBx6g59BTEk50=; b=SSqKzRAZBr7Fmt
	A9ZWttZJWQxt5ofclfxOMP+6GCLIhmtA+nDMGT9PgJEi2BRWgFvDmvVOcQFSfklEt8Om7CU6qrcSg
	w0N8rsTa9fu3gQLJHDziuZx8yFTC3TNAt1IRQta3l5azmGUp56My3/Wl0xtHIp21TdWQC4ORAiNyz
	u88Ikh5L7O301P0m+u1mqvK0JY9ofpdgCp7/HbhGUmPjVV8Shs2oWnfIk9CZcdrhE2vdPpHt9bwrR
	fpz0exwEvzMPob9NHaNM3gYla4duhzKriOWFBWZ3ctuikhjakYn35ZD2nySxWB0vTzYuLOl5B4UQT
	EdDMfzKlE3DFdnfk78Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqHd-00A3UK-2K;
	Tue, 12 Dec 2023 00:05:57 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqHa-00A3R7-1o
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 00:05:55 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6d9d307a732so3858158a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702339552; x=1702944352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mXLZeR4Bg70XdW95zE9udRxRkmyhgCjX63YmFmBgJY=;
        b=nOp6l1SUDvquWknEFVQHfYgtl5Uaw9HaaWgu2xc1T0Z1CdBunUg4/V8/186A/4eok2
         anPgtuW9CuommF9+RiuaX67B7Jh8F1KPpeUhgOGvpx/ss0AocLuoD1X03p5VElxsOjNt
         DddhPK7hA4/t+FcoB6xCMYI5w9cZDSTb338nq480nCiiYN5nfQPxTnAEwroHAcDVpkXZ
         6ATgivcqhaM+V47K4GQxAJu49OXeyaeHKIyN7n4nFKNlEVULaHPHlfDgksiTOMXkTqFz
         Lx3A3h05/LJhuQXXtCsNywxnQDlEZhdrL1j3Xr1+yFQvTSQt8dKp7f/K9UjKrIXeFJZ/
         JqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702339552; x=1702944352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mXLZeR4Bg70XdW95zE9udRxRkmyhgCjX63YmFmBgJY=;
        b=p9rbL841qImrOA1kMKLTMeagr26eAOYbx7E4hCC9SZ1ouWcTOv1tivWwjsEVhJ3P8B
         rv+jpMBa66W3K5A4r0wWFw4G3Mev1cjfkTuPsdWe3sekqZPEjhpqQPwejOGhEqOXaIba
         rOodXugOkvdNrXmIZxnXdAnhKfb98RZcmN3v0E4c4Q6FOLS84GLgIySRzzg7eTqogd2w
         mY1CMmgZuOQ0pN+Cf1Mo7NitCl0b3mWEv0NLzJWpc/ri0ACcwEIyA0yAKBfNzNwKOLsD
         aACTXMlSS+HGJH++Ue0JISeTlDCXmu8WlwqMgaButpO94RsjItB7M0cWl0gpprlQOlDh
         eVvA==
X-Gm-Message-State: AOJu0YyFmXyIOgH93QzRzfzCf5+ocm7aGxEDFK3DVFFvnNMfVs+TyVoh
	lmtmo4Fs2H168+BsQb6aX7OYoa6Tf+7dH3q10CIYsQ==
X-Google-Smtp-Source: AGHT+IHDoY5nf+90uQxFaXK754uPjRArDu8vpXBwoVdMNLofQd6HViktA0h5szWRpceKnwYEklVGY/k+rpioz2etP2Y=
X-Received: by 2002:a9d:7981:0:b0:6d8:5421:1e0c with SMTP id
 h1-20020a9d7981000000b006d854211e0cmr5520995otm.34.1702339552335; Mon, 11 Dec
 2023 16:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20231211-removeasmgeneric-v1-1-a0274e802789@google.com>
In-Reply-To: <20231211-removeasmgeneric-v1-1-a0274e802789@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Dec 2023 16:05:35 -0800
Message-ID: <CAKwvOdnEKyR7+c_tZOoS2aVb3WQceMdctHmgyh0cNKmm-UFS4A@mail.gmail.com>
Subject: Re: [PATCH] arch/riscv/kernel/sys_riscv.c: removed asm-generic
To: tanzirh@google.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <nnn@google.com>, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_160554_598767_8758AF35 
X-CRM114-Status: GOOD (  15.04  )
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

T24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMjo1MuKAr1BNIDx0YW56aXJoQGdvb2dsZS5jb20+IHdy
b3RlOgo+Cj4gYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYnVpbGRzIHdpdGhvdXQgdXNp
bmcgYW55dGhpbmcKPiBmcm9tIGFzbS1nZW5lcmljL21tYW4tY29tbW9uLmguIFRoZXJlIHNlZW1z
IHRvIGJlIG5vIHJlYXNvbgo+IHRvIGluY2x1ZGUgdGhpcyBmaWxlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogVGFuemlyIEhhc2FuIDx0YW56aXJoQGdvb2dsZS5jb20+Cj4gLS0tCj4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgfCAxIC0KCklmIHlvdSBydW4gYGdpdCBsb2cgYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmNgLCB5b3UnbGwgZmluZCB0aGUKcHJlZml4IHVzZWQg
b24gdGhlIG9uZWxpbmUgb2YgdGhlIGNvbW1pdCBmb3IgdGhpcyBmaWxlIGlzIGdlbmVyYWxseQpv
bmUgb2Y6CgotIFJJU0MtVjoKLSByaXNjdjoKCllvdSBzaG91bGQgY2hvb3NlIG9uZSBvZiB0aGUg
YWJvdmUgcmF0aGVyIHRoYW4KYGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jOmAuICBTb3Jy
eSBJIG1pc3NlZCB0aGF0IGluIGludGVybmFsCmNvZGUgcmV2aWV3LCBidXQgd291bGQgeW91IG1p
bmQgcGxlYXNlIHNlbmRpbmcgYSB2MiB3aXRoIHRoYXQgZml4ZWQ/CkknZCBleHBlY3Qgc29tZXRo
aW5nIGxpa2U6CgpyaXNjdjogcmVtb3ZlIHVudXNlZCBoZWFkZXIKCitDb25vciB3aG8gcG9pbnRl
ZCB0aGlzIG91dCB0byBtZSBvbiBJUkMKCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+IGluZGV4IGEyY2E1Yjc3NTZhNS4uZWJjYWYzODZlYTYy
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiBAQCAtMTQsNyArMTQsNiBAQAo+ICAjaW5jbHVk
ZSA8YXNtL3N3aXRjaF90by5oPgo+ICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPiAgI2luY2x1
ZGUgPGFzbS91bmlzdGQuaD4KPiAtI2luY2x1ZGUgPGFzbS1nZW5lcmljL21tYW4tY29tbW9uLmg+
Cj4gICNpbmNsdWRlIDx2ZHNvL3ZzeXNjYWxsLmg+Cj4KPiAgc3RhdGljIGxvbmcgcmlzY3Zfc3lz
X21tYXAodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbiwKPgo+IC0tLQo+IGJh
c2UtY29tbWl0OiBhMzliNmFjMzc4MWQ0NmJhMTgxOTNjOWRiYjIxMTBmMzFlOWJmZmU5Cj4gY2hh
bmdlLWlkOiAyMDIzMTIxMS1yZW1vdmVhc21nZW5lcmljLWY2YmUxM2E0MmI2Ygo+Cj4gQmVzdCBy
ZWdhcmRzLAo+IC0tCj4gVGFuemlyIEhhc2FuIDx0YW56aXJoQGdvb2dsZS5jb20+Cj4KCgotLQpU
aGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
