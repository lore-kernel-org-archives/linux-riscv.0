Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51013C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113A960EBB
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 113A960EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W18f3m/hJyYkOdlCOFw47IapCgOeyygpdJQEGTMH3co=; b=h/g/akn2u9M+gP
	85qiImEV9mm4exgeAw2BWpv1h/Tpm2Me01B6FETr0dTYTWyYFpw0J+R+kdx5rTwj59zUBRk3dW6va
	DXTaennJYZcyGxglCPw+CQFhZNrJyoUFsVlbyU4wTg0Qfiq9bDl51L77BNTqc1kbMXfZs9WINY5Zb
	aRJHmoA9zzH7InkxtTD5ydCbjuZJ0dnIHeMyrQQq1TUCspYQwQ5P4WmasSaIbrdx/07FuZyl+FE09
	gooAjsyjaupue5K/aslR62dgtYm7qajDeT+wNDYMpps1Xk0cwxGGrry/z8rAvYD8dvkUFXx7j6f5p
	+LoC7yHH3r5fEqmR5Bjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0vy-00GgMK-FG; Mon, 25 Oct 2021 14:26:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0vg-00GgHy-AG
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JDFR/w0BO+fJnaqyJz0KqLIzoSXAKAPvBzPCJS8rh0=;
 b=hbCJMtC+feXdD4DZpsFhxR0KHosx1zwzyF8Tv1JUfLQGhFPT6Sz9jaYEhXZ8ctLiBr5K/+
 1Af4KNf2fipA4V/TwlqSvOhuL0s5hBfhvsM7MGI8li9fR49uEYSSeK/5IpxDydkWDJz9qy
 I/Q+pHO5qIr6muF9tbKPliOWf9AUoz0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-gVwX46hpOgm5Xjac-uXOPw-1; Mon, 25 Oct 2021 10:26:22 -0400
X-MC-Unique: gVwX46hpOgm5Xjac-uXOPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y3-20020a056402358300b003dd490c775cso831686edc.22
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0JDFR/w0BO+fJnaqyJz0KqLIzoSXAKAPvBzPCJS8rh0=;
 b=PPlcLZuQYhMUo/A3NlrnFWtBhuyy2tnHoSt5M7MzPGhNigSRGvK34b/4oxwmrYseQr
 oFFijvA+QT4+xZgCWdypNwB7sK8eByBuDy4VG1BKG/rWxsGjzIjtdrcrbMR8mrxbq1Sj
 LWTwsMPhPwQk6331H9yUX6qYA3Mc+ocXBT6RP7TdlkEBgFxy5xCq5rzYV0lJkkERN9iX
 P76er79ptzzm9nz3/0Mwc31Icz2K44k87ca+2Vx2ps7cGszJsQDA0t2GzPMjqm1hpylp
 JHoqtgb1yGbjhGiGHr7d/sV44ezFxTxai5vM+e+9pLbovzD2Q6svoVKu4WczQVa/YBKU
 fGyA==
X-Gm-Message-State: AOAM532KFkq4KKCqZFQW3vNFGNMMS8ux6OyNG35uBmtaYj6rf3b4EGCH
 bySKz2pdSOpZjNPDVRpP0dIPrUJVzkhtxZmMBn33RoVKLzCL6FTfpesRfDu3Puk5FW+EDS9XLMG
 xASz25FXfXXjRepc8Obq0nZ1DF2l3
X-Received: by 2002:a50:d78c:: with SMTP id w12mr26913802edi.147.1635171980780; 
 Mon, 25 Oct 2021 07:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKDlcJy9Ggfa6iOgv+1CVaZWvopovsowDbFDE9dApjZRuZhu/xUobrIcg2Oe5NEBC4id/OJQ==
X-Received: by 2002:a50:d78c:: with SMTP id w12mr26913764edi.147.1635171980582; 
 Mon, 25 Oct 2021 07:26:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hs28sm1430847ejc.111.2021.10.25.07.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:26:19 -0700 (PDT)
Message-ID: <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
Date: Mon, 25 Oct 2021 16:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
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
 <20211009021236.4122790-36-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-36-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_072624_488322_9EBCDA6C 
X-CRM114-Status: GOOD (  11.76  )
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
> +	 */
> +	if (vcpu->mode == IN_GUEST_MODE) {
>   		int cpu = READ_ONCE(vcpu->cpu);
>   
>   		/*
> @@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
>   		if (cpu != get_cpu())
>   			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
>   		put_cpu();
> -	} else
> +	} else {
> +		/*
> +		 * Wake the vCPU if it was blocking.  KVM will then detect the
> +		 * pending IRQ when checking if the vCPU has a wake event.
> +		 */
>   		kvm_vcpu_wake_up(vcpu);
> +	}
>   

Does this still need to check the "running" flag?  That should be a 
strict superset of vcpu->mode == IN_GUEST_MODE.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
