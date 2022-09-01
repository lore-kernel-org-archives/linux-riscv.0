Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59415ECAAD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEAY9Soa0aukW/GU0EdpHGckxRXtX9uM4ZGHUDQCKYw=; b=u2f1Ezrcsbi5Z7
	RrWUFTVfaw7tvaH80xKAE47uKpEEm49GShrWF7PtJdFmt2S/D6goAs7aZVWgUexvoBitTTX+muRno
	DHM3MFPlIj4czqWdCky5SF1jI1Zy9W55gCeV4CYO6H2rf+3+vZrPPo0AYBhxD1enClNesfGuMnkUY
	f04QQTYl5h9YtgrT6DRQ8o5+Se3yQHf4Odgm0zu4KcID6IHITyV8i+dI6UkHkANik7Vv+iPK0GvJ/
	9Azuk0EkMltu0M34kGOmDN6gUOg+AO7vYYz5aM5jca8DKE4w0dmXCAmfAVD0gscLhWML4CCOZVA9g
	Gc5VgD/xRYsWd9sEWGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsx8-00FVxh-VD; Thu, 01 Sep 2022 22:46:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsx6-00FVvF-DD
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 22:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662072380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMTDS8DnyN2eeNSyxyOGmR/0rHhtMQj+1Wvt/dXWAYc=;
	b=NC0iAmnXnP52Fs7fIucsjczbW4TIhrnFOz9HbWLyGGXEdt7Rkpw0XJ++Y7NTmphNGL/BSe
	3tRLRnwSRtG29Iuft6IarF3qKrztvJ1KY1OKbOCRXXULr5wbPuEJMzQToWf4AJVbhT8omN
	pGxD75kvBRi3QZUP0YdhWlU14+4UXUI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-2VbNV0WoOri9QMGlssxW3Q-1; Thu, 01 Sep 2022 18:46:19 -0400
X-MC-Unique: 2VbNV0WoOri9QMGlssxW3Q-1
Received: by mail-ej1-f70.google.com with SMTP id gn30-20020a1709070d1e00b0074144af99d1so73452ejc.17
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 15:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EMTDS8DnyN2eeNSyxyOGmR/0rHhtMQj+1Wvt/dXWAYc=;
        b=yFDMVVBzELeTXXyguuMmmcuCJXH5aGUDuWLgrySauRi/pshTXoBf4GK0DQpx4dBuKh
         vQRIUfHtmkwKP/T0mn+mvabe4U5t/PCHVDhkuUocDeeRokcuDfpKgIOsqdLAeDRdrqnM
         ku9mKwZ4PC5Np2Zq/X9VdUTD3jhXzcYPw7xVxX0QYezzBdoSBJWSGg6tHUURAVABpZ7y
         EvKYl9Uet6bLOyzISJKeqilP6GpoMxTDY0ewoBRRD37DGGigSdLwkx5Xc6LkdZTeMgOv
         pBdYAzTz9Hc8P6e2xkhqRf9OL2fJADzEyeGY/hFtkz9UlK35wyj92aVhJ0AvXAVPPVVG
         QiMw==
X-Gm-Message-State: ACgBeo0ueacSrbCUSG62K+CT7rQwww0XATUk22BpyTZWBPIwEKaXYLLt
	egvLZZa/RuBEw/3fpzaKRZJGnh0r62QwZ9CBG7nUVuEX8KfXAUBm6qbR6EYnwU7XhUthl5vLWKV
	bTOI5qrVpm8P1Lel0Sn8HQrTIRFxT
X-Received: by 2002:a17:907:2c78:b0:741:4b9b:8d40 with SMTP id ib24-20020a1709072c7800b007414b9b8d40mr18232036ejc.553.1662072378518;
        Thu, 01 Sep 2022 15:46:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7BPR8Reg8rAqyX9sNVbrSev7DRGLWHt44hmiQrv62/iZjx9Eji9KfHXDyeB55d0ZJ2hKuMtQ==
X-Received: by 2002:a17:907:2c78:b0:741:4b9b:8d40 with SMTP id ib24-20020a1709072c7800b007414b9b8d40mr18232027ejc.553.1662072378308;
        Thu, 01 Sep 2022 15:46:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id z11-20020aa7d40b000000b00445b5874249sm231232edq.62.2022.09.01.15.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 15:46:17 -0700 (PDT)
Message-ID: <c218bef6-bbc1-931e-64cc-5328c0966365@redhat.com>
Date: Fri, 2 Sep 2022 00:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.0, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy2oDoytypnjNFodEY7q_E0OVmrh=GkihQE_K5MnPcK_Sg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy2oDoytypnjNFodEY7q_E0OVmrh=GkihQE_K5MnPcK_Sg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_154624_781780_ACA115C2 
X-CRM114-Status: UNSURE (   5.30  )
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

On 8/20/22 10:01, Anup Patel wrote:
>    https://github.com/kvm-riscv/linux.git  tags/kvm-riscv-fixes-6.0-1

Pulled, thanks; sorry for the delay.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
