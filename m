Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE300C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00iAZeeZ54nTxXW+lL54SBTq8J5Q1O/ptd6pxvgQzuc=; b=aDQjyDU/ToK9Fy
	FC0CBRCbETbjdHQNDTz+0OFzXMNhNfAOSAd8vVMS9VMihSkVMQHeqeOoRXIT6jk/ybPW8pEGfWQmo
	7JhgiONFSxnzZ4MKxRB+oDqF+7M0Gz8xCNS5LBipQPF8qpYB5H3FjUuJIVWtpG3r35IVQitv2Ti1v
	lbLY4yoY9WRNlRlFQyEGaODuP/oDnultfbTStmigTIFbWlQa/idYQxtZsP4tfp+AaA5O7Mw0QNlvq
	4strFIJ+jvhMlcbb7NkXyvWe80pxYJE5QSEyR2fvoXuAOe/zGwBD3tH3ge0g6xSeLPm4EW2sH1XPK
	ahUXG4R7qJaItsI8dc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPZI-00000008IKv-1QPN;
	Fri, 24 May 2024 07:42:24 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPZF-00000008IJQ-34uQ
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 07:42:23 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 673A4853BC; Fri, 24 May 2024 09:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1716536540; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=Bt9K6dUmxw0Xks5VflJg3NcrkbyygRfpbtPxwV2Lm+n9UlGzZcfhNDC8nZYpn0OoX
	 iYNpu2niIp/541JcQOrS1uYKkX2+q0FwMNQHdRfRROTUvhNeJrGirc2WGoJb4PeTJD
	 f/1T6qxlEvLuq03IhY2BHTRrTUSdyGp+H9Gzokq3gp1Kqf+X+04cX2Hjnzh01Nun7x
	 ecpgXEkhkmYa1qKgLVhSR6LL+D5eWurB8W7PYCsZ+fgbyHUHD9QoVIo+tbTBVw0E4E
	 hNMey5PIVis2LFzDcBczbt2N6qLn6r59CczzJPO/8UJNTi4/i1tTL+/bDB23W0AXfQ
	 Whh79fDUA2JwQ==
Received: by mail.quirkbyte.pl for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 07:40:52 GMT
Message-ID: <20240524084500-0.1.37.1t0e5.0.gq7pbrz42g@quirkbyte.pl>
Date: Fri, 24 May 2024 07:40:52 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_004221_920274_A5B2BF9E 
X-CRM114-Status: UNSURE (   0.10  )
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

RHppZcWEIGRvYnJ5LAogCkN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIG1vbnRhxbwgc3lzdGVtdSBm
b3Rvd29sdGFpY3puZWdvPwogCkluc3RhbGFjamEgZm90b3dvbHRhaWN6bmEgamVzdCBuYWpsZXBz
enltIHNwb3NvYmVtIG5hIG9ibmnFvGVuaWUgd3lzb2tvxZtjaSByYWNodW5rw7N3IHphIHByxIVk
IChwb3pvc3RhasSFIHR5bGtvIG9wxYJhdHkgc3RhxYJlKSBpIHphYmV6cGllY3plbmllIHNpxJkg
cHJ6ZWQgcm9zbsSFY3ltaSBjZW5hbWkgZW5lcmdpaSBlbGVrdHJ5Y3puZWouIEplc3QgdG8gdyBw
ZcWCbmkgb2RuYXdpYWxuZSBpIGJlemVtaXN5am5lIMW6csOzZMWCbyBlbmVyZ2lpLCBkemnEmWtp
IGN6ZW11IHByenljenluaWFteSBzacSZIGRvIG9jaHJvbnkgxZtyb2Rvd2lza2EgbmF0dXJhbG5l
Z28uCiAKRHppYcWCYW15IG9kIHdpZWx1IGxhdCBuYSByeW5rdSBlbmVyZ2V0eWN6bnltLiBQcnp5
Z290dWplbXkgcHJvamVrdCwgd3ljZW7EmSBvcmF6IGtvbXBsZWtzb3dvIHd5a29uYW15IGkgemfF
gm9zaW15IHJlYWxpemFjasSZIGRvIHpha8WCYWR1IGVuZXJnZXR5Y3puZWdvLiAKIApDenkgY2hj
xIUgUGHFhHN0d28gcG96bmHEhyBuYXN6xIUgcHJvcG96eWNqxJk/ICAKCgpQb3pkcmF3aWFtCk5v
cmJlcnQgS2FyZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
