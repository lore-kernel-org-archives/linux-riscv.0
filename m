Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0428C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KVd9gISzNxKs3vUL1CaOIMe+V5NmYrSzksJLXgQQMc=; b=ROKQjrMycg05gb
	vk0bo176O5vNlAvaj0axu8WrhmXKSSZOiUue98TsSys8Mg96kw0KjsC7q0jwWQ8XNJ9+ZAHJuTM6k
	CJyV7U6IRRs3Va1veFj2cgATq84m7DDEd8LpiNA0EtGtt7vAw4SLSbqWLPY/VdiwmT5fXJcY/qeAW
	cvP91ENG68FSfIOBb86W+HaZF+87QcoiJ7ukI6K1/8r2WOebDgVCYaiorzztVHlaBVSW2EFmCtuDA
	zGqrAtMJ/sdNBtZzcvS6c0B0kypOunUpeZ1/LfLtg7BGkjeTYtPfBQ+/MeFooG9BVq5uEohQE72Ov
	SQ+Umcs1lC0wbOHEjIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC7K-006WVZ-2P;
	Tue, 25 Jul 2023 07:05:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC7G-006WTY-2n
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:05:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31763b2c5a4so1338846f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690268749; x=1690873549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCISgvcHkLE+IYvaLKjaAqSLgVkajEMYvriq0KgJeCs=;
        b=0HrQ3XBYZYdQcpqn/WILlevCOv0Bed+FdoMxOX6PFlSRZn2EEExBoyX+tV5PzdSsDH
         T4bBkG2MctRNxqI0VKGmx2AP9nq8LV1LUD954cloloOgmY9bkCcOiRmci+4li2ptKFRS
         dZ9LSG+zpvba62+Wz4a2CCjysdfTiWpkBYpfwyF37ncG6HSFKG161nZPu6x+B9JBdYuy
         lAuGeQCLugERaSurpdpOpHj2CSCUscIjju/abM6zecQAZaQvGp4XxA1OfDB92BX5GitP
         7iXoVDSHMaKMJH+rcxDgjQaXqs7QScLW54a7Htx0jqIzjVkOJ/ZAZRFvcWr21JUlVbkV
         m0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690268749; x=1690873549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCISgvcHkLE+IYvaLKjaAqSLgVkajEMYvriq0KgJeCs=;
        b=QggpUOm3Vxlvwbthuv+Zie7n9sE9OjNWcaKFmyr60UUSTg+ZpI8JOGOChPDka8OpvT
         qwKghhYfWXUYNmU4VacdFLcrA9GzWs+RVenVJuatHDtB9arHAImZ/SwTxLAcFpY3twOZ
         pw+BtT8fBqf3mYbs2c/CpJDNvPgNb9ro9gqbTyHCEHXso7FGSdJVuwGimfoYBjJO2ACZ
         0o4vsayVVW1tO+bWJSoJjhSspNEwU5wRcJ7s2j9VSwE/kHolsqX49mF2HDgTEG7fKWlr
         rbcOUKg8mjp0ghEjwNysTFgUS9osSs/oOhnq0k5s30d5vvjBKHkfilOEDdyX4SgiXAGo
         JLDw==
X-Gm-Message-State: ABy/qLbvvSMkJ10YH/uOvAYevscYzjHQ03CusFjbNnDDdzna3mDPwZm9
	7KvIiMJsIo+PF2PIBCYa5oH9gSCOs8f3ykpy8REVkw==
X-Google-Smtp-Source: APBJJlHW5uTkeyUukPBI67eBenwUVtqS23RaHFSnsmXqJ6eKmnPPYkuP9xkRhbcOO0uBVEGmXWnjsnoOmWsrsJiIoxg=
X-Received: by 2002:adf:f251:0:b0:314:1249:d5d7 with SMTP id
 b17-20020adff251000000b003141249d5d7mr10276585wrp.16.1690268748838; Tue, 25
 Jul 2023 00:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
 <20230722123850.634544-3-alexghiti@rivosinc.com> <20230724-fineness-sectional-8cdd1e4bbff2@wendy>
In-Reply-To: <20230724-fineness-sectional-8cdd1e4bbff2@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Jul 2023 09:05:37 +0200
Message-ID: <CAHVXubhVOpdZhmENkNbavAYGVZB47K9Q_4GN6RZ+rCex4uBb5g@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] riscv: Dump out kernel offset information on panic
To: Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_000555_117127_758BAD05 
X-CRM114-Status: GOOD (  11.47  )
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

SGkgQ29ub3IsCgpPbiBNb24sIEp1bCAyNCwgMjAyMyBhdCA0OjIw4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIZXkgQWxleCwKPgo+IE9u
IFNhdCwgSnVsIDIyLCAyMDIzIGF0IDAyOjM4OjQ3UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3
cm90ZToKPiA+IER1bXAgb3V0IHRoZSBLQVNMUiB2aXJ0dWFsIGtlcm5lbCBvZmZzZXQgd2hlbiBw
YW5pYyB0byBoZWxwIGRlYnVnIGtlcm5lbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExp
IDx6b25nLmxpQHNpZml2ZS5jb20+Cj4KPiBFaXRoZXIgeW91J3JlIG1pc3NpbmcgYSBDby1kZXZl
bG9wZWQtYnk6IG9yIHRoZSBhdXRob3Igb2YgdGhpcyBwYXRjaCBpcwo+IGluY29ycmVjdC4KCk9r
LCBJIHRob3VnaHQgaXQgd291bGQgd29yayB0aGlzIHdheSwgWm9uZyBmaXJzdCBkaWQgc29tZXRo
aW5nIHNpbWlsYXIKYSBmZXcgeWVhcnMgYWdvLCBzbyB3ZSBuZWVkIGhpcyBuYW1lIGhlcmUuIEBQ
YWxtZXIgRGFiYmVsdCBpZiBubyBvdGhlcgpjaGFuZ2VzIGFyZSBuZWVkZWQsIGRvIHlvdSBtaW5k
IHJlcGxhY2luZyB0aGUgU29CIHdpdGggYQpDby1kZXZlbG9wZWQtYnk/CgpUaGFua3MsCgpBbGV4
Cgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2lu
Yy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
