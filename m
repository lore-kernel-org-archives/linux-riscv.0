Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3B0C4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 12:03:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC0B61176
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 12:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC0B61176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTfoZ1KE0uRrJ4myZaZ/DG8EepTo2n8/i6TUS1RrO9Y=; b=CHH1OrGoF6DjD2Fui5dgU5XJeo
	Wo5ZY2uYGZdHs9lAmSufdS+P6kIWyhh1Ui+yt2C9MmiqtHLe2ZmXq4iA6KWSW7U4trz5neTS2Bskp
	CKMnLyW1TLN20rzSeWunwpLtDYWjOEZJacACofpIu6RhaukiESx1mPlnH34s4Jmy0rJHoOMOOt+Am
	y4JSBfMUdeZ5F0CxdBO66W8b5UNR+F+ekNWI7CgQBDpAfFp5ZxNHqXu1E9/oD+GDWHyrwlzERR75Y
	IwDOywh1mNjahD4Jx+Bc2RHGNFQooI+E/yevp8n1MJGcOaVgVc5zvw6G/eVmAFDQ+VRXjDZTNij/x
	OA+ao2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmbDI-00FBOP-LK; Fri, 28 May 2021 12:03:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmavV-00F1nX-TA
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 11:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622202312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsgVXsC1fOpfxeYOU7WdhKnq6pYQx4SK1fB5rvjthYg=;
 b=fPSMDl6t8/JwU7uWmYMkWqc4ivKPCipbD5pJqycdzsRsj0cRAVOTpRWq0piRyeT7MCfxOD
 NpnT6zjvnv1BUynhOceI+yaoiD5s3I9e6zL74lw/cCFfpBHc/llkGaauljTapYeSiie2Pj
 4vwZTbeK4cL0CghielYvG7YPIuzaPT4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-cSpJdIlmMLecjXwmAcmUZw-1; Fri, 28 May 2021 07:45:10 -0400
X-MC-Unique: cSpJdIlmMLecjXwmAcmUZw-1
Received: by mail-ed1-f72.google.com with SMTP id
 u6-20020aa7d0c60000b029038d7337e633so2016858edo.4
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 04:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EsgVXsC1fOpfxeYOU7WdhKnq6pYQx4SK1fB5rvjthYg=;
 b=qnflK9WS+H2S/SIU8SJZXiXZXbjkYeOO/tBhr6ZUkLWP+ZOkahPmk1GUolQeCCYTww
 xL9S6P59LeEv2QWwNg6U673Qw8xWZJ2FjwLt/Rk0nNhJ/QRXK2lLRFSym8Y3jL4PvRFZ
 9kgw2ktZdmfQBP6TU+jLnqCMOueHr1qgJfMjSVMigz+K7zRxGOXZj2RpobyWh9gmsbzl
 YEK+GgdePDigYOuTuF7uNpCBuMW2H/84MxvxYOubJQxJ90VwyJUycHBZt+G0+9VUmF/t
 yMRGCBiNYvhD9pZGVx5QYxhh3B434BGD/M2T+gyI9dNIP5UrZghQVBZiuAuCneYsPYD8
 xhKA==
X-Gm-Message-State: AOAM532eaQDRtOZUzFYTfbIY5MkyW+lLTujctecaIDY43mZIkjRdrhwm
 YjMJ/bDSUBzY/FDJj0tk7KDCZL6elT7dU01v6pUEzvTS55+cZvA1fEVSLMYr2KsxgTUHpLG3qkQ
 qLWbdQBn9+jsKxLjbuzQiTFIA6eIf
X-Received: by 2002:a05:6402:128f:: with SMTP id
 w15mr9422485edv.354.1622202309498; 
 Fri, 28 May 2021 04:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8AVCwnol6od6jGiaC3iiVFYIkt8iClKPLGsirYJ3E4QKrmWnqwXMZXO7P1hFN7RmKRy3ySQ==
X-Received: by 2002:a05:6402:128f:: with SMTP id
 w15mr9422466edv.354.1622202309311; 
 Fri, 28 May 2021 04:45:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id p5sm2239217ejm.115.2021.05.28.04.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 04:45:08 -0700 (PDT)
Subject: Re: arch/riscv/staging
To: Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
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
 <efa8b40b-4c64-4323-7070-223329a52872@redhat.com>
 <YLDNEbm+M/geZkHG@kroah.com>
 <CAAhSdy08jBxHb_BG+YSoB3GokSq=sn9YOjcK4nx5aXT4ZkWaHg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <40541ae2-b36a-e149-0e51-3f490c2e94e5@redhat.com>
Date: Fri, 28 May 2021 13:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy08jBxHb_BG+YSoB3GokSq=sn9YOjcK4nx5aXT4ZkWaHg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_044518_505054_37FF49DE 
X-CRM114-Status: UNSURE (   8.39  )
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

On 28/05/21 13:19, Anup Patel wrote:
> There is no "risk" in the kernel/hardware api exposed by the KVM RISC-V
> because the KVM RISC-V UAPI header is based on the latest ratified
> RISC-V privilege v1.11 specification.

Greg is referring the kernel->hardware API, i.e. the instructions, the 
page table formats, etc.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
