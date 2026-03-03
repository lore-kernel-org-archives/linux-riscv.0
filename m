Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81E5EC0465
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvEcqEwmElx/B1qhNAmpwVO3e6HVoGFi+bTglDt4qLw=; b=iii4D30yDZ2iqQ
	CP8w9xqdmZlUlBlnDhJ7bEIBuTRsW74ndiRZ4tT0hygKYBWle36RILtRvTqzLycT7KSPByo1D/EBz
	1/Srr54g8kfL505yr3TBfhHqd8P9NXNgmiQ8IyZfWI2tYajeIW47HGvwxZ1p0u47J67Qk6+tndKGy
	Gjv4FhCUAJXUlEtm2yKojj+rw99V/sLNcPWA+MVYr7m6apRURLT+14M0vtAzLo7JX97/8s2WtZnfd
	EkZfhO7waPbMq2LB5PYdWZxL40HBek8USSPgpfC9qJ/fQFzjmC9lS1Q9ui60+DRzXvwVtcC80DcCF
	gFzZfeXvWCV1ScBklwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLnf-0000000EqNu-2Yvu;
	Tue, 03 Mar 2026 09:12:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLnd-0000000EqN8-1fnO
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 09:12:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-483770e0b25so46037125e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 01:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529135; x=1773133935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hy9xICo1EPoOGuMUjTJL88qGfqc1hJzlCloLKGWnZI=;
        b=d9Q2s3elOXsLJT/Y0sreTUJd9SijpueosTJalBQuZVgKf6rQrsEDGQi6s7CWE7K1XS
         MA+J/x9lFfxnw2HDPKtB3UyKkRV9V1/8+x6gSH3qVOvCAHKxZNaFf7fxsKghN2ti30AQ
         O4OZrbgJh+eQAMK4EEIb5JTVNU68QOy9rOAS4eulrxBCSudsFcwG4mCT/QSmg81V5Mm5
         8MOgRkNBm7MFuS2zFkgWY4JrICrXd0SKGxBdkTpvrXt8Ugx57jqaP/yajRhCBpr0BYZZ
         3kKY8XxjEe4gG2j+B79j3tftkiYqxd5vwonwXQBhHUUwSLFD9W/ydGbblrEacIDQ5kep
         4sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529135; x=1773133935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hy9xICo1EPoOGuMUjTJL88qGfqc1hJzlCloLKGWnZI=;
        b=t9c9hpVLxY2kQUEJOZewrsjB5cq1QWwUi6/Joll7VE+dV/1S9oEOdGi8xJHH39+0jZ
         ohYU0FXNtI+9A0OQyWJyMGEeo+eGYpPEFcSOjLmImUFdwWQVY9sJWU5D/u+OOJU2y3C6
         XjL5OkR/2z21xURPrnuf8WIWqyC4dniaF9ZJLfn5PhI/gJt0+QxflOolfpTCXRGqPHaQ
         wOZjykaZ181f1QTuRFGTeeJM09TTIpPoYs8b4PuOMQRlcSjJIiQ7C/Dhmz8deajGFkpd
         relCkM+klR6Oy2z048WL+wqo6dz4ZDNl0r/D6xyWngY6gPUESJjUa4bRTBq4RsqyjPkq
         +Ahg==
X-Forwarded-Encrypted: i=1; AJvYcCWuthMV/Ua2ik5qAaU1BbRkJIWiSgVnmIfdpB0v7JNniDarlFEf0ZxP1nCY+VVNm0CuHBzIv7JEnyYVmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/h4yBdgoiLswKMatio1Cf3F4e5UVanhyzAMeSYDK9JW1qjP0Z
	L/Izpj82UeSigIHL0rGg3wh1uf0p4fgHMkdgObRhOMwT3BlW5QwbVuOV
X-Gm-Gg: ATEYQzye2yJaJsT1s1ymWvpGyoKCPSvwXLuJqz1imqxxtL4M21Bamc3AFKNbzwcMq2v
	DfD0V35vNMDA3oUBDcQcLbCegdzdCYtTGLu54b4dFhbs4wGhVt+ZSm3N0W4POGs/a25KhkpLnr8
	EBCopxvaQOB5nSPkX2OX9GHnSkp5QY9oU+8FQ3dQ+S8gtL9rnt5rWDL/lzxe6fpzv5WxgSk9vtF
	C2nkcSE8lWeY6medIYvp95RfNQ6NRMcuzZ/zOu8fHTNa1Iy+pTR/d21FmlfmxfSz8nyN6OI2yZm
	GlAfzupJjWKQ0Mg75nNInRx6CeScNSYbg2UvZ0kpPg2sewLxZvSZwdkqQ5McNnj6ov2hUSh4rtj
	M2SJn5G5fU92uXQh17LaHGm9HiRl1+t2C0+ttty0rNv/aYHVzBYWZUfTsE16R1HhEIjRMj2BEBk
	+A6e3UN5bKPK2e2tQqLY5h9kC7a1l1iMGqXFWwLowBCxPnj+Qn35B+RTfkxArPvIr2
X-Received: by 2002:a05:600c:3542:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-483c9bc5596mr280473755e9.2.1772529134880;
        Tue, 03 Mar 2026 01:12:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48512692c14sm13045615e9.7.2026.03.03.01.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:12:14 -0800 (PST)
Date: Tue, 3 Mar 2026 09:12:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner
 <brauner@kernel.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara
 <jack@suse.cz>, Julia Lawall <Julia.Lawall@inria.fr>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix
 <nicolas.palix@imag.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Russell King
 <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, x86@kernel.org, Kees Cook <kees@kernel.org>,
 akpm@linux-foundation.org
Subject: Re: [PATCH v2 4/5] uaccess: Disable -Wshadow in
 __scoped_user_access()
Message-ID: <20260303091212.620241c8@pumpkin>
In-Reply-To: <e54368a9-9118-476d-b999-bcd60847f0ce@kernel.org>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
	<20260302132755.1475451-5-david.laight.linux@gmail.com>
	<e54368a9-9118-476d-b999-bcd60847f0ce@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_011217_454000_C4CAA1BA 
X-CRM114-Status: GOOD (  13.35  )
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

T24gTW9uLCAyIE1hciAyMDI2IDE2OjAwOjI2ICswMTAwCiJDaHJpc3RvcGhlIExlcm95IChDUyBH
Uk9VUCkiIDxjaGxlcm95QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBMZSAwMi8wMy8yMDI2IMOgIDE0
OjI3LCBkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tIGEgw6ljcml0wqA6Cj4gPiBGcm9tOiBE
YXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+Cj4gPiAKPiA+IC1Xc2hh
ZG93IGlzIGVuYWJsZWQgYnkgVz0yIGJ1aWxkcyBhbmQgX19zY29wZWRfdXNlcl9hY2Nlc3MoKSBx
dWl0ZQo+ID4gZGVsaWJlcmF0ZWx5IGNyZWF0ZXMgYSAnY29uc3QnIHNoYWRvdyBvZiB0aGUgJ3Vz
ZXInIGFkZHJlc3MgdGhhdAo+ID4gcmVmZXJlbmNlcyBhICdndWFyZCBwYWdlJyB3aGVuIHRoZSBh
cHBsaWNhdGlvbiBwYXNzZXMgYSBrZXJuZWwgcG9pbnRlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiAgCj4gCj4gVGhl
cmUgaXMgYSBwcm9ibGVtIHdpdGggdGhpcyBwYXRjaDoKCihiYWRseSBsaW5lLXdyYXBwZWQgZXJy
b3JzIGRlbGV0ZWQpCgpJdCBzZWVtcyB0byBuZWVkIGdjYyAxMi4KKFNvIExpbnVzIGlzIGluIGx1
Y2suKQoKUHJpb3IgdG8gZ2NjIDEyIHRoZSAjcHJhZ21hIGdlbmVyYXRlZCBieSBfUHJhZ21hKCkg
YWN0IGFzIHRoZQpjb250cm9sbGVkIHN0YXRlbWVudCBvZiB0aGUgZm9yICgpIGxvb3AuCgpUcnlp
bmcgdG8gcHV0IHRoZSBfUHJhZ21hKCkgaW5zaWRlIHRoZSBmb3Igc3RhdGVtZW50IGRvZXNuJ3Qg
d29yayBhdCBhbGwuCgoJRGF2aWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
