Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E17C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 19:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQ/z3mrV9wd9QsWDuhCsp+8wLXLQYeeapF07AxatrM8=; b=Wd1YkvbcCNqKdX
	mN7IuY+XErhyEMTv51LRqVGUoLgSyQ/HqGwjt02fRmLRDppCYt6HNlV+fkVHsKejYudNWUX6VwDjU
	UHjPoTyvi1V9Y2A2N3yEeGQ+trzshMsS79W8EyyJNomZSmJVRAqmQUcOVDQUpdwWQnINo9aFGsnNN
	k6Pg+4QV3HpLcbQan6N7DU/UwhHaT6LCf40eqlkECnDkWglqPcOZgzgFNrkKeqj/45UMgzbkErZR1
	vYtmKO5e7oPu52lfDJ8T5J4WAL2ymgiNn3P7cQlIzK0DTYxuTgxor2RKpdabCZibRXtTs9En9L2tg
	XlINvEqWENOMRq+UvOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06Jr-00B5kx-ON; Tue, 29 Nov 2022 19:31:03 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06HZ-00B4nN-Kr
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 19:28:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id fy37so36204295ejc.11
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 11:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvqYE5R5HeLMtZ7fk1xXT4J51FyYRYkpq9XDrr3X4TU=;
        b=AGv/5+IbhOn4jVZuS4HQNzi4os1HUroaclHtFmaijuCz4jR4l6x+4WcokGi2B+lF21
         yiOMuKj1oPld6ujtD84K6eceLKq0yi7568HMDq6CTfYwYOMz+qFvdAewihbp9lOjXYIj
         tN2aolffRjaWnCzqsqSWF90/c7DnJHutwvtFh2XrBafswxqhBeNUnPS4Av3ZhGfMzPh4
         5FB8daGCe6Px07XNG/QVvXvmrs2bQ1NLC3DSv1wyVapWqug8I3W27hIMrS9GYL4h+OFX
         snkflq1n2J/Hr6tkPoZjvnSQJHQkCFty4PjndHmSuBcAFH4pNuH9Z0Re9veUPVeibUvr
         75/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvqYE5R5HeLMtZ7fk1xXT4J51FyYRYkpq9XDrr3X4TU=;
        b=hPL6jiMtkIm/N5yp0KERR4Z+1ZLaw2fgcBgXWWmFSIspxTr7dp4nyy4MUUVZkk6x9Q
         qRt+uy36fFB1DATtoSKah38g9BeJZFikmkTXuBxEv7sp3xbjlt9yyjjYWvOVKww/xfLZ
         r6rOjxzAG47mt282RbDhWaqEa43gXd0IQbigUM4vO0Po2fu67Uk6kYW/eTUfT1CN2AGS
         FLLAaSqjcJuUxn1mzFBvgrmW1EdkWfr6W+6e9Iw+g2rjv4dWYAKO5B8sIza3C9T3fY6n
         XWEQzDno4+9FtbqWzMrQCZ+h/qHLhlkUg4vTPlKiK0OHOgiEDReXV9b0N3oW0qA/g9Rs
         uhew==
X-Gm-Message-State: ANoB5pmqAmTNBvnXKQ65jJg96JwNP779wpA+J0h9QWIZeNOrB4tOMsyx
	DEZPBIBkyyP+EYuFXQ+KAHaFcE49rTEgJm7eX4I=
X-Google-Smtp-Source: AA0mqf5MyTqnfFoFchlvzF5Cc5GXE2Kb3Wo8NAetXQeMR1N+ON2ai6Bmx56VApUXHIuacURwG1WLMalUeGh0nwxSB+o=
X-Received: by 2002:a17:907:9895:b0:7c0:7db3:82e3 with SMTP id
 ja21-20020a170907989500b007c07db382e3mr7394653ejc.480.1669750117663; Tue, 29
 Nov 2022 11:28:37 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8uTdiWJSCdbukA1sndHxDXE_VV0Qzara_AQw2s2n6s6Lg@mail.gmail.com>
 <mhng-c2b3d5ca-288f-45b3-97f5-7c532db2e59f@palmer-ri-x1c9a>
In-Reply-To: <mhng-c2b3d5ca-288f-45b3-97f5-7c532db2e59f@palmer-ri-x1c9a>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 29 Nov 2022 19:28:11 +0000
Message-ID: <CA+V-a8vT3AjnU1-s0k7ff0Y7WLofpHYnJPF+mKVnUspsrPvQtw@mail.gmail.com>
Subject: Re: [QUERY]: Adding support for a platform
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: binutils@sourceware.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_112841_719499_D3502C36 
X-CRM114-Status: GOOD (  23.68  )
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

SGkgUGFsbWVyLAoKT29wcyBJIHNob3VsZCBoYXZlIGluY2x1ZGVkIGxpbnV4LXJpc2N2IHRvIHRo
ZSBDQyBsaXN0IGhlcmUgKGRvaW5nIGl0IG5vdykKCk9uIFR1ZSwgTm92IDI5LCAyMDIyIGF0IDc6
MjAgUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBU
dWUsIDI5IE5vdiAyMDIyIDExOjE2OjI5IFBTVCAoLTA4MDApLCBiaW51dGlsc0Bzb3VyY2V3YXJl
Lm9yZyB3cm90ZToKPiA+IEhpIEFsbCwKPiA+Cj4gPiBJZiB0aGlzIGlzIG5vdCB0aGUgcmlnaHQg
cGxhY2UgdG8gYXNrIHRoaXMgcXVlc3Rpb24gcGxlYXNlIGxldCBtZSBrbm93Lgo+ID4KPiA+IFNv
IHdlIGhhdmUgYSBSSVNDViBwbGF0Zm9ybSAoUmVuZXNhcyBSWi9GaXZlKSBmb3Igd2hpY2ggd2Ug
bmVlZCB0bwo+ID4gYWRqdXN0IHRoZSBURVhUX1NUQVJUX0FERFIuIFNvIGJlbG93IGFyZSBteSBx
dWVyaWVzOgo+ID4gKiBXaGF0IGlzIHRoZSBwcm9jZWR1cmUgZm9yIHVwc3RyZWFtaW5nPwo+ID4g
KiBBcmUgcGF0Y2hlcyBhY2NlcHRlZCBmb3IgaW5kaXZpZHVhbCBwbGF0Zm9ybXMgKGZvciBhZGp1
c3RpbmcgVEVYVF9TVEFSVF9BRERSKT8KPgo+IElzIHRoaXMgc3RpbGwgcmVsYXRlZCB0byB0aGF0
IGJ1ZyB3aXRoIHRoZSBzdGF0aWMgYmluYXJpZXMgeW91J2QKPiBtZW50aW9uZWQgYmVmb3JlPyAg
SSB0aGluayB3ZSdkIHJlYWxseSBuZWVkIHRvIGZpZ3VyZSBvdXQgdGhlIHJvb3QgY2F1c2UKPiBi
ZWZvcmUgd2UgY2FuIG1ha2UgYSByZWFzb25lZCBkZWNpc2lvbiBoZXJlLCBteSBndWVzcyB3b3Vs
ZCBiZSB0aGF0Cj4gY2hhbmdpbmcgVEVYVF9TVEFSVF9BRERSIGp1c3Qgd29ya3MgYXJvdW5kIHRo
ZSByZWFsIGJ1Zy4KPgpCZWxvdyBpcyB0aGUgcm9vdCBjYXVzZSBhbmQgdGhlIHNvbHV0aW9uOgoK
VEVYVF9TVEFSVF9BRERSIGlzIHRoZSBzdGFydCBvZiB0aGUgdGV4dCBzZWdtZW50IG9mIGFuIGFw
cGxpY2F0aW9uLgpUaGlzIGlzIGJlaW5nIHNldCB0byAweDEwMDAwIGZvciBSSVNDViBwbGF0Zm9y
bXMuCgpTbyB3aGVuIGFuIGFwcGxpY2F0aW9uIGlzIGNvbXBpbGVkIHdpdGggdGhlIHN0YXRpYyBm
bGFnIHRoZSBsb2FkIHdvdWxkCnN0YXJ0IGZyb20gMHgxMDAwMCAtIHh5eiAoZGVwZW5kaW5nIG9u
IHNpemUgb2YgdGhlIGFwcGxpY2F0aW9uKQoKRW50cnkgcG9pbnQgMHgxMDFjMApUaGVyZSBhcmUg
NSBwcm9ncmFtIGhlYWRlcnMsIHN0YXJ0aW5nIGF0IG9mZnNldCA2NFByb2dyYW0gSGVhZGVyczoK
ICBUeXBlICAgICAgICAgICBPZmZzZXQgICAgICAgICAgICAgVmlydEFkZHIgICAgICAgICAgIFBo
eXNBZGRyCiAgICAgICAgICAgICAgICAgRmlsZVNpeiAgICAgICAgICAgIE1lbVNpeiAgICAgICAg
ICAgICAgRmxhZ3MgIEFsaWduCiAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4
MDAwMDAwMDAwMDAxMDAwMCAweDAwMDAwMDAwMDAwMTAwMDAKICAgICAgICAgICAgICAgICAweDAw
MDAwMDAwMDAwNTliNDggMHgwMDAwMDAwMDAwMDU5YjQ4ICBSIEUgICAgMHgxMDAwCiAgTE9BRCAg
ICAgICAgICAgMHgwMDAwMDAwMDAwMDU5YjYwIDB4MDAwMDAwMDAwMDA2YWI2MCAweDAwMDAwMDAw
MDAwNmFiNjAKICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDFmNjggMHgwMDAwMDAwMDAw
MDAzNTI4ICBSVyAgICAgMHgxMDAwCgpTbyBmb3IgdGhlIGFib3ZlIGFwcGxpY2F0aW9uIHdoaWNo
IGlzIGNvbXBpbGVkIHN0YXRpY2FsbHkgd2UgY2FuIHNlZQp0aGUgZW50cnkgcG9pbnQgaXMgMHgx
MDFjMCBhbmQgbG9hZCAweDAwMDAwMDAwMDAwMTAwMDAuCgpBbmRlcyBBWDQ1TVAgY29yZXMgaGF2
ZSBsb2NhbCBtZW1vcnkgSUxNIGFuZCBETE0gdGhhdCBhcmUgbWFwcGVkIGluCnRoZSByZWdpb24g
SOKAmTBfMDAwM18wMDAwIC0gSOKAmTBfMDAwNF9GRkZGIG9uIHRoZSBSWi9GaXZlIFNvQy4gV2hl
biB0aGUKdmlydHVhbCBhZGRyZXNzIGZhbGxzIGluIHRoaXMgcmFuZ2UgdGhlIE1NVSBkb2Vzbid0
IHRyaWdnZXIgYSBwYWdlCmZhdWx0IGFuZCBhc3N1bWVzIHRoZSB2aXJ0dWFsIGFkZHJlc3MgYXMg
cGh5c2ljYWwgYWRkcmVzcyBhbmQgaGVuY2UKdGhlIGFwcGxpY2F0aW9uIGZhaWxzIHRvIHJ1biAo
cGFuaWNzIHNvbWV3aGVyZSkuCgpTbyB0byBhdm9pZCB0aGlzIGlzc3VlIHdlIHNldCB0aGUgVEVY
VF9TVEFSVF9BRERSIHRvIDB4NTAwMDAgc28gdGhhdAp0aGUgdmlydHVhbCBhZGRyZXNzIG9mIGFu
eSBzdGF0aWNhbGx5IGNvbXBpbGVkIGFwcGxpY2F0aW9uIGRvZXMgbm90CmZhbGwgaW4gdGhlIHJh
bmdlIG9mIEjigJkwXzAwMDNfMDAwMCAtIEjigJkwXzAwMDRfRkZGRi4KCkVsZiBmaWxlIHR5cGUg
aXMgRVhFQyAoRXhlY3V0YWJsZSBmaWxlKQpFbnRyeSBwb2ludCAweDUwNGU0ClRoZXJlIGFyZSA1
IHByb2dyYW0gaGVhZGVycywgc3RhcnRpbmcgYXQgb2Zmc2V0IDY0CgpQcm9ncmFtIEhlYWRlcnM6
CiAgVHlwZSAgICAgICAgICAgT2Zmc2V0ICAgICAgICAgICAgIFZpcnRBZGRyICAgICAgICAgICBQ
aHlzQWRkcgogICAgICAgICAgICAgICAgIEZpbGVTaXogICAgICAgICAgICBNZW1TaXogICAgICAg
ICAgICAgIEZsYWdzICBBbGlnbgogIExPQUQgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDAwMCAw
eDAwMDAwMDAwMDAwNTAwMDAgMHgwMDAwMDAwMDAwMDUwMDAwCiAgICAgICAgICAgICAgICAgMHgw
MDAwMDAwMDAwMDU3ZGM4IDB4MDAwMDAwMDAwMDA1N2RjOCAgUiBFICAgIDB4MTAwMAogIExPQUQg
ICAgICAgICAgIDB4MDAwMDAwMDAwMDA1ODViOCAweDAwMDAwMDAwMDAwYTk1YjggMHgwMDAwMDAw
MDAwMGE5NWI4CiAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAwMDA0ZWUwIDB4MDAwMDAwMDAw
MDAwNjRiMCAgUlcgICAgIDB4MTAwMAogIE5PVEUgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDE1
OCAweDAwMDAwMDAwMDAwNTAxNTggMHgwMDAwMDAwMDAwMDUwMTU4CiAgICAgICAgICAgICAgICAg
MHgwMDAwMDAwMDAwMDAwMDQ0IDB4MDAwMDAwMDAwMDAwMDA0NCAgUiAgICAgIDB4NAoKU28gbm93
IHdpdGggdGhlIGZpeCBmb3Igc3RhdGljYWxseSBjb21waWxlZCBhcHBsaWNhdGlvbnMgd2UgY2Fu
IHNlZQppdHMgb2Zmc2V0dGVkIGFuZCBlbnRyeSBwb2ludCBpcyAweDUwNGU0IGFuZCBsb2FkIGlz
IGF0CjB4MDAwMDAwMDAwMDA1MDAwMC4gU28gd2l0aCB0aGlzIHdlIGFyZSBmb3Igc3VyZSB0aGUg
TU1VIHdpbGwgYWx3YXlzCnRyaWdnZXIgYSBwYWdlIGZhdWx0LgoKQ2hlZXJzLApQcmFiaGFrYXIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
