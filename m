Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAFFC02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+a6LciFURno47IUIOH9sQ+eHkagjihAa1VhKRrCRT4=; b=dxPk3OAVdTuV9u
	2Z0UVz/ZxLfXaU0tOgRUwil8enS2Nl6EXvGf6x4N1XyCgVBxDFMKqn/Xj07gapZ7PzLi9Nu0/cbic
	V4QcExoPP58R/fkqmbVPRlYxl3r51jJokOAZFv5EvmBoN3vecj4JjZS+2ysAc516Y2O5jUhjeKwoQ
	a643vz2M87TGHc21JFfsFp+eRABsY1cY2JaA5ZsPsAB197VmNYEFsK0jG8xURSvpIvtusQynBG75i
	8tVErXGDxhnoPqEeApwYF3Bfw+rTWmYG3pSBgnd28KuK09pZmVswjlAPcgo9lqgGLKCe3XupaBEJZ
	SbIxoEcGz8P2MfM7e9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbONy-0000000FHqj-1wZk;
	Fri, 24 Jan 2025 18:26:30 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbONw-0000000FHq8-16BQ
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 18:26:29 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so3442572a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 10:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737743187; x=1738347987; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JcZ9ShAtZot6Jq99upP8px5POQ3dFwcJzQWOR+IFyvo=;
        b=mZsH66WzVwLi1tLmDqD+Q2PRDePABgXZ0HJvqyvZUu3o2JzMfrkqDDHOtRPC4uyN/9
         uzmHFamHWhIkY+hEY5JdI9eAd1S7u3foNCjAcNBxcyuwZA1+z16VeocV6ZqTZifSIgla
         QuOBPcOcOAVea5xSEyI5SeViseIM3s010zM1RxKTmyFUeNWgyDgDEXX5CGk65vqz57QE
         W61OZ7Ln09RMBZEW5KmiKNBVm5Tw+RWgLo7fU0cSHBJd9rJ/wQoo1mbH8kJgPy9hLPOR
         iZ9ykIaahT1bbLGmTD4vqgpYD410JCJRJQcbE3J5fg5/4+Q/SM4dELkzt6nNVholWcuP
         jguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737743187; x=1738347987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcZ9ShAtZot6Jq99upP8px5POQ3dFwcJzQWOR+IFyvo=;
        b=w5mD+CLEh6Qc43ExvPX9+338uab/vwr7AD0BQLuGL50jcAUmV7n7wjAC4FS8bBtQdj
         zkHoQj1jZr9NVT4t0E0YaZOSHDGboFNrfPF0nr4FtavJkUBYuFNyin7zW48p/2o9NqoQ
         G0Kmk4/449EigG6dcjsdLHwaP+hVh7m/w2rN5cSR93Z5yzS/12CQkaBjLt/w2oesZhKx
         4NywmY7V11MLvFya9et5SKzMII4YhDEeJLyfsL0CHWHoQkzP0y7dx9BEuBPVO7tAFByE
         c0QzPAqZkY4M2qrJ8dFHdrBl90AoioCTVEt1gAO7TiiPBfSTX2WSK82Ee5D4xdUW3oyP
         U5mg==
X-Forwarded-Encrypted: i=1; AJvYcCUv7Du5dqAvrwCjZ9lhz/+dolzCPUuZMCw2Qoaxi7bABiEXjokfSbu2OIBfXO8/WCmCul7VB0i8CZO0Qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKO0ZJ5Xe118JJCxV2x62NLyNSuPNTULnCvRWN4NBvP9Mzd0D3
	HsE6+0JPXu+N/4Cwd0u+0chTvuWrMAmrBKxjIvnzClNdGx5MOZW2PAcnf+XYm+I=
X-Gm-Gg: ASbGncsnVYlqwXHxMraQ1Ti5k5FK6zk+nFDwh6WSD+27+PBU7WbpSYhSAhXU8NBa1H2
	JgmvMU0hWyxxPE83q//ln8dlLkX15E5qNF5QHPvfob8MFnFefS16+gfbuIb7cn2xcn8IRKxZnwT
	Ou5+hbp3WwdcxqjleoxnyHezxIIO/Gn/68yWOyXq9WX1i2iZx+qs7tHUOGea8V+4kkhM8mKUkh9
	D9L/ZIUNGituiGFlmOzn7e7r3aSGoDVIDS6iht4l+II/uryzWN+WbN7YDxj44E4jvpwH+aUxOA=
X-Google-Smtp-Source: AGHT+IExa+XlIJFCMHDrMTDwaRw4tPDij+pDt0wqDBC8Qjsvm2Io6+LxzH42s62VXGEH/v9u63KDYg==
X-Received: by 2002:a17:90b:524d:b0:2ef:1134:e350 with SMTP id 98e67ed59e1d1-2f782d691d9mr44218436a91.35.1737743187400;
        Fri, 24 Jan 2025 10:26:27 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:63b:8ac9:503a:b81d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa8122fsm2050434a91.41.2025.01.24.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:26:26 -0800 (PST)
Date: Fri, 24 Jan 2025 10:26:24 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Message-ID: <Z5PbUBqs2Eh8JCIw@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
 <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr>
 <Z5NG7-0YyophMcZy@ghost>
 <CAMzpN2gL9GWx-YzJd+sgQ30=gk3TN342W8Memz5j1C02jgQfrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMzpN2gL9GWx-YzJd+sgQ30=gk3TN342W8Memz5j1C02jgQfrg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_102628_293446_76F55E58 
X-CRM114-Status: GOOD (  37.06  )
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

T24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgMDg6MDg6NDRBTSAtMDUwMCwgQnJpYW4gR2Vyc3Qgd3Jv
dGU6Cj4gT24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgMjo1M+KAr0FNIENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgSmFuIDI0LCAyMDI1
IGF0IDA4OjE5OjE4QU0gKzAxMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+ID4gSGkgQ2hh
cmxpZSwKPiA+ID4KPiA+ID4gT24gMjMvMDEvMjAyNSAyMDoxNCwgQ2hhcmxpZSBKZW5raW5zIHdy
b3RlOgo+ID4gPiA+IFRoaXMgZnVuY3Rpb24gd2FzIHVuaWZpZWQgaW50byBhIHNpbmdsZSBmdW5j
dGlvbiBpbiBjb21taXQgYWI5MTY0ZGFlMjczCj4gPiA+ID4gKCJyaXNjdjogZW50cnk6IENvbnNv
bGlkYXRlIHJldF9mcm9tX2tlcm5lbF90aHJlYWQgaW50byByZXRfZnJvbV9mb3JrIikuCj4gPiA+
ID4gSG93ZXZlciB0aGF0IGltcG9zZWQgYSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbi4gUGFydGlh
bGx5IHJldmVydGluZyB0aGlzCj4gPiA+ID4gY29tbWl0IHRvIGhhdmUgcmV0X2Zyb21fZm9yaygp
IHNwbGl0IGFnYWluIHJlc3VsdHMgaW4gYSAxJSBpbmNyZWFzZSBvbgo+ID4gPiA+IHRoZSBudW1i
ZXIgb2YgdGltZXMgZm9yayBpcyBhYmxlIHRvIGJlIGNhbGxlZCBwZXIgc2Vjb25kLgo+ID4gPiA+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5j
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXBy
b3RvdHlwZXMuaCB8ICAzICsrLQo+ID4gPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAg
ICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKy0tLQo+ID4gPiA+ICAgYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvY2Vzcy5jICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKystLS0tLS0KPiA+ID4gPiAg
IDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPiA+
ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90
eXBlcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCj4gPiA+ID4g
aW5kZXggNzMzZmY2MDk3Nzg3OTcwMDEwMDZjMzNiYmE5ZTNjYzViMWYxNTM4Ny4uYmZjOGVhNWY5
MzE5YjE5NDQ5ZWM1OTQ5M2I0NWI5MjZkZjg4ODgzMiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKPiA+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKPiA+ID4gPiBAQCAtNTIsNyArNTIsOCBA
QCBERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9lY2FsbF9zKTsKPiA+ID4gPiAgIERFQ0xB
UkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX20pOwo+ID4gPiA+ICAgREVDTEFSRV9ET19F
UlJPUl9JTkZPKGRvX3RyYXBfYnJlYWspOwo+ID4gPiA+IC1hc21saW5rYWdlIHZvaWQgcmV0X2Zy
b21fZm9yayh2b2lkICpmbl9hcmcsIGludCAoKmZuKSh2b2lkICopLCBzdHJ1Y3QgcHRfcmVncyAq
cmVncyk7Cj4gPiA+ID4gK2FzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrX2tlcm5lbCh2b2lk
ICpmbl9hcmcsIGludCAoKmZuKSh2b2lkICopLCBzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gPiA+
ID4gK2FzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrX3VzZXIoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpOwo+ID4gPiA+ICAgYXNtbGlua2FnZSB2b2lkIGhhbmRsZV9iYWRfc3RhY2soc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpOwo+ID4gPiA+ICAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpOwo+ID4gPiA+ICAgYXNtbGlua2FnZSB2b2lkIGRvX2lycShzdHJ1
Y3QgcHRfcmVncyAqcmVncyk7Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPiA+ID4gaW5kZXggOTIyNWMz
MjIyNzlhYTkwZTczN2IxZDcxNDRkYjA4NDMxOWNmODEwMy4uOTM4NmVmNzQ0NDI2N2YwYjliZjhh
MDU1MGY0ZTMxZGVhZWI4NTg4MSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9lbnRyeS5TCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ID4gPiA+
IEBAIC0zMTksMTQgKzMxOSwyMSBAQCBTWU1fQ09ERV9FTkQoaGFuZGxlX2tlcm5lbF9zdGFja19v
dmVyZmxvdykKPiA+ID4gPiAgIEFTTV9OT0tQUk9CRShoYW5kbGVfa2VybmVsX3N0YWNrX292ZXJm
bG93KQo+ID4gPiA+ICAgI2VuZGlmCj4gPiA+ID4gLVNZTV9DT0RFX1NUQVJUKHJldF9mcm9tX2Zv
cmtfYXNtKQo+ID4gPiA+ICtTWU1fQ09ERV9TVEFSVChyZXRfZnJvbV9mb3JrX2tlcm5lbF9hc20p
Cj4gPiA+ID4gICAgIGNhbGwgc2NoZWR1bGVfdGFpbAo+ID4gPiA+ICAgICBtb3ZlIGEwLCBzMSAv
KiBmbiAqLwo+ID4gPiA+ICAgICBtb3ZlIGExLCBzMCAvKiBmbl9hcmcgKi8KPiA+ID4gPiAgICAg
bW92ZSBhMiwgc3AgLyogcHRfcmVncyAqLwo+ID4gPiA+IC0gICBjYWxsIHJldF9mcm9tX2ZvcmsK
PiA+ID4gPiArICAgY2FsbCByZXRfZnJvbV9mb3JrX2tlcm5lbAo+ID4gPiA+ICAgICBqIHJldF9m
cm9tX2V4Y2VwdGlvbgo+ID4gPiA+IC1TWU1fQ09ERV9FTkQocmV0X2Zyb21fZm9ya19hc20pCj4g
PiA+ID4gK1NZTV9DT0RFX0VORChyZXRfZnJvbV9mb3JrX2tlcm5lbF9hc20pCj4gPiA+ID4gKwo+
ID4gPiA+ICtTWU1fQ09ERV9TVEFSVChyZXRfZnJvbV9mb3JrX3VzZXJfYXNtKQo+ID4gPiA+ICsg
ICBjYWxsIHNjaGVkdWxlX3RhaWwKPiA+ID4gPiArICAgbW92ZSBhMCwgc3AgLyogcHRfcmVncyAq
Lwo+ID4gPiA+ICsgICBjYWxsIHJldF9mcm9tX2ZvcmtfdXNlcgo+ID4gPiA+ICsgICBqIHJldF9m
cm9tX2V4Y2VwdGlvbgo+ID4gPiA+ICtTWU1fQ09ERV9FTkQocmV0X2Zyb21fZm9ya191c2VyX2Fz
bSkKPiA+ID4gPiAgICNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+ID4gPiA+ICAgLyoKPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvY2Vzcy5jCj4gPiA+ID4gaW5kZXggMGQwN2U2ZDhmNmI1N2JlYmE0MzhkYmJhNWU4
Yzc0YTAxNDU4MmJlZS4uNWYxNTIzNmNiNTI2YmQ5ZmU2MTYzNmVkMzcyYjRiNzZjOTRkZjk0NiAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiA+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiA+ID4gPiBAQCAtMzgsNyArMzgsOCBA
QCB1bnNpZ25lZCBsb25nIF9fc3RhY2tfY2hrX2d1YXJkIF9fcmVhZF9tb3N0bHk7Cj4gPiA+ID4g
ICBFWFBPUlRfU1lNQk9MKF9fc3RhY2tfY2hrX2d1YXJkKTsKPiA+ID4gPiAgICNlbmRpZgo+ID4g
PiA+IC1leHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2ZvcmtfYXNtKHZvaWQpOwo+ID4g
PiA+ICtleHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2Zvcmtfa2VybmVsX2FzbSh2b2lk
KTsKPiA+ID4gPiArZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrX3VzZXJfYXNt
KHZvaWQpOwo+ID4gPiA+ICAgdm9pZCBub2luc3RyIGFyY2hfY3B1X2lkbGUodm9pZCkKPiA+ID4g
PiAgIHsKPiA+ID4gPiBAQCAtMjA4LDE0ICsyMDksMTggQEAgaW50IGFyY2hfZHVwX3Rhc2tfc3Ry
dWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYykKPiA+
ID4gPiAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gICB9Cj4gPiA+ID4gLWFzbWxpbmthZ2Ugdm9pZCBy
ZXRfZnJvbV9mb3JrKHZvaWQgKmZuX2FyZywgaW50ICgqZm4pKHZvaWQgKiksIHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQo+ID4gPiA+ICthc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9ya19rZXJuZWwo
dm9pZCAqZm5fYXJnLCBpbnQgKCpmbikodm9pZCAqKSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
PiA+ID4gICB7Cj4gPiA+ID4gLSAgIGlmICh1bmxpa2VseShmbikpCj4gPiA+ID4gLSAgICAgICAg
ICAgZm4oZm5fYXJnKTsKPiA+ID4gPiArICAgZm4oZm5fYXJnKTsKPiA+ID4gPiAgICAgc3lzY2Fs
bF9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKPiA+ID4gPiAgIH0KPiA+ID4gPiArYXNtbGlua2Fn
ZSB2b2lkIHJldF9mcm9tX2ZvcmtfdXNlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPiAr
ewo+ID4gPiA+ICsgICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4gPiA+ICt9
Cj4gPiA+ID4gKwo+ID4gPiA+ICAgaW50IGNvcHlfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAq
cCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdzKQo+ID4gPiA+ICAgewo+ID4g
PiA+ICAgICB1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzID0gYXJncy0+ZmxhZ3M7Cj4gPiA+ID4g
QEAgLTIzOCw2ICsyNDMsNyBAQCBpbnQgY29weV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpw
LCBjb25zdCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MgKmFyZ3MpCj4gPiA+ID4gICAgICAgICAg
ICAgcC0+dGhyZWFkLnNbMF0gPSAodW5zaWduZWQgbG9uZylhcmdzLT5mbjsKPiA+ID4gPiAgICAg
ICAgICAgICBwLT50aHJlYWQuc1sxXSA9ICh1bnNpZ25lZCBsb25nKWFyZ3MtPmZuX2FyZzsKPiA+
ID4gPiArICAgICAgICAgICBwLT50aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9m
b3JrX2tlcm5lbF9hc207Cj4gPiA+ID4gICAgIH0gZWxzZSB7Cj4gPiA+ID4gICAgICAgICAgICAg
KmNoaWxkcmVncyA9ICooY3VycmVudF9wdF9yZWdzKCkpOwo+ID4gPiA+ICAgICAgICAgICAgIC8q
IFR1cm4gb2ZmIHN0YXR1cy5WUyAqLwo+ID4gPiA+IEBAIC0yNDcsMTIgKzI1MywxMSBAQCBpbnQg
Y29weV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpwLCBjb25zdCBzdHJ1Y3Qga2VybmVsX2Ns
b25lX2FyZ3MgKmFyZ3MpCj4gPiA+ID4gICAgICAgICAgICAgaWYgKGNsb25lX2ZsYWdzICYgQ0xP
TkVfU0VUVExTKQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgY2hpbGRyZWdzLT50cCA9IHRs
czsKPiA+ID4gPiAgICAgICAgICAgICBjaGlsZHJlZ3MtPmEwID0gMDsgLyogUmV0dXJuIHZhbHVl
IG9mIGZvcmsoKSAqLwo+ID4gPiA+IC0gICAgICAgICAgIHAtPnRocmVhZC5zWzBdID0gMDsKPiA+
ID4gPiArICAgICAgICAgICBwLT50aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9m
b3JrX3VzZXJfYXNtOwo+ID4gPiA+ICAgICB9Cj4gPiA+ID4gICAgIHAtPnRocmVhZC5yaXNjdl92
X2ZsYWdzID0gMDsKPiA+ID4gPiAgICAgaWYgKGhhc192ZWN0b3IoKSkKPiA+ID4gPiAgICAgICAg
ICAgICByaXNjdl92X3RocmVhZF9hbGxvYyhwKTsKPiA+ID4gPiAtICAgcC0+dGhyZWFkLnJhID0g
KHVuc2lnbmVkIGxvbmcpcmV0X2Zyb21fZm9ya19hc207Cj4gPiA+ID4gICAgIHAtPnRocmVhZC5z
cCA9ICh1bnNpZ25lZCBsb25nKWNoaWxkcmVnczsgLyoga2VybmVsIHNwICovCj4gPiA+ID4gICAg
IHJldHVybiAwOwo+ID4gPiA+ICAgfQo+ID4gPiA+Cj4gPiA+Cj4gPiA+IENhbiB5b3UgYmVuY2ht
YXJrIHRoaXMgY2hhbmdlIG9uIHNvbWUgSFc/IEknbSBub3Qgc3VyZSB3ZSB3b3VsZCBpbmRlZWQg
Z2Fpbgo+ID4gPiB0aGlzIDElLgo+ID4KPiA+IEl0IHJlZHVjZXMgdGhlIHN5c2NhbGwgcGF0aCBi
eSAzIGluc3RydWN0aW9ucywgdHdvIGZvciBub3QgbmVlZGluZyB0bwo+ID4gbW92ZSB0aGUgZm4g
YW5kIGZuX2FyZ3MgZnJvbToKPiA+Cj4gPiBtb3ZlIGEwLCBzMSAvKiBmbiAqLwo+ID4gbW92ZSBh
MSwgczAgLyogZm5fYXJnICovCj4gPgo+ID4gQW5kIG9uZSBmb3Igbm90IG5lZWRpbmcgdG8gZG8g
dGhlIGNvbmRpdGlvbmFsLiBUaGlzIG9uZSBpcyBhbHNvIHNhdmVkIG9uCj4gPiBrZXJuZWwgdGhy
ZWFkcy4KPiA+Cj4gPiBJdCdzIGEgdmVyeSBzbWFsbCBpbXByb3ZlbWVudCwgYnV0IHRoZXJlIGlz
IG9ubHkgc29tZXRoaW5nIGxpa2UgMTAwCj4gPiBpbnN0cnVjdGlvbnMgYWxvbmcgdGhlIGRpcmVj
dCBzeXNjYWxsIHBhdGggc28gaXQgZW5kcyB1cCBiZWluZyBhIGxhcmdlCj4gPiBwZXJjZW50YWdl
LiBPbiBoYXJkd2FyZSBtb3ZpbmcgcmVnaXN0ZXJzIGlzIHZlcnkgY2hlYXAgYW5kIHRoaXMgYnJh
bmNoCj4gPiB3aWxsIGJlIGFsbW9zdCBhbHdheXMgYmUgY29ycmVjdGx5IHByZWRpY3RlZCBzbyB0
aGUgY29zdCBpcyBjbG9zZSB0bwo+ID4gemVyby4gSSBqdXN0IGZpZ3VyZWQgdGhhdCBzaW5jZSBJ
IGFtIG1ha2luZyBjaGFuZ2VzIGFyb3VuZCBoZXJlIGl0IHdvdWxkCj4gPiBiZSBuaWNlIGlmIGl0
IHdhcyBvcHRpbWFsIGluc3RlYWQgb2YgYmVpbmcgY2xvc2UgdG8gb3B0aW1hbC4KPiAKPiBUaGF0
IG1heSBiZSB0aGUgY2FzZSBvbiB0aGUgY2hpbGQgcHJvY2VzcyBzaWRlLCBidXQgY29tcGFyZWQg
dG8gdGhlCj4gY29zdCBvZiB0aGUgZm9yayBvbiB0aGUgcGFyZW50IHByb2Nlc3Mgc2lkZSAoYWxs
b2NhdGluZyBhbmQKPiBpbml0aWFsaXppbmcgYSBuZXcgdGFzayBzdHJ1Y3QpLCBpdCdzIG1pbmlz
Y3VsZS4KPiAKClllcyB0aGF0IGlzIGEgZ29vZCBwb2ludC4gVGhlIGNoYW5nZSB3aWxsIGhhdmUg
YSBwcm9iYWJseSB1bm5vdGljZWFibGUKZWZmZWN0LCBtb3N0bHkganVzdCBkZXBlbmRzIG9uIGhv
dyBwZW9wbGUgd2FudCB0aGlzIGNvZGUgdG8gbG9vay4KCi0gQ2hhcmxpZQoKPiAKPiAKPiBCcmlh
biBHZXJzdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
