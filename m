Return-Path: <SRS0=fQzb=IM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE466C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 07:19:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E196664E75
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 07:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E196664E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FJsevWRyD/XepUqvf9qPHa8xPw7BYiZv29/Xa+CB8Ng=; b=YAmK+D0EDmx+TD9KEx6j9cjAj
	SA2xBsc+6pJNPXXvugmKuAqn3OB4++ikItYtysvG4rBr1uj1FvnehM9llm/KON+/jjXdUGOpMXnW3
	FTGndMvh+wwhnaeGXWRwzzm8bBPazy8qQa7e5tdUOtnjbi/UsgG46mqBC8FlqPEHMi7sgURyunJ/H
	qQdGd7gwZrXAe4MHtzCVF/d+bOUUDg9WwqRXHaAXnKEdtGn/mM/mK0eqAUjZLXwCJ9qF5+HY/HI4E
	efqxG+TS1BIyDbRcUPs//07DOYFJGGOjcv8vuMQouyF/JNXblJ+rrHFl5R0Nun8hL0dA6Sx1KTSI5
	n2Fssoirw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLL25-00Dz0a-2r; Sun, 14 Mar 2021 07:19:25 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLL1y-00Dz03-LT
 for linux-riscv@lists.infradead.org; Sun, 14 Mar 2021 07:19:21 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DyrX3341cz1qs06;
 Sun, 14 Mar 2021 08:19:15 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DyrX26Xqsz1qqkQ;
 Sun, 14 Mar 2021 08:19:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id kh2w0-FB6Dkc; Sun, 14 Mar 2021 08:19:13 +0100 (CET)
X-Auth-Info: eWvXQ3Lwpm1P/x9kl5BzLa1V9xuoSZOfCTBLeNF9IB1Mu5PfC0G9B/OAjqWFIdKx
Received: from hase.home (ppp-46-244-178-11.dynamic.mnet-online.de
 [46.244.178.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 14 Mar 2021 08:19:13 +0100 (CET)
Received: by hase.home (Postfix, from userid 1000)
 id 60412102A82; Sun, 14 Mar 2021 08:19:12 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Cc: Claudiu.Beznea@microchip.com,  linux-riscv
 <linux-riscv@lists.infradead.org>,  ckeepax@opensource.cirrus.com,
 andrew@lunn.ch,  Willy Tarreau <w@1wt.eu>,  Nicolas Ferre
 <Nicolas.Ferre@microchip.com>,  daniel@0x0f.com,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  pthombar@cadence.com,  Network
 Development <netdev@vger.kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: macb broken on HiFive Unleashed
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
 <87y2euu6lf.fsf@igel.home>
 <CANBLGcyteTgQ2BgyesrTycpVqpPeYaiUCTEEp=KmPB0TPqK_LQ@mail.gmail.com>
X-Yow: I'm a GENIUS! I want to dispute sentence structure with SUSAN SONTAG!!
Date: Sun, 14 Mar 2021 08:19:11 +0100
In-Reply-To: <CANBLGcyteTgQ2BgyesrTycpVqpPeYaiUCTEEp=KmPB0TPqK_LQ@mail.gmail.com>
 (Emil Renner Berthing's message of "Sat, 13 Mar 2021 22:54:02 +0100")
Message-ID: <87o8fm42z4.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_071918_999070_95F0DD2A 
X-CRM114-Status: UNSURE (   9.25  )
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

T24gTcOkciAxMyAyMDIxLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKCj4gQXMgeW91IGNh
biBzZWUgSSBoYXZlbid0IHVwZGF0ZWQgT3BlblNCSSBvciB1LWJvb3QgaW4gYSB3aGlsZQoKRG9l
cyBpdCBhbHNvIHdvcmsgaWYgeW91IHVzZSB0aGUgdS1ib290IFNQTCBpbnN0ZWFkIG9mIEZTQkw/
CgpBbmRyZWFzLgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKR1BH
IEtleSBmaW5nZXJwcmludCA9IDc1NzggRUI0NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjczIEU3
ODAgQTlEQSBBRUMxCiJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQu
IgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
