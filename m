Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D3FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 08:46:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B91B061B4C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 08:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B91B061B4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bizjoindeal.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQsqD51j01HVpIF2s2zeiseJCcAb3ZJq0Ka19OflCQs=; b=0J4Yw0mm/vSyd7
	U2JevczP2y/JjydhgVzZtz9f/eEVT2c0FPGY5j24NRGU8I7BSFvaaoufu7sGGDYlmKyMDMKTCW05M
	DU0GorqEdbasGW7/tCsDTxZmAhsIGLPqP7LN3J0GxpKvA3fNcOUeFVX60rbC7VbrUjOH6bNitFjgq
	aZmStaY2A+zA5adsyys0mk4aVoV99cIJ6CoIECs7eZZjaH6QiESdE2SaOXutnov+VcuHXI/SlaeKe
	0a8DtvRzU+ovT+bhJU8Q2huNwK7uDmChnjwqKUAwn17G1Ab+i+bn7fEdVf84afFulV3bT3Q3e1y9s
	lK7NwBdZP54ZNwfYeSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmu6y-000muY-8V; Tue, 16 Nov 2021 08:46:40 +0000
Received: from mail.bizjoindeal.pl ([80.211.97.164])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmu6w-000msx-46
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 08:46:39 +0000
Received: by mail.bizjoindeal.pl (Postfix, from userid 1001)
 id AD8EAA285D; Tue, 16 Nov 2021 08:46:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizjoindeal.pl;
 s=mail; t=1637052396;
 bh=JZuQ1fK7zFtz2oeUB7Xfid9vb7kUywdmDd2OluR8ywA=;
 h=Date:From:To:Subject:From;
 b=ErzDvcfVbrjIUJFawKwKTV2VI3M850Dzp++Tm4PzYXmfz4RnSrhck8A5N4BRmU3Uj
 kTzrNz4/XSmPUZ5DqL6BqwsVyFVRN7F3RzgL1XGdk86/vGlZkrxpnDM9L9cVc7Kpm+
 di5/R5vgbOR3FrM9385twaXqlBHHOyaOd+UiHEFbfDnz2j7zNDK98lnJ4kdn45KkiH
 0P2PKSMsFCZA2EDDL8WpxZgnKTShq9GkBHMPjPIQZqCm8bXu/e9sF7qA9DpZKrApC1
 SF/PnqYyCOakr6AVh44fl+99qPPcuA61Cr0JNt6jtt0rp0xpOOWAHHQd+hTCaTr8JV
 yR1fj/cOYdsXw==
Received: by mail.bizjoindeal.pl for <linux-riscv@lists.infradead.org>;
 Tue, 16 Nov 2021 08:46:10 GMT
Message-ID: <20211116074500-0.1.60.f0ek.0.gnnug4i8dg@bizjoindeal.pl>
Date: Tue, 16 Nov 2021 08:46:10 GMT
From: "Dorian Kwiatkowski" <dorian.kwiatkowski@bizjoindeal.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.bizjoindeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_004638_333053_C172417F 
X-CRM114-Status: UNSURE (   1.37  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGRv
c3RyemVnYW0gbW/FvGxpd2/Fm8SHIHJlZHVrY2ppIG9wxYJhdCB6YSBwcsSFZC4KCk9kcG93aWVk
bmlvIGRvYnJhbmEgaW5zdGFsYWNqYSBmb3Rvd29sdGFpY3puYSB0byByb3p3acSFemFuaWUsIGt0
w7NyZSBwb3p3YWxhIHd5Z2VuZXJvd2HEhyBzcG9yZSBvc3pjesSZZG5vxZtjaSB3IHNrYWxpIHJv
a3UuCgpDaGNpYcWCYnltIHBvcm96bWF3aWHEhyB6IFBhxYRzdHdlbSBvIHRlZ28gdHlwdSByb3p3
acSFemFuaXUsIGEgdGFrxbxlIHByemVkc3Rhd2nEhyB3c3TEmXBuZSBrYWxrdWxhY2plLgoKQ3p5
IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaT8KClBvemRyYXdpYW0sCkRvcmlhbiBLd2lhdGtv
d3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
