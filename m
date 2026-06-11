Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE651CD98CF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 03:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McvoDY8+kFby0X6GSi04JlVpVT3/OzcAtTcW37CsLow=; b=RnoUlHcLN8svgU
	Y0fa0wSnEWx7voZhWMgLIZ6c1sQnAnlocVARNOnDGgrxbd1+hIQz0yd5Gdp8tM03jOADfgdIKzM22
	l4+BEUyTMMMWwhMDagobWdBIeXKBQSPuRq0d8VsXF9g/zPnEja1pGRTjHhWuLc1Df4zWVFQMf+c4y
	Pdq6sTee6JJDNbrQ10C9awJjyJ/KJi3Jjbc3HdIbr5c1yVSiIFOYehODx0uUKw5kOrBrm0b3DYber
	Dn4bvCP7Nq6spvOSTf7ksBqAP+3CT3ZVnd0Cj3Yzj1nNvUZvd2evIzT+UjC8yOpgcW9spMQW0FZDv
	3O5s7uVGjbZnjOEc0pAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVnV-00000008bOh-2C0Q;
	Thu, 11 Jun 2026 03:09:37 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVnS-00000008bNa-2HEY
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 03:09:35 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-36b903567fdso7640364a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jun 2026 20:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781147373; x=1781752173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYAsuub7tjh5DE2NtRU43cs+1enZX+YMETetqa3OJBs=;
        b=CN3ugqcSnzjErmYuD7UMMdn/4szOektWAI3+I+JFZjAicb5wL90Qkx1ts6iSuGjT1H
         of6tsvUzqb2Tn5IaryPEG/O8NheoPuLfDi0anQ1/8Vpg/dGvGgzZwN6yqmzyFb8xG+U1
         kvyePheT1ISYLGeuOem1u8fDMRfQx/8ZSPMlXqIrVBZ9p0fpcr8fxVvMxbKTJfveq40C
         qcCvvdoWK5gmXED/ANwrH/3NncaRrQJn589xHuGlILwfgvto5p3XpuhKTFb8y8+rfA+/
         RKzGEvaKpFsQxD6muBXF5UYwcOyFV5YzidPEQsOdUdCjGaMTPXvFKp+5WLh2hAdupJUT
         iseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781147373; x=1781752173;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYAsuub7tjh5DE2NtRU43cs+1enZX+YMETetqa3OJBs=;
        b=f2lc/qiKoo/2q6TDBJ6EQkAaKh8nzXeyK1JfXyEREJ75NzBxSFkKGRvZENGPIzmrkt
         vgJwKd9bVd1sHIaMMhrJaZzQe/TuqMjV7iC128DfkPk5NrrwFrIySgpyoQ4BXu8rMQGD
         mRLkMWjkYHVBN7oNeyB+Yj6xntjqZt/CO/HYoj+KNcOVIxNqR8mX+GPYYF4nVOQCDtjr
         ic7n+7NsHMXhVvAzwdgLe+GFPPORi3HA6zxReqLw6uahf3FdgxOdM/I6YGLhetS06iBZ
         K3cXPVQmumsILIw0F/PH91DYM1p+LQ6XiJ79h+/KoW9rOhWGar8PdZSyniNZcm5ijHNx
         Gnfg==
X-Forwarded-Encrypted: i=1; AFNElJ/5lqEAJyaj78KqgCmAQ+cSa4gCfqQ0cNkXN02ixgTFi3sRhm+H5cRPN3QuJLM4AYO0fN4q2/qs/Ohp5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHbuSpS3BYvGZDcV86T9zG2Z+XLaeTOaMZlzB9Txlp6MjRB1GD
	PqGcspNNPwOiCEYoVAhDpD/GWJhLeNSg8/l4/+1jEcFcf1vAuoNF6wfO
X-Gm-Gg: Acq92OF8+TCURsJQrHgrp7kBvSAc8oMLm2wufErNdNkBhPUpdmQ2Cz5hngz6n48ggpw
	8u+eh1dkwEcEJ+Ug5vu54uG7naM7Cb40g4pJjcxK/StjhZVN6bfepUYTwWoktXTg+jEYnIRLPhz
	kMdzWnd+ewQoV6oyFxp3bFo+38sBThif0VgirJBMONMQ7WfR+7jdkVti76iCAuA7GTP9Mx5JevU
	5tPj5oAA1poZES8BlAaiiB/ItPhwTBVb2FsLgeVaDHj6Ejk+4/TCea4H4NSCjKZr8/C0ktwvPc0
	rTrntKKgw3gH5cjaHcueMtu3vKxmkZMWdm2azATYFGNfV5CTDR2lCCDuwXhEqIbu8EoyDDB+JtT
	FLmXEs7oDArr22AuKNC5rjRRyuEsc5Y2XHNt9tTWtglRg3fjE8XzBn55PnzYhqJFTLU3xglAeF1
	j3akGf5PAWRPlfsuaG7SRpun6/odwTtSPDcZeudZEeQA==
X-Received: by 2002:a17:90b:570e:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-377a75cc2b7mr1151650a91.13.1781147373379;
        Wed, 10 Jun 2026 20:09:33 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86585b5356sm107409a12.14.2026.06.10.20.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 20:09:32 -0700 (PDT)
Message-ID: <a3993db0-6975-455d-9674-4fd7cfcf80fc@gmail.com>
Date: Thu, 11 Jun 2026 11:09:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
From: Wandun <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, Rob Herring
 <robh@kernel.org>, saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 chenhuacai@kernel.org, kernel@xen0n.name
Cc: catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
Content-Language: en-US
In-Reply-To: <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_200934_616899_BDCBEA24 
X-CRM114-Status: GOOD (  19.23  )
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

CgpPbiA2LzExLzI2IDEwOjA5LCBXYW5kdW4gd3JvdGU6Cj4gCj4gCj4gT24gNS8yNy8yNiAxMToy
OSwgV2FuZHVuIENoZW4gd3JvdGU6Cj4+IEZyb206IFdhbmR1biBDaGVuIDxjaGVud2FuZHVuQGxp
eGlhbmcuY29tPgo+Pgo+PiBPbiBTb0NzIHRoYXQgY2FydmUgb3V0IGxhcmdlIGZpcm13YXJlLW93
bmVkIHJlc2VydmVkIG1lbW9yeSAoR1BVCj4+IGZpcm13YXJlLCBEU1AsIG1vZGVtLCBjYW1lcmEg
SVNQLCBOUFUsIC4uLiksIGtkdW1wIGN1cnJlbnRseSBkdW1wcwo+PiB0aG9zZSBjYXJ2ZW91dHMg
YXMgcGFydCBvZiBzeXN0ZW0gUkFNIGV2ZW4gdGhvdWdoIHRoZWlyIGNvbnRlbnRzIGFyZQo+PiBm
aXJtd2FyZSBzdGF0ZSB0aGF0IGlzIG5vdCB1c2VmdWwgZm9yIGtlcm5lbCBjcmFzaCBhbmFseXNp
cy4KPj4KPj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBhbiBvcHQtaW4gJ2R1bXBhYmxlJyBmbGFn
IFsxXSBvbiBzdHJ1Y3QKPj4gcmVzZXJ2ZWRfbWVtIGFuZCB1c2VzIGl0IHRvIGZpbHRlciB0aGUg
ZWxmY29yZWhkciBQVF9MT0FEIHJhbmdlcyBvbgo+PiBEVC1iYXNlZCBhcmNoaXRlY3R1cmVzIChh
cm02NCwgcmlzY3YsIGxvb25nYXJjaCkuIEJ5IGRlZmF1bHQgcmVzZXJ2ZWQKPj4gcmVnaW9ucyBh
cmUgdHJlYXRlZCBhcyBub24tZHVtcGFibGU7IENNQSByZWdpb25zIGFyZSBleHBsaWNpdGx5IG9w
dGVkCj4+IGluIGJlY2F1c2UgdGhlaXIgcGFnZXMgYXJlIHJldHVybmVkIHRvIHRoZSBidWRkeSBh
bGxvY2F0b3IgYW5kIG1heQo+PiBjYXJyeSBrZXkgY3Jhc2gtYW5hbHlzaXMgZGF0YS4KPj4KPj4g
VGhlIHNlcmllcyBpcyBvcmdhbml6ZWQgYXMgZm9sbG93czoKPj4gUGF0Y2hlcyAxLTM6IFByZS1l
eGlzdGluZyBmaXhlcyBhbmQgYSBzbWFsbCBwcmVwIGNoYW5nZS4KPj4gUGF0Y2hlcyA0LTU6IFJl
c3RydWN0dXJlIHRvIGFsbG93IGFwcGVuZGluZyAvbWVtcmVzZXJ2ZS8gZW50cmllcy4KPj4gUGF0
Y2hlcyA2LTc6IEFkZCBhIGR1bXBhYmxlIGZsYWcgYW5kIGFwcGVuZCAvbWVtcmVzZXJ2ZS8gZW50
cmllcy4KPj4gUGF0Y2ggODogQWRkIGdlbmVyaWMga2R1bXAgaGVscGVycy4KPj4gUGF0Y2hlcyA5
LTExOiBXaXJlIHRoZSBoZWxwZXJzIGludG8gYXJtNjQsIHJpc2N2IGFuZCBsb29uZ2FyY2gga2R1
bXAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbGZjb3JlaGRyIHByZXBhcmF0aW9u
Lgo+IEhpLAo+IAo+IEdlbnRsZSBwaW5nIG9uIHRoaXMgc2VyaWVzLgo+IAo+IFN0YXR1cyBzdW1t
YXJ5Ogo+IC1wYXRjaCAwMzogcmVzcHVuIHNlcGFyYXRlbHkgcGVyIFJvYidzIHN1Z2dlc3Rpb24s
IHBpY2tlZCB1cCBmb3IgNy4yCj4gLXBhdGNoIDA2OiBBY2tlZC1ieTogTWFyZWsgU3p5cHJvd3Nr
aSAtcGF0Y2ggMDk6IEFja2VkLWJ5OiBXaWxsIERlYWNvbgo+IFRoZSByZW1haW5pbmcgcGF0Y2hl
cyAoMDEsIDAyLCAwNCwgMDUsIDA3LCAwOCwgMTAsIDExKSBhcmUgc3RpbGwKPiBhd2FpdGluZyBy
ZXZpZXcuIHlvdXIgZmVlZGJhY2sgd291bGQgYmUgZ3JlYXRlbHkgYXBwcmVjaWF0ZWQuIEkga25v
dyB3ZQo+IGFyZSBhdCB0aGUgZW5kIG9mIDcuMSAtcmMgY3ljbGUsIEkgZG9uJ3Qgd2FudCB0byBy
dXNoIHRoaXMgc2VyaWVzLCBqdXN0Cj4gY29sbGVjdGluZyBtb3JlIGZlZWRiYWNrLCBhbmQgd2ls
bCBzZW5kIG5leHQgdmVyc2lvbiBiYXNlZCBvbiA3LjItcmMxLgo+IElmIHNwbGl0aW5nIHRoZSBz
ZXJpZXMgaW50byBzbWFsbGVyIGxvZ2ljYWwgZ3JvdXAgd291bGQgbWFrZSByZXZpZXcKPiBlYXNp
ZXIsIHBsZWFzZSBsZXQgbWUga25vdy4gQmVzdCByZWdhcmRzLCBXYW5kdW4KCkFwb2xvZ2llcyBm
b3IgdGhlIGZvcm1hdHRpbmcgaXNzdWUgaW4gbXkgcHJldmlvdXMgZW1haWwuCkhlcmUgaXMgdGhl
IHByb3Blcmx5IGZvcm1hdHRlZCB2ZXJzaW9uLgoKR2VudGxlIHBpbmcgb24gdGhpcyBzZXJpZXMu
CgpTdGF0dXMgc3VtbWFyeToKLSBwYXRjaCAwMzogcmVzcHVuIHNlcGFyYXRlbHkgcGVyIFJvYidz
IHN1Z2dlc3Rpb24sIHBpY2tlZCB1cCBmb3IgNy4yCi0gcGF0Y2ggMDY6IEFja2VkLWJ5OiBNYXJl
ayBTenlwcm93c2tpCi0gcGF0Y2ggMDk6IEFja2VkLWJ5OiBXaWxsIERlYWNvbgoKVGhlIHJlbWFp
bmluZyBwYXRjaGVzICgwMSwgMDIsIDA0LCAwNSwgMDcsIDA4LCAxMCwgMTEpIGFyZSBzdGlsbAph
d2FpdGluZyByZXZpZXcuIFlvdXIgZmVlZGJhY2sgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRl
ZC4KCkkga25vdyB3ZSBhcmUgYXQgdGhlIGVuZCBvZiA3LjEtcmMgY3ljbGUsIEkgZG9uJ3Qgd2Fu
dCB0byBydXNoIHRoaXMKc2VyaWVzLCBqdXN0IGNvbGxlY3RpbmcgbW9yZSBmZWVkYmFjaywgYW5k
IHdpbGwgc2VuZCBuZXh0IHZlcnNpb24gYmFzZWQKb24gNy4yLXJjMS4KCklmIHNwbGl0dGluZyB0
aGUgc2VyaWVzIGludG8gc21hbGxlciBsb2dpY2FsIGdyb3VwcyB3b3VsZCBtYWtlIHJldmlldwpl
YXNpZXIsIHBsZWFzZSBsZXQgbWUga25vdy4KCkJlc3QgcmVnYXJkcywKV2FuZHVuCgoKPj4KPj4g
djIgLS0+IHYzOgo+PiAxLiBGaXggb3V0LW9mLWJvdW5kcyBpc3N1ZSBpZiBkZXZpY2UgdHJlZSBs
YWNrcyAvcmVzZXJ2ZWQtbWVtb3J5IG5vZGUuWzJdCj4+IDIuIEZpeCBVQUYgaXNzdWUgd2hlbiBh
bGxvY19yZXNlcnZlZF9tZW1fYXJyYXkoKSBmYWlscy4KPj4gMy4gQWRkIHNvbWUgcHJlcGFyZSBw
YXRjaGVzLgo+Pgo+PiB2MSAtLT4gdjI6Cj4+IDEuIHYxIGFkZGVkIGFuIG9wdC1vdXQgRFQgcHJv
cGVydHkgKCdsaW51eCxuby1kdW1wJykuIFBlciBSb2Incwo+PiDCoMKgwqAgZmVlZGJhY2sgWzFd
LCB2MiBkcm9wIHRoYXQgcHJvcGVydHkgYW5kIGV4Y2x1ZGUgcmVzZXJ2ZSBtZW1vcnkKPj4gwqDC
oMKgIGJ5IGRlZmF1bHQuCj4+IDIuIFNwbGl0IHNvbWUgcHJlcGFyZWQgcGF0Y2hlcyBmcm9tIHRo
ZSBvcmlnaW5hbCBwYXRjaGVzLgo+PiAzLiBBZGRyZXNzIGNvZGluZy1zdHlsZSBjb21tZW50cyBv
biBwYXRjaCA1IGZyb20gUm9iLgo+Pgo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDI2MDUwNjE0NDU0Mi5HQTIwNzI1OTYtCj4+IHJvYmhAa2VybmVsLm9yZy8KPj4gWzJdIGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUyMDA5MTg0NC41OTI3NTMtMS0KPj4g
Y2hlbndhbmR1biU0MGxpeGlhbmcuY29tP3BhcnQ9NAo+Pgo+PiBXYW5kdW4gQ2hlbiAoMTEpOgo+
PiDCoMKgIG9mOiByZXNlcnZlZF9tZW06IGhhbmRsZSBOVUxMIG5hbWUgaW4gb2ZfcmVzZXJ2ZWRf
bWVtX2xvb2t1cCgpCj4+IMKgwqAga2V4ZWMvY3Jhc2g6IHByb3ZpZGUgY3Jhc2hfZXhjbHVkZV9t
ZW1fcmFuZ2UoKSBzdHViIHdoZW4KPj4gwqDCoMKgwqAgQ09ORklHX0NSQVNIX0RVTVA9bgo+PiDC
oMKgIG9mOiByZXNlcnZlZF9tZW06IGF2b2lkIHBvc3QtaW5pdCBVQUYgd2hlbiBhbGxvY19yZXNl
cnZlZF9tZW1fYXJyYXkoKQo+PiDCoMKgwqDCoCBmYWlscwo+PiDCoMKgIG9mOiByZXNlcnZlZF9t
ZW06IHplcm8gdG90YWxfcmVzZXJ2ZWRfbWVtX2NudCBpZiBubyB2YWxpZAo+PiDCoMKgwqDCoCAv
cmVzZXJ2ZWQtbWVtb3J5IGVudHJ5Cj4+IMKgwqAgb2Y6IHJlc2VydmVkX21lbTogc3BsaXQgYWxs
b2NfcmVzZXJ2ZWRfbWVtX2FycmF5KCkgZnJvbQo+PiDCoMKgwqDCoCBmZHRfc2Nhbl9yZXNlcnZl
ZF9tZW1fbGF0ZSgpCj4+IMKgwqAgb2Y6IHJlc2VydmVkX21lbTogYWRkIGR1bXBhYmxlIGZsYWcg
dG8gb3B0LWluIHZtY29yZQo+PiDCoMKgIG9mOiByZXNlcnZlZF9tZW06IHNhdmUgL21lbXJlc2Vy
dmUvIGVudHJpZXMgaW50byB0aGUgcmVzZXJ2ZWRfbWVtCj4+IMKgwqDCoMKgIGFycmF5Cj4+IMKg
wqAgb2Y6IHJlc2VydmVkX21lbTogYWRkIGtkdW1wIGhlbHBlcnMgdG8gZXhjbHVkZSBub24tZHVt
cGFibGUgcmVnaW9ucwo+PiDCoMKgIGFybTY0OiBrZHVtcDogZXhjbHVkZSBub24tZHVtcGFibGUg
cmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgZnJvbSB2bWNvcmUKPj4gwqDCoCByaXNjdjoga2R1bXA6
IGV4Y2x1ZGUgbm9uLWR1bXBhYmxlIHJlc2VydmVkIG1lbW9yeSByZWdpb25zIGZyb20gdm1jb3Jl
Cj4+IMKgwqAgbG9vbmdhcmNoOiBrZHVtcDogZXhjbHVkZSBub24tZHVtcGFibGUgcmVzZXJ2ZWQg
bWVtb3J5IHJlZ2lvbnMgZnJvbQo+PiDCoMKgwqDCoCB2bWNvcmUKPj4KPj4gwqAgYXJjaC9hcm02
NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmPCoMKgwqDCoCB8wqDCoCA2ICsrCj4+IMKgIGFy
Y2gvbG9vbmdhcmNoL2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyB8wqDCoCA2ICsrCj4+IMKg
IGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jwqDCoMKgwqAgfMKgwqAgNCAr
Cj4+IMKgIGRyaXZlcnMvb2YvZmR0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMSArLQo+PiDCoCBkcml2ZXJzL29mL29mX3ByaXZhdGUu
aMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKwo+PiDCoCBk
cml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDExNyArKysrKysrKysrKysrKysrKysrLS0KPj4gwqAgaW5jbHVkZS9saW51eC9jcmFzaF9jb3Jl
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICsrCj4+IMKgIGluY2x1
ZGUvbGludXgvb2ZfcmVzZXJ2ZWRfbWVtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNSAr
KysKPj4gwqAga2VybmVsL2RtYS9jb250aWd1b3VzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgOSBmaWxlcyBjaGFuZ2VkLCAxNTcgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
