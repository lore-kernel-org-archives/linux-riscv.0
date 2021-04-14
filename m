Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E2FC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 14:21:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18BBE61019
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 14:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18BBE61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w43tu/U+dSKsU14npjhY1b8LUmGJ7c2T6o9FQ1faplk=; b=OvkHI/iHW7mQujm7tdc1Qwkru
	Q2IAwtTcQlKBeHWLO0sG/NheOe3x0Hckezhbxlta7qbYzqrjClNjWW6r9WjpGKOk5Js5QQXoxKP8o
	CQc3h6lXqyibuKs/cgWMceXjElcACh9WFwHbsqs2amWIRm+ihHo/62PU9Jb2XbOk3zDGahKwaM/0w
	E0PFrx3OODk3R5+J9c8W6RkLiijb7jlGOsjq66CeP6wqF2h6tk43wUk6qiNUeyRkRJpAAwKN6YwCK
	a3blICZTcF1ymLuJMuqfPY8I70skHMm8wBqC3ZznZwysSUgSoNKLBsoBe1A0GsJ2TwWBhA7mDMkp/
	qoAaJP6vA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWgNw-00CsLs-OY; Wed, 14 Apr 2021 14:20:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgNs-00CsLV-ID
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 14:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=sb+yeDNpNA+Bz8H8xtWBwZnjUmpmY3Grk6ocFL4I/TQ=; b=Xq6OunMvebeztgC43Hce7jjgMY
 f+1iv6CKlLEvi7EyZryMRu6+JiCu+sb+JvWVZNuboZO7ydFIYHJYQ3xySxqCI6csH9HQt9jxKf6dZ
 O690MW27dcyS/3aN3EjzIrvXWBRpDeSb63xecHOWPc0dxwkUBHn2dcCCrrwAgUK4P4V1r7QY4ozCW
 w8mkf3vZAv/Zj1U4Fk9voqnnEhJShHiNmv3H9ZGTopeCJ27CIVd40oLV12RPrEf+OTMZcmMqf7Y+8
 rHFoPMmmtgEZcYQBjBog0UCNkiBDTvlE0Nm+UVZAdIkw1keVncYwjnIOXNpBKYWGLXjpu4Wwp7rmD
 L2Omv1Yw==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgNp-007p2y-N4
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 14:20:47 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so14360070otf.12
 for <linux-riscv@lists.infradead.org>; Wed, 14 Apr 2021 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sb+yeDNpNA+Bz8H8xtWBwZnjUmpmY3Grk6ocFL4I/TQ=;
 b=HVfk+QtkxRTNz90nOoRDFi1g41C5yA5NI/ndLkdC2nUXutLyI0cslXbLRurCPBCNIp
 6P1nWTfHukY5aUH9ge6nL0/7tuPhJiOVRjTGSjn01VihAi5+D9DqH0yVSNTAZzge9FH0
 eClYBXJwNw+fiSRccdpqbtOX1sih8b1fMI5CB2q6pQKwN24LAPV9nVRBsOQ4R+UlJrvp
 ZS66rwnXzQ1n/r0TGT0Ltnclq3Z2dhqbmDZENQxVBOvkM/ci8U2MrwgiW7KW/QCTkwWr
 7MXKkeQIgRWHYn7Q7jju7/9tGgU2tl3UfYj02SBFrgOe/h1hZohzbpzID2cSeV14xDom
 LtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sb+yeDNpNA+Bz8H8xtWBwZnjUmpmY3Grk6ocFL4I/TQ=;
 b=dkFLnvyouw9cc66flIMMxm5nS7OxFR16vEVbzXG2PmareFtQ/EXALYZIDSOM2njEML
 ItTm7Hvq80bG71LkN3pffQepgZYj8E8hIafLIzmjExtE3UxRfnf5NGHoN4hAlucFOWQs
 zrC479Ci0D8skKE6CFlr2QxxU31l2WClSnWiE9VpM8CIafYZUXLvTfht+mIhfWzyhYvM
 VHGCemchTuwNm/4Bvw2zHYIBlmsj94WM5SMmkDrgLdeKgmshI5GylTKERM4OP/8Uet98
 c2fpLvLLHPEi51jCPTYKYrFKjEO3UilWnbfBFUA4ZGO6f+IddFIGAA3MLDrCt9nUHq5X
 FYag==
X-Gm-Message-State: AOAM532b8U2nwd6fwYC1z0t1k7W1aWKanuiXILVsCznzsZIyEPJFtF4a
 RDkTzhmHzyTFiJbUTaSMRhT2FBZRjBmfEFISAo/nwpiSO8Y=
X-Google-Smtp-Source: ABdhPJzVqDgUTs0CSOHiGCtXMVUP29nRAd/nar8/zWXZGwSyMpmH6yKoTRiRNGStUZoW4T97KmUZzdsisS7I7MQE5SE=
X-Received: by 2002:a4a:925a:: with SMTP id g26mr18617165ooh.29.1618409592066; 
 Wed, 14 Apr 2021 07:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
 <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home>
 <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 <87h7kukzy4.fsf@igel.home>
 <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
 <87tuob7n8g.fsf@igel.home>
In-Reply-To: <87tuob7n8g.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 14 Apr 2021 22:13:00 +0800
Message-ID: <CANXhq0rTC8grpRe_Q0vG6_52b-41OuN4vHum8RvouMbE6xiXpQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_072045_805129_759BF5DF 
X-CRM114-Status: GOOD (  13.67  )
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

T24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgNzozMSBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxp
bnV4LW02OGsub3JnPiB3cm90ZToKPgo+IE9uIE3DpHIgMzEgMjAyMSwgWm9uZyBMaSB3cm90ZToK
Pgo+ID4gSSBmb3VuZCB0aGF0IHRoZSBnZW1neGxwbGwgd2FzIGRpc2FibGVkIGltbWVkaWF0ZWx5
IGJ5IHBvd2VyCj4gPiBtYW5hZ2VtZW50IGFmdGVyIG1hY2IgZHJpdmVyIGluc3RhbGwuIFRoZSBt
YWlubGluZSdzIGRlZmNvbmZpZyBkb2Vzbid0Cj4gPiBlbmFibGUgQ09ORklHX1BNLCBzbyB0aGUg
bmV0d29yayBpcyBmaW5lIG9uIGl0LiBUaGUgb3BlbnN1c2UgZGVmY29uZmlnCj4gPiBlbmFibGVz
IENPTkZJR19QTSwgYW5kIHRoZSBwYXRjaAo+ID4gNzMyMzc0YTBiNDQwZDlhNzljODQxMmYzMThh
MjVjZDM3YmE2ZjRlMiBhZGRlZCB0aGUgZW5hYmxlL2Rpc2FibGUKPiA+IGNhbGxiYWNrIGZ1bmN0
aW9ucywgc28gdGhlIGdlbWd4bHBsbCBQTEwsIEkgaGF2ZSBubyBpZGVhIHdoeSBwb3dlcgo+ID4g
bWFuYWdlbWVudCBkaXNhYmxlIGl0LCBJIHdvdWxkIGtlZXAgdHJhY2UgaXQuCj4KPiBEb2VzIHRo
YXQgbWVhbiB0aGF0IENPTkZJR19QTSBhbHNvIGFmZmVjdHMgdGhlIEZVNzQwPwo+CgpZZXMsIHdl
IGdvdCB0aGUgc2FtZSBwcm9ibGVtIG9uIHRoZSBGVTc0MC4gV2UgYXJlIGNoZWNraW5nIHRoZSBp
c3N1ZS4KCj4gQW5kcmVhcy4KPgo+IC0tCj4gQW5kcmVhcyBTY2h3YWIsIHNjaHdhYkBsaW51eC1t
NjhrLm9yZwo+IEdQRyBLZXkgZmluZ2VycHJpbnQgPSA3NTc4IEVCNDcgRDRFNSA0RDY5IDI1MTAg
IDI1NTIgREY3MyBFNzgwIEE5REEgQUVDMQo+ICJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxl
dGVseSBkaWZmZXJlbnQuIgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
