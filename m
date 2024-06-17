Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05060C27C53
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 03:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLNkc5TUHI/qlgyWBegkRndW5rKZrVcQqHksZFVJM2k=; b=lYkmAV0t+tJfFD
	BIVglUHOG6KtVaCmg+ezYOHPEeqN9bcj01q1HkKkOswI23fDOststvhMOpBhmlVtEongoL0jG1lRA
	2vQiwgHYcJauzHOH36JdZn1BwWAXX7xh3pULHCdaz+HD1eco+lExjtVN6jLqK3RLLYVfA3I5d8lMv
	lwkB2AiO3fNgEjswFIF93pbWpXgz2ZErk4xMS4ebzh/Jfbsd+az50YLjRIXW0f5SA1nSIBnH0SGyV
	fI6+jX7AgSrQaOlQEW0NdgdzeWbt5AzTmrRZvpfOtGkJPXJRLYMs0QoJD+i/uXmks1QzBLm0wXxfJ
	oxQFQUE469BQbYXXYDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2te-00000008zcx-1b3u;
	Mon, 17 Jun 2024 03:19:06 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2tb-00000008zcG-1wJH
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 03:19:04 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dff0712ede2so4195761276.2
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2024 20:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718594342; x=1719199142; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIVdduXifgv3JAoanTudcOcNqQVugPjPMGS36yvusW4=;
        b=Du7fle/4raxoeK5iheJ0akz9qXyS/9rOG1boGmijllFGsAi7B1Kw26skYkpPMBgObQ
         Y8mxLdcaMGDJrIc3gKeXRgr9wdhckZuOY1t+REkvoOeBaLCcD/eH3d6S3wh4cnzajscc
         Le8aEOp6RI6Au+BPhHmcvXsKk6ipDaJ3zts9kYwAsxXhZt2l0I8MnHzRlepaY9E2bJNw
         BX8xvK8zqe/j43ZaWhuixo2pynI6R/10ELqkuMd9bjyyyqE2D0+FlDTHhGYLEXFJNmK3
         6yX7/TWtsE50eUOXAZoiFznh9UkjgBac0Qb0BpzhLl+SCp9miXs7aw3gEduieZTqY72W
         l5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718594342; x=1719199142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIVdduXifgv3JAoanTudcOcNqQVugPjPMGS36yvusW4=;
        b=do5Z9n77d7ItvZTkwIAq6VDEcGO+N4Jr/KH8Ab/so0lbUvRYJuUZ1PZK4cbIkDBQeA
         MATn3AucAoMKXY90peo0Qq44kerNcbRdfjq1HpunlyALINTrjVEum0o2RrS9dS2NmrvG
         ljl+5+1xweIkPsMu/YTUpiNfpRE6mn55KWlB3XI940lGFFGyG1LeDkbk1wiMC8t6iy11
         BRiMeePTZ5ebOoH5H96NLWFcHa+MfECPCutjHCKFoJ/YDhUOVa4QiMuqH65E509rqJlK
         oko7oklqHhJWUK/kg3hWEujV1LU7kDeiruS/bIwOSMzSlHbxMOtoMVAKXoNdG7+MCttU
         vdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV4PvL3jWUd+5cNWXyeLZ/sHKdO++Knruk4gCPMuC2TiD9MoCTQAPTq4s9gi1vhbgULDSL7XA/dGF4eez1x3pgitHhawOuPngEQuRGl5DC
X-Gm-Message-State: AOJu0YyG3b6UKc9YrXuxX6HmOQsLxqPa3BF3/0oV6f3RSPuFW7pyRa0E
	9M4o58W1S+4ctmRjC4jtoZOSxRH9KM60/IRdHqGEzeqR5cl0lxrZBs+SQZPKTz1Csqm7NpLcEal
	JGJZVC140pRSkdNc861QQrvMXzisqG3sKCqhSEA==
X-Google-Smtp-Source: AGHT+IHQBV4IwupBpori4XbWjSbGIJPFyF5FKlAKUEJsi6jBrWepsvJOB+hZdB1NKM0GIIV+IxEU2bAJZtz5lcsABYo=
X-Received: by 2002:a25:bc82:0:b0:dfa:527d:d91e with SMTP id
 3f1490d57ef6-dff150dce30mr7958870276.0.1718594342086; Sun, 16 Jun 2024
 20:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240613191616.2101821-1-jesse@rivosinc.com> <20240613191616.2101821-2-jesse@rivosinc.com>
 <20240614-oyster-ditch-80e8f00fd91b@wendy>
In-Reply-To: <20240614-oyster-ditch-80e8f00fd91b@wendy>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 17 Jun 2024 11:18:51 +0800
Message-ID: <CABgGipXKY0JPT8Z+U0g=KkFHFPyL3grd=1_GjQHNLbWehN-seg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] RISC-V: Add Zicclsm to cpufeature and hwprobe
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_201903_534021_2E644134 
X-CRM114-Status: GOOD (  16.98  )
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

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgNDowOeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgMDM6
MTY6MTBQTSAtMDQwMCwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4gPiA+IFppY2Nsc20gTWlzYWxpZ25l
ZCBsb2FkcyBhbmQgc3RvcmVzIHRvIG1haW4gbWVtb3J5IHJlZ2lvbnMgd2l0aCBib3RoCj4gPiA+
IHRoZSBjYWNoZWFiaWxpdHkgYW5kIGNvaGVyZW5jZSBQTUFzIG11c3QgYmUgc3VwcG9ydGVkLgo+
ID4gPiBOb3RlOgo+ID4gPiBUaGlzIGludHJvZHVjZXMgYSBuZXcgZXh0ZW5zaW9uIG5hbWUgZm9y
IHRoaXMgZmVhdHVyZS4KPiA+ID4gVGhpcyByZXF1aXJlcyBtaXNhbGlnbmVkIHN1cHBvcnQgZm9y
IGFsbCByZWd1bGFyIGxvYWQgYW5kIHN0b3JlCj4gPiA+IGluc3RydWN0aW9ucyAoaW5jbHVkaW5n
IHNjYWxhciBhbmQgdmVjdG9yKSBidXQgbm90IEFNT3Mgb3Igb3RoZXIKPiA+ID4gc3BlY2lhbGl6
ZWQgZm9ybXMgb2YgbWVtb3J5IGFjY2Vzcy4gRXZlbiB0aG91Z2ggbWFuZGF0ZWQsIG1pc2FsaWdu
ZWQKPiA+ID4gbG9hZHMgYW5kIHN0b3JlcyBtaWdodCBleGVjdXRlIGV4dHJlbWVseSBzbG93bHku
IFN0YW5kYXJkIHNvZnR3YXJlCj4gPiA+IGRpc3RyaWJ1dGlvbnMgc2hvdWxkIGFzc3VtZSB0aGVp
ciBleGlzdGVuY2Ugb25seSBmb3IgY29ycmVjdG5lc3MsCj4gPiA+IG5vdCBmb3IgcGVyZm9ybWFu
Y2UuCj4gPgo+ID4gRGV0ZWNpbmcgemljY2xzbSBhbGxvd3MgdGhlIGtlcm5lbCB0byByZXBvcnQg
aWYgdGhlCj4gPiBoYXJkd2FyZSBzdXBwb3J0cyBtaXNhbGlnbmVkIGFjY2Vzc2VzIGV2ZW4gaWYg
c3VwcG9ydCB3YXNuJ3QgcHJvYmVkLgo+ID4KPiA+IFRoaXMgaXMgdXNlZnVsIGZvciB1c2VybW9k
ZSB0byBrbm93IGlmIHZlY3RvciBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+ID4gc3VwcG9ydGVk
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+
Cj4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
