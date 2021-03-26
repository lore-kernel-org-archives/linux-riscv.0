Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC03C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 09:24:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 026D561A2B
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 09:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 026D561A2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ekGQLuidKRk9xD6Ao8lpZRh05GJ9gMmY3SPETHjyvJI=; b=FBQ5WIMBdeM5w4viG/FK+b83L
	BCEhTzOWGZ05SP3FBMPdpyMph0d4YTCPTolvre1z9a1dpaqqGhjFt+DrDrjWvSN8kMgPtCa1t86Xx
	nSLuQ1gpfx4sb4vCXt9ELElj0ihfVL+Y9uTutdPEmrD1/GwP44ngLF+k5e9F9IKNvWknqQk/r5Uuz
	Fil7lk7vXixEzQelsh7KbmXijd9fmQGN/7Kn2wcio4uATXKJJop/s1hEEEezXg4pxv+KwDPFYQUn+
	aWoiIbrkMnmWD30Rd9KWereBjdyA3u3dbmFc8VwaZvOXzBzOzzHKNQe0rGDpJlgfX/PabzxZcRiKM
	qSOBPYb6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPihK-0038m4-88; Fri, 26 Mar 2021 09:24:06 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPihF-0038kD-Sr
 for linux-riscv@lists.infradead.org; Fri, 26 Mar 2021 09:24:03 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F6GkR6H8Gz1qt40;
 Fri, 26 Mar 2021 10:23:59 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F6GkR4tzVz1t6pj;
 Fri, 26 Mar 2021 10:23:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id fB4OuhIEoFq3; Fri, 26 Mar 2021 10:23:58 +0100 (CET)
X-Auth-Info: RD340VefAltwVGhu9FHpvBgwiiOsuc6yxU4umPBdhXx5rJnVHdqaOWi4KWJyqhM/
Received: from igel.home (ppp-46-244-160-134.dynamic.mnet-online.de
 [46.244.160.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 26 Mar 2021 10:23:58 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 17C672C31B4; Fri, 26 Mar 2021 10:23:58 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Stephen Boyd <sboyd@kernel.org>,  Pragnesh Patel
 <pragnesh.patel@openfive.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org,  linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
 <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
X-Yow: My uncle Murray conquered Egypt in 53 B.C.  And I can prove it too!!
Date: Fri, 26 Mar 2021 10:23:57 +0100
In-Reply-To: <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 (Zong Li's message of "Fri, 26 Mar 2021 17:10:24 +0800")
Message-ID: <874kgyfetu.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_092402_133519_5BD8E75A 
X-CRM114-Status: GOOD (  10.23  )
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

T24gTcOkciAyNiAyMDIxLCBab25nIExpIHdyb3RlOgoKPiAxLiBCb290IG9uIG9wZW5TVVNFLVR1
bWJsZXdlZWQtUklTQy1WLUplT1MtaGlmaXZldW5sZWFzaGVkLnJpc2N2NjQucmF3Lnh6Cj4gdy8g
cGx1Z2dpbmcgZXRoZXJuZXQgY2FibGUKPiAgIC0gSXQgc2VlbXMgdGhhdCBJIGVuY291bnRlcmVk
IGEgZGlmZmVyZW50IHNpdHVhdGlvbiB3aXRoIHlvdSwgbXkKPiBzeXN0ZW0gaHVuZyB1cCBhbmQg
SSBkaWRuJ3Qgc2VlIHRoZSBib290IG1lc3NhZ2UgeW91IG1lbnRpb25lZCB5ZXQuCgpUaGF0J3Mg
ZXhhY3RseSB0aGUgaXNzdWUuICBUaGUgcHJvY2VzcyBpcyBzdHVjayBpbiBELgoKQW5kcmVhcy4K
Ci0tIApBbmRyZWFzIFNjaHdhYiwgc2Nod2FiQGxpbnV4LW02OGsub3JnCkdQRyBLZXkgZmluZ2Vy
cHJpbnQgPSA3NTc4IEVCNDcgRDRFNSA0RDY5IDI1MTAgIDI1NTIgREY3MyBFNzgwIEE5REEgQUVD
MQoiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
