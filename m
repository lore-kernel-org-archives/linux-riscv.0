Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2522FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtEIlFMa30/hozvZzeWKpHq1hs5Q4EJdYGJTGhztbFg=; b=nQBMcpGUd0fp18
	dJcGgwqUcgYgvpuLXGAjo4Ok6chRXbAccNYbT7NR3tfnt/KM/2HVWGGP81ZxUAt/C0GjSfufT2xJq
	sHjh9/uggwLQmKz+qHmbooxfZbpIUJFZFdpFvDr5y/VkKz7zZQbYKeMIbZp3010ANjN7yE5Rz6gvx
	AspRYslHc43jWCYn+esw1WqkM67rZyb4qlLbfccSSFt4Pya/FsgwRgVJgybFT4xHW80LeY8ilVxsv
	fwYq0rhE03+wdcnmJDJayYs9L/NkazObrSUGRlD3T9iw0PoR7jkr59cRH+H2f+kH9CPrlTX4g/RTQ
	iRXRdg7R87M6PJfYiDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEvab-00CmwB-Ic; Tue, 01 Feb 2022 16:01:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEvaW-00CmtO-Ow
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 16:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643731259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
 b=BSmVh5+dDwgsRNDEWCtOEeHo6eIhcqUU3ULmfGd8XAN74cuc+y3vN2/HpiTRBSXh0LfdnT
 3m+PsddiJbZSBbtSZwvywlw4JxaxPtOLz27lCRvaDZpOmkItJwbYmukX4jE7C9Az3ucCFE
 PS/NEEEog/G7jImOLxKt3qmDsHefOk0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-IQ6XmMT0Pyqd-WdLhsgceQ-1; Tue, 01 Feb 2022 11:00:58 -0500
X-MC-Unique: IQ6XmMT0Pyqd-WdLhsgceQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w3-20020a50c443000000b0040696821132so8887326edf.22
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 08:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
 b=E6/5j9JLUZjbmcyIAHK5tyZGaKyVVKu+m65hExQb4NOedhovcFtjGzuU2bt3PMfxzL
 6ebPNAdFQfvGwrLtktGkv5O/6MJpa+hPZzoH2VoXJedCrrFi+HUb24rNDoNGd4XAvMef
 X4nwg7DU7TruG7e7DcOmhBqVatFZgVaZxT2Jk6gc4v6VoOBCbZAuZ/OjryMY4SJG1nPD
 veQvRE5JlpBqSKa2ZeLyojWI+n0HFUA4vBEl3t+UYsn15eQF0GOa7P+TQLPjH+N6zq9g
 e7O60f02MqPVcUZDJ3jHejkqsHpq9euuu5GH7cCegsO1K0f8TGqejuqWk/RyH2flVht3
 m3Mg==
X-Gm-Message-State: AOAM530X3snOPB1wHsg1yIrRBANfkzNgJiD4TWyincuwFZo1wmrbi3fs
 8zjTlJ6X706/G2Gob8rngHfHV1FdEu9lyW3sQ4qVux24HlzYn3+mjFmdoH54AP9WR6Ox9u67KxM
 den1SLe93iHzd/sNI6G4JoDB6D2NY
X-Received: by 2002:a17:907:72d6:: with SMTP id
 du22mr21767252ejc.179.1643731257087; 
 Tue, 01 Feb 2022 08:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi6gqf6sTZV2adqJ/EwU8K0kh4yabr0HjJDqz0uGv4IXAxFUKBb//nn4tH0Br/W6v0yRG1zw==
X-Received: by 2002:a17:907:72d6:: with SMTP id
 du22mr21767209ejc.179.1643731256826; 
 Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 gh33sm14883510ejc.17.2022.02.01.08.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Message-ID: <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
Date: Tue, 1 Feb 2022 17:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang
 <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, kvm-riscv@lists.infradead.org,
 KVM General <kvm@vger.kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_080100_922509_B112465F 
X-CRM114-Status: GOOD (  11.24  )
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

On 2/1/22 16:44, Anup Patel wrote:
> +Paolo
> 
> On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> Current riscv doesn't support the 32bit KVM API. Let's make it
>> clear by not selecting KVM_COMPAT.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Anup Patel <anup@brainfault.org>
> 
> This looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>

Hi Anup,

feel free to send this via a pull request (perhaps together with Mark 
Rutland's entry/exit rework).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
