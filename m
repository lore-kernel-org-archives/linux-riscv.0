Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DDAC48295
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jUM88av2dmJTNJjzW6fxV4PlJUTSG1DOH+R9JjZDco=; b=CZIqN0uwA797HQ
	oGnThuaApe6Ka2A0BUIiCDTvgmrwq78pJGbPPeTNxkUFvmG5A2NtTiQVLijy/+jzwV3Cc/i11TFBL
	3Qq+q64wN/8mhlyQHKOEJa3Rp+OB0ZamKZZzA4MJ8O9fmhtAMx8Aef5ZJmoKxMtS64G2KQOGnebLm
	OAQVoS9Vx+oWzBmaD5HZcrE3sQXYSSjA+6nyugX21Kdt38AIJ8yX3rbgh3EtSUYgfnsze7/4GQaKm
	8patgjlLatN18TJpHh4HPyIbTqwZC0E9msxCXNvJioxH5Vt1EEn8sLDwUU1oqJLnkFSyNSVs8WSCp
	iyHFOBU4yK8ZDML+aAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzxH-00000003bjK-0rl3;
	Mon, 05 Feb 2024 14:28:15 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzxE-00000003bgl-1SrO
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 14:28:14 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-363bfbc7b25so4314455ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Feb 2024 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1707143290; x=1707748090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrsdpFQjE5KyYZTxQcyIEdvD1aDhzncxsu2p+vqbv2U=;
        b=rLqBIKeU8csOrCXNCNDfieAQ/S3NfBD+EP0rtMG2Bp7P5riOZQjTJAutZQdBEEmx2O
         G3IOzFrhtY+tw2FbUrMiJfmgKBDc19gFT4uSQ1TF3MytekN55+bKDOZAN+Oogti2kKx5
         bxshWDYP8YU75ypvfrz5Q3+WZ7XyuOYmbHXGN2anv9kv5Q0xpEFaNlRXaXFIo7aasJek
         n2e8XPt1VXUVFOiR7Q1E+0bOuW4vvzypuvgh4sRa1IG0sGnv2Z9hK0o7GNSu3LiDGNsM
         E6F385ImNu4NDcdTZaC/fRf3E4bCLSHQSZqQrFK8upGWXJgK2kZ4AL+3gCX05B80rUfM
         L4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707143290; x=1707748090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrsdpFQjE5KyYZTxQcyIEdvD1aDhzncxsu2p+vqbv2U=;
        b=eBYZv95LQfZwKBMYjnj+HwFC6P7gjQF96cTWsE0ggWQiR+4eAV1Y9DtHY9P7tBnqLi
         pxBMoXWHdlH6CA29R9UTbQvVeUu7QySmbixfcjZp30AAz9TKHan7XYnpB6XAz+ZdTPU6
         2BRSSK6GVPY5xG/y2D9++ctEMVxgpA1pmirx7TLEVAnSdAXYiWlGHW9UOIMOt/sKCM/+
         ZJ3a3eCq+lGccE9jBO4QUjYfs34Fcs2HtY03H1cLiNlMLaIrfD88RHWkiXWBWihQkVYX
         ZBtBtQxl+N/+Mdoyw3RGISlrWN+6/kmmfHEKpoxXAInLPBkP6WXOZJGytv9KIE2ClVGu
         kbYg==
X-Gm-Message-State: AOJu0YwtLMZf/V38kmxV1KjTFXa4LKdic6jkKvSsYYRBKOvfMXVRdEl7
	oqk0FBvPuU+ZR3zGkZFHzvhjsvnUSUX6mlPFlZMqDAP94Z2h9L7oL/PDw02Q5Qc/ro1UHSCqjfZ
	zXMaE/972ChJZ+CoIwa5Lw/6qcRB0KHmD9dMj/g==
X-Google-Smtp-Source: AGHT+IFL70YI4Hq1H5VcaflfoZ5RmEQmBcVUWxZ9h75tftZAJkN+a6jXzQ22Ia0jXgLISdbfmPNFzwf814cS5UDzQs0=
X-Received: by 2002:a05:6e02:1288:b0:363:9d53:3cc7 with SMTP id
 y8-20020a056e02128800b003639d533cc7mr13655980ilq.30.1707143290288; Mon, 05
 Feb 2024 06:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20240205042955.833752-1-apatel@ventanamicro.com>
 <d5e21238-89f4-444e-9c35-f4a28e01052e@ghiti.fr> <CAK9=C2XEmFBDB6R5f+L9++7ojhWb8rJK-e-vgFrDmsi2=DMOBw@mail.gmail.com>
 <87y1bzch0u.fsf@all.your.base.are.belong.to.us> <a3cb563b-5b41-4189-ac82-091d5cb3223e@ghiti.fr>
In-Reply-To: <a3cb563b-5b41-4189-ac82-091d5cb3223e@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Feb 2024 19:57:58 +0530
Message-ID: <CAAhSdy08ocy2Ad96MdHdYN0fk5V0+0Kxc65m+mPQ6UnedFkckQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Don't use IPIs in flush_icache_all() when
 patching text
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_062812_645878_58398B41 
X-CRM114-Status: GOOD (  35.38  )
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

T24gTW9uLCBGZWIgNSwgMjAyNCBhdCA3OjM44oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPgo+Cj4gT24gMDUvMDIvMjAyNCAxMjowMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiA+IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cml0ZXM6Cj4g
Pgo+ID4+IE9uIE1vbiwgRmViIDUsIDIwMjQgYXQgMTE6NTLigK9BTSBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4+PiBIaSBBbnVwLAo+ID4+Pgo+ID4+PiBPbiAwNS8w
Mi8yMDI0IDA1OjI5LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4+Pj4gSWYgc29tZSBvZiB0aGUgSEFS
VHMgYXJlIHBhcmtlZCBieSBzdG9wIG1hY2hpbmUgdGhlbiBJUEktYmFzZWQKPiA+Pj4+IGZsdXNo
aW5nIGluIGZsdXNoX2ljYWNoZV9hbGwoKSB3aWxsIGhhbmcuIFRoaXMgaGFuZyBpcyBvYnNlcnZl
ZAo+ID4+Pj4gd2hlbiB0ZXh0IHBhdGNoaW5nIGlzIGludm9rZWQgYnkgdmFyaW91cyBkZWJ1ZyBh
bmQgQlBGIGZlYXR1cmVzLgo+ID4+Pj4KPiA+Pj4+IFRvIGF2b2lkIHRoaXMgaGFuZywgd2UgZm9y
Y2UgdXNlIG9mIFNCSS1iYXNlZCBpY2FjaGUgZmx1c2hpbmcKPiA+Pj4+IHdoZW4gcGF0Y2hpbmcg
dGV4dC4KPiA+Pj4+Cj4gPj4+PiBGaXhlczogNjI3OTIyODQzMjM1ICgiUklTQy1WOiBVc2UgSVBJ
cyBmb3IgcmVtb3RlIGljYWNoZSBmbHVzaCB3aGVuIHBvc3NpYmxlIikKPiA+Pj4+IFJlcG9ydGVk
LWJ5OiBCam9ybiBUb3BlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiA+Pj4+IENsb3NlczogaHR0cHM6
Ly9naXN0LmdpdGh1Yi5jb20vYmpvdG8vMDRhNTgwNTY4Mzc4ZjNiNTQ4M2FmMDdjZDlkMjI1MDEK
PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29t
Pgo+ID4+Pj4gLS0tCj4gPj4+PiAgICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2gu
aCB8IDcgKysrKy0tLQo+ID4+Pj4gICAgYXJjaC9yaXNjdi9rZXJuZWwvaGliZXJuYXRlLmMgICAg
ICAgfCAyICstCj4gPj4+PiAgICBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jICAgICAgICAgICB8
IDQgKystLQo+ID4+Pj4gICAgYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgICAgICAgICAgfCA3
ICsrKystLS0KPiA+Pj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+
ID4+Pj4gaW5kZXggYTEyOWRhYzQ1MjFkLi41NjFlMDc5ZjM0YWYgMTAwNjQ0Cj4gPj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+ID4+Pj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiA+Pj4+IEBAIC0zMiw3ICszMiw4IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiA+
Pj4+ICAgICAqIFJJU0MtViBkb2Vzbid0IGhhdmUgYW4gaW5zdHJ1Y3Rpb24gdG8gZmx1c2ggcGFy
dHMgb2YgdGhlIGluc3RydWN0aW9uIGNhY2hlLAo+ID4+Pj4gICAgICogc28gaW5zdGVhZCB3ZSBq
dXN0IGZsdXNoIHRoZSB3aG9sZSB0aGluZy4KPiA+Pj4+ICAgICAqLwo+ID4+Pj4gLSNkZWZpbmUg
Zmx1c2hfaWNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpIGZsdXNoX2ljYWNoZV9hbGwoKQo+ID4+Pj4g
KyNkZWZpbmUgZmx1c2hfaWNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpIGZsdXNoX2ljYWNoZV9hbGwo
dHJ1ZSkKPiA+Pj4+ICsjZGVmaW5lIGZsdXNoX2ljYWNoZV9wYXRjaF9yYW5nZShzdGFydCwgZW5k
KSBmbHVzaF9pY2FjaGVfYWxsKGZhbHNlKQo+ID4+Pj4gICAgI2RlZmluZSBmbHVzaF9pY2FjaGVf
dXNlcl9wYWdlKHZtYSwgcGcsIGFkZHIsIGxlbikgXAo+ID4+Pj4gICAgICAgIGZsdXNoX2ljYWNo
ZV9tbSh2bWEtPnZtX21tLCAwKQo+ID4+Pj4KPiA+Pj4+IEBAIC00MywxMiArNDQsMTIgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGZsdXNoX2RjYWNoZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ID4+
Pj4KPiA+Pj4+ICAgICNpZm5kZWYgQ09ORklHX1NNUAo+ID4+Pj4KPiA+Pj4+IC0jZGVmaW5lIGZs
dXNoX2ljYWNoZV9hbGwoKSBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCkKPiA+Pj4+ICsjZGVmaW5l
IGZsdXNoX2ljYWNoZV9hbGwod2FudF9pcGkpIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKQo+ID4+
Pj4gICAgI2RlZmluZSBmbHVzaF9pY2FjaGVfbW0obW0sIGxvY2FsKSBmbHVzaF9pY2FjaGVfYWxs
KCkKPiA+Pj4+Cj4gPj4+PiAgICAjZWxzZSAvKiBDT05GSUdfU01QICovCj4gPj4+Pgo+ID4+Pj4g
LXZvaWQgZmx1c2hfaWNhY2hlX2FsbCh2b2lkKTsKPiA+Pj4+ICt2b2lkIGZsdXNoX2ljYWNoZV9h
bGwoYm9vbCB3YW50X2lwaSk7Cj4gPj4+PiAgICB2b2lkIGZsdXNoX2ljYWNoZV9tbShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgYm9vbCBsb2NhbCk7Cj4gPj4+Pgo+ID4+Pj4gICAgI2VuZGlmIC8qIENP
TkZJR19TTVAgKi8KPiA+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oaWJlcm5h
dGUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2hpYmVybmF0ZS5jCj4gPj4+PiBpbmRleCA2NzFiNjg2
YzAxNTguLjM4OGYxMGUxODdiYSAxMDA2NDQKPiA+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L2hpYmVybmF0ZS5jCj4gPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oaWJlcm5hdGUuYwo+
ID4+Pj4gQEAgLTE1Myw3ICsxNTMsNyBAQCBpbnQgc3dzdXNwX2FyY2hfc3VzcGVuZCh2b2lkKQo+
ID4+Pj4gICAgICAgIH0gZWxzZSB7Cj4gPj4+PiAgICAgICAgICAgICAgICBzdXNwZW5kX3Jlc3Rv
cmVfY3NycyhoaWJlcm5hdGVfY3B1X2NvbnRleHQpOwo+ID4+Pj4gICAgICAgICAgICAgICAgZmx1
c2hfdGxiX2FsbCgpOwo+ID4+Pj4gLSAgICAgICAgICAgICBmbHVzaF9pY2FjaGVfYWxsKCk7Cj4g
Pj4+PiArICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9hbGwodHJ1ZSk7Cj4gPj4+Pgo+ID4+Pj4g
ICAgICAgICAgICAgICAgLyoKPiA+Pj4+ICAgICAgICAgICAgICAgICAqIFRlbGwgdGhlIGhpYmVy
bmF0aW9uIGNvcmUgdGhhdCB3ZSd2ZSBqdXN0IHJlc3RvcmVkIHRoZSBtZW1vcnkuCj4gPj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3BhdGNoLmMKPiA+Pj4+IGluZGV4IDM3ZTg3ZmRjZjZhMC4uNzIxZTE0NGE3ODQ3IDEwMDY0NAo+
ID4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ID4+Pj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcGF0Y2guYwo+ID4+Pj4gQEAgLTE4Miw3ICsxODIsNyBAQCBpbnQgcGF0Y2hf
dGV4dF9zZXRfbm9zeW5jKHZvaWQgKmFkZHIsIHU4IGMsIHNpemVfdCBsZW4pCj4gPj4+PiAgICAg
ICAgcmV0ID0gcGF0Y2hfaW5zbl9zZXQodHAsIGMsIGxlbik7Cj4gPj4+Pgo+ID4+Pj4gICAgICAg
IGlmICghcmV0KQo+ID4+Pj4gLSAgICAgICAgICAgICBmbHVzaF9pY2FjaGVfcmFuZ2UoKHVpbnRw
dHJfdCl0cCwgKHVpbnRwdHJfdCl0cCArIGxlbik7Cj4gPj4+PiArICAgICAgICAgICAgIGZsdXNo
X2ljYWNoZV9wYXRjaF9yYW5nZSgodWludHB0cl90KXRwLCAodWludHB0cl90KXRwICsgbGVuKTsK
PiA+Pj4+Cj4gPj4+PiAgICAgICAgcmV0dXJuIHJldDsKPiA+Pj4+ICAgIH0KPiA+Pj4+IEBAIC0y
MTcsNyArMjE3LDcgQEAgaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZv
aWQgKmluc25zLCBzaXplX3QgbGVuKQo+ID4+Pj4gICAgICAgIHJldCA9IHBhdGNoX2luc25fd3Jp
dGUodHAsIGluc25zLCBsZW4pOwo+ID4+Pj4KPiA+Pj4+ICAgICAgICBpZiAoIXJldCkKPiA+Pj4+
IC0gICAgICAgICAgICAgZmx1c2hfaWNhY2hlX3JhbmdlKCh1aW50cHRyX3QpIHRwLCAodWludHB0
cl90KSB0cCArIGxlbik7Cj4gPj4+PiArICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9wYXRjaF9y
YW5nZSgodWludHB0cl90KSB0cCwgKHVpbnRwdHJfdCkgdHAgKyBsZW4pOwo+ID4+Pj4KPiA+Pj4+
ICAgICAgICByZXR1cm4gcmV0Owo+ID4+Pj4gICAgfQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vY2FjaGVmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPiA+Pj4+
IGluZGV4IDU1YTM0ZjIwMjBhOC4uMDNjZDNkNDgzMWVmIDEwMDY0NAo+ID4+Pj4gLS0tIGEvYXJj
aC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPiA+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVm
bHVzaC5jCj4gPj4+PiBAQCAtMTcsMTEgKzE3LDEyIEBAIHN0YXRpYyB2b2lkIGlwaV9yZW1vdGVf
ZmVuY2VfaSh2b2lkICppbmZvKQo+ID4+Pj4gICAgICAgIHJldHVybiBsb2NhbF9mbHVzaF9pY2Fj
aGVfYWxsKCk7Cj4gPj4+PiAgICB9Cj4gPj4+Pgo+ID4+Pj4gLXZvaWQgZmx1c2hfaWNhY2hlX2Fs
bCh2b2lkKQo+ID4+Pj4gK3ZvaWQgZmx1c2hfaWNhY2hlX2FsbChib29sIHdhbnRfaXBpKQo+ID4+
Pj4gICAgewo+ID4+Pj4gICAgICAgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKPiA+Pj4+Cj4g
Pj4+PiAtICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfU0JJKSAmJiAhcmlzY3ZfdXNl
X2lwaV9mb3JfcmZlbmNlKCkpCj4gPj4+PiArICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklT
Q1ZfU0JJKSAmJgo+ID4+Pj4gKyAgICAgICAgICghd2FudF9pcGkgfHwgIXJpc2N2X3VzZV9pcGlf
Zm9yX3JmZW5jZSgpKSkKPiA+Pj4+ICAgICAgICAgICAgICAgIHNiaV9yZW1vdGVfZmVuY2VfaShO
VUxMKTsKPiA+Pj4+ICAgICAgICBlbHNlCj4gPj4+PiAgICAgICAgICAgICAgICBvbl9lYWNoX2Nw
dShpcGlfcmVtb3RlX2ZlbmNlX2ksIE5VTEwsIDEpOwo+ID4+Pj4gQEAgLTg3LDcgKzg4LDcgQEAg
dm9pZCBmbHVzaF9pY2FjaGVfcHRlKHB0ZV90IHB0ZSkKPiA+Pj4+ICAgICAgICBzdHJ1Y3QgZm9s
aW8gKmZvbGlvID0gcGFnZV9mb2xpbyhwdGVfcGFnZShwdGUpKTsKPiA+Pj4+Cj4gPj4+PiAgICAg
ICAgaWYgKCF0ZXN0X2JpdChQR19kY2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpKSB7Cj4gPj4+
PiAtICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9hbGwoKTsKPiA+Pj4+ICsgICAgICAgICAgICAg
Zmx1c2hfaWNhY2hlX2FsbCh0cnVlKTsKPiA+Pj4+ICAgICAgICAgICAgICAgIHNldF9iaXQoUEdf
ZGNhY2hlX2NsZWFuLCAmZm9saW8tPmZsYWdzKTsKPiA+Pj4+ICAgICAgICB9Cj4gPj4+PiAgICB9
Cj4gPj4+Cj4gPj4+IFNpbmNlIHBhdGNoX3RleHRfY2IoKSBpcyBydW4gb24gYWxsIGNwdXMsIGNv
dWxkbid0IHdlIGNvbXBsZXRlbHkgYXZvaWQKPiA+Pj4gYW55IHJlbW90ZSBpY2FjaGUgZmx1c2gg
Ynkgc2xpZ2h0bHkgY2hhbmdpbmcgcGF0Y2hfdGV4dF9jYigpIGluc3RlYWQgYXMKPiA+Pj4gZm9s
bG93cz8KPiA+PiBVbmZvcnR1bmF0ZWx5IHBhdGNoX3RleHRfY2IoKSBpcyBub3QgdGhlIG9ubHkg
dXNlciBvZiBwYXRjaF90ZXh0X25vc3luYwo+ID4+IHNpbmNlIHBhdGNoX3RleHRfbm9zeW5jKCkg
YW5kIHBhdGNoX3RleHRfc2V0X25vc3luYygpIGFyZSBjYWxsZWQgZGlyZWN0bHkKPiA+PiBmcm9t
IG90aGVyIHBsYWNlcyBhcyB3ZWxsLgo+ID4gWWVhaC4gVGhlcmUgaXMgb25lIG1vcmUgc3RvcF9t
YWNoaW5lKCkgdGV4dCBwYXRjaGluZyB1c2VyLCBhbmQgdGhhdCdzCj4gPiBmdHJhY2UuIGZ0cmFj
ZSBpcyB1c2luZyBzdG9wX21hY2hpbmUoKSB3aXRoIHRoZSBsYXN0IGFyZ3VtZW50IHNldCB0bwo+
ID4gTlVMTCwgc28gb25seSBwYXRjaGluZyBvbiAqYW55KiBoYXJ0LiBDb250aW51aW5nIG9uIEFs
ZXgnIGlkZWEgd291bGQgYmUKPiA+IHRvIHBsYWNlIGFuIElQSSBmbHVzaCBpbiBmdHJhY2VfYXJj
aF9jb2RlX21vZGlmeV9wb3N0X3Byb2Nlc3MoKSwKPiA+IHVuZm9ydGF0ZWx5IHRoYXQncyB0b28g
bGF0ZSBzaW5jZSB3ZSdyZSBhbHJlYWR5IG1vdmVkIG9uIGZyb20KPiA+IHN0b3BfbWFjaGluZSgp
Lgo+Cj4KPiBBZnRlciBkaXNjdXNzaW9uIHdpdGggQmpvcm4sIHdlIHRoaW5rIHRoZSBzb2x1dGlv
biB3b3VsZCBiZSB0bwo+IHJlaW1wbGVtZW50IGFyY2hfZnRyYWNlX3VwZGF0ZV9jb2RlKCkgd2l0
aCBzdG9wX21hY2hpbmUoLi4uLAo+IGNwdV9vbmxpbmVfbWFzaykgYW5kIHVzZSB0aGUgc2FtZSBi
YXJyaWVyIGFzIHRoZSBvbmUgaW4gcGF0Y2hfdGV4dF9jYigpCj4gKGNza3kgZG9lcyBqdXN0IHRo
YXQKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gv
Y3NreS9rZXJuZWwvZnRyYWNlLmMjTDIyNCkuCj4gQW5kIHRoZW4gd2UgY2FuIGFwcGx5IHRoZSBz
YW1lIHNvbHV0aW9uIGFzIEkgZmlyc3QgcHJvcG9zZWQ6IG5vIG1vcmUKPiByZW1vdGUgaWNhY2hl
IGZsdXNoZXMsIG9ubHkgbG9jYWwgb25lcy4KPgo+IFdoYXQgZG8geW91IHRoaW5rIEFudXA/IEkg
Y2FuIGNvbWUgdXAgd2l0aCB0aGlzIHBhdGNoIGlmIHlvdSB3YW50LgoKU291bmRzIGdvb2QgdG8g
bWUuIFlvdSB3aWxsIG5lZWQgYSBzcGVjaWFsIC5jb25maWcgZnJvbSBCam9ybiB0byB0ZXN0Cnlv
dXIgcGF0Y2guCgo+Cj4KPiA+Cj4gPj4gV2UgaGF2ZSB0byB1cGRhdGUgYWxsIHVzZXJzIG9mIHBh
dGNoX3RleHRfbm9zeW5jKCkgYW5kCj4gPj4gcGF0Y2hfdGV4dF9zZXRfbm9zeW5jKCkgdG8gbW92
ZSB0byBsb2NhbCBpY2FjaGUgZmx1c2hlcyB3aGljaAo+ID4+IGlzIGEgbXVjaCBiaWdnZXIgY2hh
bmdlLgo+ID4gT25seSB0aGUgZnRyYWNlIHN0b3BfbWFjaGluZSgpIHVzZXIsIHJpZ2h0PyBBbGV4
IHNvbHV0aW9uIGlzIHN1ZmZpY2llbnQKPiA+IGZvciBwYXRjaF90ZXh0KCkuIEknbSBub3QgYSBz
dXBlciBmYW4gb2YgY29uZGl0aW9uYWxseSBjYWxsaW5nIGludG8gU0JJCj4gPiBhbmQgcGFzc2lu
ZyBhcm91bmQgYm9vbGVhbiBjb250ZXh0IGZsYWdzIGFzIGEgd29ya2Fyb3VuZC4uLiA6LSggQW55
Cj4gPiBvdGhlciBhbHRlcm5hdGl2ZXM/Cj4gPgo+ID4gVGhlIG9idmlvdXMgZml4aW5nIHRleHQg
cGF0Y2hpbmcgbm90IHRvIGJlIGNvbXBsZXRseSB1c2VsZXNzIG9uIFJJU0MtViwKPiA+IGJ1dCB0
aGF0J3MgYW4gZXZlbiBiaWdnZXIgcGF0Y2guLi4KPiA+Cj4gPgo+ID4gQmrDtnJuCj4gPgo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
