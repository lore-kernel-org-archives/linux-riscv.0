Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32412C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:17:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7C960FE8
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB7C960FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FR7I/N1SbuDj3TtW5c8rrgzBLg8tqJqaXgor+lro0Is=; b=BtNMagym45zVZr
	jPTGWFN8WmgiC6O8gDo0ESDmoNRisqh1/ijliMGRdQprpitoxkiuy/Z6QzFh9gnbhWwr34TCBOzTH
	FZKxRfz8F0YZ58538ZeuDD6eXc3V2Of2WpTPTYzQUWjlnXjV1fyeofSckM7Vlv9iyjm+5XtehQZhL
	1vrl2b9nu/H6ckYTTv2wnTUyqbIABal+5mkPEXl1kaGK/D07QpP9n09xqDPoBhfidMrCZ9oG1qRhI
	ZLhdlIozCekWYM0bQOUvJZITzMyOslX3SyMFSUIFXeLlHyheLqVCwsO/ihvETw6mwUaExuk5l/H/i
	oUntUePnirXp6waeg8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0mS-00Geib-Vv; Mon, 25 Oct 2021 14:16:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0mD-00Gebx-CT
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yBIeDqOkiGFurlFgD43y7wdSJN5RQI+Z9N38wXwm0c=;
 b=fi7aAaBeFfH4Qk8blOaIo3+M1Y3wlqngaQz/TwxqzkIzw6kAAn1FX4JOeeCWo9im0FoGzG
 ZK2qkY1aJQQqCVrgyUPWgXwJQthMYAdRlWQUT4kQnavWJ77N2IU0ptyA9L5cHakK8LXdsH
 aTY+3VZNBGtf3KOQ1FSTJep/v8huTKo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-StPDoP6ePYmlO-aQzYzywQ-1; Mon, 25 Oct 2021 10:16:34 -0400
X-MC-Unique: StPDoP6ePYmlO-aQzYzywQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m16-20020a056402431000b003dd2005af01so8390756edc.5
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1yBIeDqOkiGFurlFgD43y7wdSJN5RQI+Z9N38wXwm0c=;
 b=Imyoxpn/uVvLWS9W3mLrrrDt4qowtPopUSyM7leIYe+t8Pzl9haK6mlgzJRQyJdqZD
 Hc+3sDC73HPZPE0OAmEmzJTH2ZR0+E8f0BRwbLz9U4otd5QPgqOAzI1mApmHX8LVHwox
 ebxI9vIaFBYGnhhe6rJcpMDii86n7zgMh90utzs3CBl6fptgnyYgNDslNXuUu52eNgDF
 hr+/MNRm7KEoN1eArKSteBhT/39eYUgX4o5mU1uJsart0wKD5DfRWOoffyEHhK2yBoeZ
 27aXeNV6dfXuiX8eHZrlJBq279at5xUjQS+bDKQyFuMglO0Xkns9KY9fb1l8F2+OT9J1
 oeWA==
X-Gm-Message-State: AOAM533j648fiA+3e9g5M2pDrUuLlTJH35/CO4pGIA4O4nfwjqBCIGbT
 jr23Xmq2q3OCvWR9Fyz87ZmGscRpo9kl19btiu9NIGhbOZKBFoa4f8LZgYEIu55e+2CzKNaBcy9
 HxMMov3ZTpQaufiJ8yn3nmxBdnGre
X-Received: by 2002:aa7:c384:: with SMTP id k4mr20307557edq.281.1635171393295; 
 Mon, 25 Oct 2021 07:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy0DabLqT08o64mSEkgU1uBZtZezVv5apPrWyd4apSmXmCs+LkrkYQ/fnsjY0W8O5UT62zRA==
X-Received: by 2002:aa7:c384:: with SMTP id k4mr20307513edq.281.1635171393133; 
 Mon, 25 Oct 2021 07:16:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bx2sm3600770edb.44.2021.10.25.07.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:16:32 -0700 (PDT)
Message-ID: <01b5edae-aaa9-e96d-daaa-197c0c3a0431@redhat.com>
Date: Mon, 25 Oct 2021 16:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 43/43] KVM: VMX: Don't do full kick when handling
 posted interrupt wakeup
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>,
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
 <20211009021236.4122790-44-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-44-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_071637_517396_2C15D71C 
X-CRM114-Status: UNSURE (   6.94  )
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

On 09/10/21 04:12, Sean Christopherson wrote:
> When waking vCPUs in the posted interrupt wakeup handling, do exactly
> that and no more.  There is no need to kick the vCPU as the wakeup
> handler just need to get the vCPU task running, and if it's in the guest
> then it's definitely running.

And more important, the transition from blocking to running will have 
gone through sync_pir_to_irr, thus checking ON and manually moving the 
vector from PIR to RVI.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
