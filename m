Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB8AC54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYQ4bwl5MznqkKpDjWizC1xWrQpw7jvj84b5BZgbapU=; b=GQqyHefNMcU2Pe
	Ml1qzWL88hpZcaBrj87mXku8/INkRSbGpX7KOh/EqPO4bm2K9Q83E4tSm1mgdPAEQuYdItqVA4vAN
	5/HP4xh7AaGOC95af2lTWz+c9ULIk2Aeu2+MALeaJudiDZaILQfvzK2bl07Xvv4KmVg+9gCyh4id1
	XVwFyqNB/3ijuNUDGhhXeV+gsPZi8494MaMaEGVi2pIlChoG8eB5GFAyfvF+9Mk7ML8wzYsEamJjZ
	Q9nGPnoKSjfECY4rDr1WVzbbiX36ZpEcQSP1yOvwsxU8dU/WZD3dUQt+SfPNH/qnmMy/ps+yAMQvr
	OD5H1zDGdhtt6V3T61Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPyu-00000003dkW-3LAc;
	Fri, 23 May 2025 10:50:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPyt-00000003dkM-1fc5
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 812ED629F6
	for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 10:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383ECC4AF09
	for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747997426;
	bh=ItwvRkhTT2c2vOcsnAS+TQJbapv+gHHQ9cnv1sPZbsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FLHW9TqFjJVITGyGJaV2Fl04y5ckg+KCuKKkQpFLZSZT4FVBOP4Y0b6EPZSB1105M
	 9BRZ8fXqdHFxBsDn6eAaoF/vAGyUMosQjffWqmRp+qOoZjpgw/Wzb9clskNU7fF35q
	 6C590MkglnURG+bgUtx/9pmPR7iRtqVbZ05em/xtVlqOglkhLARsz3eUEF0bCtbOi2
	 1HNl+D5u1h8atcgyO7gXOVlShHIZI/Ix0dARFKP7eQfnZPQN2W+kn5luW2sZ7uJwAj
	 R0nztJU1Ax0j1drIQPWKPcYQlQXPJ5hdZ3zN4De7rsCFG6ZrtpRjkUddI28qgFNov6
	 xeXoWV7OrDUmw==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6060a70ba80so4788713eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWl6+ARy5iH7jy3T5415QGmREAeIEdfO4uYGXGCWzZFwN4mOxsEQxrpS2u5DyUn+rXmU6kv6c5ASj6m1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBR/3MIepVjh+FDVXFT1kv9gF062JTkjp0BHI/L9GDm2r8z0Q+
	WfY2WQs1oGRv6xcDA25NfIP/dcMCAsWHKLOVWGulUW2S0m0gA3Xu4JMr0oJ3Kxpyl506HxuMvAv
	u/fTrfcHvIZh/nX9FMIu7obgYYdVxFGs=
X-Google-Smtp-Source: AGHT+IGRYoi8FvCDeVJW5bpz6ccEXrPNWeRojPzXCCPt1ZQOkm62FHpUPClgAcFymrz8Ta6H/88yteDUITwuy21OwY8=
X-Received: by 2002:a4a:ec44:0:b0:608:3f1d:bbdb with SMTP id
 006d021491bc7-60b95417fafmr1181273eaf.8.1747997425506; Fri, 23 May 2025
 03:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
 <91458376-dfc7-46fc-8523-aa176907d703@gmx.de> <83e02a52-86ad-45e5-ba87-6c17dc6f59b5@ghiti.fr>
In-Reply-To: <83e02a52-86ad-45e5-ba87-6c17dc6f59b5@ghiti.fr>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 May 2025 12:50:13 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iPVx0KXB5qQ46iQ7CKG6KJC1CnXogQ=e8or24vZuytrw@mail.gmail.com>
X-Gm-Features: AX0GCFs9rXtmQ9GPe95j5ovoZSpmZkfTNbNUc6PIZtkLQ9LMDWe_nnToU3ojthc
Message-ID: <CAJZ5v0iPVx0KXB5qQ46iQ7CKG6KJC1CnXogQ=e8or24vZuytrw@mail.gmail.com>
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi platforms
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Armin Wolf <W_Armin@gmx.de>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Arnd Bergmann <arnd@arndb.de>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MTHigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+Cj4gT24gNS8yMi8yNSAyMjowNCwgQXJtaW4gV29sZiB3cm90ZToK
PiA+IEFtIDIyLjA1LjI1IHVtIDE2OjEzIHNjaHJpZWIgQWxleGFuZHJlIEdoaXRpOgo+ID4KPiA+
PiBUaGUgcGxhdGZvcm0gcHJvZmlsZSBkcml2ZXIgaXMgbG9hZGVkIGV2ZW4gb24gcGxhdGZvcm1z
IHRoYXQgZG8gbm90IGhhdmUKPiA+PiBhY3BpIGVuYWJsZWQuIFRoZSBpbml0aWFsaXphdGlvbiBv
ZiB0aGUgc3lzZnMgZW50cmllcyB3YXMgcmVjZW50bHkgbW92ZWQKPiA+PiBmcm9tIHBsYXRmb3Jt
X3Byb2ZpbGVfcmVnaXN0ZXIoKSB0byB0aGUgbW9kdWxlIGluaXQgY2FsbCwgYW5kIHRob3NlCj4g
Pj4gZW50cmllcyBuZWVkIGFjcGlfa29iaiB0byBiZSBpbml0aWFsaXplZCB3aGljaCBpcyBub3Qg
dGhlIGNhc2Ugd2hlbiBhY3BpCj4gPj4gaXMgZGlzYWJsZWQuCj4gPj4KPiA+PiBUaGlzIHJlc3Vs
dHMgaW4gdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+ID4+Cj4gPj4gICBXQVJOSU5HOiBDUFU6IDUg
UElEOiAxIGF0IGZzL3N5c2ZzL2dyb3VwLmM6MTMxCj4gPj4gaW50ZXJuYWxfY3JlYXRlX2dyb3Vw
KzB4YTIyLzB4ZGQ4Cj4gPj4gICBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+PiAgIENQVTogNSBVSUQ6
IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBUYWludGVkOiBHIFcKPiA+PiA2LjE1LjAtcmM3LWRp
cnR5ICM2IFBSRUVNUFQKPiA+PiAgIFRhaW50ZWQ6IFtXXT1XQVJOCj4gPj4gICBIYXJkd2FyZSBu
YW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4gPj4gICBlcGMgOiBpbnRlcm5hbF9jcmVhdGVf
Z3JvdXArMHhhMjIvMHhkZDgKPiA+PiAgICByYSA6IGludGVybmFsX2NyZWF0ZV9ncm91cCsweGEy
Mi8weGRkOAo+ID4+Cj4gPj4gICBDYWxsIFRyYWNlOgo+ID4+Cj4gPj4gICBpbnRlcm5hbF9jcmVh
dGVfZ3JvdXArMHhhMjIvMHhkZDgKPiA+PiAgIHN5c2ZzX2NyZWF0ZV9ncm91cCsweDIyLzB4MmUK
PiA+PiAgIHBsYXRmb3JtX3Byb2ZpbGVfaW5pdCsweDc0LzB4YjIKPiA+PiAgIGRvX29uZV9pbml0
Y2FsbCsweDE5OC8weGE5ZQo+ID4+ICAga2VybmVsX2luaXRfZnJlZWFibGUrMHg2ZDgvMHg3ODAK
PiA+PiAgIGtlcm5lbF9pbml0KzB4MjgvMHgyNGMKPiA+PiAgIHJldF9mcm9tX2ZvcmsrMHhlLzB4
MTgKPiA+Pgo+ID4+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIGlmIGFjcGkgaXMgZW5hYmxlZCBiZWZv
cmUgdHJ5aW5nIHRvIGNyZWF0ZSBzeXNmcwo+ID4+IGVudHJpZXMuCj4gPgo+ID4gSSBhbHJlYWR5
IHN1Ym1pdHRlZCBhIHBhdGNoIGZvciB0aGlzIHByb2JsZW0gKHNlZQo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtYWNwaS9hNmQ5MmNkZC00ZGMzLTQwODAtOWVkOS01YjFmMDJmMjQ3
ZTBAZ214LmRlL1QvKQo+ID4gdGhhdCBvbmx5IGRpc2FibGVzIHRoZSBsZWdhY3kgc3lzZnMgaW50
ZXJmYWNlIHdoaWxlIGtlZXBpbmcgdGhlCj4gPiBjbGFzcy1iYXNlZCBpbnRlcmZhY2UgZnVuY3Rp
b25hbAo+ID4gYXMgaXQgZG9lcyBub3QgZGVwZW5kIG9uIEFDUEkgYXQgYWxsLgo+Cj4KPiBHcmVh
dCwgSSB1bmRlcnN0YW5kIGlmIHlvdXIgcGF0Y2hzZXQgaXMgbm90IG1lcmdlZCBmb3IgcmMxIGJ1
dCBpdCB3b3VsZAo+IGJlIG5pY2UgdG8gaGF2ZSBpdCBtZXJnZWQgaW4gNi4xNiB0aG91Z2ggdG8g
Zml4IHJpc2N2IHN5emthbGxlcgo+IGluc3RhbmNlLiBQZXJoYXBzIHlvdSBjb3VsZCBhZGQgdGhl
IEZpeGVzIHRhZyB0aGF0IEFybmQgbWVudGlvbmVkIHRvbz8KCkkgYWN0dWFsbHkgcHJlZmVyIHlv
dXIgcGF0Y2ggdG8gdGhlIEFybWluJ3Mgb25lIGJlY2F1c2UgdGhlcmUgYXJlCnF1ZXN0aW9ucyBy
ZWdhcmRpbmcgdGhlIGxhdHRlciAoc2VlIHRoZSBtb3N0IHJlY2VudCBtZXNzYWdlIGZyb20gQXJu
ZAppbiB0aGlzIHRocmVhZCkuCgpUaGFua3MhCgoKPiA+PiBGaXhlczogNzdiZTVjYWNiMmMyICgi
QUNQSTogcGxhdGZvcm1fcHJvZmlsZTogQ3JlYXRlIGNsYXNzIGZvciBBQ1BJCj4gPj4gcGxhdGZv
cm0gcHJvZmlsZSIpCj4gPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9hY3BpL3BsYXRmb3JtX3By
b2ZpbGUuYyB8IDMgKysrCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3BsYXRmb3JtX3Byb2ZpbGUuYwo+ID4+
IGIvZHJpdmVycy9hY3BpL3BsYXRmb3JtX3Byb2ZpbGUuYwo+ID4+IGluZGV4IGZmYmZkMzJmNGNm
MS4uYjQzZjQ0NTlhNGY2IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvYWNwaS9wbGF0Zm9ybV9w
cm9maWxlLmMKPiA+PiArKysgYi9kcml2ZXJzL2FjcGkvcGxhdGZvcm1fcHJvZmlsZS5jCj4gPj4g
QEAgLTY4OCw2ICs2ODgsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBwbGF0Zm9ybV9wcm9maWxlX2lu
aXQodm9pZCkKPiA+PiAgIHsKPiA+PiAgICAgICBpbnQgZXJyOwo+ID4+ICAgKyAgICBpZiAoYWNw
aV9kaXNhYmxlZCkKPiA+PiArICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPj4gKwo+ID4+
ICAgICAgIGVyciA9IGNsYXNzX3JlZ2lzdGVyKCZwbGF0Zm9ybV9wcm9maWxlX2NsYXNzKTsKPiA+
PiAgICAgICBpZiAoZXJyKQo+ID4+ICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
