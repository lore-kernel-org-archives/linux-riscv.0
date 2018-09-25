Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751DEC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 02:35:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F3F2145D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 02:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qL2f5eWV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6xiOw9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35F3F2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lx3yoA4lVM55rraBeclkfGTarIapW3piKU36Hw4R6F4=; b=qL2f5eWVyBCKjb
	NCZhZD4Vkmx0XlEsFMGVks6eSKRiXlphzxJ94UGmRYkdQ+5XkiXXlyJzmvC2Tn7J1BOnau3ycQoZa
	RpKiF1U7bquyaFdUufqz8BdUt9KoqZdTARuG2scWyhceXavSmW602/NdqeQTHM/qk3iW5ZqscUZSk
	aOU+66OfnZ6ZWfQxtjujMdPpbzJdkBMufF6FMubC6exK4/yz3iTo+WBz8irmX9M5kIi1TB7qU+DAe
	5rq6qZl0KLowjtnIxbC/+s8eiVs3UPzF/cG4i+okNG4qJrbNWMnfMVV2ZFJA5q+UCW2pLMl/SYGSR
	10jXj1y4dNj0Xy/9oLuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4dBm-00078n-1Q; Tue, 25 Sep 2018 02:35:02 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4dBM-00076w-NI
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 02:34:40 +0000
Received: by mail-it1-x141.google.com with SMTP id h23-v6so13292501ita.5
 for <linux-riscv@lists.infradead.org>; Mon, 24 Sep 2018 19:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dVmfr63hrnP4U38TbLg1c0GMQyb98je9tIJ7oyY1q+c=;
 b=M6xiOw9nv2H1sEPveZKoB6Qob7hjg/vLl7bE62qxvked+Jm0Nt6Xpl6ftjsmwsoQsa
 TxnjPkY5XrSoe5bYFcek+2Vu78xiUw4amETINDnHNCh4BAROAkAIhCmAziC1DXY20tps
 ULWf1AWAuidVM3H3MAkfSly+LMC6zxbMtPioAKVbu8qqEhWRCH/odQrY0xWg8SGMQqpx
 Pttp21R5Xi12Q5buNFEqFnVpulmwKPCgpdTStpL/eJZw49dRjxmh9SoTxUth5NN+8JAa
 npIuY9fUfWYbXYdWkNASS3Ir0mQpNFOyfmgU5elcKws96srVDsz3zCxJRHxk+TCPQ2XF
 l3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dVmfr63hrnP4U38TbLg1c0GMQyb98je9tIJ7oyY1q+c=;
 b=KHENhZuxmIMZF6NBnq8pnkzTcK0XcDdMwoElkg32GBL2kwJfdRL0fPiQiYWflvSLAT
 ZAh7wAC9HcG7A9J3I0Zc3Jx6hULr1kCT8cF42hc0Cbd1TM56iiO9QFtHR0utZ+MC/5S7
 aBD+M22+FfGVwgVhOs3OTfbtz/+fDr8hkdpWdw9h1byqLfBAy91HxqNDR7WCXDhh2MSa
 oFhtrDDL0bcTyJLZwVISKMMNaiViOoZbw2FhH+01NWWNfu3m9lLYBR8T1VXW6qVhZQ+R
 QlFpiqbR6+9R9RlW7CldQYYUU/DWjmZ7goUSqBLavh5EZIDWb0Ja/Rc9QiGANHpwccTq
 /hDw==
X-Gm-Message-State: ABuFfog3hvX0M4CJVJn9ROJP8FAyq9kzUilM9ac+DwFS1IQhzHTpkL++
 uoVTwPcroxRrWKuYTr4JvWg+MAur3d9kocHgaew=
X-Google-Smtp-Source: ACcGV61sz7wbYZ75HAF6Jry/tPsvlQsGl7XtzT8+NVsyH9C5lpLoJTG/ko0JH/aiKdEXP3kJ/1GQSUn4jBOIGwRHwwI=
X-Received: by 2002:a24:ee0c:: with SMTP id
 b12-v6mr1016681iti.33.1537842844025; 
 Mon, 24 Sep 2018 19:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537260207.git.zongbox@gmail.com>
 <40c77db9ee2d23479ff90f2658539d29d7a30896.1537260207.git.zongbox@gmail.com>
 <20180921065806.GA8401@infradead.org>
In-Reply-To: <20180921065806.GA8401@infradead.org>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 25 Sep 2018 10:33:52 +0800
Message-ID:
 <CA+ZOyaj2Ed3GCK0icaRNcttM7set=V1ffravCZefwmykD8=eMg@mail.gmail.com>
Subject: Re: [PATCH 1/5] RISC-V: Build tishift only on 64-bit
To: hch@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180924_193436_795750_B9D8C043 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: Zong Li <zong@andestech.com>, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vincent Chen <vincentc@andestech.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925023352.Uh_aF1fGqrxkJHjicdA0o_YDQWsyyy5K20q_qtoTNxU@z>

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiDmlrwgMjAxOOW5tDnmnIgyMeaX
pSDpgLHkupQg5LiL5Y2IMjo1OOWvq+mBk++8mgo+Cj4gT24gVHVlLCBTZXAgMTgsIDIwMTggYXQg
MDU6MTk6MTNQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+IE9ubHkgUlY2NCBzdXBwb3J0cyAx
MjggaW50ZWdlciBzaXplLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmdAYW5k
ZXN0ZWNoLmNvbT4KPgo+IFRoaXMgbG9va3MgZmluZS4gIEp1c3QgY3VyaW91cywgd2hhdCBkbyB3
ZSBldmVuIG5lZWQgMTI4LWJpdCBpbnRlZ2Vycwo+IGZvciBvbiByaXNjdjY0PyAgRGlkIHlvdSBz
ZWUgYW55IGlzc3VlcyBpZiB5b3UgZHJvcCBpdCBlbnRpcmVseT8KCllvdSBjYW4gcmVmZXIgdG8g
dGhpcyBpc3N1ZSwgYnV0IEkgZGlkbid0IHRyeSBpdC4KaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2
L3Jpc2N2LWxpbnV4L2lzc3Vlcy8xMzYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
