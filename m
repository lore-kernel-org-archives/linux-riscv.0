Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D31C761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EiSVyZgnE/1/HhgfSL3phD/nxiw2H6oyJBMeB/rp0M=; b=mOut6+sLwDyD6P
	o1oj9okv19ZRAzR/D5rrFxpYo/FMRdbaLs/zRI0/ws3UUVULeeE5bzfVZ+rJzpHeE5y2xKAKKnRQ2
	7JeifQjI2k2CwslPf3yDZm4ndYqF78XcXhWoOCmXIJ2Nx+6VRyZ52/TE/8MqJP5bxetJA5c2gdA9a
	grq2WXzolGHKPzmNWygDpwydPJpUN3UX/zqWoRa9KT6ltBEZMGjfTnEk+aFlXrEq47QJEUAt+9nMW
	QUorJM3RHgsizZvWoC/LuXiXdFe4Re69bbaQsIdoSQdvWNxHJtYB/yfY1HQ7M6TIfC75T1kUsF0bt
	UHXvHJnXnl30KgKZ6sZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piL4G-008ic6-2h;
	Fri, 31 Mar 2023 20:09:48 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piL4D-008iaC-3A
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 20:09:47 +0000
Received: by mail-io1-xd33.google.com with SMTP id x3so2697502iov.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680293383; x=1682885383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NAz9S30aGFPtEuWfJEyiKcdkusKBbk0JyFKWd+aoVA=;
        b=G2WAtaKi4SqMg8ku//tzWr4dU1WOMosZlfN+GwaOHuWVINLMXHGKqsHCtByB+WJpJ2
         Vs3XtxJ1n9r1C+PFSKAggGuiSrU6Z7AXtOFOFEDntKZL9Ir9Fcup9O6xrNkB0kWv70se
         fTLrsCd8zdfnVfLcS9DYFRvKOV53+ZB90DmmlNMlVBCciz1wfJAkyZILgez2gQ1F5tbY
         HmnCEzViVy6O33SZC8HDtD92BPcl3Z+RhKx7u7yaNcu4JRkLAt604rML0XBydHPHcl0K
         U4Rh2DG2vnwEsZy9mlonDlq/JN30a0fOf7+ve0OK7eVEmnQNwKy/qIsgEhh6iQOpBh/u
         qfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293383; x=1682885383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NAz9S30aGFPtEuWfJEyiKcdkusKBbk0JyFKWd+aoVA=;
        b=K5VIqIrHxJVDLTpAyh40r6ZWtw14/TZ7xMLxyKIdgfnsxh5QCSzYttfTKtjXvJl4C0
         0mzc56duC8FCk4kNi7Z28bWXO1WOXyur87EPwhsyDl2zui4ezqkjtxQGlkERHs6HmiyC
         xwY/boWIDxmQ9rlew405r9SoRv1RrwSOvqaflRilv/8NdtTp9RAokZogG+pOO45pjZOm
         1Y3j7LOFnCj+lJB5NpzYJYmtypEgOMJqwSirp1wsFVYCgGldDF7AVMjt+1sQwIaqaQD6
         nyFc/MOvykKmXgxrIYcqZlyrYcUGPBWsCDGFORgImGwburdTMmBSYe84+KuGrWugN1Ie
         hiBg==
X-Gm-Message-State: AO0yUKVpa7Ghk7Geo+6Ne/Gnn9aQbd4Lwsh6SRbPZlMpc7Z04IRaeYOT
	aS5XaIknDi02pGlAtPnisP9PIBTtuTA/EDjgJhs=
X-Google-Smtp-Source: AK7set/N3YGnS9ogYf8bW40PdxxrBzO9MUQuB3Lh+RxfeeKlwnhxk2YA2WgzehfEB2G8ERWuDMiioDseQ+shcBi6xvg=
X-Received: by 2002:a02:a182:0:b0:3c5:1971:1b7b with SMTP id
 n2-20020a02a182000000b003c519711b7bmr10783828jah.1.1680293383261; Fri, 31 Mar
 2023 13:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <b2dcda17-5850-47c1-94bc-4ca87f900581@spud>
In-Reply-To: <b2dcda17-5850-47c1-94bc-4ca87f900581@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 31 Mar 2023 20:09:16 +0000
Message-ID: <CA+V-a8s+=OY6CX4XTUwyAE9b=rdJZZfgAaY2nU+6aqnu=X9nxQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] RISC-V non-coherent function pointer based CMO +
 non-coherent DMA support for AX45MP
To: Conor Dooley <conor@kernel.org>
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
X-CRM114-CacheID: sfid-20230331_130946_329000_3FAA71EB 
X-CRM114-Status: GOOD (  12.72  )
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

SGkgQ29ub3IsCgpPbiBGcmksIE1hciAzMSwgMjAyMyBhdCA3OjA14oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDMwLCAyMDIzIGF0IDA5
OjQyOjExUE0gKzAxMDAsIFByYWJoYWthciB3cm90ZToKPgo+ID4gLSBUaGlzIHNlcmllcyByZXF1
aXJlcyB0ZXN0aW5nIG9uIENvcmVzIHdpdGggemljYm9tIGFuZCBULUhlYWQgU29Dcwo+Cj4gSSBk
b24ndCBhY3R1YWxseSBrbm93IGlmIHRoZXJlIGFyZSBaaWNib20gcGFydHMsIG1heSBuZWVkIHRv
IHRlc3QgdGhhdAo+IG9uIFFFTVUuCj4gSSBoYWQgdG8gcmV2ZXJ0IHVucmVsYXRlZCBjb250ZW50
IHRvIGJvb3QsIGJ1dCBteSBEMSBORlMgc2V0dXAgc2VlbXMgdG8KPiB3b3JrIGZpbmUgd2l0aCB0
aGVzZSBjaGFuZ2VzLCBzbyB3aGVyZSBpdCBpcyByZWxldmFudDoKPiBUZXN0ZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ICMgdHlyZS1raWNraW5nIG9uIEQx
Cj4KVGhhbmsgeW91IGZvciB0ZXN0aW5nIHRoaXMuIEJ5IGFueSBjaGFuY2UgZGlkIHlvdSBjb21w
YXJlIHRoZSBwZXJmb3JtYW5jZT8KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
