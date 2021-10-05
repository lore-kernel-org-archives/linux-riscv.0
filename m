Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B45C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 08:26:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9184961371
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 08:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9184961371
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oakh8nsLu+ngZ0f2kDB5J/rf7NW03LqO9goVInlxkAk=; b=j1vG9cjlN3ifgR
	mamrNBcDOzZ1kNLLO/dllYVG75JMieMRLxq9j1qw6fOHs4KpNcm7Ue58C4KSaHGo+WUmHirt0Bhap
	XLq/yMskKjy5QlKf6K2m94/eS9G0Q8tsHp0OcSFKxs9Qo83iErfE/QsDPpKdiaXyBFsQ4Rcf64R4s
	OVsiU8DYshytnhkVFTpGgY/CeXboQw9saQSLnoxnEip2NW9nVDq+uhVmC0NAgVdzN5j+GWnHfCuPr
	NMV0N88jl0YKORQ+ftu0LrFqkzYyRqRDNgg5YCwFig1mx7PCc2G9WiyI8YuqxZJBf3Khmrv31aqdK
	Xgc53USocoSF4UiBXPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXfll-009X8y-4G; Tue, 05 Oct 2021 08:25:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXfli-009X81-Fk
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 08:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633422345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klLTM38m8AVOZiQC2QI4nrkV4JPwL7t0pdo1OBretqQ=;
 b=hqi3C3AP3rcJYHcVDVfZ9cgRdykOLVMF2ESo5yeDt1PJtLvwXZMh7U/1X/QG1li9ZtXH1l
 sy1ON9V4aoiClOfjRQFZiyoeTArl4CCilr06I4U3t6Sy8CemL13xhT8rcQ7CYARy3/bhMW
 REnjsGqNu9z7NQKdqiQKtoHTCx+3+TY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-94y18Q40Nm6Y5Dfqqc0ahw-1; Tue, 05 Oct 2021 04:25:44 -0400
X-MC-Unique: 94y18Q40Nm6Y5Dfqqc0ahw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w8-20020a50c448000000b003dae8d38037so6827415edf.8
 for <linux-riscv@lists.infradead.org>; Tue, 05 Oct 2021 01:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=klLTM38m8AVOZiQC2QI4nrkV4JPwL7t0pdo1OBretqQ=;
 b=5M6ZwKRXqbGlYJ03tTFBA+gfMxqXb62Z4Nc05HY5wZqSnByIcJjAi0Evi2p3LdqENJ
 39pDtOYoto6U+dM2ciVjwsiqK90iEWfSRz9XjtDriA3fCh1GtGkbXcqu4HWnO4YmrWSM
 eHgzHjgaMZd4rYhCJe0qUAhMjyMF/CvGEq2JxZ93GuAMLZ2CIbM4AS2S4FPsVB5i40xc
 Ak5mpB3J5HQbT2oye+/bNvrp5oaMbPIu1XBUqF3/VQVh0zBs29e6iR2lWD3jS5XshNqR
 W5fefU+EZRciRvHrYuLnZbHJdZeWomWycHXpWo/0eTXqYNCTKdI/P6JoSdbIJLIaxpLV
 qbLw==
X-Gm-Message-State: AOAM533qkHekjwaVRbLvGYjhwdEN40rb+x3QgP33v/jPsAgG1agB6Met
 ahzXyGm1diiZ0Tvzq+sbrR42jMuZn1TxQ0NU9VuOfI5yVGOkqX8jU8NeAItnL75LVDMnIdDP4YR
 Ovq60tEahh+eLuvOx203QKq6xdcYr
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr24610036edt.237.1633422343375; 
 Tue, 05 Oct 2021 01:25:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt1VKhq/RBXzX5ipjFdmZ4SJ96APOZh3Kl36oSEowMgWp+YD2AB6TtkzyVRAn0of8NmaYlxw==
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr24610005edt.237.1633422343111; 
 Tue, 05 Oct 2021 01:25:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id kw10sm7412696ejc.71.2021.10.05.01.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 01:25:42 -0700 (PDT)
Message-ID: <82568eff-1eff-5e63-4264-ef0c25f79fc3@redhat.com>
Date: Tue, 5 Oct 2021 10:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [GIT PULL] KVM/riscv for 5.16
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, KVM General
 <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy37xNOs3udMe4GuLJ3=huKD1bsHEO_RfUPvuMiVw56GCQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy37xNOs3udMe4GuLJ3=huKD1bsHEO_RfUPvuMiVw56GCQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_012546_636469_59578081 
X-CRM114-Status: UNSURE (   4.04  )
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

On 05/10/21 09:55, Anup Patel wrote:
>    git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-1

Pulled, thanks!

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
