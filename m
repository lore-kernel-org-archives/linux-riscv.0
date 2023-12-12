Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D6BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1lx7hbTi3oR13Ce76hEjJNUivoIQQhOd+o6/Tv3X4w=; b=gRkeIRab7NuSW/
	+zK9Qn1fxGqepWv7bUgN0Ubm/T+tDAe5atc4KMhqGmb+KmBOYV3kQIUYovmrnyLM55HGbso+DvVvv
	tzrlhCmWeIOpPCXBGHgg+4eDxpUBMXZ1L7bqubnWBIbtAdqo6quK6DwkV81Botd9KFiQJ1ziiLtIf
	F/rJtCNUlGx1u/E3LDw52PHtzfzIhduMwYlU04j2qzC1tikkqiHZc7nnb9V3/TVZLNO/6lBp7KwGU
	1Y17vKaT/3cc6lisA+Za5W48jsXrqDWAzJhZHnGMeWJP7fiLJGTzEiYQ+8CthY+qBvoWc3PJksdBz
	TG8LmLDxLDSKf2oSXnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxzg-00B1uG-0F;
	Tue, 12 Dec 2023 08:19:56 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxzY-00B1ta-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 08:19:54 +0000
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbc8b07ceddso1802142276.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 00:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702369186; x=1702973986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz85Z8XdgQqhlQatAV59mgkpmbeo3/1i+Ku2kekUiYM=;
        b=IjU9ZJC5MJfSTThbIBdcLwk6v3sYgvQxbJos6fgXiQPr9n0p6SE99sb9zdof+/Ta+4
         naDqcN+b0Z4HRPIBlOCglFIpPQiOpw5KkpvOcaF4Bqu1mg5qqcXW6aZXqOjbQ3z2TIQe
         Q+LXD75IWTQqko4wXzxNDBhyboXfONUHunLguJyYyDH3OvyLHBDdXzHn/vz2IGqiLJvg
         mS+sQRUCDQEI+BBXbaCpBV111IenqWaZZgkvjn5huX0ZyN36KV8RbOi3L67ga3qiePlv
         dM7iGxmIgQXSyhH3UFm2cQSmbf0BIppI3OiSpKRECDqVHHdk2nIqiMPpCaZKAeKaN/sb
         NKMQ==
X-Gm-Message-State: AOJu0Yw23RoblP8FKa6Ps5m27XR2A/++qQzN+P422U9o/LSeq9YkmzM7
	jbMTxQnv9sPx9Sjo4Cg6NxcClvcxwit3fg==
X-Google-Smtp-Source: AGHT+IGyiCDzQrZ74Im7ojwKRWKJi6HB5xmA70mSlhjTxpNymo+SC7R8q+kmWxmeNNQhe9HQlE+iYA==
X-Received: by 2002:a5b:7cf:0:b0:db9:6bcd:a68c with SMTP id t15-20020a5b07cf000000b00db96bcda68cmr3304182ybq.44.1702369184876;
        Tue, 12 Dec 2023 00:19:44 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q3-20020a258e83000000b00d815cb9accbsm3034654ybl.32.2023.12.12.00.19.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 00:19:44 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbc8b07ceddso1802115276.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 00:19:44 -0800 (PST)
X-Received: by 2002:a5b:792:0:b0:da0:ccd6:b8a2 with SMTP id
 b18-20020a5b0792000000b00da0ccd6b8a2mr3073704ybq.19.1702369184206; Tue, 12
 Dec 2023 00:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20231211-primate-arbitrate-fbcd307a0b00@spud>
In-Reply-To: <20231211-primate-arbitrate-fbcd307a0b00@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2023 09:19:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0bETuMoZCZM7pAodbwyf0ttZMpKuq0ibBZX7S-YV8xw@mail.gmail.com>
Message-ID: <CAMuHMdX0bETuMoZCZM7pAodbwyf0ttZMpKuq0ibBZX7S-YV8xw@mail.gmail.com>
Subject: Re: [PATCH v1] soc: renesas: make ARCH_R9A07G043 depend on !DMA_DIRECT_REMAP
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_001952_231030_771F5D3A 
X-CRM114-Status: GOOD (  20.50  )
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

SGkgQ29ub3IsCgpPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAxMTowNuKAr1BNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IFJhbmR5IHJlcG9ydGVkIHlldCBhbm90aGVyIGJ1aWxk
IGlzc3VlIHdpdGggcmFuZGNvbmZpZ3Mgb24gcnYzMjoKPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3Qg
ZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBETUFfR0xPQkFMX1BPT0wKPiAgIERlcGVuZHMgb24g
W25dOiAhQVJDSF9IQVNfRE1BX1NFVF9VTkNBQ0hFRCBbPW5dICYmICFETUFfRElSRUNUX1JFTUFQ
IFs9eV0KPiAgIFNlbGVjdGVkIGJ5IFt5XToKPiAgIC0gQVJDSF9SOUEwN0cwNDMgWz15XSAmJiBT
T0NfUkVORVNBUyBbPXldICYmIFJJU0NWIFs9eV0gJiYgTk9OUE9SVEFCTEUgWz15XSAmJiBSSVND
Vl9BTFRFUk5BVElWRSBbPXldICYmICFSSVNDVl9JU0FfWklDQk9NIFs9bl0gJiYgUklTQ1ZfU0JJ
IFs9eV0KPgo+IFRoaXMgaGFwcGVucyB3aGVuIERNQV9ESVJFQ1RfUkVNQVAgaXMgc2VsZWN0ZWQg
YnkgdGhlIFQtSGVhZCBDTU8gZXJyYXR1bQoKb3IgYnkgdGhlIFppY2JvbSBleHRlbnNpb24gc3Vw
cG9ydD8KCj4gb3B0aW9uIGFuZCBETUFfR0xPQkFMX1BPT0wgaXMgc2VsZWN0ZWQgYnkgdGhlIEFu
ZGVzIENNTyBlcnJhdHVtLiBCbG9jawo+IHNlbGVjdGluZyB0aGUgUlovRml2ZSBjb25maWcgb3B0
aW9uLCBhbmQgYnkgZXh0ZW5zaW9uIERNQV9HTE9CQUxfUE9PTCwKPiBpZiBETUFfRElSRUNUX1JF
TUFQIGhhcyBhbHJlYWR5IGJlZW4gZW5hYmxlZC4KPgo+IEZpeGVzOiA0ODQ4NjFlMDlmM2UgKCJz
b2M6IHJlbmVzYXM6IEtjb25maWc6IFNlbGVjdCB0aGUgcmVxdWlyZWQgY29uZmlncyBmb3IgUlov
Rml2ZSBTb0MiKQo+IFJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFk
Lm9yZz4KPiBUZXN0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiAj
IGJ1aWxkLXRlc3RlZAo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzI0OTQy
YjRkLWQxNmEtNDYzZi1iMzlhLWY5ZGZjYjg5ZDc0MkBpbmZyYWRlYWQub3JnLwo+IFNpZ25lZC1v
ZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpSZXZpZXdl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KaS5lLiB3
aWxsIHF1ZXVlIGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY2LjguCgpPciBzaG91bGQgdGhpcyBiZSBx
dWV1ZWQgYXMgYSBmaXggZm9yIHY2LjcgaW5zdGVhZD8KCj4gLS0tCj4gSSBkb24ndCBrbm93IHdo
YXQgdGhlIGV4YWN0IGZpeGVzIHRhZyBoZXJlIGlzIGFzIEkgZGlkIG5vdCBiaXNlY3Qgd2l0aAo+
IHRoZSByYW5kY29uZmlnLCBzbyBJIGJsYW1lZCB0aGUgb25lIHRoYXQgYWRkZWQgRE1BX0dMT0JB
TF9QT09MLgoKQmlzZWN0aW9uIGxlYWRzIHRvIGNvbW1pdCBkYTMyM2Q0NjQwNzA0MDAxICgiZG1h
LWRpcmVjdDogYWRkCmRlcGVuZGVuY2llcyB0byBDT05GSUdfRE1BX0dMT0JBTF9QT09MIikgaW4g
djYuNy1yYzEsIGJ1dCB0aGF0IGlzCm1lcmVseSBtYWtpbmcgdmlzaWJsZSB0aGUgc3ltcHRvbXMs
IHNvIEkgdGhpbmsgeW91ciBGaXhlcyB0YWcgaXMgZmluZS4KCkVzbWlsOiBJIHRoaW5rIHlvdSBu
ZWVkIGEgc2ltaWxhciBmaXggZm9yIEVSUkFUQV9TVEFSRklWRV9KSDcxMDAgaW4KeW91ciB0cmVl
LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
