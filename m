Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C96C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 13:16:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE3B6191C
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 13:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE3B6191C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v4VSvh/DnOVbtTZVCBEHuGRJA/CybWXOjcJvHOH0ZMg=; b=Mh1Egv+x8Y74yD5s8g+9G4SPC
	FNsRfBb07HOZ6hRQIUIXuT8deIgF57RQ5EBCnqxY+AXdBQoKTFEEmiQvJ5b27Tj4kNmLYIXh9Z+je
	Mg+JLkRAA2ZEwe2c/uiUKtDmQLx1j8kaUwgh/v3zoZ3l0dcAnxKsCgfBr8jNduZdW4L7tXyP0YEqO
	DEoBaNdCz+5MIZrNBCTLAbjGJJG8sx70tKKOMrr0AFnkV2ZwMUy+Mv9bStittEUQPGkNFNEF4gtXO
	CbNlyImQEnYviPPUnFJHwGEZn946hrW2ew8wX6nXiVl0YbKtYC9ajoR4l906BjvGGbKeM4SqUgXOG
	jgokpGr9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOKPl-00Bfec-Lh; Mon, 22 Mar 2021 13:16:13 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOKMN-00BetA-RS
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 13:14:46 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F3w091rxtz1rypg;
 Mon, 22 Mar 2021 14:12:41 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F3w090K46z1qvBZ;
 Mon, 22 Mar 2021 14:12:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KJQpUmNT8TLa; Mon, 22 Mar 2021 14:12:40 +0100 (CET)
X-Auth-Info: 4s9l1LJPAorgdZM7frCRF4NG/TyeMCbMi+8bX5LvMUT+REMFzx4Yugy+2vCw4eXd
Received: from igel.home (ppp-46-244-186-141.dynamic.mnet-online.de
 [46.244.186.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Mar 2021 14:12:40 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 183A22C3227; Mon, 22 Mar 2021 14:12:39 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org,  Javier Jardon
 <javier.jardon@codethink.co.uk>,  Terry Hu <kejia.hu@codethink.co.uk>,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,  Arnd Bergman
 <arnd@arndb.de>,  dvyukov@google.com,  paul.walmsley@sifive.com,
 palmer@dabbelt.com,  alex@ghiti.fr,  linux-kernel@lists.codethink.co.uk,
 hch@infradead.org
Subject: Re: [PATCH] riscv: evaluate put_user() argument before enabling
 user access
References: <20210322120935.391973-1-ben.dooks@codethink.co.uk>
X-Yow: My EARS are GONE!!
Date: Mon, 22 Mar 2021 14:12:39 +0100
In-Reply-To: <20210322120935.391973-1-ben.dooks@codethink.co.uk> (Ben Dooks's
 message of "Mon, 22 Mar 2021 12:09:35 +0000")
Message-ID: <87o8fbmiwo.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_131444_358416_706B5ECB 
X-CRM114-Status: UNSURE (   9.39  )
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

T24gTcOkciAyMiAyMDIxLCBCZW4gRG9va3Mgd3JvdGU6Cgo+ICsgKiB0byB0aGUgcmVzdWx0IG9m
IGRlcmVmZXJlbmNpbmcgQHB0ci4gVGhlIEB4IGlzIGNvcGllZCBpbnNpZGUgdGhlIG1hY3JvCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaGUgdmFsdWUgb2YgQHgK
Cj4gKyAqIHRvIGF2b2lkIGNvZGUgcmUtb3JkZXJpbmcgd2hlcmUgQHggZ2V0cyBldmF1bGF0ZWQg
d2l0aGluIHRoZSBibG9jayB0aGF0Cj4gKyAqIGVuYWJsZXMgdXNlci1zcGFjZSBhY2Nlc3MgKHRo
dXMgcG9zc2libHkgYnlwYXNzaW5nIHNvbWUgb2YgdGhlIHByb3RlY3Rpb24KPiArICogdGhpcyBm
ZWF1dHJlIHByb3ZpZGVzKS4KICAgICAgICAgICBmZWF0dXJlCgpBbmRyZWFzLgoKLS0gCkFuZHJl
YXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKR1BHIEtleSBmaW5nZXJwcmludCA9IDc1
NzggRUI0NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjczIEU3ODAgQTlEQSBBRUMxCiJBbmQgbm93
IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
