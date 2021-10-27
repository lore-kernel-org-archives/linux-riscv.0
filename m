Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE4BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:57:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B28860E05
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B28860E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0hKlz4X2eDJ2B23o8J2v3T7ZZMh2RNbwvjzmyPA2SQ=; b=Fhk/tbPjm8AEJx
	v4AFGlBmdqmi1huZi7iJsdYoVUlWKa4UABVndc8Qtf6EPT1zb+af9pv+exonRtnIyMs0rzXWYgY0+
	YnifdDz7oGdm8dww1v3CkNcjhMUh2XvynX5LbRdOOJ3yAzYf8EN+6cfW+mf7SwelYStRwFUvXv52K
	5CIUZ3lLa72t9QwDkxfT6neMi5PsZg/WnQ5q6Nj5a3MiNZ9Df41/2wzg2blK6o+8qUZdbYDSTyZ9a
	beVSYKHaD13xxGlNyxb869r4TAOzsJbHiD81ogRvWOZ6XPTEn3QgqUGmIWNHFPmwBw6NiJa56F5ZH
	yR3iEGsggeEo/jlDWuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfkMl-005DhH-QP; Wed, 27 Oct 2021 14:57:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfkMa-005DfY-I9
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 14:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635346631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kiv1BZf6xFogujw6ml5Mx2cj+xKDQFeYDEEPX1GMOs=;
 b=CYIxKjpCTRPNFwO45rfZcvEc5EOw8tCFGcoyb0alw/fDelPLybQDHQEqIrVRABJJyJ9+V4
 9kJnhjfAN4puV4BMQiNSm/pMoitg4FHReFDclaqPE9F30URNuZWBhCKBYAgpvI1A3vyOOg
 fRtn2aYUvc2FHgnk8EyPJ4dsT0eujC4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-MU1zY_w6PR2EltCE9Bm3tQ-1; Wed, 27 Oct 2021 10:57:07 -0400
X-MC-Unique: MU1zY_w6PR2EltCE9Bm3tQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m16-20020a056402431000b003dd2005af01so2585250edc.5
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 07:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1kiv1BZf6xFogujw6ml5Mx2cj+xKDQFeYDEEPX1GMOs=;
 b=CNebTcMFbSyaDCcadCpNexBuJ7g+IY2UWzh74BleX+ZTwH2QA5cIzx6IFmHt5ZNDMm
 +XVNnoLYLqHDnC6OA+iQUYdSt31J3T7PmtwD3qABTlv2G0pFkOPRaE7q15bhx9rD0ULQ
 HKCAKCGXSxNICYTKOqRfT9hi5rGigra0RUEzgnHvKZcB7CQ6wMH59ldJ88RBufB8/C5h
 2RqMQ1zvR3CyWAZ4mVHT5UlQXu+LuqEnwa4KkEqNPQ0TD68O8g3cVZI2iQaPt5ZeLaL8
 klgs3JDuHMZFPlWDvrPvrRFnayNBwZTOp2dlYXlvy/eLff8BKjsU8/2dRSXGnMOw8sOZ
 vjcQ==
X-Gm-Message-State: AOAM532BdNzvjigoDDF2bDC4jyR+Vz6T3R07JBAr1c7l5kWinnr3ETZW
 CYcW7mo+Io6g+2+4+PXimUKnYv3Xkp4+8W4eZS+QB1K9G9huH8NI3n4aV4vSIB2gRDV/kcgSDYJ
 3yEiVJOnRcRLtpJLS6le3ZMA8xVBE
X-Received: by 2002:a17:907:7d94:: with SMTP id
 oz20mr38999423ejc.98.1635346626741; 
 Wed, 27 Oct 2021 07:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytn7bu+kBLh9LVQ/1pex7gMJDdz0Rr/buTYBO2a2VZJzJDbs6skZyshVLbERw1F1K5YyM70Q==
X-Received: by 2002:a17:907:7d94:: with SMTP id
 oz20mr38999381ejc.98.1635346626512; 
 Wed, 27 Oct 2021 07:57:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t15sm67707ejx.75.2021.10.27.07.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 07:57:05 -0700 (PDT)
Message-ID: <ecec4d7d-13dd-c992-6648-3624d7c14c24@redhat.com>
Date: Wed, 27 Oct 2021 16:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
 <YXllGfrjPX1pVUx6@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXllGfrjPX1pVUx6@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_075712_685649_47463A93 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 27/10/21 16:41, Sean Christopherson wrote:
> The other thing I don't like about having the WARN in the loop is that it suggests
> that something other than the vCPU can modify the NDST and SN fields, which is
> wrong and confusing (for me).

Yeah, I can agree with that.  Can you add it in a comment above the 
cmpxchg loop, it can be as simple as

	/* The processor can set ON concurrently.  */

when you respin patch 21 and the rest of the series?

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
