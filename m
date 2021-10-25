Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392C9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF18360EC0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF18360EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAbdZ4+VBwRrVRZ2pOloyEt0Chb7TqgDOiatVYZ+uNo=; b=UADwiKDy5aclsR
	VtH+NI60BEHHse1V3UbhVs6Tuv/Rl+VZxV0OtgfCGXdFaHV22SHUKnphvaqk4kTtUOh8XqihZHYzi
	3fg/xsWy1Mf2qd1j3KJmrL8VTECuh/BEloLVnJsEvRhUujPKXE6m59s2kRLZ+mI9WBFX12p6JmZ8a
	rlzUfJw7+axG0Kp1F2pjlRvlsQ3MwZGTsb7CREbcBnT4D+2onCV/ka9F/SpFUV7lKGFjRPFJZRVvF
	SA+h6K59w0W+jNw68RX882va3s8QDBaRgC/EI3kjX9gpJkObniXjyHETSGVpibczl8XNni12bzB1g
	Iv4mC0xEuwzvz0NIge1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0ri-00GffI-31; Mon, 25 Oct 2021 14:22:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0rf-00GfeF-Em
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpaqUtGVB++dG0RuCTiBEYznGy9v/KDIt/5yYlz7/xg=;
 b=AWDyRtmXaPlPbYzj8fAN5bBexxIM6tuTRoW6wwZGk+WGblmxKtG5MyTVuWylZenb9CA0CL
 i3pU9wOQo2Tirj2iPAchWCF5sByL4bwwPAHxREgMydhUAgJL4u0zMm8U0923aU6Y6Dtp1H
 x+tl8/aF8EeAZhDeHJmG5ZMxHB0IO/c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-2twSdKJiOXO3M03PCcn82g-1; Mon, 25 Oct 2021 10:22:13 -0400
X-MC-Unique: 2twSdKJiOXO3M03PCcn82g-1
Received: by mail-wr1-f71.google.com with SMTP id
 n14-20020a5d420e000000b00167c303d862so3284872wrq.9
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HpaqUtGVB++dG0RuCTiBEYznGy9v/KDIt/5yYlz7/xg=;
 b=DcGnMWwH14uqSRpXbwBLqlBqnEgDb55ry4iu2T6P1DgwnJ3LGgvsqdG51MRDaezGs4
 msPcW+hF9jX0gCVH4de6vr5HE58FddNcP3SF4rXNIreK1FFjSmJSUoXMDBlJaQgkOklv
 9/aiST05AQp+8PDgfg4Vl1suMH8JWAs8sSWaGRJxpX7Yxn+n9Ty+sOt8xZk2uBZTvnWj
 8SA6YvxVnDGMmwxXnnO4R2qUYR8kFR/Apn5Qhp5RTa+QvzHhYkc4KlSN9ZidmNOL4Coz
 7PAYxuV3nV5qlfO+tHAb4j3gA6xClv/M5TfMdui+7qYHLDjXHJ7+B9DxX9YOlTA9ZWQA
 DVrA==
X-Gm-Message-State: AOAM532a3TsFN94z9zTjVZtC7zJ+hvfWKI3Y4FQFmlItiDkR27X+loaB
 TFVgCXVB3mNrrbLXB4Fkv4/o1OEiwNJE0RZfqLVygwp32EDuNql/CuVPkUx9ZHjsOZb38dntRNd
 qqCzWyoJe5zCWbcjXws78XhXBQ+ib
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr23887290wro.72.1635171731939; 
 Mon, 25 Oct 2021 07:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzadqpNa9sRFm6T5pRsCXL5a0VdPZvR+Z2HC9JjGJpxIRL6ejj2cNhckiUN6d6SszWigGu00w==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr23887262wro.72.1635171731758; 
 Mon, 25 Oct 2021 07:22:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v6sm2568505wrx.17.2021.10.25.07.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:22:10 -0700 (PDT)
Message-ID: <acea3c6d-49f4-ab5e-d9fe-6c6a8a665a46@redhat.com>
Date: Mon, 25 Oct 2021 16:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 37/43] KVM: SVM: Unconditionally mark AVIC as running
 on vCPU load (with APICv)
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-38-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-38-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_072215_592980_6FA61892 
X-CRM114-Status: UNSURE (   7.39  )
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

On 09/10/21 04:12, Sean Christopherson wrote:
> +	/* TODO: Document why the unblocking path checks for updates. */

Is that a riddle or what? :)

Paolo

> +	if (kvm_vcpu_is_blocking(vcpu) &&
> +	    kvm_check_request(KVM_REQ_APICV_UPDATE, vcpu)) {
> +		kvm_vcpu_update_apicv(vcpu);
> +
> +		if (!kvm_vcpu_apicv_active(vcpu))
> +			return;
> +	}
> +


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
