Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493FBC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GI9wYVQ8BiMvaIHziCITMx7kI7GuXfTZcxf3xaR+e34=; b=D4nSBFZMsHwXs3
	7cxviaA9R3MDh4Md4Jj1kn7dNfD/fO3RcpmWoaJjdRqmcfsrBEM9AT+EfUS7804SV/4s+r7qD4NK5
	aWN2+aAJnF0i6hJufO8CCXuccGqYyCQJSKZk2/obkTPNkGmMK8+ddSWkXbNB5VavoKRWQkEvxKQJo
	kR8lFAPJDdh7s0iOKzLOZBnUYDie7R7VFrRQfGxyenrdqgjEEWhBeZSkxYcguo76A4HL/wGh8pr21
	8CjTk9yYRsDE6LPFlniOB7fBPI0RUVT3zrqjGOrPnXVl36/hfPpNcrPtjFmkbTRPm4X/+8YUsVNlf
	ECNQxqAymlA3gp/h7+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnpY-00000008lkH-40Z3;
	Mon, 22 Jul 2024 07:51:36 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnpH-00000008leh-0jEq
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 07:51:35 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6512866fa87so37534587b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 00:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721634676; x=1722239476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h1rdpHtM5r2wGthFP//vcSzbCxa7r9KaskW5fqNlPE=;
        b=bOyGLRAw3lwV/zkeWXgTNXG+9tCZ3Uxs50JjP0b8PxJR1pOK518aBwq9XCmy7rB7Ho
         q7vgiyte+I3gV9KJlophn98/7+Jhz9fYeaRpAtCZoUeUMiLnuZQ4OSV/SRJGJ33X9GZX
         UpWZ0lL4k0TvWcTD30AOjDC4Cu4y5JGkdHiYnk3daugbQaAjA133hytJeEDYdMYk4vrj
         VjkCia45+IJrjasgLYDfPX/u5DGNxaGeaTpPr8GGhDOQDJecRrDFRprq5hf4j/d/adrV
         ZeQQQ0PWWrqSGDLPM/+NqtrnlVm5dlVFa/jHpiVSlQpGQ3r3JvQQzIAOie/MF1uYUQPn
         pJsg==
X-Forwarded-Encrypted: i=1; AJvYcCXt0ErMhmkYNuvrDFjuRiYWLONz5Ro594hClFzQSebF4t5+gN86Y93+iVHaUH5gUEI3NgPDeALohnFlWV8JxwE9JMHHwCsbT0NH8SgwzGkF
X-Gm-Message-State: AOJu0Yy5sGL7EMhbUcOMiWHs3YNzkz5cKQt6RuHTl0sIvguBBSemDXb2
	7ktIniDsuokNg8XEvY/RREAohgf/NdVLHgGDd49dN4Y3ueX3L+Q0MkYapuZK
X-Google-Smtp-Source: AGHT+IFrVsULhBIiu/LywcuJToEgiEChaMEac+XtLDPkmXTI1o7afP/4/Nk7rHAsBX8B4x8+OwXLbQ==
X-Received: by 2002:a05:690c:358a:b0:62c:dcb2:a75b with SMTP id 00721157ae682-66a6a81061emr62169807b3.38.1721634676220;
        Mon, 22 Jul 2024 00:51:16 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6694f0e2831sm15794387b3.0.2024.07.22.00.51.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 00:51:16 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-65fe1239f12so32276977b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 00:51:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCr4ajlHG7fjuYo/NR4z60UnH/Z8kZUD/TBXY1cUFX8MdfwEXEaS6rhETIXD+kg8FPCiSbRNjRY7Ta8xC9iZv5kEdS+rlwO5EDgHzpVxzP
X-Received: by 2002:a05:690c:4502:b0:62d:45:4098 with SMTP id
 00721157ae682-66a68f76ef9mr60844277b3.26.1721634675694; Mon, 22 Jul 2024
 00:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240716204047.7649-1-cyrevolt@gmail.com> <87o76xf2x2.fsf@igel.home>
 <20240716-lushly-knoll-f0661ff5aea3@spud>
In-Reply-To: <20240716-lushly-knoll-f0661ff5aea3@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jul 2024 09:51:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUrYoKK8uD_3XdWNihStyw2JJa4DqoA7dT-0OKRGnfzQ@mail.gmail.com>
Message-ID: <CAMuHMdUUrYoKK8uD_3XdWNihStyw2JJa4DqoA7dT-0OKRGnfzQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv/purgatory: align riscv_kernel_entry
To: Conor Dooley <conor@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Daniel Maslowski <cyrevolt@googlemail.com>, 
	linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Daniel Maslowski <cyrevolt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_005119_231470_32D90D99 
X-CRM114-Status: GOOD (  16.44  )
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

SGkgQ29ub3IsCgpPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCAxMTozOOKAr1BNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMTE6
MjI6MDFQTSArMDIwMCwgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4gPiBPbiBKdWwgMTYgMjAyNCwg
RGFuaWVsIE1hc2xvd3NraSB3cm90ZToKPiA+Cj4gPiA+IFRoaXMgaGFzIGJlZW4gdGVzdGVkIG9u
IGEgSkg3MTEwIFNvQyB3aXRoIG9yZWJvb3QgYW5kIGl0cyBTQkkgZGVsZWdhdGluZwo+ID4KPiA+
IGNvcmVib290Pwo+Cj4gb3JlYm9vdCBpcyBjb3JlYm9vdCB3aXRob3V0IHRoZSBjIDopCgpBdCBm
aXJzdCBJIHRob3VnaHQgdGhpcyB3YXMganVzdCBhIGpva2UgYWJvdXQgYSB0eXBvLi4uCgo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9vcmVib290L29yZWJvb3QKCkdpdmVuIGl0J3MgbWFpbmx5IHdyaXR0
ZW4gaW4gUnVzdCwgcGVyaGFwcyBpdCBzaG91bGQgaGF2ZSBiZWVuIGNhbGxlZApyb3JlYm9vdD8g
T3Igcm9hcmJvb3Q/IDstKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
