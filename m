Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF0DC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:49:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36DF64D9D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D36DF64D9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XPE2pA2ucth1H1JqC6WNZpRFWKWa8MXw4aYpOABPiu4=; b=CSC1HBMwb07dY0y495zYTdcEI
	LLPDlsdsXF6JUYxzirlxsEYCb7ovKQ8NzmdLgYbvuWD4GVdxt/wWXJVxSV5+PulKiJcqvE5DH59Aj
	wvvePBskXTWt7/GUW02XZvVPt9axETsC+ptZCR9hJvTExKpnLHO56Fw45UG596y8nWyPdw+HsIiQy
	kmASeN/zrVF+Pn06UEwewd/IFtSFvL04QMqOfJmbbwAi3uL/HyEsAKnDDyL1x2r7WOTBWqKc5AALH
	PWr6eLaeB+mmrC2R+zu4+QC/io9zFCBBMzSclRZwXPnOBtrE/CnzKrR7+WEruJDhVdvbN+ByYOGBG
	oRG6vYBeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNApC-006txa-Of; Fri, 19 Mar 2021 08:49:42 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNAp8-006txB-A3
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 08:49:40 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F1yHz4KJ4z1rtZ9;
 Fri, 19 Mar 2021 09:49:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F1yHz34v7z1sP6R;
 Fri, 19 Mar 2021 09:49:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id pEgi9qVBcpwg; Fri, 19 Mar 2021 09:49:33 +0100 (CET)
X-Auth-Info: pTxAnb4Mc8iFd5L0WIVcqfio6E5ucIdWhyLPfaupxX6ACX/btDAh/hVhso7VVkf0
Received: from igel.home (ppp-46-244-191-242.dynamic.mnet-online.de
 [46.244.191.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 19 Mar 2021 09:49:33 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 71ECC2C3171; Fri, 19 Mar 2021 09:49:33 +0100 (CET)
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
X-Yow: The LOGARITHM of an ISOSCELES TRIANGLE is TUESDAY WELD!!
Date: Fri, 19 Mar 2021 09:49:33 +0100
In-Reply-To: <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 (Zong Li's message of "Fri, 19 Mar 2021 16:20:08 +0800")
Message-ID: <87lfaj7cki.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_084938_514381_81E8AB0B 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

T24gTcOkciAxOSAyMDIxLCBab25nIExpIHdyb3RlOgoKPiBDb3VsZCB5b3UgcGxlYXNlIHBvaW50
IG1lIG91dCBob3cgdG8gdGVzdCB0aGUgZXRoZXJuZXQgZnJvbSB5b3VyIHNpZGU/CgpQbGVhc2Ug
dXNlCjxodHRwczovL2dpdGh1Yi5jb20vb3BlblNVU0Uva2VybmVsLXNvdXJjZS9ibG9iL3N0YWJs
ZS9jb25maWcvcmlzY3Y2NC9kZWZhdWx0Pi4KCkFuZHJlYXMuCgotLSAKQW5kcmVhcyBTY2h3YWIs
IHNjaHdhYkBsaW51eC1tNjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0
RTUgNEQ2OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNvbWV0
aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
