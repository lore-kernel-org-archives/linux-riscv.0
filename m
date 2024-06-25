Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008D0C30653
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 23:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSShydA/TxkyXUY9wFx3TD5iV0kiJeeIEDEW0jN7neE=; b=kuf30KrQiXx3pn
	9E+ywfDD/1AEGnvplBY8NymMA4w1R67nCZ/ZJZEPFtpTuCdcTNLYdf6fFi5weN7L9KMGpEpNi6GQ9
	EKQ6GDtljmVFIBtpX9kHMILEAGNO1EbwMClRUXMaVs+yCTh3HY4tpv04Ni6ilod22T6ZNtPYigehK
	ZfoINnbyxvzCrF8M6S0xQjGo9rNC7PVucCgObTXYOfiIIBvMxSgHFUqeVkI+92Aj3ZM9p3L5BoHER
	dFR7/1C8X5LMtj9H9kIIWy8Onh9lz17Ompsw42NGzkKPDFYUs3bLyu1aJuY0WtWORBrdjtRy13yEu
	xlabPXNltkV7eiIvfNLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMFg3-00000004nbz-2V60;
	Tue, 25 Jun 2024 23:34:19 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMFg0-00000004nak-3GHZ
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 23:34:18 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-36dd6cbad62so3325645ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 16:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719358455; x=1719963255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLoxHe91BqYGbErrOqOVZAihyCRQ1/q/QL1BRJCrC+o=;
        b=GxqL7LtBbo3R3s5ZLD2F7setYb1KF4qFCTTit/Tuqx3/mo+7mxlbLJaJihd5upBaig
         Rzx+WwEX3VoJGL5pV+APtOrEsel1i7PqzMHwIIfMyCvQj2vR/U4YQBtQqtYYAxxea+ns
         nNe7mds9fTzJ2W9lreduE3lBpzLmDTEUKFfq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719358455; x=1719963255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLoxHe91BqYGbErrOqOVZAihyCRQ1/q/QL1BRJCrC+o=;
        b=AMMKZ3ZEm+RNfFLBVFU62sTUbo9b5xHUi+WTgckq3E8kZ1byltPgyLpSaL9UI9eqQi
         RpMVetcLy7F2+wSX5f4NZdjhC0OVjaEWos2lpA3eqnwSJ2wERyk6RbtOZTNbhE+XiUid
         XUZ3ZP9bUK//i0sKHEFKGfRSYjZZLltUc6mx1c3/Lp4aRFhArFYtakGbCYPnvQ/7EKfe
         eiJ5ouI9R0j5dx8iyoGXZyRKkEtJN9zkiGXvgNFKSMFqBb1opjB2sqHn0TH4O35adxgo
         Mp2OgjsRi0vOPC8Iok4siYO7bmQ2WS5rmdfsw5OdeqiaH2AuTE1HXUW9gmPZEI2cSeBL
         KM4w==
X-Forwarded-Encrypted: i=1; AJvYcCWF0Wn0ZSReyWeRlkuX7cG5BwXgTxG8d/C57CKPwybcNNODhxar+f85UWb5XaGfAw9FggycgdI2M03KfoRqUz2Js5lJn1bK4+SJ7LvXe7mZ
X-Gm-Message-State: AOJu0Yz4VvTssKR4n2j2g8t/W3v61Iy1PhCwm69PMSLF9jUV8Zx8wleo
	wZgGSDg3Q5vVVWY2hbCgkzpxaI2mhwOvueNcDGNwMMd0OLge2v+YDdnKpFCB43E=
X-Google-Smtp-Source: AGHT+IHFxsdnrHHCJW39/Lbu9cUGENC+vnEtRYVDBjLq63CwNtPtBkCUmNgYxOl/tyW+mRbcBoYz8w==
X-Received: by 2002:a05:6602:3148:b0:7f3:9ef8:30a4 with SMTP id ca18e2360f4ac-7f39ef8334dmr991110139f.1.1719358455001;
        Tue, 25 Jun 2024 16:34:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb458ba8efsm645345173.8.2024.06.25.16.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 16:34:14 -0700 (PDT)
Message-ID: <f975fe76-92f4-4af0-a91d-0f3d8938f6b2@linuxfoundation.org>
Date: Tue, 25 Jun 2024 17:34:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/13] Centralize _GNU_SOURCE definition into lib.mk
To: Andrew Morton <akpm@linux-foundation.org>, Edward Liaw <edliaw@google.com>
Cc: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 usama.anjum@collabora.com, seanjc@google.com, kernel-team@android.com,
 linux-mm@kvack.org, iommu@lists.linux.dev, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sgx@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240624232718.1154427-1-edliaw@google.com>
 <20240625135234.d52ef77c0d84cb19d37dc44f@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240625135234.d52ef77c0d84cb19d37dc44f@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_163417_094295_EEC7E5D7 
X-CRM114-Status: GOOD (  11.50  )
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

On 6/25/24 14:52, Andrew Morton wrote:
> On Mon, 24 Jun 2024 23:26:09 +0000 Edward Liaw <edliaw@google.com> wrote:
> 
>> Centralizes the definition of _GNU_SOURCE into lib.mk and addresses all
>> resulting macro redefinition warnings.
>>
>> These patches will need to be merged in one shot to avoid redefinition
>> warnings.
> 
> Yes, please do this as a single patch and resend?

Since the change is limited to makefiles and one source file
we can manage it with one patch.

Please send single patch and I will apply to next and we can resolve
conflicts if any before the merge window rolls around.

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
