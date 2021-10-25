Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B67C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8EF6054F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C8EF6054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRZkhC7w808areTflCNU43jemjdJTZ2Z0qI/b0/XQ50=; b=ITw0Wkks3RPfFZ
	CCkXreHMhl5g8IKSLI5zgwaYDG9Dp/FZ8ZMeieNcFDqUKz65NxTAsmIfBfUUh0qNW3Jnb3mA6OBcM
	ggrvU995ezWKpUxTcgarvlAEiabi/EKheoQ8di2kwN/VG0Akc/EmpQ49zvJK9E4HBZQAu+TKuTB78
	8xTwFeHJci9vWJHtUlT/UngI9hgKBWS8Iyza3h3NCpsjmb+Sm2Xxn2ISsXdjGzl4iwVn6oZb+Pdf4
	nQBMfCCoIo8TnruNIAxmopIxlfOnipYPyXfbeH2Z0QkyFhAU7toXuOjYAxGTIjhdu8f4/6xLK1nom
	HsbPEdre6/AsEeg8OfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezva-00GWIl-1d; Mon, 25 Oct 2021 13:22:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezvW-00GWG8-Gf
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 13:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635168129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48+IikSlKyqTNmxyr4q4VEcqSYZJGRNhdXCK/IFcjJk=;
 b=KE/riBNfAXvmdioUpEupdNXCo16fRq3CU6y433SjTnpscTb3trlrymitszXrkgp+SEiGpy
 IGGDdOs7tgVpF7D1koLvgvjkFQKxcb+ae8BAvfZAtAiPQnnSY7t0w4DQ9M14UID9quLJ6O
 qMkZ0+yPB8SV6/WH/73VfrMRwVbUjyY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-G6Pu6pf5NVGLkg2k2M5Xcw-1; Mon, 25 Oct 2021 09:22:08 -0400
X-MC-Unique: G6Pu6pf5NVGLkg2k2M5Xcw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s18-20020a056402521200b003dd5902f4f3so2860748edd.23
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 06:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=48+IikSlKyqTNmxyr4q4VEcqSYZJGRNhdXCK/IFcjJk=;
 b=d7njk07vgJP7U/CVGIvhpSg89aB8GvEa/wExnDF4DrWoHeDE3YiJ3eo9WZQaH3c8Lz
 X6fOvCZOCpyIg9fA5iTpIONCB8v9OgE/4kXBGMKxqfrXJ0GR0Vbtm/4Akamg7xuXD83A
 lt16zoLG0nODQM4ioyF5jdrGSYSgsxsb+mRQjsgOgFX/4BeC63xmYt2Oxg9IcwRj4SgX
 VxjCx4kob7KkZY7PVb4NeFmVq+3bUGySBusvPBErtrCBV5w6kpGzqvfvTDYxTneDQx5U
 ykkZdKZk5I/DJmqsOtTOurrmv3d3cpdUTFDzfM+L8Fs753d06uUk3xCi1Xn37nG5Qp1H
 FC5Q==
X-Gm-Message-State: AOAM530Jf+bH34qZ8fgdR918wekw9ig88LggZsm8afJzhAN/AhZ3rolh
 DWkUNPrZNEQybSZ1GYbJcQw2Tx2NAt50LeVRHapz3cvl0QL/DLqJw3E60QU7JboBUHKT8ispYrl
 jC5K4HWNS7KVo0dEYWJitzOOVFkv9
X-Received: by 2002:a50:d783:: with SMTP id w3mr20253073edi.380.1635168127008; 
 Mon, 25 Oct 2021 06:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfRKsXz9JGMpnMaISmnOtZN3rndX1G8rsIOCD7EyDtzp44dz76SyjuCafVUoIKeNPaL6dxIA==
X-Received: by 2002:a50:d783:: with SMTP id w3mr20253015edi.380.1635168126752; 
 Mon, 25 Oct 2021 06:22:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j15sm9152968edl.34.2021.10.25.06.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:22:06 -0700 (PDT)
Message-ID: <e360d085-8fba-e8de-b65e-fc7a4e13ad7b@redhat.com>
Date: Mon, 25 Oct 2021 15:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 02/43] KVM: SVM: Ensure target pCPU is read once when
 signalling AVIC doorbell
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
 <20211009021236.4122790-3-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-3-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_062210_670386_236E07EC 
X-CRM114-Status: UNSURE (   7.16  )
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

On 09/10/21 04:11, Sean Christopherson wrote:
> +		 * point, which could result in signalling the wrong/previous
> +		 * pCPU.  But if that happens the vCPU is guaranteed to do a
> +		 * VMRUN (after being migrated) and thus will process pending
> +		 * interrupts, i.e. a doorbell is not needed (and the spurious)

... one is harmless, I suppose.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
