Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88A4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844AB611B0
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 844AB611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65XjWbsMlYiVLmtKIFPjIMsLWBvkuOXvLpA+4FUtB8s=; b=2nF4PTN5r5PVZW5tmaulHtrPY+
	y3NEddtnIvAPA1fJY9+/mPOusDw8ShloBFTeoRvyktjxjQ/UHKy0ThSyxF+XYQOKD3vMUxna8VhaM
	Jyd8TPdPXDKFjJey2IHAvbHGVB3fNg+AChq5DVmzWIWI4N151myFHXNSoBVVzSFk1FpB9f3nuUEH0
	5J22RbD7z/CgpOdXqXCdagRFloKBEveMX8XSh6pbCj4BvV2QNAKNz6eZzISmqKEWe3I2y9lt+uPz7
	+TXokzndS3vP98w3LoskrFOSftWLtVWsJ4JHSa3myIP8ZqtPl3rTnC9z6nMxvAjJiZtHkh9XZZxrR
	0rO6lPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSvz0-0077nW-RK; Wed, 22 Sep 2021 06:43:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSvtf-0076TO-79
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 06:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632292702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3XTCa1nu8hCtlYTFFK2GZognBOtLDAkX/kYxcYF1XA=;
 b=NUU64Xb1BcgagGpy9iPM2unKlGXmCCkRfB69KsWkLaF1CANMexfuGIRg2veNeBpU0TlP7C
 SMmoE3GhDeOg+/rY3Jky4LurhV/dNIJD+g2nyanA45uYOJKrgQ5LdF9C5yl9nWGruU4Fm5
 /Fx0zIef1Gp4HywOyr78b6+Q+MzXQk8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-Ni2lkNTUMeaxCgAnic72iQ-1; Wed, 22 Sep 2021 02:38:18 -0400
X-MC-Unique: Ni2lkNTUMeaxCgAnic72iQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so1137343wrg.17
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 23:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z3XTCa1nu8hCtlYTFFK2GZognBOtLDAkX/kYxcYF1XA=;
 b=t1z4O8IEO+Gk/1e7qjlvXNd5gZcUchlYENucVdy1wonDJcMABz20xFX9/sPcVL8g9m
 anwtaEDfdQJtIY1Aa9dJqCbHkOwe6MBQos0pLusqEEG/fFcrHFgqCwJPjhyeo1MsjD5k
 ih2nfxcYKk27jYNveIUJCyHvBXukPPPow36wgfrWIH0BajZC1Hm3J59gduaQsqGbpoTT
 XYI+NP6LzdOjG96LJlNc9UUgO0eU34+Hkj9XkHP8lyLIJjJkva067M/G5bWYGXBwhf/R
 HTV2QREBSrkGdFI/VlcA9OY5jPTAeWPy1RfaBLa5rtpaU63wR+6kmlJv5psRt580T07a
 hMWA==
X-Gm-Message-State: AOAM530QtyFnGBMMPt1/glgvp+MCkqo3b87qbPKjFKUCHJ16zrIUph8r
 Jz2k7e48ysO4YPWWqDBCA1mm0NYc2ynCz3Z7LipqvN1MFTOPx/I/Rfz26QUfWaTdZsL1oSjDqHs
 5yixLNxv+oT3ig7pwXAvDr6/DVu1B
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr8613997wmj.163.1632292697322; 
 Tue, 21 Sep 2021 23:38:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywCmZIrNrFYOLYwz4uLurAI8KkuEnxjxQSJf2bjooMgzy2h0qoOTiWQbU4UgbH2lcfc2iQrA==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr8613976wmj.163.1632292697089; 
 Tue, 21 Sep 2021 23:38:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j21sm1162153wrd.48.2021.09.21.23.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:38:16 -0700 (PDT)
Subject: Re: [PATCH v3 11/16] KVM: x86: More precisely identify NMI from guest
 when handling PMI
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-12-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d444303f-7ee5-7ddc-8eae-64d1e6d4862a@redhat.com>
Date: Wed, 22 Sep 2021 08:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-12-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_233823_366328_0CC5DA80 
X-CRM114-Status: GOOD (  10.16  )
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

On 22/09/21 02:05, Sean Christopherson wrote:
> Note, this also doesn't completely prevent false positives if perf
> somehow ends up calling into KVM, e.g. an NMI can arrive in host after
> KVM sets its flag.

s/calling into KVM/being called from KVM/ ?

Not sure about what you meant though.  The code is nice, so

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
