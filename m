Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAD6C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVFA3828sTaW7YLhUDQ3+keog5nH8Mhn3MMBJp6+0/0=; b=M4qN2kmoO0T4E4
	vWiqBIbCtHwRqxHX1BtdVGs30WyjVqi5UEWxx0JAAsK+W7Ie1PZCVLmfJ9zn4XOGchW9xCyaBMyj3
	NTnfRcrjaAJTmM7qBDZNxMw3Kwb4ln3lm2fQy0e/QOQMCi0zDbUZlNDVj3Wb2w9BOunX01rUqsXDx
	ugAq4XRe5dnNe903T1KK0ZeDvq4foeeefFRYqtxJxll/nd08LZSTn+bfHQvumhnMFcI5ENixzsNXe
	Ct0JbuGu29LAc/9CbwSaAjE3gLx5LDJjfqNam/MvPiQ8qA4cxPpMUDxvrQxCBqlsH89/fOawiyEQ8
	RvsBjn2NW3aa16Kbq6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIvX-008M5r-09;
	Fri, 31 Mar 2023 17:52:39 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIvU-008M3v-0n
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 17:52:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id h25so29941028lfv.6
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 10:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680285151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8e80o4Gln79rBts1nJMY6npgXhVyP7I9l6v7qOmueE=;
        b=ZDMMsOOv7bfUQdz6tTuzYk4eoWNfPOynWKo7prMzzERpOnSYfO3iJWqKNRl2biNzxR
         plXcDrJMH0etJstWAhURI6h0Emo3yos5KYLYAC5vQk32L5qJ2KHiODceSYJAYB5tKh1S
         EpVdWD70PM98V9dohJZAtonBCMekXxlMHzt9y4ChHGts/uWsdHO13bE1HXB0DI+kBETj
         1LHZl8n2ojURi/ya23GTnBBaAYu3g0YeJiDLEaGLfnfbfbkiRr5k2n56pxm4c5f4SgBj
         BpOch70J30vIOEb+KgVgSul4thXKDM8Bsyj6RnTKk49Qe1Z7tAdbBUNiMqn277oxM0Em
         N6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8e80o4Gln79rBts1nJMY6npgXhVyP7I9l6v7qOmueE=;
        b=rGIVUbLNJmrKOgoVD29epQJ/aDXrOxszGBIiUOgzB7zcGxfoXVAfmtEa6YFhJozMJp
         Xy8ll9c08eEQnQ3cTARqql+AWzR52GRe3amA/hPkGcRwc4hjbT6ZQaJF7c8LHMwt2N9x
         HULTWZxW/+cJhUrkar3OFdInSkfQxYM2S/oNX/dmAu+TH37g9K5K5plYtqWbzSNXqxVL
         dGfO6txZ/w/Qow3n0dcxp++6mF6pil4nqBmfnxgqGxv3j5de0QJXDUPaSFhk0ep969TB
         WrCqf/ijhyqXSy3SGhPbhwb23wAsizvKm6c8PLeZ/R5z3MujQ/tS6Kb+5G6njeVdiNpa
         r8lg==
X-Gm-Message-State: AAQBX9faFE58yhsCCX03T6oHOWB6wsROx7FPIjSoXyKj/ulxn2chsuNK
	8sI/9VJYHaamVKDlZ2sBFgEyk7SrnVzbkt0uoaT5EQ==
X-Google-Smtp-Source: AKy350a+fqJATU7e9z9fJ7w3yTsauVEcnZ7kHiX0Y2joMw8UR3mkd5AYXqrb8iX+RpDnRkPGHb3IeuFazPqEgQ1kl8s=
X-Received: by 2002:a05:6512:23a3:b0:4d8:86c2:75ea with SMTP id
 c35-20020a05651223a300b004d886c275eamr4807421lfv.3.1680285151328; Fri, 31 Mar
 2023 10:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230221190858.3159617-1-evan@rivosinc.com> <20230221190858.3159617-3-evan@rivosinc.com>
 <605fb2fd-bda2-4922-92bf-e3e416d54398@app.fastmail.com> <CALs-HstAKtvORKwRWeh97SuAuYR61aiR-3jA2_0JCZGAJXVHbg@mail.gmail.com>
 <d91ffb1e-261b-4b2f-a78f-f2846600a3e7@app.fastmail.com>
In-Reply-To: <d91ffb1e-261b-4b2f-a78f-f2846600a3e7@app.fastmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 31 Mar 2023 10:51:55 -0700
Message-ID: <CALs-HsuiyocyK+RW_5O3JniOE7ROHHDJ4K=+6NZRzGad7wJpMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] RISC-V: Add a syscall for HW probing
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105236_301041_8AD287BF 
X-CRM114-Status: GOOD (  44.04  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, "Conor.Dooley" <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Vineet Gupta <vineetg@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCk9uIEZyaSwgTWFyIDMxLCAyMDIzIGF0IDY6MjHigK9BTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDMwLCAyMDIzLCBhdCAyMDoz
MCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIFRodSwgRmViIDIzLCAyMDIzIGF0IDI6MDbigK9B
TSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiA+PiA+ICsgICAgbG9uZyBz
eXNfcmlzY3ZfaHdwcm9iZShzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpcnMsIHNpemVfdAo+ID4+
ID4gcGFpcl9jb3VudCwKPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qg
Y3B1X2NvdW50LCBjcHVfc2V0X3QgKmNwdXMsCj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4gPj4KPiA+PiBUaGUgY3B1IHNldCBhcmd1bWVu
dCB3b3JyaWVzIG1lIG1vcmU6IHRoZXJlIHNob3VsZCBuZXZlciBiZSBhCj4gPj4gbmVlZCB0byBv
cHRpbWl6ZSBmb3IgYnJva2VuIGhhcmR3YXJlIHRoYXQgaGFzIGFuIGFzeW1tZXRyaWMgc2V0Cj4g
Pj4gb2YgZmVhdHVyZXMuIEp1c3QgbGV0IHRoZSBrZXJuZWwgZmlndXJlIG91dCB0aGUgbWluaW11
bSBzZXQKPiA+PiBvZiBmZWF0dXJlcyB0aGF0IHdvcmtzIGFjcm9zcyBhbGwgQ1BVcyBhbmQgcmVw
b3J0IHRoYXQgbGlrZSB3ZQo+ID4+IGRvIHdpdGggSFdDQVAuIElmIHRoZXJlIGlzIGEgU29DIHRo
YXQgaXMgc28gYnJva2VuIHRoYXQgaXQgaGFzCj4gPj4gaW1wb3J0YW50IGZlYXR1cmVzIG9uIGEg
c3Vic2V0IG9mIGNvcmVzIHRoYXQgc29tZSB1c2VyIG1pZ2h0Cj4gPj4gYWN0dWFsbHkgd2FudCB0
byByZWx5IG9uLCB0aGVuIGhhdmUgdGhlbSBnbyB0aHJvdWdoIHRoZSBzbG93Cj4gPj4gc3lzZnMg
aW50ZXJmYWNlIGZvciBwcm9iaW5nIHRoZSBDUFVzIGluZGlkdWFsbHksIGJ1dCBkb24ndCBtYWtl
Cj4gPj4gdGhlIGJyb2tlbiBjYXNlIGVhc2llciBhdCB0aGUgZXhwZW5zZSBvZiBub3JtYWwgdXNl
cnMgdGhhdAo+ID4+IHJ1biBvbiB3b3JraW5nIGhhcmR3YXJlLgo+ID4KPiA+IEknbSBub3Qgc28g
c3VyZS4gV2hpbGUgSSBhZ3JlZSB3aXRoIHlvdSBmb3IgbWFqb3IgY2xhc3NlcyBvZiBmZWF0dXJl
cwo+ID4gKGVnIG9uZSBDUFUgaGFzIGZsb2F0aW5nIHBvaW50IHN1cHBvcnQgYnV0IGFub3RoZXIg
ZG9lcyBub3QpLCBJIGV4cGVjdAo+ID4gdGhlc2UgYml0cyB0byBjb250YWluIG1vcmUgc3VidGxl
IGRldGFpbHMgYXMgd2VsbCwgd2hpY2ggbWlnaHQgdmFyeQo+ID4gYWNyb3NzIGFzeW1tZXRyaWMg
aW1wbGVtZW50YXRpb25zIHdpdGhvdXQgYnJlYWtpbmcgQUJJIGNvbXBhdGliaWxpdHkKPiA+IHBl
ci1zZS4gTWF5YmUgc29tZSB2ZW5kb3IgaGFzIGltcGxlbWVudGVkIGV4b3RpYyB2aWRlbyBkZWNv
ZGluZwo+ID4gYWNjZWxlcmF0aW9uIGluc3RydWN0aW9ucyB0aGF0IG9ubHkgd29yayBvbiB0aGUg
YmlnIGNvcmUuIE9yIG1heWJlIHRoZQo+ID4gYmlnIGNvcmVzIHN1cHBvcnQgdjMuMSBvZiBzb21l
IGV4dGVuc2lvbiAod2hlcmUgY2VydGFpbiB0aGluZ3MgcnVuCj4gPiBmYXN0ZXIpLCBidXQgdGhl
IGxpdHRsZSBjb3JlcyBvbmx5IGhhdmUgdjMuMCwgd2hlcmUgaXQncyBhIGxpdHRsZQo+ID4gc2xv
d2VyLiBDZXJ0YWluIGFwcHMgd291bGQgbGlrZWx5IHdhbnQgdG8ga25vdyB0aGVzZSB0aGluZ3Mg
c28gdGhleQo+ID4gY2FuIGFsbG9jYXRlIHRoZWlyIHdvcmsgb3B0aW1hbGx5IGFjcm9zcyBjb3Jl
cy4KPgo+IERvIHlvdSBoYXZlIGEgc3BlY2lmaWMgZmVhdHVyZSBpbiBtaW5kIHdoZXJlIGhhcmR3
YXJlIHdvdWxkIGJlCj4gaW50ZW50aW9uYWxseSBkZXNpZ25lZCB0aGlzIHdheT8gSSBzdGlsbCBj
YW4ndCBjb21lIHVwIHdpdGggYQo+IHNjZW5hcmlvIHdoZXJlIHRoaXMgd291bGQgYWN0dWFsbHkg
d29yayBpbiBwcmFjdGljZSwgYXMgaGF2aW5nCj4gYXN5bW1ldHJpYyBmZWF0dXJlcyBpcyBpbmNv
bXBhdGlibGUgd2l0aCBzbyBtYW55IG90aGVyIHRoaW5ncwo+IHdlIG5vcm1hbGx5IGRvLgoKSXNu
J3QgdGhpcyBhbHJlYWR5IGEgcmVhbGl0eSwgd2l0aCB0aGUgQVJNIGZvbGtzIGJ1aWxkaW5nIHN5
c3RlbXMKd2hlcmUgb25seSBzb21lIGNvcmVzIGNhbiBydW4gYXJtMzIgY29kZSwgYW5kIHRoZSBy
ZXN0IGFyZSBhYXJjaDY0Cm9ubHk/Cmh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy84MzgzMzkvCgpU
aGUgd2F5IEkgc2VlIGl0LCBpdCdzIGdvaW5nIHRvIGJlIGNsb3NlIHRvIGltcG9zc2libGUgdG8g
X25vdF8gZGVzaWduCmhhcmR3YXJlIHRoaXMgd2F5LiBBcyBsb25nIGFzIGRpZSBhcmVhIGFuZCBl
bmVyZ3kgZWZmaWNpZW5jeSBhcmUgYQpjb25zdHJhaW50LCBiaWcuTElUVExFIGFuZCBvdGhlciBh
c3ltbWV0cmljIGFyY2hpdGVjdHVyZXMgc2VlbQppbmV2aXRhYmxlLiBHaXZlbiB0aGlzIGludGVy
ZmFjZSBpcyBzb3J0IG9mIGEgc29mdHdhcmUgY3B1aWQKaW5zdHJ1Y3Rpb24sIHByZXRlbmRpbmcg
dGhlcmUgd29uJ3QgYmUgZGlmZmVyZW5jZXMgYmV0d2VlbiBjb3JlcyBmZWVscwpsaWtlIGFuIGlu
Y29tcGxldGUgQVBJLgoKPgo+IC0gSW4gYSB2aXJ0dWFsIG1hY2hpbmUsIHRoZSBWQ1BVIHRlbnRz
IHRvIGdldCBzY2hlZHVsZWQgYXJiaXRyYXJpbHkKPiAgIHRvIHBoeXNpY2FsIENQVXMsIHNvIHNl
dHRpbmcgYWZmaW5pdHkgaW4gYSBndWVzdCB3b24ndCBhY3R1YWxseQo+ICAgZ3VhcmFudGVlIHRo
YXQgdGhlIGZlYXR1cmUgaXMgc3RpbGwgdGhlcmUuCgpTdXJlLCBidXQgSSB3b3VsZG4ndCBleHBl
Y3QgdGhlIGd1ZXN0IHRvIGJlIGFibGUgdG8gb2JzZXJ2ZSBwaHlzaWNhbApwcm9wZXJ0aWVzIGZy
b20gYSB0cmFuc2llbnQgaG9zdCBDUFUgKEknZCBjb25zaWRlciB0aGF0IGEgYnVnKS4gSSdkCmV4
cGVjdCBlaXRoZXIgdGhlIFZDUFUgaXMgcGlubmVkIHRvIGEgcGh5c2ljYWwgQ1BVIHdpdGggbm8g
Y2hhbmNlIG9mCm1pZ3JhdGlvbiwgaW4gd2hpY2ggY2FzZSB5b3UgbWlnaHQgcmVhc29uYWJseSBw
bHVtYiBkb3duIHNvbWUgcGh5c2ljYWwKcHJvcGVydGllcyB0byB0aGUgZ3Vlc3QsIG9yIHRoZSBn
dWVzdCBzZWVzIGEgd2F0ZXJlZCBkb3duIGdlbmVyaWMgQ1BVCmNvbnRhaW5pbmcgdGhlIGxlYXN0
IGNvbW1vbiBkZW5vbWluYXRvciBvZiBmZWF0dXJlcy4KCj4KPiAtIFVzaW5nIGEgQ1BVIGZlYXR1
cmUgZnJvbSBsaWJyYXJ5IGNvZGUgaXMgcHJhY3RpY2FsbHkgaW1wb3NzaWJsZQo+ICAgaWYgaXQg
cmVxdWlyZXMgc3BlY2lhbCBDUFUgYWZmaW5pdHksIGFzIHRoZSBhcHBsaWNhdGlvbiBtYXkKPiAg
IGFscmVhZHkgYmUgc3RhcnRlZCBvbiBzcGVjaWZpYyBDUFVzIGZvciBhbm90aGVyIHJlYXNvbiwg
YW5kCj4gICBoYXZpbmcgYSBsaWJyYXJ5IGNhbGwgc2NoZWRfc2V0YWZmaW5pdHkgd2lsbCBjb25m
bGljdCB3aXRoIHRob3NlLgo+Cj4gLSBFdmVuIGluIHRoZSBzaW1wbGVzdCBjYXNlIG9mIGhhdmlu
ZyBhIHN0YW5kYWxvbmUgYXBwbGljYXRpb24KPiAgIHdpdGhvdXQgYW55IHNoYXJlZCBsaWJyYXJp
ZXMgdHJ5IHRvIHBpY2sgYSBzZW5zaWJsZSBDUFUgdG8KPiAgIHJ1biBvbiBpcyBoYXJkIHRvIGRv
IGluIGEgZ2VuZXJpYyB3YXksIGFzIGl0IHdvdWxkIG5lZWQgdG8KPiAgIHdlaWdoIGF2YWlsYWJp
bHR5IG9mIGZlYXR1cmVzIG9uIGNlcnRhaW4gY29yZXMgYWdhaW5zdCB0aGUKPiAgIG51bWJlciBv
ZiBjb3JlcyB3aXRoIG9yIHdpdGhvdXQgdGhlIGZlYXR1cmUgYW5kIHRoZWlyIGN1cnJlbnQKPiAg
IGFuZCBleHBlY3RlZCBzeXN0ZW0gbG9hZC4KCkluIENocm9tZU9TIGF0IGxlYXN0LCB3ZSBzdHJ1
Z2dsZWQgYSBsb3Qgd2l0aCBjaHJvbWUgZ2V0dGluZyBzY2hlZHVsZWQKb24gdGhlIGJpZyB2cyBs
aXR0bGUgY29yZXMgb24gc29tZSBBUk0gcGxhdGZvcm1zLCBhcyB3ZSdkIGdldCB0aGluZ3MKbGlr
ZSBkcm9wcGVkIHZpZGVvIGZyYW1lcyBpZiB3ZSBzdGF5ZWQgc3R1Y2sgb24gdGhlIHdyb25nIGNv
cmVzLiBJCnRoaW5rIHdlIG1hbmFnZWQgdG8gc29sdmUgdGhhdCB3aXRoIHVjbGFtcCwgYnV0IGFn
YWluIHRoYXQKYWNrbm93bGVkZ2VzIHRoYXQgdGhlcmUgYXJlIGRpZmZlcmVuY2VzIGJldHdlZW4g
Y29yZXMsIHdoaWNoIEkgdGhpbmsKanVzdGlmaWVzIHRoZSBjcHVzZXQgcGFyYW1ldGVyIHRvIGEg
Y3B1IGZlYXR1cmUgaW50ZXJmYWNlIGxpa2UgdGhpcy4KCj4KPiBBcyBsb25nIGFzIHRoZXJlIGlz
bid0IGEgc3BlY2lmaWMgcmVxdWlyZW1lbnQsIEkgdGhpbmsgaXQncyBiZXR0ZXIKPiB0byBub3Qg
YWN0dWFsbHkgZW5jb3VyYWdlIGhhcmR3YXJlIHZlbmRvcnMgdG8gaW1wbGVtZW50IGRlc2lnbnMK
PiBsaWtlIHRoYXQsIG9yIGF0IGxlYXN0IG5vdCBkZXNpZ25pbmcgYW4gaW50ZXJmYWNlIHRvIG1h
a2UgZ2V0dGluZwo+IHRoaXMgaW5mb3JtYXRpb24gYSBmZXcgbWljcm9zZWNvbmRzIGZhc3RlciB0
aGF0IHdoYXQgYWxyZWFkeQo+IGV4aXN0cy4KCkFzIHRoaXMgaXMgQUJJLCB0aGVyZSBpcyBhIGJp
dCBvZiAiY3J5c3RhbCBiYWxsIGdhemluZyIgSSdtIGRvaW5nLAp0aG91Z2ggSSBob3BlIEkndmUg
YmFja2VkIGl0IHVwIHdpdGggZW5vdWdoIHRvIHNob3cgaXQncyBub3QgYQpjb21wbGV0ZWx5IHdp
bGQgcGFyYW1ldGVyLgoKLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
