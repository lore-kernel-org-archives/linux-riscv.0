Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DCEC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:27:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3AC3610E9
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3AC3610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aaaTt6xejBR1ZrOC1y0cqfTpn0Ene/noq7injxwKNlA=; b=FPKfk7zv2N3kQIS0UCaN1VTae
	/eWdD4TrlQeoeB998Td3VRDef8B592Sml6/KlxdTxfdhmGnfjW4OX9ItiXamF+k75ssc9tdlCNxdS
	dg8xviCnMiH/g2cE3MwUF8PwPfdn89xa3NmmfMpsZraeH0OJfW+/A1rJi7F9GIb11w5zqEfZXtMRk
	YUouaBuI7ftz/gF+XfarcxDAv0ANavK0PvjUEQAB1WY2LO6CvLo4/kbKmUJ/tfQpb2T4d5BV3+TZp
	rrDlNCHRgBoZVgI3Jq+eVbek05HTyPmKyBgjtWZ0Q+WDJ9S4PWIa6zZBnG6AxYgPU/Mpfq6nMi3Zh
	WCtESzimw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljO67-004O8i-Qw; Wed, 19 May 2021 15:27:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljO64-004O7y-So
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 15:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=BPRLpBAjZNhjflwwDzXS2G9ItWCI1OxLrIqekCHLw0A=; b=1rL63M+bwvXR2F7QNLat3m+WfF
 WaDal0JGp125IjE60TcgE1v3xup9L2Z5gXI8jhC6jMgBVwq2EkVQe1JOCXbFCEQF2WtmT4jh7pnwX
 XfRVgVm50RTJzfwQtOQRhyvN6kexRQuaXmGK1pNUlUB9ema40ek+tK0h0R1TEdKRJcQJg9d4ElS4q
 9yTHYwbXPo2UOVbQlIqwhiXModjQtQo9gmEbX/xxbY2eYa+GLCXKnuqYwguFBgeXwF+Wa+H3Es0fv
 A1OnZ/pwLKWZlGbORfy+ehbxGqaWbweb2wVbCauqz/g9BR/nTUVsLxC41y43ZG/JmYg4gj/G5rUx6
 RIZz9nqQ==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljO62-00FaVl-FF
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 15:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621438013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPRLpBAjZNhjflwwDzXS2G9ItWCI1OxLrIqekCHLw0A=;
 b=ItKxpwQbrhEnr2L3NQQmijYhlpGkXHxu3k+80il0FlIA5TF9V/HyP88TYIIqGGST0wJyJK
 bYATKzaQ8l7J5IU3Haw2xz5XyYriMR1rD0f8I82qc8f4eMveNphtMc/0tT6xbIVQxIwKeP
 mcPGy/fshtH5b/ZAIL0puC7VCUluIko=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-lwVNde9VMsuItJrF_Qt2_Q-1; Wed, 19 May 2021 11:26:45 -0400
X-MC-Unique: lwVNde9VMsuItJrF_Qt2_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 22-20020adf82960000b02901115ae2f734so7301961wrc.5
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 08:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BPRLpBAjZNhjflwwDzXS2G9ItWCI1OxLrIqekCHLw0A=;
 b=tcZHeksfmwFRW6dgBSi37SJxBQ2v+g2A2oKm2QAGnFKuon65H+keNzvT9ehO13Xw5e
 HQ0vujgrjGPzGHsrCLcRGdtHIWY0/uHJVE385RffVMFg3S/R6dW8ZEG1/e97kTGCHibg
 wcir1QPn79CPasl6tcSxaS21cMk2u8dDSSAu6AEjWrPODFHTpp8/kwuMPpnpZdkCIOvy
 zaier2+rdfqo3svlic75t0p1x+zUTxm7j0rViQVvwVDhA19yva6MfH7Nc3cJawG4YBqv
 i0xOwIcZjrK4hgZ+Mvyn4DFkUDApxAdjn2EgAOdcQe8HVcLWTfOtPZOhmqNvj0e602uB
 xfvw==
X-Gm-Message-State: AOAM533jzuRGJtBZkMtGe8ZMfomHiV/NyMZgiPRX+L2gL6KzdY2Qmd3O
 9YISvajxQyX1ohl6SStLdOHWJRmxgFylZTgyEeTl99P6JuinSObrMxChrJMzVz8WAChE8vZ7zRp
 MtzIgC48mKoyeJ4BeBo9UrMg7poAU
X-Received: by 2002:a5d:570c:: with SMTP id a12mr15048764wrv.354.1621438003868; 
 Wed, 19 May 2021 08:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKFgM0dMznbTO2YJBPi9PLyM0fdlyyhnY2E+SOMK4tY3xOEu2tCm4NOpliSoEFl1o4vdaeSw==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr15048755wrv.354.1621438003711; 
 Wed, 19 May 2021 08:26:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y137sm350209wmc.11.2021.05.19.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 08:26:43 -0700 (PDT)
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Graf <graf@amazon.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
 <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
 <YKUZbb6OK+UYAq+t@kroah.com> <20210519150814.GY1955@kadam>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1ce20fe0-0fea-406a-f7bf-1dde686b411a@redhat.com>
Date: Wed, 19 May 2021 17:26:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519150814.GY1955@kadam>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_082654_594327_761FF56A 
X-CRM114-Status: GOOD (  15.44  )
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

On 19/05/21 17:08, Dan Carpenter wrote:
> It's sort of frustrating that none of this information was in the commit
> message.
> 
> "This code is not ready to be merged into the arch/risc/ directory
> because the RISC-V Foundation has not certified the hardware spec yet.
> However, the following chips have implemented it ABC12345, ABC6789 and
> they've already shipping to thousands of customers since blah blah blah
> so we should support it."
> 
> I honestly thought it was an issue with the code or the userspace API.

Yes, I was expecting this to be in the staging TODO file - I should have 
been more explicit with Anup.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
