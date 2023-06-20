Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A8CEB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A28oD2XzKkSAl0kWrtyw7OIbLAwFq7oD7BfnjpCuWNs=; b=D1IFUx44Zjjy5I
	6us4hZOO998ct8KPxEHB9SHMoU8iJWPzKEVwsrIqUA3w3i11pkkcNe4oWwkRqB5MbYOYg65NV6ob0
	EPA8rLSLcLoJbez659tdjx8fuLco5YhppdIShTGCjzpD2SDzGfk1EXKZ9+5ejNsSGt+iofrfMTIvx
	gnq1ZRg99907MOkU6CICUyrgE7fpsPnhjfK5JEhyZWVbuU8GclfUjFcWlG55RAju+T5pT2Y33imKy
	H2KANU/snK6MArL1Bhw7HKX0Mbo8k4GU7fv9gecg9plcs8HzEyy01mMXxFQh/KWC4yruM7faT6syw
	66/T7HuaI3q6oKzQ2ikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBi1w-00CIbd-0f;
	Tue, 20 Jun 2023 20:32:48 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBi1t-00CIau-2d
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:32:47 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-763a3a95acbso184043885a.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687293164; x=1689885164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sOBwXFmC0K7NYb6lxaOI7FbE7H576FmqzhPnZbh/RQ=;
        b=tOqRhJiJuYS/iM7yaX5kRR0RI5J4yS1E5ocSFLwJFozah6ojYGDYEC3KMjqrchEHWN
         V5olyJeF5sdAVGmyxtKzlPJwixv1c+gFrSleYLPVdQZtnWtBnPtfTroLHA1oHlfq6NDf
         W6illmXhd6rNa/PIUTfFh2BSrLJMD/dE4ysNwbZpOroJXz0BTpxFlvGYRjt3C+Cs4d8e
         h/9Qo+g/BCkG3gfjk50kDZi3H1Z6DIl++Vte2DrrQ80+9d2PI1Ka0jRiR54Gv/wlxsKr
         xoljDYaj9RSg+l5SiIJnchoyU6QRqVoFXyi9s7wEvojivfMFhjAf3kYVjlrLEwk3TUR0
         mmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293164; x=1689885164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sOBwXFmC0K7NYb6lxaOI7FbE7H576FmqzhPnZbh/RQ=;
        b=FTwjsxWu0A4lhOxz7wqUNIxIg/vNHc9iorZ9KgyUiMeBtZOMOHTDCJsDhwInxprElT
         4ZFo9KH2DNrgqsn2LqbvSvRJt+TDGGRwNcOrQJEqe3jpmNsFXEJhEqY/pQImVvpqFf3O
         Sed8I8K1TGfqD+YrsdudA9tH6GIDbDt74yOg4deCABt+2bepuQvhv29lkjwGAOmHkyic
         HCfK7nW4fyj5CoqOZot+NZiKKW3DhQQjvllQ024k6w1D2KueKn6XDGVP1WjhZepBcUwU
         7MNDFJYMnDKlLUMIiuatGpo7Jv3jl/brrSHGQ9bh999NMfOHnvLGEzhvWt2e8MSN7vl5
         ywyg==
X-Gm-Message-State: AC+VfDzB9cgwvHugH/ppM2PoYyifI2drKBrF3RSg1w3D05a3vCZjrlnM
	R/VZB8ReKzTuXczRFbXlVXQWjesMESvxqsxeoMkw0A==
X-Google-Smtp-Source: ACHHUZ6EhOw5QjdhJDMDyaak9jtIy0YjhsLT4zH/jrMO4dPXvi62mXQ76XWruSIP2mh7WnNIEl42KmnbfYo3WvG4pQQ=
X-Received: by 2002:a05:6214:e4f:b0:62d:fd45:4d6a with SMTP id
 o15-20020a0562140e4f00b0062dfd454d6amr16222761qvc.16.1687293164010; Tue, 20
 Jun 2023 13:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-41a06775-95dc-4747-aaab-2c5c83fd6422@palmer-ri-x1c9>
 <mhng-57559277-afaa-4a85-a3ad-b9be6dba737f@palmer-ri-x1c9>
 <CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com> <20230620-gibberish-unblended-f4b50c7fe369@spud>
In-Reply-To: <20230620-gibberish-unblended-f4b50c7fe369@spud>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Jun 2023 16:32:32 -0400
Message-ID: <CAKwvOdn_U+yjFBn6pq5XwP1rTEKA1MWBkd0f2N8wB_nuS1_sWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org, llvm@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Fangrui Song <maskray@google.com>, Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_133245_856657_3C6F9902 
X-CRM114-Status: GOOD (  19.84  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNDoxM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyMCwgMjAyMyBhdCAwNDowNTo1NVBNIC0w
NDAwLCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMTksIDIwMjMgYXQg
NjowNuKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+ID4g
PiBPbiBUaHUsIDE1IEp1biAyMDIzIDA2OjU0OjMzIFBEVCAoLTA3MDApLCBQYWxtZXIgRGFiYmVs
dCB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIDE0IEp1biAyMDIzIDA5OjI1OjQ5IFBEVCAoLTA3MDAp
LCBqc3poYW5nQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4+IE9uIFdlZCwgSnVuIDE0LCAyMDIz
IGF0IDA3OjQ5OjE3QU0gLTA3MDAsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4gPiA+Pj4gT24g
VHVlLCAyMyBNYXkgMjAyMyAwOTo1NDo1OCBQRFQgKC0wNzAwKSwganN6aGFuZ0BrZXJuZWwub3Jn
IHdyb3RlOgo+Cj4gPiA+ID4+IENvbW1pdCAzYjkwYjA5YWY1YmUgKCJyaXNjdjogRml4IG9ycGhh
biBzZWN0aW9uIHdhcm5pbmdzIGNhdXNlZCBieQo+ID4gPiA+PiBrZXJuZWwvcGkiKSB0b3VjaGVz
IHZtbGludXgubGRzLlMsIHNvIHRvIG1ha2UgdGhlIG1lcmdlIGVhc3ksIHRoaXMKPiA+ID4gPj4g
c2VyaWVzIGlzIGJhc2VkIG9uIDYuNC1yYzIuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MuCj4gPiA+
Cj4gPiA+IFNvcnJ5IHRvIGJlIHNvIHNsb3cgaGVyZSwgYnV0IEkgdGhpbmsgdGhpcyBpcyBjYXVz
aW5nIExMRCB0byBoYW5nIG9uCj4gPiA+IGFsbG1vZGNvbmZpZy4gIEknbSBzdGlsbCBnZXR0aW5n
IHRvIHRoZSBib3R0b20gb2YgaXQsIHRoZXJlJ3MgYSBmZXcKPiA+ID4gb3RoZXIgdGhpbmdzIEkg
aGF2ZSBpbiBmbGlnaHQgc3RpbGwuCj4gPgo+ID4gQ29uZmlybWVkIHdpdGggdjMgb24gbWFpbmxp
bmUgKGxpbnV4LW5leHQgaXMgcHJldHR5IHJlZCBhdCB0aGUgbW9tZW50KS4KPiA+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwNTE3MDgyOTM2LjM3NTYzLTEtZmFsY29u
QHRpbnlsYWIub3JnLwo+Cj4gSnVzdCBGWUkgTmljaywgdGhlcmUncyBiZWVuIHNvbWUgY29uY3Vy
cmVudCB3b3JrIGhlcmUgZnJvbSBkaWZmZXJlbnQKPiBwZW9wbGUgd29ya2luZyBvbiB0aGUgc2Ft
ZSB0aGluZyAmIHRoZSB2MyB5b3UgbGlua2VkIChmcm9tIFpoYW5namluKSB3YXMKPiBzdXBlcnNl
ZGVkIGJ5IHRoaXMgdjIgKGZyb20gSmlzaGVuZykuCgpBaCEgSSd2ZSBiZWVuIHRlc3RpbmcgdGhl
IGRlcHJlY2F0ZWQgcGF0Y2ggc2V0LCBzb3JyeSBJIGp1c3QgbG9va2VkIG9uCmxvcmUgZm9yICJk
ZWFkIGNvZGUiIG9uIHJpc2N2LWxpbnV4IGFuZCBncmFiYmVkIHRoZSBmaXJzdCB0aHJlYWQsCndp
dGhvdXQgbm90aWNpbmcgdGhlIGRpZmZlcmVuY2UgaW4gYXV0aG9ycyBvciBuZXcgdmVyc2lvbiBu
dW1iZXJzIGZvcgpkaXN0aW5jdCBzZXJpZXMuIG9rLCBuZXZlcm1pbmQgbXkgbm9pc2UuICBJJ2xs
IGZvbGxvdyB1cCB3aXRoIHRoZQpjb3JyZWN0IHBhdGNoIHNldCwgc29ycnkhCgo+Cj4gQ2hlZXJz
LAo+IENvbm9yLgoKCgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
