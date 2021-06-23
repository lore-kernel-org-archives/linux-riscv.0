Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87578C4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 09:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A836112D
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 09:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A836112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtBGGM01UXEGb2W41fvEWgqMLypS4ijxdTXcD4kiYJI=; b=vpwv2t44Qnlxvfzz2egf0g9VeT
	Y1ZTaUC7aOiyNWtKaYGB/7upGOElvdxmUJzPeQ4hu/etPXx30KgNke91RfV/tnxMHC0riFrC9HG9/
	42SdifNrxJks82TA6890W4F9Y1tku/w7gog1LKhRLtsayBwkAX1KIDN9jiyutWI/mh+UfmLDvA70O
	ftzc2eFO+YwlztkiHLT4+8E2XliMPiZgicxrOaEwbxn+dFs93svw9w0s4NGraVUv0rj5FiAMl4fxl
	NJsOYYhWKFvZXV+9+vnPGyJBHXq03KwlcRoB3WdH5m0sQEVCyB43KfbjX+B22PD05WUwEuee74RQ9
	eXWre/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvzV6-00ACZI-NS; Wed, 23 Jun 2021 09:48:52 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvzV3-00ACVC-6g
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 09:48:51 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15N9maio089295
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 12:48:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1624441711; x=1627033711;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MISFftgg2hIKWcEtfdZHWCPZ3XpVUN6O8IsMWxh6AwY=;
 b=b/R6w9sFXlUiHNOh4jO8lZEfd0LyYx5EYOhxNLwH25n/oaVEJ6HxNyNzIm8IjZ5B
 d22Gw5m5dGemQDvC9folwTeWWlsdmdDIvGkpi3uVMtriocxYSohf3QJbUMd5gfT4
 rOP3w94LSTCaysDW0hx01zTbwlCdy66KGLfkyhaFK9qD2jpXo4g2y2utO3aZ2MkA
 MkRAHU07YP4ergQpl+7bxXTOiWOGZpcIWmTpBjgohV8DlvLQ8aTwuq6BezvSGkHc
 oPbWsoB5avF/211Yk9sTTPmIUz/4An0Ck22fAwV7dIoRjBNTcRsqj+IYgGbP5z4a
 UUU+GvulJgoH0/bCNQnTPw==;
X-AuditID: 8b5b014d-96ef2700000067b6-fe-60d3036faf83
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 34.3E.26550.F6303D06; Wed, 23 Jun 2021 12:48:31 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 23 Jun 2021 12:48:30 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
 <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, Akira
 Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 1/3] riscv: optimized memcpy
Organization: FORTH
In-Reply-To: <CAFnufp0JuAvrOA89KDbcbhMeMvovoS96STVV+r53PLGJV4r0aw@mail.gmail.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-2-mcroce@linux.microsoft.com>
 <87f2cf0e98c5c5560cfb591b4f4b29c8@mailhost.ics.forth.gr>
 <CAFnufp0JuAvrOA89KDbcbhMeMvovoS96STVV+r53PLGJV4r0aw@mail.gmail.com>
Message-ID: <6b35ec67ae580c64b4259e92ce21dc49@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsXSHT1dWTef+XKCwYHZ6hbb3l1lsdj6exa7
 xaIV31kspvbEW+xYupnJ4t6KZewWL/Y2slg8WTOT0aJj11cWi8u75rBZbPvcwmZx8dd8Rovm
 d+fYLV5e7mG2aJvF78Dv0T97CpvHu9/LGD3evHzJ4nG44wu7R0ffPxaPnbPusns83HSJyWPT
 qk42j1/bjzJ5bF5S73Gp+Tq7x+dNch7tB7qZAnijuGxSUnMyy1KL9O0SuDL6pv5iK5jMUTHz
 0hqWBsZjbF2MnBwSAiYS51tOs3cxcnEICRxllHj2qJsVImEqMXtvJyOIzSsgKHFy5hMWEJtZ
 wEJi6pX9jBC2vETz1tnMIDaLgKrExX/3wWw2AU2J+ZcOgtWLCOhKXPxwGGwBs8AkVon599vB
 ioQFjCXOX2oEG8QvICzx6e5FsMWcAoESbfvfMUJc9J1RYu3zPVBXuEj0TGuBuk5F4sPvB0BT
 OThEgezNc5UmMArOQnLrLCS3zkJy6wJG5lWMAollxnqZycV6aflFJRl66UWbGMHxyOi7g/H2
 5rd6hxiZOBgPMUpwMCuJ8D5quZQgxJuSWFmVWpQfX1Sak1p8iFGag0VJnJdXb0K8kEB6Yklq
 dmpqQWoRTJaJg1OqgSkn6N6hWEPnmLqXAvdeKUkntC+s2n7j+O9SwUQDdbv1GxYoiS8VT61e
 WML7Kk0m8ktGgdDXNOX/osfZ5hxWWHK1T0HEjVksWekf35w793JfPeVPdNez8nSp8jjxhYO1
 zN7r0dd0B6U/LSvdH9qeWbLq9otz2kH3b+sxrWi8WeJ6wGPRuo97zC0yd3xbru72fZ2Pz6TD
 x9LcXb3zN2iF+r1/G7nl3d1prr6OZnmX7DZstGozP5wsv9l78oPDe+du7Ov/8epmefPUKouw
 TTPqpNcxLDk66/8uTsuJcjKHWwtvt5y2tz13XXabB6PgOqdPx6+or95b/GG5apXq9P9rZi7+
 Zy8aox1mf+bozpN2RteVWIozEg21mIuKEwEza0BxNgMAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_024849_663996_D1D70463 
X-CRM114-Status: GOOD (  10.25  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wNi0yMyAwMjozNSwgTWF0dGVvIENyb2NlIM6tzrPPgc6xz4jOtToKPj4g
Cj4+IElmIHlvdSB3YW50IHRvIGJlIGNvbXBsaWFudCB3aXRoIG1lbWNweSB5b3Ugc2hvdWxkIGNo
ZWNrIGZvciAKPj4gb3ZlcmxhcHBpbmcKPj4gcmVnaW9ucyBoZXJlIHNpbmNlICJUaGUgbWVtb3J5
IGFyZWFzIG11c3Qgbm90IG92ZXJsYXAiLCBhbmQgZG8gbm90aGluZwo+PiBhYm91dCBpdCBiZWNh
dXNlIGFjY29yZGluZyB0byBQT1NJWCB0aGlzIGxlYWRzIHRvIHVuZGVmaW5lZCBiZWhhdmlvci4K
Pj4gVGhhdCdzIHdoeSByZWNlbnQgbGliYyBpbXBsZW1lbnRhdGlvbnMgdXNlIG1lbW1vdmUgaW4g
YW55IGNhc2UgKG1lbWNweQo+PiBpcyBhbiBhbGlhcyB0byBtZW1tb3ZlKSwgd2hpY2ggaXMgdGhl
IHN1Z2dlc3RlZCBhcHByb2FjaC4KPj4gCj4gCj4gTW1tIHdoaWNoIG1lbWNweSBhcmNoIGltcGxl
bWVudGF0aW9uIGRvZXMgdGhpcyBjaGVjaz8KPiBJIGd1ZXNzIHRoYXQgbm9vbmUgaXMgY3VycmVu
dGx5IGRvaW5nIGl0Lgo+IAoKWXVwIGJlY2F1c2UgZXZlbiBpZiB0aGV5IGRpZCB0aGUgd291bGRu
J3Qga25vdyB3aGF0IHRvIGRvIGFib3V0IGl0IHNpbmNlIApQT1NJWCBsZWF2ZXMgdGhpcyBhcyB1
bmRlZmluZWQgYmVoYXZpb3IuIFNvIGluc3RlYWQgb2YgdXNpbmcgbWVtY3B5IGl0J3MgCnN1Z2dl
c3RlZCB0aGF0IHBlb3BsZSB1c2UgbWVtbW92ZSB0aGF0IGNhbiBoYW5kbGUgb3ZlcmxhcHBpbmcg
cmVnaW9ucywgCmFuZCBiZWNhdXNlIHdlIGNhbid0IHBhdGNoIHRoZSByZXN0IG9mIHRoZSBrZXJu
ZWwgdG8gb25seSB1c2UgbWVtbW92ZSAKKG9yIHRoZSByZXN0IG9mIHRoZSBwcm9ncmFtcyBpZiB3
ZSB3ZXJlIGEgbGliYyksIHRoZSBpZGVhIGlzIHRvIGp1c3QgCmFsaWFzIG1lbWNweSB0byBtZW1t
b3ZlIChCVFcgVG9ydmFsZHMgYWxzbyB0aGlua3MgdGhpcyBpcyBhIGdvb2QgaWRlYTogCmh0dHBz
Oi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9NjM4NDc3I2MxMzIpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
