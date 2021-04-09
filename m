Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0F8C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:19:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8879D610CB
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8879D610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dA+PyhXJQqqHYVUbR0PPo/dIqug7HdBoMpolY4YKJ+g=; b=fzjzWf5iRWX0EuvlW91sidn9D
	gAdYRdOiM6SvzJFmNrroyXtlJErv7/znJjxohF1lH/rsSZDPMbLyBmkh+D1G5LqNRypOdDQfjU1Eo
	EsXmektbBN6c7Z9b81marm7KsuPTl3TRUEbbZ3jKwSzYN7qVt45OrEoMrLvrehEXvXNzjU0w1jMn/
	pJ8HuJf4TlY0G6ghVRGZYiNt7qFjW7lK8spGce9VBtKsFR0FuWPBTQhaqxT8Ys9dE5PIP9pebu59Q
	jASYbNwO8IeDZMPcmVrR/l7v0RERpm4rTOi+j3cWKETUwOyi3D8B7NGpEE2CXGqsw4R1mzNBH3Svk
	SjlZWH7lA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUoEr-000O4A-LU; Fri, 09 Apr 2021 10:19:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUoEn-000O33-PE
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 10:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=LfTJnXjHmPSwQmC37hGWF6Wt795Vixc9yQ53ieDMXLI=; b=R1Z46S6WFOL6mx3ztqF/mplu5M
 oWIxm0jO/M/V9St1qh5XXRr6irmnr6Hx8oX6cDGIUgtzm/NYi0TKCTEtc5nIrZmEB1nW744nmLh/Y
 raSOgmRksAdhlOoOjoAoJIl01MzdMXL2lS+WyPS2tUgPIeO41N1V8qvLo6N7IBFk2EjHbNxHjK/Id
 w7ukxX4IjwdchAnOYwSY/i96SJG3Vdgqfo02ua9zjWCZMPz8641ds3A20bJQgvBMKmOdN9ku3Ncz2
 6HB2uHZk1l/mwplCVqgc6eqzW/Z9RTzRuHfn3vmz6cCrqXl9ycUAhLltVdGGNUfLrW6J5FQCKGC9w
 mR9Rn/sg==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUoEk-004F82-Pb
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 10:19:40 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 139AJb3T022165
 for <linux-riscv@lists.infradead.org>; Fri, 9 Apr 2021 13:19:37 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617963571; x=1620555571;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FcdW2pK1FPyss3ZOQ0A9eTn1YvwQct1bsYua2abjDLo=;
 b=VV+0cvFlY6micMneUT8WZPCnHrE3uHm9bZeW/lUexAGBbb23Q+AuEzn0fFPcH41n
 ahSBcUZ8UYJFf8rV3o0rTKl9tG5/EXQQ0Jzc72kjuVTguSUERzArqP4m2PBiZhJX
 HSvMwP7NVjHgbYkRzkwSdhTY1AXkL1K/0Uc9pxkhdAcWLUiyAiDHONuu9dgMoZbL
 haCJq8y8lui8Ad5VRo4VdzlCdTQT9PVbXdyqZjkpxf5SKlSLQwfRwgestv02wQSZ
 p/3Yk8QXkoXU7Vxz4VEdM+KMLShXnlGo0EgIw44+poUwvwiB+QxAumrQKzerl1vC
 KqG2bmaE8ubf1J1cuXWCoQ==;
X-AuditID: 8b5b014d-a4c337000000209f-bc-60702a339219
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 B9.20.08351.33A20706; Fri,  9 Apr 2021 13:19:31 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 13:19:28 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] RISC-V: Add kexec support
Organization: FORTH
In-Reply-To: <386bf260-006a-62c4-2d7b-1a22a43b3513@ghiti.fr>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210405085712.1953848-3-mick@ics.forth.gr>
 <386bf260-006a-62c4-2d7b-1a22a43b3513@ghiti.fr>
Message-ID: <3c821aaf141651f5c58c84bb0f294e9b@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsXSHT1dWddYqyDB4HSXmcWzO19ZLS7vmsNm
 se1zC5tF87tz7BYvL/cwW7TN4ndg83jz8iWLx70T01g9Hm66xOSxeUm9x6Xm6+wenzfJBbBF
 cdmkpOZklqUW6dslcGU0rX3EVvCTpWLnpJmsDYwvmbsYOTkkBEwkXrdcYe9i5OIQEjjKKHHr
 9wZWiISpxOy9nYwgNq+AoMTJmU9YQGxmAQuJqVf2M0LY8hLNW2eDDWIRUJV49vMsO4jNJqAp
 Mf/SQbB6EQE5ibbuI4wgC5gFljFKbDy+AqxBGGjB3tkbwBr4BYQlPt29CLSYg4NTwEbi1cZy
 iINmMkrcXzyVBeIIF4kzN24yQhynIvHh9wN2kHpRIHvzXKUJjIKzkJw6C8mps5CcuoCReRWj
 QGKZsV5mcrFeWn5RSYZeetEmRnC4M/ruYLy9+a3eIUYmDsZDjBIczEoivM3N+QlCvCmJlVWp
 RfnxRaU5qcWHGKU5WJTEeXn1JsQLCaQnlqRmp6YWpBbBZJk4OKUamE47rWj9XzrPqz5gyZ6v
 wTt6Jf7fOa5r8GwPM3dX7ok1GkVbXAMLDWrSzuSKdIhercnVefoqWS5NKcHPi69ypmqzXfLq
 XpWVN3ee8ltUw1tp6vgxedl2PXOt9kL5L+cf58+RDKz4Mfvh6h0VUrwJ29QnnDHX2H35qO+c
 EItLrKxL1rs+cj8YdO5Aj0Si0ud/j3+4fc2e6Cy4teDh1IbwcLa86V8tJRiPc0VvlP0WkfbV
 IKSzzs/WdV0hD/fiP3ZvRP/Pbzsu/oRDhmfyhv8atQmSWbUtl+c2rWC7dlN4Lven1dMt2qfZ
 sLlq3do2b32f8+nJV+1KdTnk5iot7O71zwvUy61fMFePSVuxtW6tEktxRqKhFnNRcSIAHbEJ
 f+YCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_031939_219029_F2E833B1 
X-CRM114-Status: UNSURE (   5.72  )
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

zqPPhM65z4IgMjAyMS0wNC0wNiAyMTozOCwgQWxleCBHaGl0aSDOrc6zz4HOsc+IzrU6Cj4gTGUg
NC81LzIxIMOgIDQ6NTcgQU0sIE5pY2sgS29zc2lmaWRpcyBhIMOpY3JpdMKgOgo+PiArCj4+ICsv
KiBSZXNlcnZlIGEgcGFnZSBmb3IgdGhlIGNvbnRyb2wgY29kZSBidWZmZXIgKi8KPj4gKyNkZWZp
bmUgS0VYRUNfQ09OVFJPTF9QQUdFX1NJWkUgNDA5Ngo+IAo+IFBBR0VfU0laRSBpbnN0ZWFkID8K
PiAKCll1cCwgSSdsbCBjaGFuZ2UgaXQuCgo+PiArb2JqLSR7Q09ORklHX0tFWEVDfQkJKz0ga2V4
ZWNfcmVsb2NhdGUubyBtYWNoaW5lX2tleGVjLm8KPiAKPiBPdGhlciBvYmotJCgpIHVzZSBwYXJl
bnRoZXNpcy4KPiAKCkFDSwoKPj4gKwlsaQlzNSwgKCgxIDw8IFBBR0VfU0hJRlQpIC8gUklTQ1Zf
U1pQVFIpCj4gCj4gMSA8PCBQQUdFX1NISUZUID0gUEFHRV9TSVpFCj4gCgpBQ0sKCj4+ICsjaWYg
ZGVmaW5lZChDT05GSUdfSE9UUExVR19DUFUpICYmIChDT05GSUdfU01QKQo+IAo+IFNob3VsZG4n
dCBpdCBiZSBkZWZpbmVkKENPTkZJR19TTVApID8KPiAKCkl0IGRlcGVuZHMgb24gU01QIGFueXdh
eSwgSSdsbCByZW1vdmUgdGhlIHNlY29uZCBwYXJ0LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
