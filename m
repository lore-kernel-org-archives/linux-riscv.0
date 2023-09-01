Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796A3CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOPdVqk3W3fEtuW7hmQIEhof7XHBlRctp4epqVrxxoU=; b=psulSAY6qlp2ni
	gTlP8SHdH9xDGVYYEq8SbKTI5TIFsftPoFI/3AXaBS6rR7w6TyQOg6YYOpG1oRhYO6VQlzpu8MLHq
	GqQ67rV6Y8UBQjnv96RDsp/S7s/DU7cpEokTTkoItc4wjTjXfH9Ta4ajllBXchkAACtD2d4ICzkf6
	dtqMAin+YxPY1xd8AR50ho/R6M5U7uC8HLCiNRS1urHoBo0xicHvh3nVOzOFo0tC+qpptNZW78P20
	2VmlzmGGbGahDreVQNQdvyoQOs3cVHcLrMDLHQXsYJ1ehy1SCeaLvH+ehWM3dvWpS379hLU5MzVwJ
	93PzQVbIO4/4KSBU9EJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2ZX-00HGYs-29;
	Fri, 01 Sep 2023 11:44:19 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2ZU-00HGYW-1X
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 11:44:18 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5921a962adfso19653387b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693568654; x=1694173454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v35D4R/YcbC9ox5KrmWaaZLOPC4k8bfMeoxv1sATsyI=;
        b=K+P/MVQHqQ8EpbfPYMlkCnM006SnOYQXmpIR7VqDmLN1KtOVRL37/gkuMX+jK7gS08
         603H3AxHhvyyBkHQLpfZCybPp1MxeJm5F8GRjqPwFl001mcTcKknI0WLjJxa7p5/M2m9
         KocqkYHcwFD/kktwkEwxlcw6QTWDi2GdXxZTJgBhAlbYs9BCRwF+c0Lo8n+7eSj0Wax5
         zdmlbG7gABeMByQ6Gn1f4PokyMVuQG1FjLaFxyD4wnT9c4EgGPhVpjBML848yc7gJdrl
         Xl+2xke7iPpj/HvQ6urUdMl/011ydPiA3t6Mvo9uTGbYwoubN1nTlUcI7Lvfv4aqmN+j
         0LeA==
X-Gm-Message-State: AOJu0Yz/HxkTPMlWOKbrpkGy/3RS+yeOg4ufaapvB/OSXkAfehF0N4+f
	WOLSgpIyAnnIuKA0KpO27CfCDvPI4luEwg==
X-Google-Smtp-Source: AGHT+IGvMnD+TPYo4iVDnKdv/nMCEJFosn87rR0+M8a53t0wMf1CtKMipRNbVlxrNv3dqWugQmECNg==
X-Received: by 2002:a0d:d756:0:b0:57a:3dd8:1038 with SMTP id z83-20020a0dd756000000b0057a3dd81038mr2383052ywd.12.1693568653929;
        Fri, 01 Sep 2023 04:44:13 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id r20-20020a0de814000000b00589e68edac6sm1007464ywe.39.2023.09.01.04.44.13
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 04:44:13 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so1453033276.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:44:13 -0700 (PDT)
X-Received: by 2002:a25:a2d2:0:b0:d07:60bd:89f4 with SMTP id
 c18-20020a25a2d2000000b00d0760bd89f4mr2418648ybn.37.1693568653078; Fri, 01
 Sep 2023 04:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230901110936.313171-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901110936.313171-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Sep 2023 13:44:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyiWOdXtGR8o4kKOyYV8JwoPN-FvMBxYmcRoKLAdu3PQ@mail.gmail.com>
Message-ID: <CAMuHMdUyiWOdXtGR8o4kKOyYV8JwoPN-FvMBxYmcRoKLAdu3PQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: Kconfig: For ARCH_R9A07G043 select the
 required configs if dependencies are met
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_044416_541295_65353ED8 
X-CRM114-Status: GOOD (  19.14  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBTZXAgMSwgMjAyMyBhdCAxOjEw4oCvUE0gUHJhYmhha2Fy
IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gRnJvbTogTGFkIFByYWJoYWth
ciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVG8gcHJldmVu
dCByYW5kY29uZmlnIGJ1aWxkIGlzc3VlcyB3aGVuIGVuYWJsaW5nIHRoZSBSWi9GaXZlIFNvQywg
Y29uc2lkZXIKPiBzZWxlY3Rpbmcgc3BlY2lmaWMgY29uZmlndXJhdGlvbnMgb25seSB3aGVuIHRo
ZWlyIGRlcGVuZGVuY2llcyBhcmUKPiBzYXRpc2ZpZWQuCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
Cgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MzExNjEwLmVj
NmJtMkc4LWxrcEBpbnRlbC5jb20vCj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKRml4ZXM6IGVkMWE4ODcyZmY4
MzlkZTAgKCJzb2M6IHJlbmVzYXM6IEtjb25maWc6IFNlbGVjdCB0aGUgcmVxdWlyZWQKY29uZmln
cyBmb3IgUlovRml2ZSBTb0MiKQoKPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcK
PiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiBAQCAtMzM0LDEwICszMzQsMTEg
QEAgaWYgUklTQ1YKPiAgY29uZmlnIEFSQ0hfUjlBMDdHMDQzCj4gICAgICAgICBib29sICJSSVND
LVYgUGxhdGZvcm0gc3VwcG9ydCBmb3IgUlovRml2ZSIKPiAgICAgICAgIHNlbGVjdCBBUkNIX1Ja
RzJMCj4gLSAgICAgICBzZWxlY3QgQVg0NU1QX0wyX0NBQ0hFCj4gKyAgICAgICBzZWxlY3QgQVg0
NU1QX0wyX0NBQ0hFIGlmIFJJU0NWX0RNQV9OT05DT0hFUkVOVAo+ICAgICAgICAgc2VsZWN0IERN
QV9HTE9CQUxfUE9PTAo+IC0gICAgICAgc2VsZWN0IEVSUkFUQV9BTkRFUwo+IC0gICAgICAgc2Vs
ZWN0IEVSUkFUQV9BTkRFU19DTU8KPiArICAgICAgIHNlbGVjdCBFUlJBVEFfQU5ERVMgaWYgUklT
Q1ZfU0JJCj4gKyAgICAgICBzZWxlY3QgRVJSQVRBX0FOREVTX0NNTyBpZiBFUlJBVEFfQU5ERVMK
PiArCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciB0
aGUgUmVuZXNhcyBSWi9GaXZlIFNvQy4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKQXMgdGhlIG9mZmVuZGluZyBjb21taXQgd29uJ3Qg
YmUgaW4gbXkgdHJlZSB1bnRpbCB2Ni42LXJjMSwgSSBjYW5ub3QKdGFrZSBpdCBub3csIGFuZCBy
aXNjL2Zvci1uZXh0IHNvdW5kcyBsaWtlIHRoZSBiZXN0IHRhcmdldC4KQWNrZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
