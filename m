Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF91C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 13:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbWkH7FO5acE7kqh8NqK3H9pePX7sbPn9ak0IC0B8/A=; b=i4/SNXIKzdn6mO
	CG+D9etluvCpm6fiTSKwi0SPvQvLQE4kH4100WTyex6fMDStMuHxMjh+Zci//mlPETaIOoCemrZ+j
	TPmOhLI+eNRdsgbMx+//OaZA13CYQ+r7bWuOSmRP69bMDeXtZ+49508MGUWahnZpkDJtAI3lszR29
	lpL6HtojL64/4144ODDBzCuzQXK1Y8/V7QmbeAw5BjnqWx2ZNPgJmfMZv3GypLfkKcO+3tWMvnePl
	O+0XwFKZ3d38P5ZzmfVNHenv7S1ZDPJaag39/EsfA4FzTbZKwX2/EjCb6cUdkdeWL/K26DzkjY1+l
	ZNq3quNG3ENWgiHEpS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzITM-002Fq5-Pb; Thu, 09 Jun 2022 13:45:16 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzITJ-002FmP-TE; Thu, 09 Jun 2022 13:45:15 +0000
Received: by mail-ed1-x52d.google.com with SMTP id b8so14594965edj.11;
        Thu, 09 Jun 2022 06:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ed6/oIZCLllEojis+iQsosuh/kXkv+SP578fE3DPXKc=;
        b=oimkxnZsl+L678UoQNfGSY5vTDcO4GHYZr4f1zTfDw7pVZ5liF8VzGqIaI9GCBvZTO
         3CTuWlLirXeBgEdpymjMjv1bQ7UchExgUVS9iIweAKNTDeliTvryCXvARLPZzEiqDxro
         Od5R72VRP/73S4QlrvpRFqZ0vTXE3uMI1UNsC7cWHcc87PFZKvDCDThfX1e5QnaLlEjK
         fa5fb6ApVwyMFS69ceOd8h8LnOII4uOzudBpCjV1Js0H3ZgqZGtkPibOJZU8H2SdEqg2
         5BC7nfMXOZubAn7ORlzGQflYVA81d9UVBb8CAKDS67YZnuxx5IAVl9K1T0gde6S8vtZz
         6I5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ed6/oIZCLllEojis+iQsosuh/kXkv+SP578fE3DPXKc=;
        b=ToO0WRZyHJZL2dK5/SBfwLq29Z2bo0ufYv09k8onkZDhntmm2TOzl6ZLDy/Xux9wPT
         Kk6FOZDEJtA4lo0UfXKb2YziqUWhV1stOCKqwa3xf8fZ0K/OS04Fm9lZfrRAc0Mn0TIl
         m5KWe5VMsv5t4rSa8cGNCysifQCf8l/fflHjSXdzrgeIu+EROvQ/XV/7F+yC5kFRjZTH
         cwDu2KNBiTXrWHCYzB686tPkVSvnSR4UF01wqkSoLcx2XrNixFaNPKj+gdauo7Hph7Lg
         /Ors0JuZLtbS2Ka11URRWYOL7htbCdDYIw4QSeWtRiEsiMxT+SNOFtC5TbyYoAq93EAK
         ekVw==
X-Gm-Message-State: AOAM532e6kTmi0l31Fnl800mXKDfak4q+GoMjkXqBklRspinww2OH/5k
	N8+vJZ+vt8/Y8qetr/VWqsTCNm36ACM=
X-Google-Smtp-Source: ABdhPJx9ekJg5XWvJL71onmwGgY7rgp9FgDEi17noWoYgoWaYImu1aqMVr7t8uZjEolISiOGV+ntDQ==
X-Received: by 2002:a05:6402:518d:b0:431:5487:9606 with SMTP id q13-20020a056402518d00b0043154879606mr25879763edd.177.1654782309488;
        Thu, 09 Jun 2022 06:45:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id t26-20020a17090605da00b006fe7d269db8sm10618584ejt.104.2022.06.09.06.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 06:45:08 -0700 (PDT)
Message-ID: <480dec7c-ccc1-c226-928d-eb16c2a09eaa@redhat.com>
Date: Thu, 9 Jun 2022 15:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.19, take #1
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy3BY551VEP5D-_vj7nzhb9O_k69v99jMdjQ+OxWZpxzpA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy3BY551VEP5D-_vj7nzhb9O_k69v99jMdjQ+OxWZpxzpA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_064514_016653_3B9E0AB1 
X-CRM114-Status: UNSURE (   5.23  )
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

On 6/9/22 07:20, Anup Patel wrote:
> 1) Typo fix in arch/riscv/kvm/vmid.c
> 2) Remove broken reference pattern from MAINTAINERS entry

Pulled, thanks.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
