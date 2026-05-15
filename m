Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09902CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GkVtPp1OQIjAS0+2qcsu5EBilyVyMDXdvB8Yb3HCuA=; b=HpFpaHYTaSPVSC
	gciPVLa6dRw5SVn9IjVN21gqvSsf7cFj7tL56C7j4Q7YAl5iMSItqXEbgplIgTax5EsYh2J9S6UG3
	7f/D1UzB/l8sXqZQB1JLSYWaHeZun7IRo4qq5ldU+KGwBf6hUpkGspLvbkguPw+ANmueLi9LpVzNV
	Pl4Pi8zy6Z0/57Azo4CfHe/IPM2WWpjU2kC+4TonLOJgkXITKxIu/nwvqAA1/C9YmfocJcgpEXipX
	NWhMbN1M+gxSqmVWVB35uQF5IsrSMdfYOfV6MzqX/iqFeSg+qYdC8SQm7o3Rt94dvoySQsIKC4clU
	OhPaNmx62MKet+/wMn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtzA-00000008dVg-3Fd9;
	Fri, 15 May 2026 14:57:56 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtz8-00000008dUj-1acM
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:57:56 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7e4004a4a6fso1920468a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 07:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778857073; cv=none;
        d=google.com; s=arc-20240605;
        b=jBsTre9HYmXanJvBu4zC1QUlcH3VdeIBaJ8geHNTH93JNTZrdnFyECvP2MhvGfauVN
         LTBz3yJrZYc5dUN7bI/vT5oear4aXVxku8wdHKPffvaxqxdyRzhIekn6a+xQVjkwhHMq
         pBb/+84sk3838G3qKrr7WUeFS85f4ZvpGYY967oKQBnCGWhiICPuqUnwhFq0EixZLws3
         F+aVcf4LR+GY58mGgy8v5H7+ihxahpTYuUdkEsXpaLfNWnAZJIpj1d08TPH/5frZ+skn
         PG1nCtvwlrnXkg9I+o7B68mM6201PDzpHlNoPf0JIGPzgL3VVdT9eVQZk1xxnhOHJKtl
         icow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3t1pOxjg20Z3wcl0vvYq5Ty0ZflWEwctqSCHyvpXyd4=;
        fh=klm+NplcyJMulqkTIT6204mrPn0Rqz675qzj4/mRvyI=;
        b=W6bAwbc7xY0MYsMrzGagM+G+hk3dyO5OIXFHcM/V594HLLwbws4mbvB0z/czFAXxc/
         jjxWj24KvSCX8GvLfTegrXdy+ZZIQYi/XVXECwpgw18BwBw01KahNBH7dtE0Gw3RxEKt
         AZ4rv7pTQkIqIUcXdn8q0C4hehlYNvS5GyRzJKF5BfusLvAa1s0/Rm7xli/R8s2F2Per
         cZkczqTXenBD073XfS1iYEQTGD4KV/S7sEIJGJkNspL3UjAiWB4kN+qmmv6FY4xLu18c
         ytB9XIO5UTWTVqgQzHIL22c6b8V1kq8MCOvLNmh6evdJ0j7NTB7rDbaSMt0O297yXZae
         f8iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778857073; x=1779461873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t1pOxjg20Z3wcl0vvYq5Ty0ZflWEwctqSCHyvpXyd4=;
        b=N17nvHwoPHD3An6vxWnH6laAVUUFqj8FL+Z+tn0R18/ZTRoaEaHwWES0Mx7wcCAux5
         xG+9yLDCYKFeHdx6yLzz50nSkKvfH+jCnGooNTkT1aHQnUjW2XT6A6yRyDML/6+eqxV2
         bGoCNXRT7M5YS6TWBnm6wFTe/KoCBVsbGQ9xMptpwwnTpOtAT6EaWOCBdYiqz6+4ZKjh
         cX2NJNVDMgy/wQSj95VA4CI8+K46eXrSqGFPDZ3A4A3RXqZFqoj4Y5UCDgmDAZdLZ3Dy
         fRm89RW9alBcxVJAjhBgtd6BRaptghlw+jyByrNh0Ch/mBBZmiJHQCkw6Z0nYcKUX+/V
         k6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857073; x=1779461873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3t1pOxjg20Z3wcl0vvYq5Ty0ZflWEwctqSCHyvpXyd4=;
        b=H6dllYdYpIojKB5/PL0PkFZPnUIlMQ3h4ThhgPqLRgedcq4kVqKmE6cj+sKFG5Zx33
         8E2lYAYRvE7xt/B9bM6qXWL7DAqfzVjQu6ru0mdkmijrtdAI5xzehlVf2y5XNToOWbpp
         Ja3a+r1iKJq1TUFIiPNT+jN9oe1VlcLuugy1chS43CFb6nAbRF3yNHo+ibWsGFkGcQc1
         tI141IwRMLe1CFMNABRz1BP/hcDscIZ18pvi7oMnt8t8UgGG9qSI1QW9zAgc8oDk9uqH
         e5NFZyp0XHHZ7yaGd9mIYDwMhvvfMVK0KiYb8z9Hc8/FFTy3PrTGF4oJfUuckjlQOpEV
         Hijw==
X-Forwarded-Encrypted: i=1; AFNElJ+AF4fCyxHjKk6S7zToEnxWfUGinGHPsS4jmMV2rKb+q37vcJYZMw7lZwR3yLh+p+R80eCmExi4oSFQug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2MEdxyGZBgz5siGb/NS+JbOo5Z3I3Gkkytw7V/fv6sTPjJsWb
	pi74jGGivTUZxMrb6p/EwZGzoPIS8qnsgdceZbXv1Dla/5I9QFZpE4q1jCCP9Ka1JLjW+Q4l/gC
	U4Vywz/RO/7s7mqRUP2Uog1JXIKZl+M2wbhElYalSMw==
X-Gm-Gg: Acq92OFUZ4ibpV+4KM/8iSdBuyJcZojMln98DNdR/hGdmCjA2YYb0vgWgtTXSIsjXh/
	ivoRrJ70aFB9/WFdS5qkC24B6FE9ZJe9veSX+NmfevUxHIGXiL7Bwujj8XmGvvaaJkaQr9VD5Zm
	XQ/amXcCvhUDyXChC2UvpRWnXd3m+OmwQeBzhaUvr9LVhaCLA0DUjlpjJJf2epwnvoePOSbl3l6
	wGYCmAEB/eEeSju8WWox9OSInCK7zRvbPmwVWJqYds8BHqc4jUGhUvXnYHaL/rfY9g0FLVeGuJ/
	cFdmtHJt5/Y6OUHQy9TOJsE7LCAEgXEdbQL1iLo5+wjSMATTcKXhW1X6Olk7wLs1GuaVe3Vxcpj
	5ez5981ZXDMHJf6jXD9ZOgtCChJw=
X-Received: by 2002:a05:6820:c81:b0:67e:3ae6:9031 with SMTP id
 006d021491bc7-69c9bfc803fmr2593844eaf.59.1778857072918; Fri, 15 May 2026
 07:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260513092650.2386205-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260513092650.2386205-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 20:27:40 +0530
X-Gm-Features: AVHnY4IC21LFp6nss1DoEsQGb_rfcL825pTbxqa9a4YrYi4kf6osVuSSox6fKAY
Message-ID: <CAAhSdy08enoCH83begksrSA4strPG5n5Wd4i+ext0Z+Wmz_OAA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1
 SEND_IPI handler
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_075754_557815_A2E4DD74 
X-CRM114-Status: GOOD (  16.98  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjo1N+KAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBTQkkgdjAuMSBTRU5EX0lQSSBoYW5kbGVyIGl0
ZXJhdGVzIG92ZXIgdGhlIGhhcnQgbWFzayBhbmQgY2FsbHMKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQo
KSB0byBmaW5kIHRoZSB0YXJnZXQgdmNwdSBmb3IgZWFjaCBzZXQgYml0LiBXaGVuIGEKPiBndWVz
dCBwcm92aWRlcyBhIGhhcnQgbWFzayBjb250YWluaW5nIGJpdHMgZm9yIG5vbi1leGlzdGVudCB2
Y3B1X2lkcywKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQoKSByZXR1cm5zIE5VTEwsIHdoaWNoIGlzIHRo
ZW4gdW5jb25kaXRpb25hbGx5Cj4gZGVyZWZlcmVuY2VkIGJ5IGt2bV9yaXNjdl92Y3B1X3NldF9p
bnRlcnJ1cHQoKSwgY2F1c2luZyBhIGtlcm5lbCBjcmFzaC4KPgo+IEZpeCB0aGlzIGJ5IGFkZGlu
ZyBhIE5VTEwgY2hlY2sgYmVmb3JlIGRlcmVmZXJlbmNpbmcgdGhlIHJldHVybiB2YWx1ZS4KPiBJ
ZiB0aGUgdGFyZ2V0IHZjcHUgaXMgbm90IGZvdW5kLCBza2lwIGl0IGFuZCBicmVhayBvdXQgb2Yg
dGhlIGxvb3AuCj4KPiBGaXhlczogYTA0NmMyZDg1NzhjICgiUklTQy1WOiBLVk06IFJlb3JnYW5p
emUgU0JJIGNvZGUgYnkgbW92aW5nIFNCSSB2MC4xIHRvIGl0cyBvd24gZmlsZSIpCj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9m
Zi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRAZ21haWwuY29tPgo+IEFzc2lzdGVkLWJ5OiBP
cGVuQ2xhdzpEZWVwU2Vlay1WMy4yCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3Yw
MS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV92MDEuYwo+IGluZGV4IDE4OGQ1ZWE1YjNiODUuLjk4ZWNmY2IyNDY5ZTYgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV92MDEuYwo+IEBAIC01NSw2ICs1NSw4IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9l
eHRfdjAxX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVu
LAo+Cj4gICAgICAgICAgICAgICAgIGZvcl9lYWNoX3NldF9iaXQoaSwgJmhtYXNrLCBCSVRTX1BF
Ul9MT05HKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcnZjcHUgPSBrdm1fZ2V0X3ZjcHVf
YnlfaWQodmNwdS0+a3ZtLCBpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJ2Y3B1
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CgpJbnN0ZWFkIG9mIGJy
ZWFrIGl0IGlzIGJldHRlciB0byBjb250aW51ZSBoZXJlIHNvIHRoYXQgbm9uLWV4aXN0ZW50ClZD
UFVzIGFyZSBpZ25vcmVkLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
