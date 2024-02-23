Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9140C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 02:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z8VSfO6Th2c4lIy2J/Xgy/0eiUiMhSDQFJnaTBaoLiA=; b=A733wsujbbz2VH5JGPapqI7Aga
	LHgHmqTr56hQGJ9Ck+wYH/ke/xcILWUSFpPTrMrYkye9+XJOaoPvrgqO6pm0NdFeF6QPj6J2yHXL7
	Qb4wvlPvH4JnVrjAmMbOfMKY+BfMsCJhHku9lIOJFkwHa75F3FA6MqvtGSbmZO9/4v477tSQZdfIJ
	My4r7nmSX+EhXChuJ81/fE2SJ+trsWMSr/VyW0VEeqtR9Chfohe0ATS9g6YahPLKeM25P95k+kCtW
	xg+7WjiOFYkUl1UTABGEisRCJv8FKIfgVqQUJEX1QQe+3aXOukUgHGDdFnlEyXhxp665oICGcC9vo
	4N6jte4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdLFf-00000007Wwg-10Ul;
	Fri, 23 Feb 2024 02:25:28 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdLFR-00000007Wqj-41uK
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 02:25:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e471caaa71so244502b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 18:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708655103; x=1709259903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvpsMbjqPU4UR9+5wWiHmUmCTwM1PMtLjxdFJ8jAgDo=;
        b=F+x7Y9AAUPoPfu8aqlnKOJsqX9Ddl2y74yEXvmN2vJs+83qlDmuDzHuf1ZcaDFdYS+
         QgyuDSiDedqniUPURG1YK0FatZdhbwiuZEDb+z9c01GDOYx+4avGkb9wzlnP4+0C5186
         J25EZMe8e40YgmzDh9acjSUtT2Sgb7MJLJokuY7t0BebamMROhs4jPAlev+NztuFXLRA
         aJIa3aOeLzoejUwyv+WcO5DbXLC89Wlp1Ci1Wh2u5t4uHvU7QGyfiY9RoOyTQjykUaMR
         XR9GKC65pnbkLIKQ0WH+zSw4RQh6ezYRPMDmWDAbmt+kMLyViuhf54gAhQ9ihrY8VrIi
         dfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708655103; x=1709259903;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvpsMbjqPU4UR9+5wWiHmUmCTwM1PMtLjxdFJ8jAgDo=;
        b=pej0fTh2qlCXxNHeabQ3qNQaKuHu87XhIU6/5Lcc0b435KW3TSMSHNjAaslGK1eJWW
         5QnwGDQTIwNeZ9AfJUfrXBRTPPJqdWwvkktcnRFluYr4KW2ScQUePsqef/mQSJ2bUoJi
         uk19RaKh+sPCtQtePGErnIX2nD5SE5q28U/8j9PopRVlvU9OF0rdovacQoKBcAvxR0A3
         vr7bMxryhCX2akTPQDfKnAxyyqAQSwm9HbCVhBzHRO4mBkWAYeuw8EbNbnlqb/PSW2Uw
         3CRjWQ9x3nviUubnNItnfES8XkUdjl1g+B57CC0txCpdssoP2Y6gHRgqD+jJ9akWPLME
         bq7w==
X-Forwarded-Encrypted: i=1; AJvYcCUkfCpeDZ8G5DE2btJ49sGM5xFt82hIr/y5AGvXDziOtPHivoEVM+t6jdv6OMoSy2YhYR99wWNzIdcZeEp3yY1vOV+TWm+MHi1jrjRAz1YV
X-Gm-Message-State: AOJu0YyV64PVDmTgDyIitm7xLKkAeT/AGzod1doETiP8auO8XbZbz5uK
	rTm6/TUF2qbKuBqGTMrOO9o6A9CmbxNSRGcY86ZqREEf2eR2FJwNSusfWiPQJ80=
X-Google-Smtp-Source: AGHT+IGXzUvLuIBqAH6IpfTDaGkH8Ve8NCjMdXcR7MwfrFmhzj20/am5IT7QTj11UMAitUQcB9a5gw==
X-Received: by 2002:a05:6a20:e607:b0:19e:a353:81b0 with SMTP id my7-20020a056a20e60700b0019ea35381b0mr734946pzb.11.1708655102714;
        Thu, 22 Feb 2024 18:25:02 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:902e:6d00:6c11:e63b])
        by smtp.gmail.com with ESMTPSA id mf8-20020a170902fc8800b001d9fc6cb5f2sm10645873plb.203.2024.02.22.18.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 18:25:02 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
 <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 33/38] kselftest/arm64: Add a GCS test program built
 with the system libc
In-reply-to: <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
Date: Thu, 22 Feb 2024 23:24:59 -0300
Message-ID: <87ttlzsyro.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_182514_057961_A102D292 
X-CRM114-Status: GOOD (  17.64  )
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

Ck1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBPbiBNb24sIEZlYiAx
OSwgMjAyNCBhdCAxMToxNTo1N1BNIC0wMzAwLCBUaGlhZ28gSnVuZyBCYXVlcm1hbm4gd3JvdGU6
Cj4KPj4gVGhlIG9ubHkgaXNzdWUgYXMgY2FuIGJlIHNlZW4gYWJvdmUgaXMgdGhhdCB0aGUgY2Fu
X2NhbGxfZnVuY3Rpb24gdGVzdAo+PiBpcyBmYWlsaW5nLiBUaGUgY2hpbGQgaXMgZ2V0dGluZyBh
IEdDUyBTZWdtZW50YXRpb24gZmF1bHQgd2hlbiByZXR1cm5pbmcKPj4gZnJvbSBmb3JrKCkuCj4K
Pj4gSSB0cmllZCBkZWJ1Z2dpbmcgaXQgd2l0aCBHREIsIGJ1dCBJIGRvbid0IHNlZSB3aGF0J3Mg
d3Jvbmcgc2luY2UgdGhlCj4+IGFkZHJlc3MgaW4gTFIgbWF0Y2hlcyB0aGUgZmlyc3QgZW50cnkg
aW4gR0NTUFIuIEhlcmUgaXMgdGhlCj4+IGRlYnVnIHNlc3Npb246Cj4KPiBJIGJlbGlldmUgYmFz
ZWQgb24gcHJpb3IgZGlzY3Vzc2lvbnMgdGhhdCB5b3UncmUgcnVubmluZyB0aGlzIHVzaW5nCj4g
c2hyaW5rd3JhcCAtIGNhbiB5b3UgY29uZmlybSBleGFjdGx5IGhvdyBwbGVhc2UsIGluY2x1ZGlu
ZyB0aGluZ3MgbGlrZQo+IHdoaWNoIGZpcm13YXJlIGNvbmZpZ3VyYXRpb24geW91J3JlIHVzaW5n
PyAgSSdtIHVzaW5nIGN1cnJlbnQgZ2l0IHdpdGgKPgo+ICAgc2hyaW5rd3JhcCBydW4gXAo+ICAg
ICAgICAgLS1ydHZhciBLRVJORUw9YXJjaC9hcm02NC9ib290L0ltYWdlIFwKPiAgICAgICAgIC0t
cnR2YXIgUk9PVEZTPSR7Uk9PVEZTfSBcCj4gICAgICAgICAtLXJ0dmFyIENNRExJTkU9IiR7Q01E
TElORX0iIFwKPiAgICAgICAgIC0tb3ZlcmxheT1hcmNoL3Y5LjQueWFtbCBucy1lZGsyLnlhbWwK
Pgo+IGFuZCBhIGxvY2FsbHkgYnVpbHQgeW9jdG8gYW5kIGV2ZXJ5dGhpbmcgc2VlbXMgcGVyZmVj
dGx5IGhhcHB5LgoKWWVzLCB0aGlzIGlzIGhvdyBJJ20gcnVubmluZyBpdDoKCiAgQ01ETElORT0i
SW1hZ2UgZHRiPWZkdC5kdGIgY29uc29sZT10dHlBTUEwIGVhcmx5Y29uPXBsMDExLDB4MWMwOTAw
MDAgcm9vdD0vZGV2L3ZkYTIgaXA9ZGhjcCBtYXhjcHVzPTEiCgogIHNocmlua3dyYXAgcnVuIFwK
ICAgICAgLS1ydHZhcj1LRVJORUw9SW1hZ2UtZ2NzLXY4LXY2LjctcmM0LTE0NzQzLWdhNTUxYTdk
N2FmOTMgXAogICAgICAtLXJ0dmFyPVJPT1RGUz0kSE9NRS9WTXMvdWJ1bnR1LWFhcmNoNjQuaW1n
IFwKICAgICAgLS1ydHZhcj1DTURMSU5FPSIkQ01ETElORSIgXAogICAgICBucy1lZGsyLnlhbWwK
CkkgcmFuIHRoZSBmb2xsb3dpbmcgdG8gc2V0IHVwIHRoZSBGVlAgVk06CgokIHNocmlua3dyYXAg
YnVpbGQgLS1vdmVybGF5PWFyY2gvdjkuNC55YW1sIG5zLWVkazIueWFtbAoKTXkgcm9vdGZzIGlz
IFVidW50dSAyMi4wNC4zLiBJbiBjYXNlIGl0J3MgdXNlZnVsLCBteSBrZXJuZWwgY29uZmlnIGlz
CmhlcmU6CgpodHRwczovL3Blb3BsZS5saW5hcm8ub3JnL350aGlhZ28uYmF1ZXJtYW5uL2djcy9j
b25maWctdjYuOC4wLXJjMgoKSSB0cmllZCByZW1vdmluZyAibWF4Y3B1cz0xIiBmcm9tIHRoZSBr
ZXJuZWwgY29tbWFuZCBsaW5lLCBidXQgaXQgbWFkZQpubyBkaWZmZXJlbmNlLgoKSSBhbHNvIHRy
aWVkIHJlc2V0dGluZyBteSBTaHJpbmt3cmFwIHNldHVwIGFuZCBzdGFydGluZyBmcm9tIHNjcmF0
Y2gsCmJ1dCBpdCBhbHNvIG1hZGUgbm8gZGlmZmVyZW5jZTogSSBqdXN0IHB1bGxlZCBmcm9tIHRo
ZSBjdXJyZW50IG1haW4KYnJhbmNoIGFuZCByZW1vdmVkIFNocmlua3dyYXAncyBidWlsZCBhbmQg
cGFja2FnZSBkaXJlY3RvcmllcywgYW5kIGFsc28KcmVtb3ZlZCBhbGwgRG9ja2VyIGltYWdlcyBh
bmQgdGhlIG9uZSBjb250YWluZXIgSSBoYWQuCgpIZXJlIGFyZSBzb21lIGZpcm13YXJlIHZlcnNp
b25zIGZyb20gZWFybHkgYm9vdDoKCiAgTk9USUNFOiAgQm9vdGluZyBUcnVzdGVkIEZpcm13YXJl
CiAgTk9USUNFOiAgQkwxOiB2Mi4xMC4wICAgKHJlbGVhc2UpOnYyLjEwLjAKICBOT1RJQ0U6ICBC
TDE6IEJ1aWx0IDogMDA6MDc6MjksIEZlYiAyMyAyMDI0CiAgICAg4ouuCiAgTk9USUNFOiAgQkwy
OiB2Mi4xMC4wICAgKHJlbGVhc2UpOnYyLjEwLjAKICBOT1RJQ0U6ICBCTDI6IEJ1aWx0IDogMDA6
MDc6MjksIEZlYiAyMyAyMDI0CiAgICAg4ouuCiAgTk9USUNFOiAgQkwzMTogdjIuMTAuMCAgKHJl
bGVhc2UpOnYyLjEwLjAKICBOT1RJQ0U6ICBCTDMxOiBCdWlsdCA6IDAwOjA3OjI5LCBGZWIgMjMg
MjAyNAogICAgIOKLrgogIFsgIGVkazIgXSBVRUZJIGZpcm13YXJlICh2ZXJzaW9uICBidWlsdCBh
dCAwMDowNjo1NSBvbiBGZWIgMjMgMjAyNCkKICBQcmVzcyBFU0NBUEUgZm9yIGJvb3Qgb3B0aW9u
cyAuLi4uLi4uLi4uLlVFRkkgSW50ZXJhY3RpdmUgU2hlbGwgdjIuMgogIEVESyBJSQogIFVFRkkg
djIuNzAgKEVESyBJSSwgMHgwMDAxMDAwMCkKCkl0IGxvb2tzIGxpa2Ugb3VyIG1haW4gZGlmZmVy
ZW5jZXMgYXJlIHRoZSBrZXJuZWwgY29uZmlnIGFuZCB0aGUgZGlzdHJvLgoKLS0gClRoaWFnbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
