Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A40E7E345
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xV7wKGrUQ50qEZImuXRyvgeZS2iLRm1X89ylZ+9pNqA=; b=2C9spQ6rADv5za
	VZufQ6h6RIPmYWvP5LtWCt0jPUz+fd5N+jDVLaOz0qR55z/7tejgN5BMb2qsgspuOr279z0+OlprF
	uovHOb0Nol4WaFCTZ8SBD5cKySmbNkKQMnNFBob+DdXC4gGNvh8YTOCUsy3fN5WpgEJdsR/IidUVS
	0Krnl2lP4fUpwdyTjkqyjJHbummcojvU1vwDUY8d6UeuQuh84zPqTs2AqJVUR/v9es8qPECE8hZ1E
	F6K5w4lBCFCltcUyUmWZIGnwa+m041ZqC0wF6m1Lx7ESK+tt7+gwao175g3cnrsxiyRFG5JJBl5nr
	9n+xhjy5m1joFVcNc3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a8U-00000001jl4-3Opi;
	Fri, 03 Apr 2026 08:44:14 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a8R-00000001jkc-3tiq
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 08:44:13 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7d9b1c57a4cso1526281a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 01:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775205850; cv=none;
        d=google.com; s=arc-20240605;
        b=VsNmVY2ApkvFSn2STRHmxJzIEXcrhJoBo4xzEffOsVNJTqbP0QGYvFI0YjVgXIoDsG
         UFvMToHot2H0yTASvG6EdgwotNx31p/YW1rUrjNdbt0AhODYwhHcJkibfNREP7DM9xYV
         jL9Ws8rEM/4M/WCeATmPD1ltQV8RLsGYjwvoABpjk3NG5ChfIArd5X9E2QOEKLGz4zPc
         VEAgBVVR/vahLP/d+NK+j/fsD1FrwbtOAXldBNrz0TOeE/vaDA5ltNF3G/tCEfTVGY/4
         fZTrqvhQVdxLHXaOoaSQDrUNk+uosZWiEEdKYz7DgP4YGXW6wVQBJ7EdvSjZEDGUN6jn
         DqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7RF+JRoyl7L9bjm2RustUEzi2QSZF9I70Nt38bHT4J0=;
        fh=BpNl1FIYC/IUNkSAN4Rbm1DtToEMQ7cu1qBn9eoacaE=;
        b=GstPsA9UuMbLFvE4gdxDEUn5dTIHPgg6MSFFN7Bqd8xda6+aAHIVjQjr0N+LCpb/3m
         3YyUSb5K2zqfyIgvIbxJezEEdt1BfWnpnDMCORS6k/jn6nImDV188r2im9heslUXjXWf
         Nw3UDOUJ8ZrIdsZQ9wKTx1Fu9aiRNhzvuYSASEsqYBOfIg8avrPB06ez+cNSu+uuFwzE
         33+NFBf1fn3h9aUybz3LG2WCZWf3IZPJJTizjTJU75E+VDlF8l4qVlpkdYIj+JpQVWnA
         lGhASzs7rlDfL+2mjQ9PzbqzzLaL4prRDp6VtE1Wj4il1sdQZEjrfJs5AHJEifDOxxes
         Nlow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775205850; x=1775810650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RF+JRoyl7L9bjm2RustUEzi2QSZF9I70Nt38bHT4J0=;
        b=CLtNFTZVra9TvtzIAhL4dKgabhbDR5JQumagXaJWMLwOLGbe72QeJ+D8KFmsD5ktCr
         xwZKsd+u8DyAxA26JMRHUWHlCVZiQVKdBTBcUSfFmbh4ahQ1NruxUQxX+6z/XOkwBwtG
         M4JfST/qQuUmnNAcSCeFqEE8uEBQGQ7NqR/AsBY1i+/a5bBAqwjmNui2aI+IIorib3qd
         vu3GN1bcI8cdKtor+428T+lUUS8i6EpPdUNf1dJFENk0Ci/lGAkTvzcvR19x0an2gMna
         qqJH+XEewQwnUxuWgGd3P2y8byL6DyyG0HosibqlLuXD9/p/pDjVfy6v+WI3WSqjRuqN
         ZIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775205850; x=1775810650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RF+JRoyl7L9bjm2RustUEzi2QSZF9I70Nt38bHT4J0=;
        b=ElJN9B1PPlC5oFKxgValc5B9zLNpZRAAQkUmY8B5QZQp2K8/JWf69VhLgDf2HX7tQ9
         D8Lm7xFmMKvI6yS4QMRVUi8CCW6k4avu1AgIQwGbJ8d/c2tuBSk4LJkFn/7b592CH4yF
         fQwoLz6U2RYtqBHp2dk1i5AwZIGJPQnRv9uqDAEYYBunlCuHA1HpbvzBEXWWVw19Uomh
         LdLU1tzBoQSEPX1fixC7edNSzviJASwQpZy/9LPFezfpf1kKvI4o2Z58GQopCWxdWgRj
         KjFWHI7grTIDIhujkTN7lKVYK/QjceXVHdsn3KUyN7DNzOXNepalgfQ2xkAaRJ5FlZaK
         A9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVnc9tOGbLMtI5Zloneu+5Z+tPcnTYXPazzcy/FRNgfyBNgnIaQfOqyeKyAM+q+9O0TGnEcb0qDPT7ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq76ruusxMvUCLtsNwR6KH52FV27KiOHa1cGEQbR4kuxWQEIZS
	f/cM+kpNc6h6tiqUuHhovQepNZM13Wr8JOuaEWda7b4Nqx63OTdrpfgu3LyVICrBa+y7p5K0DQY
	Sx7DTQI7CILe3IgF+ybZRdamg81S9y6D/O3bB2W5/1Q==
X-Gm-Gg: ATEYQzwv45ySci1DNnU1+nMbXQDcaK7HkSspaZ3S/oeG86f7kLSbPkETijyknMwM5ga
	caAnjxHrJ3WhJQ782yHQMfpuq6eNhz2hxhKjzMaDLyMJ1oIM/DN+8m4B+DAoz3Sqvtat1B6CR3t
	ZFwinV/rZGZiGJ0s3ljBh0QG2Ypytvfnh2O7HHtJY4+ZuYGseGSIp90BMvMNBFc7g9hQd/0i+Bv
	zw+A49w2liv1xUM6MHvDIWiSvR0K5kfTsAWUG4zStx+SFXEYGz5sa2kFdRnxg9sqPIIgWaN/E+A
	3Y5cvzR3c6FFXy6VBh8d8ePauivvX0N6/VOVOoOT3NiTLMqougmjO3AWzQpCIV75MmsaU9YRdJG
	6K4SPq+8DQueTB/IOcB3/Cb0yRw==
X-Received: by 2002:a05:6820:8504:b0:67e:3c4a:eac2 with SMTP id
 006d021491bc7-68220941f6amr789592eaf.58.1775205850507; Fri, 03 Apr 2026
 01:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260204155309.763597-1-anup.patel@oss.qualcomm.com>
 <20260204155309.763597-2-anup.patel@oss.qualcomm.com> <603b0a16-4965-2689-d3ea-3f9db0cc49aa@kernel.org>
In-Reply-To: <603b0a16-4965-2689-d3ea-3f9db0cc49aa@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 14:13:57 +0530
X-Gm-Features: AQROBzCX8E-gtZHtQYOERzN8D99nSVmVtNsF3Vjmsbb9BTHno86I9RztOZG8SnM
Message-ID: <CAAhSdy28oPgzaaZj94F-MToTYT6WTWsiSVpuy0VzLkM_maSP0g@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Paul Walmsley <pjw@kernel.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Atish Patra <atishp@rivosinc.com>, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, 
	Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_014411_994040_A498A1B4 
X-CRM114-Status: GOOD (  20.51  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCAxOjU14oCvUE0gUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIFdlZCwgNCBGZWIgMjAyNiwgQW51cCBQ
YXRlbCB3cm90ZToKPgo+ID4gRnJvbTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+Cj4gPgo+ID4gSW4gUklTQy1WLCB0aGVyZSBpcyBubyBDU1IgcmVhZC93cml0ZSBpbnN0cnVj
dGlvbiB3aGljaCB0YWtlcyBDU1IKPiA+IG51bWJlciB2aWEgcmVnaXN0ZXIgc28gYWRkIGNvbW1v
biBjc3JfcmVhZF9udW0oKSBhbmQgY3NyX3dyaXRlX251bSgpCj4gPiBmdW5jdGlvbnMgd2hpY2gg
YWxsb3cgYWNjZXNzaW5nIGNlcnRhaW4gQ1NScyBieSBwYXNzaW5nIENTUiBudW1iZXIKPiA+IGFz
IHBhcmFtZXRlci4gVGhlc2UgY29tbW9uIGZ1bmN0aW9ucyB3aWxsIGJlIGZpcnN0IHVzZWQgYnkg
dGhlCj4gPiBBQ1BJIENQUEMgZHJpdmVyIGFuZCBSSVNDLVYgUE1VIGRyaXZlci4KPiA+Cj4gPiBB
bHNvLCB0aGUgUklTQy1WIEFDUEkgRkZIIHNwZWNpZmljYXRpb24gYWxsb3dzIGFyYml0cmFyeSBD
U1IgbnVtYmVyCj4gPiBhcyBDUFBDIHJlZ2lzdGVyIGFuZCB0aGUgUklTQy1WIFNCSSBzcGVjaWZp
Y2F0aW9uIGFsbG93cyBhcmJpdHJhcnkKPiA+IENTUiBudW1iZXIgYXMgUE1VIGhhcmR3YXJlIGNv
dW50ZXIuIFRoaXMgbWVhbnMgQUNQSSBDUFBDIGRyaXZlciBhbmQKPiA+IFJJU0MtViBQTVUgZHJp
dmVyIG5vIGxvbmdlciBuZWVkIHRvIGRvIHNhbml0eSBjaGVja3Mgb24gQ1NSIG51bWJlcgo+ID4g
d2hpY2ggYXJlIG5vdyBkb25lIGJ5IHRoZSBjb21tb24gY3NyX3JlYWRfbnVtKCkgYW5kIGNzcl93
cml0ZV9udW0oKQo+ID4gZnVuY3Rpb25zLgo+Cj4gSSByZWNhbGwgdGhhdCB3aGVuIHdlIGRpc2N1
c3NlZCB0aGlzIHBhdGNoIG9uIGEgY2FsbCBhIGZldyBtb250aHMgYWdvLCBpdAo+IHdhcyBicm91
Z2h0IHVwIHRoYXQgaXQgc2VlbWVkIHVzZWZ1bCB0byByZXN0cmljdCB3aGljaCBDU1JzIGNvdWxk
IGJlIHJlYWQKPiBvciB3cml0dGVuIGF0IHJ1bnRpbWUsIG9uIGEgcGVyLXZlbmRvciBiYXNpcy4g
IFRoYXQgd2F5LCB0aGUgRkZIIGludGVyZmFjZQo+IGNvdWxkbid0IGJlIHVzZWQgdG8gcmVhZCBv
ciB3cml0ZSBjdXN0b20gQ1NScyB0aGF0IGhhZCBub3RoaW5nIHRvIGRvIHdpdGgKPiBDUFBDIG9y
IFBNVSBmdW5jdGlvbnMuCj4KPiBBcmUgeW91IHN0aWxsIHBsYW5uaW5nIHRvIGltcGxlbWVudCB0
aGF0IGNoYW5nZT8KPgoKVGhlIGN1cnJlbnQgY3NyX3JlYWRfbnVtKCkgYW5kIGNzcl93cml0ZV9u
dW0oKSBvbmx5IGFsbG93cwpIUE0gY291bnRlcnMgYW5kIGN1c3RvbSBDU1Igc3BhY2UgKGFzIGRl
ZmluZWQgYnkgdGhlIFByaXYKc3BlYykgdG8gYmUgYWNjZXNzaWJsZSB2aWEgQUNQSSBGRkguIFRo
ZSBBQ1BJIEZGSCBpbnRlcmZhY2UKaXMgdmVyeSBmbGV4aWJsZSBhbmQgYWxsb3dzIHZlbmRvcnMg
dG8gc3BlY2lmeSB0aGUgQ1NSIG51bWJlcgppbiB0aGUgQUNQSSB0YWJsZSBpdHNlbGYgc28gd2Ug
ZG9uJ3QgbmVlZCB0byBjb21waWxlIGtlcm5lbCBvbgpwZXItdmVuZG9yIGJhc2lzLgoKSW4gb3Ro
ZXIgd29yZHMsIHRoZSBjdXJyZW50IGFwcHJvYWNoIGFsbG93cyBzYW1lIExpbnV4IGtlcm5lbApp
bWFnZSBmb3IgbXVsdGlwbGUgdmVuZG9yIGV2ZW4gaWYgdGhleSB1c2UgY3VzdG9tIENTUnMgaW4g
dGhlaXIKQUNQSSBGRkggaW50ZXJmYWNlLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
