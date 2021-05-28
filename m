Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73821C4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 09:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BCAD61183
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 09:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BCAD61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt9D2Iu4B4CRBwEQs44psAxlZPLkRjFeuDtEilm6H/w=; b=VOeTdMJAw8KzughJGqIuqUTLWc
	eMD5v4+FsPFkERVptXrwkfIBA/CVoPJUTfwW4RUYEPDR3WG34e7gBOQpu+HchK5FcV7LBcuXMSudf
	tiLU6/oasG7UbipbDWTzAU9g8aw0QQKmkT26xZ4LqBrYXAXg+M7lh7C2PDfrhUCpFEV2wgxpuLHxJ
	734cBSNIxOfE06cXFVR6oaTb9YMVW5zVFp0Wc/2YPVQ4fvvQ9XitrnQZoc8lyrhYuvlj+7gaUbj8m
	s96qfg92R+81r/lgu+X2xrGja+B6eBbMemQYWlpCXh2gZCVrdra0+gUHZF8POpbdtMSqh6fMK4fst
	Jmq+9F0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYx2-00E0Hz-Rs; Fri, 28 May 2021 09:38:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYvU-00DzAe-So
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 09:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622194627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+V5LreYA42aThR7MRhiOyUx5r8sVwWzrJtcPyo1lww=;
 b=dXcViJCMPaCh9Bl3rBqZ3lwBsODFUz0fluC7+xpzjyJH2ggtC7P2BhpKe1Hhh1gFF0ZSSO
 DS/2L8PZmElO8KmpZ5St9lr6V787SM8hV2n2FSRd9mpIlZ35eGbtQ2wpHS7YdRlcXbRP+F
 RHM3V9Wvtns3DyiDfDTbvtfRizx7D7c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-5_DV1T-RNb2Qy-dldhMOtw-1; Fri, 28 May 2021 05:37:05 -0400
X-MC-Unique: 5_DV1T-RNb2Qy-dldhMOtw-1
Received: by mail-ed1-f71.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso1840929edu.18
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 02:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L+V5LreYA42aThR7MRhiOyUx5r8sVwWzrJtcPyo1lww=;
 b=J6FFUFfgdpPidgNjXiYJiIlQ8CeI5m4exvXAvn2bgAj4YjGpqctQUZOM2ZQoJIvUEh
 FWpIi5iaZr1/JnMNQOIlpyPRFmo87hU1/QUpD3gcxeTWRq/xcF4fzGSTPa2uVvAq+WYB
 lpGnbml70xfX5A2ZCop8UL0FCue1xfE8Z1Ez8ywwVvs20jipIfwYEnqpP0S+lwyYUfjK
 amLc8x0W2sMTxBNf3KiCxm/AsLdi8zTwIC96zQ3kaRTOd8HmwYbp2fZZERzDuacL+F48
 0OS2xvIZtlDGHO0j7oZNIm5Of0u2x+pHIkikd9njlzuMzXeOQyd9tVXztRDiIqwHCdhB
 vj6A==
X-Gm-Message-State: AOAM530x9r+ka1hYrE6eqpBIKyLwfE+yuT+mQLHDE0dVUvDocm8ePO5k
 zSMnt3Q8QZYHq0izTAnpojGoMGxpb5g7XkXmZcm6KaUQ2QBh4KyVaTqpPFnqk/XYJKK2w/aTDUc
 Sscd39EMYIT3yuIPssOYoLFo4HksP
X-Received: by 2002:aa7:c9cf:: with SMTP id i15mr8687666edt.118.1622194624347; 
 Fri, 28 May 2021 02:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOlDpMTdqryDbJp8od41IYRdiAthSBRFkECc5v3+cPBIRdZIJxEBdHtgJ/kEuOfJmb37jGYQ==
X-Received: by 2002:aa7:c9cf:: with SMTP id i15mr8687652edt.118.1622194624159; 
 Fri, 28 May 2021 02:37:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t9sm2491513edf.70.2021.05.28.02.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 02:37:03 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
 <YLCvdmwPrm/S/GKg@kroah.com>
 <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
 <YLC211VUeTrUdo3v@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: arch/riscv/staging
Message-ID: <efa8b40b-4c64-4323-7070-223329a52872@redhat.com>
Date: Fri, 28 May 2021 11:37:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLC211VUeTrUdo3v@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_023709_036450_27C2D834 
X-CRM114-Status: GOOD (  11.71  )
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

On 28/05/21 11:24, Greg Kroah-Hartman wrote:
> Ok, as it sounds like this isn't going anywhere until the spec group
> gets their work done, you all should just wait as there's no real need
> for any kernel code here either, given that there can't be any hardware
> made until the spec is finished anyway.

There's need for kernel code so that userspace tooling can be built upon 
it.  Not having the header files in Linus's tree makes it harder to 
merge RISC-V KVM support in userspace.  KVM shields userspace from any 
future changes to the hypervisor specification; the userspace API *is* 
based exclusively on ratified specifications and there's no risk of 
breaking the ABI.

I'd like RISC-V KVM to be feature complete when hardware does come out, 
and not having the code upstream makes it harder to both write and 
review new features and optimizations (e.g. finish support for hugetlb 
and transparent huge pages, possibly parallel page faults).  For now you 
can test the code on both simulators and emulators.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
