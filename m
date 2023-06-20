Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B38AEB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=W8hlBcxIsChn7s+vvh8M30EP10dSajv+fj9IiD/PLNg=; b=RbmI0mPfyJ0sH/U8Si5pxC81em
	WgcM4HuEAyVt4rkLCvL5usa6jtax6bpOclcpYTl9PFOQRLgPP7eqvNQWYIP+0lsX0zr/0+aGCeZec
	XFeznez5WpneI16h6MU9W8pIZ2vXqSiAJRegzHKlzVFtvyztL9JKF+IZWw6gqGu8rhSOqds571Z7c
	Aa1S/X2zroL9OLZ9QJbJjavfEOuTMCr7NLjDy5Huw582PSyiWgzdttmtaIULZyg5sle32yaDBsias
	w40a5BOWVXQ6NYy6TbBr++hUDmiJxwcqjZFGP6sCWPo8BxYfbPr9UqSe2e6r8naA/kA1zUuYKTsqU
	1rMUzVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiAP-00CJcu-1N;
	Tue, 20 Jun 2023 20:41:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiAM-00CJbu-21
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:41:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-666e916b880so2293173b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687293688; x=1689885688;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5z9pNcxTbLEfuGKBKG4TC9lAt5ChqheSmY8pbRkKfL4=;
        b=kTkoFl/hOE6DUn0o/TxNy8ei8a0pwF3wJ8WdqIIbNXUDBDjEdeDGAmfD2+RKWGXJTd
         T3K28E5f3GbYQN1zmSPmZIin3KKlSUuGyR86CjJT1U2jBF/N3FKoBM9bMwkagOXfEehr
         LE1fzTMO5bKWhTaPLlsyizdUF9TGPy6aFiOY/vnQgdbBWCVEGtA3s/FI33EEAwItrMJh
         VjtW979fJDNufkx776qo5gq8zTqT3t96sPZU5T73gmbYeidCAK2U6H9M5XTJ3SV4eQVW
         XmwzVsS4j/HUUONtDF+aGJdqhuO6ywBlWfNmAig3j5c9MqBK1xx+AEcWUY6eaTj23qt/
         6u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293688; x=1689885688;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z9pNcxTbLEfuGKBKG4TC9lAt5ChqheSmY8pbRkKfL4=;
        b=UUs+cvVvPKXl4rmEclZR9uYoOBHQ5zmseUAjxx7e9I2rox6IlqFPken4ezjkild1Cd
         klqXJiLLPxZsPpfs8UqWcv0IMGOlmPkJUimWqzjt4I6lks1o39e/E0Cg7ERgOqFPRFu/
         7FLPo8BS2dSBdgVqt+8PNSTyJ5hk5qI+LcZW25SLE0caaQB+3QriNaqLvWtSJEuYJLGw
         rWknZiB+R5lDF1lsEuP32zx1XTSOTqCRxhswDUWJ03NBHhuWVmCcM6L3NOZSFaS+PLBH
         cHLwe8RTpmxbl0hLvEePyAw6YWBVKrI4+DVhIHuZyDCpb2oHXAaU8iRUjet+NyZB7nKL
         IsJQ==
X-Gm-Message-State: AC+VfDx7Od+4WgH55uM/E2TzlcYpcyvvai6mjqiHMIJmHFF9Xa0S1vpC
	52vV++InHdepobGIcSTQbYHedw==
X-Google-Smtp-Source: ACHHUZ4aN+60FiuHJ8u8JkwcNH+wuIJ6cgDETNgmrC7TB9kOIDKZRE8DYgI1KARaEW/l8jTpFSXGNw==
X-Received: by 2002:a05:6a20:432a:b0:115:5910:c82d with SMTP id h42-20020a056a20432a00b001155910c82dmr4124776pzk.43.1687293688585;
        Tue, 20 Jun 2023 13:41:28 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 5-20020aa79145000000b006689ecd0ff4sm1442001pfi.208.2023.06.20.13.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:41:27 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:41:27 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 13:40:46 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <CAKwvOdn_U+yjFBn6pq5XwP1rTEKA1MWBkd0f2N8wB_nuS1_sWw@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, maskray@google.com,
  Ard Biesheuvel <ardb@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-16f1b957-5cf5-4786-a760-e4ab1fbe83ce@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_134130_849574_0A07BFC2 
X-CRM114-Status: GOOD (  27.15  )
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

T24gVHVlLCAyMCBKdW4gMjAyMyAxMzozMjozMiBQRFQgKC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdv
b2dsZS5jb20gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNDoxM+KAr1BNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgSnVuIDIwLCAy
MDIzIGF0IDA0OjA1OjU1UE0gLTA0MDAsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4+ID4gT24g
TW9uLCBKdW4gMTksIDIwMjMgYXQgNjowNuKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFi
YmVsdC5jb20+IHdyb3RlOgo+PiA+ID4gT24gVGh1LCAxNSBKdW4gMjAyMyAwNjo1NDozMyBQRFQg
KC0wNzAwKSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+ID4gPiA+IE9uIFdlZCwgMTQgSnVuIDIw
MjMgMDk6MjU6NDkgUERUICgtMDcwMCksIGpzemhhbmdAa2VybmVsLm9yZyB3cm90ZToKPj4gPiA+
ID4+IE9uIFdlZCwgSnVuIDE0LCAyMDIzIGF0IDA3OjQ5OjE3QU0gLTA3MDAsIFBhbG1lciBEYWJi
ZWx0IHdyb3RlOgo+PiA+ID4gPj4+IE9uIFR1ZSwgMjMgTWF5IDIwMjMgMDk6NTQ6NTggUERUICgt
MDcwMCksIGpzemhhbmdAa2VybmVsLm9yZyB3cm90ZToKPj4KPj4gPiA+ID4+IENvbW1pdCAzYjkw
YjA5YWY1YmUgKCJyaXNjdjogRml4IG9ycGhhbiBzZWN0aW9uIHdhcm5pbmdzIGNhdXNlZCBieQo+
PiA+ID4gPj4ga2VybmVsL3BpIikgdG91Y2hlcyB2bWxpbnV4Lmxkcy5TLCBzbyB0byBtYWtlIHRo
ZSBtZXJnZSBlYXN5LCB0aGlzCj4+ID4gPiA+PiBzZXJpZXMgaXMgYmFzZWQgb24gNi40LXJjMi4K
Pj4gPiA+ID4KPj4gPiA+ID4gVGhhbmtzLgo+PiA+ID4KPj4gPiA+IFNvcnJ5IHRvIGJlIHNvIHNs
b3cgaGVyZSwgYnV0IEkgdGhpbmsgdGhpcyBpcyBjYXVzaW5nIExMRCB0byBoYW5nIG9uCj4+ID4g
PiBhbGxtb2Rjb25maWcuICBJJ20gc3RpbGwgZ2V0dGluZyB0byB0aGUgYm90dG9tIG9mIGl0LCB0
aGVyZSdzIGEgZmV3Cj4+ID4gPiBvdGhlciB0aGluZ3MgSSBoYXZlIGluIGZsaWdodCBzdGlsbC4K
Pj4gPgo+PiA+IENvbmZpcm1lZCB3aXRoIHYzIG9uIG1haW5saW5lIChsaW51eC1uZXh0IGlzIHBy
ZXR0eSByZWQgYXQgdGhlIG1vbWVudCkuCj4+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyMzA1MTcwODI5MzYuMzc1NjMtMS1mYWxjb25AdGlueWxhYi5vcmcvCj4+Cj4+
IEp1c3QgRllJIE5pY2ssIHRoZXJlJ3MgYmVlbiBzb21lIGNvbmN1cnJlbnQgd29yayBoZXJlIGZy
b20gZGlmZmVyZW50Cj4+IHBlb3BsZSB3b3JraW5nIG9uIHRoZSBzYW1lIHRoaW5nICYgdGhlIHYz
IHlvdSBsaW5rZWQgKGZyb20gWmhhbmdqaW4pIHdhcwo+PiBzdXBlcnNlZGVkIGJ5IHRoaXMgdjIg
KGZyb20gSmlzaGVuZykuCj4KPiBBaCEgSSd2ZSBiZWVuIHRlc3RpbmcgdGhlIGRlcHJlY2F0ZWQg
cGF0Y2ggc2V0LCBzb3JyeSBJIGp1c3QgbG9va2VkIG9uCj4gbG9yZSBmb3IgImRlYWQgY29kZSIg
b24gcmlzY3YtbGludXggYW5kIGdyYWJiZWQgdGhlIGZpcnN0IHRocmVhZCwKPiB3aXRob3V0IG5v
dGljaW5nIHRoZSBkaWZmZXJlbmNlIGluIGF1dGhvcnMgb3IgbmV3IHZlcnNpb24gbnVtYmVycyBm
b3IKPiBkaXN0aW5jdCBzZXJpZXMuIG9rLCBuZXZlcm1pbmQgbXkgbm9pc2UuICBJJ2xsIGZvbGxv
dyB1cCB3aXRoIHRoZQo+IGNvcnJlY3QgcGF0Y2ggc2V0LCBzb3JyeSEKCllhLCBJIGhhZG4ndCBl
dmVuIG5vdGljZWQgdGhlIHYzIGJlY2F1c2UgSSBwcmV0dHkgbXVjaCBvbmx5IGxvb2sgYXQgCnBh
dGNod29yayB0aGVzZSBkYXlzLiAgTGlrZSB3ZSB0YWxrZWQgYWJvdXQgaW4gSVJDLCBJJ20gZ29p
bmcgdG8gZ28gdGVzdCAKdGhlIG1lcmdlIG9mIHRoaXMgb25lIGFuZCBzZWUgd2hhdCdzIHVwIC0t
IEkndmUgZ290IGl0IHN0YWdlZCBhdCAKPGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3BhbG1lci9saW51eC5naXQvY29tbWl0Lz9oPWZvci1uZXh0JmlkPTFi
ZDI5NjNiMjE3NThhNzczMjA2YTFjYjY3YzkzZTdhOGFlOGExOTU+LCAKdGhvdWdoIHRoYXQgd29u
J3QgYmUgYSBzdGFibGUgaGFzaCBpZiBpdCdzIGFjdHVhbGx5IGJyb2tlbi4uLgoKPgo+Pgo+PiBD
aGVlcnMsCj4+IENvbm9yLgo+Cj4KPgo+IC0tIAo+IFRoYW5rcywKPiB+TmljayBEZXNhdWxuaWVy
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
