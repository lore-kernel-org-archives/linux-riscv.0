Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6B5C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZEzoin9VfO5Fa3ziru161RuKBLXA+xtglULkcbP9jo=; b=aapL3fGVu1FcqX
	XWXiQ5kzdGPIp0yio2huCCjcGyUqKXGFIlZv5PYO8/nkPasidCOu0fd6S8YGVhi0gviVLe5N4sGAk
	z9JHvmrW4LMFVxdQMN8dx8IaxgPzHrSAk/f9qoECJUvy6GJCu/knXb7+PJCpqBq8hybxMfL40Up27
	GFPpBsEORk0rv2jz0ULgEQH4dPZEX0u1WS58Cfv6i7AchTaS8bFTmL/yGisfTr6ttm6CIXIuM5HsD
	V3vHVR5BDYb6DIdNMdJ/b5q0kre9NGm2HKZGoDI4UlRqIEk1ROPwhtFryFH1le97r40REiGl1A0ws
	GK+1OcO0JZYGquxw9pcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayp6-00000002Wiq-26Cl;
	Fri, 16 Feb 2024 14:04:16 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayp3-00000002Wi9-2Iyx
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:04:14 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ddf26eba3cso1321574a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092251; x=1708697051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E6x9e4jEwIHXezfBq1PxKT3ziilTvOsAUwZ4pRf2+s=;
        b=nyKLyncEW1BSZ3IIKEh8NFVDoFofgNzeaL/RgujolkxZ84OYR1GZAo8ms2AXen4HfB
         otVdqL5Dsl99lvXNe+a+1MYmJCXaShs8lEh9GVdgmrb8oQtYXgaiEYXkwxVpHeuE2GYg
         +U3YzqsDrRjxVxbus/Wq7MWEFgw0eLV2XqrNSWP4ylhW/9lxloGsBQQDaE/5RKpQo+1I
         7RY9qGb+jBGO/A2Y1DzLcvssJMbjY7C2MNhtezyNSUJsSS+mrWNyOi9wUfuZ6F7IOZMo
         pLFWYpwxSsXpzi8FOstEfDavUHaNVJGR9wmWpKnieO+gJzlr7+bvaRNECBrzYErj+T1I
         yfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/sPwmyFpCgo9uD265/hjzeGfYPHHBytaV4X+PNeiriBUqmAMWsJqg6SQbyCeoNTzJJDOvc9c4tXOXLo0sB5YGJ4EF0aGxKpf5X/r3BrIU
X-Gm-Message-State: AOJu0YwcGa4yrlFLZcsRvVHgQ3vFpLUBBMk79oxMG/LwCCZNJyEMTOfH
	xQDe/xT6DYonx75zX/D8aLCxO1vAkR4aozoiFXJD0uPqX0E7t6MMb3wGP0Z3IDk=
X-Google-Smtp-Source: AGHT+IGmZzCe5YoQC5BMZoSZnwrCoeLL1OeFZGn2FMltMy9oV5cBIz/g6ZTdeUoP7T8jTiosmsDi1g==
X-Received: by 2002:a05:6358:706:b0:17a:b810:aace with SMTP id e6-20020a056358070600b0017ab810aacemr5221148rwj.15.1708092251287;
        Fri, 16 Feb 2024 06:04:11 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id c7-20020a25bbc7000000b00dcb02a7e071sm307207ybk.35.2024.02.16.06.04.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:04:10 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so2132456276.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:04:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/t2+QKM0BLOKUppUco5u2zVWVkKNshjRT95SVbOuKNDbshQTAz9A910KP4LAXJnCgrkWqOHKe0eKpE3RhAxvrOrp7I0XPY6TfXbk4nmgx
X-Received: by 2002:a25:d3c7:0:b0:dc6:d2b0:95cb with SMTP id
 e190-20020a25d3c7000000b00dc6d2b095cbmr5114614ybf.57.1708092250077; Fri, 16
 Feb 2024 06:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:03:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
Message-ID: <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
Subject: Re: [PATCH 05/17] dt-bindings: clock: r9a09g011-cpg: Add always-on
 power domain IDs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060413_609630_0C9328E7 
X-CRM114-Status: GOOD (  15.12  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0M+KAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gQWRkIGFsd2F5cy1vbiBwb3dlciBk
b21haW4gSUQgZm9yIFJaL1YyTSAoUjlBMDlHMDExKSBTb0MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBD
bGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+CgpUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svcjlhMDln
MDExLWNwZy5oCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yOWEwOWcwMTEtY3Bn
LmgKPiBAQCAtMzQ5LDQgKzM0OSw3IEBACj4gICNkZWZpbmUgUjlBMDlHMDExX0RESV9SRVNFVCAg
ICAgICAgICAgIDkzCj4gICNkZWZpbmUgUjlBMDlHMDExX0RESV9SRVNFVE5fQVBCICAgICAgIDk0
Cj4KPiArLyogUG93ZXIgZG9tYWluIElEcy4gKi8KPiArI2RlZmluZSBSOUEwOUcwMTFfUERfQUxX
QVlTX09OICAgICAgICAgMAoKUlovVjJNIGhhcyBtYW55IG1vcmUgcG93ZXIgZG9tYWlucywgYnV0
IHRoZXkgYXJlIG5vdCBjb250cm9sbGVkIHRocm91Z2gKQ1BHX0JVU18qX01TVE9QIHJlZ2lzdGVy
cywgYnV0IGJ5IHRoZSBJbnRlcm5hbCBQb3dlciBEb21haW4gQ29udHJvbGxlcgooUE1DKS4KCj4g
Kwo+ICAjZW5kaWYgLyogX19EVF9CSU5ESU5HU19DTE9DS19SOUEwOUcwMTFfQ1BHX0hfXyAqLwoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKCi0tCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
