Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1587AC77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKDJQKPlDVrXmzvERxsjxLInJhPkAFfILanS6Z1mNzM=; b=xJKbz+HJ3R9OF8
	F+cIbBom+xVTpu9R3y6B0OpzVkEr8my0/2xStU0wucF6o/hgQsifMNz7R6mii68dhqipRiNizOw0O
	2zGJ8poNgryTh+yPPqGolxRfijlS3XFgMlMmIgr8k9PMLybaVlJTufxBWwFqKScpUE5WqmNrDrJm3
	728aIIyYrBXsTzDzcDjfjRXOuGFYnnFlHTlUYnyeSGWT0yAH432MMr6x9NW8RpFWOhxDC/LUkl50S
	iEvfhUhToG+EUHb16hgfp/2SzxNO77ewN+3spmqjNhTDK0yoCKWNBfgOIlbYR+MMGT1PAw8lps9rc
	d9P6FF6+wZoxFqxA7nMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prhJq-004K8Q-2I;
	Wed, 26 Apr 2023 15:44:34 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prhJn-004K7U-1J
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 15:44:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4eff055d4d3so4584785e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682523868; x=1685115868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXQNOWAgaQUYazZwWqEqVInZKkPuNKRlqWvisd07x0c=;
        b=jnVVa8MWvjSQrALKMG32rLk52TfdZesLyqf6Q1AJ+72thd7vIFsMMQq+l9ZNFZdsJV
         72ma2xMUx3y53aDDwLgG6+v7aheXhYfmzuLalGBdnu9gGumFy7mYWs+5DKxJPPkoM3F6
         YzNKrBxubijh24oGNGMPjD3ayTVDUJ9gI8RF4INvRbJfdclYJn2Q7v98dMGJ2QJJgBoU
         oINfenqzECwvohgxXvCTC72OGRCs+rHlJGhK6m/J4CmuNjZ7StpQlAermDDsg2RNgQui
         Zdf4MMz6Ye9JnMCLv7cT0qMlPZhYpWz95T7HvKx0CHJy0Y4BACEGBFKdVfZwgT4Dv7MW
         sSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682523868; x=1685115868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXQNOWAgaQUYazZwWqEqVInZKkPuNKRlqWvisd07x0c=;
        b=LrXKbRl+5YztdDq5ivA6qNBxe8boHeQyBuFiP8GgXPHm15MnqpjoyMOrTjErwuGJXZ
         641O7WqMjtA/IfnQmmRcEHInAYUQbQrcgRcxYjiYDUQrxe+Q1hu6TG9eS5osJFsjyazo
         Hn7firVrgb4kZScqbdtDr4AT8JOEqoFjOb8Lk0irWjO/gdrr2emdROGEJLx5OL+jqS6B
         6Z1ytPzrYBemgx5X/ng5YGZ6zqOylT8pByxebeVYH3ThSRecjlKKkceUIUbaJcv/l9l4
         bissiKDOM7K1al/EbGFtjtUZLVRJPMO826pNO3151N2IIHkGAZvX8gnqbtYKanR/Qk/a
         vcBA==
X-Gm-Message-State: AAQBX9fg3UOPYVeUKwNktQbJpU1oLCCVkPg1iKFjCb8rWclMjdY3P/V7
	HIfvIo7mLyVi/KOTysgD4UYWWG0JSymKLdUJ0vx8nA==
X-Google-Smtp-Source: AKy350Z/5TuE0+K++nEwdNjaz0RlAMjk+PcIU7bEeXRCFoKajxj+SMhKDX9XKss8v4AizPiUc/2VGuMR/H7llYSf0vA=
X-Received: by 2002:a2e:91ce:0:b0:2a7:a5a4:b878 with SMTP id
 u14-20020a2e91ce000000b002a7a5a4b878mr5072129ljg.50.1682523868258; Wed, 26
 Apr 2023 08:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230426141333.10063-1-ajones@ventanamicro.com>
In-Reply-To: <20230426141333.10063-1-ajones@ventanamicro.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 26 Apr 2023 08:43:52 -0700
Message-ID: <CALs-HsvyjsK+_Re_7vTaXe6r1iCy8fRC-16vwiMk2NmsFqB77g@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: hwprobe: Couple fixes found on late review
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_084431_614693_38F9905C 
X-CRM114-Status: GOOD (  11.77  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgNzoxM+KAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSSBkaWRuJ3QgZ2V0IGEgY2hhbmNlIHRvIHRha2Ug
YSBjbG9zZSBsb29rIGF0ICJbUEFUQ0ggdjYgMC82XSBSSVNDLVYKPiBIYXJkd2FyZSBQcm9iaW5n
IFVzZXIgSW50ZXJmYWNlIiB1bnRpbCBub3cuIEkgc3BvdHRlZCBhIGNvdXBsZSBpc3N1ZXMKPiB3
aGlsZSBsb29raW5nIGFuZCB0aGlzIHNlcmllcyBjb2xsZWN0cyB0aGUgZml4ZXMuCj4KPiBBbmRy
ZXcgSm9uZXMgKDIpOgo+ICAgUklTQy1WOiBod3Byb2JlOiBUaGVyZSBjYW4gb25seSBiZSBvbmUg
Zmlyc3QKPiAgIFJJU0MtVjogaHdwcm9iZTogRXhwbGljaXR5IGNoZWNrIGZvciAtMSBpbiB2ZHNv
IGluaXQKPgo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyB8IDYgKysrKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIu
MzkuMgoKU2lnaCwgd2lzaCBJIGhhZCBzcG90dGVkIHRoZXNlLiBUaGFua3MhCgpSZXZpZXdlZC1i
eTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
