Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F646C3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00iAZeeZ54nTxXW+lL54SBTq8J5Q1O/ptd6pxvgQzuc=; b=j7Q5XH4nDX+Twe
	Rry+cVkuDVNNBj5Bp4D6E4FePQRFOjuBG4yEpTofhh7eZkbklzW5VK6kH5T4FLf5uU58zB+CBVO36
	6hdveIZ7OPZh51VQRdiakMYzpMTOUHJ8cClrRSnsa6g4RsLwfFijbXd7Pn0JHdDPQ+s1l3g+70MhW
	98xY7QOwLATtHK0fqhkrNihN4my0fRHIiTcYMoOP70r11+sT/zMw+NHwFOMZ+TOz0kf6YPE+Gd1ZX
	ZjR24meOcEFsg7ilqsxKOSm6yKbW4WU9rWume1rlKFwjTRvCeLZSAfek0V4yYJ9l9iDl+r4Hfb8R+
	KiBUIQCjNCoJq1nI3R4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6eb-0000000D0lf-19rg;
	Fri, 28 Jun 2024 08:08:21 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6eZ-0000000D0k0-0Uos
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 08:08:20 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id B46588B6E4; Fri, 28 Jun 2024 10:01:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1719561781; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=kxxjGJQyvAroMTaKT/TPnAAgStXVnFppYACpPMXfxq2FmdvykY5MxFTUK+DRONFGr
	 hDSAJIz61ItyOdBXH09ocmzhTJ1f4O2AEhlWCtXKMVDdoy5G6soHnM2+GwXxXQgq/n
	 pc0T5miXiJ2EG4849y/uvtlwJlTW1uACa3W/VJ7BOFd9veMMehUFLLzAQD/aOD+p56
	 15orAb7JV9Z7Br6AFvrAOq5dxYsjWNqfJtVSp7KB7aQpnvSLjk1KZVMAvYhiUZd1kZ
	 T+PAO4u/2mSuUGYJsypp+zlUjpMcIqSSgcSvztZRUUzmwFPmcF6HF7aABd88XDnIX7
	 SDDykdexc0/4Q==
Received: by mail.quirkbyte.pl for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 08:00:33 GMT
Message-ID: <20240628084500-0.1.3v.284do.0.hcffqnb0hd@quirkbyte.pl>
Date: Fri, 28 Jun 2024 08:00:33 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_010819_357913_CA8A457C 
X-CRM114-Status: UNSURE (   0.43  )
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
