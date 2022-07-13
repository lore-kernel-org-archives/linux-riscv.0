Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2FBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbniSnBC9Ye/lcgKJsWXhkwv+CGjOMH0aOvwNCAYOO4=; b=j/R+SqUhLYWIWR
	YzYK1zwdXnq4PeR8cEEnQFj5yITxoJ++/DK2ffz+tGBNKzPO7z7wYQDHge4nlMXXithuGlLdLCIOc
	1nhPpmwo/wqDCMzqYTui5eD7YzaxcReYiw6sYxW+MvvTlFBg3xp/ftrh3mvdoq4Sgxlr41TfRamva
	2yly2wWKcung+a8TnHpIb9o3f6FsV8/fAcOr6P5ZsOfQZqoj3sL2vLS3fJKPdr2UD579FQ7LneyyX
	YWM/48EinUslXqNJ7dxxYIb1ZFNL5+DsMdlTKUDpz2/qRCK242yfeyDepsu3A6sAQd6FFC+4CXOm0
	4d1Y5BP6Mkbhh+Z5A65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVPx-000PI4-K5; Wed, 13 Jul 2022 06:00:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVPv-000PFe-AO
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 06:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657692007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAB+fzgqpii87zwJYPvAgT3WrxuSqJ6Z616wMWBAEuA=;
	b=fagecv5N1OpNuD8hm0skkcJeeFDwUYUbf2+bhb5BUPzYl2AW63hlcSIptdpDkULxy6yZ7u
	kfByCRTtYO4uxQRjo9m2TdpS/KPzeYoSmvp7X5dXsSoh6XLtnJyUmLDO4ZLkGKlpLA6YO3
	XCI4hP2rnal5evbYtkVnm9P0tALg7bU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-HQHBsTWxNcGw4TlSFlWA4g-1; Wed, 13 Jul 2022 02:00:06 -0400
X-MC-Unique: HQHBsTWxNcGw4TlSFlWA4g-1
Received: by mail-ej1-f69.google.com with SMTP id gb37-20020a170907962500b0072b820af09dso1328553ejc.20
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 23:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=fAB+fzgqpii87zwJYPvAgT3WrxuSqJ6Z616wMWBAEuA=;
        b=fh6nrhRgTaHpsCKc6AfBUNmyLFpkxtJdtekyJRakgMiRQzhhxAIVbh+CNGgBFdYluo
         Bkf6Z4KEmHwmnFooW9lrHR5eKQp1LhmPl5CtlQGkhT1AO0lnDbwVoIUeBaiodmRP1h2m
         0WWLzW2J96FKSTiN5+vIroWXT0tS2cq4C/VjVTcyOi/Gzo6BRtG5rlV73517+weO06Sg
         VM2Cu3OS+ROs9LV7likzQgurFI2hQGTB1C2A8+WHGjFQdrpPsJJ0uwfpwgoslLPSh0OW
         SNmtv2Z45tUGqC/amIE1tG9lTscdF7lFK4ewY3MVnr/BO66xL6u9HJ8iw/5t0eJDIZWW
         Rl6A==
X-Gm-Message-State: AJIora9xg6aW405zaIwExWgcyhQcz7bvt6barzDqv0dVNuKQ0wyRrK4p
	HWMPuj9+vWgHpfDloKsVuMWzJGHtsRZmulQZ1dEZIuL7WgRdkKv10qXFrDWl47b1TlZgu6U5nx4
	sw659cGUoPoW5wKr+WCicvUFbXD9X
X-Received: by 2002:a17:907:7f8e:b0:726:41df:cbc6 with SMTP id qk14-20020a1709077f8e00b0072641dfcbc6mr1838120ejc.230.1657692005047;
        Tue, 12 Jul 2022 23:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tRIZh3VheoWSCPA14LoWhV4jqxvo/RDpgqW20v0Gpf4kuo3kp2wtRzRQC6r1uN2p0xfLziOw==
X-Received: by 2002:a17:907:7f8e:b0:726:41df:cbc6 with SMTP id qk14-20020a1709077f8e00b0072641dfcbc6mr1838098ejc.230.1657692004835;
        Tue, 12 Jul 2022 23:00:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id bd27-20020a056402207b00b0043a21e3b4a5sm7341454edb.40.2022.07.12.23.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 23:00:03 -0700 (PDT)
Message-ID: <01ec025d-fbde-5e58-2221-a368d4e1bb3a@redhat.com>
Date: Wed, 13 Jul 2022 08:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.19, take #2
In-Reply-To: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_230011_482631_E9D03384 
X-CRM114-Status: UNSURE (   9.17  )
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

On 7/13/22 07:47, Anup Patel wrote:
> Hi Paolo,
> 
> We have two more fixes for 5.19 which were discovered recently:
> 1) Fix missing PAGE_PFN_MASK
> 2) Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

Pulled, thanks.

For the latter, my suggestion is to remove KVM_REQ_SLEEP completely and 
key the waiting on kvm_arch_vcpu_runnable using kvm_vcpu_halt or 
kvm_vcpu_block.

Also, I only had a quick look but it seems like vcpu->arch.pause is 
never written?

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
