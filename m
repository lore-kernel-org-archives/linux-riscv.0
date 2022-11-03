Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3D1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqL0aCvRJyWwlguxneOh5lHCKBUYsI9GlfZ8J/K6ABE=; b=3xHXtrQWOxFHs4
	qc5Hi7iaYCTDApglqMaHneluTcpcNZSvUpnSBotusFl7T7EvbJwOon4ryyhG2AfFAYB8RUWKc/J4o
	KZHQwMdNM6Zwr+VpC2MaslAXBidrJkUdM6z6bR17Mr4W5XaP8Mm4plUCrmaJbq9pvSWToDDDgVdfm
	dWWEuF98PQl3+jWUEWdQhmpz+lHHAzNTF3zFnN43RTCAVXAua+SULtFQSP9M6bOPzyn8oaLnGojnn
	NDLSDqnMzYBEndNJoTLtx1CO95ERnLABTJNbs1vIZ5JJEv4vSORbDpcQWqFaTO5blavZx5/mLOJA7
	jvbTYOcDjKzR8NDUciqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqamp-0000q5-9G; Thu, 03 Nov 2022 14:01:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqamm-0000p1-Pz
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 14:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667484094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gp3ZE1TCS6qUf/W2wfyFuvz85/MTtwzsFfwWgQFj3ps=;
	b=dh5KjP84J/0HXiAK63MsJRSA8YFlBEw8pNy/YxaPV3Dg4QeF2tKsEPFvZRKZXZO3ZFTBDK
	Tuk3TZHRxiXACi6QJRfYWxpDOEwHwyOsAgWe12MjXnVtI24JWplM27DfI30Ck7KctT1G95
	3yc430Mw8QOB543h9Ns8FzKPxELRlMc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-TzaV3rQPPnOxtlEO5ge5xA-1; Thu, 03 Nov 2022 10:01:33 -0400
X-MC-Unique: TzaV3rQPPnOxtlEO5ge5xA-1
Received: by mail-ed1-f72.google.com with SMTP id dz9-20020a0564021d4900b0045d9a3aded4so1448117edb.22
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 07:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gp3ZE1TCS6qUf/W2wfyFuvz85/MTtwzsFfwWgQFj3ps=;
        b=RrsVt7RuJTvmXcc4ZoR/xrZwW7KXe3O1rfV/IQjiBxTyWo5ffw6u1Txi4jUQAbWxW3
         vDV4eFwYwlV06Z4VacnDqYQ6y/o9LydLtg/6DtJREi0S6K/9tAgun2UO1W53vRu2/r/6
         JSCNMu0JbYXGFmLp2g+nNbWQsyvUEC+bhM0Vgxmn/CpCykwrGPgtDi6oF9ct8vpr2aNm
         JobXPQPyrshgVxv4UYoZvnyYVMTgqHp+t9/7FvM5hHW7imfaW0a/RHoJfVB6SB7GMCLO
         P5NB3RQX9syv9xD0thg7kDpObapYHxLjzlJhyXc8tZIIXFxvglWOA/xfCaC2vXoHArpI
         cjrQ==
X-Gm-Message-State: ACrzQf2P1lEG/Kr26YyVH+8UrOoag/wG+DdK65SBG8/NaWuYs4TNT7pB
	CAo0JWRhRNphWfyqyj6MiGb3F6DqZGsTRqB3qiCSg0YbHzgEcm4WhutVRmpVJuyOb32Vts71adJ
	gAPXTozx7SFy8uu8tQDmwSTrJaf5l
X-Received: by 2002:a17:907:7e9e:b0:7ad:bc80:c003 with SMTP id qb30-20020a1709077e9e00b007adbc80c003mr25375174ejc.198.1667484090592;
        Thu, 03 Nov 2022 07:01:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM573p4EUrag9CU7KGeV5DPwqVdO4hG3cdn9PAejBOFdAvPNF2Pfj2lgSHDnk+0puoAwMgBkew==
X-Received: by 2002:a17:907:7e9e:b0:7ad:bc80:c003 with SMTP id qb30-20020a1709077e9e00b007adbc80c003mr25374580ejc.198.1667484084861;
        Thu, 03 Nov 2022 07:01:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id a7-20020a17090640c700b007305d408b3dsm532188ejk.78.2022.11.03.07.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 07:01:23 -0700 (PDT)
Message-ID: <d641088f-87d9-da77-7e98-92d1a9de6493@redhat.com>
Date: Thu, 3 Nov 2022 15:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 10/44] KVM: VMX: Clean up eVMCS enabling if KVM
 initialization fails
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-11-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221102231911.3107438-11-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_070136_964781_CB08D8D9 
X-CRM114-Status: UNSURE (   5.90  )
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

On 11/3/22 00:18, Sean Christopherson wrote:
> +static void hv_cleanup_evmcs(void)

This needs to be __init.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
