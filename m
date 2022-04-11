Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0505AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 17:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJxMhl1TCT2K5FUdbMqm9/3rXKVIMgplA5u+uWBIsqI=; b=i497bXhGjM0Afm
	oKzx43TOtoUmdXCl/1mjb28FB24opBybhGqtEIUrZYl4zIw/hdYMG8i2ArmF2YpLoheKDM6htyZfT
	SRapqZUX+Rhy6L+1kQFyJkDjgbmkAfl1KNGSmHRTfCQh4NIPH3Ad4iQ1bXXK7ARR5CgVfyaoC2Vqr
	O3K0v2Pc5kBcQdY8jWW7SCmN7d6K6Ev0Eh1FnF4t+muH5ZE65Rrgi816upxmi5Ter0z7/BEuJHy0Z
	9q+zkQ0oBKUf/ncnqRDpGtMaOnV6TWqo1e2Ml+yOkavBDJepWZl+4SB54bqnUTM5tMkbX7r03fPWg
	m+BsPace7Aew+w71Kr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndxs6-009u8T-Uc; Mon, 11 Apr 2022 17:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndxrJ-009tcA-I7
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 17:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649698187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+eb72OximgDdsK1I3iUsdEwiwb2gnGfSCXqFzmEXJg=;
 b=NcgdOyP1E5m7o7kK0lflpAGQxJ+z98avkh0lLr7hEF99fmyTHvnoyfPvabc672FnIWEg8v
 vsyJnhl5x2tKEdFY1RGFwUPobSgHPh3RRH+W3z6AaW7pZsyd0I2Z10/Ap8QNXVY6Q//J8d
 8amf1r9GF6UvkAaLV/EMX0pasL1I9O8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-csgC1VL2M3eHh-fWcmlXlw-1; Mon, 11 Apr 2022 13:29:43 -0400
X-MC-Unique: csgC1VL2M3eHh-fWcmlXlw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so8975198wmj.0
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 10:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J+eb72OximgDdsK1I3iUsdEwiwb2gnGfSCXqFzmEXJg=;
 b=zv7gF3XngWNCNWFSSqp5VcFgmARN3V3Yr/qPmj3cxza1VC1Sc7qqA24e/7D6uYBRkJ
 pKvT/7lNac7qKVdugezRTTVmJiat62J3bzG2z5GfYqk4EmHlC2M/Ebeyc5d4BagmSyyJ
 7qEv3C1tnpzyvqh5ZBHiliqehPi0C+LmiFYi4VZkXDiIBy5IjJDwGnYePP2WtBMplhDj
 lHgVCfxwLqoetfj+tEzV7YT0VUTO6XpEM9dvvd1meq/lNVen9boJ16rh9KNJl5WZ2uGL
 IjpZUQB/Qo7vcJC7hmaWRV+zRVZuQHd6pqNHcT488eFMuY8ehsCO3gXc4fY83ZmRF+cr
 ndJQ==
X-Gm-Message-State: AOAM531pOnFrmZt/10aRjW626SU6hjC0PhmCKKKJb9LuTYdP55j3AS+3
 ncSLaXDDy8tbX4ojmMiwbTHPUZJ1+FGHzH+DA/Pc2webhiiBJjV089AqiXH/GaDL8B8S6YAgots
 GNfcKr1Z0VnbeAs1HzW74FmC8yQPq
X-Received: by 2002:a5d:5447:0:b0:206:102b:9e77 with SMTP id
 w7-20020a5d5447000000b00206102b9e77mr25456403wrv.240.1649698182583; 
 Mon, 11 Apr 2022 10:29:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuhJtdFdqO8feZdVRGloeDpJqsLDQRdwz2FLAUrP4Boh1i2NAKsQfE7++7KAJiAPZmimuQqg==
X-Received: by 2002:a5d:5447:0:b0:206:102b:9e77 with SMTP id
 w7-20020a5d5447000000b00206102b9e77mr25456382wrv.240.1649698182305; 
 Mon, 11 Apr 2022 10:29:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 w5-20020a7bc105000000b0038eb9932dacsm86677wmi.48.2022.04.11.10.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 10:29:41 -0700 (PDT)
Message-ID: <b410d5fb-8d69-1d46-44f1-d0fcf0236934@redhat.com>
Date: Mon, 11 Apr 2022 19:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.18, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>
References: <CAAhSdy3RJpcYNS9NN=hNw=14O9e6=hqoF10fi1vT=No2cT0jWQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy3RJpcYNS9NN=hNw=14O9e6=hqoF10fi1vT=No2cT0jWQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_102949_730082_330BCF96 
X-CRM114-Status: UNSURE (   4.34  )
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

On 4/9/22 06:30, Anup Patel wrote:
>    https://github.com/kvm-riscv/linux.git  tags/kvm-riscv-fixes-5.18-1

Pulled, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
