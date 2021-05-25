Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A8DC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 08:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC871611C9
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC871611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+dnBCrkIFGGIrvve4hDh+swPIeF7VwTRqRs3yBVt88=; b=Y2DZeYyyHWC/1Ekxhafla9FVG4
	Y0jFq7hiwR3QOMXC4MOYZzzyoNxxHpY2Zc7QLLa6X2rIUbd/g+KJBRe3sGxyfG5mkt04TxU5uBmJX
	ON8w0R2jq2ZokUNG3jq3kYztIGK53AiiMCqDNvbSwv/CaFE2z1CVYi8NHB9yJ6NuU66RVwkmAywHP
	Xid+DY5P66Wute3Xc37xtauwu6Vc1wVnmycYwF6SY2hke9IPhETsXccErMMAjhc5Jb5H4qpwdqJti
	3EXV0SDki34bgiIj/uR318EIU15WsY84fNvSmihekc1mVpnKT31AEZLGb7uI5ZxeuMacsdGJKvh3W
	jpzHmuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSMF-0044FR-TE; Tue, 25 May 2021 08:24:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSMD-0044E7-Ht
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 08:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621931048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMNrS2AH+pWQGLicYKYrV08FbwOU09YffgbHD3gux2Q=;
 b=P5A9KrRtsLXVNPfo0wac7J6zkBsiE3zNljU6u/nSwBLWx10PyV8FJQt2aQ43h2l/4UhwDD
 8Z9AfNhpf0kWa+K0kHPPlY3Jbhdnab5yaHxyEpdsaANCRS8faNOSZ6YBJg96j+ryz2GkGd
 LdW8So2jMFAxzQ8ZsD4jSh9NVFVHg4Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-UoC-RqGoPvmr5yv06e6q_Q-1; Tue, 25 May 2021 04:24:06 -0400
X-MC-Unique: UoC-RqGoPvmr5yv06e6q_Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so16171075edv.3
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 01:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nMNrS2AH+pWQGLicYKYrV08FbwOU09YffgbHD3gux2Q=;
 b=b7yAL76lgH7dzzTemALlKbLaLKEWxe+hM3uAzmKZaoG2DipDyuWI5sxO4uLfvDRYF4
 9fSUQxyL+MWnx70nJh34V976vrLYEUtU/iOKDgshHxCIa1a3zFaGTHDJaUh5FXh5zWxx
 pRDm5p2HwrjcAMibHAUD1SweSqcgdKctUTg49imBOTET5zEX9jaFZ4/VrBA8BzFaA+nf
 qXExtee0jYdzZyr9HT6SQqBzZbXyIxDirheqWSfqOp7mlnZqL7avtpjATtYOkv3ZGWYq
 JkZjt5wBz7ZXPEEl9MoRqPRWTNelYrWV/cKvdEKvTSnOE/QHfEjEqC03YGcKKz9V0Ic3
 OA9g==
X-Gm-Message-State: AOAM533PN5+ANNdK5A7TYiWsbIJewYj8GUTMaqrnALgIpl9E4s5xtlx+
 9I/YIbt2MWOEcSrHA2P7WkA4dgp5/KiiELiWdP38FPsx/htVWSkKErAeLlYKWPBzjwgKu5VQdiv
 t/WupYzymu3LlaKe7jVGfYIwqA2t7
X-Received: by 2002:a17:906:2749:: with SMTP id
 a9mr7301257ejd.498.1621931045768; 
 Tue, 25 May 2021 01:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3ejiTVjnk0KxP0784vBVyBVdsw1rtPY3FP7JEZB/fGwja1e9e9HqFVf3ExrM8SXokAJlR3w==
X-Received: by 2002:a17:906:2749:: with SMTP id
 a9mr7301238ejd.498.1621931045543; 
 Tue, 25 May 2021 01:24:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gl20sm8752886ejb.5.2021.05.25.01.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 01:24:05 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "guoren@kernel.org" <guoren@kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "corbet@lwn.net" <corbet@lwn.net>, "graf@amazon.com" <graf@amazon.com>,
 Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKypJ5SJg2sDtn7/@kroah.com>
 <DM6PR04MB7081843419AFCECABA75AD74E7259@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKyxMy+djlscUhr1@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <fb03a89a-873d-ab85-8b05-f5f283f54489@redhat.com>
Date: Tue, 25 May 2021 10:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKyxMy+djlscUhr1@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_012409_695614_F763ADA8 
X-CRM114-Status: GOOD (  15.57  )
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

On 25/05/21 10:11, Greg KH wrote:
>> 1) facilitate the development work overall, both for Paolo and Anup on the KVM
>> part, but also others to check that their changes do not break KVM support.
> 
> Who are the "others" here?  You can't force your code into the tree just
> to keep it up to date with internal apis that others are changing, if
> you have no real users for it yet.  That's asking others to do your work
> for you:(

I don't know about changes that would break KVM support.  However, 
"other KVM developers" would be able to check that their changes do not 
break the RISC-V implementation, and I would certainly either enforce 
that or do the work myself.

Also, excluding simulators and emulators from the set of "real users" 
ignores the needs of userspace developers, as well as other uses such as 
education/academia.  Linux for x86 (both KVM and bare metal) supports 
features that are only available in emulators and simulators which are 
not even free software.  I am pretty sure that there would be more users 
of KVM/RISC-V than with KVM/MIPS, despite the latter having support in 
real hardware.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
