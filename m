Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CDEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5ldt39NNPlp+vtDsam4qzdSbytAPrx0HyH4wu3DDDY=; b=pgFaJGoVmja9AO
	T0SaUciooE5EWA2DNx6wQjj4G6CN7UJWYA5zHtTzKHw/7VEzdVMuYIgnAf22qQink17z1ExhneJtk
	n1pQf+H1MfyHnH5U7scDptoY3Uh8U4xSo78hT6uzhVeSu5h9R7JRP4rmu0en0thFrqYWBE60ZFkzO
	3aQ5y3TfCDWXIwCi4Mn+2O1xMFvo0OJ/LD0m4JAtTNrIAwU6CnBNufBpbdkTh8og2p7C4lxk4jg4w
	WWfr5PuQwAOOu9d8T6gX/0omQ5CM3f6VVP8GKihz0spQgVVHs9dTUFSWjMH6FvCBPfqvDeGcuUGEI
	x6HCeU760t0uYQlOSqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZDL-00E93p-6i; Thu, 21 Apr 2022 15:59:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZDH-00E911-5f
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 15:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650556760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbKI/RdoVw2lSsvxFHaHaKTcTYkUQmqIRbVC6EXdVms=;
 b=gtqqwq1T9A+76a1QW7VCZjEWz9OzWW6VlXj/S/fwJpJwcbL1BQH7WpQfVjKZnn4vBcXELo
 MfVgDPGR8JCVlvoTHs7nFOsoz5HmD3aiXPbYDfE+3OPY2PWEcEHHGuY/4gZ1AJ2ceJJtNX
 6f0F1F8VE29K59jiRR1Ckvzo8N638WI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-muEFwyGVP-2MT7cvz1h5kQ-1; Thu, 21 Apr 2022 11:59:19 -0400
X-MC-Unique: muEFwyGVP-2MT7cvz1h5kQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso1285414wrp.21
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 08:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WbKI/RdoVw2lSsvxFHaHaKTcTYkUQmqIRbVC6EXdVms=;
 b=K5srMTZ3I4xf85jzTn5HeXyqPS1eq0FamMOYlVZpPc43d4Y3YQLFWY5mly/YQIw0i/
 NK4bOtob6fCaEPvusnvg6XGkqCzofsX3aJaBLqNpgX4YLtxElyqdvCG3MMj9o8kq3FTd
 cMnCN6092CRtJ7dTBmHC43GwHnahJjm6GLEZbcskxE9cdte+Qe3kHdx7yK2NC13Cw4m8
 4UbtMXr9UvF3LKsMUOo/1R7unpmxeFZXRX5UhiqIrGASj0T261I3JmsXAvvBCM3r02X9
 lYsBGbRSFez2bKCMZyLWw4GE8tRDijJ0xA2sEh9gUyNyzaj5c7XBVImdKPzKj+tnRoou
 yWrQ==
X-Gm-Message-State: AOAM532NzJ/HgWzuiLTzkptO+rNWPfxUV40g8Q0ms7aOYsWzffcHARx9
 p8d6n3Y6R4J+EpuQHJM85qnANSZG9WaODEMlHC5RzlrmcaQ5BtH258WiIUVvZfCgzpcvinpK+cy
 4zDCpVYuxSY3A310mB1lEtH/wVjtk
X-Received: by 2002:a05:600c:5114:b0:38e:bd9c:9cb0 with SMTP id
 o20-20020a05600c511400b0038ebd9c9cb0mr9033220wms.153.1650556758135; 
 Thu, 21 Apr 2022 08:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJYpmuXXnj3iai3nELwusouPJpP3ycfIrIkjSpW41bWM35mI3RLKAy/kKPMd6YY2jG5N59ZA==
X-Received: by 2002:a05:600c:5114:b0:38e:bd9c:9cb0 with SMTP id
 o20-20020a05600c511400b0038ebd9c9cb0mr9033199wms.153.1650556757917; 
 Thu, 21 Apr 2022 08:59:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bi7-20020a05600c3d8700b0038eb78569aasm2252457wmb.20.2022.04.21.08.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:59:17 -0700 (PDT)
Message-ID: <b8788b72-12bf-136b-00d4-8e5decc9eb16@redhat.com>
Date: Thu, 21 Apr 2022 17:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.18, take #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>
References: <CAAhSdy3io3CdxTDGRVCijO-R2V=GBOukOEs+BH6wYnkT2_iPMw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy3io3CdxTDGRVCijO-R2V=GBOukOEs+BH6wYnkT2_iPMw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_085923_291687_99F32CE6 
X-CRM114-Status: UNSURE (   4.51  )
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

On 4/21/22 17:32, Anup Patel wrote:
>    https://github.com/kvm-riscv/linux.git  tags/kvm-riscv-fixes-5.18-2

Pulled, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
