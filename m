Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8EEC25B6B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baXUa5qfsJrDsmR058ZVcGS9AI6diU+a5HORUMEaYN8=; b=Yzjf/AIDZ7TRc2
	TDXPdETpjL14RB/wq6S5Q3fM28MVyxvFglnLhXZNH8wLar8Hr3E5pRRlwLjPcsVpcJVrvO368iyVP
	2F9MbHAp/pzAe5bY/X7ANyCF5xrZrJi3kBahyG+ZCuYgvPh/i019kVBQ05khpaTfRmXNYMjDPYtrh
	4NylY3XZoumVeTBbxAd+rsPNH/3MLYjNQfy+ST7IDC6EWqArWM1fkAgEKh99O0KuYH1Wv2dflJFU9
	dI+TAW9R1f3HkxW1VTdBaEQ8rkdMXdLzeP++YBiP6XWXFG4cNctHZlZ5USAeDBIbhOJnFeSpFLg1W
	unshHiysgoxdhHXa0BiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwZQ-00E3mj-03;
	Thu, 26 Oct 2023 09:22:28 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwZM-00E3mN-22
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 09:22:26 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a87ac9d245so5005907b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 02:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698312143; x=1698916943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WYXhrqPv+yxcJyje5S7Nyo29EB+cd9y/YPgOVg+ufg=;
        b=pzDFLUCcYdSNeSlPXdNHEUoPWXwEykYZiJhYMvP1xWNbNpAP6Hu+yDj0sZclZ8Is5D
         v26BUF8VGpSwX1x9ngkNKglfVYtpc7SBl5zYyAHYmJYPjHVo/9/DWLcqIlUlPkB6v6Fm
         GmGu9JYGekkO4sskM4xz7IWOM5f+vN0/y1HoZCh1byzSKciovb7sJkl5gOiWzDoUHgvG
         xvNWz5ejx5eGUAr9VUtecccVwW/XypCr+y5D1Iv3CRzhC72LxcOIvlTxwzhQBaMlQHqg
         WAWjt5cPgq8ZY8E/J/Ds3NtX5pMV61boR5ftYUNxgXH0spwkdOZ8xxj0O30KS18envw/
         HV8w==
X-Gm-Message-State: AOJu0Yz6U8C2+y+QgOLG1DCr5KTPKwYiFZGlTjK8ArLp/fGcRWAyn7BF
	zuCLqJNIfELC/PSBKWRX3XBLKu8jj9jqgA==
X-Google-Smtp-Source: AGHT+IGLGYAi8j64jXboatTU3Zyz6eK9y54wM/mdNmv5QL1KRlFmq/D25vYeiFO1jOM9z1X9T9+Ayg==
X-Received: by 2002:a0d:e84c:0:b0:589:b3c6:95ff with SMTP id r73-20020a0de84c000000b00589b3c695ffmr19590405ywe.36.1698312143101;
        Thu, 26 Oct 2023 02:22:23 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id w74-20020a81494d000000b005a206896d62sm5803652ywa.111.2023.10.26.02.22.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 02:22:22 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7c7262d5eso5070257b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 02:22:22 -0700 (PDT)
X-Received: by 2002:a81:a090:0:b0:5a7:baac:7b34 with SMTP id
 x138-20020a81a090000000b005a7baac7b34mr18072832ywg.28.1698312142181; Thu, 26
 Oct 2023 02:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231018052654.50074-1-hch@lst.de>
In-Reply-To: <20231018052654.50074-1-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Oct 2023 11:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHc_t2B48QwiJFwKRqhyWS1GRbZgu6yuxer4E=UKQ6zg@mail.gmail.com>
Message-ID: <CAMuHMdXHc_t2B48QwiJFwKRqhyWS1GRbZgu6yuxer4E=UKQ6zg@mail.gmail.com>
Subject: Re: fix a few RISC-V / renesas Kconfig dependencies v2
To: Christoph Hellwig <hch@lst.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Samuel Holland <samuel.holland@sifive.com>, soc@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_022224_672863_54273EF2 
X-CRM114-Status: GOOD (  16.12  )
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

SGkgQ2hyaXN0b3BoLAoKT24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgNzoyN+KAr0FNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiB0aGlzIHNtYWxsIHNlcmllcyBzb3J0cyBv
dXQgYSBmZXcgS2NvbmZpZyBkZXBlbmRlbmN5IGlzc3VlIGZvciB0aGUKPiByaWNoIHNldCBvZiBS
SVNDLVYgbm9uLWNvaGVyZW50IERNQSBzdXBwb3J0LgoKVGhhbmtzIGZvciB5b3VyIHNlcmllcyEK
Cj4gR2VlcnQgc3VnZ2VzdGVkIGZvciBpdCB0byBnbyBpbnRvIHRoZSBzb2MgdHJlZSwgd2hpY2gg
aXMgZmluZSB3aXRoIG1lCj4gaWYgSSBnZXQgYSBzdGFibGUgYnJhbmNoIGZvciBpdCBhcyBpdCBp
cyByZXF1aXJlZCBmb3IgZnVydGhlciBkbWEtbWFwcGluZwo+IHdvcmsuCgpBcyBBcm5kIGFza2Vk
IG1lIHRvIHNlbmQgYSBQUiB0byBoaW0sIEknbSBxdWV1aW5nIHRoZXNlIGluCnJlbmVzYXMtZml4
ZXMsIGFuZCB3aWxsIHNlbmQgYSBQUiBtb21lbnRhcmlseS4KCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
