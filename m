Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71075C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00iAZeeZ54nTxXW+lL54SBTq8J5Q1O/ptd6pxvgQzuc=; b=gICssNSeKDkPPc
	nBH6ugEW85PFD67lDq5RRpDe2U/UsTRzXZssDLM0MDTxVefcEY7M+b57FNYMoQhJIVl7ZjoXfkfwj
	m2AJjk35m++fY++pGN6dbYNYdPgOOi1IcFnwe4qNU2LSNw3FJ15baJFkR4iRyN6wJaM3UzW6Vr3JD
	qu4N33/in84Zm18jwb0n6qFIX2Q1a6c1foX8ZM4Lcqzjh9URtIM53XXE0/QwI95RhiQWHsyKyZHRz
	G0dGKrSgXcKOh18GkKfQwNFvii/0N7jf957HxwqDV1q1eUvyl/UKhIRp7tODJc0prIOQ/6Pyci3Py
	Z0MxcMo4PT9oE5JaAVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8FO-00000008nNn-29IS;
	Thu, 06 Jun 2024 08:13:22 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8FK-00000008nL4-0l7V
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 08:13:20 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id B338889ABE; Thu,  6 Jun 2024 10:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1717661524; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=yAzlUk3x36eKeN30OkeS01liQuufE/0qypgFCJ9VxZ2fnrRGl2bE/auhrOBiQ+tgz
	 P9g3zgrTttfH2u36LL71cOjZJf7/LaVYha9bLllYmfbG2UkIpZaCOkR61XxKS5JMSE
	 d90GsXF3122gQt/OFpytIMiQi4k46PsnOTLO197UVcoUT9d0Yt4OE4cdsOOJpVCj6R
	 6QEWKm0T8BW3DjQpaCzhy3d35QWwppTBR5u+BqzxIZ9jqema1AdgexlLP8qESD1YG1
	 jrsqyWHwX5cIJlNNfma1NZdcxgFy92vzBDA2TwzHZ1SSHw6n2W215lJvPiOQ9ZQe8n
	 fy21OZyn7FQpA==
Received: by mail.quirkbyte.pl for <linux-riscv@lists.infradead.org>; Thu,  6 Jun 2024 08:10:05 GMT
Message-ID: <20240606084500-0.1.3f.1yrjf.0.ajbc2fwab3@quirkbyte.pl>
Date: Thu,  6 Jun 2024 08:10:05 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_011319_087959_EA0476BB 
X-CRM114-Status: UNSURE (   0.46  )
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
