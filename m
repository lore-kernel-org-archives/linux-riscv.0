Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3128C47087
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC8A61278
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC8A61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcrsuUpXNJwDLUr2cCEpUs3WXjrHBQ/Q8Bd5xGwgJrc=; b=4OxEwYmYhjUaCLGb6BuzwXIRyC
	wf87DwE9MdEl7FbmRq5GFBXbm/ItFhq7GCtZj0JzHcWytpw+MSOGKmR6AiBZZ/shLIaIlY8N8tco2
	rRcfkR0fnf3yEtTs8ms/cr/nx6GbFGmbPDDEamwRvPoyZHnjJ2cuizaR5bI3kBB6n4xhh99bQeSV7
	Ok/eQ3xtMq+xt/Zq3tk/TXl/uxeq5zbil5/aTYACWFqNaYNKbqfhJTmg1zkVDFt191Nz9QVTk9+g3
	OO6yhnJ4w97mv95lSsdrkI2WZvixa8lzcazVYrFhOOy9XIIXu0rm8z2DcdPzqtC9p35Wn1jkZahG8
	LMnN6Ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXrz-00DS6J-C7; Fri, 28 May 2021 08:29:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXru-00DS2g-9m
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 08:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622190561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmrOm6UiZ2g4DQDmrWDfe4rsqjiWdNT/yGyUC63w1IA=;
 b=YyxfmnMrpk2I3TwU6sutYEOAc8x6+YAh2pvIng2edXJJOTQXhkYYMcVNfO8PiynubDFcr3
 6LiKrKBEdCz6PetU6uXPKocTgmnO/0cuR0xyRB/RjtF3YzbFikCYHGTU6Qpo93RLXIQlHJ
 EZ/NYRM1/XvxwnReQ6spcS/ligULjiU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-A3XdJjtSPfCvX5q_emOB0g-1; Fri, 28 May 2021 04:29:19 -0400
X-MC-Unique: A3XdJjtSPfCvX5q_emOB0g-1
Received: by mail-ed1-f72.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so1772758edd.2
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 01:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GmrOm6UiZ2g4DQDmrWDfe4rsqjiWdNT/yGyUC63w1IA=;
 b=bdUORltzl4HraBO8XiEq1RDwfBuwOFok9vGcb7FxLVF+HkTk1S1tWGGx0VVa3X8LdI
 rmT2EaPgF9H9MINFZLu4uvpSbwfKy1vEMU1q/Cw/Zpud3VEzm3fZXylF4OGFf9Tf0Zzf
 sNM8LTtrEJ55/4N5zlw5KWla8zenne3ZsEPllYe2FFlW5MEnm4eNUVr3Az13xgK24zQb
 bu7Zder4/owXQogR1hnYtBeGTlw/Al0KW5nMzI/W6dsO4Hb1FEo45+jQ20OEllUoc2dn
 jAuxa4bWuH4Ak/tkpdiE88BXaUFKtfe0aIlB79fOKJQfTL/w62OezaepzLGG12QFIjHL
 VRbA==
X-Gm-Message-State: AOAM530hBcL9P5u4vbjSwE/t9xF765VcdfHG0z1y/6f8SRnXLMXRgu70
 6u/GY8GcP09WJVbhyyD9k7gmhRB4jwt58+n5XDJxIUsQMnqXEWkdsarZg2ph5HClyVEnvLTOw2w
 nDipiaaAys98M8cXY+Afal/7/ATG+
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr8737766edu.124.1622190558218; 
 Fri, 28 May 2021 01:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj4AQT04xSS/5T7AjgbopSeyOiv0X1A5vvuGVzzJ1sLcJmDSLCtWY66PHIPndYMbmBZeb85g==
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr8737757edu.124.1622190558042; 
 Fri, 28 May 2021 01:29:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id by20sm2028207ejc.74.2021.05.28.01.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 01:29:17 -0700 (PDT)
Subject: Re: arch/riscv/staging
To: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
Date: Fri, 28 May 2021 10:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_012922_464765_0CF3C3B1 
X-CRM114-Status: GOOD (  11.78  )
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

On 28/05/21 03:06, Paul Walmsley wrote:
> OK, well, maybe you and Damien can get together and spell out what you all
> are concerned about regarding forks.  Then we can see if there's anything
> that should be done to address it.
> 
> Right now the only fork risk that I can see is related to the architecture
> itself.

The risk is that improvements to KVM RISC-V are developed in forks 
rather than in a single git tree.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
