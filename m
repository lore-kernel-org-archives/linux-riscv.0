Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E03C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJC+tvviOJsSzBC56kXeN9mFxZ5/M2gunFcA1UBs9v8=; b=Hu+jA8vqeHy2av
	CIc3CvsGibnI0Kifuv0wq7q0tT6kR7zMzZS/xY0c6oLXIqCp1sk4bBdxrFy8WOdku1OdHqcRJsU7o
	ARzB0RwzKVPTCvV0qXd3uDnm3KF1OoV6UDxeRm+qvQB80BtP7PdhrULQtYcaoBjVQrWM9OQZUOp9G
	n95BjzQuyWl6qDy6sCvxb9LDkruJ/E2FhwjNDJE6dolukK0hyjILZCdN7W6ndZgtH//itq02qdEJE
	63U9G8wVKnTNs8Uqrqh2/csvH4ymXQ/4M4ecunGxaXK0EJY8d6TvYkH9RKqNh78EZince1MoSCnnm
	gvxxuZQWM8qoQgh0KazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YZ3-005VId-23; Fri, 09 Dec 2022 08:17:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YYx-005VGG-Go
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 08:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670573814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlVkey4HSjl2vV6t9Lx9uOWqOaugTBfPTR5asZdKNaU=;
	b=Zs+99kE27ODNtMazKjowP3Uiramnsob1/POUB6SNwIRqvYBEZVXYq4vkepRLqiy0vMA9AC
	agEyHfzSsmUE/wWu4ObpCTC0A2kY9zKyoUYpeWv3rr824QMdtkzYxQkg0QhsFpGq5d+Fw0
	2jy819B0JkQcnc0yo9lf37uRdYu6lXw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-hKOHpIIqNSiAqUooIPd0IQ-1; Fri, 09 Dec 2022 03:16:53 -0500
X-MC-Unique: hKOHpIIqNSiAqUooIPd0IQ-1
Received: by mail-ed1-f71.google.com with SMTP id m18-20020a056402511200b0046db14dc1c9so941822edd.10
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 00:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlVkey4HSjl2vV6t9Lx9uOWqOaugTBfPTR5asZdKNaU=;
        b=HUndZ2tblJ+TJmSOxPEiPpzwvFCWbBT6VAgX7nOOs08nr1po/pN/j4mFn4lRAHny+4
         /qhbmSdDKFlryRXBOLNW1a61NqWKp9EXBrUFSmOWvn6ZslgGymc2Hojxd7L7IrUkkkje
         vp3y+jmgaWtmeWAJ3g01tAV6/296h8lGVOdENjeP53S2Gi8U9/ae/mgyR7qWFgrZY3nf
         LgxVYV2ErVeZWSDmaPD7915uNPb4NkxKDBM0fIkMD0YI8kofc9aG4o0+zPp9BbDwv5Qh
         5m0fuU2RMivKZ6CbO5kD8mShYCt7UcakN6Xwl+yrt8CFJDS3ayz0eQVGBOeEnQjp0kcW
         qPGQ==
X-Gm-Message-State: ANoB5plI6huhgh8fB1HIGKDaxmdi9MbnLRVgxYrrHbh4m3y895WEDsXt
	y+7bNkaZWOFwNksL39pRd7ttJOO0as7zYUnv2NxfGCZ8dis+xQYcHaq8TmZY0PkKjWpl6PGCfhd
	0xJCnjHjfhSLmjAXyQSE0w5Qbzc8g
X-Received: by 2002:a17:906:5283:b0:78d:f454:ba16 with SMTP id c3-20020a170906528300b0078df454ba16mr4623108ejm.21.1670573812090;
        Fri, 09 Dec 2022 00:16:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5wWcuD3cuTP1HHb5J1FFJS7MF//CMRuYbka2YADU0Y5oKZopzpSPP25NgDP/gUc0Ss8veizQ==
X-Received: by 2002:a17:906:5283:b0:78d:f454:ba16 with SMTP id c3-20020a170906528300b0078df454ba16mr4623096ejm.21.1670573811890;
        Fri, 09 Dec 2022 00:16:51 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928? ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
        by smtp.googlemail.com with ESMTPSA id o26-20020a170906769a00b007adaca75bd0sm271346ejm.179.2022.12.09.00.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:16:51 -0800 (PST)
Message-ID: <28d6ff21-8335-9cf6-6937-992c93bfdd33@redhat.com>
Date: Fri, 9 Dec 2022 09:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [GIT PULL] KVM/riscv changes for 6.2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_001655_660185_4EA8376B 
X-CRM114-Status: UNSURE (   4.19  )
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

On 12/7/22 11:33, Anup Patel wrote:
>    https://github.com/kvm-riscv/linux.git  tags/kvm-riscv-6.2-1

Pulled, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
