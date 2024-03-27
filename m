Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D79C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rflnwXtJZ/VSuqMTaRyNeoygkso3RJrL/xgE/axrwgo=; b=X8JUcS/tGrro9H
	LSqiftmT64N0hg9FZRSZ4s+IplIxjFTtRdtmlhHWeb/H8oIb5Zl+h7Q7L9Jm2JU7EbS6Ry3T1Z7G5
	IBmkvbijzQcKIU4nQTzOgatA08cIj+vHb0GWvKk3YDtEHh744NMyFIp3b4fNI52ai00DvvHCfdCyp
	dfU5Y2qNox63eHdX45eBgGiPUvubv7BDoRQasqoszK6vhDFp/9U9FEZ7ehxV3dTmPjFg+Bwwjm2CT
	guPHnof7pR9Ewa/zmlc0dKl5Mp4gpAOInefHrcYcSfEpobAZVzTu7yMcpdVGuTRUQ6NbeONnWJhvI
	6IifeAtraf54iNUVWwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVGy-00000009ppW-26sa;
	Wed, 27 Mar 2024 15:33:04 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVGt-00000009plm-3bYA
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:33:02 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3684faf6286so28802145ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711553577; x=1712158377; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PF7BpT7xgpetmn2SxPDafvgaaG8xfRfOiIeigueJv44=;
        b=VQslloQ159lMHv3Ux5VNEcCEk6rt5xQ4bTrGX9jmJcChNa5Ay0huxTFKvb9mPElUVd
         YqqxrrOFtIbV4ValE+9dVd4kzn4OIF2RLmF6ZaQ2WIHD4xjj6LDlg2AghlA/MHspXITz
         HZd7f+2rA3anmqv4KgF8Z2MNUnk9RYvZ0le7sb1VEciYU9/jaK+MGHgxgoA168xHe49M
         TLwk1lE2x97n6nY7+xxujEkkgaxprcW2tGGmD3/Yk5LPlINnjpDZ9HkDfk9kGkmoDskH
         gq9NoafClT5TjxuzHuVh202oz5jbTGNHrW0OkMbDe3jpokzsudPZG1UjNnrtWnxJkuos
         E/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553577; x=1712158377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PF7BpT7xgpetmn2SxPDafvgaaG8xfRfOiIeigueJv44=;
        b=mGcEN10kdDSN3s7YGpO/AIySWikxictfJ9f8fMYalDXLXu0umDe4eDZTfR7mayvlqf
         bJgT3GmqPE3riRGIQjeENf++3gJw4c4MhsoCpg5KqF9y7mKZUm4lzT4VUPaTgUJR4Kws
         mPGU1Uh3aoQ1+ABM+AhYfTuyWA4dlzxLlTnTaAuM7FBBX1Wf26Ob1p3lg9989bKD2p9t
         6btcfbJaXlrRIh/97iTuekwjioam8I+GonJjw/51cf/+Vw1I6IHAVfyY9cv2sumLBfJ4
         VutMXz1ETOJHwl5Lun8MT2eRhRtKwbTvkm7NXPZKxOCTxrwLhAx1Vc/IMWaAiJl7/Dns
         M/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOiuNX0BpEDd+Gg/0cyl1aP7CGBK77r84i0LOFQ/8xgqT7/jmlfA2FiVfnwaTh8QyfII534g6SbWxK0DnSvsPRrZFVHNoEbxx0lwwqV857
X-Gm-Message-State: AOJu0Yx2A7ld8XZoEte46qpfUzElqzCE+fBQbqNOFa8i2o8aKlH51CBu
	MAsBCUoDBlml3hdKQiYklo+E4ZrgF+tUEMF2MOlFRzpz3HvATTvQIwBfc000dRYHfiJla3yHGZJ
	E
X-Google-Smtp-Source: AGHT+IGdMChH50XwuKfroi9Ldx4vewY2tL5TXEOV1NEDYN3TGmpIkbk/uE2En+YsZ29z9C1dTS/OdQ==
X-Received: by 2002:a92:c68e:0:b0:368:980a:d879 with SMTP id o14-20020a92c68e000000b00368980ad879mr354346ilg.17.1711553577622;
        Wed, 27 Mar 2024 08:32:57 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id r10-20020a922a0a000000b003687950b384sm3021534ile.18.2024.03.27.08.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:32:57 -0700 (PDT)
Message-ID: <c63150d8-a479-4d75-a826-3f87b1a792b9@sifive.com>
Date: Wed, 27 Mar 2024 10:32:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] riscv: Various text patching improvements
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jason Baron <jbaron@akamai.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, bpf@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <ZctnfZWWO3HCiXe5@andrea>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZctnfZWWO3HCiXe5@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_083300_521332_2F60B54D 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Andrea,

On 2024-02-13 6:58 AM, Andrea Parri wrote:
> On Sun, Feb 11, 2024 at 06:55:11PM -0800, Samuel Holland wrote:
>> Here are a few changes to minimize calls to stop_machine() and
>> flush_icache_*() in the various text patching functions, as well as
>> to simplify the code.
>>
>>
>> Samuel Holland (7):
>>   riscv: jump_label: Batch icache maintenance
>>   riscv: jump_label: Simplify assembly syntax
>>   riscv: kprobes: Use patch_text_nosync() for insn slots
>>   riscv: Simplify text patching loops
>>   riscv: Pass patch_text() the length in bytes
>>   riscv: Use offset_in_page() in text patching functions
>>   riscv: Remove extra variable in patch_text_nosync()
> 
> This does look like a nice clean-up.  Just curious (a "teach me"-like question),
> how did you test these changes? kselftests, micro-benchmarks, other?

For all my patches, I do boot testing on various physical boards (Unmatched, D1,
some internal hardware), plus some standard internal workloads. For
performance-related patches, I run microbenchmarks or whole-system benchmarks
(e.g. UnixBench). For this series specifically, I didn't do any extra
benchmarking, as all of the functional changes should be as fast or faster by
virtue of simply doing less work.

> BTW, I recall a parallel work from Alex and Bjorn [1] that might have some minor
> conflict with these changes; + both of them to Cc: for further sync.

As suggested by Alex, v2 of this series will be based on the latest version of
that patch.

Regards,
Samuel

> 
>   Andrea
> 
> [1] https://lore.kernel.org/lkml/20240206204607.527195-1-alexghiti@rivosinc.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
