Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834F4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 12:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50ECF20863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 12:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qrcbcmUN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EBTa0Bbf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50ECF20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCQBpusShADRXB+vaDIdea0tIYSVoDIkF5gAEAaNJy4=; b=qrcbcmUNC1dVNM
	WcZt6QlyYPehds1RhhL77/XKo72qQ8WdnIdVgNgZiooUUd2UZU+7D2CcFUwqsNi1ALvyBKWs47BYM
	Dl8EehG5ApRKD2paSTQQP1+QONxVN2mWLOgJqZ9j6cemdjp1LvnR5dtSbjv4f+5HhGqXg27CC55w6
	7J8txcEamv9ujoE3QX4cwVZ0k7DLRBCcCEtpRi0ZkNTiuNR6XAizHUSnrBcdiyy5wcegXnRKcnv+c
	aFjwcgdxvf191WCCRJbJiOFYqxo8o9Ggvdw88jGopFBzpMqCP5KZWmf0+RNOfU3QVPLZh3vX2+u6z
	D4rxcO0oq2ArZFrgsyeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8OQs-0004ff-36; Mon, 25 Mar 2019 12:10:26 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8OQp-0004ei-4v
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 12:10:25 +0000
Received: by mail-lj1-x241.google.com with SMTP id v13so7580598ljk.4
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 05:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gbdnwxsyaq97iQCUafgGL5JXQ/w5Y2o2mTntOt3fm5w=;
 b=EBTa0BbfezLE71AxQ7JPrG9Y9jz7eZCd4A0UWyQnAAD3xyxDj5N496268U78l2etgX
 YZYn8r+8YU+b/qhe6J1OwNqDYbxpKb3xD43z2l6hQu7Z8gpCVYHyvDSyOnDgN39tq0zl
 QnRBwlj6V9/vkbQZwR2HVVGUI3r9gj7Qb7hjP48p0xIZnsoVCtV0zlKooHwzM4z0jyFd
 iQTTTFuiS3V0o6uOb4EhHIPGs7xEpITg4hCmeP9K0953xO22mXXtkaFq77U2O21QYE2g
 ET47wHOFLw+Qxb4mFYH9rHPo9mzu9WXB1jDzP7ZVtBjxsW1eDryun1093Im4XNNd9GBp
 iUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gbdnwxsyaq97iQCUafgGL5JXQ/w5Y2o2mTntOt3fm5w=;
 b=rz2yxf329zZv7t66oy+DnyFTClxu8PEkaLpQJpfVFx7BXPfJcrcaT83ab5bqSFkc8C
 /ZJOpACY722OFvwkE972g+F/SR6BgyCqi8hAcnncROCmvCy8Lg7LBoqv0O6VwAviELQG
 yLIhqSnar/FICMoFatYIT8SMgcMTJyXBUPrYm9SF1rHmJxlmWde7yEiK9vPwo5n9KO/j
 Y3C0z1NcaPlh81a0ZAQdHs2p0lPjWlVRi2z2V5dUVvI1CrIhZohFj6GcxN4fybBbTBIl
 E1nHcfl8U4KeCdJluTo3U0DsH+srX3NgDX2Di+tUd9ELX+apM96RcfxHwgjC8/Me1KgG
 Jbpw==
X-Gm-Message-State: APjAAAVWLnDVTfOMqceAJ63jY6c7SFrgQJa5ElW6rUqg72ATEzwj3lk+
 9+wIP0I6FVNK6/PpolTox+RD4tfwVP5dUsxatmk6uQ==
X-Google-Smtp-Source: APXvYqzWak45t1WHLVO1cDDvE/73sbvyQmCUK3nLR9o8/t5gyKuPjEIY08/E3rxfy8ilonoRbAO+24C9xClEix9Y+XQ=
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr12148154lji.127.1553515819051; 
 Mon, 25 Mar 2019 05:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <mvmimwotn60.fsf@suse.de>
 <CAJ2_jOE3RH9FyFg_NATcLEpHv5y89zdh06Ji2x8n3C_gp-wn6A@mail.gmail.com>
 <mvm5zsgp00d.fsf@suse.de>
 <CAJ2_jOHoNnBF2UwU6G1vdvNrJAUJdGL_RncRAOaXMWoS03cagA@mail.gmail.com>
 <CAJ2_jOFrXcxRS1oYOuYhtuRReTocmPKnoe5GO_3r_B1uAZb+xA@mail.gmail.com>
 <mvmmuljupwd.fsf@suse.de>
In-Reply-To: <mvmmuljupwd.fsf@suse.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Mon, 25 Mar 2019 17:39:42 +0530
Message-ID: <CAJ2_jOFwDouMNAj8NxLX01bpLV+rG-rFsVh7e_e2ncCBX3qt_Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] PWM support for HiFive Unleashed
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_051023_482072_F392C9F9 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgNToyOCBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1
c2UuZGU+IHdyb3RlOgo+Cj4gT24gTcOkciAyNSAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBz
aWZpdmUuY29tPiB3cm90ZToKPgo+ID4gSSBoYXZlIHNlbnQgb3V0IHRoZSB2MTEgcGF0Y2hzZXQs
IHlvdSBjYW4gdGVzdCB0aGUgaGVhcnRiZWF0Cj4gPiBhcHBsaWNhdGlvbiB3aXRoIHRoYXQgcGF0
Y2hzZXQuCj4gPiBZb3Ugc3RpbGwgbmVlZCB0byBtYWtlIHRoYXQgRFQgZmlsZSBtb2RpZmljYXRp
b24gd2hpY2ggeW91IHByZXZpb3VzbHkKPiA+IGRpZCwgdXNpbmcgZnNibC5iaW4KPgo+IFdoeSBj
YW4ndCB0aGUgZHJpdmVyIG1ha2UgdXNlIG9mIHNpZml2ZSxhcHByb3gtcGVyaW9kPwoKQmVjYXVz
ZSBhcyBwZXIgdGhlIHJldmlldyBjb21tZW50cyBhbmQgZGlzY3Vzc2lvbnMsIGl0IGhhcyBiZWVu
CmRlY2lkZWQgdGhhdCB0aGUgZHJpdmVyIHdpbGwgbWFrZSB1c2Ugb2YgdGhlIGNvbnZlbnRpb25h
bCBpbnRlcmZhY2UgdG8KcGFzcyBwZXJpb2Qgc2V0dGluZ3MgaW5zdGVhZCBvZiAnc2lmaXZlLGFw
cHJveC1wZXJpb2QnLgoKRm9yIHlvdXIgcmVmZXJlbmNlOgpodHRwczovL2xrbWwub3JnL2xrbWwv
MjAxOS8yLzYvMTU5Cgo+Cj4gQW5kcmVhcy4KPgo+IC0tCj4gQW5kcmVhcyBTY2h3YWIsIFNVU0Ug
TGFicywgc2Nod2FiQHN1c2UuZGUKPiBHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFD
RTkgMTk3MCBGNEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKPiAiQW5kIG5vdyBmb3Igc29t
ZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
