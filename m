Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274EC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcX5hbblXPe+LhMZPrf25g3Wqn5M8WLXnrCXYMveyUE=; b=W7slCrrnmKt7n0
	2Uc6Bk7m20nM2TCN9kl/TMFHBJxE0gC9Z28prCvxz/BZgAeSSYWdv4SY30QUtGsOdljQAuQBgEN0W
	s+pmpSLarIOapANCSX/guFDkh2Bn+9+KKWuCAf64AevVft9gJ7bGExqE1Kwco0raTS7j4+qRa2g59
	YN0f+IE5+lbIMPQtqnzad8e3Xtva6IqRPl69VUu71xVGMT6brFe5oaQv0sv3zuNwx+jeSEBcOAf7V
	be31YL1BVi8zNRWG0qOMgu0TNHmdIDfLCZqAS/D7GwH17k3ptLTTQ7/G1/nBilbeUIy30BluEG0lc
	wcKgHj09uWDvxnKdh5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00Lu-00000008udg-0A5k;
	Thu, 25 Apr 2024 14:45:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00Lr-00000008uaX-0I2w
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 14:45:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ecf1d22d78so66947b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714056328; x=1714661128; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Upe9hXc85SfykUK8OSJyDQtUplWhtMiTd1jA3tMRXuo=;
        b=H2JDS/xB64SAVR6pP7J+ip2vfh2ZWlgYTDiUX7w7/KOJbB5b2un5UIC0PD/GIBS6SM
         1EUGr8sxSEGB9+IrdbvrBgvyTBGzlV5m667f+V/Wv0/X2op9/3FqHxtHf84wa60Z9fy6
         3A74Txj4m42SwqHhLiot3x+A1Bvpy4dknzkYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714056328; x=1714661128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Upe9hXc85SfykUK8OSJyDQtUplWhtMiTd1jA3tMRXuo=;
        b=tL+SE+AztJJ7JQggHpTJaetBgXu+pEsTwL6BhPM72zgYWSQMXRKzDv/9sRqBgawf+F
         tS2i/5WlPJi+yG+8SjclBwXy6jWDR9w3KUSzzUGcAGkYymx6TdRRr/6vTG4y8B2s0/3j
         p3aaWstaGczu6Jg7rWcL5saNW1eWGpctYqX3ROJqUbi6F0v6nUHlhID9rOfhTmPH1JZR
         sz1kICaUWdLOTZvNUQKYpe7JYS/BylAZPnM1YYIc7S0jvdQjuD31N5mWyIyPTAJyT5Ip
         qfqwlhefGSeUMPI0yz0SxwlNxcM6Di38mdxHQdtKnbZc5DKmdOxbO4U5qRQ+SU2vJX0B
         C32w==
X-Forwarded-Encrypted: i=1; AJvYcCW+zCUtaPhWERYAb7ajwwuXGEuTpkiXh4uLv/v1NcqKHYrhEa5SmAkZsw+v2bSLgNGk2Sbwnz/0OrvdOyilhOWogFRZTsXrkS+QNFdufK9x
X-Gm-Message-State: AOJu0YwGnyp2phxio9LVmAcYWkk7bfzfJATmJmUlEuF/YItyv1ky7UmB
	BNqblsDvEdV1zxowr7nZVnongEK6gqOkgcd1PrkTwZSzWJtCcVdClv+BWYczygc=
X-Google-Smtp-Source: AGHT+IH2ZWIxVnWGlxZ14mWcvRqLtKyE6u0gRzo1WyBlfFhqv5treC26C0VPwnpQrTOD05hYIY1E7A==
X-Received: by 2002:a05:6a00:731:b0:6ea:ba47:a63b with SMTP id 17-20020a056a00073100b006eaba47a63bmr6568081pfm.0.1714056327589;
        Thu, 25 Apr 2024 07:45:27 -0700 (PDT)
Received: from [192.168.43.82] ([223.185.79.208])
        by smtp.gmail.com with ESMTPSA id k124-20020a633d82000000b005f7d61ec8afsm11351461pga.91.2024.04.25.07.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 07:45:27 -0700 (PDT)
Message-ID: <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
Date: Thu, 25 Apr 2024 08:45:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Benjamin Copeland <ben.copeland@linaro.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_074531_155740_43A0B743 
X-CRM114-Status: GOOD (  11.60  )
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

On 4/25/24 08:12, Dan Carpenter wrote:
> On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
>> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
>> support for guest private memory can be added without needing an entirely
>> separate set of helpers.
>>
>> Note, this obviously makes selftests backwards-incompatible with older KVM
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> versions from this point forward.
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Is there a way we could disable the tests on older kernels instead of
> making them fail?  Check uname or something?  There is probably a
> standard way to do this...  It's these tests which fail.

They shouldn't fail - the tests should be skipped on older kernels.
If it is absolutely necessary to dd uname to check kernel version,
refer to zram/zram_lib.sh for an example.

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
