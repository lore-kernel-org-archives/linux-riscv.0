Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2337DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nu5Oohifz6JkWEm/v+3WPELPBHvJOVWmbm82X19SPo=; b=z1B9+OagGMBV0+
	ANUoZ/fOfNestf23K9Uh3XEmvOzmhzQQEVVW3sHjiWaj7AQ5XczVUz8HlVVXOc17wgyEcDsgpRsa6
	fFx6Y29uwMQ/KemwE8BA8hLaPJMK/1E1H02my+ycuDZeAdRq2cHl7VPaBZ/ph92y3pT+pE9DtiYUI
	d9HJRzVrU5EjYv1sIe4cMJCghzj3LAAcRNj7GfXjXrK0jEcRW6K3AvbfkOv/TYikygi1TnfrG+56/
	ssr/uYDGT7FtNrWBvRG9mXF5y2yLO0En84o6D94/8GwfpnxI1hGW10GdZieGRNInEyalXLg3MSrzq
	7yQB0uEBy7hZDpyWYTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFH7Z-00FsBO-Bg; Wed, 02 Feb 2022 15:00:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH5c-00FrHN-UR
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 14:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643813910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbSx8+zVxuV1hAhVwdVFKdkNhwLaEFdsXyyAUcSyxCY=;
 b=RYLzi2/wAFSs5rwOKZp6h+DqbIOaGUfgTGefbl12E1dVmaXb/CBeiu1Jdr6niW++s00DwK
 p7LnH42Rr6PjMHNxdldSRySH4hPu+jv55qsCiFLhfsLiKG1Dt2pcX1cTgIl7uZWaGvJDGN
 MJwJJ+OkrJl+ESZcwVmI9pxgLrqbZbk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-8LhC4_4zPz-rKQnGcYicbw-1; Wed, 02 Feb 2022 09:58:28 -0500
X-MC-Unique: 8LhC4_4zPz-rKQnGcYicbw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso4031075wma.6
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 06:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kbSx8+zVxuV1hAhVwdVFKdkNhwLaEFdsXyyAUcSyxCY=;
 b=jouHxlopi2y3lYXV1rqH1SxA1eJK/OrXV2hmh3WOc/2X4+6mFuC/U7fi/ET7baUOon
 Kn0cZpYQqoJw0Uc6iOgSq1EAuw9J73yR4yCMv5tMYHiPMa2+n8bwnD8I7aP2Adg8fDMI
 8cLaIkUZwI/BG3RC1jw/UZbwgylOhat3lcn6W97eJfS9GkCdGHsZoEcnpVFSGIE28BPl
 3CXs/QkOHpi85tWQIu0U8HLhBMIZOOTfQ+TT4obmc3xaSl4MQ6a69d9+Vx7eoXiARwRI
 vKmJcOmqprY/R7PaLsr7qxTMz3nXT0NGcuBqrV3f4kWwk5WurC3iWr2cEGoSii3ORd/t
 FSaA==
X-Gm-Message-State: AOAM533IG6fbO9YXcQP1Kd4H5nGhLNSyNqwrbD9JVRHOTuvVWSjzv3vn
 NL9qo6Pl+20I1IjBx3slM0v4+1qRJWPYImkWyojxpjlUuH5KYrSz0890qEfPeNRfNaJDwrgvGtH
 RnFDleR01Zc0/cWl6bW8ncGsORak9
X-Received: by 2002:a05:600c:1f15:: with SMTP id
 bd21mr6396849wmb.145.1643813906588; 
 Wed, 02 Feb 2022 06:58:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8cZy8w/TMcQ5Vhk87Qx5L3Fx0MaMgEgqgmwamGzXUabY78Xey6QEmEwRTCrIrSx8/F2ftiQ==
X-Received: by 2002:a05:600c:1f15:: with SMTP id
 bd21mr6396834wmb.145.1643813906361; 
 Wed, 02 Feb 2022 06:58:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k12sm17536791wrd.98.2022.02.02.06.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:58:25 -0800 (PST)
Message-ID: <9b2dcb18-4f40-2f4f-421f-366d578c93dc@redhat.com>
Date: Wed, 2 Feb 2022 15:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.17, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy0C_RMVShk=vv7FRgmVRspBkVQfiCLx-4B6pYtLU10vZA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy0C_RMVShk=vv7FRgmVRspBkVQfiCLx-4B6pYtLU10vZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065833_080741_6D5624F3 
X-CRM114-Status: UNSURE (   5.55  )
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

On 2/2/22 15:55, Anup Patel wrote:
>    https://github.com/kvm-riscv/linux.git  tags/kvm-riscv-fixes-5.17-1

Pulled, thanks!

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
