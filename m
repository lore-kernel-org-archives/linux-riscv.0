Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE762C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2gILp/4ZxjgZLkRi6/U1TJuAokAOdQNMNGT6whqxpY=; b=P+oBM0TUkFGF3H
	rB7HS1A0OqYt5N4YnOHm4BH9FzXpH6XxEbbL+hpdNy/QdOzmlh0doXwNZWKzKMtj//HxUk9PVr+pD
	hC5T2rtco8W5vQyC1NXWbICQtNIg3UbHJwa7haDFT6bYrUToGmQWm1+3nAxhWvCtt76nkuawfvP9X
	M2jw5az869KV3+/icZshR1rvVXt4Ar6r+OoiYxuNWLZoWnS22kr/+uhyX/aF0/OAZZ3k1VRNc9HLm
	Z90p+RF4CDzVfSKzqnLYjxKF9yHmEytQ9yWrioIZSGpaS/9wvGZ4h6ctG+S6dfcbG6GHJRpTFw7oO
	BdWs2jwc3akXTDxWQTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqabe-00ARTC-LC; Fri, 26 Nov 2021 12:45:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaQP-00AOGd-UU
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 12:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637930037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPzVgc0AYP+sKhBkiolAFzffLls+sRar8XWgazVePtA=;
 b=WD3Mw0tTVQ5GpDSlQewA62FEaVliiY2PNT2H0bPa4QVHl1ncbBKlKbFp7qThesrEx65L4H
 VDzNVwRaj/MyBv6JGuT2+zueUEHGSKsULDlotGcz94dlTfxrlH9hsyWVLOYkHh0minnYsx
 neWiCWbReor072FA/2TLA77YMofYDyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-lecbiigyPvSggTsjaZoCPA-1; Fri, 26 Nov 2021 07:33:53 -0500
X-MC-Unique: lecbiigyPvSggTsjaZoCPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4AAA81CCB7;
 Fri, 26 Nov 2021 12:33:51 +0000 (UTC)
Received: from [10.39.195.16] (unknown [10.39.195.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 467C55D6B1;
 Fri, 26 Nov 2021 12:33:40 +0000 (UTC)
Message-ID: <086c9553-6ba1-411b-43db-b51670798938@redhat.com>
Date: Fri, 26 Nov 2021 13:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5.5 00/30] KVM: Scalable memslots implementation
Content-Language: en-US
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: Sean Christopherson <seanjc@google.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
 <YYnNA5lZNXXdX/ig@google.com>
 <f3bc3bfc-37c3-bbfd-25b4-ef0a72e534ba@oracle.com>
 <5129f02d-7c0e-8e88-797f-95e8d968df88@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5129f02d-7c0e-8e88-797f-95e8d968df88@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_043358_085538_77B7AA4F 
X-CRM114-Status: GOOD (  11.92  )
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

On 11/23/21 15:42, Maciej S. Szmigiero wrote:
> Paolo,
> 
> I see that you have merged the whole series to kvm/queue, even though it
> still needed some changes and, most importantly, a good round of testing.
> 
> Does this mean you want all these changes as a separate patch set on top
> of the already-merged series?

Hi Maciej,

you can squash your changes and post a v6.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
