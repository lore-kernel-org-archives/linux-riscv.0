Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C854C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 19:50:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D20342065F
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 19:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EBB0WEjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D20342065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=znettelecom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:From:To:Subject:Content-Description:
	MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=od8+NRJk1yCUicv0DKaEf3ZAT8V51vSJR9O6Q7PkSts=; b=EBB0WEjoAD3iETzvn6RRMVasN/
	qb6WE0iL58mj333VIhGwkxKfsY/rleLiQ7KB3cxiVNUkHku8BX8uJN0+8hjBbx5R3w7O4Hvv8x4FB
	G357j069ImDDqxrkCz1GcjkctqsxG4OsZuzyrCyFSmiLKhWIrR0oguo0qCHkxYkw3YasaEvG5U3HL
	Yf0DUq5onth95dF/lk07WbIaugXF9uxlXe8LRuAoF1ksrwMPPmjmuNSsqKew1s4naFHWzCF7+ikQM
	kk1xFaWAp3wmKYhHHWv73LEZU+YtkApJlO2fIGPSiM+t4Q7PKqMMZeiKoLM8FacwyLNv4hsWNq4zL
	F/Lbidcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyhDl-0000l4-Rn; Thu, 23 Jul 2020 19:49:37 +0000
Received: from [187.0.30.10] (helo=srv01.znettelecom.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhDV-0000fo-GE
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 19:49:34 +0000
Received: from 135.205.136.77.rev.sfr.net ([77.136.205.135] helo=[172.20.10.2])
 by srv01.znettelecom.net with esmtpa (Exim 4.92.2)
 (envelope-from <alan@znettelecom.net>) id 1jyhDT-0000MK-5l
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 16:49:19 -0300
MIME-Version: 1.0
Content-Description: Mail message body
Subject: DONATION OFFER
To: linux-riscv@lists.infradead.org
From: "Steve lenka" <alan@znettelecom.net>
Date: Thu, 23 Jul 2020 21:49:09 +0200
X-Antivirus: Avast (VPS 200723-2, 23/07/2020), Outbound message
X-Antivirus-Status: Clean
Message-Id: <E1jyhDT-0000MK-5l@srv01.znettelecom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_154921_773077_6545616A 
X-CRM114-Status: UNSURE (  -4.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: stevelenkathomson12@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello, Donation of 1,000,000.00 GBP given to you by Steve & Lenka Thomson, =
This is to help fight against Corona Virus and help the poor people off the=
 streets. send email for more details: stevelenkathomson12@gmail.com
Steve & Lenka Thomson

-- =

L'absence de virus dans ce courrier =E9lectronique a =E9t=E9 v=E9rifi=E9e p=
ar le logiciel antivirus Avast.
https://www.avast.com/antivirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
