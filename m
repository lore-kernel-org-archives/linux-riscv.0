Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD203C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCnvJlEVNJT5uFSv2qEfbHW/yjrjRS1awyHeo8eKELU=; b=beDxcfssvd1mb9
	m91rGy48kILivonnqOI4kkd0V6Yul/HkHvg91IFFfszeOq9ser1ImQQx3W6sSQ6r6rFUHckkRpRgZ
	zdPsS883YuoZPOdCq11J7bV3tZOFAVBuqlPDSLl9G4t/UiJMbtxktUxwWBfuG4wZtOs7Es0prGJzJ
	YZuypfxgWoFuKvt+jRNt1yS2YimibgW1lpG65gsYpIEmVefJ8P9mUSoEE15uD9WyXHGhhSnMcor9B
	Pe1Nf8QCqqH1dR4nHNfS6MVAMJI1Ogrv+5PtM6xt3JlvDc6T4QQxvDfOnr3IdCjFJoZkWcXZwzyoS
	4dF9t5gXIb6BpEOae3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaax9-00388X-MI; Tue, 20 Sep 2022 10:58:11 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaax7-00387T-7w
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 10:58:10 +0000
Received: by mail-ej1-f42.google.com with SMTP id sb3so5146527ejb.9
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 03:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DIf4A6MJfckarZjD46d4BsfCfgbtP0HUjIfcnatCVF4=;
        b=4+hxsjQu/kEJmjgdGsTczqf+3wyg4+baeT/YlN2PffW+4bdZht/iDoxb9Ql8AHImkU
         ZLdEWvrTHGVig/eRy+5L9ia79/gxw7Zc1pSXhAx2ubL3URl/TSXkYgX1dEGxiEjyRDv0
         /580Cm9l8oS0EpqFGEDcIh4Mi24v7W2dmCqMV5QYaqf2zQ/t54T8ZnE6zxA5XI/uJMC4
         B7rgvQlNIKhrQFhQB4sIx2PB2VuLlzmBN5HoX53opqSfWQOuQLxoGENegg72Qc/VFHjT
         rJiHbLCQw7Xf2w+ZG6LKp+RkzNEJ4ZChNFQiqjqjGT+PmhzdvHCGRVQQ9+SB0hxt7PVD
         hobQ==
X-Gm-Message-State: ACrzQf2xsbKUFGAYuDJvHf5jBmt9IqXPNJn3EGGkd6azDkpC6MrhBmC/
	lwFd0tP8+f4VmF6BqyEPmrg=
X-Google-Smtp-Source: AMsMyM5kxMnMuhMcHTwEZeZUOWkC/2ffdKn/oARxrizmy9SaILemUN35/307/v8LTz/ze3YlWW9CkA==
X-Received: by 2002:a17:906:cc10:b0:77a:fe95:eae2 with SMTP id ml16-20020a170906cc1000b0077afe95eae2mr16531605ejb.466.1663671486796;
        Tue, 20 Sep 2022 03:58:06 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id bi14-20020a170906a24e00b007803083a36asm651296ejb.115.2022.09.20.03.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 03:58:06 -0700 (PDT)
Message-ID: <bb3fa609-858f-ab16-95b4-06fd43ec6129@kernel.org>
Date: Tue, 20 Sep 2022 12:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 10/10] tty: serial: use uart_port_tx_limited()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Kevin Cernekee <cernekee@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-riscv@lists.infradead.org
References: <20220920052049.20507-1-jslaby@suse.cz>
 <20220920075844.29360-1-jslaby@suse.cz>
 <f2653c92-1769-fc7c-8ad8-abf34affef6b@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <f2653c92-1769-fc7c-8ad8-abf34affef6b@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_035809_305539_E462932F 
X-CRM114-Status: GOOD (  11.18  )
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

T24gMjAuIDA5LiAyMiwgMTE6MTksIElscG8gSsOkcnZpbmVuIHdyb3RlOgo+IE9uZSBpbXByb3Zl
bWVudCBzdWdnZXN0aW9uIGJlbG93Lgo+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2Vy
aWFsL2FsdGVyYV9qdGFndWFydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL2FsdGVyYV9qdGFndWFy
dC5jCj4+IGluZGV4IDIzZjMzOTc1Nzg5NC4uZjIyNGY1MTQxNzI2IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3R0eS9zZXJpYWwvYWx0ZXJhX2p0YWd1YXJ0LmMKPj4gKysrIGIvZHJpdmVycy90dHkv
c2VyaWFsL2FsdGVyYV9qdGFndWFydC5jCj4+IEBAIC0xMzcsMzkgKzEzNywxNyBAQCBzdGF0aWMg
dm9pZCBhbHRlcmFfanRhZ3VhcnRfcnhfY2hhcnMoc3RydWN0IGFsdGVyYV9qdGFndWFydCAqcHAp
Cj4+ICAgc3RhdGljIHZvaWQgYWx0ZXJhX2p0YWd1YXJ0X3R4X2NoYXJzKHN0cnVjdCBhbHRlcmFf
anRhZ3VhcnQgKnBwKQouLi4KPj4gKwlzcGFjZSA9IHJlYWRsKHBvcnQtPm1lbWJhc2UgKyBBTFRF
UkFfSlRBR1VBUlRfQ09OVFJPTF9SRUcpOwo+PiArCXNwYWNlICY9IEFMVEVSQV9KVEFHVUFSVF9D
T05UUk9MX1dTUEFDRV9NU0s7Cj4+ICsJc3BhY2UgPj49IEFMVEVSQV9KVEFHVUFSVF9DT05UUk9M
X1dTUEFDRV9PRkY7Cj4gCj4gVGhpcyBpcyBGSUVMRF9HRVQoQUxURVJBX0pUQUdVQVJUX0NPTlRS
T0xfV1NQQUNFX01TSywgLi4uKSAmIHRoZW4gYWxsb3dzCj4ga2lsbGluZyBBTFRFUkFfSlRBR1VB
UlRfQ09OVFJPTF9XU1BBQ0VfT0ZGLiBJJ2QgcHJvYmFibHkgZG8gaXQgaW4gYQo+IHNlcGFyYXRl
IHBhdGNoIHRob3VnaC4KClJpZ2h0LiBQcmVwYXJlZCBmb3IgdjUuCgp0aGFua3MsCi0tIApqcwpz
dXNlIGxhYnMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
