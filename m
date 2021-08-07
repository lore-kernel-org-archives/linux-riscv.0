Return-Path: <SRS0=3V4y=M6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C161AC4338F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 22:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EA086103B
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 22:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EA086103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcFxbWpcRC/qzuotT1VMef7E9qaNyJp5swahPPcTVWk=; b=c/Agf9dDYXJ2UUqV5ZVHIyp1Ut
	aK+uP0xma6vpYpVMV/Qzw7DuYSW4GPXg69VZx8bInsglHyQhFc5WkHAm55Koqkc6ZWiLzsnrPSt4s
	PMhipoXxklgyVskH5Pkuzm5NBmRFxSPODSwO+xTgq1mpQaF/Xfbpb7VRYgeB7bovcfacw+Idpz7yE
	z7wdmmQfiludVczXV7pcdLuZ4N5N8+DYVAnxOd2jie26r54wfHQ8aorTlrMEXiY9XzyaxRpCqZoEO
	t2/S2jPT7z2crib/dCg4fs6MQFOstlnWTJCKRd0FIzGCoFwztuD5+G/IPub4n4O5lX07zkCA9kNlL
	QkrWwCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCVDm-00FGew-3G; Sat, 07 Aug 2021 22:55:14 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCVDi-00FGe4-UF
 for linux-riscv@lists.infradead.org; Sat, 07 Aug 2021 22:55:12 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 177MsvlV095139
 for <linux-riscv@lists.infradead.org>; Sun, 8 Aug 2021 01:54:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1628376892; x=1630968892;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZdQbPti34uyisD3tWa2Ripa+7vZi6GeNTq5vH+6Ttg0=;
 b=JFjfteZUzS7ZJD1hQyNmoFx1qY1QGsv6dE/9hQttDcwz1WqLNGwWg5mqaq9RoRDF
 hNFsXZVFxiJsKlsbQ4u2KSVYwQcAZxpiy/hnkXII3pp5kbLmaAO826p8qfqCKG/Z
 iTO8gh1P1zcf2C4t0YzwotyZWsChtfr2zeyJac5uL3Gec0wUlWq6BncU/CaN872m
 rI0AC4lEwt6yUp4m6+Ju2Nhfn5ePf0McnQnuSEBqj0XkmEVmCzjnQx+fD5Q9k/Al
 mSkVHcbXZKsjs0i6/SM2Mt3YBRhhUy7iP5HFOxRxrlp9QHbiNrVFDxeeojRCCPDA
 g3qqzYCXd6zvOq5VljAYeQ==;
X-AuditID: 8b5b014d-ba8f670000005d46-6b-610f0f3c8c80
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 E1.94.23878.C3F0F016; Sun,  8 Aug 2021 01:54:52 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sun, 08 Aug 2021 01:54:51 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 mick@ics.forth.gr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Fix a number of free'd resources in
 init_resources()
Organization: FORTH
In-Reply-To: <7e3ebd5a-cd41-4591-ba2d-0151fa45e8ea@suse.com>
References: <7e3ebd5a-cd41-4591-ba2d-0151fa45e8ea@suse.com>
Message-ID: <7419f5a24ad3f53d74432d14fe0881b6@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsXSHT1dWdeGnz/RYOkhA4utv2exW2z73MJm
 0fzuHLvFy8s9zBZts/gtln55x+zA5vHm5UsWj8MdX9g9Hm66xOSxeUm9x6Xm6+we67dcZQlg
 i+KySUnNySxLLdK3S+DKWP9Zs+A1d8WjxQoNjKc5uxg5OSQETCReHTzF2sXIxSEkcIxRYt7i
 P+wQCVOJ2Xs7GUFsXgFBiZMzn7CA2MwCFhJTr+xnhLDlJZq3zmYGsVkEVCVWX+8G62UT0JSY
 f+kgUD0Hh4iAisSlR44g85kFWhgl7i/4BjZHWCBIYvOyK2A2v4CwxKe7F1lBbE4BG4m7r96A
 2UIC1hJbtj1nhbjBRWLGt3MsELepSHz4/YAdZL4okL15rtIERsFZSC6dheTSWUguXcDIvIpR
 ILHMWC8zuVgvLb+oJEMvvWgTIzjUGX13MN7e/FbvECMTB+MhRgkOZiUR3vUz+BKFeFMSK6tS
 i/Lji0pzUosPMUpzsCiJ8/LqTYgXEkhPLEnNTk0tSC2CyTJxcEo1MJk9LT51YcPPDM0Gzopn
 09WyZQJlxS/u4tmpUbnSuUFnhpdxPrM4zz8ZvscOOybmW0534LwhlP+jrVuRec+yHVvNpvac
 7OBZtOjpsZeHZfbcv7renuEe77ETLE1HhHIttG15dqwU2xnRFrRoYvaXmX4aAv53Jq6/MGWh
 zpwp59JPXP8yLfOnDot1dLl28KddnJdjfG0P9XN9urUrWaNJ8+hq66gb/xxLn693va45f/E1
 68s5Djua0nQuz19w1Tygt6BIdDmXyYPiq7ayOe8mcCVwrVc6PWHB0+OxNxvnq5fU7nRMVWq/
 N+9Ti/BjXong5u8ffvmtu1rbpvVbP71x+q7XW4QPVAUv8Xxxeomyvo8SS3FGoqEWc1FxIgAo
 WhIG5AIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_155511_397156_2F0C9769 
X-CRM114-Status: GOOD (  18.91  )
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

zqPPhM65z4IgMjAyMS0wOC0wNyAyMDo1NCwgUGV0ciBQYXZsdSDOrc6zz4HOsc+IzrU6Cj4gRnVu
Y3Rpb24gaW5pdF9yZXNvdXJjZXMoKSBhbGxvY2F0ZXMgYSBib290IG1lbW9yeSBibG9jayB0byBo
b2xkIGFuIAo+IGFycmF5IG9mCj4gcmVzb3VyY2VzIHdoaWNoIGl0IGFkZHMgdG8gaW9tZW1fcmVz
b3VyY2UuIFRoZSBhcnJheSBpcyBmaWxsZWQgaW4gZnJvbSAKPiBpdHMKPiBlbmQgYW5kIHRoZSBm
dW5jdGlvbiB0aGVuIGF0dGVtcHRzIHRvIGZyZWUgYW55IHVudXNlZCBtZW1vcnkgYXQgdGhlCj4g
YmVnaW5uaW5nLiBUaGUgcHJvYmxlbSBpcyB0aGF0IHNpemUgb2YgdGhlIHVudXNlZCBtZW1vcnkg
aXMgaW5jb3JyZWN0bHkKPiBjYWxjdWxhdGVkIGFuZCB0aGlzIGNhbiByZXN1bHQgaW4gcmVsZWFz
aW5nIG1lbW9yeSB3aGljaCBpcyBpbiB1c2UgYnkKPiBhY3RpdmUgcmVzb3VyY2VzLiBUaGVpciBk
YXRhIHRoZW4gZ2V0cyBjb3JydXB0ZWQgbGF0ZXIgd2hlbiB0aGUgbWVtb3J5IAo+IGlzCj4gcmV1
c2VkIGJ5IGEgZGlmZmVyZW50IHBhcnQgb2YgdGhlIHN5c3RlbS4KPiAKPiBGaXggdGhlIHNpemUg
b2YgdGhlIHJlbGVhc2VkIG1lbW9yeSB0byBjb3JyZWN0bHkgbWF0Y2ggdGhlIG51bWJlciBvZiAK
PiB1bnVzZWQKPiByZXNvdXJjZSBlbnRyaWVzLgo+IAo+IEZpeGVzOiBmZmUwZTUyNjEyNjggKCJS
SVNDLVY6IEltcHJvdmUgaW5pdF9yZXNvdXJjZXMoKSIpCj4gU2lnbmVkLW9mZi1ieTogUGV0ciBQ
YXZsdSA8cGV0ci5wYXZsdUBzdXNlLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+IGluZGV4IDE4YmQwZTRiYzM2Yy4uMTIwYjJmNmY3MWJj
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4gQEAgLTIyOSw4ICsyMjksOCBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgaW5pdF9yZXNvdXJjZXModm9pZCkKPiAgCX0KPiAKPiAgCS8qIENsZWFuLXVwIGFueSB1bnVz
ZWQgcHJlLWFsbG9jYXRlZCByZXNvdXJjZXMgKi8KPiAtCW1lbV9yZXNfc3ogPSAobnVtX3Jlc291
cmNlcyAtIHJlc19pZHggKyAxKSAqIHNpemVvZigqbWVtX3Jlcyk7Cj4gLQltZW1ibG9ja19mcmVl
KF9fcGEobWVtX3JlcyksIG1lbV9yZXNfc3opOwo+ICsJaWYgKHJlc19pZHggPj0gMCkKPiArCQlt
ZW1ibG9ja19mcmVlKF9fcGEobWVtX3JlcyksIChyZXNfaWR4ICsgMSkgKiBzaXplb2YoKm1lbV9y
ZXMpKTsKPiAgCXJldHVybjsKPiAKPiAgIGVycm9yOgoKT3VjaCEgVGhhbmtzIGZvciB0aGUgZml4
LgoKQWNrZWQtYnk6IE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
