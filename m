Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CD8C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg7DOX8nYTTTul8WT2dCwFASaeraWcM7EZMJn3we47s=; b=hPTOTZQnda70YY
	9mK+8CCShGsuMuiwpu3vAT83R/cJh0cznqowlRLVJpCPZSmVputPC6mxlUIDcmvjeeSbcd1ZVSnXc
	xloKUs2IPlpZtqhUt66vHAxZ830+9HxpB0zkmnIGN7hkYDqeMhoDzgmuFwtwHM9fRBvBvHO6Eau5r
	Fw/3nQP2EBW5habMdgMtRQEznRcglkmckQOdPcuS8AstyCiwyAcmOvibHpJeFAFQAXtTYW7a0gdxB
	Q5rCgTQ2wywhKql9BHQPec0ZH5gKP7F/te7XUyoYO5UAhHlWiSZYJMJSQ+HI83aMoOsjGXm1mGFOg
	p/x6Af7ixLHSMCoIrvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r97WJ-00EMEZ-30;
	Fri, 01 Dec 2023 17:41:43 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r97WH-00EMBR-0E
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 17:41:42 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-46446cd5c8eso784145137.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701452494; x=1702057294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49RGKrTR1X9VcxqHT0Bd8fjI/0/7U8Cy9TlOTmIOtUU=;
        b=GeUDAZqWAmRc1fnQ5SBtp6YGY2vITmO3ZOh1e10L78GxiU/XwkVK1cBMAR+gXBbzLW
         MghY0oEygmEA3UyRACbZ9v4TsUX7O4jbSbRhnTiOsmSr6t9vdquT/14bvUf7Mt8vlUAO
         bLjD8/zjcP3X8jmuCPpmXfloss/OfTc56wnjHpgEHlID4i/IEr9BoXDZkiUbjI0YFhTH
         Tnus3bfqoeTNT6xMaR/6LEV25UlO5+lItE5jxUx4bUtiC2Xy99My1pGWgnIb0qY9M9zp
         aUbK0ZnofBotgFZHJVMxChT4A+AXwD72OSCRMkyVlhv7JN9HcVbLeTkxuKZ6ri4TCl7P
         T4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701452494; x=1702057294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49RGKrTR1X9VcxqHT0Bd8fjI/0/7U8Cy9TlOTmIOtUU=;
        b=ow9ZnfnS95gNX8aoA7QtoJkWkQneVvkZyw8d/MicHDroEKcLeEN8JgtiOS7iPiO1KK
         5YHmgOKSn3zPWMVrW86//TCHUxFYHrLi4hWjk9Dx+QVvPr9kaLEQbKWoniLFkjt9n5im
         VzP/oiogVu5c3CCyDEGi7b9WGYrW7r9fx0Qd2zXuKM/2fSXzsKHVWMfF8DMe/5aYaZ61
         /C8eKTDyq2oBzzYOdYFo4kTKxoAeNKLCMDoXw/QkGKHcyZZTvJaIStqcbv8WMsQJUf5M
         SQCfgCVm5OysiUfXEWp/54Ky/YX8Q7dVX++ElWYMAkYTh7WfMhjWwVsYWPNnJAwntKgU
         fNYg==
X-Gm-Message-State: AOJu0YyTFTZwiirh+VMwvRK3/htx71v0Dj3YmJiivigBfTniVuYWxX48
	lefNlMQmadD8A+2c9akJMbTtxd36SWus8P1r0XMGGg==
X-Google-Smtp-Source: AGHT+IE+qDQwDeKNwS7sOXvHwRZNfDlXgKTSRXFs8kBpGSBTci0y5i6Rqkenkeo3WIkJMzwpKJdoK/ojvvxBcCdyb/4=
X-Received: by 2002:a67:f4ca:0:b0:464:609d:6636 with SMTP id
 s10-20020a67f4ca000000b00464609d6636mr4703210vsn.14.1701452494153; Fri, 01
 Dec 2023 09:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20231121211958.3158576-1-samuel.holland@sifive.com>
In-Reply-To: <20231121211958.3158576-1-samuel.holland@sifive.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 1 Dec 2023 09:40:55 -0800
Message-ID: <CABCJKufwox6C5BprNF=rDUxfV532OcawqZBsv5hFejJgrfZ+FA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix SMP when shadow call stacks are enabled
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nam Cao <namcaov@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_094141_103926_B62CEA13 
X-CRM114-Status: GOOD (  11.06  )
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

SGkgU2FtdWVsLAoKT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMToyMOKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgZml4ZXMgdHdv
IGJ1Z3MgaW4gU0NTIGluaXRpYWxpemF0aW9uIGZvciBzZWNvbmRhcnkgQ1BVcy4gRmlyc3QsCj4g
dGhlIFNDUyB3YXMgbm90IGluaXRpYWxpemVkIGF0IGFsbCBpbiB0aGUgc3BpbndhaXQgYm9vdCBw
YXRoLiBTZWNvbmQsCj4gdGhlIGNvZGUgZm9yIHRoZSBTQkkgSFNNIHBhdGggYXR0ZW1wdGVkIHRv
IGluaXRpYWxpemUgdGhlIFNDUyBiZWZvcmUKPiBlbmFibGluZyB0aGUgTU1VLiBIb3dldmVyLCB0
aGF0IGludm9sdmVzIGRlcmVmZXJlbmNpbmcgdGhlIHRocmVhZAo+IHBvaW50ZXIsIHdoaWNoIHJl
cXVpcmVzIHRoZSBNTVUgdG8gYmUgZW5hYmxlZC4KPgo+IEZpeCBib3RoIGlzc3VlcyBieSBzZXR0
aW5nIHVwIHRoZSBTQ1MgaW4gdGhlIGNvbW1vbiBzZWNvbmRhcnkgZW50cnkKPiBwYXRoLCBhZnRl
ciBlbmFibGluZyB0aGUgTU1VLgoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghIExvb2tzIGxpa2UgbXkg
cWVtdSBzZXR1cCBkb2Vzbid0IGhpdCB0aGlzIGlzc3VlLApidXQgbmV2ZXJ0aGVsZXNzLCB0aGUg
Zml4IGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRv
bHZhbmVuQGdvb2dsZS5jb20+CgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
