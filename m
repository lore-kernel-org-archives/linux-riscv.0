Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8878BC7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bxc+xlCNfF9hRPodGEcX6rFR+BseH6BW/fh/vTX+5gk=; b=NA0XtGZ48dB8Jw
	HZ2gVXNtwP9q43CE0UAxnw17wGhKySOMTJzCcp4LdUjWDtbmtdPRflH88vKbK9iYSYGqG34+og4ls
	Ik4ueuqg+BXBwYAp28QphPwjJpjyGzc2lssuAATmtZ/Kfzx4iK7i0O+gj8Nq1pzvv7+qD0Z2pxaJK
	mkFRIZx9qujis+4/kPIDFFpyl0GhoE383dmKg6bLhbJcHpss37EMWKlS9dp1Gnvz8mRdABq5UqW5Y
	pubZvPIUNXgTjdTQ8O+4SMpu+3/nnWgWuehHkiBMuR+CSftW0xh7TwMUD3KuyvELmtMXE8oYP8dKd
	ADxUhdsMmDtyiRrM7Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUpt-008KYm-1V;
	Thu, 06 Apr 2023 18:59:53 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUpq-008KXg-2w
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 18:59:52 +0000
Received: by mail-il1-x132.google.com with SMTP id v5so18497437ilj.4
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680807588; x=1683399588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUyJ3wxzxoqSuvxPI58fy1Btf6mp8kX94ybQptXUc3Q=;
        b=YkKIr0GocwTAvB4t/GGojOyjJQrlawJFDeEIq7fgZQ0DqGk5NImD9Go7I7XBAQOfW3
         eYq5ujzUXkEzVnaC07MyyL2e529FZ81atwYQQLFZ9Kb+a+wpWSJjppzOiN8EPS+O/KpE
         BZIdqjdajls2tbOYgstJBf3atbMy+dZAgb4WZGEHdwwSQfZENcA19TYYhLdkrxfjAkoK
         NFptTaCqhJiss0Yd4T/aPtBP7+430FpAK+iFijJgvN9PmOXqKoUmQ6/5tAMRTyiV7QUC
         2j1LYK4snrCVyLKee25ixG7vc3NoQ5YF0Eio3pnk3FktYwFACXEjuHN16jKqFDhF79mL
         Pt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807588; x=1683399588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUyJ3wxzxoqSuvxPI58fy1Btf6mp8kX94ybQptXUc3Q=;
        b=DBk10UyIWkvurs8YXIefqVO9PxDJ4/h6RZ/97+uXkyB1BefWebGpjfYFeCuDGLVxvC
         5IceTV0uOqfjUQOzfJVqWlQhnWKH5EPkjF95au4Of7DJksea/CGMehsyDWwbsmQskhlv
         w5UXsTOEzIrhiHlE873kslxS1VtfRlFyrWHzazaGQW3TLksjv4yW0CmvmQc0f0U4+yJL
         hx32D97JfSwyE397/CI6AUf/Vaz2Y8r/yIkNsjwOQ6Ol0waxnfsAv8yj7HznFM3UhwZb
         Ny+AAxjC9Mv1oHweNi7MHFYfasXmZlw0NZac19RMpDNpgj4EkkF9yA6JFAL3pQPX065E
         zvDw==
X-Gm-Message-State: AAQBX9fw2yWaG58hFVpmFA6YNNnS86zyGkZnElHGP/WRdSCHOOJ/Kb7+
	7TIYgtI+waIYVWEI+bMFXF1PQI3xWJ/XY4HFCKw=
X-Google-Smtp-Source: AKy350bQp4WCCWwuYEVoVmA1ow6eFikyqvIzEhmOaus7gRujSkLUdnIxlEeOdiLBcMiNn18hKyvJs5Bu35ppe0l85QE=
X-Received: by 2002:a92:c5cf:0:b0:326:4201:2d8c with SMTP id
 s15-20020a92c5cf000000b0032642012d8cmr6810904ilt.1.1680807588655; Thu, 06 Apr
 2023 11:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <ZCu1tFrQCVe2sgNz@infradead.org>
In-Reply-To: <ZCu1tFrQCVe2sgNz@infradead.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Apr 2023 18:59:22 +0000
Message-ID: <CA+V-a8sn8ai1h9+D-b2+Uj2xGcPOw95ukFPy=T_jL+EjTuqApQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
To: Christoph Hellwig <hch@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_115950_978955_F20F75CE 
X-CRM114-Status: GOOD (  13.42  )
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

SGkgQ2hyaXN0b3BoLAoKT24gVHVlLCBBcHIgNCwgMjAyMyBhdCA2OjI54oCvQU0gQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDMwLCAy
MDIzIGF0IDA5OjQyOjEyUE0gKzAxMDAsIFByYWJoYWthciB3cm90ZToKPiA+IEZyb206IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4g
PiBDdXJyZW50bHksIHNlbGVjdGluZyB3aGljaCBDTU9zIHRvIHVzZSBvbiBhIGdpdmVuIHBsYXRm
b3JtIGlzIGRvbmUgdXNpbmcKPiA+IGFuZCBBTFRFUk5BVElWRV9YKCkgbWFjcm8uIFRoaXMgd2Fz
IG1hbmFnZWFibGUgd2hlbiB0aGVyZSB3ZXJlIGp1c3QgdHdvCj4gPiBDTU8gaW1wbGVtZW50YXRp
b25zLCBidXQgbm93IHRoYXQgdGhlcmUgYXJlIG1vcmUgYW5kIG1vcmUgcGxhdGZvcm1zIGNvbWlu
Zwo+ID4gbmVlZGluZyBjdXN0b20gQ01PcywgdGhlIHVzZSBvZiB0aGUgQUxURVJOQVRJVkVfWCgp
IG1hY3JvIGlzIHVubWFuYWdlYWJsZS4KPiA+Cj4gPiBUbyBhdm9pZCBzdWNoIGlzc3VlcyB0aGlz
IHBhdGNoIHN3aXRjaGVzIHRvIHVzZSBvZiBmdW5jdGlvbiBwb2ludGVycwo+ID4gaW5zdGVhZCBv
ZiBBTFRFUk5BVElWRV9YKCkgbWFjcm8gZm9yIGNhY2hlIG1hbmFnZW1lbnQgKHRoZSBvbmx5IGRy
YXdiYWNrCj4gPiBiZWluZyBwZXJmb3JtYW5jZSBvdmVyIHRoZSBwcmV2aW91cyBhcHByb2FjaCku
Cj4gPgo+ID4gdm9pZCAoKmNsZWFuX3JhbmdlKSh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVk
IGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqaW52X3JhbmdlKSh1bnNpZ25lZCBsb25nIGFkZHIsIHVu
c2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqZmx1c2hfcmFuZ2UpKHVuc2lnbmVkIGxvbmcg
YWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPiA+Cj4KPiBOQUsuICBGdW5jdGlvbiBwb2ludGVy
cyBmb3Igc29tdGhpbmcgaGlnaCBwZXJmb3JtYW5jZSBhcyBjYWNoZQo+IG1haW50YWluYW5jZSBp
cyBhIGNvbXBsZXRlIG5vLWdvLgo+Ck9rLCBJIHdpbGwgdGFrZSB0aGUgQUxURVJOQVRJVkUoKSBt
YWNybyByb3V0ZS4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
