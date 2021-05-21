Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1521DC04FF3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 20:26:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FB96135A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 20:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73FB96135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZ2xhn2XFkYyckomhh15ep8n9Hk5DF+OFXNwGUHI14c=; b=GRjaekELmy7QehlFvH/wAEAVQk
	ap/vwhUxtICpz43z9905Fh2dUlFIZ10j9AlQK3TikKZMwHZ5+78FUKCaglZ/kqJerrLmPRFJ922JI
	MSgKi21o1ojbnIiw9c9ttLiWzOz4eGj42C69d1f3uLBRZZiYfJFwpcANwnTu892LkerADAAEvhEdz
	y7HtAI6cCvAkWxtm0e3Ibx9Lm4s8Z41YkspKkyodfX5XOpxic1EWuDh2bgx8zWDjHrHjxSvj6udQh
	qkQbxgOOv/sXKvO+BLxxBjDgDQtzmhs3eH//QhP0LjPY9w/e7qPohtCVpNZY6KFSXQSjroPGTVCZ8
	ntDIk9SQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkBiu-0012Te-UP; Fri, 21 May 2021 20:26:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkBii-0012RQ-4Y
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 20:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=538ECF91gJCkNsV6K0m49/DR+WsCYP9T9kKj+WEgQUw=; b=QbKBkOPdRmxKlwJfovh9ogtYr+
 Xqpubg9kqNfBS5o7oRyJsl68cphcd9ScgUP8oM5f6hl7tK1Ssts6q02VINtvZH+6vOD42F0WD4/ji
 JQrOcLg4j0JLQudnuGSIDbSOGpy35jGOI/DJx4MTWrTAmTYGAh1+vNTLaJHA0/aErjcbBVzNIHzjI
 8L9RBxptei7SUIT7gFQ95SFlbAzyix45evkHcnXd13nbRucdV1RY65XKlYDzAk4qs0WnAZiM34/4C
 CM4TeiXV3QVC4ClvpYu1ilTiYAMj3l7sHh8B0aoYvqAO3B7MLTYnh0bptbj6JHiIgZQD5rYNjdP5C
 +6tO9ITg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkBif-00HPXJ-A9
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 20:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621628764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=538ECF91gJCkNsV6K0m49/DR+WsCYP9T9kKj+WEgQUw=;
 b=cSAL+eAFsA3PdoLglROQ5gDza85F+u2vXskQY/GoM4k4D5Gq/i4WIrC+Ghtz36jv+yuCoM
 YKS4i6hkt8/hDs104zmbfVZSs4qNsft/j5oWgnzEGoH2Ec3/Sruqv1x6ddm8zjACkdvUXy
 5chuVHBJJdDH0w5EAas+wqwYp+86E7o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-6d5gEx18PbGdEgNGLo-WNQ-1; Fri, 21 May 2021 16:26:02 -0400
X-MC-Unique: 6d5gEx18PbGdEgNGLo-WNQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so11921998edu.1
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 13:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=538ECF91gJCkNsV6K0m49/DR+WsCYP9T9kKj+WEgQUw=;
 b=lOVXH+Edu3TBicWt608fPD6qqjT2HVZV2VqKV3aIYpHVWXOAKpRFxqZkaxXdEvdyfE
 R8d0COYv7oukV46HVfKU+ssk/eT2WM9l/pKoflJzlfwtA2/7ze7xque+Nv33o1xApeSY
 fLspK/5KGDRGFUxDOssapSw0l6CNyufcoIqnQ2jirz1Ej8It1Rx36qinpQESRYMSYAvE
 AqRqPBIJ6AVjzPUu25YZbFDu6AXXaof3U7POc4WBpFuyIvAQpJZiXAUoewSw6NoFzpN1
 QavHCa0y4HE5RueiYBomidalfv4adPZAOkEC7O2k5yyi1t+Ddky/W8W+SnO9ZYVlB8D2
 RQBQ==
X-Gm-Message-State: AOAM533LDzDl5DA0Vl8qy8EPGI3jGrCer3Ofn57zXOv5w6Co0sU+vEzG
 p/iAQu2L/YiWMsr5Rz8aKrbS4WqtrUeJ1UegPCinoIqIJQ8JmxCEhUUATAPsselRFbGO2rsitMV
 /oeYLS9p9UgbIpK8Imr+TcEzvDjf9
X-Received: by 2002:a17:906:408d:: with SMTP id
 u13mr3539574ejj.128.1621628761493; 
 Fri, 21 May 2021 13:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWdTt0OF6CxsPUnwkdM+BeqLBz1MEl7r1QIb+Pld1fs/jKvj4IlpWl2lFYHMg6LfydV3c3fQ==
X-Received: by 2002:a17:906:408d:: with SMTP id
 u13mr3539559ejj.128.1621628761262; 
 Fri, 21 May 2021 13:26:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l28sm4751766edc.29.2021.05.21.13.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 13:26:00 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, anup@brainfault.org,
 Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, corbet@lwn.net, graf@amazon.com,
 Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
 <ff55329c-709d-c1a5-a807-1942f515bba7@redhat.com>
 <YKfyR5jUu3HMvYg5@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <00d96cc3-026e-bd78-db08-f9e98a4abeff@redhat.com>
Date: Fri, 21 May 2021 22:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKfyR5jUu3HMvYg5@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_132605_446105_B2DD5980 
X-CRM114-Status: GOOD (  17.73  )
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

On 21/05/21 19:47, Greg KH wrote:
> If this isn't in any hardware that anyone outside of
> internal-to-company-prototypes, then let's wait until it really is in a
> device that people can test this code on.
> 
> What's the rush to get this merged now if no one can use it?

There is not just hardware, there are simulators and emulators too (you 
can use QEMU to test it for example), and it's not exactly a rush since 
it's basically been ready for 2 years and has hardly seen any code 
changes since v13 which was based on Linux 5.9.

Not having the code upstream is hindering further development so that 
RISC-V KVM can be feature complete when hardware does come out.  Missing 
features and optimizations could be added on top, but they are harder to 
review if they are integrated in a relatively large series instead of 
being done incrementally.  Not having the header files in Linus's tree 
makes it harder to merge RISC-V KVM support in userspace (userspace is 
shielded anyway by any future changes to the hypervisor specification, 
so there's no risk of breaking the ABI).

At some point one has to say enough is enough; for me, that is after one 
year with no changes to the spec and, especially, no deadline in sight 
for freezing it.  The last 5 versions of the patch set were just 
adapting to changes in the generic KVM code.  If the code is good, I 
don't see why the onus of doing those changes should be on Anup, rather 
than being shared amongst all KVM developers as is the case for all the 
other architectures.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
