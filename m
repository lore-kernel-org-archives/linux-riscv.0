Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAB2C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhLlCZnm3OJUzFoyVQUs2S3h2cSNh6PyTkkssx4wXZw=; b=B0Sne+pNu8iMEx
	ncSok8tPBkpXr/bjd4oW9UT9FSPcbIitozHlx8QKmkHx8eH8gU+qOFyPjpX437MVRjBsiJ+vZ1brv
	QhnDSLLBkV++R9PECtF9Qvpr1rvKH8DMgk+id1OeKRakQEGyMzUTg8BpjoL+seWBPq/pFN1Qa0648
	N63MFlw17x7nr3HC5ihW3LJ0luBpR/VI92Tiy8fc6q0Djl7ZUbHs3l5d/Bgp/Zldo6c4tyP8ZN+TN
	XpMjuvJh7oLIWuiXA8Rlgmsx8T6mN1o9Stk2fX/JGwsKh7yv3GfY6UOEob8l7ei/KmGgfhOPLgU6R
	hEuiJvkczAqEL70ZP/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdgU-002LYY-O5; Tue, 07 Mar 2023 20:13:18 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdgS-002LYB-8S
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:13:17 +0000
Received: by mail-qt1-f172.google.com with SMTP id cf14so15775968qtb.10
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 12:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678219994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3stqVjLskfbfOT438nYiHO+CKvrvqwMMd5bgl/gs6j0=;
        b=JMx5VcGyKzuNtmXAPYSurvg4C6ck4ZoajHmBNAR11hvX4KBPqo5sPB233mobYJSaPE
         z3mCDfR/Mde343BsSwWbUaZlGB/nBERLrkzJQ8yCzA+hXZ+orL9ekf08AmaYAyuBptkX
         43eNX4C11FajXg7S7hKj4rOoEu1M0/bI8KuXNiTtWug9pZs0Xsn5FYXJYl+i9BcKFMoL
         TdHnOe/HI291V1q2K/ShAO+46hR/EmOcGjJT0TBhsWMrxXncLTEFA/yh5tkk7AvSgyTz
         oTuZ6QNLN3U66MLxk9WwJM9016CnqUefWtvkRDhpRiCKR+l+kGxr5OI6jVsyKlAaNp0Q
         73rQ==
X-Gm-Message-State: AO0yUKWQTyjZ+8ueNwauafIVIjOCaMq/7aVztbq2tg/bFrrYdJP39otG
	Vf6B2P/Yv9wyds77EIqS8Vq70FyFHJCUUQ==
X-Google-Smtp-Source: AK7set+h+0txjYkjIBSOrB+14pg1ptNxXEJiCX4mTmf5QAmkDd6FR/mRRlm5y6LpgbeJqGAAURBTqQ==
X-Received: by 2002:a05:622a:34a:b0:3bf:d258:c151 with SMTP id r10-20020a05622a034a00b003bfd258c151mr29797592qtw.12.1678219994006;
        Tue, 07 Mar 2023 12:13:14 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id p16-20020ae9f310000000b0073b967b9b35sm10049560qkg.106.2023.03.07.12.13.12
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 12:13:12 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id k23so12604644ybk.13
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 12:13:12 -0800 (PST)
X-Received: by 2002:a5b:d4e:0:b0:a27:3ecd:6 with SMTP id f14-20020a5b0d4e000000b00a273ecd0006mr9562402ybr.1.1678219992287;
 Tue, 07 Mar 2023 12:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20230302174154.970746-1-conor@kernel.org>
In-Reply-To: <20230302174154.970746-1-conor@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Mar 2023 21:13:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU7oV4PcVDHOugq8TFn7bw4Q3DEpjCfcTpVJZLkC9LKOA@mail.gmail.com>
Message-ID: <CAMuHMdU7oV4PcVDHOugq8TFn7bw4Q3DEpjCfcTpVJZLkC9LKOA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: fix taking the text_mutex twice during sifive
 errata patching
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	Chris Hofstaedtler <zeha@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_121316_343135_CA66399F 
X-CRM114-Status: GOOD (  18.61  )
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

SGkgQ29ub3IsCgpPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDY6NDXigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBDaHJpcyBwb2ludGVkIG91dCB0aGF0IHNvbWUgYm9uZWhl
YWQsICpjb3VnaCogbWUgKmNvdWdoKiwgYWRkZWQgdHdvCj4gbXV0ZXhfbG9ja3MoKSB0byB0aGUg
U2lGaXZlIGVycmF0YSBwYXRjaGluZy4gVGhlIHNlY29uZCB3YXMgbWVhbnQgdG8KPiBoYXZlIGJl
ZW4gYSBtdXRleF91bmxvY2soKS4KPgo+IFJlcG9ydGVkLWJ5OiBDaHJpcyBIb2ZzdGFlZHRsZXIg
PHplaGFAZGViaWFuLm9yZz4KPiBGaXhlczogOTQ5M2U2ZjNjZTAyICgiUklTQy1WOiB0YWtlIHRl
eHRfbXV0ZXggZHVyaW5nIGFsdGVybmF0aXZlIHBhdGNoaW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQoKVGhpcyBmaXhlcyB0aGUgY3Jhc2ggSSBzZWUgKHdpdGggImVhcmx5Y29uIGtlZXBf
Ym9vdGNvbiIpIG9uIFN0YXJMaWdodCwKYW5kIHdoaWNoIEkndmUganVzdCBiaXNlY3RlZCB0byBh
Zm9yZW1lbnRpb25lZCBjb21taXQsIHNvClRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCllvdSBtYXkgd2FudCB0byBpbmNsdWRlIChhIHBhcnQg
b2YpIHRoZSBjcmFzaCBsb2cgYmVsb3cgaW4geW91cgpwYXRjaCBkZXNjcmlwdGlvbiwgdG8gbWFr
ZSBpdCBlYXNpZXIgZm9yIGFmZmVjdGVkIHBlb3BsZSB0byBmaW5kCnRoZSBmaXguCgpVbmFibGUg
dG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRy
ZXNzCjAwMDAwMDAwMDAwMDAwMzAKT29wcyBbIzFdCk1vZHVsZXMgbGlua2VkIGluOgpDUFU6IDAg
UElEOiAwIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQKNi4yLjAtcmMxLXN0YXJsaWdodC0wMDA3
OS1nOTQ5M2U2ZjNjZTAyICMyMjkKSGFyZHdhcmUgbmFtZTogQmVhZ2xlViBTdGFybGlnaHQgQmV0
YSAoRFQpCmVwYyA6IF9fc2NoZWR1bGUrMHg0Mi8weDUwMAogcmEgOiBzY2hlZHVsZSsweDQ2LzB4
Y2UKZXBjIDogZmZmZmZmZmY4MDY1OTU3YyByYSA6IGZmZmZmZmZmODA2NTlhODAgc3AgOiBmZmZm
ZmZmZjgxMjAzYzgwCiBncCA6IGZmZmZmZmZmODEyZDUwYTAgdHAgOiBmZmZmZmZmZjgxMjBkYjQw
IHQwIDogZmZmZmZmZmY4MTIwM2Q2OAogdDEgOiAwMDAwMDAwMDAwMDAwMDAxIHQyIDogNGM0NTIw
M2E3NjYzNzM2OSBzMCA6IGZmZmZmZmZmODEyMDNjZjAKIHMxIDogZmZmZmZmZmY4MTIwZGI0MCBh
MCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOiBmZmZmZmZmZjgxMjEzOTU4CiBhMiA6IGZmZmZmZmZm
ODEyMTM5NTggYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAogYTUg
OiBmZmZmZmZmZjgwYTFiZDAwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6IDAwMDAwMDAwNTI0
NjRlNDMKIHMyIDogZmZmZmZmZmY4MTIwZGI0MSBzMyA6IGZmZmZmZmZmODBhMWFkMDAgczQgOiAw
MDAwMDAwMDAwMDAwMDAwCiBzNSA6IDAwMDAwMDAwMDAwMDAwMDIgczYgOiBmZmZmZmZmZjgxMjEz
OTM4IHM3IDogMDAwMDAwMDAwMDAwMDAwMAogczggOiAwMDAwMDAwMDAwMDAwMDAwIHM5IDogMDAw
MDAwMDAwMDAwMDAwMSBzMTA6IGZmZmZmZmZmODEyZDcyMDQKIHMxMTogZmZmZmZmZmY4MGQzYzky
MCB0MyA6IDAwMDAwMDAwMDAwMDAwMDEgdDQgOiBmZmZmZmZmZjgxMmU2ZGQ3CiB0NSA6IGZmZmZm
ZmZmODEyZTZkZDggdDYgOiBmZmZmZmZmZjgxMjAzYmI4CnN0YXR1czogMDAwMDAwMDIwMDAwMDEw
MCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDMwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCls8ZmZm
ZmZmZmY4MDY1OWE4MD5dIHNjaGVkdWxlKzB4NDYvMHhjZQpbPGZmZmZmZmZmODA2NTlkY2U+XSBz
Y2hlZHVsZV9wcmVlbXB0X2Rpc2FibGVkKzB4MTYvMHgyOApbPGZmZmZmZmZmODA2NWFlMGM+XSBf
X211dGV4X2xvY2suY29uc3Rwcm9wLjArMHgzZmUvMHg2NTIKWzxmZmZmZmZmZjgwNjViMTM4Pl0g
X19tdXRleF9sb2NrX3Nsb3dwYXRoKzB4ZS8weDE2Cls8ZmZmZmZmZmY4MDY1YjE4Mj5dIG11dGV4
X2xvY2srMHg0Mi8weDRjCls8ZmZmZmZmZmY4MDAwYWQ5ND5dIHNpZml2ZV9lcnJhdGFfcGF0Y2hf
ZnVuYysweGY2LzB4MThjCls8ZmZmZmZmZmY4MDAwMmI5Mj5dIF9hcHBseV9hbHRlcm5hdGl2ZXMr
MHg3NC8weDc2Cls8ZmZmZmZmZmY4MDgwMmVlOD5dIGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKzB4
M2MvMHhmYQpbPGZmZmZmZmZmODA4MDNjYjA+XSBzZXR1cF9hcmNoKzB4NjBjLzB4NjQwCls8ZmZm
ZmZmZmY4MDgwMDkyNj5dIHN0YXJ0X2tlcm5lbCsweDhlLzB4OTljCi0tLVsgZW5kIHRyYWNlIDAw
MDAwMDAwMDAwMDAwMDAgXS0tLQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
