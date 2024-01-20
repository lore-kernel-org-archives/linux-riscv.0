Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EFEC47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 03:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb44IJL3vzO/cWS6tUB6HykAAGFHM+97+ObnhQ5JvHw=; b=XC6f/fbxEKACyN
	dvwQNQr/ISos1EEz77dWUG5RiO5PU6zs9/JHDuKPRxWJ93KQdYcXBV2Zz18vCenv0bPrXHqoHQLE4
	kfpeINCGuXLBPbVoRFR1fYSczRXqqykBDaJow4vwFr5vv8hwRzKF1Zxbatx2PSLBVSiv5zBQLwX+y
	qB9sh2xMJCRs5k4Bjxi8RDV7hy9MGQrtpyDcx5/5TYhaCHxgpByInxr9xBO8OhT6TEAPHtA2A/7wo
	OjdHnc4lokQWGF4qNYTj4Z7bgx2aP0ieWVPWKoF58lWjMeY9YIEk/lmO0zD0ULn+IZyT6pBqL79Hz
	4DOgWhuB4dY3hzVl6aAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR2W3-0079sh-2i;
	Sat, 20 Jan 2024 03:59:31 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR2Vx-0079sB-2g
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 03:59:28 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3619e804f2aso4208485ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 19:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705723163; x=1706327963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUdj33zU6WPp9NMXR1jDLao5OoMg89mIJNooFVUpnh0=;
        b=r8tl7dpWOHfMkj4Ddn/P6iWLBNDXkLjbxYzGE+WgdwFT8z5dYoACMJwjWm+/sh5ZYo
         towq2GSnzysAz1x1OUT2Um4viCR9yv4fZCFAinleTrG75E21eGF7wENmK7TBWbVXF1yS
         mP7MqLB57pXvfttNVVhni/+/DN2h8IvVuQ8voZ0pCnaB73MkVusz9QlcCD2usvyuWv+h
         tRTHONSpYwQ56/XDt9ws4uinXdEWJmfQDJmawySYUgbg/Wxslp9LvgQIVRY/voGjdOU5
         a30rrwbbE6cdot5paoMrUyUbwDr2zSFN13EjANOCubJIeA05yWT/tMJbM8TVyU4ltT3v
         i1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705723163; x=1706327963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUdj33zU6WPp9NMXR1jDLao5OoMg89mIJNooFVUpnh0=;
        b=oUU0twR6lymIo5Q4rK/IoBB1jaJ12vdbqk8EZIYjJj1qvWyTniENDkIcRuWoII+1Fg
         eC9bqO6z1KD2KM5gw7FQFlwCYXV8ho7RW11eRI3QukuY+8yEKJdG9LFJW7OOt/wnQdKh
         nKchS7Rucgev41Mfu+lpLB5k4+6NQNbNpL7/cJ0DBtb7V26nNMiRaBs6yIErLEBYnwZE
         euMvZWS2lKpx9WYo6FFl6RVE/lHcon3b+jgUBytjWWc6o29CcmzmDTlHGyKgXXO3ousY
         pLN/GWJLPWRbkU/hmkhxz7D/zNUfgr239dqO3r4ERchptC9PmSDZrUNqIPbC026xXLg8
         l1Mg==
X-Gm-Message-State: AOJu0YwkWevAMBOR4QFzRjgUTRorOKM2KKPbk+tyvDpb+SbzSns8zY5k
	UAV2OJy4gPNYhBCLZNbbZt7hDX+SZtZLXi6/MTQ9maxDmDVEAa0bSH++yd0kwzhcb5pLo6zBDL4
	e5RQ25G1K0MhB+PPqOwANdzpOCe+gHKmMYvOIcw==
X-Google-Smtp-Source: AGHT+IE/vAYx8mnNdDKMAblUXSdltL/8n5TCQTrCXmLC8zaNaqz1vAs/Oe/IS8XQjJqKfiNn3hNoFDPDJZHtazYV8Ls=
X-Received: by 2002:a92:b70a:0:b0:360:7190:f895 with SMTP id
 k10-20020a92b70a000000b003607190f895mr854939ili.52.1705723162955; Fri, 19 Jan
 2024 19:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20240119224404.26695-2-palmer@rivosinc.com>
In-Reply-To: <20240119224404.26695-2-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Jan 2024 09:29:11 +0530
Message-ID: <CAAhSdy0naZf8aKkAH6MgYyLior3rZEjx0WWWgp4Ljakrb5q5XQ@mail.gmail.com>
Subject: Re: [PATCH v2] tty: hvc: Fix the RISC-V SBI driver for a refactoring
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	jirislaby@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_195926_898351_DFB340EC 
X-CRM114-Status: GOOD (  18.80  )
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

T24gU2F0LCBKYW4gMjAsIDIwMjQgYXQgNDoxNeKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPgo+Cj4gSSBtaXNzZWQgdGhlIGludC0+c2l6ZV90IHJlZmFjdG9yaW5nIGluIGYz
MmZjYmVkYmU5MiAoInR0eTogaHZjOiBjb252ZXJ0Cj4gdG8gdTggYW5kIHNpemVfdCIpLCB3aGlj
aCBjYXVzZXMgdGhlIG5ld2x5IHVzZWQgb3BzIGluIDg4ZWFkNjhlNzY0Ywo+ICgidHR5OiBBZGQg
U0JJIGRlYnVnIGNvbnNvbGUgc3VwcG9ydCB0byBIVkMgU0JJIGRyaXZlciIpIHRvIGZhaWwgdG8K
PiBidWlsZCBkdWUgdG8gYQo+Cj4gbGludXgvZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmku
Yzo1OToxNTogZXJyb3I6IGluY29tcGF0aWJsZSBmdW5jdGlvbiBwb2ludGVyIHR5cGVzIGluaXRp
YWxpemluZyAnc3NpemVfdCAoKikodWludDMyX3QsIGNvbnN0IHU4ICosIHNpemVfdCknIChha2Eg
J2xvbmcgKCopKHVuc2lnbmVkIGludCwgY29uc3QgdW5zaWduZWQgY2hhciAqLCB1bnNpZ25lZCBs
b25nKScpIHdpdGggYW4gZXhwcmVzc2lvbiBvZiB0eXBlICdpbnQgKHVpbnQzMl90LCBjb25zdCBj
aGFyICosIGludCknIChha2EgJ2ludCAodW5zaWduZWQgaW50LCBjb25zdCBjaGFyICosIGludCkn
KSBbLVdpbmNvbXBhdGlibGUtZnVuY3Rpb24tcG9pbnRlci10eXBlc10KPiAgICAgICAgIC5wdXRf
Y2hhcnMgPSBodmNfc2JpX2RiY25fdHR5X3B1dCwKPgo+IEZpeGVzOiBmMzJmY2JlZGJlOTIgKCJ0
dHk6IGh2YzogY29udmVydCB0byB1OCBhbmQgc2l6ZV90IikKPiBGaXhlczogODhlYWQ2OGU3NjRj
ICgidHR5OiBBZGQgU0JJIGRlYnVnIGNvbnNvbGUgc3VwcG9ydCB0byBIVkMgU0JJIGRyaXZlciIp
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDExOTIxNTYxMi4yMDUyOS0y
LXBhbG1lckByaXZvc2luYy5jb20KPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxIDwyMDI0MDExOTIxNTYx
Mi4yMDUyOS0yLXBhbG1lckByaXZvc2luYy5jb20+Ogo+ICogRml4IHRoZSByZXR1cm4gYW5kIGFy
Z3VtZW50cyBjb3JyZWN0bHkuCj4gKiBBbHNvIGZpeCB0aGUgaHZjX3NiaV9kYmNuX3R0eV97Z2V0
LHB1dH0oKS4KPiAtLS0KPiAgZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmkuYyB8IDggKysr
Ky0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jIGIvZHJpdmVy
cy90dHkvaHZjL2h2Y19yaXNjdl9zYmkuYwo+IGluZGV4IDJmMzU3MWYxN2VjZC4uZjhjZDMzMTBl
ZjM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMKPiArKysg
Yi9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4gQEAgLTE1LDcgKzE1LDcgQEAKPgo+
ICAjaW5jbHVkZSAiaHZjX2NvbnNvbGUuaCIKPgo+IC1zdGF0aWMgaW50IGh2Y19zYmlfdHR5X3B1
dCh1aW50MzJfdCB2dGVybW5vLCBjb25zdCBjaGFyICpidWYsIGludCBjb3VudCkKPiArc3RhdGlj
IHNzaXplX3QgaHZjX3NiaV90dHlfcHV0KHVpbnQzMl90IHZ0ZXJtbm8sIGNvbnN0IHU4ICpidWYs
IHNpemVfdCBjb3VudCkKPiAgewo+ICAgICAgICAgaW50IGk7Cj4KPiBAQCAtMjUsNyArMjUsNyBA
QCBzdGF0aWMgaW50IGh2Y19zYmlfdHR5X3B1dCh1aW50MzJfdCB2dGVybW5vLCBjb25zdCBjaGFy
ICpidWYsIGludCBjb3VudCkKPiAgICAgICAgIHJldHVybiBpOwo+ICB9Cj4KPiAtc3RhdGljIGlu
dCBodmNfc2JpX3R0eV9nZXQodWludDMyX3QgdnRlcm1ubywgY2hhciAqYnVmLCBpbnQgY291bnQp
Cj4gK3N0YXRpYyBzc2l6ZV90IGh2Y19zYmlfdHR5X2dldCh1aW50MzJfdCB2dGVybW5vLCB1OCAq
YnVmLCBzaXplX3QgY291bnQpCgpUaGUgaHZjX3NiaV90dHlfcHV0KCkgYW5kIGh2Y19zYmlfdHR5
X2dldCgpIGZ1bmN0aW9ucyBhcmUgYWxyZWFkeQp1cGRhdGVkIGluIExpbnVzJ3MgdHJlZS4gV2Ug
b25seSBuZWVkIHRvIGZpeCBodmNfc2JpX2RiY25fdHR5X3B1dCgpCmFuZCBodmNfc2JpX2RiY25f
dHR5X2dldCgpCgpQbGVhc2UgcmViYXNlIHRoaXMgZml4IHVwb24gTGludXgtNi44LXJjMSB3aGVu
ZXZlciB0aGF0IGlzIGF2YWlsYWJsZS4KCj4gIHsKPiAgICAgICAgIGludCBpLCBjOwo+Cj4gQEAg
LTQ0LDEyICs0NCwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGh2X29wcyBodmNfc2JpX3YwMV9v
cHMgPSB7Cj4gICAgICAgICAucHV0X2NoYXJzID0gaHZjX3NiaV90dHlfcHV0LAo+ICB9Owo+Cj4g
LXN0YXRpYyBpbnQgaHZjX3NiaV9kYmNuX3R0eV9wdXQodWludDMyX3QgdnRlcm1ubywgY29uc3Qg
Y2hhciAqYnVmLCBpbnQgY291bnQpCj4gK3N0YXRpYyBzc2l6ZV90IGh2Y19zYmlfZGJjbl90dHlf
cHV0KHVpbnQzMl90IHZ0ZXJtbm8sIGNvbnN0IHU4ICpidWYsIHNpemVfdCBjb3VudCkKPiAgewo+
ICAgICAgICAgcmV0dXJuIHNiaV9kZWJ1Z19jb25zb2xlX3dyaXRlKGJ1ZiwgY291bnQpOwo+ICB9
Cj4KPiAtc3RhdGljIGludCBodmNfc2JpX2RiY25fdHR5X2dldCh1aW50MzJfdCB2dGVybW5vLCBj
aGFyICpidWYsIGludCBjb3VudCkKPiArc3RhdGljIHNzaXplX3QgaHZjX3NiaV9kYmNuX3R0eV9n
ZXQodWludDMyX3QgdnRlcm1ubywgdTggKmJ1Ziwgc2l6ZV90IGNvdW50KQo+ICB7Cj4gICAgICAg
ICByZXR1cm4gc2JpX2RlYnVnX2NvbnNvbGVfcmVhZChidWYsIGNvdW50KTsKPiAgfQo+IC0tCj4g
Mi40My4wCj4KPgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
