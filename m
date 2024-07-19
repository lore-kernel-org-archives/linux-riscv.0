Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC11AC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00iAZeeZ54nTxXW+lL54SBTq8J5Q1O/ptd6pxvgQzuc=; b=WoWcQkOXIp9SEB
	DSdK5FH6jjGn6MR719/HuMwSQ2++fxdPXDN6kr68T5Nd+YV0HKXzs8RZVVHL5hlntpD6rteLu/Qv+
	vw5GuVUmmgdpIpX95M+wfM97X1U+X3OM8AaEvuGeji7VO1wyAyuAMQX+yVfPlBuaVqxGEQNdbk0uv
	Fx/f3+yBZSBJVqzToCZbpduG4SPasIyoUOw0qXHKaFwMJZ5etKy9GrYsbv1RviNSIolyF7ra7DsF+
	brecnXL2meHHmhXXh2Ph+iXdOA2P84JUhHjX8+9DGjsIO3LNiWb1w/VIGQlVbQpcrodP55mk7dOHg
	B9QH0aIj6JHnqtbGwJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUiq0-000000022b3-1ThV;
	Fri, 19 Jul 2024 08:19:36 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUipu-000000022Zs-3Rqs
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:19:33 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id D73DC8B463; Fri, 19 Jul 2024 10:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1721376723; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=s671vSR0KzN2rKE9zJLapuVHbLMc2NEbXZ/0TR1wjAN+FKlCkso8XMy94igl8lGyG
	 v9zFJ3H/ck1mwt807sMu6LUeioA0DbxUBPhVtV+nAJDvWE7MX1kKj8zR6nOZIMDvs8
	 pzFkwcom4TBpLaS4qTpQp2estFQ/mPztXhf61bk8R6+WRUYCyLqKjSKZ62qdxb2mI3
	 wsrafP3cwPsJUEwYczWCibMfgnxc4x3E9gXGawm9bzk+kbGtfD9Lv0bollWlioAULB
	 8ZLpMu6LQQlK+1AgRgt9MfcqaSCnhNMzVXohkSQ+xZ7IZm9lYRLxsJO/V5VR7n6ybs
	 rL52ZHo35zYlQ==
Received: by mail.quirkbyte.pl for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 08:11:13 GMT
Message-ID: <20240719084500-0.1.4a.2h1vj.0.4eb2kic57z@quirkbyte.pl>
Date: Fri, 19 Jul 2024 08:11:13 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_011932_571283_DFC2F897 
X-CRM114-Status: UNSURE (   0.66  )
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
