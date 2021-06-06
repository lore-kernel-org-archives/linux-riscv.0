Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C651C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 17:22:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA5F611CB
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 17:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA5F611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPhq1J8ZWHYfbDteUP59Wvr/RoOW5WNzBNmsTZpLbUc=; b=KHWs+2rBmgvl2zXXwykYKVCI4k
	4zYHBPMlp3K4VL6hLELFhXWrOp1/Py4dTwFpbpMdW3UL3RqiyrrlJnXwm6XYP5diTEPV+Hr1hDYXw
	TDyJnxVZx1BPCs4reN1U/KrgQ7sWZbbzs3aibqftLBOt2lhnhpyUbPLk2DthDvxKOiuCQfZ1xgn39
	XBwRrYDpeltEY/K6bYEOCEK5YUxJvD/p79Szkvt1MISvTMkwxcBYLUkeCgn512NKChp5+pXOrc4bl
	bsMilfD5wTwFPmaBtgoAJB4dDDI9nDL1WnV5Ova7dTHPaVk0FOoRdhLGyAA2MnMUef2q1Ur/4PyID
	57Vp2yOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpwTw-000bki-Du; Sun, 06 Jun 2021 17:22:40 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpwTr-000bje-0F
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 17:22:38 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 156HMMJY051940
 for <linux-riscv@lists.infradead.org>; Sun, 6 Jun 2021 20:22:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623000137; x=1625592137;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ofh6S0qmxbTfwOwm6I6W/gPma32NXMANo65YCZP3Xvs=;
 b=G6lDnSKK77R8A849bGJ25Ey3IPPHNmHKtsEWtiaT8ySLxRN1CgvFHRTz3lYdC3Gb
 IiUd44ADfAmdZtwdIR/GQxZ/yhcvSk+iKUGJ7vN+78H0Jjk59TGxUhHz3Gr7GtKJ
 WUoYzchYtTmjMKbw7L1+8yV+8xY8w1PkTJZY5zw+YbOJ6l8NuhGpEZLG0K+MA3GZ
 96HXduLc+YlJYcyteF3C+2OJrOQbm8tGuIkVjkC6qGi215LnUjSTHui4T6fo57gD
 iChGdQ736ul6Ki8jT30a3Jj6+zmr+zfKwWi8w7EfEtkXkDDzM7nl8oRQY24yzqaf
 XFeSvKRKTknxtcvsHy930A==;
X-AuditID: 8b5b014d-96ef2700000067b6-e0-60bd04486a19
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 4A.2A.26550.8440DB06; Sun,  6 Jun 2021 20:22:16 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sun, 06 Jun 2021 20:22:14 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de, wens@csie.org,
 maxime@cerno.tech, drew@beagleboard.org, liush@allwinnertech.com,
 lazyparser@gmail.com, wefu@redhat.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 06/11] riscv: pgtable: Add DMA_COHERENT with custom
 PTE attributes
Organization: FORTH
In-Reply-To: <1622970249-50770-10-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-10-git-send-email-guoren@kernel.org>
Message-ID: <610849b6f66e8d5a9653c9f62f46c48d@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsXSHT1dWdeDZW+CwaPjlhZPPkxks/g76Ri7
 xb0Vy9gtXuxtZLE4/mgXi8XK1UeZLC59ucZi0bHrK4vF5V1z2Cy2fW5hs5iybxebxcp1x5gt
 Zvz4x2ixdeM6RouW/VNYLH4eOs/kIODxqu0Zk8fvX5MYPd79XsbocefceTaPDY9Ws3rsnHWX
 3WPBplKPTas62Tx2PrT02Lyk3uPF5pmMHrtvNrB5vN93lc3j8yY5j/YD3UwB/FFcNimpOZll
 qUX6dglcGfum72YvaOCoOHDmEnMD4062LkZODgkBE4ll0y4C2VwcQgLHGCU6fn+GSphKzN7b
 yQhi8woISpyc+YQFxGYWsJCYemU/I4QtL9G8dTYziM0ioCrxvasZrIZNQFNi/qWDYLaIgKjE
 +tnzwRYwCyxilth4eytYg7BAvMT2yc/YQWx+AWGJT3cvsnYxcnBwCjhL3N4FFhYSqJJYvvU6
 K8QNLhLXd6xhhbhNReLD7wfsIOWiQPbmuUoTGAVnIbl0FpJLZyG5dAEj8ypGgcQyY73M5GK9
 tPyikgy99KJNjOBIZfTdwXh781u9Q4xMHIyHGCU4mJVEeL1k9iQI8aYkVlalFuXHF5XmpBYf
 YpTmYFES5+XVmxAvJJCeWJKanZpakFoEk2Xi4JRqYJqUqDJJ9reE+6uaOWYlzSFl7abzt07o
 eluzd6NShuHpSS7vZfga6pniXtRdmlgW9XzGKZfsNedmN2Qw/9xV9UUrPaCL67Cw+GQLA2Oh
 V4K9HDc2bDjW9v9FMoPBOa0gW6muVtffxmb3JP7U9saGPjX99P7PoVuJN/qX3SsrXSLUEC1p
 n8d+4NFsRV8ZcyXZjqVRLWmhy35F31F6k2VmFcy0uy98+rJlwh8fce9MmT23duGWC5kX/N+H
 cfYzBm/e8e7q6sOtZkW3wq2a0jm8T7ybs6zgp5LZtLM/xYTXSEuK3tFcVKG01OnQcY+vD1be
 0/wb1lG/t9mfVcUk81yP9cTmWyJ2x+Q+ZDxkzszfosRSnJFoqMVcVJwIAKcjnVpDAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_102235_441322_0C3D7672 
X-CRM114-Status: UNSURE (   7.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wNi0wNiAxMjowNCwgZ3VvcmVuQGtlcm5lbC5vcmcgzq3Os8+BzrHPiM61
Ogo+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiAKPiBUaGUgZG1h
LW5vbmNvaGVyZW50IFNPQ3MgbmVlZCBkaWZmZXJlbnQgdmlydHVhbCBtZW1vcnkgbWFwcGluZ3MK
PiB3aXRoIGRpZmZlcmVudCBhdHRyaWJ1dGVzOgo+ICAtIG5vbmNhY2hlZCArIFN0cm9uZyBPcmRl
ciAoZm9yIElPL0RNQSBkZXNjcmlwdG9yKQo+ICAtIG5vbmNhY2hlZCArIFdlYWsgT3JkZXIgKGZv
ciB3cml0ZWNvbWJpbmUgdXNhZ2UsIGVnOiBmcmFtZQo+ICAgIGJ1ZmZlcikKPiAKPiBBbGwgYWJv
dmUgYmFzZSBvbiBQVEUgYXR0cmlidXRlcyBieSBNTVUgaGFyZHdhcmUuIFRoYXQgbWVhbnMKPiBh
ZGRyZXNzIGF0dHJpYnV0ZXMgYXJlIGRldGVybWluZWQgYnkgUFRFIGVudHJ5LCBub3QgUE1BLiBS
SVNDLVYKPiBzb2MgdmVuZG9ycyBoYXZlIGRlZmluZWQgdGhlaXIgb3duIGN1c3RvbSBQVEUgYXR0
cmlidXRlcyBmb3IKPiBkbWEtbm9uY29oZXJlbmN5Lgo+IAoKVGhpcyBwYXRjaCB2aW9sYXRlcyB0
aGUgUHJpdmlsZWdlIFNwZWMgc2VjdGlvbiA0LjQuMSB0aGF0IGNsZWFybHkgCnN0YXRlczoKCiJC
aXRzNjPigJM1NCBhcmUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSBzdGFuZGFyZCB1c2UgYW5kIG11c3Qg
YmUgemVyb2VkIGJ5IApzb2Z0d2FyZSBmb3IgZm9yd2FyZCBjb21wYXRpYmlsaXR5IgoKU3RhbmRh
cmQgdXNlIG1lYW5zIHRoYXQgdmFsaWQgdmFsdWVzIGNhbiBvbmx5IGJlIGRlZmluZWQgYnkgdGhl
IFByaXYuIApTcGVjLCBub3QgYnkgdGhlIHZlbmRvciAob3RoZXJ3aXNlIHRoZXknZCBiZSBtYXJr
ZWQgYXMgImN1c3RvbSB1c2UiIG9yIAoicGxhdGZvcm0gdXNlIiksIGFuZCBzaW5jZSB0aGV5ICJt
dXN0IiBiZSB6ZXJvZWQgYnkgc29mdHdhcmUgd2UgJ2xsIGJlIAp2aW9sYXRpbmcgdGhlIFByaXZp
bGVnZSBTcGVjIGlmIHdlIGRvIG90aGVyd2lzZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
