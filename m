Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74989C54E67
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wb/SXKF3Mm070cKMtRL06qFho/tmypyVZHRdxDDv2hE=; b=V3x92txJABvQEx
	nqjP4zxLX/dTVykNibcxu92skMSOcbDkYlnkEDkok78ljkDR+/BaVfQ+pWBofANmvcgkZW9WNwlHS
	ubaH4rsFkk7yhlh99k1JeEquwDL31PVJP9Flm01m8/JEqX74eGpermmqp+aGdrZKXwV1b1hJILqQ2
	SwQqcxGnusyjtAHefYDTZJoRN+aLTVvGEIGOLmnXKFl7RbuN5Q8OAOnhAl4n/YO4VOL4L/6SEkexc
	l3J+jDV6B+9+Lvw55h9HWgjxbrhd4I5yG/v8R1gbgH1cIbbzmLiHPPTgGroP9cx6IKolxAjhAtRyu
	5oCjBT4SoQ7ejjrplOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro87g-0000000B8OT-0SnS;
	Sat, 23 Mar 2024 20:37:48 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro87c-0000000B8Nq-3ZVr
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 20:37:46 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-611450d7f95so3210467b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711226260; x=1711831060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24wJWvfMNNR4rY9ZJ72kq+zMk5fkM7haArePsqOnmfc=;
        b=xYLhwnoe2Iz1W2GLP4ZbxTosDpmbdgSy64dvqSsCmO0+MCYVnoQvoi4HaegZxiwOwV
         j2Ca1HPTSfsGxDf0yvJpi0HZep7wfyQkRZQ6L0R2OxItcBFV8Fu6kPSLd5WSpi0XSMnT
         veqjBQNDj/qSN94TcJtJoMdB9hQaPsOIMpx04A3NNfUkRC9xcjvsXdX/ZHI8L2SH+uKe
         hh68pO//JncRmmIoUzrKehxSaxB5L7Y0TGI83opNso6oZlhZheRbozi01Y0FtWTQDagi
         JE+ltxd+9dquDeR9oJTrsMr/90/ZhZfoj0UH4GWZnWLT+bg8DvI5ZnJHlnGgrj3mxg0L
         UutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711226260; x=1711831060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24wJWvfMNNR4rY9ZJ72kq+zMk5fkM7haArePsqOnmfc=;
        b=eR55+dP/f95XJn0waGhSZMVdX3+2yIosnlN8MpLV5z+XlOarypvqZOp86b2QvsaMrs
         45UbX11Y8fB9kHiWxPGBfbqOF9gQYyw5lcg7/G3ab4w1nYRfmr1LRVzle3j/Xj3SlYKB
         MBDH7p1N8c4yz8OK+JbtBXu0mFwfFyFYZyYW28Z/7JbGTysFoOqSCm3TtYCwbi5sfmzr
         oSrE+/hprXI85F6uElXco+FMpMQvRpM2LhsdwkEU153696JH+PXZUx+Q81YV5PLZKb4l
         vyV7hhlDq0G0lAqFlMQT4hYAHjt66St82HVizpSAYIIk4gOp2w0Xs0WcvualUy3CA3YO
         8TEA==
X-Forwarded-Encrypted: i=1; AJvYcCVxGB43Y2obFpVJkpno5WDqzaz5YDKBi07UoMASnuoqV9lyb8j0eZBxeEZqyQ7vI1WRWq+atxT2hcvdElpfNBHs3A5QWpBLEx9r9urRKWVb
X-Gm-Message-State: AOJu0Yy7uRohWPvKSnlKrajqXZax6DRwNFWZI5nJrh0HxVdu+fbirbBt
	TGXfMsFcgWAxPjeWW7g0TfZO4Ckfmk+12TxEWWDL5drl4imDrcawVe3ohdbNbVrZxB0FuBiUvP3
	lky2wwNHDe5eTUokq11ISX9EUnxITa60Spb1oyQ==
X-Google-Smtp-Source: AGHT+IGKymQ6ArV3LTX39wPDQmJ+EcNQqIyE71qeKh8yulGXmkXtiwJzoMcBHLUtnhwBvRoabFlDgM5kHlMz+0M6rCw=
X-Received: by 2002:a0d:d981:0:b0:609:6eb0:4714 with SMTP id
 b123-20020a0dd981000000b006096eb04714mr2781546ywe.34.1711226259384; Sat, 23
 Mar 2024 13:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com> <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com> <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
 <d9452ab4-a783-4bcf-ac25-40baa4f31fac@sifive.com> <CAKC1njRBbzM+gWowg1LOjq5GzVn4q+vJP9JUswVYfWmEw+yHSg@mail.gmail.com>
 <20240323-28943722feb57a41fb0ff488@orel>
In-Reply-To: <20240323-28943722feb57a41fb0ff488@orel>
From: Deepak Gupta <debug@rivosinc.com>
Date: Sat, 23 Mar 2024 13:37:28 -0700
Message-ID: <CAKC1njRqWYOsF9bQvWX99DhP8Ji_wDUc8J8N41=N6J_tncM3=A@mail.gmail.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org, 
	kasan-dev@googlegroups.com, Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_133745_047825_B5E109FC 
X-CRM114-Status: GOOD (  41.10  )
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

T24gU2F0LCBNYXIgMjMsIDIwMjQgYXQgMjozNeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgMTA6MTM6
NDhBTSAtMDcwMCwgRGVlcGFrIEd1cHRhIHdyb3RlOgoKPiA+ID4gPiBZZWFoIEkgbGVhbiB0b3dh
cmRzIHVzaW5nIGFsdGVybmF0aXZlcyBkaXJlY3RseS4KPiA+ID4KPiA+ID4gT25lIHRoaW5nIHRv
IG5vdGUgaGVyZTogd2UgY2FuJ3QgdXNlIGFsdGVybmF0aXZlcyBkaXJlY3RseSBpZiB0aGUgYmVo
YXZpb3IgbmVlZHMKPiA+ID4gdG8gYmUgZGlmZmVyZW50IG9uIGRpZmZlcmVudCBoYXJ0cyAoaS5l
LiBhIHN1YnNldCBvZiBoYXJ0cyBpbXBsZW1lbnQgdGhlIGVudmNmZwo+ID4gPiBDU1IpLiBJIHRo
aW5rIHdlIG5lZWQgc29tZSBwb2xpY3kgYWJvdXQgd2hpY2ggSVNBIGV4dGVuc2lvbnMgYXJlIGFs
bG93ZWQgdG8gYmUKPiA+ID4gYXN5bW1ldHJpYyBhY3Jvc3MgaGFydHMsIG9yIGVsc2Ugd2UgYWRk
IHRvbyBtdWNoIGNvbXBsZXhpdHkuCj4gPgo+ID4gQXMgSSd2ZSByZXNwb25kZWQgb24gdGhlIHNh
bWUgdGhyZWFkIC4gV2UgYXJlIGFkZGluZyB0b28gbXVjaAo+ID4gY29tcGxleGl0eSBieSBhc3N1
bWluZwo+ID4gdGhhdCBoZXRlcm9nZW5lb3VzIElTQSBleGlzdHMgKHdoaWNoIGl0IGRvZXNuJ3Qg
dG9kYXkpLiBBbmQgZXZlbiBpZiBpdAo+ID4gZXhpc3RzLCBpdCB3b3VsZG4ndCB3b3JrLgo+ID4g
Tm9ib2R5IHdhbnRzIHRvIHNwZW5kIGEgbG90IG9mIHRpbWUgZmlndXJpbmcgb3V0IHdoaWNoIGhh
cnRzIGhhdmUKPiA+IHdoaWNoIElTQSBhbmQgd2hpY2gKPiA+IHBhY2thZ2VzIGFyZSBjb21waWxl
ZCB3aXRoIHdoaWNoIElTQS4gTW9zdCBvZiB0aGUgZW5kIHVzZXJzIGRvIGBzdWRvCj4gPiBhcHQg
Z2V0IGluc3RhbGwgYmxhaCBibGFoYAo+ID4gQW5kIHRoZW4gZXhwZWN0IGl0IHRvIGp1c3Qgd29y
ay4KPgo+IFRoYXQgd2lsbCBzdGlsbCB3b3JrIGlmIHRoZSBhcHBsaWNhdGlvbnMgYW5kIGxpYnJh
cmllcyBpbnN0YWxsZWQgYXJlCj4gaGV0ZXJvZ2VuZW91cy1wbGF0Zm9ybSBhd2FyZSwgaS5lLiB0
aGV5IGRvIHRoZSBmaWd1cmluZyBvdXQgd2hpY2ggaGFydHMKPiBoYXZlIHdoaWNoIGV4dGVuc2lv
bnMgdGhlbXNlbHZlcy4gQXBwbGljYXRpb25zL2xpYnJhcmllcyBzaG91bGQgYWxyZWFkeQo+IGJl
IHByb2JpbmcgZm9yIElTQSBleHRlbnNpb25zIGJlZm9yZSB1c2luZyB0aGVtLiBJdCdzIG5vdCBh
IGh1Z2UgbGVhcCB0bwo+IGFsc28gY2hlY2sgd2hpY2ggaGFydHMgc3VwcG9ydCB0aG9zZSBleHRl
bnNpb25zIGFuZCB0aGVuIGVuc3VyZSBhZmZpbml0eQo+IGlzIHNldCBhcHByb3ByaWF0ZWx5LgoK
SG93ID8KSXQncyBhIHNpbmdsZSBpbWFnZSBvZiBhIGxpYnJhcnkgdGhhdCB3aWxsIGJlIGxvYWRl
ZCBpbiBtdWx0aXBsZSBhZGRyZXNzIHNwYWNlcy4KWW91IGV4cGVjdCBhbGwgY29kZSBwYWdlcyB0
byBkbyBDT1cgZm9yIG11bHRpcGxlIGFkZHJlc3Mgc3BhY2VzIG9yCmV4cGVjdCB0byBoYXZlCnBl
ciB0YXNrIHZhcmlhYmxlcyB0byBjaG9vc2UgZGlmZmVyZW50IGNvZGUgcGF0aHMgaW4gdGhlIGxp
YnJhcnkgYmFzZWQKb24gYWRkcmVzcyBzcGFjZSBpdHMKcnVubmluZyBpbiA/Ck9uIHRvcCBvZiB0
aGF0LCB0aGUgbGlicmFyeS9hcHBsaWNhdGlvbiBkZXZlbG9wZXIgZG9lc24ndCBrbm93IGhvdyB0
aGUKZW5kIHVzZXIgaXMgZ29pbmcgdG8gdXNlIHRoZW0uCkVuZCB1c2VycyAoc3lzYWRtaW4sIGV0
YykgIGp1c3QgbWlnaHQgdXNlIHRhc2tzZXQgdG8gcHV0IGFmZmluaXR5IG9uCnRhc2tzIHdpdGhv
dXQgYmVpbmcgYXdhcmUuCkkganVzdCBkb24ndCBzZWUgdGhlIG1vdGl2YXRpb24gaW4gYW4gYXBw
bGljYXRpb24gZGV2ZWxvcGVyL2xpYnJhcnkKZGV2ZWxvcGVyIHRvIGRvIHNvbWV0aGluZwpsaWtl
IHRoaXMuIE5vIGFwcGxpY2F0aW9uL2xpYnJhcnkgZGV2ZWxvcGVyIGhhcyB0aW1lIGZvciB0aGlz
LiBQdXR0aW5nCmEgbG90IG9mIGJ1cmRlbiBvbiBhcHBsaWNhdGlvbgpkZXZlbG9wZXJzIGlzIG1v
c3RseSBhIG51aXNhbmNlIGNvbnNpZGVyaW5nIHRoZXkgZG9uJ3QgaGF2ZSB0byB0aGluawphYm91
dCB0aGVzZSBudWlzYW5jZQp3aGVuIHRoZXkgZXhwZWN0IHRoZSBzYW1lIGNvZGUgdG8gYmUgZGVw
bG95ZWQgb24gbm9uLXJpc2N2IGFyY2hpdGVjdHVyZXMuCgpPbmUgZ29vZCBleGFtcGxlIG9mIHB1
dHRpbmcgdW5uZWNlc3NhcnkgYnVyZGVuIG9uIGFwcC9saWJyYXJ5CmRldmVsb3BlciBpcyBJbnRl
bCBTR1gKVGhpcyBpcyBleGFjdGx5IHRoZSByZWFzb24gSW50ZWwgU0dYIGZhaWxlZC4gQXBwbGlj
YXRpb24gZGV2ZWxvcGVycwpkb24ndCBoYXZlIHRpbWUgdG8gZGV2ZWxvcApjb25maWRlbnRpYWwg
Y29tcHV0ZSB2ZXJzaW9uIG9mIHRoZSBhcHBsaWNhdGlvbiBmb3IgYSBzcGVjaWZpYyBDUFUKd2hp
bGUgb24gb3RoZXIgQ1BVcyBjYXJyeQphIGRpZmZlcmVudCB2ZXJzaW9uIG9mIGFwcGxpY2F0aW9u
LiBCdXQgYXQgdGhlIHNhbWUgdGltZSB2aXJ0dWFsCm1hY2hpbmUgY29uZmlkZW50aWFsIGNvbXB1
dGUgaXMKYmV0dGVyIGFwcHJvYWNoIHdoZXJlIGFsbCBjb21wbGljYXRlZCBkZWNpc2lvbiBtYWtp
bmcgaXMgZGVsZWdhdGVkIHRvCm9wZXJhdGluZyBzeXN0ZW0KZGV2ZWxvcGVyIGFuZCBhcHBsaWNh
dGlvbi9saWJyYXJ5IGRldmVsb3BlcnMgYXJlIGVtcG93ZXJlZCB0byBvbmx5CnRoaW5rIGFib3V0
IHRoZWlyIHN0dWZmLgoKPgo+ID4gSXQgZG9lc24ndCB3b3JrIGZvciBvdGhlcgo+ID4gYXJjaGl0
ZWN0dXJlcyBhbmQgZXZlbiB3aGVuIHNvbWVvbmUKPiA+IHRyaWVkLCB0aGV5IGhhZCB0byBkaXNh
YmxlIGNlcnRhaW4gSVNBIGZlYXR1cmVzIHRvIG1ha2Ugc3VyZSB0aGF0IGFsbAo+ID4gY29yZXMg
aGF2ZSB0aGUgc2FtZSBJU0EgZmVhdHVyZQo+ID4gKHNlYXJjaCBBVlgxMiBJbnRlbCBBbGRlciBM
YWtlIERpc2FibGUpLgo+Cj4gVGhlIFJJU0MtViBzb2Z0d2FyZSBlY29zeXN0ZW0gaXMgc3RpbGwg
YmVpbmcgZGV2ZWxvcGVkLiBXZSBoYXZlIGFuCj4gb3Bwb3J0dW5pdHkgdG8gZHJvcCBhc3N1bXB0
aW9ucyBtYWRlIGJ5IG90aGVyIGFyY2hpdGVjdHVyZXMuCgpJdCBkb2Vzbid0IG1lYW4gdGhhdCBp
dCBzaG91bGQgdHJ5IHRvIG1ha2UgdGhlIHNhbWUgbWlzdGFrZXMgd2hpY2gKb3RoZXJzIGhhdmUg
ZG9uZS4KCklmIHRoZXJlIGlzIGEgbW90aXZhdGlvbiBhbmQgdXNlIGNhc2UgZnJvbSBlbmQgdXNl
ciBwZXJzcGVjdGl2ZSwgcGxlYXNlIHByb3ZpZGUuCk90aGVyd2lzZSBubyBwb2ludCBkb2luZyBz
b21ldGhpbmcgd2hpY2ggaXMganVzdCBhIHNjaWVuY2UgdGhvdWdodApleGVyY2lzZSBhbmQgbm8g
Y29uY3JldGUgdXNlIGNhc2UuCgpQbGVhc2Ugbm90ZSB0aGF0IHRoZXNlIGFyZ3VtZW50cyBhcmUg
YWdhaW5zdCBIZXRlcm9nZW5lb3VzIElTQSBvbiBjb3Jlcy4KRnJvbSBwb3dlciBhbmQgZWZmaWNp
ZW5jeSBwZXJzcGVjdGl2ZSBjb3JlcyBjYW4gc3RpbGwgYmUgaGV0ZXJvZ2VuZW91cy4KCj4KPgo+
IEFzIEkgc2FpZCBpbiBhIGRpZmZlcmVudCByZXBseSwgaXQncyByZWFzb25hYmxlIGZvciBMaW51
eCB0byBub3QgYWRkIHRoZQo+IGNvbXBsZXhpdHkgdW50aWwgYSB1c2UgY2FzZSBjb21lcyBhbG9u
ZyB0aGF0IExpbnV4IHdvdWxkIGxpa2UgdG8gc3VwcG9ydCwKPiBidXQgSSB0aGluayBpdCB3b3Vs
ZCBiZSBwcmVtYXR1cmUgZm9yIExpbnV4IHRvIHB1dCBhIHN0YWtlIGluIHRoZSBzYW5kLgo+Cj4g
U28sIGhvdyBhYm91dCB3ZSBhZGQgY29kZSB0aGF0IGNvbmZpcm1zIFppY2JveiBpcyBvbiBhbGwg
aGFydHMuIElmIGFueQo+IGhhcnQgZG9lcyBub3QgaGF2ZSBpdCwgdGhlbiB3ZSBjb21wbGFpbiBs
b3VkbHkgYW5kIGRpc2FibGUgaXQgb24gYWxsCj4gdGhlIG90aGVyIGhhcnRzLiBJZiBpdCB3YXMg
anVzdCBhIGhhcmR3YXJlIGRlc2NyaXB0aW9uIGJ1ZywgdGhlbiBpdCdsbAo+IGdldCBmaXhlZC4g
SWYgdGhlcmUncyBhY3R1YWxseSBhIHBsYXRmb3JtIHdoaWNoIGRvZXNuJ3QgaGF2ZSBaaWNib3oK
PiBvbiBhbGwgaGFydHMsIHRoZW4sIHdoZW4gdGhlIGlzc3VlIGlzIHJlcG9ydGVkLCB3ZSBjYW4g
ZGVjaWRlIHRvIG5vdAo+IHN1cHBvcnQgaXQsIHN1cHBvcnQgaXQgd2l0aCBkZWZjb25maWcsIG9y
IHN1cHBvcnQgaXQgdW5kZXIgYSBLY29uZmlnCj4gZ3VhcmQgd2hpY2ggbXVzdCBiZSBlbmFibGVk
IGJ5IHRoZSB1c2VyLgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
