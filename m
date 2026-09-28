Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D88C9832F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbFBc+AZmlfkcfVoPu8/m2yHWPzzUr4YSfQ3m4C1SNU=; b=m7PAAKACTiuMzy
	okMKfZD3RBd9HK3Mh61FAn4LKd35rOe0sBvbrjGux9ZAzF+p5gwl0EQRMuN97AFSoPUry6B4pbJMA
	/TEIf7HYPzJmiP2+vgREoI25GkIlxWCMObzM+PTw0XcfN+W9pHDzGeiVEHpQHo77VOQ2SBrsaV7fI
	MOVnKRoAoHVQrg++6xcdNi3/s1wxZ2Fs+vAEg4eZj2IRDFfamFEtjOrT246n6ndwc2C5Hwwc2GdVH
	6io3xqSZ9C5h704DXlr9Q4/7sP9sLzp+YolxkdeLarqo3NEerofhmhdK/0jFeDXo3Y689KilcS8gI
	Hkfh54m+6B1ncgimyyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5n8-0000000HY1K-135T;
	Mon, 28 Sep 2026 07:28:50 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5n5-0000000HY0Z-3Tq1
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 07:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790580503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jy+gdPpOvbttocgYqvQFWHsCT63CS+8NcC3CaY3Hgkt5iQR+5NWtGds2xRe/RmfeU3/7doB7i84KFYzIO+alvkQf3fiBKIguZAPwJxvXy5HVKMMrznpxG9RJ+fMTE2hW8QKYAqjXYJZ6DsNmho/JtIIFpu/2oAfx7v3OUpvlI4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790580503; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qQ+wkOzeHNyM57nSul7YmRy/aNPxKWQliQukKQfWXHs=; 
	b=hZa6oVL6IRlZ4EsQqAOLknfLGs2ruIgWh9aDZCQciY2Viqv+6a1gyoHgB+XxsG5HcsCDUEDwK9OrAd+2GUVZTe0hM5cuH6ANdP+oMWlkZwBrwci6612cqyfYAQjy2cGsGRJoACwe8ZA0VIks8RRjPUW9NM9ULrZ0zZw3UTU22+Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790580503;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=qQ+wkOzeHNyM57nSul7YmRy/aNPxKWQliQukKQfWXHs=;
	b=TxqEjZEGRsuygd3NwRjtGHrFIk2d1ohm3jbR43kD06NZaNrZv9yQRTOD0hxwGHGp
	GF60LiRGQ4yHogwunVMkgGUlrQv4VqqyQGSU9X3U1bVDITUAw9D2AkF7Et2p7qv6HL6
	2mP9xDjjdh8od2uJW+2hjESsw81u6Mbjrlwd6jUlHveTOq7X7DBDXdjprd4J8Hl8L9D
	QjFkbw+aJvMi9Wr0KsCv+RoIobryk3BMRO9nnEjuKnSMi4d757GOhTJcGRuScgHDoYS
	WD54YKoIRzX9vFSuYSNSgceQSdhLXiUAXaqYdE+BtHzr8RdIQSLT+ZosOQ+DQc51HCc
	OZBSFTRScA==
Received: by smtp.zohomail.com with SMTPS id 1790580502126809.1352746111535;
	Mon, 28 Sep 2026 00:28:22 -0700 (PDT)
Message-ID: <ef09da01179a1ec707ae33b7e6aa5252ebe4fa69.camel@icenowy.me>
Subject: Re: [PATCH 0/2] drm/bridge: th1520-dw-hdmi: Two fixes
From: Icenowy Zheng <uwu@icenowy.me>
To: Felix Gu <ustc.gu@gmail.com>, Drew Fustini <fustini@kernel.org>, Guo Ren
	 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 28 Sep 2026 15:28:13 +0800
In-Reply-To: <20260321-th1520-v1-0-ec877197770d@gmail.com>
References: <20260321-th1520-v1-0-ec877197770d@gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_002847_958351_CB6AF7D3 
X-CRM114-Status: UNSURE (   6.76  )
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

5ZyoIDIwMjYtMDMtMjHlha3nmoQgMDM6MTIgKzA4MDDvvIxGZWxpeCBHdeWGmemBk++8mgo+IFNp
Z25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4KClNvcnJ5IGZvciBmb3Jn
ZXR0aW5nIHRoaXMgcGF0Y2hzZXQuIEknbSBnb2luZyB0byBhcHBseSBpdC4KClRoaXMgcGF0Y2hz
ZXQgc2hvdWxkIGJlIG5vdzoKCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCgpUaGFua3MsCklj
ZW5vd3kKCj4gLS0tCj4gRmVsaXggR3UgKDIpOgo+IMKgwqDCoMKgwqAgZHJtL2JyaWRnZTogdGgx
NTIwLWR3LWhkbWk6IEZpeCBlcnJvciBjaGVjayBvbiBkd19oZG1pX3Byb2JlKCkKPiByZXR1cm4g
dmFsdWUKPiDCoMKgwqDCoMKgIGRybS9icmlkZ2U6IHRoMTUyMC1kdy1oZG1pOiBGaXggcmVtb3Zl
KCkgY2FsbGJhY2sKPiAKPiDCoGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGgxNTIwLWR3LWhkbWku
YyB8IDggKysrKy0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IGI1ZDA4M2EzZWQxZTI3OTgzOTZkNWU0OTE0
MzJlODg3ZGE4ZDRhMDYKPiBjaGFuZ2UtaWQ6IDIwMjYwMzIxLXRoMTUyMC1mNDMyNjEzOGM5YmYK
PiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
