Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCACC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 17:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D5561053
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 17:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18D5561053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoFVDAMOeDl+h7Zb8pR2pUPqcG5uNgNWw3VxMf3U7RA=; b=nXegMIcm3qt/Do
	U4zNCOc/saV5A31kLzHp0ZCbGoaVuI11DCQvRTJ8FSVUN5fe5FvxsaERQ8es+EIa+k/3PVZzWVMMX
	qCRtDYWqHegR8Xjc2wrhimMUgm1/QJzvanRFmbScvy0RaImBP1GDMrmyzvfdtIuyqq3913cYot90h
	/Up1ejG5VqoT3Ye1cEtPT+vbyyAUS0FPtykTqXXS0rfVxR3PFfT/MhH89GdW0nndaAn9RThPZcoVX
	0hLMT4Zs8PYy99wWjHY1qa2B77pfNd0Tt2cFlEERI0Cf64/p2RaMXtRi1cCblTBTpSVGDJpceywSV
	P1G7b+AdYB/wWEtDFmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhxSE-002TxD-H2; Tue, 02 Nov 2021 17:20:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhxSB-002Tvf-Q2
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 17:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635873605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HOAen4JdZY2zeHb5PkTjQnBJDBjxaF4FOqrymR00jA=;
 b=HpCJs92pnV8RYZWIeGGCICZEBsXZ2ri2RYQpbE7lnf22NCkUvMUqsrnWE6plwOH2A8AINL
 OfcGOi+p0p9iVbnCOK4hOgWxTj/Yo919wsgfhH5uJKD/ciXJVmLte1nyuAeGe5g7XAt6W/
 3b1SpP3vCH14o2MQ0hnNDoq+rXZr45o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-UF4aP43HPhO2bLpjTmFSNg-1; Tue, 02 Nov 2021 13:20:04 -0400
X-MC-Unique: UF4aP43HPhO2bLpjTmFSNg-1
Received: by mail-wm1-f70.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso1484349wmb.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 10:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9HOAen4JdZY2zeHb5PkTjQnBJDBjxaF4FOqrymR00jA=;
 b=Ck5K3uP//+oeU8Pbx+CQ9RMeFCyg6ZXQdRgxTMFZXztDPSxrdcX+/GLirmV10pLXte
 VrKd1kHnXBq4FgML1q8HNxU+yMTOFVymhgxC6TCqr2MA+ZRrpPmclIDH2ds0NjTXWCW8
 0/pE4N5GOzhLxVW9446hYtIGO9rJPZfjTXTmI3XKY/SAJ4cTn+Noqo/RlAFuQydoovGP
 6fY6yHl9ZdR89AiIGfC8q3f22e9CkHE8uDOYa+fv9eUvxjAQwU8OUOll31+Vj00xnZt3
 jlLmraJ/Vb/LimR3M+sfJHhCwog9yhtDQKc3CahDcBV7Bad/lkDId4CysUCHr+XKnWXS
 IRJQ==
X-Gm-Message-State: AOAM531SmL3MvSbcKlSgr0SDOXBNqsz2WcuE2xVDiFDSnmkARTz29ira
 6d73hxtyNY+GnBd/myRYAXPiY34Za8N2MtMIPgQaeB4YtQvf0jGLzzfif4IRxOVAyc6EpDIvE+m
 ThHesiNfIDWJFuq17Clh8C1B59xUs
X-Received: by 2002:adf:ba87:: with SMTP id p7mr48437373wrg.282.1635873603365; 
 Tue, 02 Nov 2021 10:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySB5hqLUKqg+OTyL/5+lfoYsx3ZpFIfLbt02S5NOgPSfmcOQJRhH/ISPa18p63Lbu8lLMA7Q==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr48437340wrg.282.1635873603121; 
 Tue, 02 Nov 2021 10:20:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w1sm3062221wmc.19.2021.11.02.10.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:20:01 -0700 (PDT)
Message-ID: <a425b478-2a8b-83bc-1f65-3a27ce35811b@redhat.com>
Date: Tue, 2 Nov 2021 18:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [GIT PULL] KVM/riscv for 5.16 take #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, KVM General <kvm@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy0TUZAgb5Wyp4Lnv30A1sJ009ATr9VTq49ow_C9-YVeBg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy0TUZAgb5Wyp4Lnv30A1sJ009ATr9VTq49ow_C9-YVeBg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_102007_950985_626AE504 
X-CRM114-Status: UNSURE (   5.32  )
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

On 01/11/21 13:34, Anup Patel wrote:
>    git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-2

git:// doesn't work anymore for github, please change your configuration 
to https://, but---patches pulled, thanks!

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
