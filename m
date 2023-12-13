Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D730C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTPnMXnILEyW4kmSs6cqqj5zYvubll+wxY+uxdg8po0=; b=x3Yqycldk9u+Qe
	AnBuq47vmHZMpTiExoLWX5gGq7ru2Jb6TURukCOqanGRJkfhklw4pOyHGXAinHTZRFVviNo2E5m2D
	uTGnLSVvba5x60OygCSZve5McIZXhIYiovu3Xz4wX7zgQxPRtVcOpi1KUFLYkGuxoENQsMFC/vKCE
	TVNSWlewVp9rXWK3hPr3uTXCdUlQhV4aAvq+aLRLbxlpdy1rlMBCDq9uMaRfGw0ZYBdiZBSnbGYox
	i6lCMVY56KkBE6uxMDRL7/UkIE9x+EO8QdLIrQEpLObyioC6gU5zokgSwainHCm5O5yiRk4OsDkjY
	kDsSGHS76tH0rMhbLC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRWW-00FLhO-2P;
	Wed, 13 Dec 2023 15:51:48 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRWU-00FLgW-0H
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 15:51:47 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e2cfece112so6933607b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 07:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482703; x=1703087503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pWEvy54Aq1JKiqXgJAt3KKUBmqlXHH+k7Vf0IczX7I=;
        b=tyukKrIIFwllj7T+MIhCZ4W9PrJvxyKXik9/S5MGFf4xD/t3yM+z7q+Ur01Unr3Scp
         5zlqINV1oQvtm9OuE7Eks1pGTdra8bbQGPdbeMJFGlSYcriBSpLohbshI4asIU54B+I+
         2WADSJitmhC2tltR6BNSG5FbocNTYCzPs5sGUYHWrHLTc9bD3J6qzHK0CIHmaGWnoHqJ
         7SHUk61BFEIoBuyPyJK/1v9ol4RghMkQTSBfynkH/aayYtjuIb6iYJ9I1es8G4/T/JjY
         LfCAyYk8uamGvLepb8+LJUOr4fBuHp5ZqySQXqZtJp1Xl8OquOzI9jng7XKLEEcNdoM0
         Fn2A==
X-Gm-Message-State: AOJu0Ywd+C9R0VRYUFSALg4h1ugYXkVYk6Of2e90JGQkuc5g+hjb5MGS
	dfMeHFUGmAJcwZKvW+xyg6afTXh1m4uYZQ==
X-Google-Smtp-Source: AGHT+IHMM5XcXu6c+vVO7m6o52HAfbf29NzFCH5lRy3w75qIAEd6m7h2105u4WKQsq2tJli9OSnjOQ==
X-Received: by 2002:a0d:dac3:0:b0:5d7:1941:3579 with SMTP id c186-20020a0ddac3000000b005d719413579mr5830209ywe.96.1702482703354;
        Wed, 13 Dec 2023 07:51:43 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id c127-20020a0dc185000000b005d4035e6135sm4737454ywd.74.2023.12.13.07.51.42
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 07:51:42 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbcc9d4b1aeso1056477276.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 07:51:42 -0800 (PST)
X-Received: by 2002:a25:ae97:0:b0:dbc:d902:51b9 with SMTP id
 b23-20020a25ae97000000b00dbcd90251b9mr424122ybj.92.1702482702518; Wed, 13 Dec
 2023 07:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com> <20231213-jester-rendering-dd876ef8e8ac@spud>
In-Reply-To: <20231213-jester-rendering-dd876ef8e8ac@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 16:51:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwRZRvLPh3JBShQy4hRHq=2fQJmcYjTyQhKZmtBPaOuw@mail.gmail.com>
Message-ID: <CAMuHMdXwRZRvLPh3JBShQy4hRHq=2fQJmcYjTyQhKZmtBPaOuw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Add JH7100 errata and update device tree
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_075146_122146_816E1423 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpPbiBXZWQsIERlYyAxMywgMjAyMyBhdCA0OjQz4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gT24gVGh1LCAzMCBOb3YgMjAyMyAxNjoxOToyNCArMDEw
MCwgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gPiBOb3cgdGhhdCB0aGUgZHJpdmVyIGZv
ciB0aGUgU2lGaXZlIGNhY2hlIGNvbnRyb2xsZXIgc3VwcG9ydHMgbWFudWFsCj4gPiBmbHVzaGlu
ZyBhcyBub24tc3RhbmRhcmQgY2FjaGUgb3BlcmF0aW9uc1sxXSB3ZSBjYW4gYWRkIGFuIGVycmF0
YSBvcHRpb24KPiA+IGZvciB0aGUgU3RhckZpdmUgSkg3MTAwIFNvQyBhbmQgdXBkYXRlIHRoZSBk
ZXZpY2UgdHJlZSB3aXRoIHRoZSBjYWNoZQo+ID4gY29udHJvbGxlciwgZGVkaWNhdGVkIERNQSBw
b29sIGFuZCBhZGQgTU1DIG5vZGVzIGZvciB0aGUgU0QtY2FyZCBhbmQKPiA+IHdpZmkuCj4gPgo+
ID4gVGhpcyBzZXJpZXMgbmVlZHMgdGhlIGZvbGxvd2luZyBjb21taXQgaW4gWzFdIHRvIHdvcmsg
cHJvcGVybHk6Cj4gPgo+ID4gWy4uLl0KPgo+IEFwcGxpZWQgdG8gcmlzY3YtY2FjaGUtZm9yLW5l
eHQsIHRoYW5rcyEKPgo+IFsxLzhdIHJpc2N2OiBlcnJhdGE6IEFkZCBTdGFyRml2ZSBKSDcxMDAg
ZXJyYXRhCj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jb25vci9jLzY0ZmM5ODRhOGE1
NAoKVGhhdCdzIHRoZSBvbmUgd2hpY2ggYWxzbyBuZWVkcyBkZXBlbmRzIG9uICFETUFfRElSRUNU
X1JFTUFQPwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
