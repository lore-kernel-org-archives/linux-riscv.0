Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B057C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4VZXkRv9kwnHkEetD+BrE64fX+dvvMoZy+SK471VbU=; b=UNIalVP++ryciv
	eG0j8N44kLi1hlwF0kffmGZRe0Oc7aJgTm383vYcYsCm+HpfwxgaWga5I6c+rCip+qpgfxtPFrwjo
	llpwpcf7uh7yFEVMJRwtLR4v7Yxa9SzH27iybCd99Tihj4bRSLOMfF6stKbTG8Pk5R+awQ7rEKMF2
	r2hVOInI1PRPjVykJ9OztJSgaidRjO94fFHjMsaqZrtxTSRyaCEjs7q3P91T/MyJxADzoD2VniYmw
	TXWHPYxaHioAvRkr4b6Ad2BkBJ0PxdmWm8jidE3v3ar4tpyasr3QLyOBXEJioClhzLSDlKDBbCkm+
	Imifo6NBECWjkhbr93Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujefi-0000000FMdx-0xN3;
	Wed, 06 Aug 2025 13:59:14 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeWy-0000000FLDq-1jcP;
	Wed, 06 Aug 2025 13:50:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-332468a0955so7034261fa.1;
        Wed, 06 Aug 2025 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754488210; x=1755093010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDOCIZR6gSwH1CTXkpwwYCK6HLPl+F0ICSkVzqPXsh0=;
        b=LhebYhjalqT+HfvXipRUx1FbhnKTYQccQ0udjhV4Ag+k58MzIrcGpJVXuexEff56un
         jNQEAw7h+R7eY80FBx8ieyqrf18hbSuuZ4fyHFg4vAokmsvFkhLQgqMLLxNCbrkMwXAw
         QBx7g3BzswfzGv1GNzCW/rpwrfF+5ywnZWSb3FZZGYHx1CXdUZf/OzWmsCXvwkW+EE6o
         TP8t4XnpcGtbWa5CTlkmFtxm6TVgWuf0pKPD4diucfHnzTXrR3gjI8WreXPryUnliq8B
         OqJODdcVjEIotM7SJpdRON26G1Q8lPvDBQV0q+2TD2mUYKfWd8Y6A1YbpO75gmO61myJ
         cycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488210; x=1755093010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDOCIZR6gSwH1CTXkpwwYCK6HLPl+F0ICSkVzqPXsh0=;
        b=IrWSPd4w045TUtpMnhTFoO+Hl8DxjNJ8T8DZ4ua7vDz7gEhvm8WsefOKxioiPhcoVG
         3a8tNTViKEIqfVuC2ToN8fwojpvvWkZDjws1XXnRy0tLEpupP3WfOBCJC6YLS0ybTKCW
         bm51w6b9uFf0JR5ThSavwZydCVsWoz/FTOrtYnF2clAc80sj96w9VvbObM3PTvg3V+rN
         Zk5rxCAtssL4ufoDfzwdPySHiG5nq57tKLzPvsQVfJZwYFJE5tGkDIULq/ZN3EajMnIR
         YIK3PU3dg6UKGDnqUNwOAwG7Jo9TVLd+NrgowweWpZS4VFYeLzR525A56RQqXtog5+WM
         iM/w==
X-Forwarded-Encrypted: i=1; AJvYcCUXJ5mKkYeFlJh8pvgX3eB7DZGD8+nbGVs31sQ1zqek3aaA5ZwTV4ikO8ju6PrviPH+OgX72h83uhY=@lists.infradead.org, AJvYcCXQj+9HvDewrBgGeF1pVrpnDhxgot8ZiSUxhHIqnzmX2LWPmtpM3vR0bJ7bUxsi7RlSQUvwfy3VeJoPOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc6WhnAr8ArFkdJjowbn+IiqfE9Sr92cMjmurNqo/b4YjQi6xG
	yX3/uXdU5pPE+IU/r3r710xHDQOes9Yhqk5NUrMpUKOjtaXgHhSj+od4
X-Gm-Gg: ASbGnctDHSONwb2Ks6cnl6n6kuV0IUHsnY8EG4ltSIkulpypmuoS6UX8/w93wvh7peX
	BotWURbxbrI7cy6Zb9m9x+OllrtLnoBnphskGdf813gbCKW/tnw6gAid4HZN35rldg/Mls0kCnD
	L8GmTfjr/SHVBTk/zURWROeg6xk3tLVGRwd+7S5ZL34ePpnmsLpFDa79c9T8wy/YycvpAFfgZFK
	o3YmbK8mSIARUmHHUq1N/lMDctFKBhNO21bwsI+aTSayHutNhBSWIpMUofkgnz/Som6UYQ4/kGJ
	S4MlA8QvUYW1Q1fIEMui8nsA5ajziaZi5/Efpr7QJTws+IC8j/A5PXG0P7z9flHELkO89iPJTua
	ZHvrlXY+aMBCx8pTltozuoRs+uLMVjU/Agsd4pV5v/D8xL4yPig==
X-Google-Smtp-Source: AGHT+IEsyaC4e5C8bAXA34DF26BCI2kUm+pbeFPiYngQRQqOaMh9b3JgYLiHo/Ul9EDDlBD4plM96A==
X-Received: by 2002:a05:6512:3b1f:b0:550:ecdf:a7f9 with SMTP id 2adb3069b0e04-55caf35fc1amr414988e87.10.1754488210277;
        Wed, 06 Aug 2025 06:50:10 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cabbd8sm2356761e87.149.2025.08.06.06.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:50:09 -0700 (PDT)
Message-ID: <ece4aab9-a195-47c9-b370-c84f5dcc0098@gmail.com>
Date: Wed, 6 Aug 2025 15:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com,
 glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-7-snovitoll@gmail.com>
 <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
 <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_065012_463892_358586A6 
X-CRM114-Status: GOOD (  18.11  )
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

CgpPbiA4LzYvMjUgNjozNSBBTSwgU2FieXJ6aGFuIFRhc2JvbGF0b3Ygd3JvdGU6Cj4gT24gVHVl
LCBBdWcgNSwgMjAyNSBhdCAxMDoxOeKAr1BNIEFuZHJleSBSeWFiaW5pbiA8cnlhYmluaW4uYS5h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDgvNS8yNSA0OjI2IFBNLCBTYWJ5cnpo
YW4gVGFzYm9sYXRvdiB3cm90ZToKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC91bS9LY29uZmln
IGIvYXJjaC91bS9LY29uZmlnCj4+PiBpbmRleCA5MDgzYmZkYjc3My4uOGQxNGM4ZmMyY2QgMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL3VtL0tjb25maWcKPj4+ICsrKyBiL2FyY2gvdW0vS2NvbmZpZwo+
Pj4gQEAgLTUsNiArNSw3IEBAIG1lbnUgIlVNTC1zcGVjaWZpYyBvcHRpb25zIgo+Pj4gIGNvbmZp
ZyBVTUwKPj4+ICAgICAgIGJvb2wKPj4+ICAgICAgIGRlZmF1bHQgeQo+Pj4gKyAgICAgc2VsZWN0
IEFSQ0hfREVGRVJfS0FTQU4KPj4KPj4gc2VsZWN0IEFSQ0hfREVGRVJfS0FTQU4gaWYgU1RBVElD
X0xJTksKPiAKPiBBcyBwb2ludGVkIG91dCBpbiBjb21taXQgNWIzMDE0MDllOGJjKCJVTUw6IGFk
ZCBzdXBwb3J0IGZvciBLQVNBTgo+IHVuZGVyIHg4Nl82NCIpLAo+IAo+IDogQWxzbyBub3RlIHRo
YXQsIHdoaWxlIFVNTCBzdXBwb3J0cyBib3RoIEtBU0FOIGluIGlubGluZSBtb2RlCj4gKENPTkZJ
R19LQVNBTl9JTkxJTkUpCj4gOiBhbmQgc3RhdGljIGxpbmtpbmcgKENPTkZJR19TVEFUSUNfTElO
SyksIGl0IGRvZXMgbm90IHN1cHBvcnQgYm90aCBhdAo+IHRoZSBzYW1lIHRpbWUuCj4gCj4gSSd2
ZSB0ZXN0ZWQgdGhhdCBmb3IgVU1MLAo+IEFSQ0hfREVGRVJfS0FTQU4gd29ya3MgaWYgU1RBVElD
X0xJTksgJiYgS0FTQU5fT1VUTElORQo+IEFSQ0hfREVGRVJfS0FTQU4gd29ya3MgaWYgS0FTQU5f
SU5MSU5FICYmICFTVEFUSUNfTElOSwo+IAo+IEFSQ0hfREVGRVJfS0FTQU4gaWYgU1RBVElDX0xJ
TkssIGFuZCBLQVNBTl9JTkxJTkU9eSBieSBkZWZhdWx0IGZyb20gZGVmY29uZmlnCj4gY3Jhc2hl
cyB3aXRoIFNFR0ZBVUxUIGhlcmUgKEkgZGlkbid0IHVuZGVyc3RhbmQgd2hhdCBpdCBpcywgSSB0
aGluawo+IHRoZSBtYWluKCkgY29uc3RydWN0b3JzCj4gaXMgbm90IHByZXBhcmVkIGluIFVNTCk6
Cj4gCj4gIOKWuiAwICAgICAgIDB4NjA5ZDZmODcgc3RybGVuKzQzCj4gICAgMSAgICAgICAweDYw
YTIwZGIwIF9kbF9uZXdfb2JqZWN0KzQ4Cj4gICAgMiAgICAgICAweDYwYTI0NjI3IF9kbF9ub25f
ZHluYW1pY19pbml0KzEwMwo+ICAgIDMgICAgICAgMHg2MGEyNWY5YSBfX2xpYmNfaW5pdF9maXJz
dCs0Mgo+ICAgIDQgICAgICAgMHg2MDllYjZiMiBfX2xpYmNfc3RhcnRfbWFpbl9pbXBsKzI0MzQK
PiAgICA1ICAgICAgIDB4NjAwNGEwMjUgX3N0YXJ0KzM3Cj4gCgpObyBzdXJwcmlzZSBoZXJlLCBr
YXNhbl9hcmNoX2lzX3JlYWR5KCkgb3IgQVJDSF9ERUZFUl9LQVNBTiBkb2Vzbid0IHdvcmsgd2l0
aCBLQVNBTl9JTkxJTkU9eQpUaGlzIGNvbmZpZ3VyYXRpb24gY29tYmluYXRpb24gKFNUQVRJQ19M
SU5LICsgS0FTQU5fSU5MSU5FKSB3YXNuJ3QgcG9zc2libGUgYmVmb3JlOgoKI2lmbmRlZiBrYXNh
bl9hcmNoX2lzX3JlYWR5CnN0YXRpYyBpbmxpbmUgYm9vbCBrYXNhbl9hcmNoX2lzX3JlYWR5KHZv
aWQpICAgeyByZXR1cm4gdHJ1ZTsgfQojZWxpZiAhZGVmaW5lZChDT05GSUdfS0FTQU5fR0VORVJJ
QykgfHwgIWRlZmluZWQoQ09ORklHX0tBU0FOX09VVExJTkUpCiNlcnJvciBrYXNhbl9hcmNoX2lz
X3JlYWR5IG9ubHkgd29ya3MgaW4gS0FTQU4gZ2VuZXJpYyBvdXRsaW5lIG1vZGUhCiNlbmRpZgoK
Cgo+IFNpbmNlIHRoaXMgaXMgdGhlIGNhc2Ugb25seSBmb3IgVU1MLCBBRkFJVSwgSSBkb24ndCB0
aGluayB3ZSB3YW50IHRvIGNoYW5nZQo+IGNvbmRpdGlvbnMgaW4gbGliL0tjb25maWcua2FzYW4u
IFNoYWxsIEkgbGVhdmUgVU1MIEtjb25maWcgYXMgaXQgaXM/IGUuZy4KPiAKPiBzZWxlY3QgQVJD
SF9ERUZFUl9LQVNBTgo+IAoKTm8sIHRoaXMgc2hvdWxkIGhhdmUgaWYgU1RBVElDX0xJTksKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
